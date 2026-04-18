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
extrn pulsec_rt_fpToInt:proc
extrn pulsec_rt_fpToLong:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_Double_doubleValue__Double:proc
extrn pulsec_pulse_lang_Double_parse__String:proc
extrn pulsec_pulse_lang_Integer_toString__int:proc
extrn pulsec_pulse_lang_Long_toString__long:proc
extrn pulsec_pulse_lang_StringBuilder_StringBuilder:proc
extrn pulsec_pulse_lang_StringBuilder_append__String:proc
extrn pulsec_pulse_lang_StringBuilder_append__char:proc
extrn pulsec_pulse_lang_StringBuilder_toString:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
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

public pulsec_fld_pulse_lang_Float_MIN_VALUE
public pulsec_fget_pulse_lang_Float_MIN_VALUE
public pulsec_fset_pulse_lang_Float_MIN_VALUE
public pulsec_fld_pulse_lang_Float_MAX_VALUE
public pulsec_fget_pulse_lang_Float_MAX_VALUE
public pulsec_fset_pulse_lang_Float_MAX_VALUE

.data
written dq 0
pulsec_objc_pulse_lang_Float dd 0
pulsec_fld_pulse_lang_Float_MIN_VALUE dq 0
pulsec_fld_pulse_lang_Float_MAX_VALUE dq 0
trace_m0 db "pulse.lang.Float.valueOf"
trace_m0_len equ 24
pulsec_pulse_lang_Float_valueOf__float_trace_s0 db "pulse.lang.Float.valueOf(Float.pulse:22)"
pulsec_pulse_lang_Float_valueOf__float_trace_s0_len equ 40
trace_m2 db "pulse.lang.Float.parse"
trace_m2_len equ 22
pulsec_pulse_lang_Float_parse__String_trace_s0 db "pulse.lang.Float.parse(Float.pulse:30)"
pulsec_pulse_lang_Float_parse__String_trace_s0_len equ 38
trace_m4 db "pulse.lang.Float.floatValue"
trace_m4_len equ 27
pulsec_pulse_lang_Float_floatValue__Float_trace_s0 db "pulse.lang.Float.floatValue(Float.pulse:38)"
pulsec_pulse_lang_Float_floatValue__Float_trace_s0_len equ 43
trace_m6 db "pulse.lang.Float.equals"
trace_m6_len equ 23
pulsec_pulse_lang_Float_equals__float_float_trace_s0 db "pulse.lang.Float.equals(Float.pulse:46)"
pulsec_pulse_lang_Float_equals__float_float_trace_s0_len equ 39
trace_m8 db "pulse.lang.Float.compare"
trace_m8_len equ 24
pulsec_pulse_lang_Float_compare__float_float_trace_s0 db "pulse.lang.Float.compare(Float.pulse:54)"
pulsec_pulse_lang_Float_compare__float_float_trace_s0_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s1 db "pulse.lang.Float.compare(Float.pulse:55)"
pulsec_pulse_lang_Float_compare__float_float_trace_s1_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s2 db "pulse.lang.Float.compare(Float.pulse:57)"
pulsec_pulse_lang_Float_compare__float_float_trace_s2_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s3 db "pulse.lang.Float.compare(Float.pulse:58)"
pulsec_pulse_lang_Float_compare__float_float_trace_s3_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s4 db "pulse.lang.Float.compare(Float.pulse:60)"
pulsec_pulse_lang_Float_compare__float_float_trace_s4_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s5 db "pulse.lang.Float.compare(Float.pulse:61)"
pulsec_pulse_lang_Float_compare__float_float_trace_s5_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s6 db "pulse.lang.Float.compare(Float.pulse:63)"
pulsec_pulse_lang_Float_compare__float_float_trace_s6_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s7 db "pulse.lang.Float.compare(Float.pulse:64)"
pulsec_pulse_lang_Float_compare__float_float_trace_s7_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s8 db "pulse.lang.Float.compare(Float.pulse:65)"
pulsec_pulse_lang_Float_compare__float_float_trace_s8_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s9 db "pulse.lang.Float.compare(Float.pulse:66)"
pulsec_pulse_lang_Float_compare__float_float_trace_s9_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s10 db "pulse.lang.Float.compare(Float.pulse:68)"
pulsec_pulse_lang_Float_compare__float_float_trace_s10_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s11 db "pulse.lang.Float.compare(Float.pulse:69)"
pulsec_pulse_lang_Float_compare__float_float_trace_s11_len equ 40
pulsec_pulse_lang_Float_compare__float_float_trace_s12 db "pulse.lang.Float.compare(Float.pulse:71)"
pulsec_pulse_lang_Float_compare__float_float_trace_s12_len equ 40
trace_m22 db "pulse.lang.Float.toString"
trace_m22_len equ 25
pulsec_pulse_lang_Float_toString__float_trace_s0 db "pulse.lang.Float.toString(Float.pulse:79)"
pulsec_pulse_lang_Float_toString__float_trace_s0_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s1 db "pulse.lang.Float.toString(Float.pulse:80)"
pulsec_pulse_lang_Float_toString__float_trace_s1_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s2 db "pulse.lang.Float.toString(Float.pulse:81)"
pulsec_pulse_lang_Float_toString__float_trace_s2_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s3 db "pulse.lang.Float.toString(Float.pulse:83)"
pulsec_pulse_lang_Float_toString__float_trace_s3_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s4 db "pulse.lang.Float.toString(Float.pulse:84)"
pulsec_pulse_lang_Float_toString__float_trace_s4_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s5 db "pulse.lang.Float.toString(Float.pulse:85)"
pulsec_pulse_lang_Float_toString__float_trace_s5_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s6 db "pulse.lang.Float.toString(Float.pulse:87)"
pulsec_pulse_lang_Float_toString__float_trace_s6_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s7 db "pulse.lang.Float.toString(Float.pulse:89)"
pulsec_pulse_lang_Float_toString__float_trace_s7_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s8 db "pulse.lang.Float.toString(Float.pulse:90)"
pulsec_pulse_lang_Float_toString__float_trace_s8_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s9 db "pulse.lang.Float.toString(Float.pulse:91)"
pulsec_pulse_lang_Float_toString__float_trace_s9_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s10 db "pulse.lang.Float.toString(Float.pulse:94)"
pulsec_pulse_lang_Float_toString__float_trace_s10_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s11 db "pulse.lang.Float.toString(Float.pulse:95)"
pulsec_pulse_lang_Float_toString__float_trace_s11_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s12 db "pulse.lang.Float.toString(Float.pulse:96)"
pulsec_pulse_lang_Float_toString__float_trace_s12_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s13 db "pulse.lang.Float.toString(Float.pulse:97)"
pulsec_pulse_lang_Float_toString__float_trace_s13_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s14 db "pulse.lang.Float.toString(Float.pulse:99)"
pulsec_pulse_lang_Float_toString__float_trace_s14_len equ 41
pulsec_pulse_lang_Float_toString__float_trace_s15 db "pulse.lang.Float.toString(Float.pulse:100)"
pulsec_pulse_lang_Float_toString__float_trace_s15_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s16 db "pulse.lang.Float.toString(Float.pulse:101)"
pulsec_pulse_lang_Float_toString__float_trace_s16_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s17 db "pulse.lang.Float.toString(Float.pulse:104)"
pulsec_pulse_lang_Float_toString__float_trace_s17_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s18 db "pulse.lang.Float.toString(Float.pulse:105)"
pulsec_pulse_lang_Float_toString__float_trace_s18_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s19 db "pulse.lang.Float.toString(Float.pulse:108)"
pulsec_pulse_lang_Float_toString__float_trace_s19_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s20 db "pulse.lang.Float.toString(Float.pulse:109)"
pulsec_pulse_lang_Float_toString__float_trace_s20_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s21 db "pulse.lang.Float.toString(Float.pulse:110)"
pulsec_pulse_lang_Float_toString__float_trace_s21_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s22 db "pulse.lang.Float.toString(Float.pulse:111)"
pulsec_pulse_lang_Float_toString__float_trace_s22_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s23 db "pulse.lang.Float.toString(Float.pulse:112)"
pulsec_pulse_lang_Float_toString__float_trace_s23_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s24 db "pulse.lang.Float.toString(Float.pulse:114)"
pulsec_pulse_lang_Float_toString__float_trace_s24_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s25 db "pulse.lang.Float.toString(Float.pulse:117)"
pulsec_pulse_lang_Float_toString__float_trace_s25_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s26 db "pulse.lang.Float.toString(Float.pulse:118)"
pulsec_pulse_lang_Float_toString__float_trace_s26_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s27 db "pulse.lang.Float.toString(Float.pulse:119)"
pulsec_pulse_lang_Float_toString__float_trace_s27_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s28 db "pulse.lang.Float.toString(Float.pulse:120)"
pulsec_pulse_lang_Float_toString__float_trace_s28_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s29 db "pulse.lang.Float.toString(Float.pulse:121)"
pulsec_pulse_lang_Float_toString__float_trace_s29_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s30 db "pulse.lang.Float.toString(Float.pulse:122)"
pulsec_pulse_lang_Float_toString__float_trace_s30_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s31 db "pulse.lang.Float.toString(Float.pulse:124)"
pulsec_pulse_lang_Float_toString__float_trace_s31_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s32 db "pulse.lang.Float.toString(Float.pulse:125)"
pulsec_pulse_lang_Float_toString__float_trace_s32_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s33 db "pulse.lang.Float.toString(Float.pulse:126)"
pulsec_pulse_lang_Float_toString__float_trace_s33_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s34 db "pulse.lang.Float.toString(Float.pulse:127)"
pulsec_pulse_lang_Float_toString__float_trace_s34_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s35 db "pulse.lang.Float.toString(Float.pulse:130)"
pulsec_pulse_lang_Float_toString__float_trace_s35_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s36 db "pulse.lang.Float.toString(Float.pulse:131)"
pulsec_pulse_lang_Float_toString__float_trace_s36_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s37 db "pulse.lang.Float.toString(Float.pulse:132)"
pulsec_pulse_lang_Float_toString__float_trace_s37_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s38 db "pulse.lang.Float.toString(Float.pulse:133)"
pulsec_pulse_lang_Float_toString__float_trace_s38_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s39 db "pulse.lang.Float.toString(Float.pulse:134)"
pulsec_pulse_lang_Float_toString__float_trace_s39_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s40 db "pulse.lang.Float.toString(Float.pulse:135)"
pulsec_pulse_lang_Float_toString__float_trace_s40_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s41 db "pulse.lang.Float.toString(Float.pulse:136)"
pulsec_pulse_lang_Float_toString__float_trace_s41_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s42 db "pulse.lang.Float.toString(Float.pulse:139)"
pulsec_pulse_lang_Float_toString__float_trace_s42_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s43 db "pulse.lang.Float.toString(Float.pulse:140)"
pulsec_pulse_lang_Float_toString__float_trace_s43_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s44 db "pulse.lang.Float.toString(Float.pulse:141)"
pulsec_pulse_lang_Float_toString__float_trace_s44_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s45 db "pulse.lang.Float.toString(Float.pulse:142)"
pulsec_pulse_lang_Float_toString__float_trace_s45_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s46 db "pulse.lang.Float.toString(Float.pulse:144)"
pulsec_pulse_lang_Float_toString__float_trace_s46_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s47 db "pulse.lang.Float.toString(Float.pulse:145)"
pulsec_pulse_lang_Float_toString__float_trace_s47_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s48 db "pulse.lang.Float.toString(Float.pulse:146)"
pulsec_pulse_lang_Float_toString__float_trace_s48_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s49 db "pulse.lang.Float.toString(Float.pulse:147)"
pulsec_pulse_lang_Float_toString__float_trace_s49_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s50 db "pulse.lang.Float.toString(Float.pulse:148)"
pulsec_pulse_lang_Float_toString__float_trace_s50_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s51 db "pulse.lang.Float.toString(Float.pulse:149)"
pulsec_pulse_lang_Float_toString__float_trace_s51_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s52 db "pulse.lang.Float.toString(Float.pulse:150)"
pulsec_pulse_lang_Float_toString__float_trace_s52_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s53 db "pulse.lang.Float.toString(Float.pulse:151)"
pulsec_pulse_lang_Float_toString__float_trace_s53_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s54 db "pulse.lang.Float.toString(Float.pulse:153)"
pulsec_pulse_lang_Float_toString__float_trace_s54_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s55 db "pulse.lang.Float.toString(Float.pulse:154)"
pulsec_pulse_lang_Float_toString__float_trace_s55_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s56 db "pulse.lang.Float.toString(Float.pulse:156)"
pulsec_pulse_lang_Float_toString__float_trace_s56_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s57 db "pulse.lang.Float.toString(Float.pulse:157)"
pulsec_pulse_lang_Float_toString__float_trace_s57_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s58 db "pulse.lang.Float.toString(Float.pulse:158)"
pulsec_pulse_lang_Float_toString__float_trace_s58_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s59 db "pulse.lang.Float.toString(Float.pulse:159)"
pulsec_pulse_lang_Float_toString__float_trace_s59_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s60 db "pulse.lang.Float.toString(Float.pulse:161)"
pulsec_pulse_lang_Float_toString__float_trace_s60_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s61 db "pulse.lang.Float.toString(Float.pulse:162)"
pulsec_pulse_lang_Float_toString__float_trace_s61_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s62 db "pulse.lang.Float.toString(Float.pulse:164)"
pulsec_pulse_lang_Float_toString__float_trace_s62_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s63 db "pulse.lang.Float.toString(Float.pulse:165)"
pulsec_pulse_lang_Float_toString__float_trace_s63_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s64 db "pulse.lang.Float.toString(Float.pulse:166)"
pulsec_pulse_lang_Float_toString__float_trace_s64_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s65 db "pulse.lang.Float.toString(Float.pulse:167)"
pulsec_pulse_lang_Float_toString__float_trace_s65_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s66 db "pulse.lang.Float.toString(Float.pulse:170)"
pulsec_pulse_lang_Float_toString__float_trace_s66_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s67 db "pulse.lang.Float.toString(Float.pulse:173)"
pulsec_pulse_lang_Float_toString__float_trace_s67_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s68 db "pulse.lang.Float.toString(Float.pulse:174)"
pulsec_pulse_lang_Float_toString__float_trace_s68_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s69 db "pulse.lang.Float.toString(Float.pulse:175)"
pulsec_pulse_lang_Float_toString__float_trace_s69_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s70 db "pulse.lang.Float.toString(Float.pulse:176)"
pulsec_pulse_lang_Float_toString__float_trace_s70_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s71 db "pulse.lang.Float.toString(Float.pulse:177)"
pulsec_pulse_lang_Float_toString__float_trace_s71_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s72 db "pulse.lang.Float.toString(Float.pulse:178)"
pulsec_pulse_lang_Float_toString__float_trace_s72_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s73 db "pulse.lang.Float.toString(Float.pulse:180)"
pulsec_pulse_lang_Float_toString__float_trace_s73_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s74 db "pulse.lang.Float.toString(Float.pulse:181)"
pulsec_pulse_lang_Float_toString__float_trace_s74_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s75 db "pulse.lang.Float.toString(Float.pulse:182)"
pulsec_pulse_lang_Float_toString__float_trace_s75_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s76 db "pulse.lang.Float.toString(Float.pulse:184)"
pulsec_pulse_lang_Float_toString__float_trace_s76_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s77 db "pulse.lang.Float.toString(Float.pulse:185)"
pulsec_pulse_lang_Float_toString__float_trace_s77_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s78 db "pulse.lang.Float.toString(Float.pulse:186)"
pulsec_pulse_lang_Float_toString__float_trace_s78_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s79 db "pulse.lang.Float.toString(Float.pulse:187)"
pulsec_pulse_lang_Float_toString__float_trace_s79_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s80 db "pulse.lang.Float.toString(Float.pulse:189)"
pulsec_pulse_lang_Float_toString__float_trace_s80_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s81 db "pulse.lang.Float.toString(Float.pulse:192)"
pulsec_pulse_lang_Float_toString__float_trace_s81_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s82 db "pulse.lang.Float.toString(Float.pulse:193)"
pulsec_pulse_lang_Float_toString__float_trace_s82_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s83 db "pulse.lang.Float.toString(Float.pulse:194)"
pulsec_pulse_lang_Float_toString__float_trace_s83_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s84 db "pulse.lang.Float.toString(Float.pulse:195)"
pulsec_pulse_lang_Float_toString__float_trace_s84_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s85 db "pulse.lang.Float.toString(Float.pulse:196)"
pulsec_pulse_lang_Float_toString__float_trace_s85_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s86 db "pulse.lang.Float.toString(Float.pulse:198)"
pulsec_pulse_lang_Float_toString__float_trace_s86_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s87 db "pulse.lang.Float.toString(Float.pulse:199)"
pulsec_pulse_lang_Float_toString__float_trace_s87_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s88 db "pulse.lang.Float.toString(Float.pulse:201)"
pulsec_pulse_lang_Float_toString__float_trace_s88_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s89 db "pulse.lang.Float.toString(Float.pulse:202)"
pulsec_pulse_lang_Float_toString__float_trace_s89_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s90 db "pulse.lang.Float.toString(Float.pulse:203)"
pulsec_pulse_lang_Float_toString__float_trace_s90_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s91 db "pulse.lang.Float.toString(Float.pulse:204)"
pulsec_pulse_lang_Float_toString__float_trace_s91_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s92 db "pulse.lang.Float.toString(Float.pulse:207)"
pulsec_pulse_lang_Float_toString__float_trace_s92_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s93 db "pulse.lang.Float.toString(Float.pulse:208)"
pulsec_pulse_lang_Float_toString__float_trace_s93_len equ 42
pulsec_pulse_lang_Float_toString__float_trace_s94 db "pulse.lang.Float.toString(Float.pulse:209)"
pulsec_pulse_lang_Float_toString__float_trace_s94_len equ 42
trace_m118 db "pulse.lang.Float.buildMinValue"
trace_m118_len equ 30
pulsec_pulse_lang_Float_buildMinValue_trace_s0 db "pulse.lang.Float.buildMinValue(Float.pulse:213)"
pulsec_pulse_lang_Float_buildMinValue_trace_s0_len equ 47
pulsec_pulse_lang_Float_buildMinValue_trace_s1 db "pulse.lang.Float.buildMinValue(Float.pulse:214)"
pulsec_pulse_lang_Float_buildMinValue_trace_s1_len equ 47
pulsec_pulse_lang_Float_buildMinValue_trace_s2 db "pulse.lang.Float.buildMinValue(Float.pulse:215)"
pulsec_pulse_lang_Float_buildMinValue_trace_s2_len equ 47
pulsec_pulse_lang_Float_buildMinValue_trace_s3 db "pulse.lang.Float.buildMinValue(Float.pulse:216)"
pulsec_pulse_lang_Float_buildMinValue_trace_s3_len equ 47
pulsec_pulse_lang_Float_buildMinValue_trace_s4 db "pulse.lang.Float.buildMinValue(Float.pulse:217)"
pulsec_pulse_lang_Float_buildMinValue_trace_s4_len equ 47
pulsec_pulse_lang_Float_buildMinValue_trace_s5 db "pulse.lang.Float.buildMinValue(Float.pulse:219)"
pulsec_pulse_lang_Float_buildMinValue_trace_s5_len equ 47
trace_m125 db "pulse.lang.Float.buildMaxValue"
trace_m125_len equ 30
pulsec_pulse_lang_Float_buildMaxValue_trace_s0 db "pulse.lang.Float.buildMaxValue(Float.pulse:223)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s0_len equ 47
pulsec_pulse_lang_Float_buildMaxValue_trace_s1 db "pulse.lang.Float.buildMaxValue(Float.pulse:224)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s1_len equ 47
pulsec_pulse_lang_Float_buildMaxValue_trace_s2 db "pulse.lang.Float.buildMaxValue(Float.pulse:225)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s2_len equ 47
pulsec_pulse_lang_Float_buildMaxValue_trace_s3 db "pulse.lang.Float.buildMaxValue(Float.pulse:226)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s3_len equ 47
pulsec_pulse_lang_Float_buildMaxValue_trace_s4 db "pulse.lang.Float.buildMaxValue(Float.pulse:227)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s4_len equ 47
pulsec_pulse_lang_Float_buildMaxValue_trace_s5 db "pulse.lang.Float.buildMaxValue(Float.pulse:229)"
pulsec_pulse_lang_Float_buildMaxValue_trace_s5_len equ 47
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
pulsec_pulse_lang_Float_valueOf__float proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Float_valueOf__float_b0:
    lea rcx, pulsec_pulse_lang_Float_valueOf__float_trace_s0
    mov edx, pulsec_pulse_lang_Float_valueOf__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_valueOf__float_epilogue
