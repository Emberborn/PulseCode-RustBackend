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
extrn adenc_rt_fpToInt:proc
extrn adenc_rt_fpToLong:proc
extrn adenc_rt_dispatchNullReceiverPanic:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_Double_doubleValue__Double:proc
extrn adenc_aden_lang_Double_parse__String:proc
extrn adenc_aden_lang_Integer_toString__int:proc
extrn adenc_aden_lang_Long_toString__long:proc
extrn adenc_aden_lang_StringBuilder_StringBuilder:proc
extrn adenc_aden_lang_StringBuilder_append__String:proc
extrn adenc_aden_lang_StringBuilder_append__char:proc
extrn adenc_aden_lang_StringBuilder_toString:proc
extrn adenc_aden_lang_String_charAt__int:proc
extrn adenc_aden_lang_String_concat__String:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
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

public adenc_fld_aden_lang_Float_MIN_VALUE
public adenc_fget_aden_lang_Float_MIN_VALUE
public adenc_fset_aden_lang_Float_MIN_VALUE
public adenc_fld_aden_lang_Float_MAX_VALUE
public adenc_fget_aden_lang_Float_MAX_VALUE
public adenc_fset_aden_lang_Float_MAX_VALUE

.data
written dq 0
adenc_objc_aden_lang_Float dd 0
adenc_fld_aden_lang_Float_MIN_VALUE dq 0
adenc_fld_aden_lang_Float_MAX_VALUE dq 0
trace_m0 db "aden.lang.Float.valueOf"
trace_m0_len equ 23
adenc_aden_lang_Float_valueOf__float_trace_s0 db "aden.lang.Float.valueOf(Float.aden:22)"
adenc_aden_lang_Float_valueOf__float_trace_s0_len equ 38
trace_m2 db "aden.lang.Float.parse"
trace_m2_len equ 21
adenc_aden_lang_Float_parse__String_trace_s0 db "aden.lang.Float.parse(Float.aden:30)"
adenc_aden_lang_Float_parse__String_trace_s0_len equ 36
trace_m4 db "aden.lang.Float.floatValue"
trace_m4_len equ 26
adenc_aden_lang_Float_floatValue__Float_trace_s0 db "aden.lang.Float.floatValue(Float.aden:38)"
adenc_aden_lang_Float_floatValue__Float_trace_s0_len equ 41
trace_m6 db "aden.lang.Float.equals"
trace_m6_len equ 22
adenc_aden_lang_Float_equals__float_float_trace_s0 db "aden.lang.Float.equals(Float.aden:46)"
adenc_aden_lang_Float_equals__float_float_trace_s0_len equ 37
trace_m8 db "aden.lang.Float.compare"
trace_m8_len equ 23
adenc_aden_lang_Float_compare__float_float_trace_s0 db "aden.lang.Float.compare(Float.aden:54)"
adenc_aden_lang_Float_compare__float_float_trace_s0_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s1 db "aden.lang.Float.compare(Float.aden:55)"
adenc_aden_lang_Float_compare__float_float_trace_s1_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s2 db "aden.lang.Float.compare(Float.aden:57)"
adenc_aden_lang_Float_compare__float_float_trace_s2_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s3 db "aden.lang.Float.compare(Float.aden:58)"
adenc_aden_lang_Float_compare__float_float_trace_s3_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s4 db "aden.lang.Float.compare(Float.aden:60)"
adenc_aden_lang_Float_compare__float_float_trace_s4_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s5 db "aden.lang.Float.compare(Float.aden:61)"
adenc_aden_lang_Float_compare__float_float_trace_s5_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s6 db "aden.lang.Float.compare(Float.aden:63)"
adenc_aden_lang_Float_compare__float_float_trace_s6_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s7 db "aden.lang.Float.compare(Float.aden:64)"
adenc_aden_lang_Float_compare__float_float_trace_s7_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s8 db "aden.lang.Float.compare(Float.aden:65)"
adenc_aden_lang_Float_compare__float_float_trace_s8_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s9 db "aden.lang.Float.compare(Float.aden:66)"
adenc_aden_lang_Float_compare__float_float_trace_s9_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s10 db "aden.lang.Float.compare(Float.aden:68)"
adenc_aden_lang_Float_compare__float_float_trace_s10_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s11 db "aden.lang.Float.compare(Float.aden:69)"
adenc_aden_lang_Float_compare__float_float_trace_s11_len equ 38
adenc_aden_lang_Float_compare__float_float_trace_s12 db "aden.lang.Float.compare(Float.aden:71)"
adenc_aden_lang_Float_compare__float_float_trace_s12_len equ 38
trace_m22 db "aden.lang.Float.toString"
trace_m22_len equ 24
adenc_aden_lang_Float_toString__float_trace_s0 db "aden.lang.Float.toString(Float.aden:79)"
adenc_aden_lang_Float_toString__float_trace_s0_len equ 39
adenc_aden_lang_Float_toString__float_trace_s1 db "aden.lang.Float.toString(Float.aden:80)"
adenc_aden_lang_Float_toString__float_trace_s1_len equ 39
adenc_aden_lang_Float_toString__float_trace_s2 db "aden.lang.Float.toString(Float.aden:81)"
adenc_aden_lang_Float_toString__float_trace_s2_len equ 39
adenc_aden_lang_Float_toString__float_trace_s3 db "aden.lang.Float.toString(Float.aden:83)"
adenc_aden_lang_Float_toString__float_trace_s3_len equ 39
adenc_aden_lang_Float_toString__float_trace_s4 db "aden.lang.Float.toString(Float.aden:84)"
adenc_aden_lang_Float_toString__float_trace_s4_len equ 39
adenc_aden_lang_Float_toString__float_trace_s5 db "aden.lang.Float.toString(Float.aden:85)"
adenc_aden_lang_Float_toString__float_trace_s5_len equ 39
adenc_aden_lang_Float_toString__float_trace_s6 db "aden.lang.Float.toString(Float.aden:87)"
adenc_aden_lang_Float_toString__float_trace_s6_len equ 39
adenc_aden_lang_Float_toString__float_trace_s7 db "aden.lang.Float.toString(Float.aden:89)"
adenc_aden_lang_Float_toString__float_trace_s7_len equ 39
adenc_aden_lang_Float_toString__float_trace_s8 db "aden.lang.Float.toString(Float.aden:90)"
adenc_aden_lang_Float_toString__float_trace_s8_len equ 39
adenc_aden_lang_Float_toString__float_trace_s9 db "aden.lang.Float.toString(Float.aden:91)"
adenc_aden_lang_Float_toString__float_trace_s9_len equ 39
adenc_aden_lang_Float_toString__float_trace_s10 db "aden.lang.Float.toString(Float.aden:94)"
adenc_aden_lang_Float_toString__float_trace_s10_len equ 39
adenc_aden_lang_Float_toString__float_trace_s11 db "aden.lang.Float.toString(Float.aden:95)"
adenc_aden_lang_Float_toString__float_trace_s11_len equ 39
adenc_aden_lang_Float_toString__float_trace_s12 db "aden.lang.Float.toString(Float.aden:96)"
adenc_aden_lang_Float_toString__float_trace_s12_len equ 39
adenc_aden_lang_Float_toString__float_trace_s13 db "aden.lang.Float.toString(Float.aden:97)"
adenc_aden_lang_Float_toString__float_trace_s13_len equ 39
adenc_aden_lang_Float_toString__float_trace_s14 db "aden.lang.Float.toString(Float.aden:99)"
adenc_aden_lang_Float_toString__float_trace_s14_len equ 39
adenc_aden_lang_Float_toString__float_trace_s15 db "aden.lang.Float.toString(Float.aden:100)"
adenc_aden_lang_Float_toString__float_trace_s15_len equ 40
adenc_aden_lang_Float_toString__float_trace_s16 db "aden.lang.Float.toString(Float.aden:101)"
adenc_aden_lang_Float_toString__float_trace_s16_len equ 40
adenc_aden_lang_Float_toString__float_trace_s17 db "aden.lang.Float.toString(Float.aden:104)"
adenc_aden_lang_Float_toString__float_trace_s17_len equ 40
adenc_aden_lang_Float_toString__float_trace_s18 db "aden.lang.Float.toString(Float.aden:105)"
adenc_aden_lang_Float_toString__float_trace_s18_len equ 40
adenc_aden_lang_Float_toString__float_trace_s19 db "aden.lang.Float.toString(Float.aden:108)"
adenc_aden_lang_Float_toString__float_trace_s19_len equ 40
adenc_aden_lang_Float_toString__float_trace_s20 db "aden.lang.Float.toString(Float.aden:109)"
adenc_aden_lang_Float_toString__float_trace_s20_len equ 40
adenc_aden_lang_Float_toString__float_trace_s21 db "aden.lang.Float.toString(Float.aden:110)"
adenc_aden_lang_Float_toString__float_trace_s21_len equ 40
adenc_aden_lang_Float_toString__float_trace_s22 db "aden.lang.Float.toString(Float.aden:111)"
adenc_aden_lang_Float_toString__float_trace_s22_len equ 40
adenc_aden_lang_Float_toString__float_trace_s23 db "aden.lang.Float.toString(Float.aden:112)"
adenc_aden_lang_Float_toString__float_trace_s23_len equ 40
adenc_aden_lang_Float_toString__float_trace_s24 db "aden.lang.Float.toString(Float.aden:114)"
adenc_aden_lang_Float_toString__float_trace_s24_len equ 40
adenc_aden_lang_Float_toString__float_trace_s25 db "aden.lang.Float.toString(Float.aden:117)"
adenc_aden_lang_Float_toString__float_trace_s25_len equ 40
adenc_aden_lang_Float_toString__float_trace_s26 db "aden.lang.Float.toString(Float.aden:118)"
adenc_aden_lang_Float_toString__float_trace_s26_len equ 40
adenc_aden_lang_Float_toString__float_trace_s27 db "aden.lang.Float.toString(Float.aden:119)"
adenc_aden_lang_Float_toString__float_trace_s27_len equ 40
adenc_aden_lang_Float_toString__float_trace_s28 db "aden.lang.Float.toString(Float.aden:120)"
adenc_aden_lang_Float_toString__float_trace_s28_len equ 40
adenc_aden_lang_Float_toString__float_trace_s29 db "aden.lang.Float.toString(Float.aden:121)"
adenc_aden_lang_Float_toString__float_trace_s29_len equ 40
adenc_aden_lang_Float_toString__float_trace_s30 db "aden.lang.Float.toString(Float.aden:122)"
adenc_aden_lang_Float_toString__float_trace_s30_len equ 40
adenc_aden_lang_Float_toString__float_trace_s31 db "aden.lang.Float.toString(Float.aden:124)"
adenc_aden_lang_Float_toString__float_trace_s31_len equ 40
adenc_aden_lang_Float_toString__float_trace_s32 db "aden.lang.Float.toString(Float.aden:125)"
adenc_aden_lang_Float_toString__float_trace_s32_len equ 40
adenc_aden_lang_Float_toString__float_trace_s33 db "aden.lang.Float.toString(Float.aden:126)"
adenc_aden_lang_Float_toString__float_trace_s33_len equ 40
adenc_aden_lang_Float_toString__float_trace_s34 db "aden.lang.Float.toString(Float.aden:127)"
adenc_aden_lang_Float_toString__float_trace_s34_len equ 40
adenc_aden_lang_Float_toString__float_trace_s35 db "aden.lang.Float.toString(Float.aden:130)"
adenc_aden_lang_Float_toString__float_trace_s35_len equ 40
adenc_aden_lang_Float_toString__float_trace_s36 db "aden.lang.Float.toString(Float.aden:131)"
adenc_aden_lang_Float_toString__float_trace_s36_len equ 40
adenc_aden_lang_Float_toString__float_trace_s37 db "aden.lang.Float.toString(Float.aden:132)"
adenc_aden_lang_Float_toString__float_trace_s37_len equ 40
adenc_aden_lang_Float_toString__float_trace_s38 db "aden.lang.Float.toString(Float.aden:133)"
adenc_aden_lang_Float_toString__float_trace_s38_len equ 40
adenc_aden_lang_Float_toString__float_trace_s39 db "aden.lang.Float.toString(Float.aden:134)"
adenc_aden_lang_Float_toString__float_trace_s39_len equ 40
adenc_aden_lang_Float_toString__float_trace_s40 db "aden.lang.Float.toString(Float.aden:135)"
adenc_aden_lang_Float_toString__float_trace_s40_len equ 40
adenc_aden_lang_Float_toString__float_trace_s41 db "aden.lang.Float.toString(Float.aden:136)"
adenc_aden_lang_Float_toString__float_trace_s41_len equ 40
adenc_aden_lang_Float_toString__float_trace_s42 db "aden.lang.Float.toString(Float.aden:139)"
adenc_aden_lang_Float_toString__float_trace_s42_len equ 40
adenc_aden_lang_Float_toString__float_trace_s43 db "aden.lang.Float.toString(Float.aden:140)"
adenc_aden_lang_Float_toString__float_trace_s43_len equ 40
adenc_aden_lang_Float_toString__float_trace_s44 db "aden.lang.Float.toString(Float.aden:141)"
adenc_aden_lang_Float_toString__float_trace_s44_len equ 40
adenc_aden_lang_Float_toString__float_trace_s45 db "aden.lang.Float.toString(Float.aden:142)"
adenc_aden_lang_Float_toString__float_trace_s45_len equ 40
adenc_aden_lang_Float_toString__float_trace_s46 db "aden.lang.Float.toString(Float.aden:144)"
adenc_aden_lang_Float_toString__float_trace_s46_len equ 40
adenc_aden_lang_Float_toString__float_trace_s47 db "aden.lang.Float.toString(Float.aden:145)"
adenc_aden_lang_Float_toString__float_trace_s47_len equ 40
adenc_aden_lang_Float_toString__float_trace_s48 db "aden.lang.Float.toString(Float.aden:146)"
adenc_aden_lang_Float_toString__float_trace_s48_len equ 40
adenc_aden_lang_Float_toString__float_trace_s49 db "aden.lang.Float.toString(Float.aden:147)"
adenc_aden_lang_Float_toString__float_trace_s49_len equ 40
adenc_aden_lang_Float_toString__float_trace_s50 db "aden.lang.Float.toString(Float.aden:148)"
adenc_aden_lang_Float_toString__float_trace_s50_len equ 40
adenc_aden_lang_Float_toString__float_trace_s51 db "aden.lang.Float.toString(Float.aden:149)"
adenc_aden_lang_Float_toString__float_trace_s51_len equ 40
adenc_aden_lang_Float_toString__float_trace_s52 db "aden.lang.Float.toString(Float.aden:150)"
adenc_aden_lang_Float_toString__float_trace_s52_len equ 40
adenc_aden_lang_Float_toString__float_trace_s53 db "aden.lang.Float.toString(Float.aden:151)"
adenc_aden_lang_Float_toString__float_trace_s53_len equ 40
adenc_aden_lang_Float_toString__float_trace_s54 db "aden.lang.Float.toString(Float.aden:153)"
adenc_aden_lang_Float_toString__float_trace_s54_len equ 40
adenc_aden_lang_Float_toString__float_trace_s55 db "aden.lang.Float.toString(Float.aden:154)"
adenc_aden_lang_Float_toString__float_trace_s55_len equ 40
adenc_aden_lang_Float_toString__float_trace_s56 db "aden.lang.Float.toString(Float.aden:156)"
adenc_aden_lang_Float_toString__float_trace_s56_len equ 40
adenc_aden_lang_Float_toString__float_trace_s57 db "aden.lang.Float.toString(Float.aden:157)"
adenc_aden_lang_Float_toString__float_trace_s57_len equ 40
adenc_aden_lang_Float_toString__float_trace_s58 db "aden.lang.Float.toString(Float.aden:158)"
adenc_aden_lang_Float_toString__float_trace_s58_len equ 40
adenc_aden_lang_Float_toString__float_trace_s59 db "aden.lang.Float.toString(Float.aden:159)"
adenc_aden_lang_Float_toString__float_trace_s59_len equ 40
adenc_aden_lang_Float_toString__float_trace_s60 db "aden.lang.Float.toString(Float.aden:161)"
adenc_aden_lang_Float_toString__float_trace_s60_len equ 40
adenc_aden_lang_Float_toString__float_trace_s61 db "aden.lang.Float.toString(Float.aden:162)"
adenc_aden_lang_Float_toString__float_trace_s61_len equ 40
adenc_aden_lang_Float_toString__float_trace_s62 db "aden.lang.Float.toString(Float.aden:164)"
adenc_aden_lang_Float_toString__float_trace_s62_len equ 40
adenc_aden_lang_Float_toString__float_trace_s63 db "aden.lang.Float.toString(Float.aden:165)"
adenc_aden_lang_Float_toString__float_trace_s63_len equ 40
adenc_aden_lang_Float_toString__float_trace_s64 db "aden.lang.Float.toString(Float.aden:166)"
adenc_aden_lang_Float_toString__float_trace_s64_len equ 40
adenc_aden_lang_Float_toString__float_trace_s65 db "aden.lang.Float.toString(Float.aden:167)"
adenc_aden_lang_Float_toString__float_trace_s65_len equ 40
adenc_aden_lang_Float_toString__float_trace_s66 db "aden.lang.Float.toString(Float.aden:170)"
adenc_aden_lang_Float_toString__float_trace_s66_len equ 40
adenc_aden_lang_Float_toString__float_trace_s67 db "aden.lang.Float.toString(Float.aden:173)"
adenc_aden_lang_Float_toString__float_trace_s67_len equ 40
adenc_aden_lang_Float_toString__float_trace_s68 db "aden.lang.Float.toString(Float.aden:174)"
adenc_aden_lang_Float_toString__float_trace_s68_len equ 40
adenc_aden_lang_Float_toString__float_trace_s69 db "aden.lang.Float.toString(Float.aden:175)"
adenc_aden_lang_Float_toString__float_trace_s69_len equ 40
adenc_aden_lang_Float_toString__float_trace_s70 db "aden.lang.Float.toString(Float.aden:176)"
adenc_aden_lang_Float_toString__float_trace_s70_len equ 40
adenc_aden_lang_Float_toString__float_trace_s71 db "aden.lang.Float.toString(Float.aden:177)"
adenc_aden_lang_Float_toString__float_trace_s71_len equ 40
adenc_aden_lang_Float_toString__float_trace_s72 db "aden.lang.Float.toString(Float.aden:178)"
adenc_aden_lang_Float_toString__float_trace_s72_len equ 40
adenc_aden_lang_Float_toString__float_trace_s73 db "aden.lang.Float.toString(Float.aden:180)"
adenc_aden_lang_Float_toString__float_trace_s73_len equ 40
adenc_aden_lang_Float_toString__float_trace_s74 db "aden.lang.Float.toString(Float.aden:181)"
adenc_aden_lang_Float_toString__float_trace_s74_len equ 40
adenc_aden_lang_Float_toString__float_trace_s75 db "aden.lang.Float.toString(Float.aden:182)"
adenc_aden_lang_Float_toString__float_trace_s75_len equ 40
adenc_aden_lang_Float_toString__float_trace_s76 db "aden.lang.Float.toString(Float.aden:184)"
adenc_aden_lang_Float_toString__float_trace_s76_len equ 40
adenc_aden_lang_Float_toString__float_trace_s77 db "aden.lang.Float.toString(Float.aden:185)"
adenc_aden_lang_Float_toString__float_trace_s77_len equ 40
adenc_aden_lang_Float_toString__float_trace_s78 db "aden.lang.Float.toString(Float.aden:186)"
adenc_aden_lang_Float_toString__float_trace_s78_len equ 40
adenc_aden_lang_Float_toString__float_trace_s79 db "aden.lang.Float.toString(Float.aden:187)"
adenc_aden_lang_Float_toString__float_trace_s79_len equ 40
adenc_aden_lang_Float_toString__float_trace_s80 db "aden.lang.Float.toString(Float.aden:189)"
adenc_aden_lang_Float_toString__float_trace_s80_len equ 40
adenc_aden_lang_Float_toString__float_trace_s81 db "aden.lang.Float.toString(Float.aden:192)"
adenc_aden_lang_Float_toString__float_trace_s81_len equ 40
adenc_aden_lang_Float_toString__float_trace_s82 db "aden.lang.Float.toString(Float.aden:193)"
adenc_aden_lang_Float_toString__float_trace_s82_len equ 40
adenc_aden_lang_Float_toString__float_trace_s83 db "aden.lang.Float.toString(Float.aden:194)"
adenc_aden_lang_Float_toString__float_trace_s83_len equ 40
adenc_aden_lang_Float_toString__float_trace_s84 db "aden.lang.Float.toString(Float.aden:195)"
adenc_aden_lang_Float_toString__float_trace_s84_len equ 40
adenc_aden_lang_Float_toString__float_trace_s85 db "aden.lang.Float.toString(Float.aden:196)"
adenc_aden_lang_Float_toString__float_trace_s85_len equ 40
adenc_aden_lang_Float_toString__float_trace_s86 db "aden.lang.Float.toString(Float.aden:198)"
adenc_aden_lang_Float_toString__float_trace_s86_len equ 40
adenc_aden_lang_Float_toString__float_trace_s87 db "aden.lang.Float.toString(Float.aden:199)"
adenc_aden_lang_Float_toString__float_trace_s87_len equ 40
adenc_aden_lang_Float_toString__float_trace_s88 db "aden.lang.Float.toString(Float.aden:201)"
adenc_aden_lang_Float_toString__float_trace_s88_len equ 40
adenc_aden_lang_Float_toString__float_trace_s89 db "aden.lang.Float.toString(Float.aden:202)"
adenc_aden_lang_Float_toString__float_trace_s89_len equ 40
adenc_aden_lang_Float_toString__float_trace_s90 db "aden.lang.Float.toString(Float.aden:203)"
adenc_aden_lang_Float_toString__float_trace_s90_len equ 40
adenc_aden_lang_Float_toString__float_trace_s91 db "aden.lang.Float.toString(Float.aden:204)"
adenc_aden_lang_Float_toString__float_trace_s91_len equ 40
adenc_aden_lang_Float_toString__float_trace_s92 db "aden.lang.Float.toString(Float.aden:207)"
adenc_aden_lang_Float_toString__float_trace_s92_len equ 40
adenc_aden_lang_Float_toString__float_trace_s93 db "aden.lang.Float.toString(Float.aden:208)"
adenc_aden_lang_Float_toString__float_trace_s93_len equ 40
adenc_aden_lang_Float_toString__float_trace_s94 db "aden.lang.Float.toString(Float.aden:209)"
adenc_aden_lang_Float_toString__float_trace_s94_len equ 40
trace_m118 db "aden.lang.Float.buildMinValue"
trace_m118_len equ 29
adenc_aden_lang_Float_buildMinValue_trace_s0 db "aden.lang.Float.buildMinValue(Float.aden:213)"
adenc_aden_lang_Float_buildMinValue_trace_s0_len equ 45
adenc_aden_lang_Float_buildMinValue_trace_s1 db "aden.lang.Float.buildMinValue(Float.aden:214)"
adenc_aden_lang_Float_buildMinValue_trace_s1_len equ 45
adenc_aden_lang_Float_buildMinValue_trace_s2 db "aden.lang.Float.buildMinValue(Float.aden:215)"
adenc_aden_lang_Float_buildMinValue_trace_s2_len equ 45
adenc_aden_lang_Float_buildMinValue_trace_s3 db "aden.lang.Float.buildMinValue(Float.aden:216)"
adenc_aden_lang_Float_buildMinValue_trace_s3_len equ 45
adenc_aden_lang_Float_buildMinValue_trace_s4 db "aden.lang.Float.buildMinValue(Float.aden:217)"
adenc_aden_lang_Float_buildMinValue_trace_s4_len equ 45
adenc_aden_lang_Float_buildMinValue_trace_s5 db "aden.lang.Float.buildMinValue(Float.aden:219)"
adenc_aden_lang_Float_buildMinValue_trace_s5_len equ 45
trace_m125 db "aden.lang.Float.buildMaxValue"
trace_m125_len equ 29
adenc_aden_lang_Float_buildMaxValue_trace_s0 db "aden.lang.Float.buildMaxValue(Float.aden:223)"
adenc_aden_lang_Float_buildMaxValue_trace_s0_len equ 45
adenc_aden_lang_Float_buildMaxValue_trace_s1 db "aden.lang.Float.buildMaxValue(Float.aden:224)"
adenc_aden_lang_Float_buildMaxValue_trace_s1_len equ 45
adenc_aden_lang_Float_buildMaxValue_trace_s2 db "aden.lang.Float.buildMaxValue(Float.aden:225)"
adenc_aden_lang_Float_buildMaxValue_trace_s2_len equ 45
adenc_aden_lang_Float_buildMaxValue_trace_s3 db "aden.lang.Float.buildMaxValue(Float.aden:226)"
adenc_aden_lang_Float_buildMaxValue_trace_s3_len equ 45
adenc_aden_lang_Float_buildMaxValue_trace_s4 db "aden.lang.Float.buildMaxValue(Float.aden:227)"
adenc_aden_lang_Float_buildMaxValue_trace_s4_len equ 45
adenc_aden_lang_Float_buildMaxValue_trace_s5 db "aden.lang.Float.buildMaxValue(Float.aden:229)"
adenc_aden_lang_Float_buildMaxValue_trace_s5_len equ 45
msg0 db "NaN"
msg0_len equ 3
msg1 db "-0.0"
msg1_len equ 4
msg2 db "0.0"
msg2_len equ 3
msg3 db "-"
msg3_len equ 1
msg4 db ".0"
msg4_len equ 2
msg5 db ".0"
msg5_len equ 2

