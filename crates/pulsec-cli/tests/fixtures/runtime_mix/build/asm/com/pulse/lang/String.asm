option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_panic:proc
extrn pulsec_com_pulse_lang_Object_toString:proc
extrn pulsec_com_pulse_lang_Throwable_toString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_charToString:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_stringCharAt:proc
extrn pulsec_rt_stringConcat:proc
extrn pulsec_rt_stringLength:proc
extrn pulsec_rt_stringSubstring:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_String dd 0
trace_m0 db "com.pulse.lang.String.length"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_String_length_trace_s0 db "com.pulse.lang.String.length(String.pulse:13)"
pulsec_com_pulse_lang_String_length_trace_s0_len equ $ - pulsec_com_pulse_lang_String_length_trace_s0
trace_m2 db "com.pulse.lang.String.isEmpty"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_String_isEmpty_trace_s0 db "com.pulse.lang.String.isEmpty(String.pulse:21)"
pulsec_com_pulse_lang_String_isEmpty_trace_s0_len equ $ - pulsec_com_pulse_lang_String_isEmpty_trace_s0
trace_m4 db "com.pulse.lang.String.concat"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_String_concat__String_trace_s0 db "com.pulse.lang.String.concat(String.pulse:29)"
pulsec_com_pulse_lang_String_concat__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_concat__String_trace_s0
trace_m6 db "com.pulse.lang.String.charAt"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_String_charAt__int_trace_s0 db "com.pulse.lang.String.charAt(String.pulse:37)"
pulsec_com_pulse_lang_String_charAt__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_charAt__int_trace_s0
trace_m8 db "com.pulse.lang.String.substring"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_String_substring__int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:45)"
pulsec_com_pulse_lang_String_substring__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_substring__int_trace_s0
trace_m10 db "com.pulse.lang.String.substring"
trace_m10_len equ $ - trace_m10
pulsec_com_pulse_lang_String_substring__int_int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:53)"
pulsec_com_pulse_lang_String_substring__int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_substring__int_int_trace_s0
trace_m12 db "com.pulse.lang.String.equals"
trace_m12_len equ $ - trace_m12
pulsec_com_pulse_lang_String_equals__Object_trace_s0 db "com.pulse.lang.String.equals(String.pulse:61)"
pulsec_com_pulse_lang_String_equals__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s0
pulsec_com_pulse_lang_String_equals__Object_trace_s1 db "com.pulse.lang.String.equals(String.pulse:62)"
pulsec_com_pulse_lang_String_equals__Object_trace_s1_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s1
pulsec_com_pulse_lang_String_equals__Object_trace_s2 db "com.pulse.lang.String.equals(String.pulse:64)"
pulsec_com_pulse_lang_String_equals__Object_trace_s2_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s2
pulsec_com_pulse_lang_String_equals__Object_trace_s3 db "com.pulse.lang.String.equals(String.pulse:65)"
pulsec_com_pulse_lang_String_equals__Object_trace_s3_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s3
pulsec_com_pulse_lang_String_equals__Object_trace_s4 db "com.pulse.lang.String.equals(String.pulse:66)"
pulsec_com_pulse_lang_String_equals__Object_trace_s4_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s4
pulsec_com_pulse_lang_String_equals__Object_trace_s5 db "com.pulse.lang.String.equals(String.pulse:68)"
pulsec_com_pulse_lang_String_equals__Object_trace_s5_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s5
pulsec_com_pulse_lang_String_equals__Object_trace_s6 db "com.pulse.lang.String.equals(String.pulse:69)"
pulsec_com_pulse_lang_String_equals__Object_trace_s6_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s6
pulsec_com_pulse_lang_String_equals__Object_trace_s7 db "com.pulse.lang.String.equals(String.pulse:70)"
pulsec_com_pulse_lang_String_equals__Object_trace_s7_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s7
pulsec_com_pulse_lang_String_equals__Object_trace_s8 db "com.pulse.lang.String.equals(String.pulse:71)"
pulsec_com_pulse_lang_String_equals__Object_trace_s8_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s8
pulsec_com_pulse_lang_String_equals__Object_trace_s9 db "com.pulse.lang.String.equals(String.pulse:73)"
pulsec_com_pulse_lang_String_equals__Object_trace_s9_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s9
pulsec_com_pulse_lang_String_equals__Object_trace_s10 db "com.pulse.lang.String.equals(String.pulse:75)"
pulsec_com_pulse_lang_String_equals__Object_trace_s10_len equ $ - pulsec_com_pulse_lang_String_equals__Object_trace_s10
trace_m24 db "com.pulse.lang.String.startsWith"
trace_m24_len equ $ - trace_m24
pulsec_com_pulse_lang_String_startsWith__String_trace_s0 db "com.pulse.lang.String.startsWith(String.pulse:83)"
pulsec_com_pulse_lang_String_startsWith__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_startsWith__String_trace_s0
trace_m26 db "com.pulse.lang.String.endsWith"
trace_m26_len equ $ - trace_m26
pulsec_com_pulse_lang_String_endsWith__String_trace_s0 db "com.pulse.lang.String.endsWith(String.pulse:91)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s0
pulsec_com_pulse_lang_String_endsWith__String_trace_s1 db "com.pulse.lang.String.endsWith(String.pulse:92)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s1_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s1
pulsec_com_pulse_lang_String_endsWith__String_trace_s2 db "com.pulse.lang.String.endsWith(String.pulse:93)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s2_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s2
pulsec_com_pulse_lang_String_endsWith__String_trace_s3 db "com.pulse.lang.String.endsWith(String.pulse:94)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s3_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s3
pulsec_com_pulse_lang_String_endsWith__String_trace_s4 db "com.pulse.lang.String.endsWith(String.pulse:95)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s4_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s4
pulsec_com_pulse_lang_String_endsWith__String_trace_s5 db "com.pulse.lang.String.endsWith(String.pulse:97)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s5_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s5
pulsec_com_pulse_lang_String_endsWith__String_trace_s6 db "com.pulse.lang.String.endsWith(String.pulse:98)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s6_len equ $ - pulsec_com_pulse_lang_String_endsWith__String_trace_s6
trace_m34 db "com.pulse.lang.String.contains"
trace_m34_len equ $ - trace_m34
pulsec_com_pulse_lang_String_contains__String_trace_s0 db "com.pulse.lang.String.contains(String.pulse:106)"
pulsec_com_pulse_lang_String_contains__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_contains__String_trace_s0
trace_m36 db "com.pulse.lang.String.indexOf"
trace_m36_len equ $ - trace_m36
pulsec_com_pulse_lang_String_indexOf__String_trace_s0 db "com.pulse.lang.String.indexOf(String.pulse:114)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s0
pulsec_com_pulse_lang_String_indexOf__String_trace_s1 db "com.pulse.lang.String.indexOf(String.pulse:115)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s1_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s1
pulsec_com_pulse_lang_String_indexOf__String_trace_s2 db "com.pulse.lang.String.indexOf(String.pulse:116)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s2_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s2
pulsec_com_pulse_lang_String_indexOf__String_trace_s3 db "com.pulse.lang.String.indexOf(String.pulse:117)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s3_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s3
pulsec_com_pulse_lang_String_indexOf__String_trace_s4 db "com.pulse.lang.String.indexOf(String.pulse:119)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s4_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s4
pulsec_com_pulse_lang_String_indexOf__String_trace_s5 db "com.pulse.lang.String.indexOf(String.pulse:120)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s5_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s5
pulsec_com_pulse_lang_String_indexOf__String_trace_s6 db "com.pulse.lang.String.indexOf(String.pulse:122)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s6_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s6
pulsec_com_pulse_lang_String_indexOf__String_trace_s7 db "com.pulse.lang.String.indexOf(String.pulse:123)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s7_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s7
pulsec_com_pulse_lang_String_indexOf__String_trace_s8 db "com.pulse.lang.String.indexOf(String.pulse:124)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s8_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s8
pulsec_com_pulse_lang_String_indexOf__String_trace_s9 db "com.pulse.lang.String.indexOf(String.pulse:125)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s9_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s9
pulsec_com_pulse_lang_String_indexOf__String_trace_s10 db "com.pulse.lang.String.indexOf(String.pulse:126)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s10_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s10
pulsec_com_pulse_lang_String_indexOf__String_trace_s11 db "com.pulse.lang.String.indexOf(String.pulse:127)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s11_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s11
pulsec_com_pulse_lang_String_indexOf__String_trace_s12 db "com.pulse.lang.String.indexOf(String.pulse:128)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s12_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s12
pulsec_com_pulse_lang_String_indexOf__String_trace_s13 db "com.pulse.lang.String.indexOf(String.pulse:129)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s13_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s13
pulsec_com_pulse_lang_String_indexOf__String_trace_s14 db "com.pulse.lang.String.indexOf(String.pulse:130)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s14_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s14
pulsec_com_pulse_lang_String_indexOf__String_trace_s15 db "com.pulse.lang.String.indexOf(String.pulse:132)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s15_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s15
pulsec_com_pulse_lang_String_indexOf__String_trace_s16 db "com.pulse.lang.String.indexOf(String.pulse:135)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s16_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s16
pulsec_com_pulse_lang_String_indexOf__String_trace_s17 db "com.pulse.lang.String.indexOf(String.pulse:136)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s17_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s17
pulsec_com_pulse_lang_String_indexOf__String_trace_s18 db "com.pulse.lang.String.indexOf(String.pulse:138)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s18_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s18
pulsec_com_pulse_lang_String_indexOf__String_trace_s19 db "com.pulse.lang.String.indexOf(String.pulse:140)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s19_len equ $ - pulsec_com_pulse_lang_String_indexOf__String_trace_s19
trace_m57 db "com.pulse.lang.String.lastIndexOf"
trace_m57_len equ $ - trace_m57
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0 db "com.pulse.lang.String.lastIndexOf(String.pulse:148)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1 db "com.pulse.lang.String.lastIndexOf(String.pulse:149)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2 db "com.pulse.lang.String.lastIndexOf(String.pulse:150)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3 db "com.pulse.lang.String.lastIndexOf(String.pulse:151)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4 db "com.pulse.lang.String.lastIndexOf(String.pulse:153)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5 db "com.pulse.lang.String.lastIndexOf(String.pulse:154)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6 db "com.pulse.lang.String.lastIndexOf(String.pulse:156)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7 db "com.pulse.lang.String.lastIndexOf(String.pulse:157)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8 db "com.pulse.lang.String.lastIndexOf(String.pulse:158)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9 db "com.pulse.lang.String.lastIndexOf(String.pulse:159)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10 db "com.pulse.lang.String.lastIndexOf(String.pulse:160)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11 db "com.pulse.lang.String.lastIndexOf(String.pulse:161)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12 db "com.pulse.lang.String.lastIndexOf(String.pulse:162)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13 db "com.pulse.lang.String.lastIndexOf(String.pulse:163)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14 db "com.pulse.lang.String.lastIndexOf(String.pulse:165)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15 db "com.pulse.lang.String.lastIndexOf(String.pulse:168)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16 db "com.pulse.lang.String.lastIndexOf(String.pulse:169)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17 db "com.pulse.lang.String.lastIndexOf(String.pulse:171)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18 db "com.pulse.lang.String.lastIndexOf(String.pulse:173)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18_len equ $ - pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18
trace_m77 db "com.pulse.lang.String.trim"
trace_m77_len equ $ - trace_m77
pulsec_com_pulse_lang_String_trim_trace_s0 db "com.pulse.lang.String.trim(String.pulse:181)"
pulsec_com_pulse_lang_String_trim_trace_s0_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s0
pulsec_com_pulse_lang_String_trim_trace_s1 db "com.pulse.lang.String.trim(String.pulse:182)"
pulsec_com_pulse_lang_String_trim_trace_s1_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s1
pulsec_com_pulse_lang_String_trim_trace_s2 db "com.pulse.lang.String.trim(String.pulse:183)"
pulsec_com_pulse_lang_String_trim_trace_s2_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s2
pulsec_com_pulse_lang_String_trim_trace_s3 db "com.pulse.lang.String.trim(String.pulse:184)"
pulsec_com_pulse_lang_String_trim_trace_s3_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s3
pulsec_com_pulse_lang_String_trim_trace_s4 db "com.pulse.lang.String.trim(String.pulse:185)"
pulsec_com_pulse_lang_String_trim_trace_s4_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s4
pulsec_com_pulse_lang_String_trim_trace_s5 db "com.pulse.lang.String.trim(String.pulse:186)"
pulsec_com_pulse_lang_String_trim_trace_s5_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s5
pulsec_com_pulse_lang_String_trim_trace_s6 db "com.pulse.lang.String.trim(String.pulse:188)"
pulsec_com_pulse_lang_String_trim_trace_s6_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s6
pulsec_com_pulse_lang_String_trim_trace_s7 db "com.pulse.lang.String.trim(String.pulse:191)"
pulsec_com_pulse_lang_String_trim_trace_s7_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s7
pulsec_com_pulse_lang_String_trim_trace_s8 db "com.pulse.lang.String.trim(String.pulse:192)"
pulsec_com_pulse_lang_String_trim_trace_s8_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s8
pulsec_com_pulse_lang_String_trim_trace_s9 db "com.pulse.lang.String.trim(String.pulse:193)"
pulsec_com_pulse_lang_String_trim_trace_s9_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s9
pulsec_com_pulse_lang_String_trim_trace_s10 db "com.pulse.lang.String.trim(String.pulse:194)"
pulsec_com_pulse_lang_String_trim_trace_s10_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s10
pulsec_com_pulse_lang_String_trim_trace_s11 db "com.pulse.lang.String.trim(String.pulse:196)"
pulsec_com_pulse_lang_String_trim_trace_s11_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s11
pulsec_com_pulse_lang_String_trim_trace_s12 db "com.pulse.lang.String.trim(String.pulse:199)"
pulsec_com_pulse_lang_String_trim_trace_s12_len equ $ - pulsec_com_pulse_lang_String_trim_trace_s12
trace_m91 db "com.pulse.lang.String.valueOf"
trace_m91_len equ $ - trace_m91
pulsec_com_pulse_lang_String_valueOf__int_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:207)"
pulsec_com_pulse_lang_String_valueOf__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__int_trace_s0
trace_m93 db "com.pulse.lang.String.valueOf"
trace_m93_len equ $ - trace_m93
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:215)"
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0
trace_m95 db "com.pulse.lang.String.valueOf"
trace_m95_len equ $ - trace_m95
pulsec_com_pulse_lang_String_valueOf__char_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:223)"
pulsec_com_pulse_lang_String_valueOf__char_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__char_trace_s0
trace_m97 db "com.pulse.lang.String.valueOf"
trace_m97_len equ $ - trace_m97
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:231)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s0
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1 db "com.pulse.lang.String.valueOf(String.pulse:232)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s1
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2 db "com.pulse.lang.String.valueOf(String.pulse:234)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s2
trace_m101 db "com.pulse.lang.String.runtimeCharAt"
trace_m101_len equ $ - trace_m101
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0 db "com.pulse.lang.String.runtimeCharAt(String.pulse:242)"
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0
trace_m103 db "com.pulse.lang.String.runtimeSubstring"
trace_m103_len equ $ - trace_m103
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0 db "com.pulse.lang.String.runtimeSubstring(String.pulse:250)"
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0
trace_m105 db "com.pulse.lang.String.runtimeFromChar"
trace_m105_len equ $ - trace_m105
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0 db "com.pulse.lang.String.runtimeFromChar(String.pulse:258)"
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0
msg0 db "Invalid cast"
msg0_len equ $ - msg0
msg1 db 0
msg1_len equ $ - msg1
msg2 db "null"
msg2_len equ $ - msg2
msg3 db 0
msg3_len equ $ - msg3
msg4 db 0
msg4_len equ $ - msg4