pulsec_pulse_lang_Float_valueOf__float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Float_valueOf__float endp

pulsec_pulse_lang_Float_parse__String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Float_parse__String_b0:
    lea rcx, pulsec_pulse_lang_Float_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_Float_parse__String_trace_s0_len
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
    call pulsec_pulse_lang_Double_parse__String
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
    call pulsec_pulse_lang_Double_doubleValue__Double
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
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
    call pulsec_pulse_lang_Float_valueOf__float
    jmp pulsec_pulse_lang_Float_parse__String_epilogue
pulsec_pulse_lang_Float_parse__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 312
    ret
pulsec_pulse_lang_Float_parse__String endp

pulsec_pulse_lang_Float_floatValue__Float proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Float_floatValue__Float_b0:
    lea rcx, pulsec_pulse_lang_Float_floatValue__Float_trace_s0
    mov edx, pulsec_pulse_lang_Float_floatValue__Float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Float_floatValue__Float_epilogue
pulsec_pulse_lang_Float_floatValue__Float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Float_floatValue__Float endp

pulsec_pulse_lang_Float_equals__float_float proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Float_equals__float_float_b0:
    lea rcx, pulsec_pulse_lang_Float_equals__float_float_trace_s0
    mov edx, pulsec_pulse_lang_Float_equals__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    jmp pulsec_pulse_lang_Float_equals__float_float_epilogue