.code
adenc_aden_lang_Float_valueOf__float proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Float_valueOf__float_b0:
    lea rcx, adenc_aden_lang_Float_valueOf__float_trace_s0
    mov edx, adenc_aden_lang_Float_valueOf__float_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Float_valueOf__float_epilogue
adenc_aden_lang_Float_valueOf__float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Float_valueOf__float endp

adenc_aden_lang_Float_parse__String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Float_parse__String_b0:
    lea rcx, adenc_aden_lang_Float_parse__String_trace_s0
    mov edx, adenc_aden_lang_Float_parse__String_trace_s0_len
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
    call adenc_aden_lang_Double_parse__String
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
    call adenc_aden_lang_Double_doubleValue__Double
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_lang_Float_valueOf__float
    jmp adenc_aden_lang_Float_parse__String_epilogue
adenc_aden_lang_Float_parse__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 312
    ret
adenc_aden_lang_Float_parse__String endp

adenc_aden_lang_Float_floatValue__Float proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Float_floatValue__Float_b0:
    lea rcx, adenc_aden_lang_Float_floatValue__Float_trace_s0
    mov edx, adenc_aden_lang_Float_floatValue__Float_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Float_floatValue__Float_epilogue
adenc_aden_lang_Float_floatValue__Float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Float_floatValue__Float endp

