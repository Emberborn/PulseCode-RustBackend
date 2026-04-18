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
extrn adenc_rt_stringFromBytes:proc
extrn adenc_rt_consoleWrite:proc
extrn adenc_rt_dispatchNullReceiverPanic:proc
extrn adenc_rt_dispatchInvalidTypePanic:proc
extrn adenc_rt_objectClassId:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_collections_ArrayList_add__String:proc
extrn adenc_aden_collections_ArrayList_get__int:proc
extrn adenc_aden_collections_ArrayList_isEmpty:proc
extrn adenc_aden_collections_ArrayList_remove__int:proc
extrn adenc_aden_collections_ArrayList_size:proc
extrn adenc_aden_collections_Collection_size:proc
extrn adenc_aden_collections_LinkedList_get__int:proc
extrn adenc_aden_collections_LinkedList_size:proc
extrn adenc_aden_collections_List_get__int:proc
extrn adenc_aden_lang_String_charAt__int:proc
extrn adenc_aden_lang_String_concat__String:proc
extrn adenc_aden_lang_String_endsWith__String:proc
extrn adenc_aden_lang_String_equals__Object:proc
extrn adenc_aden_lang_String_isEmpty:proc
extrn adenc_aden_lang_String_lastIndexOf__String:proc
extrn adenc_aden_lang_String_length:proc
extrn adenc_aden_lang_String_startsWith__String:proc
extrn adenc_aden_lang_String_substring__int:proc
extrn adenc_aden_lang_String_substring__int_int:proc
extrn adenc_aden_lang_String_valueOf__char:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MAX_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MAX_VALUE:proc