pulsec_pulse_lang_Float_equals__float_float_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Float_equals__float_float endp

pulsec_pulse_lang_Float_compare__float_float proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_pulse_lang_Float_compare__float_float_b0:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_pulse_lang_Float_compare__float_float_b2
pulsec_pulse_lang_Float_compare__float_float_b1:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s1
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b2:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_compare__float_float_b3
pulsec_pulse_lang_Float_compare__float_float_b3:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_compare__float_float_b4
    jmp pulsec_pulse_lang_Float_compare__float_float_b5
pulsec_pulse_lang_Float_compare__float_float_b4:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s3
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b5:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_compare__float_float_b6
pulsec_pulse_lang_Float_compare__float_float_b6:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_compare__float_float_b7
    jmp pulsec_pulse_lang_Float_compare__float_float_b8
pulsec_pulse_lang_Float_compare__float_float_b7:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s5
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b8:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_compare__float_float_b9
pulsec_pulse_lang_Float_compare__float_float_b9:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s6
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s6_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s7
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s7_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Float_compare_ternary_then_8_22
    mov eax, 0
    jmp Float_compare_ternary_done_8_22
Float_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Float_compare_ternary_done_8_22:
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b10
    jmp pulsec_pulse_lang_Float_compare__float_float_b11
pulsec_pulse_lang_Float_compare__float_float_b10:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s9
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b11:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_compare__float_float_b12
pulsec_pulse_lang_Float_compare__float_float_b12:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b13
    jmp pulsec_pulse_lang_Float_compare__float_float_b14
