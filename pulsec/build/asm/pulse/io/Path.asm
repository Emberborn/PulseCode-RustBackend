option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_ArrayList_add__String:proc
extrn pulsec_pulse_collections_ArrayList_get__int:proc
extrn pulsec_pulse_collections_ArrayList_isEmpty:proc
extrn pulsec_pulse_collections_ArrayList_remove__int:proc
extrn pulsec_pulse_collections_ArrayList_size:proc
extrn pulsec_pulse_collections_Collection_size:proc
extrn pulsec_pulse_collections_LinkedList_get__int:proc
extrn pulsec_pulse_collections_LinkedList_size:proc
extrn pulsec_pulse_collections_List_get__int:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_endsWith__String:proc
extrn pulsec_pulse_lang_String_equals__Object:proc
extrn pulsec_pulse_lang_String_isEmpty:proc
extrn pulsec_pulse_lang_String_lastIndexOf__String:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_startsWith__String:proc
extrn pulsec_pulse_lang_String_substring__int:proc
extrn pulsec_pulse_lang_String_substring__int_int:proc
extrn pulsec_pulse_lang_String_valueOf__char:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Integer_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Integer_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Integer_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Integer_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MAX_VALUE:proc


extrn pulsec_pulse_collections_ArrayList_ArrayList:proc
.data
written dq 0
pulsec_objc_pulse_io_Path dd 0
trace_m0 db "pulse.io.Path.separator"
trace_m0_len equ 23
pulsec_pulse_io_Path_separator_trace_s0 db "pulse.io.Path.separator(Path.pulse:14)"
pulsec_pulse_io_Path_separator_trace_s0_len equ 38
trace_m2 db "pulse.io.Path.normalize"
trace_m2_len equ 23
pulsec_pulse_io_Path_normalize__String_trace_s0 db "pulse.io.Path.normalize(Path.pulse:22)"
pulsec_pulse_io_Path_normalize__String_trace_s0_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s1 db "pulse.io.Path.normalize(Path.pulse:23)"
pulsec_pulse_io_Path_normalize__String_trace_s1_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s2 db "pulse.io.Path.normalize(Path.pulse:25)"
pulsec_pulse_io_Path_normalize__String_trace_s2_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s3 db "pulse.io.Path.normalize(Path.pulse:26)"
pulsec_pulse_io_Path_normalize__String_trace_s3_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s4 db "pulse.io.Path.normalize(Path.pulse:27)"
pulsec_pulse_io_Path_normalize__String_trace_s4_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s5 db "pulse.io.Path.normalize(Path.pulse:28)"
pulsec_pulse_io_Path_normalize__String_trace_s5_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s6 db "pulse.io.Path.normalize(Path.pulse:29)"
pulsec_pulse_io_Path_normalize__String_trace_s6_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s7 db "pulse.io.Path.normalize(Path.pulse:30)"
pulsec_pulse_io_Path_normalize__String_trace_s7_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s8 db "pulse.io.Path.normalize(Path.pulse:31)"
pulsec_pulse_io_Path_normalize__String_trace_s8_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s9 db "pulse.io.Path.normalize(Path.pulse:32)"
pulsec_pulse_io_Path_normalize__String_trace_s9_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s10 db "pulse.io.Path.normalize(Path.pulse:33)"
pulsec_pulse_io_Path_normalize__String_trace_s10_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s11 db "pulse.io.Path.normalize(Path.pulse:36)"
pulsec_pulse_io_Path_normalize__String_trace_s11_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s12 db "pulse.io.Path.normalize(Path.pulse:37)"
pulsec_pulse_io_Path_normalize__String_trace_s12_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s13 db "pulse.io.Path.normalize(Path.pulse:39)"
pulsec_pulse_io_Path_normalize__String_trace_s13_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s14 db "pulse.io.Path.normalize(Path.pulse:42)"
pulsec_pulse_io_Path_normalize__String_trace_s14_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s15 db "pulse.io.Path.normalize(Path.pulse:43)"
pulsec_pulse_io_Path_normalize__String_trace_s15_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s16 db "pulse.io.Path.normalize(Path.pulse:45)"
pulsec_pulse_io_Path_normalize__String_trace_s16_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s17 db "pulse.io.Path.normalize(Path.pulse:46)"
pulsec_pulse_io_Path_normalize__String_trace_s17_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s18 db "pulse.io.Path.normalize(Path.pulse:49)"
pulsec_pulse_io_Path_normalize__String_trace_s18_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s19 db "pulse.io.Path.normalize(Path.pulse:50)"
pulsec_pulse_io_Path_normalize__String_trace_s19_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s20 db "pulse.io.Path.normalize(Path.pulse:51)"
pulsec_pulse_io_Path_normalize__String_trace_s20_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s21 db "pulse.io.Path.normalize(Path.pulse:52)"
pulsec_pulse_io_Path_normalize__String_trace_s21_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s22 db "pulse.io.Path.normalize(Path.pulse:53)"
pulsec_pulse_io_Path_normalize__String_trace_s22_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s23 db "pulse.io.Path.normalize(Path.pulse:54)"
pulsec_pulse_io_Path_normalize__String_trace_s23_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s24 db "pulse.io.Path.normalize(Path.pulse:55)"
pulsec_pulse_io_Path_normalize__String_trace_s24_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s25 db "pulse.io.Path.normalize(Path.pulse:56)"
pulsec_pulse_io_Path_normalize__String_trace_s25_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s26 db "pulse.io.Path.normalize(Path.pulse:57)"
pulsec_pulse_io_Path_normalize__String_trace_s26_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s27 db "pulse.io.Path.normalize(Path.pulse:58)"
pulsec_pulse_io_Path_normalize__String_trace_s27_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s28 db "pulse.io.Path.normalize(Path.pulse:60)"
pulsec_pulse_io_Path_normalize__String_trace_s28_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s29 db "pulse.io.Path.normalize(Path.pulse:61)"
pulsec_pulse_io_Path_normalize__String_trace_s29_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s30 db "pulse.io.Path.normalize(Path.pulse:62)"
pulsec_pulse_io_Path_normalize__String_trace_s30_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s31 db "pulse.io.Path.normalize(Path.pulse:63)"
pulsec_pulse_io_Path_normalize__String_trace_s31_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s32 db "pulse.io.Path.normalize(Path.pulse:64)"
pulsec_pulse_io_Path_normalize__String_trace_s32_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s33 db "pulse.io.Path.normalize(Path.pulse:66)"
pulsec_pulse_io_Path_normalize__String_trace_s33_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s34 db "pulse.io.Path.normalize(Path.pulse:67)"
pulsec_pulse_io_Path_normalize__String_trace_s34_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s35 db "pulse.io.Path.normalize(Path.pulse:69)"
pulsec_pulse_io_Path_normalize__String_trace_s35_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s36 db "pulse.io.Path.normalize(Path.pulse:70)"
pulsec_pulse_io_Path_normalize__String_trace_s36_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s37 db "pulse.io.Path.normalize(Path.pulse:73)"
pulsec_pulse_io_Path_normalize__String_trace_s37_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s38 db "pulse.io.Path.normalize(Path.pulse:74)"
pulsec_pulse_io_Path_normalize__String_trace_s38_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s39 db "pulse.io.Path.normalize(Path.pulse:75)"
pulsec_pulse_io_Path_normalize__String_trace_s39_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s40 db "pulse.io.Path.normalize(Path.pulse:76)"
pulsec_pulse_io_Path_normalize__String_trace_s40_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s41 db "pulse.io.Path.normalize(Path.pulse:78)"
pulsec_pulse_io_Path_normalize__String_trace_s41_len equ 38
pulsec_pulse_io_Path_normalize__String_trace_s42 db "pulse.io.Path.normalize(Path.pulse:80)"
pulsec_pulse_io_Path_normalize__String_trace_s42_len equ 38
trace_m46 db "pulse.io.Path.combine"
trace_m46_len equ 21
pulsec_pulse_io_Path_combine__String_String_trace_s0 db "pulse.io.Path.combine(Path.pulse:88)"
pulsec_pulse_io_Path_combine__String_String_trace_s0_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s1 db "pulse.io.Path.combine(Path.pulse:89)"
pulsec_pulse_io_Path_combine__String_String_trace_s1_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s2 db "pulse.io.Path.combine(Path.pulse:90)"
pulsec_pulse_io_Path_combine__String_String_trace_s2_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s3 db "pulse.io.Path.combine(Path.pulse:91)"
pulsec_pulse_io_Path_combine__String_String_trace_s3_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s4 db "pulse.io.Path.combine(Path.pulse:93)"
pulsec_pulse_io_Path_combine__String_String_trace_s4_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s5 db "pulse.io.Path.combine(Path.pulse:94)"
pulsec_pulse_io_Path_combine__String_String_trace_s5_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s6 db "pulse.io.Path.combine(Path.pulse:96)"
pulsec_pulse_io_Path_combine__String_String_trace_s6_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s7 db "pulse.io.Path.combine(Path.pulse:97)"
pulsec_pulse_io_Path_combine__String_String_trace_s7_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s8 db "pulse.io.Path.combine(Path.pulse:99)"
pulsec_pulse_io_Path_combine__String_String_trace_s8_len equ 36
pulsec_pulse_io_Path_combine__String_String_trace_s9 db "pulse.io.Path.combine(Path.pulse:100)"
pulsec_pulse_io_Path_combine__String_String_trace_s9_len equ 37
pulsec_pulse_io_Path_combine__String_String_trace_s10 db "pulse.io.Path.combine(Path.pulse:102)"
pulsec_pulse_io_Path_combine__String_String_trace_s10_len equ 37
pulsec_pulse_io_Path_combine__String_String_trace_s11 db "pulse.io.Path.combine(Path.pulse:103)"
pulsec_pulse_io_Path_combine__String_String_trace_s11_len equ 37
pulsec_pulse_io_Path_combine__String_String_trace_s12 db "pulse.io.Path.combine(Path.pulse:105)"
pulsec_pulse_io_Path_combine__String_String_trace_s12_len equ 37
pulsec_pulse_io_Path_combine__String_String_trace_s13 db "pulse.io.Path.combine(Path.pulse:106)"
pulsec_pulse_io_Path_combine__String_String_trace_s13_len equ 37
pulsec_pulse_io_Path_combine__String_String_trace_s14 db "pulse.io.Path.combine(Path.pulse:108)"
pulsec_pulse_io_Path_combine__String_String_trace_s14_len equ 37
trace_m62 db "pulse.io.Path.resolve"
trace_m62_len equ 21
pulsec_pulse_io_Path_resolve__String_String_trace_s0 db "pulse.io.Path.resolve(Path.pulse:116)"
pulsec_pulse_io_Path_resolve__String_String_trace_s0_len equ 37
trace_m64 db "pulse.io.Path.fileName"
trace_m64_len equ 22
pulsec_pulse_io_Path_fileName__String_trace_s0 db "pulse.io.Path.fileName(Path.pulse:124)"
pulsec_pulse_io_Path_fileName__String_trace_s0_len equ 38
pulsec_pulse_io_Path_fileName__String_trace_s1 db "pulse.io.Path.fileName(Path.pulse:125)"
pulsec_pulse_io_Path_fileName__String_trace_s1_len equ 38
pulsec_pulse_io_Path_fileName__String_trace_s2 db "pulse.io.Path.fileName(Path.pulse:126)"
pulsec_pulse_io_Path_fileName__String_trace_s2_len equ 38
pulsec_pulse_io_Path_fileName__String_trace_s3 db "pulse.io.Path.fileName(Path.pulse:127)"
pulsec_pulse_io_Path_fileName__String_trace_s3_len equ 38
pulsec_pulse_io_Path_fileName__String_trace_s4 db "pulse.io.Path.fileName(Path.pulse:129)"
pulsec_pulse_io_Path_fileName__String_trace_s4_len equ 38
trace_m70 db "pulse.io.Path.parent"
trace_m70_len equ 20
pulsec_pulse_io_Path_parent__String_trace_s0 db "pulse.io.Path.parent(Path.pulse:137)"
pulsec_pulse_io_Path_parent__String_trace_s0_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s1 db "pulse.io.Path.parent(Path.pulse:138)"
pulsec_pulse_io_Path_parent__String_trace_s1_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s2 db "pulse.io.Path.parent(Path.pulse:139)"
pulsec_pulse_io_Path_parent__String_trace_s2_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s3 db "pulse.io.Path.parent(Path.pulse:140)"
pulsec_pulse_io_Path_parent__String_trace_s3_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s4 db "pulse.io.Path.parent(Path.pulse:141)"
pulsec_pulse_io_Path_parent__String_trace_s4_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s5 db "pulse.io.Path.parent(Path.pulse:143)"
pulsec_pulse_io_Path_parent__String_trace_s5_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s6 db "pulse.io.Path.parent(Path.pulse:144)"
pulsec_pulse_io_Path_parent__String_trace_s6_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s7 db "pulse.io.Path.parent(Path.pulse:145)"
pulsec_pulse_io_Path_parent__String_trace_s7_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s8 db "pulse.io.Path.parent(Path.pulse:147)"
pulsec_pulse_io_Path_parent__String_trace_s8_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s9 db "pulse.io.Path.parent(Path.pulse:148)"
pulsec_pulse_io_Path_parent__String_trace_s9_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s10 db "pulse.io.Path.parent(Path.pulse:150)"
pulsec_pulse_io_Path_parent__String_trace_s10_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s11 db "pulse.io.Path.parent(Path.pulse:151)"
pulsec_pulse_io_Path_parent__String_trace_s11_len equ 36
pulsec_pulse_io_Path_parent__String_trace_s12 db "pulse.io.Path.parent(Path.pulse:153)"
pulsec_pulse_io_Path_parent__String_trace_s12_len equ 36
trace_m84 db "pulse.io.Path.extension"
trace_m84_len equ 23
pulsec_pulse_io_Path_extension__String_trace_s0 db "pulse.io.Path.extension(Path.pulse:161)"
pulsec_pulse_io_Path_extension__String_trace_s0_len equ 39
pulsec_pulse_io_Path_extension__String_trace_s1 db "pulse.io.Path.extension(Path.pulse:162)"
pulsec_pulse_io_Path_extension__String_trace_s1_len equ 39
pulsec_pulse_io_Path_extension__String_trace_s2 db "pulse.io.Path.extension(Path.pulse:163)"
pulsec_pulse_io_Path_extension__String_trace_s2_len equ 39
pulsec_pulse_io_Path_extension__String_trace_s3 db "pulse.io.Path.extension(Path.pulse:164)"
pulsec_pulse_io_Path_extension__String_trace_s3_len equ 39
pulsec_pulse_io_Path_extension__String_trace_s4 db "pulse.io.Path.extension(Path.pulse:166)"
pulsec_pulse_io_Path_extension__String_trace_s4_len equ 39
trace_m90 db "pulse.io.Path.hasExtension"
trace_m90_len equ 26
pulsec_pulse_io_Path_hasExtension__String_trace_s0 db "pulse.io.Path.hasExtension(Path.pulse:174)"
pulsec_pulse_io_Path_hasExtension__String_trace_s0_len equ 42
trace_m92 db "pulse.io.Path.stem"
trace_m92_len equ 18
pulsec_pulse_io_Path_stem__String_trace_s0 db "pulse.io.Path.stem(Path.pulse:182)"
pulsec_pulse_io_Path_stem__String_trace_s0_len equ 34
pulsec_pulse_io_Path_stem__String_trace_s1 db "pulse.io.Path.stem(Path.pulse:183)"
pulsec_pulse_io_Path_stem__String_trace_s1_len equ 34
pulsec_pulse_io_Path_stem__String_trace_s2 db "pulse.io.Path.stem(Path.pulse:184)"
pulsec_pulse_io_Path_stem__String_trace_s2_len equ 34
pulsec_pulse_io_Path_stem__String_trace_s3 db "pulse.io.Path.stem(Path.pulse:185)"
pulsec_pulse_io_Path_stem__String_trace_s3_len equ 34
pulsec_pulse_io_Path_stem__String_trace_s4 db "pulse.io.Path.stem(Path.pulse:187)"
pulsec_pulse_io_Path_stem__String_trace_s4_len equ 34
trace_m98 db "pulse.io.Path.resolveSibling"
trace_m98_len equ 28
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s0 db "pulse.io.Path.resolveSibling(Path.pulse:195)"
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s0_len equ 44
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1 db "pulse.io.Path.resolveSibling(Path.pulse:196)"
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1_len equ 44
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s2 db "pulse.io.Path.resolveSibling(Path.pulse:197)"
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s2_len equ 44
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s3 db "pulse.io.Path.resolveSibling(Path.pulse:199)"
pulsec_pulse_io_Path_resolveSibling__String_String_trace_s3_len equ 44
trace_m103 db "pulse.io.Path.changeFileName"
trace_m103_len equ 28
pulsec_pulse_io_Path_changeFileName__String_String_trace_s0 db "pulse.io.Path.changeFileName(Path.pulse:207)"
pulsec_pulse_io_Path_changeFileName__String_String_trace_s0_len equ 44
pulsec_pulse_io_Path_changeFileName__String_String_trace_s1 db "pulse.io.Path.changeFileName(Path.pulse:208)"
pulsec_pulse_io_Path_changeFileName__String_String_trace_s1_len equ 44
pulsec_pulse_io_Path_changeFileName__String_String_trace_s2 db "pulse.io.Path.changeFileName(Path.pulse:209)"
pulsec_pulse_io_Path_changeFileName__String_String_trace_s2_len equ 44
pulsec_pulse_io_Path_changeFileName__String_String_trace_s3 db "pulse.io.Path.changeFileName(Path.pulse:211)"
pulsec_pulse_io_Path_changeFileName__String_String_trace_s3_len equ 44
trace_m108 db "pulse.io.Path.isAbsolute"
trace_m108_len equ 24
pulsec_pulse_io_Path_isAbsolute__String_trace_s0 db "pulse.io.Path.isAbsolute(Path.pulse:219)"
pulsec_pulse_io_Path_isAbsolute__String_trace_s0_len equ 40
pulsec_pulse_io_Path_isAbsolute__String_trace_s1 db "pulse.io.Path.isAbsolute(Path.pulse:220)"
pulsec_pulse_io_Path_isAbsolute__String_trace_s1_len equ 40
trace_m111 db "pulse.io.Path.root"
trace_m111_len equ 18
pulsec_pulse_io_Path_root__String_trace_s0 db "pulse.io.Path.root(Path.pulse:228)"
pulsec_pulse_io_Path_root__String_trace_s0_len equ 34
trace_m113 db "pulse.io.Path.relativeTo"
trace_m113_len equ 24
pulsec_pulse_io_Path_relativeTo__String_String_trace_s0 db "pulse.io.Path.relativeTo(Path.pulse:236)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s0_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s1 db "pulse.io.Path.relativeTo(Path.pulse:237)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s1_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s2 db "pulse.io.Path.relativeTo(Path.pulse:238)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s2_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s3 db "pulse.io.Path.relativeTo(Path.pulse:239)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s3_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s4 db "pulse.io.Path.relativeTo(Path.pulse:241)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s4_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s5 db "pulse.io.Path.relativeTo(Path.pulse:242)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s5_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s6 db "pulse.io.Path.relativeTo(Path.pulse:244)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s6_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s7 db "pulse.io.Path.relativeTo(Path.pulse:245)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s7_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s8 db "pulse.io.Path.relativeTo(Path.pulse:246)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s8_len equ 40
pulsec_pulse_io_Path_relativeTo__String_String_trace_s9 db "pulse.io.Path.relativeTo(Path.pulse:248)"
pulsec_pulse_io_Path_relativeTo__String_String_trace_s9_len equ 40
trace_m124 db "pulse.io.Path.changeExtension"
trace_m124_len equ 29
pulsec_pulse_io_Path_changeExtension__String_String_trace_s0 db "pulse.io.Path.changeExtension(Path.pulse:256)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s0_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s1 db "pulse.io.Path.changeExtension(Path.pulse:257)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s1_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s2 db "pulse.io.Path.changeExtension(Path.pulse:258)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s2_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s3 db "pulse.io.Path.changeExtension(Path.pulse:259)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s3_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s4 db "pulse.io.Path.changeExtension(Path.pulse:260)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s4_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s5 db "pulse.io.Path.changeExtension(Path.pulse:261)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s5_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s6 db "pulse.io.Path.changeExtension(Path.pulse:263)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s6_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s7 db "pulse.io.Path.changeExtension(Path.pulse:264)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s7_len equ 45
pulsec_pulse_io_Path_changeExtension__String_String_trace_s8 db "pulse.io.Path.changeExtension(Path.pulse:266)"
pulsec_pulse_io_Path_changeExtension__String_String_trace_s8_len equ 45
trace_m134 db "pulse.io.Path.parts"
trace_m134_len equ 19
pulsec_pulse_io_Path_parts__String_trace_s0 db "pulse.io.Path.parts(Path.pulse:274)"
pulsec_pulse_io_Path_parts__String_trace_s0_len equ 35
pulsec_pulse_io_Path_parts__String_trace_s1 db "pulse.io.Path.parts(Path.pulse:275)"
pulsec_pulse_io_Path_parts__String_trace_s1_len equ 35
trace_m137 db "pulse.io.Path.normalizedParts"
trace_m137_len equ 29
pulsec_pulse_io_Path_normalizedParts__String_trace_s0 db "pulse.io.Path.normalizedParts(Path.pulse:279)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s0_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s1 db "pulse.io.Path.normalizedParts(Path.pulse:280)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s1_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s2 db "pulse.io.Path.normalizedParts(Path.pulse:281)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s2_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s3 db "pulse.io.Path.normalizedParts(Path.pulse:282)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s3_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s4 db "pulse.io.Path.normalizedParts(Path.pulse:284)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s4_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s5 db "pulse.io.Path.normalizedParts(Path.pulse:285)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s5_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s6 db "pulse.io.Path.normalizedParts(Path.pulse:286)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s6_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s7 db "pulse.io.Path.normalizedParts(Path.pulse:287)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s7_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s8 db "pulse.io.Path.normalizedParts(Path.pulse:288)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s8_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s9 db "pulse.io.Path.normalizedParts(Path.pulse:290)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s9_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s10 db "pulse.io.Path.normalizedParts(Path.pulse:292)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s10_len equ 45
pulsec_pulse_io_Path_normalizedParts__String_trace_s11 db "pulse.io.Path.normalizedParts(Path.pulse:294)"
pulsec_pulse_io_Path_normalizedParts__String_trace_s11_len equ 45
trace_m150 db "pulse.io.Path.join"
trace_m150_len equ 18
pulsec_pulse_io_Path_join__List_trace_s0 db "pulse.io.Path.join(Path.pulse:302)"
pulsec_pulse_io_Path_join__List_trace_s0_len equ 34
pulsec_pulse_io_Path_join__List_trace_s1 db "pulse.io.Path.join(Path.pulse:303)"
pulsec_pulse_io_Path_join__List_trace_s1_len equ 34
pulsec_pulse_io_Path_join__List_trace_s2 db "pulse.io.Path.join(Path.pulse:304)"
pulsec_pulse_io_Path_join__List_trace_s2_len equ 34
pulsec_pulse_io_Path_join__List_trace_s3 db "pulse.io.Path.join(Path.pulse:305)"
pulsec_pulse_io_Path_join__List_trace_s3_len equ 34
pulsec_pulse_io_Path_join__List_trace_s4 db "pulse.io.Path.join(Path.pulse:306)"
pulsec_pulse_io_Path_join__List_trace_s4_len equ 34
pulsec_pulse_io_Path_join__List_trace_s5 db "pulse.io.Path.join(Path.pulse:307)"
pulsec_pulse_io_Path_join__List_trace_s5_len equ 34
pulsec_pulse_io_Path_join__List_trace_s6 db "pulse.io.Path.join(Path.pulse:308)"
pulsec_pulse_io_Path_join__List_trace_s6_len equ 34
pulsec_pulse_io_Path_join__List_trace_s7 db "pulse.io.Path.join(Path.pulse:309)"
pulsec_pulse_io_Path_join__List_trace_s7_len equ 34
pulsec_pulse_io_Path_join__List_trace_s8 db "pulse.io.Path.join(Path.pulse:310)"
pulsec_pulse_io_Path_join__List_trace_s8_len equ 34
pulsec_pulse_io_Path_join__List_trace_s9 db "pulse.io.Path.join(Path.pulse:311)"
pulsec_pulse_io_Path_join__List_trace_s9_len equ 34
pulsec_pulse_io_Path_join__List_trace_s10 db "pulse.io.Path.join(Path.pulse:314)"
pulsec_pulse_io_Path_join__List_trace_s10_len equ 34
pulsec_pulse_io_Path_join__List_trace_s11 db "pulse.io.Path.join(Path.pulse:316)"
pulsec_pulse_io_Path_join__List_trace_s11_len equ 34
trace_m163 db "pulse.io.Path.depth"
trace_m163_len equ 19
pulsec_pulse_io_Path_depth__String_trace_s0 db "pulse.io.Path.depth(Path.pulse:324)"
pulsec_pulse_io_Path_depth__String_trace_s0_len equ 35
trace_m165 db "pulse.io.Path.startsWithPath"
trace_m165_len equ 28
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s0 db "pulse.io.Path.startsWithPath(Path.pulse:332)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s0_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s1 db "pulse.io.Path.startsWithPath(Path.pulse:333)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s1_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2 db "pulse.io.Path.startsWithPath(Path.pulse:334)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s3 db "pulse.io.Path.startsWithPath(Path.pulse:335)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s3_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4 db "pulse.io.Path.startsWithPath(Path.pulse:337)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s5 db "pulse.io.Path.startsWithPath(Path.pulse:338)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s5_len equ 44
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s6 db "pulse.io.Path.startsWithPath(Path.pulse:340)"
pulsec_pulse_io_Path_startsWithPath__String_String_trace_s6_len equ 44
trace_m173 db "pulse.io.Path.endsWithPath"
trace_m173_len equ 26
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s0 db "pulse.io.Path.endsWithPath(Path.pulse:348)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s0_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s1 db "pulse.io.Path.endsWithPath(Path.pulse:349)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s1_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2 db "pulse.io.Path.endsWithPath(Path.pulse:350)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s3 db "pulse.io.Path.endsWithPath(Path.pulse:351)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s3_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4 db "pulse.io.Path.endsWithPath(Path.pulse:353)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s5 db "pulse.io.Path.endsWithPath(Path.pulse:354)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s5_len equ 42
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s6 db "pulse.io.Path.endsWithPath(Path.pulse:356)"
pulsec_pulse_io_Path_endsWithPath__String_String_trace_s6_len equ 42
trace_m181 db "pulse.io.Path.commonParent"
trace_m181_len equ 26
pulsec_pulse_io_Path_commonParent__String_String_trace_s0 db "pulse.io.Path.commonParent(Path.pulse:364)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s0_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s1 db "pulse.io.Path.commonParent(Path.pulse:365)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s1_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s2 db "pulse.io.Path.commonParent(Path.pulse:366)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s2_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s3 db "pulse.io.Path.commonParent(Path.pulse:367)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s3_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s4 db "pulse.io.Path.commonParent(Path.pulse:368)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s4_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s5 db "pulse.io.Path.commonParent(Path.pulse:369)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s5_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s6 db "pulse.io.Path.commonParent(Path.pulse:370)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s6_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s7 db "pulse.io.Path.commonParent(Path.pulse:372)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s7_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s8 db "pulse.io.Path.commonParent(Path.pulse:373)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s8_len equ 42
pulsec_pulse_io_Path_commonParent__String_String_trace_s9 db "pulse.io.Path.commonParent(Path.pulse:375)"
pulsec_pulse_io_Path_commonParent__String_String_trace_s9_len equ 42
trace_m192 db "pulse.io.Path.childPath"
trace_m192_len equ 23
pulsec_pulse_io_Path_childPath__String_String_trace_s0 db "pulse.io.Path.childPath(Path.pulse:383)"
pulsec_pulse_io_Path_childPath__String_String_trace_s0_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s1 db "pulse.io.Path.childPath(Path.pulse:384)"
pulsec_pulse_io_Path_childPath__String_String_trace_s1_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s2 db "pulse.io.Path.childPath(Path.pulse:385)"
pulsec_pulse_io_Path_childPath__String_String_trace_s2_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s3 db "pulse.io.Path.childPath(Path.pulse:386)"
pulsec_pulse_io_Path_childPath__String_String_trace_s3_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s4 db "pulse.io.Path.childPath(Path.pulse:388)"
pulsec_pulse_io_Path_childPath__String_String_trace_s4_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s5 db "pulse.io.Path.childPath(Path.pulse:389)"
pulsec_pulse_io_Path_childPath__String_String_trace_s5_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s6 db "pulse.io.Path.childPath(Path.pulse:391)"
pulsec_pulse_io_Path_childPath__String_String_trace_s6_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s7 db "pulse.io.Path.childPath(Path.pulse:392)"
pulsec_pulse_io_Path_childPath__String_String_trace_s7_len equ 39
pulsec_pulse_io_Path_childPath__String_String_trace_s8 db "pulse.io.Path.childPath(Path.pulse:394)"
pulsec_pulse_io_Path_childPath__String_String_trace_s8_len equ 39
trace_m202 db "pulse.io.Path.joinNormalizedParts"
trace_m202_len equ 33
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s0 db "pulse.io.Path.joinNormalizedParts(Path.pulse:398)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s0_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s1 db "pulse.io.Path.joinNormalizedParts(Path.pulse:399)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s1_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2 db "pulse.io.Path.joinNormalizedParts(Path.pulse:400)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s3 db "pulse.io.Path.joinNormalizedParts(Path.pulse:401)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s3_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4 db "pulse.io.Path.joinNormalizedParts(Path.pulse:402)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5 db "pulse.io.Path.joinNormalizedParts(Path.pulse:403)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s6 db "pulse.io.Path.joinNormalizedParts(Path.pulse:404)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s6_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s7 db "pulse.io.Path.joinNormalizedParts(Path.pulse:406)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s7_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s8 db "pulse.io.Path.joinNormalizedParts(Path.pulse:409)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s8_len equ 49
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s9 db "pulse.io.Path.joinNormalizedParts(Path.pulse:411)"
pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s9_len equ 49
trace_m213 db "pulse.io.Path.rootPrefix"
trace_m213_len equ 24
pulsec_pulse_io_Path_rootPrefix__String_trace_s0 db "pulse.io.Path.rootPrefix(Path.pulse:415)"
pulsec_pulse_io_Path_rootPrefix__String_trace_s0_len equ 40
pulsec_pulse_io_Path_rootPrefix__String_trace_s1 db "pulse.io.Path.rootPrefix(Path.pulse:416)"
pulsec_pulse_io_Path_rootPrefix__String_trace_s1_len equ 40
pulsec_pulse_io_Path_rootPrefix__String_trace_s2 db "pulse.io.Path.rootPrefix(Path.pulse:418)"
pulsec_pulse_io_Path_rootPrefix__String_trace_s2_len equ 40
pulsec_pulse_io_Path_rootPrefix__String_trace_s3 db "pulse.io.Path.rootPrefix(Path.pulse:419)"
pulsec_pulse_io_Path_rootPrefix__String_trace_s3_len equ 40
pulsec_pulse_io_Path_rootPrefix__String_trace_s4 db "pulse.io.Path.rootPrefix(Path.pulse:421)"
pulsec_pulse_io_Path_rootPrefix__String_trace_s4_len equ 40
trace_m219 db "pulse.io.Path.hasWindowsDriveRoot"
trace_m219_len equ 33
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0 db "pulse.io.Path.hasWindowsDriveRoot(Path.pulse:425)"
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0_len equ 49
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s1 db "pulse.io.Path.hasWindowsDriveRoot(Path.pulse:426)"
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s1_len equ 49
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s2 db "pulse.io.Path.hasWindowsDriveRoot(Path.pulse:428)"
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s2_len equ 49
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s3 db "pulse.io.Path.hasWindowsDriveRoot(Path.pulse:429)"
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s3_len equ 49
trace_m224 db "pulse.io.Path.isAsciiLetter"
trace_m224_len equ 27
pulsec_pulse_io_Path_isAsciiLetter__char_trace_s0 db "pulse.io.Path.isAsciiLetter(Path.pulse:433)"
pulsec_pulse_io_Path_isAsciiLetter__char_trace_s0_len equ 43
msg0 db "/"
msg0_len equ 1
msg1 db 0
msg1_len equ 0
msg2 db 0
msg2_len equ 0
msg3 db "/"
msg3_len equ 1
msg4 db "/"
msg4_len equ 1
msg5 db "/?/"
msg5_len equ 3
msg6 db "."
msg6_len equ 1
msg7 db ".."
msg7_len equ 2
msg8 db ".."
msg8_len equ 2
msg9 db "/"
msg9_len equ 1
msg10 db "/"
msg10_len equ 1
msg11 db "/"
msg11_len equ 1
msg12 db "/"
msg12_len equ 1
msg13 db "/"
msg13_len equ 1
msg14 db 0
msg14_len equ 0
msg15 db "/"
msg15_len equ 1
msg16 db "."
msg16_len equ 1
msg17 db 0
msg17_len equ 0
msg18 db "."
msg18_len equ 1
msg19 db 0
msg19_len equ 0
msg20 db "/"
msg20_len equ 1
msg21 db "."
msg21_len equ 1
msg22 db "/"
msg22_len equ 1
msg23 db "/"
msg23_len equ 1
msg24 db "/"
msg24_len equ 1
msg25 db 0
msg25_len equ 0
msg26 db 0
msg26_len equ 0
msg27 db 0
msg27_len equ 0
msg28 db "/"
msg28_len equ 1
msg29 db "/"
msg29_len equ 1
msg30 db "/"
msg30_len equ 1
msg31 db 0
msg31_len equ 0