extrn adenc_aden_collections_ArrayList_ArrayList:proc
.data
written dq 0
adenc_objc_aden_io_Path dd 0
trace_m0 db "aden.io.Path.separator"
trace_m0_len equ 22
adenc_aden_io_Path_separator_trace_s0 db "aden.io.Path.separator(Path.aden:14)"
adenc_aden_io_Path_separator_trace_s0_len equ 36
trace_m2 db "aden.io.Path.normalize"
trace_m2_len equ 22
adenc_aden_io_Path_normalize__String_trace_s0 db "aden.io.Path.normalize(Path.aden:22)"
adenc_aden_io_Path_normalize__String_trace_s0_len equ 36
adenc_aden_io_Path_normalize__String_trace_s1 db "aden.io.Path.normalize(Path.aden:23)"
adenc_aden_io_Path_normalize__String_trace_s1_len equ 36
adenc_aden_io_Path_normalize__String_trace_s2 db "aden.io.Path.normalize(Path.aden:25)"
adenc_aden_io_Path_normalize__String_trace_s2_len equ 36
adenc_aden_io_Path_normalize__String_trace_s3 db "aden.io.Path.normalize(Path.aden:26)"
adenc_aden_io_Path_normalize__String_trace_s3_len equ 36
adenc_aden_io_Path_normalize__String_trace_s4 db "aden.io.Path.normalize(Path.aden:27)"
adenc_aden_io_Path_normalize__String_trace_s4_len equ 36
adenc_aden_io_Path_normalize__String_trace_s5 db "aden.io.Path.normalize(Path.aden:28)"
adenc_aden_io_Path_normalize__String_trace_s5_len equ 36
adenc_aden_io_Path_normalize__String_trace_s6 db "aden.io.Path.normalize(Path.aden:29)"
adenc_aden_io_Path_normalize__String_trace_s6_len equ 36
adenc_aden_io_Path_normalize__String_trace_s7 db "aden.io.Path.normalize(Path.aden:30)"
adenc_aden_io_Path_normalize__String_trace_s7_len equ 36
adenc_aden_io_Path_normalize__String_trace_s8 db "aden.io.Path.normalize(Path.aden:31)"
adenc_aden_io_Path_normalize__String_trace_s8_len equ 36
adenc_aden_io_Path_normalize__String_trace_s9 db "aden.io.Path.normalize(Path.aden:32)"
adenc_aden_io_Path_normalize__String_trace_s9_len equ 36
adenc_aden_io_Path_normalize__String_trace_s10 db "aden.io.Path.normalize(Path.aden:33)"
adenc_aden_io_Path_normalize__String_trace_s10_len equ 36
adenc_aden_io_Path_normalize__String_trace_s11 db "aden.io.Path.normalize(Path.aden:36)"
adenc_aden_io_Path_normalize__String_trace_s11_len equ 36
adenc_aden_io_Path_normalize__String_trace_s12 db "aden.io.Path.normalize(Path.aden:37)"
adenc_aden_io_Path_normalize__String_trace_s12_len equ 36
adenc_aden_io_Path_normalize__String_trace_s13 db "aden.io.Path.normalize(Path.aden:39)"
adenc_aden_io_Path_normalize__String_trace_s13_len equ 36
adenc_aden_io_Path_normalize__String_trace_s14 db "aden.io.Path.normalize(Path.aden:42)"
adenc_aden_io_Path_normalize__String_trace_s14_len equ 36
adenc_aden_io_Path_normalize__String_trace_s15 db "aden.io.Path.normalize(Path.aden:43)"
adenc_aden_io_Path_normalize__String_trace_s15_len equ 36
adenc_aden_io_Path_normalize__String_trace_s16 db "aden.io.Path.normalize(Path.aden:45)"
adenc_aden_io_Path_normalize__String_trace_s16_len equ 36
adenc_aden_io_Path_normalize__String_trace_s17 db "aden.io.Path.normalize(Path.aden:46)"
adenc_aden_io_Path_normalize__String_trace_s17_len equ 36
adenc_aden_io_Path_normalize__String_trace_s18 db "aden.io.Path.normalize(Path.aden:49)"
adenc_aden_io_Path_normalize__String_trace_s18_len equ 36
adenc_aden_io_Path_normalize__String_trace_s19 db "aden.io.Path.normalize(Path.aden:50)"
adenc_aden_io_Path_normalize__String_trace_s19_len equ 36
adenc_aden_io_Path_normalize__String_trace_s20 db "aden.io.Path.normalize(Path.aden:51)"
adenc_aden_io_Path_normalize__String_trace_s20_len equ 36
adenc_aden_io_Path_normalize__String_trace_s21 db "aden.io.Path.normalize(Path.aden:52)"
adenc_aden_io_Path_normalize__String_trace_s21_len equ 36
adenc_aden_io_Path_normalize__String_trace_s22 db "aden.io.Path.normalize(Path.aden:53)"
adenc_aden_io_Path_normalize__String_trace_s22_len equ 36
adenc_aden_io_Path_normalize__String_trace_s23 db "aden.io.Path.normalize(Path.aden:54)"
adenc_aden_io_Path_normalize__String_trace_s23_len equ 36
adenc_aden_io_Path_normalize__String_trace_s24 db "aden.io.Path.normalize(Path.aden:55)"
adenc_aden_io_Path_normalize__String_trace_s24_len equ 36
adenc_aden_io_Path_normalize__String_trace_s25 db "aden.io.Path.normalize(Path.aden:56)"
adenc_aden_io_Path_normalize__String_trace_s25_len equ 36
adenc_aden_io_Path_normalize__String_trace_s26 db "aden.io.Path.normalize(Path.aden:57)"
adenc_aden_io_Path_normalize__String_trace_s26_len equ 36
adenc_aden_io_Path_normalize__String_trace_s27 db "aden.io.Path.normalize(Path.aden:58)"
adenc_aden_io_Path_normalize__String_trace_s27_len equ 36
adenc_aden_io_Path_normalize__String_trace_s28 db "aden.io.Path.normalize(Path.aden:60)"
adenc_aden_io_Path_normalize__String_trace_s28_len equ 36
adenc_aden_io_Path_normalize__String_trace_s29 db "aden.io.Path.normalize(Path.aden:61)"
adenc_aden_io_Path_normalize__String_trace_s29_len equ 36
adenc_aden_io_Path_normalize__String_trace_s30 db "aden.io.Path.normalize(Path.aden:62)"
adenc_aden_io_Path_normalize__String_trace_s30_len equ 36
adenc_aden_io_Path_normalize__String_trace_s31 db "aden.io.Path.normalize(Path.aden:63)"
adenc_aden_io_Path_normalize__String_trace_s31_len equ 36
adenc_aden_io_Path_normalize__String_trace_s32 db "aden.io.Path.normalize(Path.aden:64)"
adenc_aden_io_Path_normalize__String_trace_s32_len equ 36
adenc_aden_io_Path_normalize__String_trace_s33 db "aden.io.Path.normalize(Path.aden:66)"
adenc_aden_io_Path_normalize__String_trace_s33_len equ 36
adenc_aden_io_Path_normalize__String_trace_s34 db "aden.io.Path.normalize(Path.aden:67)"
adenc_aden_io_Path_normalize__String_trace_s34_len equ 36
adenc_aden_io_Path_normalize__String_trace_s35 db "aden.io.Path.normalize(Path.aden:69)"
adenc_aden_io_Path_normalize__String_trace_s35_len equ 36
adenc_aden_io_Path_normalize__String_trace_s36 db "aden.io.Path.normalize(Path.aden:70)"
adenc_aden_io_Path_normalize__String_trace_s36_len equ 36
adenc_aden_io_Path_normalize__String_trace_s37 db "aden.io.Path.normalize(Path.aden:73)"
adenc_aden_io_Path_normalize__String_trace_s37_len equ 36
adenc_aden_io_Path_normalize__String_trace_s38 db "aden.io.Path.normalize(Path.aden:74)"
adenc_aden_io_Path_normalize__String_trace_s38_len equ 36
adenc_aden_io_Path_normalize__String_trace_s39 db "aden.io.Path.normalize(Path.aden:75)"
adenc_aden_io_Path_normalize__String_trace_s39_len equ 36
adenc_aden_io_Path_normalize__String_trace_s40 db "aden.io.Path.normalize(Path.aden:76)"
adenc_aden_io_Path_normalize__String_trace_s40_len equ 36
adenc_aden_io_Path_normalize__String_trace_s41 db "aden.io.Path.normalize(Path.aden:78)"
adenc_aden_io_Path_normalize__String_trace_s41_len equ 36
adenc_aden_io_Path_normalize__String_trace_s42 db "aden.io.Path.normalize(Path.aden:80)"
adenc_aden_io_Path_normalize__String_trace_s42_len equ 36
trace_m46 db "aden.io.Path.combine"
trace_m46_len equ 20
adenc_aden_io_Path_combine__String_String_trace_s0 db "aden.io.Path.combine(Path.aden:88)"
adenc_aden_io_Path_combine__String_String_trace_s0_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s1 db "aden.io.Path.combine(Path.aden:89)"
adenc_aden_io_Path_combine__String_String_trace_s1_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s2 db "aden.io.Path.combine(Path.aden:90)"
adenc_aden_io_Path_combine__String_String_trace_s2_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s3 db "aden.io.Path.combine(Path.aden:91)"
adenc_aden_io_Path_combine__String_String_trace_s3_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s4 db "aden.io.Path.combine(Path.aden:93)"
adenc_aden_io_Path_combine__String_String_trace_s4_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s5 db "aden.io.Path.combine(Path.aden:94)"
adenc_aden_io_Path_combine__String_String_trace_s5_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s6 db "aden.io.Path.combine(Path.aden:96)"
adenc_aden_io_Path_combine__String_String_trace_s6_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s7 db "aden.io.Path.combine(Path.aden:97)"
adenc_aden_io_Path_combine__String_String_trace_s7_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s8 db "aden.io.Path.combine(Path.aden:99)"
adenc_aden_io_Path_combine__String_String_trace_s8_len equ 34
adenc_aden_io_Path_combine__String_String_trace_s9 db "aden.io.Path.combine(Path.aden:100)"
adenc_aden_io_Path_combine__String_String_trace_s9_len equ 35
adenc_aden_io_Path_combine__String_String_trace_s10 db "aden.io.Path.combine(Path.aden:102)"
adenc_aden_io_Path_combine__String_String_trace_s10_len equ 35
adenc_aden_io_Path_combine__String_String_trace_s11 db "aden.io.Path.combine(Path.aden:103)"
adenc_aden_io_Path_combine__String_String_trace_s11_len equ 35
adenc_aden_io_Path_combine__String_String_trace_s12 db "aden.io.Path.combine(Path.aden:105)"
adenc_aden_io_Path_combine__String_String_trace_s12_len equ 35
adenc_aden_io_Path_combine__String_String_trace_s13 db "aden.io.Path.combine(Path.aden:106)"
adenc_aden_io_Path_combine__String_String_trace_s13_len equ 35
adenc_aden_io_Path_combine__String_String_trace_s14 db "aden.io.Path.combine(Path.aden:108)"
adenc_aden_io_Path_combine__String_String_trace_s14_len equ 35
trace_m62 db "aden.io.Path.resolve"
trace_m62_len equ 20
adenc_aden_io_Path_resolve__String_String_trace_s0 db "aden.io.Path.resolve(Path.aden:116)"
adenc_aden_io_Path_resolve__String_String_trace_s0_len equ 35
trace_m64 db "aden.io.Path.fileName"
trace_m64_len equ 21
adenc_aden_io_Path_fileName__String_trace_s0 db "aden.io.Path.fileName(Path.aden:124)"
adenc_aden_io_Path_fileName__String_trace_s0_len equ 36
adenc_aden_io_Path_fileName__String_trace_s1 db "aden.io.Path.fileName(Path.aden:125)"
adenc_aden_io_Path_fileName__String_trace_s1_len equ 36
adenc_aden_io_Path_fileName__String_trace_s2 db "aden.io.Path.fileName(Path.aden:126)"
adenc_aden_io_Path_fileName__String_trace_s2_len equ 36
adenc_aden_io_Path_fileName__String_trace_s3 db "aden.io.Path.fileName(Path.aden:127)"
adenc_aden_io_Path_fileName__String_trace_s3_len equ 36
adenc_aden_io_Path_fileName__String_trace_s4 db "aden.io.Path.fileName(Path.aden:129)"
adenc_aden_io_Path_fileName__String_trace_s4_len equ 36
trace_m70 db "aden.io.Path.parent"
trace_m70_len equ 19
adenc_aden_io_Path_parent__String_trace_s0 db "aden.io.Path.parent(Path.aden:137)"
adenc_aden_io_Path_parent__String_trace_s0_len equ 34
adenc_aden_io_Path_parent__String_trace_s1 db "aden.io.Path.parent(Path.aden:138)"
adenc_aden_io_Path_parent__String_trace_s1_len equ 34
adenc_aden_io_Path_parent__String_trace_s2 db "aden.io.Path.parent(Path.aden:139)"
adenc_aden_io_Path_parent__String_trace_s2_len equ 34
adenc_aden_io_Path_parent__String_trace_s3 db "aden.io.Path.parent(Path.aden:140)"
adenc_aden_io_Path_parent__String_trace_s3_len equ 34
adenc_aden_io_Path_parent__String_trace_s4 db "aden.io.Path.parent(Path.aden:141)"
adenc_aden_io_Path_parent__String_trace_s4_len equ 34
adenc_aden_io_Path_parent__String_trace_s5 db "aden.io.Path.parent(Path.aden:143)"
adenc_aden_io_Path_parent__String_trace_s5_len equ 34
adenc_aden_io_Path_parent__String_trace_s6 db "aden.io.Path.parent(Path.aden:144)"
adenc_aden_io_Path_parent__String_trace_s6_len equ 34
adenc_aden_io_Path_parent__String_trace_s7 db "aden.io.Path.parent(Path.aden:145)"
adenc_aden_io_Path_parent__String_trace_s7_len equ 34
adenc_aden_io_Path_parent__String_trace_s8 db "aden.io.Path.parent(Path.aden:147)"
adenc_aden_io_Path_parent__String_trace_s8_len equ 34
adenc_aden_io_Path_parent__String_trace_s9 db "aden.io.Path.parent(Path.aden:148)"
adenc_aden_io_Path_parent__String_trace_s9_len equ 34
adenc_aden_io_Path_parent__String_trace_s10 db "aden.io.Path.parent(Path.aden:150)"
adenc_aden_io_Path_parent__String_trace_s10_len equ 34
adenc_aden_io_Path_parent__String_trace_s11 db "aden.io.Path.parent(Path.aden:151)"
adenc_aden_io_Path_parent__String_trace_s11_len equ 34
adenc_aden_io_Path_parent__String_trace_s12 db "aden.io.Path.parent(Path.aden:153)"
adenc_aden_io_Path_parent__String_trace_s12_len equ 34
trace_m84 db "aden.io.Path.extension"
trace_m84_len equ 22
adenc_aden_io_Path_extension__String_trace_s0 db "aden.io.Path.extension(Path.aden:161)"
adenc_aden_io_Path_extension__String_trace_s0_len equ 37
adenc_aden_io_Path_extension__String_trace_s1 db "aden.io.Path.extension(Path.aden:162)"
adenc_aden_io_Path_extension__String_trace_s1_len equ 37
adenc_aden_io_Path_extension__String_trace_s2 db "aden.io.Path.extension(Path.aden:163)"
adenc_aden_io_Path_extension__String_trace_s2_len equ 37
adenc_aden_io_Path_extension__String_trace_s3 db "aden.io.Path.extension(Path.aden:164)"
adenc_aden_io_Path_extension__String_trace_s3_len equ 37
adenc_aden_io_Path_extension__String_trace_s4 db "aden.io.Path.extension(Path.aden:166)"
adenc_aden_io_Path_extension__String_trace_s4_len equ 37
trace_m90 db "aden.io.Path.hasExtension"
trace_m90_len equ 25
adenc_aden_io_Path_hasExtension__String_trace_s0 db "aden.io.Path.hasExtension(Path.aden:174)"
adenc_aden_io_Path_hasExtension__String_trace_s0_len equ 40
trace_m92 db "aden.io.Path.stem"
trace_m92_len equ 17
adenc_aden_io_Path_stem__String_trace_s0 db "aden.io.Path.stem(Path.aden:182)"
adenc_aden_io_Path_stem__String_trace_s0_len equ 32
adenc_aden_io_Path_stem__String_trace_s1 db "aden.io.Path.stem(Path.aden:183)"
adenc_aden_io_Path_stem__String_trace_s1_len equ 32
adenc_aden_io_Path_stem__String_trace_s2 db "aden.io.Path.stem(Path.aden:184)"
adenc_aden_io_Path_stem__String_trace_s2_len equ 32
adenc_aden_io_Path_stem__String_trace_s3 db "aden.io.Path.stem(Path.aden:185)"
adenc_aden_io_Path_stem__String_trace_s3_len equ 32
adenc_aden_io_Path_stem__String_trace_s4 db "aden.io.Path.stem(Path.aden:187)"
adenc_aden_io_Path_stem__String_trace_s4_len equ 32
trace_m98 db "aden.io.Path.resolveSibling"
trace_m98_len equ 27
adenc_aden_io_Path_resolveSibling__String_String_trace_s0 db "aden.io.Path.resolveSibling(Path.aden:195)"
adenc_aden_io_Path_resolveSibling__String_String_trace_s0_len equ 42
adenc_aden_io_Path_resolveSibling__String_String_trace_s1 db "aden.io.Path.resolveSibling(Path.aden:196)"
adenc_aden_io_Path_resolveSibling__String_String_trace_s1_len equ 42
adenc_aden_io_Path_resolveSibling__String_String_trace_s2 db "aden.io.Path.resolveSibling(Path.aden:197)"
adenc_aden_io_Path_resolveSibling__String_String_trace_s2_len equ 42
adenc_aden_io_Path_resolveSibling__String_String_trace_s3 db "aden.io.Path.resolveSibling(Path.aden:199)"
adenc_aden_io_Path_resolveSibling__String_String_trace_s3_len equ 42
trace_m103 db "aden.io.Path.changeFileName"
trace_m103_len equ 27
adenc_aden_io_Path_changeFileName__String_String_trace_s0 db "aden.io.Path.changeFileName(Path.aden:207)"
adenc_aden_io_Path_changeFileName__String_String_trace_s0_len equ 42
adenc_aden_io_Path_changeFileName__String_String_trace_s1 db "aden.io.Path.changeFileName(Path.aden:208)"
adenc_aden_io_Path_changeFileName__String_String_trace_s1_len equ 42
adenc_aden_io_Path_changeFileName__String_String_trace_s2 db "aden.io.Path.changeFileName(Path.aden:209)"
adenc_aden_io_Path_changeFileName__String_String_trace_s2_len equ 42
adenc_aden_io_Path_changeFileName__String_String_trace_s3 db "aden.io.Path.changeFileName(Path.aden:211)"
adenc_aden_io_Path_changeFileName__String_String_trace_s3_len equ 42
trace_m108 db "aden.io.Path.isAbsolute"
trace_m108_len equ 23
adenc_aden_io_Path_isAbsolute__String_trace_s0 db "aden.io.Path.isAbsolute(Path.aden:219)"
adenc_aden_io_Path_isAbsolute__String_trace_s0_len equ 38
adenc_aden_io_Path_isAbsolute__String_trace_s1 db "aden.io.Path.isAbsolute(Path.aden:220)"
adenc_aden_io_Path_isAbsolute__String_trace_s1_len equ 38
trace_m111 db "aden.io.Path.root"
trace_m111_len equ 17
adenc_aden_io_Path_root__String_trace_s0 db "aden.io.Path.root(Path.aden:228)"
adenc_aden_io_Path_root__String_trace_s0_len equ 32
trace_m113 db "aden.io.Path.relativeTo"
trace_m113_len equ 23
adenc_aden_io_Path_relativeTo__String_String_trace_s0 db "aden.io.Path.relativeTo(Path.aden:236)"
adenc_aden_io_Path_relativeTo__String_String_trace_s0_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s1 db "aden.io.Path.relativeTo(Path.aden:237)"
adenc_aden_io_Path_relativeTo__String_String_trace_s1_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s2 db "aden.io.Path.relativeTo(Path.aden:238)"
adenc_aden_io_Path_relativeTo__String_String_trace_s2_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s3 db "aden.io.Path.relativeTo(Path.aden:239)"
adenc_aden_io_Path_relativeTo__String_String_trace_s3_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s4 db "aden.io.Path.relativeTo(Path.aden:241)"
adenc_aden_io_Path_relativeTo__String_String_trace_s4_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s5 db "aden.io.Path.relativeTo(Path.aden:242)"
adenc_aden_io_Path_relativeTo__String_String_trace_s5_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s6 db "aden.io.Path.relativeTo(Path.aden:244)"
adenc_aden_io_Path_relativeTo__String_String_trace_s6_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s7 db "aden.io.Path.relativeTo(Path.aden:245)"
adenc_aden_io_Path_relativeTo__String_String_trace_s7_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s8 db "aden.io.Path.relativeTo(Path.aden:246)"
adenc_aden_io_Path_relativeTo__String_String_trace_s8_len equ 38
adenc_aden_io_Path_relativeTo__String_String_trace_s9 db "aden.io.Path.relativeTo(Path.aden:248)"
adenc_aden_io_Path_relativeTo__String_String_trace_s9_len equ 38
trace_m124 db "aden.io.Path.changeExtension"
trace_m124_len equ 28
adenc_aden_io_Path_changeExtension__String_String_trace_s0 db "aden.io.Path.changeExtension(Path.aden:256)"
adenc_aden_io_Path_changeExtension__String_String_trace_s0_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s1 db "aden.io.Path.changeExtension(Path.aden:257)"
adenc_aden_io_Path_changeExtension__String_String_trace_s1_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s2 db "aden.io.Path.changeExtension(Path.aden:258)"
adenc_aden_io_Path_changeExtension__String_String_trace_s2_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s3 db "aden.io.Path.changeExtension(Path.aden:259)"
adenc_aden_io_Path_changeExtension__String_String_trace_s3_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s4 db "aden.io.Path.changeExtension(Path.aden:260)"
adenc_aden_io_Path_changeExtension__String_String_trace_s4_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s5 db "aden.io.Path.changeExtension(Path.aden:261)"
adenc_aden_io_Path_changeExtension__String_String_trace_s5_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s6 db "aden.io.Path.changeExtension(Path.aden:263)"
adenc_aden_io_Path_changeExtension__String_String_trace_s6_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s7 db "aden.io.Path.changeExtension(Path.aden:264)"
adenc_aden_io_Path_changeExtension__String_String_trace_s7_len equ 43
adenc_aden_io_Path_changeExtension__String_String_trace_s8 db "aden.io.Path.changeExtension(Path.aden:266)"
adenc_aden_io_Path_changeExtension__String_String_trace_s8_len equ 43
trace_m134 db "aden.io.Path.parts"
trace_m134_len equ 18
adenc_aden_io_Path_parts__String_trace_s0 db "aden.io.Path.parts(Path.aden:274)"
adenc_aden_io_Path_parts__String_trace_s0_len equ 33
adenc_aden_io_Path_parts__String_trace_s1 db "aden.io.Path.parts(Path.aden:275)"
adenc_aden_io_Path_parts__String_trace_s1_len equ 33
trace_m137 db "aden.io.Path.normalizedParts"
trace_m137_len equ 28
adenc_aden_io_Path_normalizedParts__String_trace_s0 db "aden.io.Path.normalizedParts(Path.aden:279)"
adenc_aden_io_Path_normalizedParts__String_trace_s0_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s1 db "aden.io.Path.normalizedParts(Path.aden:280)"
adenc_aden_io_Path_normalizedParts__String_trace_s1_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s2 db "aden.io.Path.normalizedParts(Path.aden:281)"
adenc_aden_io_Path_normalizedParts__String_trace_s2_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s3 db "aden.io.Path.normalizedParts(Path.aden:282)"
adenc_aden_io_Path_normalizedParts__String_trace_s3_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s4 db "aden.io.Path.normalizedParts(Path.aden:284)"
adenc_aden_io_Path_normalizedParts__String_trace_s4_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s5 db "aden.io.Path.normalizedParts(Path.aden:285)"
adenc_aden_io_Path_normalizedParts__String_trace_s5_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s6 db "aden.io.Path.normalizedParts(Path.aden:286)"
adenc_aden_io_Path_normalizedParts__String_trace_s6_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s7 db "aden.io.Path.normalizedParts(Path.aden:287)"
adenc_aden_io_Path_normalizedParts__String_trace_s7_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s8 db "aden.io.Path.normalizedParts(Path.aden:288)"
adenc_aden_io_Path_normalizedParts__String_trace_s8_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s9 db "aden.io.Path.normalizedParts(Path.aden:290)"
adenc_aden_io_Path_normalizedParts__String_trace_s9_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s10 db "aden.io.Path.normalizedParts(Path.aden:292)"
adenc_aden_io_Path_normalizedParts__String_trace_s10_len equ 43
adenc_aden_io_Path_normalizedParts__String_trace_s11 db "aden.io.Path.normalizedParts(Path.aden:294)"
adenc_aden_io_Path_normalizedParts__String_trace_s11_len equ 43
trace_m150 db "aden.io.Path.join"
trace_m150_len equ 17
adenc_aden_io_Path_join__List_trace_s0 db "aden.io.Path.join(Path.aden:302)"
adenc_aden_io_Path_join__List_trace_s0_len equ 32
adenc_aden_io_Path_join__List_trace_s1 db "aden.io.Path.join(Path.aden:303)"
adenc_aden_io_Path_join__List_trace_s1_len equ 32
adenc_aden_io_Path_join__List_trace_s2 db "aden.io.Path.join(Path.aden:304)"
adenc_aden_io_Path_join__List_trace_s2_len equ 32
adenc_aden_io_Path_join__List_trace_s3 db "aden.io.Path.join(Path.aden:305)"
adenc_aden_io_Path_join__List_trace_s3_len equ 32
adenc_aden_io_Path_join__List_trace_s4 db "aden.io.Path.join(Path.aden:306)"
adenc_aden_io_Path_join__List_trace_s4_len equ 32
adenc_aden_io_Path_join__List_trace_s5 db "aden.io.Path.join(Path.aden:307)"
adenc_aden_io_Path_join__List_trace_s5_len equ 32
adenc_aden_io_Path_join__List_trace_s6 db "aden.io.Path.join(Path.aden:308)"
adenc_aden_io_Path_join__List_trace_s6_len equ 32
adenc_aden_io_Path_join__List_trace_s7 db "aden.io.Path.join(Path.aden:309)"
adenc_aden_io_Path_join__List_trace_s7_len equ 32
adenc_aden_io_Path_join__List_trace_s8 db "aden.io.Path.join(Path.aden:310)"
adenc_aden_io_Path_join__List_trace_s8_len equ 32
adenc_aden_io_Path_join__List_trace_s9 db "aden.io.Path.join(Path.aden:311)"
adenc_aden_io_Path_join__List_trace_s9_len equ 32
adenc_aden_io_Path_join__List_trace_s10 db "aden.io.Path.join(Path.aden:314)"
adenc_aden_io_Path_join__List_trace_s10_len equ 32
adenc_aden_io_Path_join__List_trace_s11 db "aden.io.Path.join(Path.aden:316)"
adenc_aden_io_Path_join__List_trace_s11_len equ 32
trace_m163 db "aden.io.Path.depth"
trace_m163_len equ 18
adenc_aden_io_Path_depth__String_trace_s0 db "aden.io.Path.depth(Path.aden:324)"
adenc_aden_io_Path_depth__String_trace_s0_len equ 33
trace_m165 db "aden.io.Path.startsWithPath"
trace_m165_len equ 27
adenc_aden_io_Path_startsWithPath__String_String_trace_s0 db "aden.io.Path.startsWithPath(Path.aden:332)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s0_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s1 db "aden.io.Path.startsWithPath(Path.aden:333)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s1_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s2 db "aden.io.Path.startsWithPath(Path.aden:334)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s2_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s3 db "aden.io.Path.startsWithPath(Path.aden:335)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s3_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s4 db "aden.io.Path.startsWithPath(Path.aden:337)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s4_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s5 db "aden.io.Path.startsWithPath(Path.aden:338)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s5_len equ 42
adenc_aden_io_Path_startsWithPath__String_String_trace_s6 db "aden.io.Path.startsWithPath(Path.aden:340)"
adenc_aden_io_Path_startsWithPath__String_String_trace_s6_len equ 42
trace_m173 db "aden.io.Path.endsWithPath"
trace_m173_len equ 25
adenc_aden_io_Path_endsWithPath__String_String_trace_s0 db "aden.io.Path.endsWithPath(Path.aden:348)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s0_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s1 db "aden.io.Path.endsWithPath(Path.aden:349)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s1_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s2 db "aden.io.Path.endsWithPath(Path.aden:350)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s2_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s3 db "aden.io.Path.endsWithPath(Path.aden:351)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s3_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s4 db "aden.io.Path.endsWithPath(Path.aden:353)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s4_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s5 db "aden.io.Path.endsWithPath(Path.aden:354)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s5_len equ 40
adenc_aden_io_Path_endsWithPath__String_String_trace_s6 db "aden.io.Path.endsWithPath(Path.aden:356)"
adenc_aden_io_Path_endsWithPath__String_String_trace_s6_len equ 40
trace_m181 db "aden.io.Path.commonParent"
trace_m181_len equ 25
adenc_aden_io_Path_commonParent__String_String_trace_s0 db "aden.io.Path.commonParent(Path.aden:364)"
adenc_aden_io_Path_commonParent__String_String_trace_s0_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s1 db "aden.io.Path.commonParent(Path.aden:365)"
adenc_aden_io_Path_commonParent__String_String_trace_s1_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s2 db "aden.io.Path.commonParent(Path.aden:366)"
adenc_aden_io_Path_commonParent__String_String_trace_s2_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s3 db "aden.io.Path.commonParent(Path.aden:367)"
adenc_aden_io_Path_commonParent__String_String_trace_s3_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s4 db "aden.io.Path.commonParent(Path.aden:368)"
adenc_aden_io_Path_commonParent__String_String_trace_s4_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s5 db "aden.io.Path.commonParent(Path.aden:369)"
adenc_aden_io_Path_commonParent__String_String_trace_s5_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s6 db "aden.io.Path.commonParent(Path.aden:370)"
adenc_aden_io_Path_commonParent__String_String_trace_s6_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s7 db "aden.io.Path.commonParent(Path.aden:372)"
adenc_aden_io_Path_commonParent__String_String_trace_s7_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s8 db "aden.io.Path.commonParent(Path.aden:373)"
adenc_aden_io_Path_commonParent__String_String_trace_s8_len equ 40
adenc_aden_io_Path_commonParent__String_String_trace_s9 db "aden.io.Path.commonParent(Path.aden:375)"
adenc_aden_io_Path_commonParent__String_String_trace_s9_len equ 40
trace_m192 db "aden.io.Path.childPath"
trace_m192_len equ 22
adenc_aden_io_Path_childPath__String_String_trace_s0 db "aden.io.Path.childPath(Path.aden:383)"
adenc_aden_io_Path_childPath__String_String_trace_s0_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s1 db "aden.io.Path.childPath(Path.aden:384)"
adenc_aden_io_Path_childPath__String_String_trace_s1_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s2 db "aden.io.Path.childPath(Path.aden:385)"
adenc_aden_io_Path_childPath__String_String_trace_s2_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s3 db "aden.io.Path.childPath(Path.aden:386)"
adenc_aden_io_Path_childPath__String_String_trace_s3_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s4 db "aden.io.Path.childPath(Path.aden:388)"
adenc_aden_io_Path_childPath__String_String_trace_s4_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s5 db "aden.io.Path.childPath(Path.aden:389)"
adenc_aden_io_Path_childPath__String_String_trace_s5_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s6 db "aden.io.Path.childPath(Path.aden:391)"
adenc_aden_io_Path_childPath__String_String_trace_s6_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s7 db "aden.io.Path.childPath(Path.aden:392)"
adenc_aden_io_Path_childPath__String_String_trace_s7_len equ 37
adenc_aden_io_Path_childPath__String_String_trace_s8 db "aden.io.Path.childPath(Path.aden:394)"
adenc_aden_io_Path_childPath__String_String_trace_s8_len equ 37
trace_m202 db "aden.io.Path.joinNormalizedParts"
trace_m202_len equ 32
adenc_aden_io_Path_joinNormalizedParts__List_trace_s0 db "aden.io.Path.joinNormalizedParts(Path.aden:398)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s0_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s1 db "aden.io.Path.joinNormalizedParts(Path.aden:399)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s1_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s2 db "aden.io.Path.joinNormalizedParts(Path.aden:400)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s2_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s3 db "aden.io.Path.joinNormalizedParts(Path.aden:401)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s3_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s4 db "aden.io.Path.joinNormalizedParts(Path.aden:402)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s4_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s5 db "aden.io.Path.joinNormalizedParts(Path.aden:403)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s5_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s6 db "aden.io.Path.joinNormalizedParts(Path.aden:404)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s6_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s7 db "aden.io.Path.joinNormalizedParts(Path.aden:406)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s7_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s8 db "aden.io.Path.joinNormalizedParts(Path.aden:409)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s8_len equ 47
adenc_aden_io_Path_joinNormalizedParts__List_trace_s9 db "aden.io.Path.joinNormalizedParts(Path.aden:411)"
adenc_aden_io_Path_joinNormalizedParts__List_trace_s9_len equ 47
trace_m213 db "aden.io.Path.rootPrefix"
trace_m213_len equ 23
adenc_aden_io_Path_rootPrefix__String_trace_s0 db "aden.io.Path.rootPrefix(Path.aden:415)"
adenc_aden_io_Path_rootPrefix__String_trace_s0_len equ 38
adenc_aden_io_Path_rootPrefix__String_trace_s1 db "aden.io.Path.rootPrefix(Path.aden:416)"
adenc_aden_io_Path_rootPrefix__String_trace_s1_len equ 38
adenc_aden_io_Path_rootPrefix__String_trace_s2 db "aden.io.Path.rootPrefix(Path.aden:418)"
adenc_aden_io_Path_rootPrefix__String_trace_s2_len equ 38
adenc_aden_io_Path_rootPrefix__String_trace_s3 db "aden.io.Path.rootPrefix(Path.aden:419)"
adenc_aden_io_Path_rootPrefix__String_trace_s3_len equ 38
adenc_aden_io_Path_rootPrefix__String_trace_s4 db "aden.io.Path.rootPrefix(Path.aden:421)"
adenc_aden_io_Path_rootPrefix__String_trace_s4_len equ 38
trace_m219 db "aden.io.Path.hasWindowsDriveRoot"
trace_m219_len equ 32
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0 db "aden.io.Path.hasWindowsDriveRoot(Path.aden:425)"
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0_len equ 47
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s1 db "aden.io.Path.hasWindowsDriveRoot(Path.aden:426)"
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s1_len equ 47
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s2 db "aden.io.Path.hasWindowsDriveRoot(Path.aden:428)"
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s2_len equ 47
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s3 db "aden.io.Path.hasWindowsDriveRoot(Path.aden:429)"
adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s3_len equ 47
trace_m224 db "aden.io.Path.isAsciiLetter"
trace_m224_len equ 26
adenc_aden_io_Path_isAsciiLetter__char_trace_s0 db "aden.io.Path.isAsciiLetter(Path.aden:433)"
adenc_aden_io_Path_isAsciiLetter__char_trace_s0_len equ 41
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
adenc_aden_io_Path_separator proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
adenc_aden_io_Path_separator_b0:
    lea rcx, adenc_aden_io_Path_separator_trace_s0
    mov edx, adenc_aden_io_Path_separator_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_separator_epilogue