pulsec_pulse_lang_Float_compare__float_float_b13:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s11
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b14:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_compare__float_float_b15
pulsec_pulse_lang_Float_compare__float_float_b15:
    lea rcx, pulsec_pulse_lang_Float_compare__float_float_trace_s12
    mov edx, pulsec_pulse_lang_Float_compare__float_float_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
pulsec_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 264
    ret
pulsec_pulse_lang_Float_compare__float_float endp

pulsec_pulse_lang_Float_toString__float proc
    sub rsp, 904
    mov qword ptr [rsp+872], rcx
    mov qword ptr [rsp+880], rdx
    mov qword ptr [rsp+888], r8
    mov qword ptr [rsp+896], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+872]
    mov rdx, qword ptr [rsp+880]
    mov r8, qword ptr [rsp+888]
    mov r9, qword ptr [rsp+896]
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+168], 0
    mov qword ptr [rsp+144], 0
    mov qword ptr [rsp+176], 0
    mov qword ptr [rsp+96], 0
pulsec_pulse_lang_Float_toString__float_b0:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s0
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s1
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s1_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b1
    jmp pulsec_pulse_lang_Float_toString__float_b2
pulsec_pulse_lang_Float_toString__float_b1:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s2
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b2:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s1
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b3
pulsec_pulse_lang_Float_toString__float_b3:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s3
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b4
    jmp pulsec_pulse_lang_Float_toString__float_b5