.code
pulsec_pulse_io_Path_separator proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
pulsec_pulse_io_Path_separator_b0:
    lea rcx, pulsec_pulse_io_Path_separator_trace_s0
    mov edx, pulsec_pulse_io_Path_separator_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_separator_epilogue
pulsec_pulse_io_Path_separator_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_pulse_io_Path_separator_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_io_Path_separator endp

pulsec_pulse_io_Path_normalize__String proc
    sub rsp, 504
    mov qword ptr [rsp+472], rcx
    mov qword ptr [rsp+480], rdx
    mov qword ptr [rsp+488], r8
    mov qword ptr [rsp+496], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+472]
    mov rdx, qword ptr [rsp+480]
    mov r8, qword ptr [rsp+488]
    mov r9, qword ptr [rsp+496]
    mov qword ptr [rsp+144], rcx
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+112], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+120], 0
pulsec_pulse_io_Path_normalize__String_b0:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s0
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+152], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne Path_normalize_ternary_then_0_7
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    jmp Path_normalize_ternary_done_0_7
Path_normalize_ternary_then_0_7:
    mov eax, 1
Path_normalize_ternary_done_0_7:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b1
    jmp pulsec_pulse_io_Path_normalize__String_b2
pulsec_pulse_io_Path_normalize__String_b1:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s1
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_normalize__String_epilogue
pulsec_pulse_io_Path_normalize__String_b2:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s0
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b3
pulsec_pulse_io_Path_normalize__String_b3:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s2
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s3
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s4
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s5
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b4
pulsec_pulse_io_Path_normalize__String_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b5
    jmp pulsec_pulse_io_Path_normalize__String_b6