adenc_aden_io_Path_separator_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_aden_io_Path_separator_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_aden_io_Path_separator endp

adenc_aden_io_Path_normalize__String proc
    sub rsp, 504
    mov qword ptr [rsp+472], rcx
    mov qword ptr [rsp+480], rdx
    mov qword ptr [rsp+488], r8
    mov qword ptr [rsp+496], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+472]
    mov rdx, qword ptr [rsp+480]
    mov r8, qword ptr [rsp+488]
    mov r9, qword ptr [rsp+496]
    mov qword ptr [rsp+144], rcx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+120], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+112], 0
adenc_aden_io_Path_normalize__String_b0:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s0
    mov edx, adenc_aden_io_Path_normalize__String_trace_s0_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    jmp Path_normalize_ternary_done_0_7
Path_normalize_ternary_then_0_7:
    mov eax, 1
Path_normalize_ternary_done_0_7:
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b1
    jmp adenc_aden_io_Path_normalize__String_b2
adenc_aden_io_Path_normalize__String_b1:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s1
    mov edx, adenc_aden_io_Path_normalize__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_normalize__String_epilogue
adenc_aden_io_Path_normalize__String_b2:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s0
    mov edx, adenc_aden_io_Path_normalize__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b3
adenc_aden_io_Path_normalize__String_b3:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s2
    mov edx, adenc_aden_io_Path_normalize__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s3
    mov edx, adenc_aden_io_Path_normalize__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s4
    mov edx, adenc_aden_io_Path_normalize__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s5
    mov edx, adenc_aden_io_Path_normalize__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b4
