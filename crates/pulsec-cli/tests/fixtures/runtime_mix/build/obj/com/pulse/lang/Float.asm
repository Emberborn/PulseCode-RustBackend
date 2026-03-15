option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
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
extrn pulsec_com_pulse_lang_Double_doubleValue__Double:proc
extrn pulsec_com_pulse_lang_Double_parse__String:proc
extrn pulsec_com_pulse_lang_Integer_toString__int:proc
extrn pulsec_com_pulse_lang_Long_toString__long:proc
extrn pulsec_com_pulse_lang_StringBuilder_StringBuilder:proc
extrn pulsec_com_pulse_lang_StringBuilder_append__String:proc
extrn pulsec_com_pulse_lang_StringBuilder_append__char:proc
extrn pulsec_com_pulse_lang_StringBuilder_toString:proc
extrn pulsec_com_pulse_lang_String_charAt__int:proc
extrn pulsec_com_pulse_lang_String_concat__String:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Float dd 0
pulsec_fld_com_pulse_lang_Float_MIN_VALUE dq 0
pulsec_fld_com_pulse_lang_Float_MAX_VALUE dq 0
trace_m0 db "com.pulse.lang.Float.valueOf"
trace_m0_len equ 28
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0 db "com.pulse.lang.Float.valueOf(Float.pulse:22)"
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0_len equ 44
trace_m2 db "com.pulse.lang.Float.parse"
trace_m2_len equ 26
pulsec_com_pulse_lang_Float_parse__String_trace_s0 db "com.pulse.lang.Float.parse(Float.pulse:30)"
pulsec_com_pulse_lang_Float_parse__String_trace_s0_len equ 42
trace_m4 db "com.pulse.lang.Float.floatValue"
trace_m4_len equ 31
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0 db "com.pulse.lang.Float.floatValue(Float.pulse:38)"
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0_len equ 47
trace_m6 db "com.pulse.lang.Float.equals"
trace_m6_len equ 27
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0 db "com.pulse.lang.Float.equals(Float.pulse:46)"
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0_len equ 43
trace_m8 db "com.pulse.lang.Float.compare"
trace_m8_len equ 28
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0 db "com.pulse.lang.Float.compare(Float.pulse:54)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1 db "com.pulse.lang.Float.compare(Float.pulse:55)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2 db "com.pulse.lang.Float.compare(Float.pulse:57)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3 db "com.pulse.lang.Float.compare(Float.pulse:58)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4 db "com.pulse.lang.Float.compare(Float.pulse:60)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5 db "com.pulse.lang.Float.compare(Float.pulse:61)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6 db "com.pulse.lang.Float.compare(Float.pulse:63)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7 db "com.pulse.lang.Float.compare(Float.pulse:64)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8 db "com.pulse.lang.Float.compare(Float.pulse:65)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9 db "com.pulse.lang.Float.compare(Float.pulse:66)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10 db "com.pulse.lang.Float.compare(Float.pulse:68)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11 db "com.pulse.lang.Float.compare(Float.pulse:69)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11_len equ 44
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12 db "com.pulse.lang.Float.compare(Float.pulse:71)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12_len equ 44
trace_m22 db "com.pulse.lang.Float.toString"
trace_m22_len equ 29
pulsec_com_pulse_lang_Float_toString__float_trace_s0 db "com.pulse.lang.Float.toString(Float.pulse:79)"
pulsec_com_pulse_lang_Float_toString__float_trace_s0_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s1 db "com.pulse.lang.Float.toString(Float.pulse:80)"
pulsec_com_pulse_lang_Float_toString__float_trace_s1_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s2 db "com.pulse.lang.Float.toString(Float.pulse:81)"
pulsec_com_pulse_lang_Float_toString__float_trace_s2_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s3 db "com.pulse.lang.Float.toString(Float.pulse:83)"
pulsec_com_pulse_lang_Float_toString__float_trace_s3_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s4 db "com.pulse.lang.Float.toString(Float.pulse:84)"
pulsec_com_pulse_lang_Float_toString__float_trace_s4_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s5 db "com.pulse.lang.Float.toString(Float.pulse:85)"
pulsec_com_pulse_lang_Float_toString__float_trace_s5_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s6 db "com.pulse.lang.Float.toString(Float.pulse:87)"
pulsec_com_pulse_lang_Float_toString__float_trace_s6_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s7 db "com.pulse.lang.Float.toString(Float.pulse:89)"
pulsec_com_pulse_lang_Float_toString__float_trace_s7_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s8 db "com.pulse.lang.Float.toString(Float.pulse:90)"
pulsec_com_pulse_lang_Float_toString__float_trace_s8_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s9 db "com.pulse.lang.Float.toString(Float.pulse:91)"
pulsec_com_pulse_lang_Float_toString__float_trace_s9_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s10 db "com.pulse.lang.Float.toString(Float.pulse:94)"
pulsec_com_pulse_lang_Float_toString__float_trace_s10_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s11 db "com.pulse.lang.Float.toString(Float.pulse:95)"
pulsec_com_pulse_lang_Float_toString__float_trace_s11_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s12 db "com.pulse.lang.Float.toString(Float.pulse:96)"
pulsec_com_pulse_lang_Float_toString__float_trace_s12_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s13 db "com.pulse.lang.Float.toString(Float.pulse:97)"
pulsec_com_pulse_lang_Float_toString__float_trace_s13_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s14 db "com.pulse.lang.Float.toString(Float.pulse:99)"
pulsec_com_pulse_lang_Float_toString__float_trace_s14_len equ 45
pulsec_com_pulse_lang_Float_toString__float_trace_s15 db "com.pulse.lang.Float.toString(Float.pulse:100)"
pulsec_com_pulse_lang_Float_toString__float_trace_s15_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s16 db "com.pulse.lang.Float.toString(Float.pulse:101)"
pulsec_com_pulse_lang_Float_toString__float_trace_s16_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s17 db "com.pulse.lang.Float.toString(Float.pulse:104)"
pulsec_com_pulse_lang_Float_toString__float_trace_s17_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s18 db "com.pulse.lang.Float.toString(Float.pulse:105)"
pulsec_com_pulse_lang_Float_toString__float_trace_s18_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s19 db "com.pulse.lang.Float.toString(Float.pulse:108)"
pulsec_com_pulse_lang_Float_toString__float_trace_s19_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s20 db "com.pulse.lang.Float.toString(Float.pulse:109)"
pulsec_com_pulse_lang_Float_toString__float_trace_s20_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s21 db "com.pulse.lang.Float.toString(Float.pulse:110)"
pulsec_com_pulse_lang_Float_toString__float_trace_s21_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s22 db "com.pulse.lang.Float.toString(Float.pulse:111)"
pulsec_com_pulse_lang_Float_toString__float_trace_s22_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s23 db "com.pulse.lang.Float.toString(Float.pulse:112)"
pulsec_com_pulse_lang_Float_toString__float_trace_s23_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s24 db "com.pulse.lang.Float.toString(Float.pulse:114)"
pulsec_com_pulse_lang_Float_toString__float_trace_s24_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s25 db "com.pulse.lang.Float.toString(Float.pulse:117)"
pulsec_com_pulse_lang_Float_toString__float_trace_s25_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s26 db "com.pulse.lang.Float.toString(Float.pulse:118)"
pulsec_com_pulse_lang_Float_toString__float_trace_s26_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s27 db "com.pulse.lang.Float.toString(Float.pulse:119)"
pulsec_com_pulse_lang_Float_toString__float_trace_s27_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s28 db "com.pulse.lang.Float.toString(Float.pulse:120)"
pulsec_com_pulse_lang_Float_toString__float_trace_s28_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s29 db "com.pulse.lang.Float.toString(Float.pulse:121)"
pulsec_com_pulse_lang_Float_toString__float_trace_s29_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s30 db "com.pulse.lang.Float.toString(Float.pulse:122)"
pulsec_com_pulse_lang_Float_toString__float_trace_s30_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s31 db "com.pulse.lang.Float.toString(Float.pulse:124)"
pulsec_com_pulse_lang_Float_toString__float_trace_s31_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s32 db "com.pulse.lang.Float.toString(Float.pulse:125)"
pulsec_com_pulse_lang_Float_toString__float_trace_s32_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s33 db "com.pulse.lang.Float.toString(Float.pulse:126)"
pulsec_com_pulse_lang_Float_toString__float_trace_s33_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s34 db "com.pulse.lang.Float.toString(Float.pulse:127)"
pulsec_com_pulse_lang_Float_toString__float_trace_s34_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s35 db "com.pulse.lang.Float.toString(Float.pulse:130)"
pulsec_com_pulse_lang_Float_toString__float_trace_s35_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s36 db "com.pulse.lang.Float.toString(Float.pulse:131)"
pulsec_com_pulse_lang_Float_toString__float_trace_s36_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s37 db "com.pulse.lang.Float.toString(Float.pulse:132)"
pulsec_com_pulse_lang_Float_toString__float_trace_s37_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s38 db "com.pulse.lang.Float.toString(Float.pulse:133)"
pulsec_com_pulse_lang_Float_toString__float_trace_s38_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s39 db "com.pulse.lang.Float.toString(Float.pulse:134)"
pulsec_com_pulse_lang_Float_toString__float_trace_s39_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s40 db "com.pulse.lang.Float.toString(Float.pulse:135)"
pulsec_com_pulse_lang_Float_toString__float_trace_s40_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s41 db "com.pulse.lang.Float.toString(Float.pulse:136)"
pulsec_com_pulse_lang_Float_toString__float_trace_s41_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s42 db "com.pulse.lang.Float.toString(Float.pulse:139)"
pulsec_com_pulse_lang_Float_toString__float_trace_s42_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s43 db "com.pulse.lang.Float.toString(Float.pulse:140)"
pulsec_com_pulse_lang_Float_toString__float_trace_s43_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s44 db "com.pulse.lang.Float.toString(Float.pulse:141)"
pulsec_com_pulse_lang_Float_toString__float_trace_s44_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s45 db "com.pulse.lang.Float.toString(Float.pulse:142)"
pulsec_com_pulse_lang_Float_toString__float_trace_s45_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s46 db "com.pulse.lang.Float.toString(Float.pulse:144)"
pulsec_com_pulse_lang_Float_toString__float_trace_s46_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s47 db "com.pulse.lang.Float.toString(Float.pulse:145)"
pulsec_com_pulse_lang_Float_toString__float_trace_s47_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s48 db "com.pulse.lang.Float.toString(Float.pulse:146)"
pulsec_com_pulse_lang_Float_toString__float_trace_s48_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s49 db "com.pulse.lang.Float.toString(Float.pulse:147)"
pulsec_com_pulse_lang_Float_toString__float_trace_s49_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s50 db "com.pulse.lang.Float.toString(Float.pulse:148)"
pulsec_com_pulse_lang_Float_toString__float_trace_s50_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s51 db "com.pulse.lang.Float.toString(Float.pulse:149)"
pulsec_com_pulse_lang_Float_toString__float_trace_s51_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s52 db "com.pulse.lang.Float.toString(Float.pulse:150)"
pulsec_com_pulse_lang_Float_toString__float_trace_s52_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s53 db "com.pulse.lang.Float.toString(Float.pulse:151)"
pulsec_com_pulse_lang_Float_toString__float_trace_s53_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s54 db "com.pulse.lang.Float.toString(Float.pulse:153)"
pulsec_com_pulse_lang_Float_toString__float_trace_s54_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s55 db "com.pulse.lang.Float.toString(Float.pulse:154)"
pulsec_com_pulse_lang_Float_toString__float_trace_s55_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s56 db "com.pulse.lang.Float.toString(Float.pulse:156)"
pulsec_com_pulse_lang_Float_toString__float_trace_s56_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s57 db "com.pulse.lang.Float.toString(Float.pulse:157)"
pulsec_com_pulse_lang_Float_toString__float_trace_s57_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s58 db "com.pulse.lang.Float.toString(Float.pulse:158)"
pulsec_com_pulse_lang_Float_toString__float_trace_s58_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s59 db "com.pulse.lang.Float.toString(Float.pulse:159)"
pulsec_com_pulse_lang_Float_toString__float_trace_s59_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s60 db "com.pulse.lang.Float.toString(Float.pulse:161)"
pulsec_com_pulse_lang_Float_toString__float_trace_s60_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s61 db "com.pulse.lang.Float.toString(Float.pulse:162)"
pulsec_com_pulse_lang_Float_toString__float_trace_s61_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s62 db "com.pulse.lang.Float.toString(Float.pulse:164)"
pulsec_com_pulse_lang_Float_toString__float_trace_s62_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s63 db "com.pulse.lang.Float.toString(Float.pulse:165)"
pulsec_com_pulse_lang_Float_toString__float_trace_s63_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s64 db "com.pulse.lang.Float.toString(Float.pulse:166)"
pulsec_com_pulse_lang_Float_toString__float_trace_s64_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s65 db "com.pulse.lang.Float.toString(Float.pulse:167)"
pulsec_com_pulse_lang_Float_toString__float_trace_s65_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s66 db "com.pulse.lang.Float.toString(Float.pulse:170)"
pulsec_com_pulse_lang_Float_toString__float_trace_s66_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s67 db "com.pulse.lang.Float.toString(Float.pulse:173)"
pulsec_com_pulse_lang_Float_toString__float_trace_s67_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s68 db "com.pulse.lang.Float.toString(Float.pulse:174)"
pulsec_com_pulse_lang_Float_toString__float_trace_s68_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s69 db "com.pulse.lang.Float.toString(Float.pulse:175)"
pulsec_com_pulse_lang_Float_toString__float_trace_s69_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s70 db "com.pulse.lang.Float.toString(Float.pulse:176)"
pulsec_com_pulse_lang_Float_toString__float_trace_s70_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s71 db "com.pulse.lang.Float.toString(Float.pulse:177)"
pulsec_com_pulse_lang_Float_toString__float_trace_s71_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s72 db "com.pulse.lang.Float.toString(Float.pulse:178)"
pulsec_com_pulse_lang_Float_toString__float_trace_s72_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s73 db "com.pulse.lang.Float.toString(Float.pulse:180)"
pulsec_com_pulse_lang_Float_toString__float_trace_s73_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s74 db "com.pulse.lang.Float.toString(Float.pulse:181)"
pulsec_com_pulse_lang_Float_toString__float_trace_s74_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s75 db "com.pulse.lang.Float.toString(Float.pulse:182)"
pulsec_com_pulse_lang_Float_toString__float_trace_s75_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s76 db "com.pulse.lang.Float.toString(Float.pulse:184)"
pulsec_com_pulse_lang_Float_toString__float_trace_s76_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s77 db "com.pulse.lang.Float.toString(Float.pulse:185)"
pulsec_com_pulse_lang_Float_toString__float_trace_s77_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s78 db "com.pulse.lang.Float.toString(Float.pulse:186)"
pulsec_com_pulse_lang_Float_toString__float_trace_s78_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s79 db "com.pulse.lang.Float.toString(Float.pulse:187)"
pulsec_com_pulse_lang_Float_toString__float_trace_s79_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s80 db "com.pulse.lang.Float.toString(Float.pulse:189)"
pulsec_com_pulse_lang_Float_toString__float_trace_s80_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s81 db "com.pulse.lang.Float.toString(Float.pulse:192)"
pulsec_com_pulse_lang_Float_toString__float_trace_s81_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s82 db "com.pulse.lang.Float.toString(Float.pulse:193)"
pulsec_com_pulse_lang_Float_toString__float_trace_s82_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s83 db "com.pulse.lang.Float.toString(Float.pulse:194)"
pulsec_com_pulse_lang_Float_toString__float_trace_s83_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s84 db "com.pulse.lang.Float.toString(Float.pulse:195)"
pulsec_com_pulse_lang_Float_toString__float_trace_s84_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s85 db "com.pulse.lang.Float.toString(Float.pulse:196)"
pulsec_com_pulse_lang_Float_toString__float_trace_s85_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s86 db "com.pulse.lang.Float.toString(Float.pulse:198)"
pulsec_com_pulse_lang_Float_toString__float_trace_s86_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s87 db "com.pulse.lang.Float.toString(Float.pulse:199)"
pulsec_com_pulse_lang_Float_toString__float_trace_s87_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s88 db "com.pulse.lang.Float.toString(Float.pulse:201)"
pulsec_com_pulse_lang_Float_toString__float_trace_s88_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s89 db "com.pulse.lang.Float.toString(Float.pulse:202)"
pulsec_com_pulse_lang_Float_toString__float_trace_s89_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s90 db "com.pulse.lang.Float.toString(Float.pulse:203)"
pulsec_com_pulse_lang_Float_toString__float_trace_s90_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s91 db "com.pulse.lang.Float.toString(Float.pulse:204)"
pulsec_com_pulse_lang_Float_toString__float_trace_s91_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s92 db "com.pulse.lang.Float.toString(Float.pulse:207)"
pulsec_com_pulse_lang_Float_toString__float_trace_s92_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s93 db "com.pulse.lang.Float.toString(Float.pulse:208)"
pulsec_com_pulse_lang_Float_toString__float_trace_s93_len equ 46
pulsec_com_pulse_lang_Float_toString__float_trace_s94 db "com.pulse.lang.Float.toString(Float.pulse:209)"
pulsec_com_pulse_lang_Float_toString__float_trace_s94_len equ 46
trace_m118 db "com.pulse.lang.Float.buildMinValue"
trace_m118_len equ 34
pulsec_com_pulse_lang_Float_buildMinValue_trace_s0 db "com.pulse.lang.Float.buildMinValue(Float.pulse:213)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s0_len equ 51
pulsec_com_pulse_lang_Float_buildMinValue_trace_s1 db "com.pulse.lang.Float.buildMinValue(Float.pulse:214)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s1_len equ 51
pulsec_com_pulse_lang_Float_buildMinValue_trace_s2 db "com.pulse.lang.Float.buildMinValue(Float.pulse:215)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s2_len equ 51
pulsec_com_pulse_lang_Float_buildMinValue_trace_s3 db "com.pulse.lang.Float.buildMinValue(Float.pulse:216)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s3_len equ 51
pulsec_com_pulse_lang_Float_buildMinValue_trace_s4 db "com.pulse.lang.Float.buildMinValue(Float.pulse:217)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s4_len equ 51
pulsec_com_pulse_lang_Float_buildMinValue_trace_s5 db "com.pulse.lang.Float.buildMinValue(Float.pulse:219)"
pulsec_com_pulse_lang_Float_buildMinValue_trace_s5_len equ 51
trace_m125 db "com.pulse.lang.Float.buildMaxValue"
trace_m125_len equ 34
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s0 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:223)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s0_len equ 51
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s1 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:224)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s1_len equ 51
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:225)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2_len equ 51
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s3 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:226)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s3_len equ 51
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s4 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:227)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s4_len equ 51
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s5 db "com.pulse.lang.Float.buildMaxValue(Float.pulse:229)"
pulsec_com_pulse_lang_Float_buildMaxValue_trace_s5_len equ 51
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
pulsec_com_pulse_lang_Float_valueOf__float proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_valueOf__float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_valueOf__float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_valueOf__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_valueOf__float_epilogue
pulsec_com_pulse_lang_Float_valueOf__float_epilogue:
pulsec_com_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Float_valueOf__float endp