pulsec_pulse_io_Path_normalize__String_b5:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s6
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s7
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+168], eax
    mov eax, 92
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Path_normalize_ternary_then_7_28
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+176], eax
    mov eax, 47
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Path_normalize_ternary_done_7_28
Path_normalize_ternary_then_7_28:
    mov eax, 1
Path_normalize_ternary_done_7_28:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b7
    jmp pulsec_pulse_io_Path_normalize__String_b8
pulsec_pulse_io_Path_normalize__String_b6:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s14
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+192], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Path_normalize_ternary_then_14_62
    mov eax, 0
    jmp Path_normalize_ternary_done_14_62
Path_normalize_ternary_then_14_62:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
Path_normalize_ternary_done_14_62:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b13
    jmp pulsec_pulse_io_Path_normalize__String_b14
pulsec_pulse_io_Path_normalize__String_b7:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s8
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b10
    jmp pulsec_pulse_io_Path_normalize__String_b11
pulsec_pulse_io_Path_normalize__String_b8:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s11
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s12
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s7
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b9
pulsec_pulse_io_Path_normalize__String_b9:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s13
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s5
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b4
pulsec_pulse_io_Path_normalize__String_b10:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s9
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s10
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s8
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b12
pulsec_pulse_io_Path_normalize__String_b11:
    jmp pulsec_pulse_io_Path_normalize__String_b12