pulsec_pulse_lang_Float_toString__float_b4:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s4
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b7
    jmp pulsec_pulse_lang_Float_toString__float_b8
pulsec_pulse_lang_Float_toString__float_b5:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s3
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b6
pulsec_pulse_lang_Float_toString__float_b6:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s7
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s7_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s8
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b10
    jmp pulsec_pulse_lang_Float_toString__float_b11
pulsec_pulse_lang_Float_toString__float_b7:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s5
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b8:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s4
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b9
pulsec_pulse_lang_Float_toString__float_b9:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s6
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s6_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b10:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s9
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s9_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s8
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b12
pulsec_pulse_lang_Float_toString__float_b11:
    jmp pulsec_pulse_lang_Float_toString__float_b12
pulsec_pulse_lang_Float_toString__float_b12:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s10
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s11
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b13
pulsec_pulse_lang_Float_toString__float_b13:
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
    jne pulsec_pulse_lang_Float_toString__float_b14
    jmp pulsec_pulse_lang_Float_toString__float_b15
pulsec_pulse_lang_Float_toString__float_b14:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s12
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s12_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s13
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s11
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b13
pulsec_pulse_lang_Float_toString__float_b15:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s14
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b16
pulsec_pulse_lang_Float_toString__float_b16:
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
    jne pulsec_pulse_lang_Float_toString__float_b17
    jmp pulsec_pulse_lang_Float_toString__float_b18