pulsec_com_pulse_lang_Float_parse__String proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Float_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_Double_parse__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_Double_doubleValue__Double
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
    call pulsec_com_pulse_lang_Float_valueOf__float
    jmp pulsec_com_pulse_lang_Float_parse__String_epilogue
pulsec_com_pulse_lang_Float_parse__String_epilogue:
pulsec_com_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Float_parse__String endp

pulsec_com_pulse_lang_Float_floatValue__Float proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_floatValue__Float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_floatValue__Float_epilogue
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue:
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Float_floatValue__Float endp

pulsec_com_pulse_lang_Float_equals__float_float proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Float_equals__float_float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_equals__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_equals__float_float_trace_s0_len
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
    jmp pulsec_com_pulse_lang_Float_equals__float_float_epilogue
pulsec_com_pulse_lang_Float_equals__float_float_epilogue:
pulsec_com_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_Float_equals__float_float endp

pulsec_com_pulse_lang_Float_compare__float_float proc
    sub rsp, 248
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_com_pulse_lang_Float_compare__float_float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b2
pulsec_com_pulse_lang_Float_compare__float_float_b1:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b2:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b3
pulsec_com_pulse_lang_Float_compare__float_float_b3:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b4
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b5
pulsec_com_pulse_lang_Float_compare__float_float_b4:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b5:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b6
pulsec_com_pulse_lang_Float_compare__float_float_b6:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b7
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b8
pulsec_com_pulse_lang_Float_compare__float_float_b7:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s5
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b8:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b9
pulsec_com_pulse_lang_Float_compare__float_float_b9:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s6
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s6_len
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
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s7
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s7_len
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
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b10
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b11
pulsec_com_pulse_lang_Float_compare__float_float_b10:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s9
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b11:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b12
pulsec_com_pulse_lang_Float_compare__float_float_b12:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Float_compare__float_float_b13
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b14
pulsec_com_pulse_lang_Float_compare__float_float_b13:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s11
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b14:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b15
pulsec_com_pulse_lang_Float_compare__float_float_b15:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s12
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_epilogue:
pulsec_com_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 248
    ret
