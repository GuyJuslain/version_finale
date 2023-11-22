
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.IO_Exceptions;         use Ada.IO_Exceptions;
with GNAT.Sockets;              use GNAT.Sockets;
with Ada.Streams;               use Ada.Streams;
WITH Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;

procedure echo_serveur is

------------------------DECLARATION DE L'ENSEMBLE DES VARIABLES GLOBALES, TYPES ET SOUS-TYPES ----------------------------------------------------------------

-- Les sous-types

   Tasks_To_Create            : constant := 2; -- simultaneous socket connections.
   Nb_Max_Message             : constant := 100;
   subtype Index is Integer range 1..Nb_Max_Message;
   type File_Message is array (1..Nb_Max_Message) of Unbounded_String;  -- La file de message
   subtype Counter is integer range 0 .. Tasks_To_Create;
   subtype Index is integer range 0 .. Nb_Max_Message;

-- Les variables globales


-------------------------------------------DEFINITION DE L'OBJET PROTEGE Info-------------------------------------------------------------------------------------------------
   -- On implémente notre Objet protégé sous forme d'une file circulaire.

    protected type Info is       

        entry Push_Message(message : in Unbounded_String);                 -- Ecrire un message dans la file
        entry Pop_Message(message_retire : out Unbounded_String);          -- Lire le message dans la file et effacer l'entrée

        private -- Les attrituts de l'information
            List_Message        : File_Message;    -- La liste des message
            Tete    : Natural := 0;                 -- La tete de la file
            Queue   : Natural := Nb_Max_Message;    -- La queue de la file
            Nb_Message_In_File    : Natural := 0;   -- Nombre de message dans la file
    end Info;

    protected body Info is 

        accept Push_Message(message : in Unbounded_String) when Nb_Message_In_File < Nb_Max_Message  -- On ajoute un message en fin de file
        begin
            List_Message(Tete) := message;
            Tete := (Tete + 1) mod Nb_Message_in_File;
            Nb_Message_In_File := Nb_Message_in_File + 1;
        end Push_Message;

        accept Pop_Message(message_retire : out Unbounded_String) when Nb_Message_In_File > 0 is  -- On ne peux enlever le message que s'il y a u moins 1 element dans la file
        begin
            message_retire := List_Message(Queue);
            Queue := (Queue + 1) mod Nb_Max_Message;
            Nb_Message_In_File := Nb_Message_In_File - 1;
        end;
    end Info;

    Info_A                  : Info;             -- Information pour gerer les messages du client A
    Info_B                  : Info;             -- Information pour gerer les messages du client B
-------------------------------  FIN DE LA DEFINITION DE l'OBJET PROTEGE   -----------------------------------------------------------------------------------

--On delcare les file de message de A et de B une fois le type protégé defini

------------------------------   DEFINITION DU TYPE DE TACHE Manage_Client   --------------------------------------------------------------------------------------------


-- Configurez le récepteur de socket, initialisez la pile de tâches, 
-- puis bouclez en bloquant sur Accept_Socket, en utilisant Pop_Stack 
-- pour la prochaine tâche libre de la pile, en attendant si nécessaire.


-------------------------------------------------------------------------------

-- SocketServer : Socket du Serveur; Connexion_1, Connexion : le nouveau socket retourné apres accept_Socket qui sert à relier le serveur au client;   Channel le flux de lecture

task tast Manage_Client(SocketServer : Socket_Type, Connexion : Socket_Type, Channel: Stream_Access)

task body tast Manage_Client(SocketServer : Socket_Type, Connexion : Socket_Type, Channel: Stream_Access) is
    Message             : Unbounded_String;
    Offset              : Ada.Streams.Stream_Element_Count;      --off
    Data                : Ada.Streams.Stream_Element_Array (1 .. 1);
    char_lu             : Character;

    begin
        Channel := Stream (Connexion);              -- Flux de connexion avec client
            select
                accept Info_B.Pop_Message(Message);     -- On tente d'enlever le message dans la file de message de B pour l'envoyer à A
                String'Write (Channel, To_String(Message));     -- On écrit dans le channel de A le message qu'on a pris dans la file B 
       
            or            -- On lit les message en provenance de A qu'on met dans la file de message de A;
                declare
                    receive_message : Unbounded_String;
                end declare;
                 loop     
                    Read(Channel.All, Data, Offset);
                    char_lu := Character'Val(Data(1));
                    exit when char_lu = ASCII.LF;    -- On lit caractere par caractere jusqu'à ce qu'on ait un caractère fin de ligne (LF)
                    Append(receive_message, char_lu);   
                end loop;
                accept Info_A.Push_Message(receive_message);
            end select;
    end Manage_Client;
    -- Declaration des elements du serveur
    -------------------------------- Programme principal
        SocketServer            : Socket_Type;      -- Socket su serveur
        Address                 : Sock_Addr_Type; 
        Address_A               : Sock_Addr_Type;   -- Address de A
        Address_B               : Sock_Addr_Type;   -- Address de B
        ConnexionClient_A       : Socket_Type;      -- Socket de client A
        ConnexionClient_B       : Socket_Type;      -- Socket du client B
        Channel_A               : Stream_Access; 
        Channel_B               : Stream_Access;


    begin
     --   Create_Socket(Socket => SocketServer);          -- On cree le socket du serveur qui va ecouter les deux clients
     --   Set_Socket_Option(Socket => Receiver, Level  => Socket_Level, Option => (Name => Reuse_Address, Enabled => True));  -- On lui attributs les options necessaires.
     --   Bind_Socket(Socket => Receiver, Address => (Family => Family_Inet, Addr => Inet_Addr ("127.0.0.1"), Port => 12321));    --On le lie
     --   Liste_Socket(Socket => SocketServer);
--
     --   accept_Socket(Socket => SocketServer, Socket => ConnexionClient_A, Address_A);
     --   Put_Line("Client connected from " & GNAT.Sockets.Image (Client));
     --   Manage_Client(SocketServer, ConnexionClient_A, Channel_A);
--
     --   accept_Socket(Socket => SocketServer, Socket => ConnexionClient_B, Address_B);
     --   Put_Line("Client connected from " & GNAT.Sockets.Image (Client));
     --   Manage_Client(SocketServer, ConnexionClient_B, Channel_B);
    --
        null;
    end echo_serveur;

--
--      https://rosettacode.org/wiki/Echo_server#Ada
--
    