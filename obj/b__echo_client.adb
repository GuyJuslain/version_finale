pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__echo_client.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__echo_client.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E085 : Short_Integer; pragma Import (Ada, E085, "system__os_lib_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "ada__exceptions_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__soft_links_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exception_table_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__containers_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "ada__io_exceptions_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "ada__numerics_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__strings_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__strings__maps_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "ada__strings__maps__constants_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "interfaces__c_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__exceptions_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__object_reader_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "system__dwarf_lines_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__soft_links__initialize_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "system__traceback__symbolic_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "system__img_int_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__img_uns_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__strings__utf_encoding_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "ada__tags_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "ada__strings__text_buffers_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "gnat_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "interfaces__c__strings_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "ada__streams_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__file_control_block_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__finalization_root_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__finalization_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__file_io_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "system__storage_pools_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__finalization_masters_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__storage_pools__subpools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "ada__strings__unbounded_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__calendar_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar__delays_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__text_io_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "system__pool_global_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "gnat__sockets_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "gnat__sockets__poll_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "gnat__sockets__thin_common_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "gnat__sockets__thin_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "client_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "gnat__sockets__finalize_body");
      begin
         E159 := E159 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__sockets__finalize_spec");
      begin
         F2;
      end;
      E186 := E186 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__pool_global__finalize_spec");
      begin
         F3;
      end;
      E151 := E151 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      E130 := E130 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__strings__unbounded__finalize_spec");
      begin
         F5;
      end;
      E190 := E190 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__storage_pools__subpools__finalize_spec");
      begin
         F6;
      end;
      E182 := E182 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__finalization_masters__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__file_io__finalize_body");
      begin
         E155 := E155 - 1;
         F8;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E029 := E029 + 1;
      Ada.Containers'Elab_Spec;
      E052 := E052 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E080 := E080 + 1;
      Ada.Numerics'Elab_Spec;
      E036 := E036 + 1;
      Ada.Strings'Elab_Spec;
      E067 := E067 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E069 := E069 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E072 := E072 + 1;
      Interfaces.C'Elab_Spec;
      E057 := E057 + 1;
      System.Exceptions'Elab_Spec;
      E030 := E030 + 1;
      System.Object_Reader'Elab_Spec;
      E094 := E094 + 1;
      System.Dwarf_Lines'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E085 := E085 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E025 := E025 + 1;
      E017 := E017 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E051 := E051 + 1;
      System.Img_Int'Elab_Spec;
      E035 := E035 + 1;
      E012 := E012 + 1;
      System.Img_Uns'Elab_Spec;
      E075 := E075 + 1;
      E062 := E062 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E114 := E114 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E120 := E120 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E112 := E112 + 1;
      Gnat'Elab_Spec;
      E157 := E157 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E172 := E172 + 1;
      Ada.Streams'Elab_Spec;
      E110 := E110 + 1;
      System.File_Control_Block'Elab_Spec;
      E156 := E156 + 1;
      System.Finalization_Root'Elab_Spec;
      E140 := E140 + 1;
      Ada.Finalization'Elab_Spec;
      E138 := E138 + 1;
      System.File_Io'Elab_Body;
      E155 := E155 + 1;
      System.Storage_Pools'Elab_Spec;
      E184 := E184 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E182 := E182 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E190 := E190 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E130 := E130 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E010 := E010 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E008 := E008 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E151 := E151 + 1;
      System.Pool_Global'Elab_Spec;
      System.Pool_Global'Elab_Body;
      E186 := E186 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E170 := E170 + 1;
      E164 := E164 + 1;
      Gnat.Sockets'Elab_Body;
      E159 := E159 + 1;
      E162 := E162 + 1;
      E005 := E005 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_echo_client");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/henley/Desktop/Capstones/version_finale/obj/client.o
   --   /home/henley/Desktop/Capstones/version_finale/obj/echo_client.o
   --   -L/home/henley/Desktop/Capstones/version_finale/obj/
   --   -L/home/henley/Desktop/Capstones/version_finale/obj/
   --   -L/home/henley/adacore/nvidia/wave/x86_64-linux/gnat/install/lib/gcc/x86_64-pc-linux-gnu/12.2.1/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