pulsec_pulse_io_Path_normalize__String_b12:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s7
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b9
pulsec_pulse_io_Path_normalize__String_b13:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s15
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov eax, 0
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+344], rax
    mov rcx, qword ptr [rsp+344]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+200], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    sub eax, edx
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+264], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    mov r8d, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s14
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b15
pulsec_pulse_io_Path_normalize__String_b14:
    jmp pulsec_pulse_io_Path_normalize__String_b15
pulsec_pulse_io_Path_normalize__String_b15:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s16
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test rax, rax
    jne Path_normalize_ternary_then_16_85
    mov eax, 0
    jmp Path_normalize_ternary_done_16_85
Path_normalize_ternary_then_16_85:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+344], rax
    mov eax, 3
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+344]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
Path_normalize_ternary_done_16_85:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b16
    jmp pulsec_pulse_io_Path_normalize__String_b17
pulsec_pulse_io_Path_normalize__String_b16:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s17
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov eax, 3
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s16
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b18
pulsec_pulse_io_Path_normalize__String_b17:
    jmp pulsec_pulse_io_Path_normalize__String_b18
pulsec_pulse_io_Path_normalize__String_b18:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s18
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_io_Path_rootPrefix__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s19
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s20
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s20_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalizedParts__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s21
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+120], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s22
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s22_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s23
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s23_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b19
pulsec_pulse_io_Path_normalize__String_b19:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Path_normalize_vd23_109_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_normalize_vd23_109_type
    cmp eax, 6
    je Path_normalize_vd23_109_assign_ok
    cmp eax, 9
    je Path_normalize_vd23_109_assign_ok
    jmp Path_normalize_vd23_109_type
Path_normalize_vd23_109_assign_ok:
    cmp eax, 6
    je Path_normalize_vd23_109_ovr0
    cmp eax, 9
    je Path_normalize_vd23_109_ovr1
    jmp Path_normalize_vd23_109_default
Path_normalize_vd23_109_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_normalize_vd23_109_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+208]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b20
    jmp pulsec_pulse_io_Path_normalize__String_b21
pulsec_pulse_io_Path_normalize__String_b20:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s24
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Path_normalize_vd24_114_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_normalize_vd24_114_type
    cmp eax, 6
    je Path_normalize_vd24_114_assign_ok
    cmp eax, 9
    je Path_normalize_vd24_114_assign_ok
    jmp Path_normalize_vd24_114_type
Path_normalize_vd24_114_assign_ok:
    cmp eax, 6
    je Path_normalize_vd24_114_ovr0
    cmp eax, 9
    je Path_normalize_vd24_114_ovr1
    jmp Path_normalize_vd24_114_default
Path_normalize_vd24_114_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_normalize_vd24_114_done:
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+128], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s25
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s25_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test rax, rax
    jne Path_normalize_ternary_then_25_123
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    jmp Path_normalize_ternary_done_25_123
Path_normalize_ternary_then_25_123:
    mov eax, 1
Path_normalize_ternary_done_25_123:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b22
    jmp pulsec_pulse_io_Path_normalize__String_b23
pulsec_pulse_io_Path_normalize__String_b21:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s37
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s37_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_io_Path_joinNormalizedParts__List
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+136], rax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s38
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s38_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b34
    jmp pulsec_pulse_io_Path_normalize__String_b35
pulsec_pulse_io_Path_normalize__String_b22:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s26
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+216], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s27
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b19
pulsec_pulse_io_Path_normalize__String_b23:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s25
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s25_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b24
pulsec_pulse_io_Path_normalize__String_b24:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s28
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s28_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b25
    jmp pulsec_pulse_io_Path_normalize__String_b26
pulsec_pulse_io_Path_normalize__String_b25:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s29
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Path_normalize_vd29_135_null
    call pulsec_pulse_collections_ArrayList_isEmpty
    jmp Path_normalize_vd29_135_done
Path_normalize_vd29_135_null:
    call pulsec_rt_dispatchNullReceiverPanic
Path_normalize_vd29_135_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne Path_normalize_ternary_then_29_149
    mov eax, 0
    jmp Path_normalize_ternary_done_29_149
Path_normalize_ternary_then_29_149:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+384], rax
    mov rcx, qword ptr [rsp+384]
    test rcx, rcx
    je Path_normalize_vd29_141_null
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_normalize_vd29_141_done
Path_normalize_vd29_141_null:
    call pulsec_rt_dispatchNullReceiverPanic
Path_normalize_vd29_141_done:
    movsxd rax, eax
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+344]
    test rcx, rcx
    je Path_normalize_vd29_144_null
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_normalize_vd29_144_done
Path_normalize_vd29_144_null:
    call pulsec_rt_dispatchNullReceiverPanic
Path_normalize_vd29_144_done:
    mov qword ptr [rsp+304], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test eax, eax
    sete al
    movzx eax, al
Path_normalize_ternary_done_29_149:
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b28
    jmp pulsec_pulse_io_Path_normalize__String_b29