pulsec_pulse_lang_Float_toString__float_b17:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s15
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s15_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s16
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+296], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s14
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b16
pulsec_pulse_lang_Float_toString__float_b18:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s17
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s17_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_rt_fpToLong
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s18
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s18_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b19
    jmp pulsec_pulse_lang_Float_toString__float_b20
pulsec_pulse_lang_Float_toString__float_b19:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s19
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_pulse_lang_Long_toString__long
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s20
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s20_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b22
    jmp pulsec_pulse_lang_Float_toString__float_b23
pulsec_pulse_lang_Float_toString__float_b20:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s18
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s18_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b21
pulsec_pulse_lang_Float_toString__float_b21:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s25
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s25_len
    call pulsec_rt_traceUpdateTop
    mov eax, 7
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s26
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov rax, 4602678819172646912
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s27
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s27_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b25
pulsec_pulse_lang_Float_toString__float_b22:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s21
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s21_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+128], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s22
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s22_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+744], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+136], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s23
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s23_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+744], rax
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b23:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s20
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s20_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b24
pulsec_pulse_lang_Float_toString__float_b24:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s24
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s24_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+744], rax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b25:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s28_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+360], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+360]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b26
    jmp pulsec_pulse_lang_Float_toString__float_b27
pulsec_pulse_lang_Float_toString__float_b26:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s29
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s29_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s30
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+376], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+376]
    add eax, edx
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b25
pulsec_pulse_lang_Float_toString__float_b27:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s31
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s31_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s32
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s32_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b28
    jmp pulsec_pulse_lang_Float_toString__float_b29