pulsec_com_pulse_lang_Float_compare__float_float endp

pulsec_com_pulse_lang_Float_toString__float proc
    sub rsp, 808
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+200], rcx
pulsec_com_pulse_lang_Float_toString__float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s1_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b1
    jmp pulsec_com_pulse_lang_Float_toString__float_b2
pulsec_com_pulse_lang_Float_toString__float_b1:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b2:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b3
pulsec_com_pulse_lang_Float_toString__float_b3:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s3_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b4
    jmp pulsec_com_pulse_lang_Float_toString__float_b5
pulsec_com_pulse_lang_Float_toString__float_b4:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s4_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b7
    jmp pulsec_com_pulse_lang_Float_toString__float_b8
pulsec_com_pulse_lang_Float_toString__float_b5:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b6
pulsec_com_pulse_lang_Float_toString__float_b6:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s7
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s7_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b10
    jmp pulsec_com_pulse_lang_Float_toString__float_b11
pulsec_com_pulse_lang_Float_toString__float_b7:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s5
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b8:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b9
pulsec_com_pulse_lang_Float_toString__float_b9:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s6
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s6_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b10:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s9
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s9_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b12
pulsec_com_pulse_lang_Float_toString__float_b11:
    jmp pulsec_com_pulse_lang_Float_toString__float_b12