pulsec_pulse_io_Path_normalize__String_b26:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s28
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b27
pulsec_pulse_io_Path_normalize__String_b27:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s35
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s35_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_io_Path_normalize__String_vd_stmt_27_35_0_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_pulse_io_Path_normalize__String_vd_stmt_27_35_0_done
pulsec_pulse_io_Path_normalize__String_vd_stmt_27_35_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_normalize__String_vd_stmt_27_35_0_done:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s36
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s36_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+248], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s23
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s23_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b19
pulsec_pulse_io_Path_normalize__String_b28:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s30
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+344], rax
    mov rcx, qword ptr [rsp+344]
    test rcx, rcx
    je Path_normalize_vd30_154_null
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_normalize_vd30_154_done
Path_normalize_vd30_154_null:
    call pulsec_rt_dispatchNullReceiverPanic
Path_normalize_vd30_154_done:
    movsxd rax, eax
    mov dword ptr [rsp+232], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    sub eax, edx
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_io_Path_normalize__String_vd_stmt_28_30_0_null
    call pulsec_pulse_collections_ArrayList_remove__int
    jmp pulsec_pulse_io_Path_normalize__String_vd_stmt_28_30_0_done
pulsec_pulse_io_Path_normalize__String_vd_stmt_28_30_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_normalize__String_vd_stmt_28_30_0_done:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s29
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b30
pulsec_pulse_io_Path_normalize__String_b29:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s31
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b31
    jmp pulsec_pulse_io_Path_normalize__String_b32
pulsec_pulse_io_Path_normalize__String_b30:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s33
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s33_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+240], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s34
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s34_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b19
pulsec_pulse_io_Path_normalize__String_b31:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s32
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s32_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_io_Path_normalize__String_vd_stmt_31_32_0_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_pulse_io_Path_normalize__String_vd_stmt_31_32_0_done
pulsec_pulse_io_Path_normalize__String_vd_stmt_31_32_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_normalize__String_vd_stmt_31_32_0_done:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s31
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b33
pulsec_pulse_io_Path_normalize__String_b32:
    jmp pulsec_pulse_io_Path_normalize__String_b33
pulsec_pulse_io_Path_normalize__String_b33:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s29
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b30
pulsec_pulse_io_Path_normalize__String_b34:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s39
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s39_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_normalize__String_b37
    jmp pulsec_pulse_io_Path_normalize__String_b38
pulsec_pulse_io_Path_normalize__String_b35:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s38
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s38_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b36
pulsec_pulse_io_Path_normalize__String_b36:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s42
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s42_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_normalize__String_epilogue
pulsec_pulse_io_Path_normalize__String_b37:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s40
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s40_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_normalize__String_epilogue
pulsec_pulse_io_Path_normalize__String_b38:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s39
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s39_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalize__String_b39
pulsec_pulse_io_Path_normalize__String_b39:
    lea rcx, pulsec_pulse_io_Path_normalize__String_trace_s41
    mov edx, pulsec_pulse_io_Path_normalize__String_trace_s41_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    jmp pulsec_pulse_io_Path_normalize__String_epilogue
pulsec_pulse_io_Path_normalize__String_epilogue:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
pulsec_pulse_io_Path_normalize__String_epilogue_post:
    mov qword ptr [rsp+296], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+296]
    add rsp, 504
    ret
pulsec_pulse_io_Path_normalize__String endp

pulsec_pulse_io_Path_combine__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_io_Path_combine__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b1
    jmp pulsec_pulse_io_Path_combine__String_String_b2
pulsec_pulse_io_Path_combine__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b3
pulsec_pulse_io_Path_combine__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b4
    jmp pulsec_pulse_io_Path_combine__String_String_b5
pulsec_pulse_io_Path_combine__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b6
pulsec_pulse_io_Path_combine__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b7
    jmp pulsec_pulse_io_Path_combine__String_String_b8
pulsec_pulse_io_Path_combine__String_String_b7:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_b8:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b9
pulsec_pulse_io_Path_combine__String_String_b9:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b10
pulsec_pulse_io_Path_combine__String_String_b10:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b11
    jmp pulsec_pulse_io_Path_combine__String_String_b12
pulsec_pulse_io_Path_combine__String_String_b11:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s9
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov eax, 1
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b10
pulsec_pulse_io_Path_combine__String_String_b12:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s10
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b13
    jmp pulsec_pulse_io_Path_combine__String_String_b14
pulsec_pulse_io_Path_combine__String_String_b13:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s11
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_b14:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s10
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b15
pulsec_pulse_io_Path_combine__String_String_b15:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s12
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_io_Path_combine__String_String_b16
    jmp pulsec_pulse_io_Path_combine__String_String_b17
pulsec_pulse_io_Path_combine__String_String_b16:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s13
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_b17:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s12
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_combine__String_String_b18
pulsec_pulse_io_Path_combine__String_String_b18:
    lea rcx, pulsec_pulse_io_Path_combine__String_String_trace_s14
    mov edx, pulsec_pulse_io_Path_combine__String_String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_io_Path_combine__String_String_epilogue
pulsec_pulse_io_Path_combine__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_io_Path_combine__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_io_Path_combine__String_String endp

pulsec_pulse_io_Path_resolve__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_io_Path_resolve__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_resolve__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_resolve__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_combine__String_String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_io_Path_resolve__String_String_epilogue
pulsec_pulse_io_Path_resolve__String_String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_io_Path_resolve__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_io_Path_resolve__String_String endp

pulsec_pulse_io_Path_fileName__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_fileName__String_b0:
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s0
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s1
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s2
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_fileName__String_b1
    jmp pulsec_pulse_io_Path_fileName__String_b2
pulsec_pulse_io_Path_fileName__String_b1:
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s3
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_fileName__String_epilogue
pulsec_pulse_io_Path_fileName__String_b2:
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s2
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_fileName__String_b3
pulsec_pulse_io_Path_fileName__String_b3:
    lea rcx, pulsec_pulse_io_Path_fileName__String_trace_s4
    mov edx, pulsec_pulse_io_Path_fileName__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_io_Path_fileName__String_epilogue
pulsec_pulse_io_Path_fileName__String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_io_Path_fileName__String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_io_Path_fileName__String endp

pulsec_pulse_io_Path_parent__String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_io_Path_parent__String_b0:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s0
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s1
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_io_Path_rootPrefix__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s2
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s3
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne Path_parent_ternary_then_3_21
    mov eax, 0
    jmp Path_parent_ternary_done_3_21
Path_parent_ternary_then_3_21:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
Path_parent_ternary_done_3_21:
    test eax, eax
    jne pulsec_pulse_io_Path_parent__String_b1
    jmp pulsec_pulse_io_Path_parent__String_b2
pulsec_pulse_io_Path_parent__String_b1:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s4
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_parent__String_epilogue
pulsec_pulse_io_Path_parent__String_b2:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s3
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_parent__String_b3
pulsec_pulse_io_Path_parent__String_b3:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s5
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s6
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_parent__String_b4
    jmp pulsec_pulse_io_Path_parent__String_b5
pulsec_pulse_io_Path_parent__String_b4:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s7
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_parent__String_epilogue
pulsec_pulse_io_Path_parent__String_b5:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s6
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_parent__String_b6
pulsec_pulse_io_Path_parent__String_b6:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s8
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne Path_parent_ternary_then_8_39
    mov eax, 0
    jmp Path_parent_ternary_done_8_39
Path_parent_ternary_then_8_39:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
Path_parent_ternary_done_8_39:
    test eax, eax
    jne pulsec_pulse_io_Path_parent__String_b7
    jmp pulsec_pulse_io_Path_parent__String_b8
pulsec_pulse_io_Path_parent__String_b7:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s9
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_parent__String_epilogue
pulsec_pulse_io_Path_parent__String_b8:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s8
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_parent__String_b9
pulsec_pulse_io_Path_parent__String_b9:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s10
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_parent__String_b10
    jmp pulsec_pulse_io_Path_parent__String_b11
pulsec_pulse_io_Path_parent__String_b10:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s11
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_parent__String_epilogue
pulsec_pulse_io_Path_parent__String_b11:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s10
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_parent__String_b12
pulsec_pulse_io_Path_parent__String_b12:
    lea rcx, pulsec_pulse_io_Path_parent__String_trace_s12
    mov edx, pulsec_pulse_io_Path_parent__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov eax, 0
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    mov r8d, eax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_io_Path_parent__String_epilogue
pulsec_pulse_io_Path_parent__String_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
pulsec_pulse_io_Path_parent__String_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_io_Path_parent__String endp

pulsec_pulse_io_Path_extension__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_extension__String_b0:
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s0
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_pulse_io_Path_fileName__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s1
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s2
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setle al
    movzx eax, al
    test rax, rax
    jne Path_extension_ternary_then_2_19
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Path_extension_ternary_done_2_19
Path_extension_ternary_then_2_19:
    mov eax, 1
Path_extension_ternary_done_2_19:
    test eax, eax
    jne pulsec_pulse_io_Path_extension__String_b1
    jmp pulsec_pulse_io_Path_extension__String_b2
pulsec_pulse_io_Path_extension__String_b1:
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s3
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_extension__String_epilogue
pulsec_pulse_io_Path_extension__String_b2:
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s2
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_extension__String_b3
pulsec_pulse_io_Path_extension__String_b3:
    lea rcx, pulsec_pulse_io_Path_extension__String_trace_s4
    mov edx, pulsec_pulse_io_Path_extension__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_io_Path_extension__String_epilogue
pulsec_pulse_io_Path_extension__String_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_io_Path_extension__String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_io_Path_extension__String endp

pulsec_pulse_io_Path_hasExtension__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_io_Path_hasExtension__String_b0:
    lea rcx, pulsec_pulse_io_Path_hasExtension__String_trace_s0
    mov edx, pulsec_pulse_io_Path_hasExtension__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_io_Path_extension__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    jmp pulsec_pulse_io_Path_hasExtension__String_epilogue
pulsec_pulse_io_Path_hasExtension__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_io_Path_hasExtension__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_io_Path_hasExtension__String endp

pulsec_pulse_io_Path_stem__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_stem__String_b0:
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s0
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_fileName__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s1
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s2
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_stem__String_b1
    jmp pulsec_pulse_io_Path_stem__String_b2
pulsec_pulse_io_Path_stem__String_b1:
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s3
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_stem__String_epilogue
pulsec_pulse_io_Path_stem__String_b2:
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s2
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_stem__String_b3
pulsec_pulse_io_Path_stem__String_b3:
    lea rcx, pulsec_pulse_io_Path_stem__String_trace_s4
    mov edx, pulsec_pulse_io_Path_stem__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov eax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_io_Path_stem__String_epilogue
pulsec_pulse_io_Path_stem__String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_io_Path_stem__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_io_Path_stem__String endp

pulsec_pulse_io_Path_resolveSibling__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_resolveSibling__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_io_Path_parent__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_resolveSibling__String_String_b1
    jmp pulsec_pulse_io_Path_resolveSibling__String_String_b2