adenc_aden_io_Path_normalize__String_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b5
    jmp adenc_aden_io_Path_normalize__String_b6
adenc_aden_io_Path_normalize__String_b5:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s6
    mov edx, adenc_aden_io_Path_normalize__String_trace_s6_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s7
    mov edx, adenc_aden_io_Path_normalize__String_trace_s7_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_io_Path_normalize__String_b7
    jmp adenc_aden_io_Path_normalize__String_b8
adenc_aden_io_Path_normalize__String_b6:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s14
    mov edx, adenc_aden_io_Path_normalize__String_trace_s14_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_length
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
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
Path_normalize_ternary_done_14_62:
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b13
    jmp adenc_aden_io_Path_normalize__String_b14
adenc_aden_io_Path_normalize__String_b7:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s8
    mov edx, adenc_aden_io_Path_normalize__String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b10
    jmp adenc_aden_io_Path_normalize__String_b11
adenc_aden_io_Path_normalize__String_b8:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s11
    mov edx, adenc_aden_io_Path_normalize__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov ecx, eax
    call adenc_aden_lang_String_valueOf__char
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s12
    mov edx, adenc_aden_io_Path_normalize__String_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s7
    mov edx, adenc_aden_io_Path_normalize__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b9
adenc_aden_io_Path_normalize__String_b9:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s13
    mov edx, adenc_aden_io_Path_normalize__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s5
    mov edx, adenc_aden_io_Path_normalize__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b4
adenc_aden_io_Path_normalize__String_b10:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s9
    mov edx, adenc_aden_io_Path_normalize__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s10
    mov edx, adenc_aden_io_Path_normalize__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s8
    mov edx, adenc_aden_io_Path_normalize__String_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b12
adenc_aden_io_Path_normalize__String_b11:
    jmp adenc_aden_io_Path_normalize__String_b12
adenc_aden_io_Path_normalize__String_b12:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s7
    mov edx, adenc_aden_io_Path_normalize__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b9
adenc_aden_io_Path_normalize__String_b13:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s15
    mov edx, adenc_aden_io_Path_normalize__String_trace_s15_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_length
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
    call adenc_aden_lang_String_substring__int_int
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s14
    mov edx, adenc_aden_io_Path_normalize__String_trace_s14_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b15
adenc_aden_io_Path_normalize__String_b14:
    jmp adenc_aden_io_Path_normalize__String_b15
adenc_aden_io_Path_normalize__String_b15:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s16
    mov edx, adenc_aden_io_Path_normalize__String_trace_s16_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    call adenc_aden_lang_String_substring__int
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_aden_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
Path_normalize_ternary_done_16_85:
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b16
    jmp adenc_aden_io_Path_normalize__String_b17
adenc_aden_io_Path_normalize__String_b16:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s17
    mov edx, adenc_aden_io_Path_normalize__String_trace_s17_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s16
    mov edx, adenc_aden_io_Path_normalize__String_trace_s16_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b18
adenc_aden_io_Path_normalize__String_b17:
    jmp adenc_aden_io_Path_normalize__String_b18
adenc_aden_io_Path_normalize__String_b18:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s18
    mov edx, adenc_aden_io_Path_normalize__String_trace_s18_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_aden_io_Path_rootPrefix__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+96], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s19
    mov edx, adenc_aden_io_Path_normalize__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s20
    mov edx, adenc_aden_io_Path_normalize__String_trace_s20_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_aden_io_Path_normalizedParts__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s21
    mov edx, adenc_aden_io_Path_normalize__String_trace_s21_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_collections_ArrayList_ArrayList
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+120], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s22
    mov edx, adenc_aden_io_Path_normalize__String_trace_s22_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s23
    mov edx, adenc_aden_io_Path_normalize__String_trace_s23_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b19
adenc_aden_io_Path_normalize__String_b19:
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_normalize_vd23_109_type
    cmp eax, 1
    je Path_normalize_vd23_109_assign_ok
    cmp eax, 4
    je Path_normalize_vd23_109_assign_ok
    jmp Path_normalize_vd23_109_type
Path_normalize_vd23_109_assign_ok:
    cmp eax, 1
    je Path_normalize_vd23_109_ovr0
    cmp eax, 4
    je Path_normalize_vd23_109_ovr1
    jmp Path_normalize_vd23_109_default
Path_normalize_vd23_109_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_normalize_vd23_109_done
Path_normalize_vd23_109_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_normalize_vd23_109_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+208]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b20
    jmp adenc_aden_io_Path_normalize__String_b21
adenc_aden_io_Path_normalize__String_b20:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s24
    mov edx, adenc_aden_io_Path_normalize__String_trace_s24_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_normalize_vd24_114_type
    cmp eax, 1
    je Path_normalize_vd24_114_assign_ok
    cmp eax, 4
    je Path_normalize_vd24_114_assign_ok
    jmp Path_normalize_vd24_114_type
Path_normalize_vd24_114_assign_ok:
    cmp eax, 1
    je Path_normalize_vd24_114_ovr0
    cmp eax, 4
    je Path_normalize_vd24_114_ovr1
    jmp Path_normalize_vd24_114_default
Path_normalize_vd24_114_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_normalize_vd24_114_done
Path_normalize_vd24_114_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_normalize_vd24_114_done:
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+128], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s25
    mov edx, adenc_aden_io_Path_normalize__String_trace_s25_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test rax, rax
    jne Path_normalize_ternary_then_25_123
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    jmp Path_normalize_ternary_done_25_123
Path_normalize_ternary_then_25_123:
    mov eax, 1
Path_normalize_ternary_done_25_123:
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b22
    jmp adenc_aden_io_Path_normalize__String_b23
adenc_aden_io_Path_normalize__String_b21:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s37
    mov edx, adenc_aden_io_Path_normalize__String_trace_s37_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_aden_io_Path_joinNormalizedParts__List
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+136], rax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s38
    mov edx, adenc_aden_io_Path_normalize__String_trace_s38_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b34
    jmp adenc_aden_io_Path_normalize__String_b35
adenc_aden_io_Path_normalize__String_b22:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s26
    mov edx, adenc_aden_io_Path_normalize__String_trace_s26_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+216], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s27
    mov edx, adenc_aden_io_Path_normalize__String_trace_s27_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b19
adenc_aden_io_Path_normalize__String_b23:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s25
    mov edx, adenc_aden_io_Path_normalize__String_trace_s25_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b24
adenc_aden_io_Path_normalize__String_b24:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s28
    mov edx, adenc_aden_io_Path_normalize__String_trace_s28_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b25
    jmp adenc_aden_io_Path_normalize__String_b26
adenc_aden_io_Path_normalize__String_b25:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s29
    mov edx, adenc_aden_io_Path_normalize__String_trace_s29_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Path_normalize_vd29_135_null
    call adenc_aden_collections_ArrayList_isEmpty
    jmp Path_normalize_vd29_135_done
Path_normalize_vd29_135_null:
    call adenc_rt_dispatchNullReceiverPanic
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
    call adenc_aden_collections_ArrayList_size
    jmp Path_normalize_vd29_141_done
Path_normalize_vd29_141_null:
    call adenc_rt_dispatchNullReceiverPanic
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
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_normalize_vd29_144_done
Path_normalize_vd29_144_null:
    call adenc_rt_dispatchNullReceiverPanic
Path_normalize_vd29_144_done:
    mov qword ptr [rsp+304], rax
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    test eax, eax
    sete al
    movzx eax, al
Path_normalize_ternary_done_29_149:
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b28
    jmp adenc_aden_io_Path_normalize__String_b29
adenc_aden_io_Path_normalize__String_b26:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s28
    mov edx, adenc_aden_io_Path_normalize__String_trace_s28_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b27
adenc_aden_io_Path_normalize__String_b27:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s35
    mov edx, adenc_aden_io_Path_normalize__String_trace_s35_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    je adenc_aden_io_Path_normalize__String_vd_stmt_27_35_0_null
    call adenc_aden_collections_ArrayList_add__String
    jmp adenc_aden_io_Path_normalize__String_vd_stmt_27_35_0_done
adenc_aden_io_Path_normalize__String_vd_stmt_27_35_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_normalize__String_vd_stmt_27_35_0_done:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s36
    mov edx, adenc_aden_io_Path_normalize__String_trace_s36_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+248], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s23
    mov edx, adenc_aden_io_Path_normalize__String_trace_s23_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b19
adenc_aden_io_Path_normalize__String_b28:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s30
    mov edx, adenc_aden_io_Path_normalize__String_trace_s30_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+344], rax
    mov rcx, qword ptr [rsp+344]
    test rcx, rcx
    je Path_normalize_vd30_154_null
    call adenc_aden_collections_ArrayList_size
    jmp Path_normalize_vd30_154_done
Path_normalize_vd30_154_null:
    call adenc_rt_dispatchNullReceiverPanic
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
    je adenc_aden_io_Path_normalize__String_vd_stmt_28_30_0_null
    call adenc_aden_collections_ArrayList_remove__int
    jmp adenc_aden_io_Path_normalize__String_vd_stmt_28_30_0_done