adenc_aden_lang_Float_equals__float_float proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Float_equals__float_float_b0:
    lea rcx, adenc_aden_lang_Float_equals__float_float_trace_s0
    mov edx, adenc_aden_lang_Float_equals__float_float_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    ucomisd xmm0, xmm1
    jp Float_equals_fp_cmp_0_2_unordered
    sete al
    jmp Float_equals_fp_cmp_0_2_done
Float_equals_fp_cmp_0_2_unordered:
    xor eax, eax
Float_equals_fp_cmp_0_2_done:
    movzx eax, al
    jmp adenc_aden_lang_Float_equals__float_float_epilogue
adenc_aden_lang_Float_equals__float_float_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Float_equals__float_float endp

adenc_aden_lang_Float_compare__float_float proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
adenc_aden_lang_Float_compare__float_float_b0:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s0
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+96], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+96]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_0_2_unordered
    setb al
    jmp Float_compare_fp_cmp_0_2_done
Float_compare_fp_cmp_0_2_unordered:
    xor eax, eax
Float_compare_fp_cmp_0_2_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_compare__float_float_b1
    jmp adenc_aden_lang_Float_compare__float_float_b2
adenc_aden_lang_Float_compare__float_float_b1:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s1
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_b2:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s0
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_compare__float_float_b3
adenc_aden_lang_Float_compare__float_float_b3:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s2
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+104], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+104]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_2_7_unordered
    seta al
    jmp Float_compare_fp_cmp_2_7_done