pulsec_pulse_io_Path_resolveSibling__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_io_Path_resolveSibling__String_String_epilogue
pulsec_pulse_io_Path_resolveSibling__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_resolveSibling__String_String_b3
pulsec_pulse_io_Path_resolveSibling__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_resolveSibling__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_io_Path_resolveSibling__String_String_epilogue
pulsec_pulse_io_Path_resolveSibling__String_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
pulsec_pulse_io_Path_resolveSibling__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_io_Path_resolveSibling__String_String endp

pulsec_pulse_io_Path_changeFileName__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m103
    mov edx, trace_m103_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_changeFileName__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_io_Path_parent__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_changeFileName__String_String_b1
    jmp pulsec_pulse_io_Path_changeFileName__String_String_b2
pulsec_pulse_io_Path_changeFileName__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_io_Path_changeFileName__String_String_epilogue
pulsec_pulse_io_Path_changeFileName__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_changeFileName__String_String_b3
pulsec_pulse_io_Path_changeFileName__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_changeFileName__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_io_Path_changeFileName__String_String_epilogue
pulsec_pulse_io_Path_changeFileName__String_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
pulsec_pulse_io_Path_changeFileName__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_io_Path_changeFileName__String_String endp

pulsec_pulse_io_Path_isAbsolute__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m108
    mov edx, trace_m108_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_isAbsolute__String_b0:
    lea rcx, pulsec_pulse_io_Path_isAbsolute__String_trace_s0
    mov edx, pulsec_pulse_io_Path_isAbsolute__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_isAbsolute__String_trace_s1
    mov edx, pulsec_pulse_io_Path_isAbsolute__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_io_Path_rootPrefix__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    jmp pulsec_pulse_io_Path_isAbsolute__String_epilogue
pulsec_pulse_io_Path_isAbsolute__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
pulsec_pulse_io_Path_isAbsolute__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_io_Path_isAbsolute__String endp

pulsec_pulse_io_Path_root__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m111
    mov edx, trace_m111_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_io_Path_root__String_b0:
    lea rcx, pulsec_pulse_io_Path_root__String_trace_s0
    mov edx, pulsec_pulse_io_Path_root__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_io_Path_rootPrefix__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_io_Path_root__String_epilogue
pulsec_pulse_io_Path_root__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_io_Path_root__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_io_Path_root__String endp

pulsec_pulse_io_Path_relativeTo__String_String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m113
    mov edx, trace_m113_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_relativeTo__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_relativeTo__String_String_b1
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b2
pulsec_pulse_io_Path_relativeTo__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_relativeTo__String_String_epilogue
pulsec_pulse_io_Path_relativeTo__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b3
pulsec_pulse_io_Path_relativeTo__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne pulsec_pulse_io_Path_relativeTo__String_String_b4
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b5
pulsec_pulse_io_Path_relativeTo__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_relativeTo__String_String_epilogue
pulsec_pulse_io_Path_relativeTo__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b6
pulsec_pulse_io_Path_relativeTo__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne pulsec_pulse_io_Path_relativeTo__String_String_b7
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b8
pulsec_pulse_io_Path_relativeTo__String_String_b7:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_io_Path_relativeTo__String_String_epilogue
pulsec_pulse_io_Path_relativeTo__String_String_b8:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_relativeTo__String_String_b9
pulsec_pulse_io_Path_relativeTo__String_String_b9:
    lea rcx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s9
    mov edx, pulsec_pulse_io_Path_relativeTo__String_String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_relativeTo__String_String_epilogue
pulsec_pulse_io_Path_relativeTo__String_String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_io_Path_relativeTo__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_io_Path_relativeTo__String_String endp

pulsec_pulse_io_Path_changeExtension__String_String proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m124
    mov edx, trace_m124_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
pulsec_pulse_io_Path_changeExtension__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_pulse_io_Path_parent__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_pulse_io_Path_stem__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne Path_changeExtension_ternary_then_4_21
    mov eax, 0
    jmp Path_changeExtension_ternary_done_4_21
Path_changeExtension_ternary_then_4_21:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_changeExtension_ternary_done_4_21:
    test eax, eax
    jne pulsec_pulse_io_Path_changeExtension__String_String_b1
    jmp pulsec_pulse_io_Path_changeExtension__String_String_b2
pulsec_pulse_io_Path_changeExtension__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+208], rax
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_changeExtension__String_String_b3
pulsec_pulse_io_Path_changeExtension__String_String_b2:
    jmp pulsec_pulse_io_Path_changeExtension__String_String_b3
pulsec_pulse_io_Path_changeExtension__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_changeExtension__String_String_b4
    jmp pulsec_pulse_io_Path_changeExtension__String_String_b5
pulsec_pulse_io_Path_changeExtension__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_changeExtension__String_String_epilogue
pulsec_pulse_io_Path_changeExtension__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_changeExtension__String_String_b6
pulsec_pulse_io_Path_changeExtension__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_changeExtension__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_pulse_io_Path_changeExtension__String_String_epilogue
pulsec_pulse_io_Path_changeExtension__String_String_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_io_Path_changeExtension__String_String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_io_Path_changeExtension__String_String endp

pulsec_pulse_io_Path_parts__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m134
    mov edx, trace_m134_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_parts__String_b0:
    lea rcx, pulsec_pulse_io_Path_parts__String_trace_s0
    mov edx, pulsec_pulse_io_Path_parts__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_parts__String_trace_s1
    mov edx, pulsec_pulse_io_Path_parts__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalizedParts__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_io_Path_parts__String_epilogue
pulsec_pulse_io_Path_parts__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
pulsec_pulse_io_Path_parts__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_io_Path_parts__String endp

pulsec_pulse_io_Path_normalizedParts__String proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m137
    mov edx, trace_m137_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_normalizedParts__String_b0:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s0
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s1
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_pulse_io_Path_rootPrefix__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s2
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test rax, rax
    jne Path_normalizedParts_ternary_then_2_14
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp Path_normalizedParts_ternary_done_2_14
Path_normalizedParts_ternary_then_2_14:
    mov eax, 1
Path_normalizedParts_ternary_done_2_14:
    test rax, rax
    jne Path_normalizedParts_ternary_then_2_20
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Path_normalizedParts_ternary_done_2_20
Path_normalizedParts_ternary_then_2_20:
    mov eax, 1
Path_normalizedParts_ternary_done_2_20:
    test eax, eax
    jne pulsec_pulse_io_Path_normalizedParts__String_b1
    jmp pulsec_pulse_io_Path_normalizedParts__String_b2
pulsec_pulse_io_Path_normalizedParts__String_b1:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s3
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_normalizedParts__String_epilogue
pulsec_pulse_io_Path_normalizedParts__String_b2:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s2
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b3
pulsec_pulse_io_Path_normalizedParts__String_b3:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s4
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s5
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b4
pulsec_pulse_io_Path_normalizedParts__String_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalizedParts__String_b5
    jmp pulsec_pulse_io_Path_normalizedParts__String_b6
pulsec_pulse_io_Path_normalizedParts__String_b5:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Path_normalizedParts_ternary_then_6_40
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+128], eax
    mov eax, 47
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Path_normalizedParts_ternary_done_6_40
Path_normalizedParts_ternary_then_6_40:
    mov eax, 1
Path_normalizedParts_ternary_done_6_40:
    test eax, eax
    jne pulsec_pulse_io_Path_normalizedParts__String_b7
    jmp pulsec_pulse_io_Path_normalizedParts__String_b8
pulsec_pulse_io_Path_normalizedParts__String_b6:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s11
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_normalizedParts__String_epilogue
pulsec_pulse_io_Path_normalizedParts__String_b7:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s7
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_normalizedParts__String_b10
    jmp pulsec_pulse_io_Path_normalizedParts__String_b11
pulsec_pulse_io_Path_normalizedParts__String_b8:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b9
pulsec_pulse_io_Path_normalizedParts__String_b9:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s10
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s5
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b4
pulsec_pulse_io_Path_normalizedParts__String_b10:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s8
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+296], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    mov r8d, eax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov qword ptr [rsp+216], rdx
    mov qword ptr [rsp+224], r8
    mov qword ptr [rsp+232], r9
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    mov rdx, qword ptr [rsp+216]
    mov r8, qword ptr [rsp+224]
    mov r9, qword ptr [rsp+232]
    test rcx, rcx
    je pulsec_pulse_io_Path_normalizedParts__String_vd_stmt_10_8_0_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_pulse_io_Path_normalizedParts__String_vd_stmt_10_8_0_done
pulsec_pulse_io_Path_normalizedParts__String_vd_stmt_10_8_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_normalizedParts__String_vd_stmt_10_8_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s7
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b12
pulsec_pulse_io_Path_normalizedParts__String_b11:
    jmp pulsec_pulse_io_Path_normalizedParts__String_b12
pulsec_pulse_io_Path_normalizedParts__String_b12:
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s9
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6
    mov edx, pulsec_pulse_io_Path_normalizedParts__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_normalizedParts__String_b9
pulsec_pulse_io_Path_normalizedParts__String_epilogue:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
pulsec_pulse_io_Path_normalizedParts__String_epilogue_post:
    mov qword ptr [rsp+200], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 360
    ret
pulsec_pulse_io_Path_normalizedParts__String endp

pulsec_pulse_io_Path_join__List proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m150
    mov edx, trace_m150_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+104], rcx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
pulsec_pulse_io_Path_join__List_b0:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s0
    mov edx, pulsec_pulse_io_Path_join__List_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s1
    mov edx, pulsec_pulse_io_Path_join__List_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s2
    mov edx, pulsec_pulse_io_Path_join__List_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b1
pulsec_pulse_io_Path_join__List_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    test rcx, rcx
    je Path_join_vd2_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_join_vd2_5_type
    cmp eax, 6
    je Path_join_vd2_5_assign_ok
    cmp eax, 9
    je Path_join_vd2_5_assign_ok
    jmp Path_join_vd2_5_type
Path_join_vd2_5_assign_ok:
    cmp eax, 6
    je Path_join_vd2_5_ovr0
    cmp eax, 9
    je Path_join_vd2_5_ovr1
    jmp Path_join_vd2_5_default
Path_join_vd2_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_join_vd2_5_done
Path_join_vd2_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_join_vd2_5_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_join__List_b2
    jmp pulsec_pulse_io_Path_join__List_b3
pulsec_pulse_io_Path_join__List_b2:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s3
    mov edx, pulsec_pulse_io_Path_join__List_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+200]
    test rcx, rcx
    je Path_join_vd3_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_join_vd3_10_type
    cmp eax, 6
    je Path_join_vd3_10_assign_ok
    cmp eax, 9
    je Path_join_vd3_10_assign_ok
    jmp Path_join_vd3_10_type