pulsec_com_pulse_lang_Float_toString__float_b12:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s10
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s11
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b13
pulsec_com_pulse_lang_Float_toString__float_b13:
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
    jne pulsec_com_pulse_lang_Float_toString__float_b14
    jmp pulsec_com_pulse_lang_Float_toString__float_b15
pulsec_com_pulse_lang_Float_toString__float_b14:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s12
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s12_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s13
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s11
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b13
pulsec_com_pulse_lang_Float_toString__float_b15:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s14
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b16
pulsec_com_pulse_lang_Float_toString__float_b16:
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
    jne pulsec_com_pulse_lang_Float_toString__float_b17
    jmp pulsec_com_pulse_lang_Float_toString__float_b18
pulsec_com_pulse_lang_Float_toString__float_b17:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s15
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s15_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s16
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+296], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s14
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b16
pulsec_com_pulse_lang_Float_toString__float_b18:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s17
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s17_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s18
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s18_len
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
    jp Float_toString_fp_cmp_18_64_unordered
    setb al
    jmp Float_toString_fp_cmp_18_64_done
Float_toString_fp_cmp_18_64_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_64_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_18_71
    mov rax, qword ptr [rsp+200]
    jmp Float_toString_ternary_done_18_71
Float_toString_ternary_then_18_71:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+328], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+328]
    subsd xmm0, xmm1
    movq rax, xmm0