Float_compare_fp_cmp_2_7_unordered:
    xor eax, eax
Float_compare_fp_cmp_2_7_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_compare__float_float_b4
    jmp adenc_aden_lang_Float_compare__float_float_b5
adenc_aden_lang_Float_compare__float_float_b4:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s3
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_b5:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s2
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_compare__float_float_b6
adenc_aden_lang_Float_compare__float_float_b6:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s4
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+112], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+112]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_4_11_unordered
    sete al
    jmp Float_compare_fp_cmp_4_11_done
Float_compare_fp_cmp_4_11_unordered:
    xor eax, eax
Float_compare_fp_cmp_4_11_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_compare__float_float_b7
    jmp adenc_aden_lang_Float_compare__float_float_b8
adenc_aden_lang_Float_compare__float_float_b7:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s5
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_b8:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s4
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_compare__float_float_b9
adenc_aden_lang_Float_compare__float_float_b9:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s6
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+120], xmm0
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+120]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_6_15_unordered
    setne al
    jmp Float_compare_fp_cmp_6_15_done
Float_compare_fp_cmp_6_15_unordered:
    mov al, 1
Float_compare_fp_cmp_6_15_done:
    movzx eax, al
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s7
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+128], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+128]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_7_18_unordered
    setne al
    jmp Float_compare_fp_cmp_7_18_done
Float_compare_fp_cmp_7_18_unordered:
    mov al, 1