.code
pulsec_com_pulse_lang_String_length proc
    sub rsp, 120
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
pulsec_com_pulse_lang_String_length_b0:
    lea rcx, pulsec_com_pulse_lang_String_length_trace_s0
    mov edx, pulsec_com_pulse_lang_String_length_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_stringLength
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_String_length_epilogue
pulsec_com_pulse_lang_String_length_epilogue:
pulsec_com_pulse_lang_String_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_length endp

pulsec_com_pulse_lang_String_isEmpty proc
    sub rsp, 136
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
pulsec_com_pulse_lang_String_isEmpty_b0:
    lea rcx, pulsec_com_pulse_lang_String_isEmpty_trace_s0
    mov edx, pulsec_com_pulse_lang_String_isEmpty_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_String_isEmpty_epilogue
pulsec_com_pulse_lang_String_isEmpty_epilogue:
pulsec_com_pulse_lang_String_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_isEmpty endp

pulsec_com_pulse_lang_String_concat__String proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_String_concat__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_concat__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_concat__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_lang_String_concat__String_epilogue
pulsec_com_pulse_lang_String_concat__String_epilogue:
pulsec_com_pulse_lang_String_concat__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_concat__String endp

pulsec_com_pulse_lang_String_charAt__int proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_String_charAt__int_b0:
    lea rcx, pulsec_com_pulse_lang_String_charAt__int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_charAt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_stringCharAt
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_lang_String_charAt__int_epilogue
pulsec_com_pulse_lang_String_charAt__int_epilogue:
pulsec_com_pulse_lang_String_charAt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_charAt__int endp