Float_toString_ternary_done_18_71:
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+336]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_18_72_unordered
    sete al
    jmp Float_toString_fp_cmp_18_72_done
Float_toString_fp_cmp_18_72_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_72_done:
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
    jne Float_toString_ternary_then_18_83
    mov eax, 0
    jmp Float_toString_ternary_done_18_83
Float_toString_ternary_then_18_83:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+352], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+352]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_18_83:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b19
    jmp pulsec_com_pulse_lang_Float_toString__float_b20
pulsec_com_pulse_lang_Float_toString__float_b19:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s19
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_com_pulse_lang_Long_toString__long
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s20
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s20_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b22
    jmp pulsec_com_pulse_lang_Float_toString__float_b23
pulsec_com_pulse_lang_Float_toString__float_b20:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s18
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s18_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b21
pulsec_com_pulse_lang_Float_toString__float_b21:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s25
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s25_len
    call pulsec_rt_traceUpdateTop
    mov eax, 7
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s26
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov rax, 4602678819172646912
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s27
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s27_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b25
pulsec_com_pulse_lang_Float_toString__float_b22:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s21
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s21_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s22
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s22_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+136], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s23
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s23_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b23:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s20
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s20_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b24
pulsec_com_pulse_lang_Float_toString__float_b24:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s24
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s24_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b25:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s28_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b26
    jmp pulsec_com_pulse_lang_Float_toString__float_b27