adenc_aden_io_Path_normalize__String_vd_stmt_28_30_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_normalize__String_vd_stmt_28_30_0_done:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s29
    mov edx, adenc_aden_io_Path_normalize__String_trace_s29_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b30
adenc_aden_io_Path_normalize__String_b29:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s31
    mov edx, adenc_aden_io_Path_normalize__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b31
    jmp adenc_aden_io_Path_normalize__String_b32
adenc_aden_io_Path_normalize__String_b30:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s33
    mov edx, adenc_aden_io_Path_normalize__String_trace_s33_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+240], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s34
    mov edx, adenc_aden_io_Path_normalize__String_trace_s34_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b19
adenc_aden_io_Path_normalize__String_b31:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s32
    mov edx, adenc_aden_io_Path_normalize__String_trace_s32_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    je adenc_aden_io_Path_normalize__String_vd_stmt_31_32_0_null
    call adenc_aden_collections_ArrayList_add__String
    jmp adenc_aden_io_Path_normalize__String_vd_stmt_31_32_0_done
adenc_aden_io_Path_normalize__String_vd_stmt_31_32_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_normalize__String_vd_stmt_31_32_0_done:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s31
    mov edx, adenc_aden_io_Path_normalize__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b33
adenc_aden_io_Path_normalize__String_b32:
    jmp adenc_aden_io_Path_normalize__String_b33
adenc_aden_io_Path_normalize__String_b33:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s29
    mov edx, adenc_aden_io_Path_normalize__String_trace_s29_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b30
adenc_aden_io_Path_normalize__String_b34:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s39
    mov edx, adenc_aden_io_Path_normalize__String_trace_s39_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_normalize__String_b37
    jmp adenc_aden_io_Path_normalize__String_b38
adenc_aden_io_Path_normalize__String_b35:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s38
    mov edx, adenc_aden_io_Path_normalize__String_trace_s38_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b36
adenc_aden_io_Path_normalize__String_b36:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s42
    mov edx, adenc_aden_io_Path_normalize__String_trace_s42_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_normalize__String_epilogue
adenc_aden_io_Path_normalize__String_b37:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s40
    mov edx, adenc_aden_io_Path_normalize__String_trace_s40_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_normalize__String_epilogue
adenc_aden_io_Path_normalize__String_b38:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s39
    mov edx, adenc_aden_io_Path_normalize__String_trace_s39_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalize__String_b39
adenc_aden_io_Path_normalize__String_b39:
    lea rcx, adenc_aden_io_Path_normalize__String_trace_s41
    mov edx, adenc_aden_io_Path_normalize__String_trace_s41_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rdx, rax
    mov rcx, qword ptr [rsp+304]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    jmp adenc_aden_io_Path_normalize__String_epilogue
adenc_aden_io_Path_normalize__String_epilogue:
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+296]
adenc_aden_io_Path_normalize__String_epilogue_post:
    mov qword ptr [rsp+296], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+296]
    add rsp, 504
    ret
adenc_aden_io_Path_normalize__String endp

adenc_aden_io_Path_combine__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_io_Path_combine__String_String_b0:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s0
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s1
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s2
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b1
    jmp adenc_aden_io_Path_combine__String_String_b2
adenc_aden_io_Path_combine__String_String_b1:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s3
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_b2:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s2
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b3
adenc_aden_io_Path_combine__String_String_b3:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s4
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b4
    jmp adenc_aden_io_Path_combine__String_String_b5
adenc_aden_io_Path_combine__String_String_b4:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s5
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_b5:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s4
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b6
adenc_aden_io_Path_combine__String_String_b6:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s6
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b7
    jmp adenc_aden_io_Path_combine__String_String_b8
adenc_aden_io_Path_combine__String_String_b7:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s7
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_b8:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s6
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b9
adenc_aden_io_Path_combine__String_String_b9:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s8
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b10
adenc_aden_io_Path_combine__String_String_b10:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    lea rcx, msg9
    mov edx, msg9_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b11
    jmp adenc_aden_io_Path_combine__String_String_b12
adenc_aden_io_Path_combine__String_String_b11:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s9
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s9_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s8
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b10
adenc_aden_io_Path_combine__String_String_b12:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s10
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b13
    jmp adenc_aden_io_Path_combine__String_String_b14
adenc_aden_io_Path_combine__String_String_b13:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s11
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_b14:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s10
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s10_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b15
adenc_aden_io_Path_combine__String_String_b15:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s12
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    lea rcx, msg10
    mov edx, msg10_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne adenc_aden_io_Path_combine__String_String_b16
    jmp adenc_aden_io_Path_combine__String_String_b17
adenc_aden_io_Path_combine__String_String_b16:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s13
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_b17:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s12
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s12_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_combine__String_String_b18
adenc_aden_io_Path_combine__String_String_b18:
    lea rcx, adenc_aden_io_Path_combine__String_String_trace_s14
    mov edx, adenc_aden_io_Path_combine__String_String_trace_s14_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg11
    mov edx, msg11_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp adenc_aden_io_Path_combine__String_String_epilogue
adenc_aden_io_Path_combine__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
adenc_aden_io_Path_combine__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
adenc_aden_io_Path_combine__String_String endp

adenc_aden_io_Path_resolve__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_io_Path_resolve__String_String_b0:
    lea rcx, adenc_aden_io_Path_resolve__String_String_trace_s0
    mov edx, adenc_aden_io_Path_resolve__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call adenc_aden_io_Path_combine__String_String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_io_Path_resolve__String_String_epilogue
adenc_aden_io_Path_resolve__String_String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_io_Path_resolve__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_io_Path_resolve__String_String endp

adenc_aden_io_Path_fileName__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_fileName__String_b0:
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s0
    mov edx, adenc_aden_io_Path_fileName__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s1
    mov edx, adenc_aden_io_Path_fileName__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg12
    mov edx, msg12_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s2
    mov edx, adenc_aden_io_Path_fileName__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_fileName__String_b1
    jmp adenc_aden_io_Path_fileName__String_b2
adenc_aden_io_Path_fileName__String_b1:
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s3
    mov edx, adenc_aden_io_Path_fileName__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_fileName__String_epilogue
adenc_aden_io_Path_fileName__String_b2:
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s2
    mov edx, adenc_aden_io_Path_fileName__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_fileName__String_b3
adenc_aden_io_Path_fileName__String_b3:
    lea rcx, adenc_aden_io_Path_fileName__String_trace_s4
    mov edx, adenc_aden_io_Path_fileName__String_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int
    jmp adenc_aden_io_Path_fileName__String_epilogue
adenc_aden_io_Path_fileName__String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
adenc_aden_io_Path_fileName__String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
adenc_aden_io_Path_fileName__String endp

adenc_aden_io_Path_parent__String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_parent__String_b0:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s0
    mov edx, adenc_aden_io_Path_parent__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_parent__String_trace_s1
    mov edx, adenc_aden_io_Path_parent__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_aden_io_Path_rootPrefix__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_parent__String_trace_s2
    mov edx, adenc_aden_io_Path_parent__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_parent__String_trace_s3
    mov edx, adenc_aden_io_Path_parent__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_isEmpty
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
    call adenc_aden_lang_String_length
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
    jne adenc_aden_io_Path_parent__String_b1
    jmp adenc_aden_io_Path_parent__String_b2
adenc_aden_io_Path_parent__String_b1:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s4
    mov edx, adenc_aden_io_Path_parent__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_parent__String_epilogue
adenc_aden_io_Path_parent__String_b2:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s3
    mov edx, adenc_aden_io_Path_parent__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_parent__String_b3
adenc_aden_io_Path_parent__String_b3:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s5
    mov edx, adenc_aden_io_Path_parent__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg13
    mov edx, msg13_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_io_Path_parent__String_trace_s6
    mov edx, adenc_aden_io_Path_parent__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_parent__String_b4
    jmp adenc_aden_io_Path_parent__String_b5
adenc_aden_io_Path_parent__String_b4:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s7
    mov edx, adenc_aden_io_Path_parent__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg14
    mov edx, msg14_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_parent__String_epilogue
adenc_aden_io_Path_parent__String_b5:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s6
    mov edx, adenc_aden_io_Path_parent__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_parent__String_b6
adenc_aden_io_Path_parent__String_b6:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s8
    mov edx, adenc_aden_io_Path_parent__String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_isEmpty
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
    jne adenc_aden_io_Path_parent__String_b7
    jmp adenc_aden_io_Path_parent__String_b8
adenc_aden_io_Path_parent__String_b7:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s9
    mov edx, adenc_aden_io_Path_parent__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_parent__String_epilogue
adenc_aden_io_Path_parent__String_b8:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s8
    mov edx, adenc_aden_io_Path_parent__String_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_parent__String_b9
adenc_aden_io_Path_parent__String_b9:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s10
    mov edx, adenc_aden_io_Path_parent__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_parent__String_b10
    jmp adenc_aden_io_Path_parent__String_b11
adenc_aden_io_Path_parent__String_b10:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s11
    mov edx, adenc_aden_io_Path_parent__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg15
    mov edx, msg15_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_parent__String_epilogue
adenc_aden_io_Path_parent__String_b11:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s10
    mov edx, adenc_aden_io_Path_parent__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_parent__String_b12
adenc_aden_io_Path_parent__String_b12:
    lea rcx, adenc_aden_io_Path_parent__String_trace_s12
    mov edx, adenc_aden_io_Path_parent__String_trace_s12_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int_int
    jmp adenc_aden_io_Path_parent__String_epilogue
adenc_aden_io_Path_parent__String_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
adenc_aden_io_Path_parent__String_epilogue_post:
    mov qword ptr [rsp+176], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
adenc_aden_io_Path_parent__String endp

adenc_aden_io_Path_extension__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_extension__String_b0:
    lea rcx, adenc_aden_io_Path_extension__String_trace_s0
    mov edx, adenc_aden_io_Path_extension__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_aden_io_Path_fileName__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_extension__String_trace_s1
    mov edx, adenc_aden_io_Path_extension__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    lea rcx, msg16
    mov edx, msg16_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call adenc_aden_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_extension__String_trace_s2
    mov edx, adenc_aden_io_Path_extension__String_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_length
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
    jne adenc_aden_io_Path_extension__String_b1
    jmp adenc_aden_io_Path_extension__String_b2
adenc_aden_io_Path_extension__String_b1:
    lea rcx, adenc_aden_io_Path_extension__String_trace_s3
    mov edx, adenc_aden_io_Path_extension__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg17
    mov edx, msg17_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_extension__String_epilogue
adenc_aden_io_Path_extension__String_b2:
    lea rcx, adenc_aden_io_Path_extension__String_trace_s2
    mov edx, adenc_aden_io_Path_extension__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_extension__String_b3
adenc_aden_io_Path_extension__String_b3:
    lea rcx, adenc_aden_io_Path_extension__String_trace_s4
    mov edx, adenc_aden_io_Path_extension__String_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int
    jmp adenc_aden_io_Path_extension__String_epilogue
adenc_aden_io_Path_extension__String_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
adenc_aden_io_Path_extension__String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
adenc_aden_io_Path_extension__String endp

adenc_aden_io_Path_hasExtension__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
adenc_aden_io_Path_hasExtension__String_b0:
    lea rcx, adenc_aden_io_Path_hasExtension__String_trace_s0
    mov edx, adenc_aden_io_Path_hasExtension__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_io_Path_extension__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    jmp adenc_aden_io_Path_hasExtension__String_epilogue
adenc_aden_io_Path_hasExtension__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_io_Path_hasExtension__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
adenc_aden_io_Path_hasExtension__String endp

adenc_aden_io_Path_stem__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_stem__String_b0:
    lea rcx, adenc_aden_io_Path_stem__String_trace_s0
    mov edx, adenc_aden_io_Path_stem__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_fileName__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_stem__String_trace_s1
    mov edx, adenc_aden_io_Path_stem__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    lea rcx, msg18
    mov edx, msg18_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_stem__String_trace_s2
    mov edx, adenc_aden_io_Path_stem__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_stem__String_b1
    jmp adenc_aden_io_Path_stem__String_b2
