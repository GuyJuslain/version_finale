pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Pro 24.0w (20221102-122)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_echo_serveur" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#874a0d78#;
   pragma Export (C, u00001, "echo_serveurB");
   u00002 : constant Version_32 := 16#7320ff5f#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#50630821#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#6231c28b#;
   pragma Export (C, u00004, "serveurB");
   u00005 : constant Version_32 := 16#5c23179a#;
   pragma Export (C, u00005, "serveurS");
   u00006 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#e9d77c55#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#1e7524b5#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#6dc27684#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#426dafb8#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#3ff0395b#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#d4c699bf#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#6a2f1a0f#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#821dff88#;
   pragma Export (C, u00016, "system__parametersB");
   u00017 : constant Version_32 := 16#96f90b1e#;
   pragma Export (C, u00017, "system__parametersS");
   u00018 : constant Version_32 := 16#2a95d23d#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#e939c75c#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00020, "system__soft_links__initializeB");
   u00021 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00021, "system__soft_links__initializeS");
   u00022 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00022, "system__stack_checkingB");
   u00023 : constant Version_32 := 16#e2b806a2#;
   pragma Export (C, u00023, "system__stack_checkingS");
   u00024 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00024, "system__exception_tableB");
   u00025 : constant Version_32 := 16#cf46d9a1#;
   pragma Export (C, u00025, "system__exception_tableS");
   u00026 : constant Version_32 := 16#70c8108a#;
   pragma Export (C, u00026, "system__exceptionsS");
   u00027 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00027, "system__exceptions__machineB");
   u00028 : constant Version_32 := 16#8bdfdbe3#;
   pragma Export (C, u00028, "system__exceptions__machineS");
   u00029 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00029, "system__exceptions_debugB");
   u00030 : constant Version_32 := 16#7263f7eb#;
   pragma Export (C, u00030, "system__exceptions_debugS");
   u00031 : constant Version_32 := 16#32ee70d0#;
   pragma Export (C, u00031, "system__img_intS");
   u00032 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00032, "ada__numericsS");
   u00033 : constant Version_32 := 16#174f5472#;
   pragma Export (C, u00033, "ada__numerics__big_numbersS");
   u00034 : constant Version_32 := 16#b847d0e1#;
   pragma Export (C, u00034, "system__unsigned_typesS");
   u00035 : constant Version_32 := 16#5e8f37b6#;
   pragma Export (C, u00035, "system__val_intS");
   u00036 : constant Version_32 := 16#48912782#;
   pragma Export (C, u00036, "system__val_unsS");
   u00037 : constant Version_32 := 16#96e09402#;
   pragma Export (C, u00037, "system__val_utilB");
   u00038 : constant Version_32 := 16#71a87b35#;
   pragma Export (C, u00038, "system__val_utilS");
   u00039 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00039, "system__case_utilB");
   u00040 : constant Version_32 := 16#8d7e78ed#;
   pragma Export (C, u00040, "system__case_utilS");
   u00041 : constant Version_32 := 16#8d029d03#;
   pragma Export (C, u00041, "system__wid_unsS");
   u00042 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00042, "system__tracebackB");
   u00043 : constant Version_32 := 16#c4f75b05#;
   pragma Export (C, u00043, "system__tracebackS");
   u00044 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00044, "system__traceback_entriesB");
   u00045 : constant Version_32 := 16#8a711034#;
   pragma Export (C, u00045, "system__traceback_entriesS");
   u00046 : constant Version_32 := 16#b5f8ae26#;
   pragma Export (C, u00046, "system__traceback__symbolicB");
   u00047 : constant Version_32 := 16#d9e66ad1#;
   pragma Export (C, u00047, "system__traceback__symbolicS");
   u00048 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00048, "ada__containersS");
   u00049 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00049, "ada__exceptions__tracebackB");
   u00050 : constant Version_32 := 16#eb07882c#;
   pragma Export (C, u00050, "ada__exceptions__tracebackS");
   u00051 : constant Version_32 := 16#15f799c2#;
   pragma Export (C, u00051, "interfacesS");
   u00052 : constant Version_32 := 16#01c0e42b#;
   pragma Export (C, u00052, "interfaces__cB");
   u00053 : constant Version_32 := 16#9d395173#;
   pragma Export (C, u00053, "interfaces__cS");
   u00054 : constant Version_32 := 16#6ef2c461#;
   pragma Export (C, u00054, "system__bounded_stringsB");
   u00055 : constant Version_32 := 16#35908ea1#;
   pragma Export (C, u00055, "system__bounded_stringsS");
   u00056 : constant Version_32 := 16#1cff99e6#;
   pragma Export (C, u00056, "system__crtlS");
   u00057 : constant Version_32 := 16#9f199b4a#;
   pragma Export (C, u00057, "system__dwarf_linesB");
   u00058 : constant Version_32 := 16#a5cb9aae#;
   pragma Export (C, u00058, "system__dwarf_linesS");
   u00059 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00059, "ada__charactersS");
   u00060 : constant Version_32 := 16#f70a517e#;
   pragma Export (C, u00060, "ada__characters__handlingB");
   u00061 : constant Version_32 := 16#ea6baced#;
   pragma Export (C, u00061, "ada__characters__handlingS");
   u00062 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00062, "ada__characters__latin_1S");
   u00063 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00063, "ada__stringsS");
   u00064 : constant Version_32 := 16#16f45e54#;
   pragma Export (C, u00064, "ada__strings__mapsB");
   u00065 : constant Version_32 := 16#9df1863a#;
   pragma Export (C, u00065, "ada__strings__mapsS");
   u00066 : constant Version_32 := 16#96b40646#;
   pragma Export (C, u00066, "system__bit_opsB");
   u00067 : constant Version_32 := 16#8f9e0384#;
   pragma Export (C, u00067, "system__bit_opsS");
   u00068 : constant Version_32 := 16#4642cba6#;
   pragma Export (C, u00068, "ada__strings__maps__constantsS");
   u00069 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00069, "system__address_imageB");
   u00070 : constant Version_32 := 16#e3813282#;
   pragma Export (C, u00070, "system__address_imageS");
   u00071 : constant Version_32 := 16#cdf7317a#;
   pragma Export (C, u00071, "system__img_unsS");
   u00072 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00072, "system__ioB");
   u00073 : constant Version_32 := 16#dc2f58f7#;
   pragma Export (C, u00073, "system__ioS");
   u00074 : constant Version_32 := 16#754b4bb8#;
   pragma Export (C, u00074, "system__mmapB");
   u00075 : constant Version_32 := 16#7a46ab42#;
   pragma Export (C, u00075, "system__mmapS");
   u00076 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00076, "ada__io_exceptionsS");
   u00077 : constant Version_32 := 16#dd82c35a#;
   pragma Export (C, u00077, "system__mmap__os_interfaceB");
   u00078 : constant Version_32 := 16#37fd3b64#;
   pragma Export (C, u00078, "system__mmap__os_interfaceS");
   u00079 : constant Version_32 := 16#3e3920c1#;
   pragma Export (C, u00079, "system__mmap__unixS");
   u00080 : constant Version_32 := 16#1d7382c4#;
   pragma Export (C, u00080, "system__os_libB");
   u00081 : constant Version_32 := 16#b8017fe7#;
   pragma Export (C, u00081, "system__os_libS");
   u00082 : constant Version_32 := 16#6e5d049a#;
   pragma Export (C, u00082, "system__atomic_operations__test_and_setB");
   u00083 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00083, "system__atomic_operations__test_and_setS");
   u00084 : constant Version_32 := 16#850ed59d#;
   pragma Export (C, u00084, "system__atomic_operationsS");
   u00085 : constant Version_32 := 16#29cc6115#;
   pragma Export (C, u00085, "system__atomic_primitivesB");
   u00086 : constant Version_32 := 16#0524e799#;
   pragma Export (C, u00086, "system__atomic_primitivesS");
   u00087 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00087, "system__stringsB");
   u00088 : constant Version_32 := 16#d9efafa0#;
   pragma Export (C, u00088, "system__stringsS");
   u00089 : constant Version_32 := 16#2fdbc40e#;
   pragma Export (C, u00089, "system__object_readerB");
   u00090 : constant Version_32 := 16#55f4bbb3#;
   pragma Export (C, u00090, "system__object_readerS");
   u00091 : constant Version_32 := 16#d7e08022#;
   pragma Export (C, u00091, "system__val_lliS");
   u00092 : constant Version_32 := 16#6a5ef568#;
   pragma Export (C, u00092, "system__val_lluS");
   u00093 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00093, "system__exception_tracesB");
   u00094 : constant Version_32 := 16#aef5c6de#;
   pragma Export (C, u00094, "system__exception_tracesS");
   u00095 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00095, "system__wch_conB");
   u00096 : constant Version_32 := 16#9b6e8cdb#;
   pragma Export (C, u00096, "system__wch_conS");
   u00097 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00097, "system__wch_stwB");
   u00098 : constant Version_32 := 16#b67fa0da#;
   pragma Export (C, u00098, "system__wch_stwS");
   u00099 : constant Version_32 := 16#f8305de6#;
   pragma Export (C, u00099, "system__wch_cnvB");
   u00100 : constant Version_32 := 16#9dae46ab#;
   pragma Export (C, u00100, "system__wch_cnvS");
   u00101 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00101, "system__wch_jisB");
   u00102 : constant Version_32 := 16#28192481#;
   pragma Export (C, u00102, "system__wch_jisS");
   u00103 : constant Version_32 := 16#4de76a9a#;
   pragma Export (C, u00103, "ada__real_timeB");
   u00104 : constant Version_32 := 16#a00d3370#;
   pragma Export (C, u00104, "ada__real_timeS");
   u00105 : constant Version_32 := 16#b0865518#;
   pragma Export (C, u00105, "system__taskingB");
   u00106 : constant Version_32 := 16#1ca18b56#;
   pragma Export (C, u00106, "system__taskingS");
   u00107 : constant Version_32 := 16#e850091f#;
   pragma Export (C, u00107, "system__task_primitivesS");
   u00108 : constant Version_32 := 16#848a1fe0#;
   pragma Export (C, u00108, "system__os_interfaceB");
   u00109 : constant Version_32 := 16#1952b102#;
   pragma Export (C, u00109, "system__os_interfaceS");
   u00110 : constant Version_32 := 16#fe266d85#;
   pragma Export (C, u00110, "system__linuxS");
   u00111 : constant Version_32 := 16#c7b9aba1#;
   pragma Export (C, u00111, "system__os_constantsS");
   u00112 : constant Version_32 := 16#021ce70a#;
   pragma Export (C, u00112, "system__task_primitives__operationsB");
   u00113 : constant Version_32 := 16#1e811718#;
   pragma Export (C, u00113, "system__task_primitives__operationsS");
   u00114 : constant Version_32 := 16#9ebeb40e#;
   pragma Export (C, u00114, "system__interrupt_managementB");
   u00115 : constant Version_32 := 16#50dc425b#;
   pragma Export (C, u00115, "system__interrupt_managementS");
   u00116 : constant Version_32 := 16#fe2ee843#;
   pragma Export (C, u00116, "system__multiprocessorsB");
   u00117 : constant Version_32 := 16#7ac130cb#;
   pragma Export (C, u00117, "system__multiprocessorsS");
   u00118 : constant Version_32 := 16#307180be#;
   pragma Export (C, u00118, "system__os_primitivesB");
   u00119 : constant Version_32 := 16#4590ca4e#;
   pragma Export (C, u00119, "system__os_primitivesS");
   u00120 : constant Version_32 := 16#4ee862d1#;
   pragma Export (C, u00120, "system__task_infoB");
   u00121 : constant Version_32 := 16#f415468c#;
   pragma Export (C, u00121, "system__task_infoS");
   u00122 : constant Version_32 := 16#5d6b44f2#;
   pragma Export (C, u00122, "system__tasking__debugB");
   u00123 : constant Version_32 := 16#4bb799fc#;
   pragma Export (C, u00123, "system__tasking__debugS");
   u00124 : constant Version_32 := 16#ca878138#;
   pragma Export (C, u00124, "system__concat_2B");
   u00125 : constant Version_32 := 16#f796dc4f#;
   pragma Export (C, u00125, "system__concat_2S");
   u00126 : constant Version_32 := 16#752a67ed#;
   pragma Export (C, u00126, "system__concat_3B");
   u00127 : constant Version_32 := 16#c817b61a#;
   pragma Export (C, u00127, "system__concat_3S");
   u00128 : constant Version_32 := 16#602bc0ef#;
   pragma Export (C, u00128, "system__img_lliS");
   u00129 : constant Version_32 := 16#ad0ace1a#;
   pragma Export (C, u00129, "system__wid_lluS");
   u00130 : constant Version_32 := 16#e5d09b61#;
   pragma Export (C, u00130, "system__stack_usageB");
   u00131 : constant Version_32 := 16#371a1ff7#;
   pragma Export (C, u00131, "system__stack_usageS");
   u00132 : constant Version_32 := 16#a94883d4#;
   pragma Export (C, u00132, "ada__strings__text_buffersB");
   u00133 : constant Version_32 := 16#4e422b5d#;
   pragma Export (C, u00133, "ada__strings__text_buffersS");
   u00134 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00134, "ada__strings__utf_encodingB");
   u00135 : constant Version_32 := 16#4d0e0994#;
   pragma Export (C, u00135, "ada__strings__utf_encodingS");
   u00136 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00136, "ada__strings__utf_encoding__wide_stringsB");
   u00137 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00137, "ada__strings__utf_encoding__wide_stringsS");
   u00138 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00138, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00139 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00139, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00140 : constant Version_32 := 16#f38d604a#;
   pragma Export (C, u00140, "ada__tagsB");
   u00141 : constant Version_32 := 16#4d1deaec#;
   pragma Export (C, u00141, "ada__tagsS");
   u00142 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00142, "system__htableB");
   u00143 : constant Version_32 := 16#c3b4f753#;
   pragma Export (C, u00143, "system__htableS");
   u00144 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00144, "system__string_hashB");
   u00145 : constant Version_32 := 16#64f1772c#;
   pragma Export (C, u00145, "system__string_hashS");
   u00146 : constant Version_32 := 16#67eb6d5a#;
   pragma Export (C, u00146, "ada__text_ioB");
   u00147 : constant Version_32 := 16#3cf1122b#;
   pragma Export (C, u00147, "ada__text_ioS");
   u00148 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00148, "ada__streamsB");
   u00149 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00149, "ada__streamsS");
   u00150 : constant Version_32 := 16#0d8d0fa7#;
   pragma Export (C, u00150, "system__put_imagesB");
   u00151 : constant Version_32 := 16#ee6e1404#;
   pragma Export (C, u00151, "system__put_imagesS");
   u00152 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00152, "ada__strings__text_buffers__utilsB");
   u00153 : constant Version_32 := 16#608bd105#;
   pragma Export (C, u00153, "ada__strings__text_buffers__utilsS");
   u00154 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00154, "interfaces__c_streamsB");
   u00155 : constant Version_32 := 16#7acc80b4#;
   pragma Export (C, u00155, "interfaces__c_streamsS");
   u00156 : constant Version_32 := 16#1aa716c1#;
   pragma Export (C, u00156, "system__file_ioB");
   u00157 : constant Version_32 := 16#3ecf6aed#;
   pragma Export (C, u00157, "system__file_ioS");
   u00158 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00158, "ada__finalizationS");
   u00159 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00159, "system__finalization_rootB");
   u00160 : constant Version_32 := 16#0d9fdc28#;
   pragma Export (C, u00160, "system__finalization_rootS");
   u00161 : constant Version_32 := 16#e09c58a9#;
   pragma Export (C, u00161, "system__file_control_blockS");
   u00162 : constant Version_32 := 16#b5988c27#;
   pragma Export (C, u00162, "gnatS");
   u00163 : constant Version_32 := 16#7689a348#;
   pragma Export (C, u00163, "gnat__socketsB");
   u00164 : constant Version_32 := 16#fad32b27#;
   pragma Export (C, u00164, "gnat__socketsS");
   u00165 : constant Version_32 := 16#9fc71810#;
   pragma Export (C, u00165, "gnat__sockets__linker_optionsS");
   u00166 : constant Version_32 := 16#ef8e19e8#;
   pragma Export (C, u00166, "gnat__sockets__pollB");
   u00167 : constant Version_32 := 16#5b438f3f#;
   pragma Export (C, u00167, "gnat__sockets__pollS");
   u00168 : constant Version_32 := 16#a440ec49#;
   pragma Export (C, u00168, "ada__calendarB");
   u00169 : constant Version_32 := 16#8324cd02#;
   pragma Export (C, u00169, "ada__calendarS");
   u00170 : constant Version_32 := 16#93b8b471#;
   pragma Export (C, u00170, "gnat__sockets__thinB");
   u00171 : constant Version_32 := 16#0d90d779#;
   pragma Export (C, u00171, "gnat__sockets__thinS");
   u00172 : constant Version_32 := 16#87ec1338#;
   pragma Export (C, u00172, "ada__calendar__delaysB");
   u00173 : constant Version_32 := 16#6a7ce89e#;
   pragma Export (C, u00173, "ada__calendar__delaysS");
   u00174 : constant Version_32 := 16#1a69b526#;
   pragma Export (C, u00174, "gnat__os_libS");
   u00175 : constant Version_32 := 16#485b8267#;
   pragma Export (C, u00175, "gnat__task_lockS");
   u00176 : constant Version_32 := 16#7d808794#;
   pragma Export (C, u00176, "system__task_lockB");
   u00177 : constant Version_32 := 16#23e798d6#;
   pragma Export (C, u00177, "system__task_lockS");
   u00178 : constant Version_32 := 16#94835be8#;
   pragma Export (C, u00178, "gnat__sockets__thin_commonB");
   u00179 : constant Version_32 := 16#39108f2b#;
   pragma Export (C, u00179, "gnat__sockets__thin_commonS");
   u00180 : constant Version_32 := 16#e652c197#;
   pragma Export (C, u00180, "system__return_stackS");
   u00181 : constant Version_32 := 16#40f98252#;
   pragma Export (C, u00181, "interfaces__c__stringsB");
   u00182 : constant Version_32 := 16#a856e1a3#;
   pragma Export (C, u00182, "interfaces__c__stringsS");
   u00183 : constant Version_32 := 16#fa09c8ad#;
   pragma Export (C, u00183, "system__arith_64B");
   u00184 : constant Version_32 := 16#b6ccbb3b#;
   pragma Export (C, u00184, "system__arith_64S");
   u00185 : constant Version_32 := 16#119c6c25#;
   pragma Export (C, u00185, "system__sparkS");
   u00186 : constant Version_32 := 16#812db2df#;
   pragma Export (C, u00186, "system__spark__cut_operationsB");
   u00187 : constant Version_32 := 16#46c019b4#;
   pragma Export (C, u00187, "system__spark__cut_operationsS");
   u00188 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00188, "system__communicationB");
   u00189 : constant Version_32 := 16#dfb0b3e3#;
   pragma Export (C, u00189, "system__communicationS");
   u00190 : constant Version_32 := 16#28888d98#;
   pragma Export (C, u00190, "system__finalization_mastersB");
   u00191 : constant Version_32 := 16#02e4eddb#;
   pragma Export (C, u00191, "system__finalization_mastersS");
   u00192 : constant Version_32 := 16#35d6ef80#;
   pragma Export (C, u00192, "system__storage_poolsB");
   u00193 : constant Version_32 := 16#bf8c6aef#;
   pragma Export (C, u00193, "system__storage_poolsS");
   u00194 : constant Version_32 := 16#7c78c3c5#;
   pragma Export (C, u00194, "system__pool_globalB");
   u00195 : constant Version_32 := 16#91b367a5#;
   pragma Export (C, u00195, "system__pool_globalS");
   u00196 : constant Version_32 := 16#1982dcd0#;
   pragma Export (C, u00196, "system__memoryB");
   u00197 : constant Version_32 := 16#19e99d68#;
   pragma Export (C, u00197, "system__memoryS");
   u00198 : constant Version_32 := 16#b49a0e5d#;
   pragma Export (C, u00198, "system__storage_pools__subpoolsB");
   u00199 : constant Version_32 := 16#a2d8d50c#;
   pragma Export (C, u00199, "system__storage_pools__subpoolsS");
   u00200 : constant Version_32 := 16#b0df1928#;
   pragma Export (C, u00200, "system__storage_pools__subpools__finalizationB");
   u00201 : constant Version_32 := 16#562129f7#;
   pragma Export (C, u00201, "system__storage_pools__subpools__finalizationS");
   u00202 : constant Version_32 := 16#aeff9098#;
   pragma Export (C, u00202, "ada__strings__unboundedB");
   u00203 : constant Version_32 := 16#7daa2b90#;
   pragma Export (C, u00203, "ada__strings__unboundedS");
   u00204 : constant Version_32 := 16#9211d95c#;
   pragma Export (C, u00204, "ada__strings__searchB");
   u00205 : constant Version_32 := 16#501fe7a7#;
   pragma Export (C, u00205, "ada__strings__searchS");
   u00206 : constant Version_32 := 16#190570e0#;
   pragma Export (C, u00206, "system__compare_array_unsigned_8B");
   u00207 : constant Version_32 := 16#d28b31db#;
   pragma Export (C, u00207, "system__compare_array_unsigned_8S");
   u00208 : constant Version_32 := 16#74e358eb#;
   pragma Export (C, u00208, "system__address_operationsB");
   u00209 : constant Version_32 := 16#3c598318#;
   pragma Export (C, u00209, "system__address_operationsS");
   u00210 : constant Version_32 := 16#a8ed4e2b#;
   pragma Export (C, u00210, "system__atomic_countersB");
   u00211 : constant Version_32 := 16#9e75407b#;
   pragma Export (C, u00211, "system__atomic_countersS");
   u00212 : constant Version_32 := 16#d50f3cfb#;
   pragma Export (C, u00212, "system__stream_attributesB");
   u00213 : constant Version_32 := 16#5e0388d4#;
   pragma Export (C, u00213, "system__stream_attributesS");
   u00214 : constant Version_32 := 16#3aecdcda#;
   pragma Export (C, u00214, "system__stream_attributes__xdrB");
   u00215 : constant Version_32 := 16#42985e70#;
   pragma Export (C, u00215, "system__stream_attributes__xdrS");
   u00216 : constant Version_32 := 16#815f70d4#;
   pragma Export (C, u00216, "system__fat_fltS");
   u00217 : constant Version_32 := 16#a76d79d9#;
   pragma Export (C, u00217, "system__fat_lfltS");
   u00218 : constant Version_32 := 16#ddbdd733#;
   pragma Export (C, u00218, "system__fat_llfS");
   u00219 : constant Version_32 := 16#c04c66e4#;
   pragma Export (C, u00219, "system__tasking__protected_objectsB");
   u00220 : constant Version_32 := 16#a211a246#;
   pragma Export (C, u00220, "system__tasking__protected_objectsS");
   u00221 : constant Version_32 := 16#879e7b71#;
   pragma Export (C, u00221, "system__soft_links__taskingB");
   u00222 : constant Version_32 := 16#917fc4d2#;
   pragma Export (C, u00222, "system__soft_links__taskingS");
   u00223 : constant Version_32 := 16#3880736e#;
   pragma Export (C, u00223, "ada__exceptions__is_null_occurrenceB");
   u00224 : constant Version_32 := 16#e2b3c9ca#;
   pragma Export (C, u00224, "ada__exceptions__is_null_occurrenceS");
   u00225 : constant Version_32 := 16#a5b3684a#;
   pragma Export (C, u00225, "system__tasking__protected_objects__entriesB");
   u00226 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00226, "system__tasking__protected_objects__entriesS");
   u00227 : constant Version_32 := 16#49c205ec#;
   pragma Export (C, u00227, "system__restrictionsB");
   u00228 : constant Version_32 := 16#338c6c86#;
   pragma Export (C, u00228, "system__restrictionsS");
   u00229 : constant Version_32 := 16#5f1d6929#;
   pragma Export (C, u00229, "system__tasking__initializationB");
   u00230 : constant Version_32 := 16#4b32ba0f#;
   pragma Export (C, u00230, "system__tasking__initializationS");
   u00231 : constant Version_32 := 16#37fe82cb#;
   pragma Export (C, u00231, "system__tasking__task_attributesB");
   u00232 : constant Version_32 := 16#fb86dea5#;
   pragma Export (C, u00232, "system__tasking__task_attributesS");
   u00233 : constant Version_32 := 16#7771f680#;
   pragma Export (C, u00233, "system__tasking__protected_objects__operationsB");
   u00234 : constant Version_32 := 16#b9523220#;
   pragma Export (C, u00234, "system__tasking__protected_objects__operationsS");
   u00235 : constant Version_32 := 16#236b8b68#;
   pragma Export (C, u00235, "system__tasking__entry_callsB");
   u00236 : constant Version_32 := 16#d453bba7#;
   pragma Export (C, u00236, "system__tasking__entry_callsS");
   u00237 : constant Version_32 := 16#735c190b#;
   pragma Export (C, u00237, "system__tasking__queuingB");
   u00238 : constant Version_32 := 16#f5dd32a7#;
   pragma Export (C, u00238, "system__tasking__queuingS");
   u00239 : constant Version_32 := 16#e2d90d73#;
   pragma Export (C, u00239, "system__tasking__utilitiesB");
   u00240 : constant Version_32 := 16#02b4e0a4#;
   pragma Export (C, u00240, "system__tasking__utilitiesS");
   u00241 : constant Version_32 := 16#aaca3cae#;
   pragma Export (C, u00241, "system__tasking__rendezvousB");
   u00242 : constant Version_32 := 16#e26d829c#;
   pragma Export (C, u00242, "system__tasking__rendezvousS");
   u00243 : constant Version_32 := 16#2f2220aa#;
   pragma Export (C, u00243, "system__tasking__stagesB");
   u00244 : constant Version_32 := 16#fce19d8e#;
   pragma Export (C, u00244, "system__tasking__stagesS");
   u00245 : constant Version_32 := 16#2d236812#;
   pragma Export (C, u00245, "ada__task_initializationB");
   u00246 : constant Version_32 := 16#d7b0c315#;
   pragma Export (C, u00246, "ada__task_initializationS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  ada.task_initialization%s
   --  ada.task_initialization%b
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_operations%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.spark%s
   --  system.spark.cut_operations%s
   --  system.spark.cut_operations%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.return_stack%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.big_numbers%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.wid_uns%s
   --  system.img_int%s
   --  ada.exceptions%b
   --  system.img_uns%s
   --  system.dwarf_lines%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  gnat%s
   --  gnat.os_lib%s
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.arith_64%s
   --  system.arith_64%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.linux%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.communication%s
   --  system.communication%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.storage_pools.subpools%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  gnat.task_lock%s
   --  system.task_primitives%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.sockets%s
   --  gnat.sockets.linker_options%s
   --  gnat.sockets.poll%s
   --  gnat.sockets.thin_common%s
   --  gnat.sockets.thin_common%b
   --  gnat.sockets.thin%s
   --  gnat.sockets.thin%b
   --  gnat.sockets%b
   --  gnat.sockets.poll%b
   --  system.wid_llu%s
   --  system.img_lli%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  serveur%s
   --  serveur%b
   --  echo_serveur%b
   --  END ELABORATION ORDER

end ada_main;