pulsec_com_pulse_lang_String_substring__int proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_String_substring__int_b0:
    lea rcx, pulsec_com_pulse_lang_String_substring__int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_substring__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_com_pulse_lang_String_substring__int_int
    jmp pulsec_com_pulse_lang_String_substring__int_epilogue
pulsec_com_pulse_lang_String_substring__int_epilogue:
pulsec_com_pulse_lang_String_substring__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_substring__int endp

pulsec_com_pulse_lang_String_substring__int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_String_substring__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_String_substring__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_substring__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_stringSubstring
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_String_substring__int_int_epilogue
pulsec_com_pulse_lang_String_substring__int_int_epilogue:
pulsec_com_pulse_lang_String_substring__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_substring__int_int endp

pulsec_com_pulse_lang_String_equals__Object proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], rcx
pulsec_com_pulse_lang_String_equals__Object_b0:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    cmp eax, 0
    je String_equals_instof_0_1_false
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_instof_0_1_false
    cmp edx, 33
    je String_equals_instof_0_1_true
String_equals_instof_0_1_false:
    xor eax, eax
    jmp String_equals_instof_0_1_done
String_equals_instof_0_1_true:
    mov eax, 1
String_equals_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_equals__Object_b1
    jmp pulsec_com_pulse_lang_String_equals__Object_b2