pulsec_pulse_lang_Float_toString__float_b28:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s33
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s33_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s34
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s34_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+408], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+408]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s32
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s32_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b30
pulsec_pulse_lang_Float_toString__float_b29:
    jmp pulsec_pulse_lang_Float_toString__float_b30
pulsec_pulse_lang_Float_toString__float_b30:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s35
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s35_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+144], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s36
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s36_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s37
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s37_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b31
pulsec_pulse_lang_Float_toString__float_b31:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+416], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+416]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b32
    jmp pulsec_pulse_lang_Float_toString__float_b33
pulsec_pulse_lang_Float_toString__float_b32:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s38
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s38_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_fpToInt
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s39
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s39_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s40
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s40_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s41
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s41_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+448], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+448]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s37
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s37_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b31
pulsec_pulse_lang_Float_toString__float_b33:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s42
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s42_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd42_158_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd42_158_done
Float_toString_vd42_158_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd42_158_done:
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+168], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s43
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s43_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+176], rax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s44
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s44_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b34
    jmp pulsec_pulse_lang_Float_toString__float_b35
pulsec_pulse_lang_Float_toString__float_b34:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s45
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s45_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s44
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s44_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b36
pulsec_pulse_lang_Float_toString__float_b35:
    jmp pulsec_pulse_lang_Float_toString__float_b36
pulsec_pulse_lang_Float_toString__float_b36:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s46
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s46_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b37
    jmp pulsec_pulse_lang_Float_toString__float_b38
pulsec_pulse_lang_Float_toString__float_b37:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s47
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s47_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+472], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+472]
    add eax, edx
    mov dword ptr [rsp+184], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s48
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s48_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s49
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s49_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+480], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+480]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b40
    jmp pulsec_pulse_lang_Float_toString__float_b41
pulsec_pulse_lang_Float_toString__float_b38:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s46
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s46_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b39
pulsec_pulse_lang_Float_toString__float_b39:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s81
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s81_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s82
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s82_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s83
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s83_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s84_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b67
pulsec_pulse_lang_Float_toString__float_b40:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s50_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b43
pulsec_pulse_lang_Float_toString__float_b41:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s49
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s49_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b42
pulsec_pulse_lang_Float_toString__float_b42:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s67
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s67_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s68
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s68_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s69
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s69_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s70_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b58
pulsec_pulse_lang_Float_toString__float_b43:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s50_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+488], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+488]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b44
    jmp pulsec_pulse_lang_Float_toString__float_b45
pulsec_pulse_lang_Float_toString__float_b44:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s51
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s51_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s52
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s52_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+496], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+496]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b46
    jmp pulsec_pulse_lang_Float_toString__float_b47
pulsec_pulse_lang_Float_toString__float_b45:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s56
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s56_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s57
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s57_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s58_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b49
pulsec_pulse_lang_Float_toString__float_b46:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s53
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s53_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s52
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s52_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b48
pulsec_pulse_lang_Float_toString__float_b47:
    jmp pulsec_pulse_lang_Float_toString__float_b48
pulsec_pulse_lang_Float_toString__float_b48:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s54
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s54_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s55
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s55_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+504], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+504]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s50_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b43
pulsec_pulse_lang_Float_toString__float_b49:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s58_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    jne pulsec_pulse_lang_Float_toString__float_b50
    jmp pulsec_pulse_lang_Float_toString__float_b51
pulsec_pulse_lang_Float_toString__float_b50:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s59
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s59_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+536], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+536]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s58_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b49
pulsec_pulse_lang_Float_toString__float_b51:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s60_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+544], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+544]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b52
    jmp pulsec_pulse_lang_Float_toString__float_b53
pulsec_pulse_lang_Float_toString__float_b52:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s61
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s61_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s60_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b54
pulsec_pulse_lang_Float_toString__float_b53:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s62
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s62_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s63_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b55
pulsec_pulse_lang_Float_toString__float_b54:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s66
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s66_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd66_249_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd66_249_done
Float_toString_vd66_249_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd66_249_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b55:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s63_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+552], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+552]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b56
    jmp pulsec_pulse_lang_Float_toString__float_b57
pulsec_pulse_lang_Float_toString__float_b56:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s64
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s64_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s65
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s65_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+560], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+560]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s63_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b55
pulsec_pulse_lang_Float_toString__float_b57:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s60_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b54
pulsec_pulse_lang_Float_toString__float_b58:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s70_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_pulse_lang_Float_toString__float_b59
    jmp pulsec_pulse_lang_Float_toString__float_b60
pulsec_pulse_lang_Float_toString__float_b59:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s71
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s71_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s72
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s72_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+584], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+584]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s70_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b58
pulsec_pulse_lang_Float_toString__float_b60:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s73
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s73_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s74
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s74_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b61
pulsec_pulse_lang_Float_toString__float_b61:
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
    call pulsec_pulse_lang_String_charAt__int
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
    jne pulsec_pulse_lang_Float_toString__float_b62
    jmp pulsec_pulse_lang_Float_toString__float_b63
