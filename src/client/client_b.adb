with Ada.Text_IO;           use Ada.Text_IO;
with GNAT.Sockets;          use GNAT.Sockets;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

-- Streams pour les flux
with Ada.Streams; use Ada.Streams;
use type Ada.Streams.Stream_Element_Count;

package body Client_B is

   --  Send   : String := (1 => ASCII.CR, 2 => ASCII.LF, 3 => ASCII.CR, 4 => ASCII.LF);
   --  Offset : Ada.Streams.Stream_Element_Count;
   --  Data   : Ada.Streams.Stream_Element_Array (1 .. 256);

   procedure Run is
      Client  : Socket_Type;
      Address : Sock_Addr_Type;
      Channel : Stream_Access;
      Message : Unbounded_String := To_Unbounded_String ("");
      count   : Integer          := 0;

      Last                : Ada.Streams.Stream_Element_Offset;      --off
      Data                : Ada.Streams.Stream_Element_Array (1 .. 1);
      Char                : Character;
   begin
      GNAT.Sockets.Initialize;
      Create_Socket (Client);

      -- Utilisez l'adresse IP et le port du serveur
      Address.Addr := Inet_Addr ("127.0.0.1");
      Address.Port := 12_321;

      Connect_Socket (Client, Address);
      Channel := Stream (Client);
      loop
         loop 
            Read (Channel.all, Data, Last);
            Char := Character'Val (Data (1));
            if Char = ASCII.NUL then
               New_Line;
               exit;
            end if;
            Put (Char);
         end loop;
      end loop;
      --  String'Write (Channel, ASCII.NUL'Image);
   end Run;
end Client_B;