pulsec_com_pulse_lang_String_equals__Object_b1:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s1
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_equals__Object_epilogue
pulsec_com_pulse_lang_String_equals__Object_b2:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_equals__Object_b3
pulsec_com_pulse_lang_String_equals__Object_b3:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s2
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    cmp eax, 0
    je String_equals_cast_2_5_null
    mov r8, rax
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_cast_2_5_fail
    cmp edx, 33
    je String_equals_cast_2_5_ok
String_equals_cast_2_5_fail:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_equals_cast_2_5_done
String_equals_cast_2_5_null:
    xor eax, eax
    jmp String_equals_cast_2_5_done
String_equals_cast_2_5_ok:
    mov rax, r8
String_equals_cast_2_5_done:
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s3
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_equals__Object_b4
    jmp pulsec_com_pulse_lang_String_equals__Object_b5
pulsec_com_pulse_lang_String_equals__Object_b4:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s4
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_equals__Object_epilogue
pulsec_com_pulse_lang_String_equals__Object_b5:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s3
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_equals__Object_b6
pulsec_com_pulse_lang_String_equals__Object_b6:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s5
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s6
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_equals__Object_b7
pulsec_com_pulse_lang_String_equals__Object_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_length
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_equals__Object_b8
    jmp pulsec_com_pulse_lang_String_equals__Object_b9