Float_compare_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s8
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Float_compare_ternary_then_8_22
    mov eax, 0
    jmp Float_compare_ternary_done_8_22
Float_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Float_compare_ternary_done_8_22:
    test eax, eax
    jne adenc_aden_lang_Float_compare__float_float_b10
    jmp adenc_aden_lang_Float_compare__float_float_b11
adenc_aden_lang_Float_compare__float_float_b10:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s9
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_b11:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s8
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_compare__float_float_b12
adenc_aden_lang_Float_compare__float_float_b12:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s10
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne adenc_aden_lang_Float_compare__float_float_b13
    jmp adenc_aden_lang_Float_compare__float_float_b14
adenc_aden_lang_Float_compare__float_float_b13:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s11
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_b14:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s10
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s10_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_compare__float_float_b15
adenc_aden_lang_Float_compare__float_float_b15:
    lea rcx, adenc_aden_lang_Float_compare__float_float_trace_s12
    mov edx, adenc_aden_lang_Float_compare__float_float_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp adenc_aden_lang_Float_compare__float_float_epilogue
adenc_aden_lang_Float_compare__float_float_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
adenc_aden_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+176], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 264
    ret
adenc_aden_lang_Float_compare__float_float endp

adenc_aden_lang_Float_toString__float proc
    sub rsp, 904
    mov qword ptr [rsp+872], rcx
    mov qword ptr [rsp+880], rdx
    mov qword ptr [rsp+888], r8
    mov qword ptr [rsp+896], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+872]
    mov rdx, qword ptr [rsp+880]
    mov r8, qword ptr [rsp+888]
    mov r9, qword ptr [rsp+896]
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+176], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+168], 0
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+144], 0
adenc_aden_lang_Float_toString__float_b0:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s0
    mov edx, adenc_aden_lang_Float_toString__float_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s1
    mov edx, adenc_aden_lang_Float_toString__float_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+208], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+208]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_1_4_unordered
    setne al
    jmp Float_toString_fp_cmp_1_4_done
Float_toString_fp_cmp_1_4_unordered:
    mov al, 1
Float_toString_fp_cmp_1_4_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b1
    jmp adenc_aden_lang_Float_toString__float_b2
adenc_aden_lang_Float_toString__float_b1:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s2
    mov edx, adenc_aden_lang_Float_toString__float_trace_s2_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b2:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s1
    mov edx, adenc_aden_lang_Float_toString__float_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b3
adenc_aden_lang_Float_toString__float_b3:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s3
    mov edx, adenc_aden_lang_Float_toString__float_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+216], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+216]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_3_8_unordered
    sete al
    jmp Float_toString_fp_cmp_3_8_done
Float_toString_fp_cmp_3_8_unordered:
    xor eax, eax
Float_toString_fp_cmp_3_8_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b4
    jmp adenc_aden_lang_Float_toString__float_b5
adenc_aden_lang_Float_toString__float_b4:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s4
    mov edx, adenc_aden_lang_Float_toString__float_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, 4607182418800017408
    movq xmm0, rax
    movq qword ptr [rsp+224], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+224]
    divsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+232], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+232]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_4_13_unordered
    setb al
    jmp Float_toString_fp_cmp_4_13_done
Float_toString_fp_cmp_4_13_unordered:
    xor eax, eax
Float_toString_fp_cmp_4_13_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b7
    jmp adenc_aden_lang_Float_toString__float_b8
adenc_aden_lang_Float_toString__float_b5:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s3
    mov edx, adenc_aden_lang_Float_toString__float_trace_s3_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b6
adenc_aden_lang_Float_toString__float_b6:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s7
    mov edx, adenc_aden_lang_Float_toString__float_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+240], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+240]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_7_18_unordered
    setb al
    jmp Float_toString_fp_cmp_7_18_done
Float_toString_fp_cmp_7_18_unordered:
    xor eax, eax
Float_toString_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s8
    mov edx, adenc_aden_lang_Float_toString__float_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b10
    jmp adenc_aden_lang_Float_toString__float_b11
adenc_aden_lang_Float_toString__float_b7:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s5
    mov edx, adenc_aden_lang_Float_toString__float_trace_s5_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b8:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s4
    mov edx, adenc_aden_lang_Float_toString__float_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b9
adenc_aden_lang_Float_toString__float_b9:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s6
    mov edx, adenc_aden_lang_Float_toString__float_trace_s6_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b10:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s9
    mov edx, adenc_aden_lang_Float_toString__float_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+248], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+248]
    subsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s8
    mov edx, adenc_aden_lang_Float_toString__float_trace_s8_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b12
adenc_aden_lang_Float_toString__float_b11:
    jmp adenc_aden_lang_Float_toString__float_b12
adenc_aden_lang_Float_toString__float_b12:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s10
    mov edx, adenc_aden_lang_Float_toString__float_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s11
    mov edx, adenc_aden_lang_Float_toString__float_trace_s11_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b13
adenc_aden_lang_Float_toString__float_b13:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+256], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+256]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_11_27_unordered
    setae al
    jmp Float_toString_fp_cmp_11_27_done
Float_toString_fp_cmp_11_27_unordered:
    xor eax, eax
Float_toString_fp_cmp_11_27_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b14
    jmp adenc_aden_lang_Float_toString__float_b15
adenc_aden_lang_Float_toString__float_b14:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s12
    mov edx, adenc_aden_lang_Float_toString__float_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+264], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+264]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s13
    mov edx, adenc_aden_lang_Float_toString__float_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s11
    mov edx, adenc_aden_lang_Float_toString__float_trace_s11_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b13
adenc_aden_lang_Float_toString__float_b15:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s14
    mov edx, adenc_aden_lang_Float_toString__float_trace_s14_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b16
adenc_aden_lang_Float_toString__float_b16:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+280], xmm0
    mov rax, 4607182418800017408
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+280]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_14_38_unordered
    setb al
    jmp Float_toString_fp_cmp_14_38_done
Float_toString_fp_cmp_14_38_unordered:
    xor eax, eax
Float_toString_fp_cmp_14_38_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b17
    jmp adenc_aden_lang_Float_toString__float_b18
adenc_aden_lang_Float_toString__float_b17:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s15
    mov edx, adenc_aden_lang_Float_toString__float_trace_s15_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+288], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+288]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s16
    mov edx, adenc_aden_lang_Float_toString__float_trace_s16_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+296], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s14
    mov edx, adenc_aden_lang_Float_toString__float_trace_s14_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b16
adenc_aden_lang_Float_toString__float_b18:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s17
    mov edx, adenc_aden_lang_Float_toString__float_trace_s17_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movq qword ptr [rsp+304], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+304]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_17_50_unordered
    setb al
    jmp Float_toString_fp_cmp_17_50_done
Float_toString_fp_cmp_17_50_unordered:
    xor eax, eax
Float_toString_fp_cmp_17_50_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_17_57
    mov rax, qword ptr [rsp+200]
    jmp Float_toString_ternary_done_17_57
Float_toString_ternary_then_17_57:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+312], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+312]
    subsd xmm0, xmm1
    movq rax, xmm0
Float_toString_ternary_done_17_57:
    mov rcx, rax
    call adenc_rt_fpToLong
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s18
    mov edx, adenc_aden_lang_Float_toString__float_trace_s18_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+336], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movq qword ptr [rsp+320], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+320]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_18_65_unordered
    setb al
    jmp Float_toString_fp_cmp_18_65_done
Float_toString_fp_cmp_18_65_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_65_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_18_72
    mov rax, qword ptr [rsp+200]
    jmp Float_toString_ternary_done_18_72