pulsec_com_pulse_lang_Float_toString__float_b26:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s29
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s29_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s30
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+376], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+376]
    add eax, edx
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s28
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b25
pulsec_com_pulse_lang_Float_toString__float_b27:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s31
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s31_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s32
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s32_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+392], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+392]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_32_122_unordered
    setae al
    jmp Float_toString_fp_cmp_32_122_done
Float_toString_fp_cmp_32_122_unordered:
    xor eax, eax
Float_toString_fp_cmp_32_122_done:
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b28
    jmp pulsec_com_pulse_lang_Float_toString__float_b29
pulsec_com_pulse_lang_Float_toString__float_b28:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s33
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s33_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s34
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s34_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+408], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+408]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s32
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s32_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b30
pulsec_com_pulse_lang_Float_toString__float_b29:
    jmp pulsec_com_pulse_lang_Float_toString__float_b30
pulsec_com_pulse_lang_Float_toString__float_b30:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s35
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s35_len
    call pulsec_rt_traceUpdateTop
    call pulsec_com_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+144], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s36
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s36_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s37
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s37_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b31
pulsec_com_pulse_lang_Float_toString__float_b31:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+416], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+416]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b32
    jmp pulsec_com_pulse_lang_Float_toString__float_b33
pulsec_com_pulse_lang_Float_toString__float_b32:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s38
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s38_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_fpToInt
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s39
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s39_len
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
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s40
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s40_len
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
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s41
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s41_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+448], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+448]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s37
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s37_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b31
pulsec_com_pulse_lang_Float_toString__float_b33:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s42
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s42_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je Float_toString_vd42_159_null
    call pulsec_com_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd42_159_done
Float_toString_vd42_159_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd42_159_done:
    mov qword ptr [rsp+168], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s43
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s43_len
    call pulsec_rt_traceUpdateTop
    call pulsec_com_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+176], rax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s44
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s44_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b34
    jmp pulsec_com_pulse_lang_Float_toString__float_b35
pulsec_com_pulse_lang_Float_toString__float_b34:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s45
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s45_len
    call pulsec_rt_traceUpdateTop
    mov eax, 45
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s44
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s44_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b36
pulsec_com_pulse_lang_Float_toString__float_b35:
    jmp pulsec_com_pulse_lang_Float_toString__float_b36