pulsec_com_pulse_lang_String_equals__Object_b8:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s7
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_charAt__int
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_equals__Object_b10
    jmp pulsec_com_pulse_lang_String_equals__Object_b11
pulsec_com_pulse_lang_String_equals__Object_b9:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s10
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_String_equals__Object_epilogue
pulsec_com_pulse_lang_String_equals__Object_b10:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s8
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_equals__Object_epilogue
pulsec_com_pulse_lang_String_equals__Object_b11:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s7
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_equals__Object_b12
pulsec_com_pulse_lang_String_equals__Object_b12:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s9
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s6
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_equals__Object_b7
pulsec_com_pulse_lang_String_equals__Object_epilogue:
pulsec_com_pulse_lang_String_equals__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_equals__Object endp

pulsec_com_pulse_lang_String_startsWith__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_String_startsWith__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_startsWith__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_startsWith__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_com_pulse_lang_String_indexOf__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_String_startsWith__String_epilogue
pulsec_com_pulse_lang_String_startsWith__String_epilogue:
pulsec_com_pulse_lang_String_startsWith__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_startsWith__String endp

pulsec_com_pulse_lang_String_endsWith__String proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+96], rcx
pulsec_com_pulse_lang_String_endsWith__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+96]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s3
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_endsWith__String_b1
    jmp pulsec_com_pulse_lang_String_endsWith__String_b2