Path_join_vd3_10_assign_ok:
    cmp eax, 6
    je Path_join_vd3_10_ovr0
    cmp eax, 9
    je Path_join_vd3_10_ovr1
    jmp Path_join_vd3_10_default
Path_join_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_join_vd3_10_done
Path_join_vd3_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_join_vd3_10_done:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s4
    mov edx, pulsec_pulse_io_Path_join__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne Path_join_ternary_then_4_19
    mov eax, 0
    jmp Path_join_ternary_done_4_19
Path_join_ternary_then_4_19:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_join_ternary_done_4_19:
    test eax, eax
    jne pulsec_pulse_io_Path_join__List_b4
    jmp pulsec_pulse_io_Path_join__List_b5
pulsec_pulse_io_Path_join__List_b3:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s11
    mov edx, pulsec_pulse_io_Path_join__List_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_pulse_io_Path_joinNormalizedParts__List
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    jmp pulsec_pulse_io_Path_join__List_epilogue
pulsec_pulse_io_Path_join__List_b4:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s5
    mov edx, pulsec_pulse_io_Path_join__List_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_pulse_io_Path_parts__String
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s6
    mov edx, pulsec_pulse_io_Path_join__List_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s7
    mov edx, pulsec_pulse_io_Path_join__List_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b7
pulsec_pulse_io_Path_join__List_b5:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s4
    mov edx, pulsec_pulse_io_Path_join__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b6
pulsec_pulse_io_Path_join__List_b6:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s10
    mov edx, pulsec_pulse_io_Path_join__List_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s2
    mov edx, pulsec_pulse_io_Path_join__List_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b1
pulsec_pulse_io_Path_join__List_b7:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s7
    mov edx, pulsec_pulse_io_Path_join__List_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    test rcx, rcx
    je Path_join_vd7_28_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_join_vd7_28_type
    cmp eax, 6
    je Path_join_vd7_28_assign_ok
    cmp eax, 9
    je Path_join_vd7_28_assign_ok
    jmp Path_join_vd7_28_type
Path_join_vd7_28_assign_ok:
    cmp eax, 6
    je Path_join_vd7_28_ovr0
    cmp eax, 9
    je Path_join_vd7_28_ovr1
    jmp Path_join_vd7_28_default
Path_join_vd7_28_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_join_vd7_28_done
Path_join_vd7_28_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_join_vd7_28_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_join__List_b8
    jmp pulsec_pulse_io_Path_join__List_b9
pulsec_pulse_io_Path_join__List_b8:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s8
    mov edx, pulsec_pulse_io_Path_join__List_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+240]
    test rcx, rcx
    je Path_join_vd8_35_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_join_vd8_35_type
    cmp eax, 6
    je Path_join_vd8_35_assign_ok
    cmp eax, 9
    je Path_join_vd8_35_assign_ok
    jmp Path_join_vd8_35_type
Path_join_vd8_35_assign_ok:
    cmp eax, 6
    je Path_join_vd8_35_ovr0
    cmp eax, 9
    je Path_join_vd8_35_ovr1
    jmp Path_join_vd8_35_default
Path_join_vd8_35_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_join_vd8_35_done
Path_join_vd8_35_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_join_vd8_35_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    test rcx, rcx
    je pulsec_pulse_io_Path_join__List_vd_stmt_8_8_0_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_pulse_io_Path_join__List_vd_stmt_8_8_0_done
pulsec_pulse_io_Path_join__List_vd_stmt_8_8_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_join__List_vd_stmt_8_8_0_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s9
    mov edx, pulsec_pulse_io_Path_join__List_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s7
    mov edx, pulsec_pulse_io_Path_join__List_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b7
pulsec_pulse_io_Path_join__List_b9:
    lea rcx, pulsec_pulse_io_Path_join__List_trace_s4
    mov edx, pulsec_pulse_io_Path_join__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_join__List_b6
pulsec_pulse_io_Path_join__List_epilogue:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
pulsec_pulse_io_Path_join__List_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 360
    ret
pulsec_pulse_io_Path_join__List endp

pulsec_pulse_io_Path_depth__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m163
    mov edx, trace_m163_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_io_Path_depth__String_b0:
    lea rcx, pulsec_pulse_io_Path_depth__String_trace_s0
    mov edx, pulsec_pulse_io_Path_depth__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_io_Path_parts__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je Path_depth_vd0_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_depth_vd0_5_type
    cmp eax, 6
    je Path_depth_vd0_5_assign_ok
    cmp eax, 9
    je Path_depth_vd0_5_assign_ok
    jmp Path_depth_vd0_5_type
Path_depth_vd0_5_assign_ok:
    cmp eax, 6
    je Path_depth_vd0_5_ovr0
    cmp eax, 9
    je Path_depth_vd0_5_ovr1
    jmp Path_depth_vd0_5_default
Path_depth_vd0_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_depth_vd0_5_done:
    movsxd rax, eax
    jmp pulsec_pulse_io_Path_depth__String_epilogue
pulsec_pulse_io_Path_depth__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_io_Path_depth__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_io_Path_depth__String endp

pulsec_pulse_io_Path_startsWithPath__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m165
    mov edx, trace_m165_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_io_Path_startsWithPath__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_startsWithPath__String_String_b1
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_b2
pulsec_pulse_io_Path_startsWithPath__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_epilogue
pulsec_pulse_io_Path_startsWithPath__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_b3
pulsec_pulse_io_Path_startsWithPath__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_io_Path_startsWithPath__String_String_b4
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_b5
pulsec_pulse_io_Path_startsWithPath__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_epilogue
pulsec_pulse_io_Path_startsWithPath__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_b6
pulsec_pulse_io_Path_startsWithPath__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_startsWithPath__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_io_Path_startsWithPath__String_String_epilogue
pulsec_pulse_io_Path_startsWithPath__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_io_Path_startsWithPath__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_io_Path_startsWithPath__String_String endp

pulsec_pulse_io_Path_endsWithPath__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m173
    mov edx, trace_m173_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_io_Path_endsWithPath__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_endsWithPath__String_String_b1
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_b2
pulsec_pulse_io_Path_endsWithPath__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_epilogue
pulsec_pulse_io_Path_endsWithPath__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_b3
pulsec_pulse_io_Path_endsWithPath__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_io_Path_endsWithPath__String_String_b4
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_b5
pulsec_pulse_io_Path_endsWithPath__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_epilogue
pulsec_pulse_io_Path_endsWithPath__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_b6
pulsec_pulse_io_Path_endsWithPath__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_endsWithPath__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    lea rcx, msg24
    mov edx, msg24_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_io_Path_endsWithPath__String_String_epilogue
pulsec_pulse_io_Path_endsWithPath__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_io_Path_endsWithPath__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_io_Path_endsWithPath__String_String endp

pulsec_pulse_io_Path_commonParent__String_String proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m181
    mov edx, trace_m181_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_commonParent__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_io_Path_parts__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_io_Path_parts__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_commonParent__String_String_b1
pulsec_pulse_io_Path_commonParent__String_String_b1:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je Path_commonParent_vd4_14_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd4_14_type
    cmp eax, 6
    je Path_commonParent_vd4_14_assign_ok
    cmp eax, 9
    je Path_commonParent_vd4_14_assign_ok
    jmp Path_commonParent_vd4_14_type
Path_commonParent_vd4_14_assign_ok:
    cmp eax, 6
    je Path_commonParent_vd4_14_ovr0
    cmp eax, 9
    je Path_commonParent_vd4_14_ovr1
    jmp Path_commonParent_vd4_14_default
Path_commonParent_vd4_14_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_commonParent_vd4_14_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setl al
    movzx eax, al
    test rax, rax
    jne Path_commonParent_ternary_then_4_21
    mov eax, 0
    jmp Path_commonParent_ternary_done_4_21
Path_commonParent_ternary_then_4_21:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je Path_commonParent_vd4_19_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd4_19_type
    cmp eax, 6
    je Path_commonParent_vd4_19_assign_ok
    cmp eax, 9
    je Path_commonParent_vd4_19_assign_ok
    jmp Path_commonParent_vd4_19_type
Path_commonParent_vd4_19_assign_ok:
    cmp eax, 6
    je Path_commonParent_vd4_19_ovr0
    cmp eax, 9
    je Path_commonParent_vd4_19_ovr1
    jmp Path_commonParent_vd4_19_default
Path_commonParent_vd4_19_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_commonParent_vd4_19_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    setl al
    movzx eax, al
Path_commonParent_ternary_done_4_21:
    test eax, eax
    jne pulsec_pulse_io_Path_commonParent__String_String_b2
    jmp pulsec_pulse_io_Path_commonParent__String_String_b3
pulsec_pulse_io_Path_commonParent__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    test rcx, rcx
    je Path_commonParent_vd5_25_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd5_25_type
    cmp eax, 6
    je Path_commonParent_vd5_25_assign_ok
    cmp eax, 9
    je Path_commonParent_vd5_25_assign_ok
    jmp Path_commonParent_vd5_25_type
Path_commonParent_vd5_25_assign_ok:
    cmp eax, 6
    je Path_commonParent_vd5_25_ovr0
    cmp eax, 9
    je Path_commonParent_vd5_25_ovr1
    jmp Path_commonParent_vd5_25_default
Path_commonParent_vd5_25_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_commonParent_vd5_25_done:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    test rcx, rcx
    je Path_commonParent_vd5_30_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd5_30_type
    cmp eax, 6
    je Path_commonParent_vd5_30_assign_ok
    cmp eax, 9
    je Path_commonParent_vd5_30_assign_ok
    jmp Path_commonParent_vd5_30_type
Path_commonParent_vd5_30_assign_ok:
    cmp eax, 6
    je Path_commonParent_vd5_30_ovr0
    cmp eax, 9
    je Path_commonParent_vd5_30_ovr1
    jmp Path_commonParent_vd5_30_default
Path_commonParent_vd5_30_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_commonParent_vd5_30_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_commonParent__String_String_b4
    jmp pulsec_pulse_io_Path_commonParent__String_String_b5
pulsec_pulse_io_Path_commonParent__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s9
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_io_Path_join__List
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_io_Path_commonParent__String_String_epilogue
pulsec_pulse_io_Path_commonParent__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_commonParent__String_String_b3
pulsec_pulse_io_Path_commonParent__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_commonParent__String_String_b6
pulsec_pulse_io_Path_commonParent__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    test rcx, rcx
    je Path_commonParent_vd7_38_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd7_38_type
    cmp eax, 6
    je Path_commonParent_vd7_38_assign_ok
    cmp eax, 9
    je Path_commonParent_vd7_38_assign_ok
    jmp Path_commonParent_vd7_38_type