Float_toString_ternary_then_18_72:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+328], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+328]
    subsd xmm0, xmm1
    movq rax, xmm0
Float_toString_ternary_done_18_72:
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+336]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_18_73_unordered
    sete al
    jmp Float_toString_fp_cmp_18_73_done
Float_toString_fp_cmp_18_73_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_73_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_18_78
    mov eax, 0
    jmp Float_toString_ternary_done_18_78
Float_toString_ternary_then_18_78:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+344], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+344]
    cmp eax, edx
    setge al
    movzx eax, al
Float_toString_ternary_done_18_78:
    test rax, rax
    jne Float_toString_ternary_then_18_82
    mov eax, 0
    jmp Float_toString_ternary_done_18_82
Float_toString_ternary_then_18_82:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+352], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+352]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_18_82:
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b19
    jmp adenc_aden_lang_Float_toString__float_b20
adenc_aden_lang_Float_toString__float_b19:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s19
    mov edx, adenc_aden_lang_Float_toString__float_trace_s19_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call adenc_aden_lang_Long_toString__long
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+96], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s20
    mov edx, adenc_aden_lang_Float_toString__float_trace_s20_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b22
    jmp adenc_aden_lang_Float_toString__float_b23
adenc_aden_lang_Float_toString__float_b20:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s18
    mov edx, adenc_aden_lang_Float_toString__float_trace_s18_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b21
adenc_aden_lang_Float_toString__float_b21:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s25
    mov edx, adenc_aden_lang_Float_toString__float_trace_s25_len
    call adenc_rt_traceUpdateTop
    mov eax, 7
    mov dword ptr [rsp+104], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s26
    mov edx, adenc_aden_lang_Float_toString__float_trace_s26_len
    call adenc_rt_traceUpdateTop
    mov rax, 4602678819172646912
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s27
    mov edx, adenc_aden_lang_Float_toString__float_trace_s27_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+120], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s28
    mov edx, adenc_aden_lang_Float_toString__float_trace_s28_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b25
adenc_aden_lang_Float_toString__float_b22:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s21
    mov edx, adenc_aden_lang_Float_toString__float_trace_s21_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+128], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s22
    mov edx, adenc_aden_lang_Float_toString__float_trace_s22_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+744], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+136], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s23
    mov edx, adenc_aden_lang_Float_toString__float_trace_s23_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+744], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b23:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s20
    mov edx, adenc_aden_lang_Float_toString__float_trace_s20_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b24
adenc_aden_lang_Float_toString__float_b24:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s24
    mov edx, adenc_aden_lang_Float_toString__float_trace_s24_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+744], rax
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b25:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s28
    mov edx, adenc_aden_lang_Float_toString__float_trace_s28_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+360], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+360]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b26
    jmp adenc_aden_lang_Float_toString__float_b27
adenc_aden_lang_Float_toString__float_b26:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s29
    mov edx, adenc_aden_lang_Float_toString__float_trace_s29_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    movq qword ptr [rsp+368], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+368]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s30
    mov edx, adenc_aden_lang_Float_toString__float_trace_s30_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+376], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+376]
    add eax, edx
    mov dword ptr [rsp+120], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s28
    mov edx, adenc_aden_lang_Float_toString__float_trace_s28_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b25
adenc_aden_lang_Float_toString__float_b27:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s31
    mov edx, adenc_aden_lang_Float_toString__float_trace_s31_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+384], xmm0
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+384]
    addsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s32
    mov edx, adenc_aden_lang_Float_toString__float_trace_s32_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+392], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+392]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_32_121_unordered
    setae al
    jmp Float_toString_fp_cmp_32_121_done
Float_toString_fp_cmp_32_121_unordered:
    xor eax, eax
Float_toString_fp_cmp_32_121_done:
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b28
    jmp adenc_aden_lang_Float_toString__float_b29
adenc_aden_lang_Float_toString__float_b28:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s33
    mov edx, adenc_aden_lang_Float_toString__float_trace_s33_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+400], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+400]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s34
    mov edx, adenc_aden_lang_Float_toString__float_trace_s34_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+408], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+408]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s32
    mov edx, adenc_aden_lang_Float_toString__float_trace_s32_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b30
adenc_aden_lang_Float_toString__float_b29:
    jmp adenc_aden_lang_Float_toString__float_b30
adenc_aden_lang_Float_toString__float_b30:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s35
    mov edx, adenc_aden_lang_Float_toString__float_trace_s35_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+144], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s36
    mov edx, adenc_aden_lang_Float_toString__float_trace_s36_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s37
    mov edx, adenc_aden_lang_Float_toString__float_trace_s37_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b31
adenc_aden_lang_Float_toString__float_b31:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+416], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+416]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b32
    jmp adenc_aden_lang_Float_toString__float_b33
adenc_aden_lang_Float_toString__float_b32:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s38
    mov edx, adenc_aden_lang_Float_toString__float_trace_s38_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_fpToInt
    mov dword ptr [rsp+160], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s39
    mov edx, adenc_aden_lang_Float_toString__float_trace_s39_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+424], eax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+424]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_32_39_2_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_32_39_2_done
adenc_aden_lang_Float_toString__float_vd_stmt_32_39_2_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_32_39_2_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s40
    mov edx, adenc_aden_lang_Float_toString__float_trace_s40_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+432], xmm0
    mov eax, dword ptr [rsp+160]
    movsxd rax, eax
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+432]
    subsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+440], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+440]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s41
    mov edx, adenc_aden_lang_Float_toString__float_trace_s41_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+448], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+448]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s37
    mov edx, adenc_aden_lang_Float_toString__float_trace_s37_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b31
adenc_aden_lang_Float_toString__float_b33:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s42
    mov edx, adenc_aden_lang_Float_toString__float_trace_s42_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd42_158_null
    call adenc_aden_lang_StringBuilder_toString
    jmp Float_toString_vd42_158_done
Float_toString_vd42_158_null:
    call adenc_rt_dispatchNullReceiverPanic
Float_toString_vd42_158_done:
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+168], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s43
    mov edx, adenc_aden_lang_Float_toString__float_trace_s43_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+176], rax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s44
    mov edx, adenc_aden_lang_Float_toString__float_trace_s44_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b34
    jmp adenc_aden_lang_Float_toString__float_b35
adenc_aden_lang_Float_toString__float_b34:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s45
    mov edx, adenc_aden_lang_Float_toString__float_trace_s45_len
    call adenc_rt_traceUpdateTop
    mov eax, 45
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_34_45_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_34_45_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_34_45_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_34_45_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s44
    mov edx, adenc_aden_lang_Float_toString__float_trace_s44_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b36
adenc_aden_lang_Float_toString__float_b35:
    jmp adenc_aden_lang_Float_toString__float_b36
adenc_aden_lang_Float_toString__float_b36:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s46
    mov edx, adenc_aden_lang_Float_toString__float_trace_s46_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+456], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+456]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_46_173
    mov eax, 0
    jmp Float_toString_ternary_done_46_173
Float_toString_ternary_then_46_173:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+464], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+464]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_46_173:
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b37
    jmp adenc_aden_lang_Float_toString__float_b38
adenc_aden_lang_Float_toString__float_b37:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s47
    mov edx, adenc_aden_lang_Float_toString__float_trace_s47_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+472], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+472]
    add eax, edx
    mov dword ptr [rsp+184], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s48
    mov edx, adenc_aden_lang_Float_toString__float_trace_s48_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s49
    mov edx, adenc_aden_lang_Float_toString__float_trace_s49_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+480], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+480]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b40
    jmp adenc_aden_lang_Float_toString__float_b41