adenc_aden_io_Path_stem__String_b1:
    lea rcx, adenc_aden_io_Path_stem__String_trace_s3
    mov edx, adenc_aden_io_Path_stem__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_stem__String_epilogue
adenc_aden_io_Path_stem__String_b2:
    lea rcx, adenc_aden_io_Path_stem__String_trace_s2
    mov edx, adenc_aden_io_Path_stem__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_stem__String_b3
adenc_aden_io_Path_stem__String_b3:
    lea rcx, adenc_aden_io_Path_stem__String_trace_s4
    mov edx, adenc_aden_io_Path_stem__String_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int_int
    jmp adenc_aden_io_Path_stem__String_epilogue
adenc_aden_io_Path_stem__String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
adenc_aden_io_Path_stem__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_aden_io_Path_stem__String endp

adenc_aden_io_Path_resolveSibling__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_resolveSibling__String_String_b0:
    lea rcx, adenc_aden_io_Path_resolveSibling__String_String_trace_s0
    mov edx, adenc_aden_io_Path_resolveSibling__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_aden_io_Path_parent__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_resolveSibling__String_String_trace_s1
    mov edx, adenc_aden_io_Path_resolveSibling__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_resolveSibling__String_String_b1
    jmp adenc_aden_io_Path_resolveSibling__String_String_b2
adenc_aden_io_Path_resolveSibling__String_String_b1:
    lea rcx, adenc_aden_io_Path_resolveSibling__String_String_trace_s2
    mov edx, adenc_aden_io_Path_resolveSibling__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_io_Path_resolveSibling__String_String_epilogue
adenc_aden_io_Path_resolveSibling__String_String_b2:
    lea rcx, adenc_aden_io_Path_resolveSibling__String_String_trace_s1
    mov edx, adenc_aden_io_Path_resolveSibling__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_resolveSibling__String_String_b3
adenc_aden_io_Path_resolveSibling__String_String_b3:
    lea rcx, adenc_aden_io_Path_resolveSibling__String_String_trace_s3
    mov edx, adenc_aden_io_Path_resolveSibling__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call adenc_aden_io_Path_resolve__String_String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_io_Path_resolveSibling__String_String_epilogue
adenc_aden_io_Path_resolveSibling__String_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
adenc_aden_io_Path_resolveSibling__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_io_Path_resolveSibling__String_String endp

adenc_aden_io_Path_changeFileName__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m103
    mov edx, trace_m103_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_changeFileName__String_String_b0:
    lea rcx, adenc_aden_io_Path_changeFileName__String_String_trace_s0
    mov edx, adenc_aden_io_Path_changeFileName__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_aden_io_Path_parent__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_changeFileName__String_String_trace_s1
    mov edx, adenc_aden_io_Path_changeFileName__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_changeFileName__String_String_b1
    jmp adenc_aden_io_Path_changeFileName__String_String_b2
adenc_aden_io_Path_changeFileName__String_String_b1:
    lea rcx, adenc_aden_io_Path_changeFileName__String_String_trace_s2
    mov edx, adenc_aden_io_Path_changeFileName__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_io_Path_changeFileName__String_String_epilogue
adenc_aden_io_Path_changeFileName__String_String_b2:
    lea rcx, adenc_aden_io_Path_changeFileName__String_String_trace_s1
    mov edx, adenc_aden_io_Path_changeFileName__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_changeFileName__String_String_b3
adenc_aden_io_Path_changeFileName__String_String_b3:
    lea rcx, adenc_aden_io_Path_changeFileName__String_String_trace_s3
    mov edx, adenc_aden_io_Path_changeFileName__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call adenc_aden_io_Path_resolve__String_String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_io_Path_changeFileName__String_String_epilogue
adenc_aden_io_Path_changeFileName__String_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
adenc_aden_io_Path_changeFileName__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_io_Path_changeFileName__String_String endp

adenc_aden_io_Path_isAbsolute__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m108
    mov edx, trace_m108_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_isAbsolute__String_b0:
    lea rcx, adenc_aden_io_Path_isAbsolute__String_trace_s0
    mov edx, adenc_aden_io_Path_isAbsolute__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_isAbsolute__String_trace_s1
    mov edx, adenc_aden_io_Path_isAbsolute__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_aden_io_Path_rootPrefix__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    jmp adenc_aden_io_Path_isAbsolute__String_epilogue
adenc_aden_io_Path_isAbsolute__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
adenc_aden_io_Path_isAbsolute__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
adenc_aden_io_Path_isAbsolute__String endp

adenc_aden_io_Path_root__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m111
    mov edx, trace_m111_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
adenc_aden_io_Path_root__String_b0:
    lea rcx, adenc_aden_io_Path_root__String_trace_s0
    mov edx, adenc_aden_io_Path_root__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_io_Path_rootPrefix__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_io_Path_root__String_epilogue
adenc_aden_io_Path_root__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_io_Path_root__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
adenc_aden_io_Path_root__String endp

adenc_aden_io_Path_relativeTo__String_String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m113
    mov edx, trace_m113_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_relativeTo__String_String_b0:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s0
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s1
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s2
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_relativeTo__String_String_b1
    jmp adenc_aden_io_Path_relativeTo__String_String_b2
adenc_aden_io_Path_relativeTo__String_String_b1:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s3
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_relativeTo__String_String_epilogue
adenc_aden_io_Path_relativeTo__String_String_b2:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s2
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_relativeTo__String_String_b3
adenc_aden_io_Path_relativeTo__String_String_b3:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s4
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne adenc_aden_io_Path_relativeTo__String_String_b4
    jmp adenc_aden_io_Path_relativeTo__String_String_b5
adenc_aden_io_Path_relativeTo__String_String_b4:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s5
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg19
    mov edx, msg19_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_relativeTo__String_String_epilogue
adenc_aden_io_Path_relativeTo__String_String_b5:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s4
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_relativeTo__String_String_b6
adenc_aden_io_Path_relativeTo__String_String_b6:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s6
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg20
    mov edx, msg20_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s7
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne adenc_aden_io_Path_relativeTo__String_String_b7
    jmp adenc_aden_io_Path_relativeTo__String_String_b8
adenc_aden_io_Path_relativeTo__String_String_b7:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s8
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_substring__int
    jmp adenc_aden_io_Path_relativeTo__String_String_epilogue
adenc_aden_io_Path_relativeTo__String_String_b8:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s7
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_relativeTo__String_String_b9
adenc_aden_io_Path_relativeTo__String_String_b9:
    lea rcx, adenc_aden_io_Path_relativeTo__String_String_trace_s9
    mov edx, adenc_aden_io_Path_relativeTo__String_String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_relativeTo__String_String_epilogue
adenc_aden_io_Path_relativeTo__String_String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
adenc_aden_io_Path_relativeTo__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
adenc_aden_io_Path_relativeTo__String_String endp

adenc_aden_io_Path_changeExtension__String_String proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m124
    mov edx, trace_m124_len
    call adenc_rt_tracePush
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
adenc_aden_io_Path_changeExtension__String_String_b0:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s0
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s1
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_aden_io_Path_parent__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s2
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_aden_io_Path_stem__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s3
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s4
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_changeExtension_ternary_done_4_21:
    test eax, eax
    jne adenc_aden_io_Path_changeExtension__String_String_b1
    jmp adenc_aden_io_Path_changeExtension__String_String_b2
adenc_aden_io_Path_changeExtension__String_String_b1:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s5
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+208], rax
    lea rcx, msg21
    mov edx, msg21_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s4
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_changeExtension__String_String_b3
adenc_aden_io_Path_changeExtension__String_String_b2:
    jmp adenc_aden_io_Path_changeExtension__String_String_b3
adenc_aden_io_Path_changeExtension__String_String_b3:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s6
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_changeExtension__String_String_b4
    jmp adenc_aden_io_Path_changeExtension__String_String_b5
adenc_aden_io_Path_changeExtension__String_String_b4:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s7
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_changeExtension__String_String_epilogue
adenc_aden_io_Path_changeExtension__String_String_b5:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s6
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_changeExtension__String_String_b6
adenc_aden_io_Path_changeExtension__String_String_b6:
    lea rcx, adenc_aden_io_Path_changeExtension__String_String_trace_s8
    mov edx, adenc_aden_io_Path_changeExtension__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    call adenc_aden_io_Path_resolve__String_String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp adenc_aden_io_Path_changeExtension__String_String_epilogue
adenc_aden_io_Path_changeExtension__String_String_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
adenc_aden_io_Path_changeExtension__String_String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
adenc_aden_io_Path_changeExtension__String_String endp

adenc_aden_io_Path_parts__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m134
    mov edx, trace_m134_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_parts__String_b0:
    lea rcx, adenc_aden_io_Path_parts__String_trace_s0
    mov edx, adenc_aden_io_Path_parts__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_parts__String_trace_s1
    mov edx, adenc_aden_io_Path_parts__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_aden_io_Path_normalizedParts__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_io_Path_parts__String_epilogue
adenc_aden_io_Path_parts__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
adenc_aden_io_Path_parts__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_io_Path_parts__String endp

adenc_aden_io_Path_normalizedParts__String proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m137
    mov edx, trace_m137_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_normalizedParts__String_b0:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s0
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_collections_ArrayList_ArrayList
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s1
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call adenc_aden_io_Path_rootPrefix__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s2
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test rax, rax
    jne Path_normalizedParts_ternary_then_2_14
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    lea rcx, msg22
    mov edx, msg22_len
    call adenc_rt_stringFromBytes
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
    call adenc_aden_lang_String_length
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
    jne adenc_aden_io_Path_normalizedParts__String_b1
    jmp adenc_aden_io_Path_normalizedParts__String_b2
adenc_aden_io_Path_normalizedParts__String_b1:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s3
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_normalizedParts__String_epilogue
adenc_aden_io_Path_normalizedParts__String_b2:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s2
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b3
adenc_aden_io_Path_normalizedParts__String_b3:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s4
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s5
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b4
adenc_aden_io_Path_normalizedParts__String_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalizedParts__String_b5
    jmp adenc_aden_io_Path_normalizedParts__String_b6
adenc_aden_io_Path_normalizedParts__String_b5:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s6
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_length
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
    call adenc_aden_lang_String_charAt__int
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
    jne adenc_aden_io_Path_normalizedParts__String_b7
    jmp adenc_aden_io_Path_normalizedParts__String_b8
adenc_aden_io_Path_normalizedParts__String_b6:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s11
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_normalizedParts__String_epilogue
adenc_aden_io_Path_normalizedParts__String_b7:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s7
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_normalizedParts__String_b10
    jmp adenc_aden_io_Path_normalizedParts__String_b11
adenc_aden_io_Path_normalizedParts__String_b8:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s6
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b9
adenc_aden_io_Path_normalizedParts__String_b9:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s10
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s5
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b4
adenc_aden_io_Path_normalizedParts__String_b10:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s8
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int_int
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call adenc_rt_arcRetain
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
    je adenc_aden_io_Path_normalizedParts__String_vd_stmt_10_8_0_null
    call adenc_aden_collections_ArrayList_add__String
    jmp adenc_aden_io_Path_normalizedParts__String_vd_stmt_10_8_0_done
adenc_aden_io_Path_normalizedParts__String_vd_stmt_10_8_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_normalizedParts__String_vd_stmt_10_8_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s7
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b12
adenc_aden_io_Path_normalizedParts__String_b11:
    jmp adenc_aden_io_Path_normalizedParts__String_b12
adenc_aden_io_Path_normalizedParts__String_b12:
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s9
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_normalizedParts__String_trace_s6
    mov edx, adenc_aden_io_Path_normalizedParts__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_normalizedParts__String_b9
adenc_aden_io_Path_normalizedParts__String_epilogue:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
adenc_aden_io_Path_normalizedParts__String_epilogue_post:
    mov qword ptr [rsp+200], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 360
    ret
adenc_aden_io_Path_normalizedParts__String endp

adenc_aden_io_Path_join__List proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m150
    mov edx, trace_m150_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+104], rcx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