pulsec_com_pulse_lang_Float_toString__float_b36:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s46
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s46_len
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
    jne Float_toString_ternary_then_46_174
    mov eax, 0
    jmp Float_toString_ternary_done_46_174
Float_toString_ternary_then_46_174:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+464], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+464]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_46_174:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b37
    jmp pulsec_com_pulse_lang_Float_toString__float_b38
pulsec_com_pulse_lang_Float_toString__float_b37:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s47
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s47_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+472], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+472]
    add eax, edx
    mov dword ptr [rsp+184], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s48
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s48_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s49
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s49_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b40
    jmp pulsec_com_pulse_lang_Float_toString__float_b41
pulsec_com_pulse_lang_Float_toString__float_b38:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s46
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s46_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b39
pulsec_com_pulse_lang_Float_toString__float_b39:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s81
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s81_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s82
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s82_len
    call pulsec_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s83
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s83_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s84_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b67
pulsec_com_pulse_lang_Float_toString__float_b40:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s50_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b43
pulsec_com_pulse_lang_Float_toString__float_b41:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s49
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s49_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b42
pulsec_com_pulse_lang_Float_toString__float_b42:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s67
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s67_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s68
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s68_len
    call pulsec_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s69
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s69_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s70_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b58
pulsec_com_pulse_lang_Float_toString__float_b43:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s50_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b44
    jmp pulsec_com_pulse_lang_Float_toString__float_b45
pulsec_com_pulse_lang_Float_toString__float_b44:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s51
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s51_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s52
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s52_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b46
    jmp pulsec_com_pulse_lang_Float_toString__float_b47
pulsec_com_pulse_lang_Float_toString__float_b45:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s56
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s56_len
    call pulsec_rt_traceUpdateTop
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s57
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s57_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s58_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b49
pulsec_com_pulse_lang_Float_toString__float_b46:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s53
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s53_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+160], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s52
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s52_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b48
pulsec_com_pulse_lang_Float_toString__float_b47:
    jmp pulsec_com_pulse_lang_Float_toString__float_b48
pulsec_com_pulse_lang_Float_toString__float_b48:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s54
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s54_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+160]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s55
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s55_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+504], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+504]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s50
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s50_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b43
pulsec_com_pulse_lang_Float_toString__float_b49:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s58_len
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
    jne Float_toString_ternary_then_58_220
    mov eax, 0
    jmp Float_toString_ternary_done_58_220
Float_toString_ternary_then_58_220:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+520], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+520]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+528], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+528]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_58_220:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b50
    jmp pulsec_com_pulse_lang_Float_toString__float_b51
pulsec_com_pulse_lang_Float_toString__float_b50:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s59
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s59_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+536], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+536]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s58
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s58_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b49
pulsec_com_pulse_lang_Float_toString__float_b51:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s60_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b52
    jmp pulsec_com_pulse_lang_Float_toString__float_b53
pulsec_com_pulse_lang_Float_toString__float_b52:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s61
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s61_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s60_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b54
pulsec_com_pulse_lang_Float_toString__float_b53:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s62
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s62_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s63_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b55
pulsec_com_pulse_lang_Float_toString__float_b54:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s66
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s66_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je Float_toString_vd66_250_null
    call pulsec_com_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd66_250_done
Float_toString_vd66_250_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd66_250_done:
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b55:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s63_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b56
    jmp pulsec_com_pulse_lang_Float_toString__float_b57
pulsec_com_pulse_lang_Float_toString__float_b56:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s64
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s64_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s65
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s65_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+560], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+560]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s63
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s63_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b55
pulsec_com_pulse_lang_Float_toString__float_b57:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s60
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s60_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b54
pulsec_com_pulse_lang_Float_toString__float_b58:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s70_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b59
    jmp pulsec_com_pulse_lang_Float_toString__float_b60
pulsec_com_pulse_lang_Float_toString__float_b59:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s71
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s71_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s72
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s72_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+584], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+584]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s70
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s70_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b58
pulsec_com_pulse_lang_Float_toString__float_b60:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s73
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s73_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s74
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s74_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b61
pulsec_com_pulse_lang_Float_toString__float_b61:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+592], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+592]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_74_287
    mov eax, 0
    jmp Float_toString_ternary_done_74_287
Float_toString_ternary_then_74_287:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+600], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+600]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+608], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+608]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_74_287:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b62
    jmp pulsec_com_pulse_lang_Float_toString__float_b63
pulsec_com_pulse_lang_Float_toString__float_b62:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s75
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s75_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+616], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+616]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s74
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s74_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b61
pulsec_com_pulse_lang_Float_toString__float_b63:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s76
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s76_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s77
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s77_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b64
pulsec_com_pulse_lang_Float_toString__float_b64:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+624], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+624]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b65
    jmp pulsec_com_pulse_lang_Float_toString__float_b66