adenc_aden_lang_Float_toString__float_b38:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s46
    mov edx, adenc_aden_lang_Float_toString__float_trace_s46_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b39
adenc_aden_lang_Float_toString__float_b39:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s81
    mov edx, adenc_aden_lang_Float_toString__float_trace_s81_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, 0
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_39_81_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_39_81_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_39_81_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_39_81_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s82
    mov edx, adenc_aden_lang_Float_toString__float_trace_s82_len
    call adenc_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_39_82_1_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_39_82_1_done
adenc_aden_lang_Float_toString__float_vd_stmt_39_82_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_39_82_1_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s83
    mov edx, adenc_aden_lang_Float_toString__float_trace_s83_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s84
    mov edx, adenc_aden_lang_Float_toString__float_trace_s84_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b67
adenc_aden_lang_Float_toString__float_b40:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s50
    mov edx, adenc_aden_lang_Float_toString__float_trace_s50_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b43
adenc_aden_lang_Float_toString__float_b41:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s49
    mov edx, adenc_aden_lang_Float_toString__float_trace_s49_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b42
adenc_aden_lang_Float_toString__float_b42:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s67
    mov edx, adenc_aden_lang_Float_toString__float_trace_s67_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_42_67_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_42_67_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_42_67_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_42_67_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s68
    mov edx, adenc_aden_lang_Float_toString__float_trace_s68_len
    call adenc_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_42_68_1_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_42_68_1_done
adenc_aden_lang_Float_toString__float_vd_stmt_42_68_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_42_68_1_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s69
    mov edx, adenc_aden_lang_Float_toString__float_trace_s69_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s70
    mov edx, adenc_aden_lang_Float_toString__float_trace_s70_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b58
adenc_aden_lang_Float_toString__float_b43:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s50
    mov edx, adenc_aden_lang_Float_toString__float_trace_s50_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+488], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+488]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b44
    jmp adenc_aden_lang_Float_toString__float_b45
adenc_aden_lang_Float_toString__float_b44:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s51
    mov edx, adenc_aden_lang_Float_toString__float_trace_s51_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    mov dword ptr [rsp+160], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s52
    mov edx, adenc_aden_lang_Float_toString__float_trace_s52_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+496], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+496]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b46
    jmp adenc_aden_lang_Float_toString__float_b47
adenc_aden_lang_Float_toString__float_b45:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s56
    mov edx, adenc_aden_lang_Float_toString__float_trace_s56_len
    call adenc_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_45_56_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_45_56_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_45_56_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_45_56_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s57
    mov edx, adenc_aden_lang_Float_toString__float_trace_s57_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s58
    mov edx, adenc_aden_lang_Float_toString__float_trace_s58_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b49
adenc_aden_lang_Float_toString__float_b46:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s53
    mov edx, adenc_aden_lang_Float_toString__float_trace_s53_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+160], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s52
    mov edx, adenc_aden_lang_Float_toString__float_trace_s52_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b48
adenc_aden_lang_Float_toString__float_b47:
    jmp adenc_aden_lang_Float_toString__float_b48
adenc_aden_lang_Float_toString__float_b48:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s54
    mov edx, adenc_aden_lang_Float_toString__float_trace_s54_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+160]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_48_54_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_48_54_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_48_54_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_48_54_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s55
    mov edx, adenc_aden_lang_Float_toString__float_trace_s55_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+504], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+504]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s50
    mov edx, adenc_aden_lang_Float_toString__float_trace_s50_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b43
adenc_aden_lang_Float_toString__float_b49:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s58
    mov edx, adenc_aden_lang_Float_toString__float_trace_s58_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+512], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+512]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_58_219
    mov eax, 0
    jmp Float_toString_ternary_done_58_219
Float_toString_ternary_then_58_219:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+520], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+520]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+528], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+528]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_58_219:
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b50
    jmp adenc_aden_lang_Float_toString__float_b51
adenc_aden_lang_Float_toString__float_b50:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s59
    mov edx, adenc_aden_lang_Float_toString__float_trace_s59_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+536], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+536]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s58
    mov edx, adenc_aden_lang_Float_toString__float_trace_s58_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b49
adenc_aden_lang_Float_toString__float_b51:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s60
    mov edx, adenc_aden_lang_Float_toString__float_trace_s60_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+544], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+544]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b52
    jmp adenc_aden_lang_Float_toString__float_b53
adenc_aden_lang_Float_toString__float_b52:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s61
    mov edx, adenc_aden_lang_Float_toString__float_trace_s61_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_52_61_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_52_61_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_52_61_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_52_61_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s60
    mov edx, adenc_aden_lang_Float_toString__float_trace_s60_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b54
adenc_aden_lang_Float_toString__float_b53:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s62
    mov edx, adenc_aden_lang_Float_toString__float_trace_s62_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s63
    mov edx, adenc_aden_lang_Float_toString__float_trace_s63_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b55
adenc_aden_lang_Float_toString__float_b54:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s66
    mov edx, adenc_aden_lang_Float_toString__float_trace_s66_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd66_249_null
    call adenc_aden_lang_StringBuilder_toString
    jmp Float_toString_vd66_249_done
Float_toString_vd66_249_null:
    call adenc_rt_dispatchNullReceiverPanic
Float_toString_vd66_249_done:
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b55:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s63
    mov edx, adenc_aden_lang_Float_toString__float_trace_s63_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+552], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+552]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b56
    jmp adenc_aden_lang_Float_toString__float_b57
adenc_aden_lang_Float_toString__float_b56:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s64
    mov edx, adenc_aden_lang_Float_toString__float_trace_s64_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_56_64_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_56_64_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_56_64_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_56_64_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s65
    mov edx, adenc_aden_lang_Float_toString__float_trace_s65_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+560], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+560]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s63
    mov edx, adenc_aden_lang_Float_toString__float_trace_s63_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b55
adenc_aden_lang_Float_toString__float_b57:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s60
    mov edx, adenc_aden_lang_Float_toString__float_trace_s60_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b54
adenc_aden_lang_Float_toString__float_b58:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s70
    mov edx, adenc_aden_lang_Float_toString__float_trace_s70_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+576], eax
    mov eax, 0
    mov dword ptr [rsp+568], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+568]
    sub eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+576]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b59
    jmp adenc_aden_lang_Float_toString__float_b60
adenc_aden_lang_Float_toString__float_b59:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s71
    mov edx, adenc_aden_lang_Float_toString__float_trace_s71_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_59_71_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_59_71_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_59_71_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_59_71_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s72
    mov edx, adenc_aden_lang_Float_toString__float_trace_s72_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+584], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+584]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s70
    mov edx, adenc_aden_lang_Float_toString__float_trace_s70_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b58
adenc_aden_lang_Float_toString__float_b60:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s73
    mov edx, adenc_aden_lang_Float_toString__float_trace_s73_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s74
    mov edx, adenc_aden_lang_Float_toString__float_trace_s74_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b61
adenc_aden_lang_Float_toString__float_b61:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+592], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+592]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_74_286
    mov eax, 0
    jmp Float_toString_ternary_done_74_286
Float_toString_ternary_then_74_286:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+600], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+600]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+608], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+608]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_74_286:
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b62
    jmp adenc_aden_lang_Float_toString__float_b63
adenc_aden_lang_Float_toString__float_b62:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s75
    mov edx, adenc_aden_lang_Float_toString__float_trace_s75_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+616], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+616]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s74
    mov edx, adenc_aden_lang_Float_toString__float_trace_s74_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b61