adenc_aden_io_Path_join__List_b0:
    lea rcx, adenc_aden_io_Path_join__List_trace_s0
    mov edx, adenc_aden_io_Path_join__List_trace_s0_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_collections_ArrayList_ArrayList
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_join__List_trace_s1
    mov edx, adenc_aden_io_Path_join__List_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_join__List_trace_s2
    mov edx, adenc_aden_io_Path_join__List_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b1
adenc_aden_io_Path_join__List_b1:
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_join_vd2_5_type
    cmp eax, 1
    je Path_join_vd2_5_assign_ok
    cmp eax, 4
    je Path_join_vd2_5_assign_ok
    jmp Path_join_vd2_5_type
Path_join_vd2_5_assign_ok:
    cmp eax, 1
    je Path_join_vd2_5_ovr0
    cmp eax, 4
    je Path_join_vd2_5_ovr1
    jmp Path_join_vd2_5_default
Path_join_vd2_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_join_vd2_5_done
Path_join_vd2_5_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_join_vd2_5_done
Path_join_vd2_5_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_join_vd2_5_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_join__List_b2
    jmp adenc_aden_io_Path_join__List_b3
adenc_aden_io_Path_join__List_b2:
    lea rcx, adenc_aden_io_Path_join__List_trace_s3
    mov edx, adenc_aden_io_Path_join__List_trace_s3_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_join_vd3_10_type
    cmp eax, 1
    je Path_join_vd3_10_assign_ok
    cmp eax, 4
    je Path_join_vd3_10_assign_ok
    jmp Path_join_vd3_10_type
Path_join_vd3_10_assign_ok:
    cmp eax, 1
    je Path_join_vd3_10_ovr0
    cmp eax, 4
    je Path_join_vd3_10_ovr1
    jmp Path_join_vd3_10_default
Path_join_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_join_vd3_10_done
Path_join_vd3_10_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_join_vd3_10_done
Path_join_vd3_10_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_join_vd3_10_done:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_io_Path_join__List_trace_s4
    mov edx, adenc_aden_io_Path_join__List_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_join_ternary_done_4_19:
    test eax, eax
    jne adenc_aden_io_Path_join__List_b4
    jmp adenc_aden_io_Path_join__List_b5
adenc_aden_io_Path_join__List_b3:
    lea rcx, adenc_aden_io_Path_join__List_trace_s11
    mov edx, adenc_aden_io_Path_join__List_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_aden_io_Path_joinNormalizedParts__List
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    jmp adenc_aden_io_Path_join__List_epilogue
adenc_aden_io_Path_join__List_b4:
    lea rcx, adenc_aden_io_Path_join__List_trace_s5
    mov edx, adenc_aden_io_Path_join__List_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_aden_io_Path_parts__String
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_io_Path_join__List_trace_s6
    mov edx, adenc_aden_io_Path_join__List_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+96], eax
    lea rcx, adenc_aden_io_Path_join__List_trace_s7
    mov edx, adenc_aden_io_Path_join__List_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b7
adenc_aden_io_Path_join__List_b5:
    lea rcx, adenc_aden_io_Path_join__List_trace_s4
    mov edx, adenc_aden_io_Path_join__List_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b6
adenc_aden_io_Path_join__List_b6:
    lea rcx, adenc_aden_io_Path_join__List_trace_s10
    mov edx, adenc_aden_io_Path_join__List_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_join__List_trace_s2
    mov edx, adenc_aden_io_Path_join__List_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b1
adenc_aden_io_Path_join__List_b7:
    lea rcx, adenc_aden_io_Path_join__List_trace_s7
    mov edx, adenc_aden_io_Path_join__List_trace_s7_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_join_vd7_28_type
    cmp eax, 1
    je Path_join_vd7_28_assign_ok
    cmp eax, 4
    je Path_join_vd7_28_assign_ok
    jmp Path_join_vd7_28_type
Path_join_vd7_28_assign_ok:
    cmp eax, 1
    je Path_join_vd7_28_ovr0
    cmp eax, 4
    je Path_join_vd7_28_ovr1
    jmp Path_join_vd7_28_default
Path_join_vd7_28_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_join_vd7_28_done
Path_join_vd7_28_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_join_vd7_28_done
Path_join_vd7_28_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_join_vd7_28_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_join__List_b8
    jmp adenc_aden_io_Path_join__List_b9
adenc_aden_io_Path_join__List_b8:
    lea rcx, adenc_aden_io_Path_join__List_trace_s8
    mov edx, adenc_aden_io_Path_join__List_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_join_vd8_35_type
    cmp eax, 1
    je Path_join_vd8_35_assign_ok
    cmp eax, 4
    je Path_join_vd8_35_assign_ok
    jmp Path_join_vd8_35_type
Path_join_vd8_35_assign_ok:
    cmp eax, 1
    je Path_join_vd8_35_ovr0
    cmp eax, 4
    je Path_join_vd8_35_ovr1
    jmp Path_join_vd8_35_default
Path_join_vd8_35_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_join_vd8_35_done
Path_join_vd8_35_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_join_vd8_35_done
Path_join_vd8_35_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_join_vd8_35_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call adenc_rt_arcRetain
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
    je adenc_aden_io_Path_join__List_vd_stmt_8_8_0_null
    call adenc_aden_collections_ArrayList_add__String
    jmp adenc_aden_io_Path_join__List_vd_stmt_8_8_0_done
adenc_aden_io_Path_join__List_vd_stmt_8_8_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_join__List_vd_stmt_8_8_0_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, adenc_aden_io_Path_join__List_trace_s9
    mov edx, adenc_aden_io_Path_join__List_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, adenc_aden_io_Path_join__List_trace_s7
    mov edx, adenc_aden_io_Path_join__List_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b7
adenc_aden_io_Path_join__List_b9:
    lea rcx, adenc_aden_io_Path_join__List_trace_s4
    mov edx, adenc_aden_io_Path_join__List_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_join__List_b6
adenc_aden_io_Path_join__List_epilogue:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
adenc_aden_io_Path_join__List_epilogue_post:
    mov qword ptr [rsp+192], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 360
    ret
adenc_aden_io_Path_join__List endp

adenc_aden_io_Path_depth__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m163
    mov edx, trace_m163_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
adenc_aden_io_Path_depth__String_b0:
    lea rcx, adenc_aden_io_Path_depth__String_trace_s0
    mov edx, adenc_aden_io_Path_depth__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_io_Path_parts__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_depth_vd0_5_type
    cmp eax, 1
    je Path_depth_vd0_5_assign_ok
    cmp eax, 4
    je Path_depth_vd0_5_assign_ok
    jmp Path_depth_vd0_5_type
Path_depth_vd0_5_assign_ok:
    cmp eax, 1
    je Path_depth_vd0_5_ovr0
    cmp eax, 4
    je Path_depth_vd0_5_ovr1
    jmp Path_depth_vd0_5_default
Path_depth_vd0_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_depth_vd0_5_done
Path_depth_vd0_5_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_depth_vd0_5_done:
    movsxd rax, eax
    jmp adenc_aden_io_Path_depth__String_epilogue
adenc_aden_io_Path_depth__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_io_Path_depth__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
adenc_aden_io_Path_depth__String endp

adenc_aden_io_Path_startsWithPath__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m165
    mov edx, trace_m165_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_startsWithPath__String_String_b0:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s0
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s1
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_startsWithPath__String_String_b1
    jmp adenc_aden_io_Path_startsWithPath__String_String_b2
adenc_aden_io_Path_startsWithPath__String_String_b1:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s3
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_io_Path_startsWithPath__String_String_epilogue
adenc_aden_io_Path_startsWithPath__String_String_b2:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_startsWithPath__String_String_b3
adenc_aden_io_Path_startsWithPath__String_String_b3:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne adenc_aden_io_Path_startsWithPath__String_String_b4
    jmp adenc_aden_io_Path_startsWithPath__String_String_b5
adenc_aden_io_Path_startsWithPath__String_String_b4:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s5
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_io_Path_startsWithPath__String_String_epilogue
adenc_aden_io_Path_startsWithPath__String_String_b5:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_startsWithPath__String_String_b6
adenc_aden_io_Path_startsWithPath__String_String_b6:
    lea rcx, adenc_aden_io_Path_startsWithPath__String_String_trace_s6
    mov edx, adenc_aden_io_Path_startsWithPath__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    lea rcx, msg23
    mov edx, msg23_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp adenc_aden_io_Path_startsWithPath__String_String_epilogue
adenc_aden_io_Path_startsWithPath__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
adenc_aden_io_Path_startsWithPath__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
adenc_aden_io_Path_startsWithPath__String_String endp

adenc_aden_io_Path_endsWithPath__String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m173
    mov edx, trace_m173_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_io_Path_endsWithPath__String_String_b0:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s0
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s1
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_endsWithPath__String_String_b1
    jmp adenc_aden_io_Path_endsWithPath__String_String_b2
adenc_aden_io_Path_endsWithPath__String_String_b1:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s3
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_io_Path_endsWithPath__String_String_epilogue
adenc_aden_io_Path_endsWithPath__String_String_b2:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_endsWithPath__String_String_b3
adenc_aden_io_Path_endsWithPath__String_String_b3:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne adenc_aden_io_Path_endsWithPath__String_String_b4
    jmp adenc_aden_io_Path_endsWithPath__String_String_b5
adenc_aden_io_Path_endsWithPath__String_String_b4:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s5
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_io_Path_endsWithPath__String_String_epilogue
adenc_aden_io_Path_endsWithPath__String_String_b5:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_endsWithPath__String_String_b6
adenc_aden_io_Path_endsWithPath__String_String_b6:
    lea rcx, adenc_aden_io_Path_endsWithPath__String_String_trace_s6
    mov edx, adenc_aden_io_Path_endsWithPath__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    lea rcx, msg24
    mov edx, msg24_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_endsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp adenc_aden_io_Path_endsWithPath__String_String_epilogue
adenc_aden_io_Path_endsWithPath__String_String_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
adenc_aden_io_Path_endsWithPath__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
adenc_aden_io_Path_endsWithPath__String_String endp

adenc_aden_io_Path_commonParent__String_String proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m181
    mov edx, trace_m181_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_commonParent__String_String_b0:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s0
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_aden_io_Path_parts__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s1
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_aden_io_Path_parts__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s2
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_collections_ArrayList_ArrayList
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s3
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s4
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_commonParent__String_String_b1
adenc_aden_io_Path_commonParent__String_String_b1:
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd4_14_type
    cmp eax, 1
    je Path_commonParent_vd4_14_assign_ok
    cmp eax, 4
    je Path_commonParent_vd4_14_assign_ok
    jmp Path_commonParent_vd4_14_type
Path_commonParent_vd4_14_assign_ok:
    cmp eax, 1
    je Path_commonParent_vd4_14_ovr0
    cmp eax, 4
    je Path_commonParent_vd4_14_ovr1
    jmp Path_commonParent_vd4_14_default
Path_commonParent_vd4_14_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd4_14_done
Path_commonParent_vd4_14_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd4_19_type
    cmp eax, 1
    je Path_commonParent_vd4_19_assign_ok
    cmp eax, 4
    je Path_commonParent_vd4_19_assign_ok
    jmp Path_commonParent_vd4_19_type
Path_commonParent_vd4_19_assign_ok:
    cmp eax, 1
    je Path_commonParent_vd4_19_ovr0
    cmp eax, 4
    je Path_commonParent_vd4_19_ovr1
    jmp Path_commonParent_vd4_19_default
Path_commonParent_vd4_19_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd4_19_done
Path_commonParent_vd4_19_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_commonParent_vd4_19_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    setl al
    movzx eax, al
Path_commonParent_ternary_done_4_21:
    test eax, eax
    jne adenc_aden_io_Path_commonParent__String_String_b2
    jmp adenc_aden_io_Path_commonParent__String_String_b3
adenc_aden_io_Path_commonParent__String_String_b2:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s5
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd5_25_type
    cmp eax, 1
    je Path_commonParent_vd5_25_assign_ok
    cmp eax, 4
    je Path_commonParent_vd5_25_assign_ok
    jmp Path_commonParent_vd5_25_type