pulsec_com_pulse_lang_Float_toString__float_b65:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s78
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s78_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s79
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s79_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+632], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+632]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s77
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s77_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b64
pulsec_com_pulse_lang_Float_toString__float_b66:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s80
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s80_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je Float_toString_vd80_310_null
    call pulsec_com_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd80_310_done
Float_toString_vd80_310_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd80_310_done:
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b67:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s84_len
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
    jne Float_toString_ternary_then_84_335
    mov eax, 0
    jmp Float_toString_ternary_done_84_335
Float_toString_ternary_then_84_335:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+648], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+648]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+656], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+656]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_84_335:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_toString__float_b68
    jmp pulsec_com_pulse_lang_Float_toString__float_b69
pulsec_com_pulse_lang_Float_toString__float_b68:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s85
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s85_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+664], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+664]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s84
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s84_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b67
pulsec_com_pulse_lang_Float_toString__float_b69:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s86_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b70
    jmp pulsec_com_pulse_lang_Float_toString__float_b71
pulsec_com_pulse_lang_Float_toString__float_b70:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s87
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s87_len
    call pulsec_rt_traceUpdateTop
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s86_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b72
pulsec_com_pulse_lang_Float_toString__float_b71:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s88
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s88_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s89_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b73
pulsec_com_pulse_lang_Float_toString__float_b72:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s92
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s92_len
    call pulsec_rt_traceUpdateTop
    mov eax, 69
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s93
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s93_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null
    call pulsec_com_pulse_lang_StringBuilder_append__String
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s94
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s94_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je Float_toString_vd94_376_null
    call pulsec_com_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd94_376_done
Float_toString_vd94_376_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd94_376_done:
    jmp pulsec_com_pulse_lang_Float_toString__float_epilogue
pulsec_com_pulse_lang_Float_toString__float_b73:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s89_len
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
    jne pulsec_com_pulse_lang_Float_toString__float_b74
    jmp pulsec_com_pulse_lang_Float_toString__float_b75
pulsec_com_pulse_lang_Float_toString__float_b74:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s90
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s90_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    call pulsec_com_pulse_lang_String_charAt__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov dword ptr [rsp+696], eax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null
    call pulsec_com_pulse_lang_StringBuilder_append__char
    jmp pulsec_com_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s91
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s91_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+688], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+688]
    add eax, edx
    mov dword ptr [rsp+152], eax
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s89
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s89_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b73
pulsec_com_pulse_lang_Float_toString__float_b75:
    lea rcx, pulsec_com_pulse_lang_Float_toString__float_trace_s86
    mov edx, pulsec_com_pulse_lang_Float_toString__float_trace_s86_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_toString__float_b72
pulsec_com_pulse_lang_Float_toString__float_epilogue:
pulsec_com_pulse_lang_Float_toString__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 808
    ret
pulsec_com_pulse_lang_Float_toString__float endp

pulsec_com_pulse_lang_Float_buildMinValue proc
    sub rsp, 216
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m118
    mov edx, trace_m118_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_lang_Float_buildMinValue_b0:
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 4608989706678435840
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_buildMinValue_b1
pulsec_com_pulse_lang_Float_buildMinValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_buildMinValue_b2
    jmp pulsec_com_pulse_lang_Float_buildMinValue_b3
pulsec_com_pulse_lang_Float_buildMinValue_b2:
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    divsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_buildMinValue_b1
pulsec_com_pulse_lang_Float_buildMinValue_b3:
    lea rcx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s5
    mov edx, pulsec_com_pulse_lang_Float_buildMinValue_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_buildMinValue_epilogue
pulsec_com_pulse_lang_Float_buildMinValue_epilogue:
pulsec_com_pulse_lang_Float_buildMinValue_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_Float_buildMinValue endp

pulsec_com_pulse_lang_Float_buildMaxValue proc
    sub rsp, 216
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m125
    mov edx, trace_m125_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_lang_Float_buildMaxValue_b0:
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 4614844896006635520
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_buildMaxValue_b1
pulsec_com_pulse_lang_Float_buildMaxValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 38
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_buildMaxValue_b2
    jmp pulsec_com_pulse_lang_Float_buildMaxValue_b3
pulsec_com_pulse_lang_Float_buildMaxValue_b2:
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    mulsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_buildMaxValue_b1
pulsec_com_pulse_lang_Float_buildMaxValue_b3:
    lea rcx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s5
    mov edx, pulsec_com_pulse_lang_Float_buildMaxValue_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_buildMaxValue_epilogue
pulsec_com_pulse_lang_Float_buildMaxValue_epilogue:
pulsec_com_pulse_lang_Float_buildMaxValue_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_Float_buildMaxValue endp

end