adenc_aden_lang_Float_toString__float_b63:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s76
    mov edx, adenc_aden_lang_Float_toString__float_trace_s76_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s77
    mov edx, adenc_aden_lang_Float_toString__float_trace_s77_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b64
adenc_aden_lang_Float_toString__float_b64:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+624], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+624]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b65
    jmp adenc_aden_lang_Float_toString__float_b66
adenc_aden_lang_Float_toString__float_b65:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s78
    mov edx, adenc_aden_lang_Float_toString__float_trace_s78_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_65_78_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_65_78_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_65_78_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_65_78_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s79
    mov edx, adenc_aden_lang_Float_toString__float_trace_s79_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+632], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+632]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s77
    mov edx, adenc_aden_lang_Float_toString__float_trace_s77_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b64
adenc_aden_lang_Float_toString__float_b66:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s80
    mov edx, adenc_aden_lang_Float_toString__float_trace_s80_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd80_309_null
    call adenc_aden_lang_StringBuilder_toString
    jmp Float_toString_vd80_309_done
Float_toString_vd80_309_null:
    call adenc_rt_dispatchNullReceiverPanic
Float_toString_vd80_309_done:
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b67:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s84
    mov edx, adenc_aden_lang_Float_toString__float_trace_s84_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+640], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+640]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_84_334
    mov eax, 0
    jmp Float_toString_ternary_done_84_334
Float_toString_ternary_then_84_334:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+648], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+648]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+656], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+656]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_84_334:
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b68
    jmp adenc_aden_lang_Float_toString__float_b69
adenc_aden_lang_Float_toString__float_b68:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s85
    mov edx, adenc_aden_lang_Float_toString__float_trace_s85_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+664], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+664]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s84
    mov edx, adenc_aden_lang_Float_toString__float_trace_s84_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b67
adenc_aden_lang_Float_toString__float_b69:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s86
    mov edx, adenc_aden_lang_Float_toString__float_trace_s86_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+672], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+672]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b70
    jmp adenc_aden_lang_Float_toString__float_b71
adenc_aden_lang_Float_toString__float_b70:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s87
    mov edx, adenc_aden_lang_Float_toString__float_trace_s87_len
    call adenc_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_70_87_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_70_87_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_70_87_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_70_87_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s86
    mov edx, adenc_aden_lang_Float_toString__float_trace_s86_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b72
adenc_aden_lang_Float_toString__float_b71:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s88
    mov edx, adenc_aden_lang_Float_toString__float_trace_s88_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s89
    mov edx, adenc_aden_lang_Float_toString__float_trace_s89_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b73
adenc_aden_lang_Float_toString__float_b72:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s92
    mov edx, adenc_aden_lang_Float_toString__float_trace_s92_len
    call adenc_rt_traceUpdateTop
    mov eax, 69
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_72_92_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_72_92_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_72_92_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_72_92_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s93
    mov edx, adenc_aden_lang_Float_toString__float_trace_s93_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov ecx, eax
    call adenc_aden_lang_Integer_toString__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_72_93_1_null
    call adenc_aden_lang_StringBuilder_append__String
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_72_93_1_done
adenc_aden_lang_Float_toString__float_vd_stmt_72_93_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_72_93_1_done:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s94
    mov edx, adenc_aden_lang_Float_toString__float_trace_s94_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd94_375_null
    call adenc_aden_lang_StringBuilder_toString
    jmp Float_toString_vd94_375_done
Float_toString_vd94_375_null:
    call adenc_rt_dispatchNullReceiverPanic
Float_toString_vd94_375_done:
    jmp adenc_aden_lang_Float_toString__float_epilogue
adenc_aden_lang_Float_toString__float_b73:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s89
    mov edx, adenc_aden_lang_Float_toString__float_trace_s89_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+680], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+680]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_toString__float_b74
    jmp adenc_aden_lang_Float_toString__float_b75
adenc_aden_lang_Float_toString__float_b74:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s90
    mov edx, adenc_aden_lang_Float_toString__float_trace_s90_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je adenc_aden_lang_Float_toString__float_vd_stmt_74_90_0_null
    call adenc_aden_lang_StringBuilder_append__char
    jmp adenc_aden_lang_Float_toString__float_vd_stmt_74_90_0_done
adenc_aden_lang_Float_toString__float_vd_stmt_74_90_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_Float_toString__float_vd_stmt_74_90_0_done:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s91
    mov edx, adenc_aden_lang_Float_toString__float_trace_s91_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+688], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+688]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s89
    mov edx, adenc_aden_lang_Float_toString__float_trace_s89_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b73
adenc_aden_lang_Float_toString__float_b75:
    lea rcx, adenc_aden_lang_Float_toString__float_trace_s86
    mov edx, adenc_aden_lang_Float_toString__float_trace_s86_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_toString__float_b72
adenc_aden_lang_Float_toString__float_epilogue:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+736]
adenc_aden_lang_Float_toString__float_epilogue_post:
    mov qword ptr [rsp+736], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+736]
    add rsp, 904
    ret
adenc_aden_lang_Float_toString__float endp

adenc_aden_lang_Float_buildMinValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m118
    mov edx, trace_m118_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
adenc_aden_lang_Float_buildMinValue_b0:
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s0
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 1068719552
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s1
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s2
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_buildMinValue_b1
adenc_aden_lang_Float_buildMinValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_buildMinValue_b2
    jmp adenc_aden_lang_Float_buildMinValue_b3
adenc_aden_lang_Float_buildMinValue_b2:
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s3
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov eax, 1092616192
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    divsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s4
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s2
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_buildMinValue_b1
adenc_aden_lang_Float_buildMinValue_b3:
    lea rcx, adenc_aden_lang_Float_buildMinValue_trace_s5
    mov edx, adenc_aden_lang_Float_buildMinValue_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Float_buildMinValue_epilogue
adenc_aden_lang_Float_buildMinValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
adenc_aden_lang_Float_buildMinValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
adenc_aden_lang_Float_buildMinValue endp

adenc_aden_lang_Float_buildMaxValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m125
    mov edx, trace_m125_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
adenc_aden_lang_Float_buildMaxValue_b0:
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s0
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 1079625692
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s1
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s2
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_buildMaxValue_b1
adenc_aden_lang_Float_buildMaxValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 38
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Float_buildMaxValue_b2
    jmp adenc_aden_lang_Float_buildMaxValue_b3
adenc_aden_lang_Float_buildMaxValue_b2:
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s3
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov eax, 1092616192
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    mulsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s4
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s2
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Float_buildMaxValue_b1
adenc_aden_lang_Float_buildMaxValue_b3:
    lea rcx, adenc_aden_lang_Float_buildMaxValue_trace_s5
    mov edx, adenc_aden_lang_Float_buildMaxValue_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Float_buildMaxValue_epilogue
adenc_aden_lang_Float_buildMaxValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
adenc_aden_lang_Float_buildMaxValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
adenc_aden_lang_Float_buildMaxValue endp

adenc_fget_aden_lang_Float_MIN_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_Float_MIN_VALUE]
    ret
adenc_fget_aden_lang_Float_MIN_VALUE endp

adenc_fset_aden_lang_Float_MIN_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_Float_MIN_VALUE], rcx
    ret
adenc_fset_aden_lang_Float_MIN_VALUE endp


adenc_fget_aden_lang_Float_MAX_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_Float_MAX_VALUE]
    ret
adenc_fget_aden_lang_Float_MAX_VALUE endp

adenc_fset_aden_lang_Float_MAX_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_Float_MAX_VALUE], rcx
    ret
adenc_fset_aden_lang_Float_MAX_VALUE endp


end