pulsec_pulse_lang_Float_toString__float_b62:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s75
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s75_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+616], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+616]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s74
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s74_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b61
pulsec_pulse_lang_Float_toString__float_b63:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s76
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s76_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s77
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s77_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b64
pulsec_pulse_lang_Float_toString__float_b64:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+624], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+624]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b65
    jmp pulsec_pulse_lang_Float_toString__float_b66
pulsec_pulse_lang_Float_toString__float_b65:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s78
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s78_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s79
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s79_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+632], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+632]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s77
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s77_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b64
pulsec_pulse_lang_Float_toString__float_b66:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s80
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s80_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd80_309_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd80_309_done
Float_toString_vd80_309_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd80_309_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b67:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s84_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    jne pulsec_pulse_lang_Float_toString__float_b68
    jmp pulsec_pulse_lang_Float_toString__float_b69
pulsec_pulse_lang_Float_toString__float_b68:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s85
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s85_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+664], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+664]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s84_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b67
pulsec_pulse_lang_Float_toString__float_b69:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s86_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+672], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+672]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b70
    jmp pulsec_pulse_lang_Float_toString__float_b71
pulsec_pulse_lang_Float_toString__float_b70:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s87
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s87_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s86_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b72
pulsec_pulse_lang_Float_toString__float_b71:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s88
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s88_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s89_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b73
pulsec_pulse_lang_Float_toString__float_b72:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s92
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s92_len
    call pulsec_rt_traceUpdateTop
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s93
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s93_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    call pulsec_rt_arcRetain
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s94
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s94_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd94_375_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd94_375_done
Float_toString_vd94_375_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd94_375_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b73:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s89_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+680], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+680]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b74
    jmp pulsec_pulse_lang_Float_toString__float_b75
pulsec_pulse_lang_Float_toString__float_b74:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s90
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s90_len
    call pulsec_rt_traceUpdateTop
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
    call pulsec_pulse_lang_String_charAt__int
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
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s91
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s91_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+688], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+688]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s89_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b73
pulsec_pulse_lang_Float_toString__float_b75:
    lea rcx, pulsec_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_pulse_lang_Float_toString__float_trace_s86_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_toString__float_b72
pulsec_pulse_lang_Float_toString__float_epilogue:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
pulsec_pulse_lang_Float_toString__float_epilogue_post:
    mov qword ptr [rsp+736], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+736]
    add rsp, 904
    ret
pulsec_pulse_lang_Float_toString__float endp

pulsec_pulse_lang_Float_buildMinValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m118
    mov edx, trace_m118_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Float_buildMinValue_b0:
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s0
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1068719552
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s1
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s2
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_buildMinValue_b1
pulsec_pulse_lang_Float_buildMinValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_buildMinValue_b2
    jmp pulsec_pulse_lang_Float_buildMinValue_b3
pulsec_pulse_lang_Float_buildMinValue_b2:
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s3
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s4
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s2
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_buildMinValue_b1
pulsec_pulse_lang_Float_buildMinValue_b3:
    lea rcx, pulsec_pulse_lang_Float_buildMinValue_trace_s5
    mov edx, pulsec_pulse_lang_Float_buildMinValue_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_buildMinValue_epilogue
pulsec_pulse_lang_Float_buildMinValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_Float_buildMinValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Float_buildMinValue endp

pulsec_pulse_lang_Float_buildMaxValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m125
    mov edx, trace_m125_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Float_buildMaxValue_b0:
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s0
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1079625692
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s1
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s2
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_buildMaxValue_b1
pulsec_pulse_lang_Float_buildMaxValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 38
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_buildMaxValue_b2
    jmp pulsec_pulse_lang_Float_buildMaxValue_b3
pulsec_pulse_lang_Float_buildMaxValue_b2:
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s3
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s4
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s2
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Float_buildMaxValue_b1
pulsec_pulse_lang_Float_buildMaxValue_b3:
    lea rcx, pulsec_pulse_lang_Float_buildMaxValue_trace_s5
    mov edx, pulsec_pulse_lang_Float_buildMaxValue_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_buildMaxValue_epilogue
pulsec_pulse_lang_Float_buildMaxValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_Float_buildMaxValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Float_buildMaxValue endp

pulsec_fget_pulse_lang_Float_MIN_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Float_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_Float_MIN_VALUE endp

pulsec_fset_pulse_lang_Float_MIN_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Float_MIN_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Float_MIN_VALUE endp


pulsec_fget_pulse_lang_Float_MAX_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Float_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_Float_MAX_VALUE endp

pulsec_fset_pulse_lang_Float_MAX_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Float_MAX_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Float_MAX_VALUE endp


end