Path_commonParent_vd5_25_assign_ok:
    cmp eax, 1
    je Path_commonParent_vd5_25_ovr0
    cmp eax, 4
    je Path_commonParent_vd5_25_ovr1
    jmp Path_commonParent_vd5_25_default
Path_commonParent_vd5_25_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd5_25_done
Path_commonParent_vd5_25_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd5_30_type
    cmp eax, 1
    je Path_commonParent_vd5_30_assign_ok
    cmp eax, 4
    je Path_commonParent_vd5_30_assign_ok
    jmp Path_commonParent_vd5_30_type
Path_commonParent_vd5_30_assign_ok:
    cmp eax, 1
    je Path_commonParent_vd5_30_ovr0
    cmp eax, 4
    je Path_commonParent_vd5_30_ovr1
    jmp Path_commonParent_vd5_30_default
Path_commonParent_vd5_30_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd5_30_done
Path_commonParent_vd5_30_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_commonParent_vd5_30_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_commonParent__String_String_b4
    jmp adenc_aden_io_Path_commonParent__String_String_b5
adenc_aden_io_Path_commonParent__String_String_b3:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s9
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_aden_io_Path_join__List
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp adenc_aden_io_Path_commonParent__String_String_epilogue
adenc_aden_io_Path_commonParent__String_String_b4:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s6
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_commonParent__String_String_b3
adenc_aden_io_Path_commonParent__String_String_b5:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s5
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_commonParent__String_String_b6
adenc_aden_io_Path_commonParent__String_String_b6:
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s7
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_commonParent_vd7_38_type
    cmp eax, 1
    je Path_commonParent_vd7_38_assign_ok
    cmp eax, 4
    je Path_commonParent_vd7_38_assign_ok
    jmp Path_commonParent_vd7_38_type
Path_commonParent_vd7_38_assign_ok:
    cmp eax, 1
    je Path_commonParent_vd7_38_ovr0
    cmp eax, 4
    je Path_commonParent_vd7_38_ovr1
    jmp Path_commonParent_vd7_38_default
Path_commonParent_vd7_38_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_commonParent_vd7_38_done
Path_commonParent_vd7_38_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_commonParent_vd7_38_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call adenc_rt_arcRetain
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
    je adenc_aden_io_Path_commonParent__String_String_vd_stmt_6_7_0_null
    call adenc_aden_collections_ArrayList_add__String
    jmp adenc_aden_io_Path_commonParent__String_String_vd_stmt_6_7_0_done
adenc_aden_io_Path_commonParent__String_String_vd_stmt_6_7_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_io_Path_commonParent__String_String_vd_stmt_6_7_0_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s8
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_io_Path_commonParent__String_String_trace_s4
    mov edx, adenc_aden_io_Path_commonParent__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_commonParent__String_String_b1
adenc_aden_io_Path_commonParent__String_String_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
adenc_aden_io_Path_commonParent__String_String_epilogue_post:
    mov qword ptr [rsp+176], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
adenc_aden_io_Path_commonParent__String_String endp

adenc_aden_io_Path_childPath__String_String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m192
    mov edx, trace_m192_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_io_Path_childPath__String_String_b0:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s0
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s1
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_aden_io_Path_normalize__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    call adenc_aden_io_Path_startsWithPath__String_String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_childPath__String_String_b1
    jmp adenc_aden_io_Path_childPath__String_String_b2
adenc_aden_io_Path_childPath__String_String_b1:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s3
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg25
    mov edx, msg25_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_childPath__String_String_epilogue
adenc_aden_io_Path_childPath__String_String_b2:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s2
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_childPath__String_String_b3
adenc_aden_io_Path_childPath__String_String_b3:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne adenc_aden_io_Path_childPath__String_String_b4
    jmp adenc_aden_io_Path_childPath__String_String_b5
adenc_aden_io_Path_childPath__String_String_b4:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s5
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg26
    mov edx, msg26_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_childPath__String_String_epilogue
adenc_aden_io_Path_childPath__String_String_b5:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s4
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_childPath__String_String_b6
adenc_aden_io_Path_childPath__String_String_b6:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s6
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_childPath__String_String_b7
    jmp adenc_aden_io_Path_childPath__String_String_b8
adenc_aden_io_Path_childPath__String_String_b7:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s7
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_childPath__String_String_epilogue
adenc_aden_io_Path_childPath__String_String_b8:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s6
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_childPath__String_String_b9
adenc_aden_io_Path_childPath__String_String_b9:
    lea rcx, adenc_aden_io_Path_childPath__String_String_trace_s8
    mov edx, adenc_aden_io_Path_childPath__String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    call adenc_aden_lang_String_length
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
    call adenc_aden_lang_String_substring__int
    jmp adenc_aden_io_Path_childPath__String_String_epilogue
adenc_aden_io_Path_childPath__String_String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
adenc_aden_io_Path_childPath__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
adenc_aden_io_Path_childPath__String_String endp

adenc_aden_io_Path_joinNormalizedParts__List proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m202
    mov edx, trace_m202_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
adenc_aden_io_Path_joinNormalizedParts__List_b0:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s0
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg27
    mov edx, msg27_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s1
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s2
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b1
adenc_aden_io_Path_joinNormalizedParts__List_b1:
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_joinNormalizedParts_vd2_5_type
    cmp eax, 1
    je Path_joinNormalizedParts_vd2_5_assign_ok
    cmp eax, 4
    je Path_joinNormalizedParts_vd2_5_assign_ok
    jmp Path_joinNormalizedParts_vd2_5_type
Path_joinNormalizedParts_vd2_5_assign_ok:
    cmp eax, 1
    je Path_joinNormalizedParts_vd2_5_ovr0
    cmp eax, 4
    je Path_joinNormalizedParts_vd2_5_ovr1
    jmp Path_joinNormalizedParts_vd2_5_default
Path_joinNormalizedParts_vd2_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_Collection_size
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_joinNormalizedParts_vd2_5_done
Path_joinNormalizedParts_vd2_5_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_joinNormalizedParts_vd2_5_done:
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_joinNormalizedParts__List_b2
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b3
adenc_aden_io_Path_joinNormalizedParts__List_b2:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s3
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s3_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Path_joinNormalizedParts_vd3_10_type
    cmp eax, 1
    je Path_joinNormalizedParts_vd3_10_assign_ok
    cmp eax, 4
    je Path_joinNormalizedParts_vd3_10_assign_ok
    jmp Path_joinNormalizedParts_vd3_10_type
Path_joinNormalizedParts_vd3_10_assign_ok:
    cmp eax, 1
    je Path_joinNormalizedParts_vd3_10_ovr0
    cmp eax, 4
    je Path_joinNormalizedParts_vd3_10_ovr1
    jmp Path_joinNormalizedParts_vd3_10_default
Path_joinNormalizedParts_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_ArrayList_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_LinkedList_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_collections_List_get__int
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Path_joinNormalizedParts_vd3_10_done
Path_joinNormalizedParts_vd3_10_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Path_joinNormalizedParts_vd3_10_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
Path_joinNormalizedParts_ternary_done_4_19:
    test eax, eax
    jne adenc_aden_io_Path_joinNormalizedParts__List_b4
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b5
adenc_aden_io_Path_joinNormalizedParts__List_b3:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s9
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_io_Path_joinNormalizedParts__List_epilogue
adenc_aden_io_Path_joinNormalizedParts__List_b4:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call adenc_aden_lang_String_isEmpty
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_io_Path_joinNormalizedParts__List_b7
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b8
adenc_aden_io_Path_joinNormalizedParts__List_b5:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b6
adenc_aden_io_Path_joinNormalizedParts__List_b6:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s8
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s2
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b1
adenc_aden_io_Path_joinNormalizedParts__List_b7:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s6
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b9
adenc_aden_io_Path_joinNormalizedParts__List_b8:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s7
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+208], rax
    lea rcx, msg28
    mov edx, msg28_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b9
adenc_aden_io_Path_joinNormalizedParts__List_b9:
    lea rcx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4
    mov edx, adenc_aden_io_Path_joinNormalizedParts__List_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_joinNormalizedParts__List_b6
adenc_aden_io_Path_joinNormalizedParts__List_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
adenc_aden_io_Path_joinNormalizedParts__List_epilogue_post:
    mov qword ptr [rsp+160], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
adenc_aden_io_Path_joinNormalizedParts__List endp

adenc_aden_io_Path_rootPrefix__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m213
    mov edx, trace_m213_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_io_Path_rootPrefix__String_b0:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s0
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    lea rcx, msg29
    mov edx, msg29_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+120]
    call adenc_aden_lang_String_startsWith__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    test eax, eax
    jne adenc_aden_io_Path_rootPrefix__String_b1
    jmp adenc_aden_io_Path_rootPrefix__String_b2
adenc_aden_io_Path_rootPrefix__String_b1:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s1
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg30
    mov edx, msg30_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_rootPrefix__String_epilogue
adenc_aden_io_Path_rootPrefix__String_b2:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s0
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_rootPrefix__String_b3
adenc_aden_io_Path_rootPrefix__String_b3:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s2
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_io_Path_hasWindowsDriveRoot__String
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    test eax, eax
    jne adenc_aden_io_Path_rootPrefix__String_b4
    jmp adenc_aden_io_Path_rootPrefix__String_b5
adenc_aden_io_Path_rootPrefix__String_b4:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s3
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s3_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_substring__int_int
    jmp adenc_aden_io_Path_rootPrefix__String_epilogue
adenc_aden_io_Path_rootPrefix__String_b5:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s2
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_rootPrefix__String_b6
adenc_aden_io_Path_rootPrefix__String_b6:
    lea rcx, adenc_aden_io_Path_rootPrefix__String_trace_s4
    mov edx, adenc_aden_io_Path_rootPrefix__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg31
    mov edx, msg31_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_io_Path_rootPrefix__String_epilogue
adenc_aden_io_Path_rootPrefix__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_io_Path_rootPrefix__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_io_Path_rootPrefix__String endp

adenc_aden_io_Path_hasWindowsDriveRoot__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m219
    mov edx, trace_m219_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
adenc_aden_io_Path_hasWindowsDriveRoot__String_b0:
    lea rcx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0
    mov edx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 3
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_io_Path_hasWindowsDriveRoot__String_b1
    jmp adenc_aden_io_Path_hasWindowsDriveRoot__String_b2
adenc_aden_io_Path_hasWindowsDriveRoot__String_b1:
    lea rcx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s1
    mov edx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_io_Path_hasWindowsDriveRoot__String_epilogue
adenc_aden_io_Path_hasWindowsDriveRoot__String_b2:
    lea rcx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0
    mov edx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_io_Path_hasWindowsDriveRoot__String_b3
adenc_aden_io_Path_hasWindowsDriveRoot__String_b3:
    lea rcx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s2
    mov edx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s3
    mov edx, adenc_aden_io_Path_hasWindowsDriveRoot__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call adenc_aden_io_Path_isAsciiLetter__char
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
    call adenc_aden_lang_String_charAt__int
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, 47
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
Path_hasWindowsDriveRoot_ternary_done_3_28:
    jmp adenc_aden_io_Path_hasWindowsDriveRoot__String_epilogue
adenc_aden_io_Path_hasWindowsDriveRoot__String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
adenc_aden_io_Path_hasWindowsDriveRoot__String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
adenc_aden_io_Path_hasWindowsDriveRoot__String endp

adenc_aden_io_Path_isAsciiLetter__char proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m224
    mov edx, trace_m224_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
adenc_aden_io_Path_isAsciiLetter__char_b0:
    lea rcx, adenc_aden_io_Path_isAsciiLetter__char_trace_s0
    mov edx, adenc_aden_io_Path_isAsciiLetter__char_trace_s0_len
    call adenc_rt_traceUpdateTop
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
    jmp adenc_aden_io_Path_isAsciiLetter__char_epilogue
adenc_aden_io_Path_isAsciiLetter__char_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
adenc_aden_io_Path_isAsciiLetter__char_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
adenc_aden_io_Path_isAsciiLetter__char endp

end