pulsec_com_pulse_lang_String_endsWith__String_b1:
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s4
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_endsWith__String_epilogue
pulsec_com_pulse_lang_String_endsWith__String_b2:
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s3
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_endsWith__String_b3
pulsec_com_pulse_lang_String_endsWith__String_b3:
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s5
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    mov r8d, eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s6
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+120], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_equals__Object
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_com_pulse_lang_String_endsWith__String_epilogue
pulsec_com_pulse_lang_String_endsWith__String_epilogue:
pulsec_com_pulse_lang_String_endsWith__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_lang_String_endsWith__String endp

pulsec_com_pulse_lang_String_contains__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_String_contains__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_contains__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_contains__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_com_pulse_lang_String_indexOf__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_com_pulse_lang_String_contains__String_epilogue
pulsec_com_pulse_lang_String_contains__String_epilogue:
pulsec_com_pulse_lang_String_contains__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_contains__String endp

pulsec_com_pulse_lang_String_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+112], rdx
    mov qword ptr [rsp+120], rcx
pulsec_com_pulse_lang_String_indexOf__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+120]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b1
    jmp pulsec_com_pulse_lang_String_indexOf__String_b2
pulsec_com_pulse_lang_String_indexOf__String_b1:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s3
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_indexOf__String_epilogue
pulsec_com_pulse_lang_String_indexOf__String_b2:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b3
pulsec_com_pulse_lang_String_indexOf__String_b3:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s4
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b4
    jmp pulsec_com_pulse_lang_String_indexOf__String_b5
pulsec_com_pulse_lang_String_indexOf__String_b4:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s5
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_indexOf__String_epilogue
pulsec_com_pulse_lang_String_indexOf__String_b5:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s4
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b6
pulsec_com_pulse_lang_String_indexOf__String_b6:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s6
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s7
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s8
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b7
pulsec_com_pulse_lang_String_indexOf__String_b7:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b8
    jmp pulsec_com_pulse_lang_String_indexOf__String_b9
pulsec_com_pulse_lang_String_indexOf__String_b8:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s9
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s10
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b10
pulsec_com_pulse_lang_String_indexOf__String_b9:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s19
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_indexOf__String_epilogue
pulsec_com_pulse_lang_String_indexOf__String_b10:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b11
    jmp pulsec_com_pulse_lang_String_indexOf__String_b12
pulsec_com_pulse_lang_String_indexOf__String_b11:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+120]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_charAt__int
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b13
    jmp pulsec_com_pulse_lang_String_indexOf__String_b14
pulsec_com_pulse_lang_String_indexOf__String_b12:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s16
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    test eax, eax
    jne pulsec_com_pulse_lang_String_indexOf__String_b16
    jmp pulsec_com_pulse_lang_String_indexOf__String_b17
pulsec_com_pulse_lang_String_indexOf__String_b13:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s13
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s14
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b15
pulsec_com_pulse_lang_String_indexOf__String_b14:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s15
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b15
pulsec_com_pulse_lang_String_indexOf__String_b15:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b10
pulsec_com_pulse_lang_String_indexOf__String_b16:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s17
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    jmp pulsec_com_pulse_lang_String_indexOf__String_epilogue
pulsec_com_pulse_lang_String_indexOf__String_b17:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s16
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b18
pulsec_com_pulse_lang_String_indexOf__String_b18:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s18
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s8
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_indexOf__String_b7
pulsec_com_pulse_lang_String_indexOf__String_epilogue:
pulsec_com_pulse_lang_String_indexOf__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 248
    ret
pulsec_com_pulse_lang_String_indexOf__String endp