Path_commonParent_vd7_38_assign_ok:
    cmp eax, 6
    je Path_commonParent_vd7_38_ovr0
    cmp eax, 9
    je Path_commonParent_vd7_38_ovr1
    jmp Path_commonParent_vd7_38_default
Path_commonParent_vd7_38_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_commonParent_vd7_38_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_io_Path_commonParent__String_String_vd_stmt_6_7_0_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_pulse_io_Path_commonParent__String_String_vd_stmt_6_7_0_done
pulsec_pulse_io_Path_commonParent__String_String_vd_stmt_6_7_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_io_Path_commonParent__String_String_vd_stmt_6_7_0_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_io_Path_commonParent__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_commonParent__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_commonParent__String_String_b1
pulsec_pulse_io_Path_commonParent__String_String_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
pulsec_pulse_io_Path_commonParent__String_String_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_io_Path_commonParent__String_String endp

pulsec_pulse_io_Path_childPath__String_String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m192
    mov edx, trace_m192_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_childPath__String_String_b0:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s0
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s1
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_pulse_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    call pulsec_pulse_io_Path_startsWithPath__String_String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_childPath__String_String_b1
    jmp pulsec_pulse_io_Path_childPath__String_String_b2
pulsec_pulse_io_Path_childPath__String_String_b1:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s3
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg25
    mov edx, msg25_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_childPath__String_String_epilogue
pulsec_pulse_io_Path_childPath__String_String_b2:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s2
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_childPath__String_String_b3
pulsec_pulse_io_Path_childPath__String_String_b3:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne pulsec_pulse_io_Path_childPath__String_String_b4
    jmp pulsec_pulse_io_Path_childPath__String_String_b5
pulsec_pulse_io_Path_childPath__String_String_b4:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s5
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg26
    mov edx, msg26_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_childPath__String_String_epilogue
pulsec_pulse_io_Path_childPath__String_String_b5:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s4
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_childPath__String_String_b6
pulsec_pulse_io_Path_childPath__String_String_b6:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_childPath__String_String_b7
    jmp pulsec_pulse_io_Path_childPath__String_String_b8
pulsec_pulse_io_Path_childPath__String_String_b7:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s7
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_childPath__String_String_epilogue
pulsec_pulse_io_Path_childPath__String_String_b8:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s6
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_childPath__String_String_b9
pulsec_pulse_io_Path_childPath__String_String_b9:
    lea rcx, pulsec_pulse_io_Path_childPath__String_String_trace_s8
    mov edx, pulsec_pulse_io_Path_childPath__String_String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_io_Path_childPath__String_String_epilogue
pulsec_pulse_io_Path_childPath__String_String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_io_Path_childPath__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_io_Path_childPath__String_String endp

pulsec_pulse_io_Path_joinNormalizedParts__List proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m202
    mov edx, trace_m202_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_io_Path_joinNormalizedParts__List_b0:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s0
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg27
    mov edx, msg27_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s1
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b1
pulsec_pulse_io_Path_joinNormalizedParts__List_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je Path_joinNormalizedParts_vd2_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_joinNormalizedParts_vd2_5_type
    cmp eax, 6
    je Path_joinNormalizedParts_vd2_5_assign_ok
    cmp eax, 9
    je Path_joinNormalizedParts_vd2_5_assign_ok
    jmp Path_joinNormalizedParts_vd2_5_type
Path_joinNormalizedParts_vd2_5_assign_ok:
    cmp eax, 6
    je Path_joinNormalizedParts_vd2_5_ovr0
    cmp eax, 9
    je Path_joinNormalizedParts_vd2_5_ovr1
    jmp Path_joinNormalizedParts_vd2_5_default
Path_joinNormalizedParts_vd2_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_joinNormalizedParts_vd2_5_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_joinNormalizedParts__List_b2
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b3
pulsec_pulse_io_Path_joinNormalizedParts__List_b2:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s3
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je Path_joinNormalizedParts_vd3_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Path_joinNormalizedParts_vd3_10_type
    cmp eax, 6
    je Path_joinNormalizedParts_vd3_10_assign_ok
    cmp eax, 9
    je Path_joinNormalizedParts_vd3_10_assign_ok
    jmp Path_joinNormalizedParts_vd3_10_type
Path_joinNormalizedParts_vd3_10_assign_ok:
    cmp eax, 6
    je Path_joinNormalizedParts_vd3_10_ovr0
    cmp eax, 9
    je Path_joinNormalizedParts_vd3_10_ovr1
    jmp Path_joinNormalizedParts_vd3_10_default
Path_joinNormalizedParts_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_List_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Path_joinNormalizedParts_vd3_10_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne Path_joinNormalizedParts_ternary_then_4_19
    mov eax, 0
    jmp Path_joinNormalizedParts_ternary_done_4_19
Path_joinNormalizedParts_ternary_then_4_19:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_joinNormalizedParts_ternary_done_4_19:
    test eax, eax
    jne pulsec_pulse_io_Path_joinNormalizedParts__List_b4
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b5
pulsec_pulse_io_Path_joinNormalizedParts__List_b3:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s9
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_epilogue
pulsec_pulse_io_Path_joinNormalizedParts__List_b4:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_io_Path_joinNormalizedParts__List_b7
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b8
pulsec_pulse_io_Path_joinNormalizedParts__List_b5:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b6
pulsec_pulse_io_Path_joinNormalizedParts__List_b6:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s8
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b1
pulsec_pulse_io_Path_joinNormalizedParts__List_b7:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s6
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b9
pulsec_pulse_io_Path_joinNormalizedParts__List_b8:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s7
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+208], rax
    lea rcx, msg28
    mov edx, msg28_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b9
pulsec_pulse_io_Path_joinNormalizedParts__List_b9:
    lea rcx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, pulsec_pulse_io_Path_joinNormalizedParts__List_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_joinNormalizedParts__List_b6
pulsec_pulse_io_Path_joinNormalizedParts__List_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_io_Path_joinNormalizedParts__List_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_io_Path_joinNormalizedParts__List endp

pulsec_pulse_io_Path_rootPrefix__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m213
    mov edx, trace_m213_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_io_Path_rootPrefix__String_b0:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s0
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    lea rcx, msg29
    mov edx, msg29_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    test eax, eax
    jne pulsec_pulse_io_Path_rootPrefix__String_b1
    jmp pulsec_pulse_io_Path_rootPrefix__String_b2
pulsec_pulse_io_Path_rootPrefix__String_b1:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s1
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_rootPrefix__String_epilogue
pulsec_pulse_io_Path_rootPrefix__String_b2:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s0
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_rootPrefix__String_b3
pulsec_pulse_io_Path_rootPrefix__String_b3:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s2
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    test eax, eax
    jne pulsec_pulse_io_Path_rootPrefix__String_b4
    jmp pulsec_pulse_io_Path_rootPrefix__String_b5
pulsec_pulse_io_Path_rootPrefix__String_b4:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s3
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov eax, 0
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov eax, 3
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_io_Path_rootPrefix__String_epilogue
pulsec_pulse_io_Path_rootPrefix__String_b5:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s2
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_rootPrefix__String_b6
pulsec_pulse_io_Path_rootPrefix__String_b6:
    lea rcx, pulsec_pulse_io_Path_rootPrefix__String_trace_s4
    mov edx, pulsec_pulse_io_Path_rootPrefix__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg31
    mov edx, msg31_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_io_Path_rootPrefix__String_epilogue
pulsec_pulse_io_Path_rootPrefix__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_io_Path_rootPrefix__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_io_Path_rootPrefix__String endp

pulsec_pulse_io_Path_hasWindowsDriveRoot__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m219
    mov edx, trace_m219_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b0:
    lea rcx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0
    mov edx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 3
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b1
    jmp pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b2
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b1:
    lea rcx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s1
    mov edx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_io_Path_hasWindowsDriveRoot__String_epilogue
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b2:
    lea rcx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0
    mov edx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b3
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_b3:
    lea rcx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s2
    mov edx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s3
    mov edx, pulsec_pulse_io_Path_hasWindowsDriveRoot__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_io_Path_isAsciiLetter__char
    and rax, 0FFFFFFFFh
    test rax, rax
    jne Path_hasWindowsDriveRoot_ternary_then_3_21
    mov eax, 0
    jmp Path_hasWindowsDriveRoot_ternary_done_3_21
Path_hasWindowsDriveRoot_ternary_then_3_21:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov eax, 1
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    mov eax, 58
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
Path_hasWindowsDriveRoot_ternary_done_3_21:
    test rax, rax
    jne Path_hasWindowsDriveRoot_ternary_then_3_28
    mov eax, 0
    jmp Path_hasWindowsDriveRoot_ternary_done_3_28
Path_hasWindowsDriveRoot_ternary_then_3_28:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov eax, 2
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, 47
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
Path_hasWindowsDriveRoot_ternary_done_3_28:
    jmp pulsec_pulse_io_Path_hasWindowsDriveRoot__String_epilogue
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_io_Path_hasWindowsDriveRoot__String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_io_Path_hasWindowsDriveRoot__String endp

pulsec_pulse_io_Path_isAsciiLetter__char proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m224
    mov edx, trace_m224_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_io_Path_isAsciiLetter__char_b0:
    lea rcx, pulsec_pulse_io_Path_isAsciiLetter__char_trace_s0
    mov edx, pulsec_pulse_io_Path_isAsciiLetter__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 97
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Path_isAsciiLetter_ternary_then_0_8
    mov eax, 0
    jmp Path_isAsciiLetter_ternary_done_0_8
Path_isAsciiLetter_ternary_then_0_8:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 122
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setle al
    movzx eax, al
Path_isAsciiLetter_ternary_done_0_8:
    test rax, rax
    jne Path_isAsciiLetter_ternary_then_0_17
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 65
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Path_isAsciiLetter_ternary_then_0_16
    mov eax, 0
    jmp Path_isAsciiLetter_ternary_done_0_16
Path_isAsciiLetter_ternary_then_0_16:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 90
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setle al
    movzx eax, al
Path_isAsciiLetter_ternary_done_0_16:
    jmp Path_isAsciiLetter_ternary_done_0_17
Path_isAsciiLetter_ternary_then_0_17:
    mov eax, 1
Path_isAsciiLetter_ternary_done_0_17:
    jmp pulsec_pulse_io_Path_isAsciiLetter__char_epilogue
pulsec_pulse_io_Path_isAsciiLetter__char_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_io_Path_isAsciiLetter__char_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_io_Path_isAsciiLetter__char endp

end
