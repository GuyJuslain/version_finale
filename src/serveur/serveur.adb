with Ada.Text_IO; use Ada.Text_IO;
with Ada.IO_Exceptions;
with GNAT.Sockets;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Streams; use Ada.Streams;
use type Ada.Streams.Stream_Element_Count;

with Ada.Real_Time; use Ada.Real_Time;

package body Serveur is
   Tasks_To_Create : constant := 2; -- simultaneous socket connections.

   type Integer_List is array (1..Tasks_To_Create) of Integer; --  Pile de tache
   type Messages_T is array (1..Tasks_To_Create) of Unbounded_String; --  Pile de tache
   subtype Counter is Integer range 0 .. Tasks_To_Create;

   subtype Index is Integer range 1 .. Tasks_To_Create;

   function Get_Other_Task_Index (This_Task : Index) return Index is
      (if This_Task = 1 then 2 else 1);

   protected type Info is     -- pile
      procedure Push_Stack (Return_Task_Index : in Index);
      procedure Initialize_Stack;
      entry Pop_Stack (Get_Task_Index : out Index);
   private
      Task_Stack   : Integer_List; -- Stack of free-to-use tasks. // Pile de tâches libres.
      Stack_Pointer: Counter := 0;
   end Info;

   protected body Info is
      procedure Push_Stack (Return_Task_Index : in Index) is
      begin -- Performed by tasks that were popped, so won't overflow.  // Effectué par des tâches qui ont été supprimées, donc ne débordera pas.
         Stack_Pointer := Stack_Pointer + 1;
         Task_Stack(Stack_Pointer) := Return_Task_Index;
      end;

      entry Pop_Stack (Get_Task_Index : out Index) when Stack_Pointer /= 0 is
      begin -- guarded against underflow. // protégé contre le débordement.
         Get_Task_Index := Task_Stack(Stack_Pointer);
         Stack_Pointer := Stack_Pointer -  1;
      end;         

      procedure Initialize_Stack is
      begin
         for I in Task_Stack'range loop
            Push_Stack (I);
         end loop;
      end;
   end Info;

   Task_Info : Info;

   protected type Messages is
      procedure Append (Char : in Character; Task_Index : in Index);
      procedure Depend (Char : out Character; Task_Index : in Index);
   private
      Msgs : Messages_T;
   end Messages;

   protected body Messages is
      procedure Append (Char : in Character; Task_Index : in Index) is
      begin
         Msgs (Task_Index).Append (Char);
      end Append;
      procedure Depend (Char : out Character; Task_Index : in Index) is   
      begin
         if Msgs (Task_Index).Length > 0 then
            Char := Msgs (Task_Index).Element (1);
            Msgs (Task_Index) := Msgs (Task_Index).Delete (1, 1);
         else
            Char := ASCII.LF;
         end if;
      end Depend;
   end Messages;

   Task_Messages : Messages;
     
   task type SocketTask is
      entry Setup (Connection : GNAT.Sockets.Socket_Type;
                   Client     : GNAT.Sockets.Sock_Addr_Type;
                   Task_Index : Index);
      entry Read;
   end SocketTask;

   Worker : array (1..Tasks_To_Create) of SocketTask;
   Channels : array (1..Tasks_To_Create) of GNAT.Sockets.Stream_Access;

   task body SocketTask is
      my_Connection : GNAT.Sockets.Socket_Type;
      my_Client     : GNAT.Sockets.Sock_Addr_Type;
      my_Index      : Index;
   begin
      loop
         accept Setup (Connection : GNAT.Sockets.Socket_Type; 
                       Client  : GNAT.Sockets.Sock_Addr_Type; 
                       Task_Index   : Index) do
            my_Connection := Connection;
            my_Client     := Client;
            my_Index      := Task_Index;
         end;
   
         accept Read; 
         begin
            Ada.Text_IO.Put_Line ("Task " & integer'image(my_Index));
            loop
               Task_Messages.Append (Character'Input (Channels (My_Index)), 
                                     Get_Other_Task_Index (my_Index));
            end loop;
         exception
            when Ada.IO_Exceptions.End_Error =>
              Ada.Text_IO.Put_Line ("Echo " & integer'image(my_Index) & " end");
            when others => 
              Ada.Text_IO.Put_Line ("Echo " & integer'image(my_Index) & " err");
         end;
         GNAT.Sockets.Close_Socket (my_Connection);
         Task_Info.Push_Stack (my_Index);
      end loop;
   end SocketTask;

   task type SocketSend is
      entry Setup (Task_Index : Index);
      entry Send;
   end SocketSend;

   task body SocketSend is
      Char          : Character;
      My_Index      : Index;
      Period        : constant Time_Span := Milliseconds (10);
      Next_Release  : Time := Ada.Real_Time.Clock;
   begin
      loop
         accept Setup (Task_Index : Index) do
            My_Index := Task_Index;
         end;
         accept Send;
         begin
            loop
               Task_Messages.Depend (Char, My_Index);
               if Char /= ASCII.LF then
                  Character'Output (Channels (My_Index), Char);
               end if;
               Next_Release := Next_Release + Period;
               delay until Next_Release;
            end loop;
         end;
      end loop;
   end SocketSend;

   Sender : array (1..Tasks_To_Create) of SocketSend;


   task type SocketServer (my_Port : GNAT.Sockets.Port_Type) is
      entry Listen;
   end SocketServer;

   task body SocketServer is
   Receiver   : GNAT.Sockets.Socket_Type;
   Connection : GNAT.Sockets.Socket_Type;
   Client     : GNAT.Sockets.Sock_Addr_Type;
   Channel    : GNAT.Sockets.Stream_Access;
   
   Use_Task   : Index;

   begin
      accept Listen;
      GNAT.Sockets.Create_Socket (Socket => Receiver);
      GNAT.Sockets.Set_Socket_Option
        (Socket => Receiver,
         Level  => GNAT.Sockets.Socket_Level,
         Option => (Name    => GNAT.Sockets.Reuse_Address, Enabled => True));
      GNAT.Sockets.Bind_Socket
        (Socket  => Receiver,
         Address => (Family => GNAT.Sockets.Family_Inet,
                     Addr   => GNAT.Sockets.Inet_Addr ("127.0.0.1"),
                     Port   => my_Port));
      GNAT.Sockets.Listen_Socket (Socket => Receiver);
      Task_Info.Initialize_Stack;
Find: loop 
         GNAT.Sockets.Accept_Socket (Server  => Receiver, Socket  => Connection, Address => Client);
         Ada.Text_IO.Put_Line ("Connect " & GNAT.Sockets.Image(Client));
        
         Task_Info.Pop_Stack(Use_Task);
         Channels (Use_Task) := GNAT.Sockets.Stream (Connection);

         Worker(Use_Task).Setup(Connection, Client,  Use_Task);
         Worker(Use_Task).Read; 

         Sender(Use_Task).Setup(Use_Task);
         Sender(Use_Task).Send;

      end loop Find;
   end SocketServer;

   Echo_Server : SocketServer(my_Port => 12321);

   procedure Run is
   begin
      Echo_Server.Listen;
   end Run;

end Serveur;