pulsec_com_pulse_lang_String_lastIndexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+112], rcx
pulsec_com_pulse_lang_String_lastIndexOf__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+112]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b1
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b2
pulsec_com_pulse_lang_String_lastIndexOf__String_b1:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue
pulsec_com_pulse_lang_String_lastIndexOf__String_b2:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b3
pulsec_com_pulse_lang_String_lastIndexOf__String_b3:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b4
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b5
pulsec_com_pulse_lang_String_lastIndexOf__String_b4:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue
pulsec_com_pulse_lang_String_lastIndexOf__String_b5:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b6
pulsec_com_pulse_lang_String_lastIndexOf__String_b6:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b7
pulsec_com_pulse_lang_String_lastIndexOf__String_b7:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b8
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b9
pulsec_com_pulse_lang_String_lastIndexOf__String_b8:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b10
pulsec_com_pulse_lang_String_lastIndexOf__String_b9:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue
pulsec_com_pulse_lang_String_lastIndexOf__String_b10:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b11
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b12
pulsec_com_pulse_lang_String_lastIndexOf__String_b11:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    add eax, edx
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_charAt__int
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b13
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b14
pulsec_com_pulse_lang_String_lastIndexOf__String_b12:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    test eax, eax
    jne pulsec_com_pulse_lang_String_lastIndexOf__String_b16
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b17
pulsec_com_pulse_lang_String_lastIndexOf__String_b13:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b15
pulsec_com_pulse_lang_String_lastIndexOf__String_b14:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+176], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b15
pulsec_com_pulse_lang_String_lastIndexOf__String_b15:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b10
pulsec_com_pulse_lang_String_lastIndexOf__String_b16:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue
pulsec_com_pulse_lang_String_lastIndexOf__String_b17:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b18
pulsec_com_pulse_lang_String_lastIndexOf__String_b18:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_lastIndexOf__String_b7
pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue:
pulsec_com_pulse_lang_String_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 248
    ret
pulsec_com_pulse_lang_String_lastIndexOf__String endp

pulsec_com_pulse_lang_String_trim proc
    sub rsp, 248
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m77
    mov edx, trace_m77_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+88], rcx
pulsec_com_pulse_lang_String_trim_b0:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s0
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s1
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s2
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b1
pulsec_com_pulse_lang_String_trim_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_trim_b2
    jmp pulsec_com_pulse_lang_String_trim_b3
pulsec_com_pulse_lang_String_trim_b2:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s3
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s4
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+104], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_trim_ternary_then_4_18
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_18
String_trim_ternary_then_4_18:
    mov eax, 1
String_trim_ternary_done_4_18:
    test rax, rax
    jne String_trim_ternary_then_4_23
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+120], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_23
String_trim_ternary_then_4_23:
    mov eax, 1
String_trim_ternary_done_4_23:
    test rax, rax
    jne String_trim_ternary_then_4_28
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+128], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_28
String_trim_ternary_then_4_28:
    mov eax, 1
String_trim_ternary_done_4_28:
    test eax, eax
    jne pulsec_com_pulse_lang_String_trim_b4
    jmp pulsec_com_pulse_lang_String_trim_b5
pulsec_com_pulse_lang_String_trim_b3:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s7
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b7
pulsec_com_pulse_lang_String_trim_b4:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s5
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s4
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b6
pulsec_com_pulse_lang_String_trim_b5:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s6
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b3
pulsec_com_pulse_lang_String_trim_b6:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s2
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b1
pulsec_com_pulse_lang_String_trim_b7:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s7
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_trim_b8
    jmp pulsec_com_pulse_lang_String_trim_b9
pulsec_com_pulse_lang_String_trim_b8:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s8
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    sub eax, edx
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s9
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_trim_ternary_then_9_49
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_49
String_trim_ternary_then_9_49:
    mov eax, 1
String_trim_ternary_done_9_49:
    test rax, rax
    jne String_trim_ternary_then_9_54
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+176], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_54
String_trim_ternary_then_9_54:
    mov eax, 1
String_trim_ternary_done_9_54:
    test rax, rax
    jne String_trim_ternary_then_9_59
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_59
String_trim_ternary_then_9_59:
    mov eax, 1
String_trim_ternary_done_9_59:
    test eax, eax
    jne pulsec_com_pulse_lang_String_trim_b10
    jmp pulsec_com_pulse_lang_String_trim_b11
pulsec_com_pulse_lang_String_trim_b9:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s12
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+208], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    mov r8d, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_substring__int_int
    jmp pulsec_com_pulse_lang_String_trim_epilogue
pulsec_com_pulse_lang_String_trim_b10:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s10
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+192], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s9
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b12
pulsec_com_pulse_lang_String_trim_b11:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s11
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b9
pulsec_com_pulse_lang_String_trim_b12:
    lea rcx, pulsec_com_pulse_lang_String_trim_trace_s7
    mov edx, pulsec_com_pulse_lang_String_trim_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_trim_b7
pulsec_com_pulse_lang_String_trim_epilogue:
pulsec_com_pulse_lang_String_trim_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 248
    ret
pulsec_com_pulse_lang_String_trim endp

pulsec_com_pulse_lang_String_valueOf__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m91
    mov edx, trace_m91_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__int_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    jmp pulsec_com_pulse_lang_String_valueOf__int_epilogue
pulsec_com_pulse_lang_String_valueOf__int_epilogue:
pulsec_com_pulse_lang_String_valueOf__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_valueOf__int endp

pulsec_com_pulse_lang_String_valueOf__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m93
    mov edx, trace_m93_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_booleanToString
    jmp pulsec_com_pulse_lang_String_valueOf__boolean_epilogue
pulsec_com_pulse_lang_String_valueOf__boolean_epilogue:
pulsec_com_pulse_lang_String_valueOf__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_valueOf__boolean endp

pulsec_com_pulse_lang_String_valueOf__char proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m95
    mov edx, trace_m95_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__char_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__char_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_charToString
    jmp pulsec_com_pulse_lang_String_valueOf__char_epilogue
pulsec_com_pulse_lang_String_valueOf__char_epilogue:
pulsec_com_pulse_lang_String_valueOf__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_valueOf__char endp

pulsec_com_pulse_lang_String_valueOf__Object proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m97
    mov edx, trace_m97_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_String_valueOf__Object_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    xor eax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_valueOf__Object_b1
    jmp pulsec_com_pulse_lang_String_valueOf__Object_b2
pulsec_com_pulse_lang_String_valueOf__Object_b1:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s1
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_String_valueOf__Object_epilogue
pulsec_com_pulse_lang_String_valueOf__Object_b2:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_valueOf__Object_b3
pulsec_com_pulse_lang_String_valueOf__Object_b3:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s2
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je String_valueOf_vd2_6_null
    call pulsec_rt_objectClassId
    test eax, eax
    jz String_valueOf_vd2_6_type
    cmp eax, 5
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 14
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 15
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 18
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 19
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 20
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 26
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 27
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 28
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 31
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 37
    je String_valueOf_vd2_6_assign_ok
    cmp eax, 42
    je String_valueOf_vd2_6_assign_ok
    jmp String_valueOf_vd2_6_type
String_valueOf_vd2_6_assign_ok:
    cmp eax, 5
    je String_valueOf_vd2_6_ovr0
    cmp eax, 15
    je String_valueOf_vd2_6_ovr1
    cmp eax, 18
    je String_valueOf_vd2_6_ovr2
    cmp eax, 19
    je String_valueOf_vd2_6_ovr3
    cmp eax, 20
    je String_valueOf_vd2_6_ovr4
    cmp eax, 26
    je String_valueOf_vd2_6_ovr5
    cmp eax, 27
    je String_valueOf_vd2_6_ovr6
    cmp eax, 31
    je String_valueOf_vd2_6_ovr7
    cmp eax, 37
    je String_valueOf_vd2_6_ovr8
    cmp eax, 42
    je String_valueOf_vd2_6_ovr9
    jmp String_valueOf_vd2_6_default
String_valueOf_vd2_6_ovr0:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr1:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr2:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr3:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr4:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr5:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr6:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr7:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr8:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_ovr9:
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_default:
    call pulsec_com_pulse_lang_Object_toString
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp String_valueOf_vd2_6_done
String_valueOf_vd2_6_type:
    call pulsec_rt_dispatchInvalidTypePanic
String_valueOf_vd2_6_done:
    jmp pulsec_com_pulse_lang_String_valueOf__Object_epilogue
pulsec_com_pulse_lang_String_valueOf__Object_epilogue:
pulsec_com_pulse_lang_String_valueOf__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_valueOf__Object endp

pulsec_com_pulse_lang_String_runtimeCharAt__String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m101
    mov edx, trace_m101_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_b0:
    lea rcx, pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_runtimeCharAt__String_int_epilogue
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_epilogue:
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_runtimeCharAt__String_int endp

pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m103
    mov edx, trace_m103_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_b0:
    lea rcx, pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue:
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int endp

pulsec_com_pulse_lang_String_runtimeFromChar__char proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m105
    mov edx, trace_m105_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_runtimeFromChar__char_b0:
    lea rcx, pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0
    mov edx, pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue
pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue:
pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_runtimeFromChar__char endp

end
