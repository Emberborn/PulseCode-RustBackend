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
extrn pulsec_com_pulse_lang_Double_toString__double:proc
extrn pulsec_com_pulse_lang_Float_toString__float:proc
extrn pulsec_com_pulse_lang_Object_toString:proc
extrn pulsec_com_pulse_lang_Throwable_toString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_charToString:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_stringCharAt:proc
extrn pulsec_rt_stringConcat:proc
extrn pulsec_rt_stringLength:proc
extrn pulsec_rt_stringSubstring:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_String dd 0
trace_m0 db "com.pulse.lang.String.length"
trace_m0_len equ 28
pulsec_com_pulse_lang_String_length_trace_s0 db "com.pulse.lang.String.length(String.pulse:13)"
pulsec_com_pulse_lang_String_length_trace_s0_len equ 45
trace_m2 db "com.pulse.lang.String.isEmpty"
trace_m2_len equ 29
pulsec_com_pulse_lang_String_isEmpty_trace_s0 db "com.pulse.lang.String.isEmpty(String.pulse:21)"
pulsec_com_pulse_lang_String_isEmpty_trace_s0_len equ 46
trace_m4 db "com.pulse.lang.String.concat"
trace_m4_len equ 28
pulsec_com_pulse_lang_String_concat__String_trace_s0 db "com.pulse.lang.String.concat(String.pulse:29)"
pulsec_com_pulse_lang_String_concat__String_trace_s0_len equ 45
trace_m6 db "com.pulse.lang.String.charAt"
trace_m6_len equ 28
pulsec_com_pulse_lang_String_charAt__int_trace_s0 db "com.pulse.lang.String.charAt(String.pulse:37)"
pulsec_com_pulse_lang_String_charAt__int_trace_s0_len equ 45
trace_m8 db "com.pulse.lang.String.substring"
trace_m8_len equ 31
pulsec_com_pulse_lang_String_substring__int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:45)"
pulsec_com_pulse_lang_String_substring__int_trace_s0_len equ 48
trace_m10 db "com.pulse.lang.String.substring"
trace_m10_len equ 31
pulsec_com_pulse_lang_String_substring__int_int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:53)"
pulsec_com_pulse_lang_String_substring__int_int_trace_s0_len equ 48
trace_m12 db "com.pulse.lang.String.subSequence"
trace_m12_len equ 33
pulsec_com_pulse_lang_String_subSequence__int_int_trace_s0 db "com.pulse.lang.String.subSequence(String.pulse:61)"
pulsec_com_pulse_lang_String_subSequence__int_int_trace_s0_len equ 50
trace_m14 db "com.pulse.lang.String.equals"
trace_m14_len equ 28
pulsec_com_pulse_lang_String_equals__Object_trace_s0 db "com.pulse.lang.String.equals(String.pulse:69)"
pulsec_com_pulse_lang_String_equals__Object_trace_s0_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s1 db "com.pulse.lang.String.equals(String.pulse:70)"
pulsec_com_pulse_lang_String_equals__Object_trace_s1_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s2 db "com.pulse.lang.String.equals(String.pulse:72)"
pulsec_com_pulse_lang_String_equals__Object_trace_s2_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s3 db "com.pulse.lang.String.equals(String.pulse:73)"
pulsec_com_pulse_lang_String_equals__Object_trace_s3_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s4 db "com.pulse.lang.String.equals(String.pulse:74)"
pulsec_com_pulse_lang_String_equals__Object_trace_s4_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s5 db "com.pulse.lang.String.equals(String.pulse:76)"
pulsec_com_pulse_lang_String_equals__Object_trace_s5_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s6 db "com.pulse.lang.String.equals(String.pulse:77)"
pulsec_com_pulse_lang_String_equals__Object_trace_s6_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s7 db "com.pulse.lang.String.equals(String.pulse:78)"
pulsec_com_pulse_lang_String_equals__Object_trace_s7_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s8 db "com.pulse.lang.String.equals(String.pulse:79)"
pulsec_com_pulse_lang_String_equals__Object_trace_s8_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s9 db "com.pulse.lang.String.equals(String.pulse:81)"
pulsec_com_pulse_lang_String_equals__Object_trace_s9_len equ 45
pulsec_com_pulse_lang_String_equals__Object_trace_s10 db "com.pulse.lang.String.equals(String.pulse:83)"
pulsec_com_pulse_lang_String_equals__Object_trace_s10_len equ 45
trace_m26 db "com.pulse.lang.String.compareTo"
trace_m26_len equ 31
pulsec_com_pulse_lang_String_compareTo__Object_trace_s0 db "com.pulse.lang.String.compareTo(String.pulse:91)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s0_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s1 db "com.pulse.lang.String.compareTo(String.pulse:92)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s1_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s2 db "com.pulse.lang.String.compareTo(String.pulse:94)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s2_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s3 db "com.pulse.lang.String.compareTo(String.pulse:95)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s3_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s4 db "com.pulse.lang.String.compareTo(String.pulse:96)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s4_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s5 db "com.pulse.lang.String.compareTo(String.pulse:97)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s5_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s6 db "com.pulse.lang.String.compareTo(String.pulse:98)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s6_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s7 db "com.pulse.lang.String.compareTo(String.pulse:99)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s7_len equ 48
pulsec_com_pulse_lang_String_compareTo__Object_trace_s8 db "com.pulse.lang.String.compareTo(String.pulse:101)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s8_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s9 db "com.pulse.lang.String.compareTo(String.pulse:102)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s9_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s10 db "com.pulse.lang.String.compareTo(String.pulse:103)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s10_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s11 db "com.pulse.lang.String.compareTo(String.pulse:104)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s11_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s12 db "com.pulse.lang.String.compareTo(String.pulse:105)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s12_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s13 db "com.pulse.lang.String.compareTo(String.pulse:106)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s13_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s14 db "com.pulse.lang.String.compareTo(String.pulse:108)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s14_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s15 db "com.pulse.lang.String.compareTo(String.pulse:109)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s15_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s16 db "com.pulse.lang.String.compareTo(String.pulse:111)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s16_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s17 db "com.pulse.lang.String.compareTo(String.pulse:113)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s17_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s18 db "com.pulse.lang.String.compareTo(String.pulse:114)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s18_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s19 db "com.pulse.lang.String.compareTo(String.pulse:116)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s19_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s20 db "com.pulse.lang.String.compareTo(String.pulse:117)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s20_len equ 49
pulsec_com_pulse_lang_String_compareTo__Object_trace_s21 db "com.pulse.lang.String.compareTo(String.pulse:119)"
pulsec_com_pulse_lang_String_compareTo__Object_trace_s21_len equ 49
trace_m49 db "com.pulse.lang.String.startsWith"
trace_m49_len equ 32
pulsec_com_pulse_lang_String_startsWith__String_trace_s0 db "com.pulse.lang.String.startsWith(String.pulse:127)"
pulsec_com_pulse_lang_String_startsWith__String_trace_s0_len equ 50
trace_m51 db "com.pulse.lang.String.endsWith"
trace_m51_len equ 30
pulsec_com_pulse_lang_String_endsWith__String_trace_s0 db "com.pulse.lang.String.endsWith(String.pulse:135)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s0_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s1 db "com.pulse.lang.String.endsWith(String.pulse:136)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s1_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s2 db "com.pulse.lang.String.endsWith(String.pulse:137)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s2_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s3 db "com.pulse.lang.String.endsWith(String.pulse:138)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s3_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s4 db "com.pulse.lang.String.endsWith(String.pulse:139)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s4_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s5 db "com.pulse.lang.String.endsWith(String.pulse:141)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s5_len equ 48
pulsec_com_pulse_lang_String_endsWith__String_trace_s6 db "com.pulse.lang.String.endsWith(String.pulse:142)"
pulsec_com_pulse_lang_String_endsWith__String_trace_s6_len equ 48
trace_m59 db "com.pulse.lang.String.contains"
trace_m59_len equ 30
pulsec_com_pulse_lang_String_contains__String_trace_s0 db "com.pulse.lang.String.contains(String.pulse:150)"
pulsec_com_pulse_lang_String_contains__String_trace_s0_len equ 48
trace_m61 db "com.pulse.lang.String.indexOf"
trace_m61_len equ 29
pulsec_com_pulse_lang_String_indexOf__String_trace_s0 db "com.pulse.lang.String.indexOf(String.pulse:158)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s0_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s1 db "com.pulse.lang.String.indexOf(String.pulse:159)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s1_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s2 db "com.pulse.lang.String.indexOf(String.pulse:160)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s2_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s3 db "com.pulse.lang.String.indexOf(String.pulse:161)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s3_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s4 db "com.pulse.lang.String.indexOf(String.pulse:163)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s4_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s5 db "com.pulse.lang.String.indexOf(String.pulse:164)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s5_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s6 db "com.pulse.lang.String.indexOf(String.pulse:166)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s6_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s7 db "com.pulse.lang.String.indexOf(String.pulse:167)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s7_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s8 db "com.pulse.lang.String.indexOf(String.pulse:168)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s8_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s9 db "com.pulse.lang.String.indexOf(String.pulse:169)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s9_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s10 db "com.pulse.lang.String.indexOf(String.pulse:170)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s10_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s11 db "com.pulse.lang.String.indexOf(String.pulse:171)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s11_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s12 db "com.pulse.lang.String.indexOf(String.pulse:172)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s12_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s13 db "com.pulse.lang.String.indexOf(String.pulse:173)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s13_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s14 db "com.pulse.lang.String.indexOf(String.pulse:174)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s14_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s15 db "com.pulse.lang.String.indexOf(String.pulse:176)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s15_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s16 db "com.pulse.lang.String.indexOf(String.pulse:179)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s16_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s17 db "com.pulse.lang.String.indexOf(String.pulse:180)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s17_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s18 db "com.pulse.lang.String.indexOf(String.pulse:182)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s18_len equ 47
pulsec_com_pulse_lang_String_indexOf__String_trace_s19 db "com.pulse.lang.String.indexOf(String.pulse:184)"
pulsec_com_pulse_lang_String_indexOf__String_trace_s19_len equ 47
trace_m82 db "com.pulse.lang.String.lastIndexOf"
trace_m82_len equ 33
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0 db "com.pulse.lang.String.lastIndexOf(String.pulse:192)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1 db "com.pulse.lang.String.lastIndexOf(String.pulse:193)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2 db "com.pulse.lang.String.lastIndexOf(String.pulse:194)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s2_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3 db "com.pulse.lang.String.lastIndexOf(String.pulse:195)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s3_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4 db "com.pulse.lang.String.lastIndexOf(String.pulse:197)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s4_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5 db "com.pulse.lang.String.lastIndexOf(String.pulse:198)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s5_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6 db "com.pulse.lang.String.lastIndexOf(String.pulse:200)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s6_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7 db "com.pulse.lang.String.lastIndexOf(String.pulse:201)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s7_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8 db "com.pulse.lang.String.lastIndexOf(String.pulse:202)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s8_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9 db "com.pulse.lang.String.lastIndexOf(String.pulse:203)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s9_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10 db "com.pulse.lang.String.lastIndexOf(String.pulse:204)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s10_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11 db "com.pulse.lang.String.lastIndexOf(String.pulse:205)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s11_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12 db "com.pulse.lang.String.lastIndexOf(String.pulse:206)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s12_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13 db "com.pulse.lang.String.lastIndexOf(String.pulse:207)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s13_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14 db "com.pulse.lang.String.lastIndexOf(String.pulse:209)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s14_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15 db "com.pulse.lang.String.lastIndexOf(String.pulse:212)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s15_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16 db "com.pulse.lang.String.lastIndexOf(String.pulse:213)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s16_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17 db "com.pulse.lang.String.lastIndexOf(String.pulse:215)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s17_len equ 51
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18 db "com.pulse.lang.String.lastIndexOf(String.pulse:217)"
pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s18_len equ 51
trace_m102 db "com.pulse.lang.String.trim"
trace_m102_len equ 26
pulsec_com_pulse_lang_String_trim_trace_s0 db "com.pulse.lang.String.trim(String.pulse:225)"
pulsec_com_pulse_lang_String_trim_trace_s0_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s1 db "com.pulse.lang.String.trim(String.pulse:226)"
pulsec_com_pulse_lang_String_trim_trace_s1_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s2 db "com.pulse.lang.String.trim(String.pulse:227)"
pulsec_com_pulse_lang_String_trim_trace_s2_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s3 db "com.pulse.lang.String.trim(String.pulse:228)"
pulsec_com_pulse_lang_String_trim_trace_s3_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s4 db "com.pulse.lang.String.trim(String.pulse:229)"
pulsec_com_pulse_lang_String_trim_trace_s4_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s5 db "com.pulse.lang.String.trim(String.pulse:230)"
pulsec_com_pulse_lang_String_trim_trace_s5_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s6 db "com.pulse.lang.String.trim(String.pulse:232)"
pulsec_com_pulse_lang_String_trim_trace_s6_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s7 db "com.pulse.lang.String.trim(String.pulse:235)"
pulsec_com_pulse_lang_String_trim_trace_s7_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s8 db "com.pulse.lang.String.trim(String.pulse:236)"
pulsec_com_pulse_lang_String_trim_trace_s8_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s9 db "com.pulse.lang.String.trim(String.pulse:237)"
pulsec_com_pulse_lang_String_trim_trace_s9_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s10 db "com.pulse.lang.String.trim(String.pulse:238)"
pulsec_com_pulse_lang_String_trim_trace_s10_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s11 db "com.pulse.lang.String.trim(String.pulse:240)"
pulsec_com_pulse_lang_String_trim_trace_s11_len equ 44
pulsec_com_pulse_lang_String_trim_trace_s12 db "com.pulse.lang.String.trim(String.pulse:243)"
pulsec_com_pulse_lang_String_trim_trace_s12_len equ 44
trace_m116 db "com.pulse.lang.String.valueOf"
trace_m116_len equ 29
pulsec_com_pulse_lang_String_valueOf__int_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:251)"
pulsec_com_pulse_lang_String_valueOf__int_trace_s0_len equ 47
trace_m118 db "com.pulse.lang.String.valueOf"
trace_m118_len equ 29
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:259)"
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0_len equ 47
trace_m120 db "com.pulse.lang.String.valueOf"
trace_m120_len equ 29
pulsec_com_pulse_lang_String_valueOf__char_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:267)"
pulsec_com_pulse_lang_String_valueOf__char_trace_s0_len equ 47
trace_m122 db "com.pulse.lang.String.valueOf"
trace_m122_len equ 29
pulsec_com_pulse_lang_String_valueOf__float_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:275)"
pulsec_com_pulse_lang_String_valueOf__float_trace_s0_len equ 47
trace_m124 db "com.pulse.lang.String.valueOf"
trace_m124_len equ 29
pulsec_com_pulse_lang_String_valueOf__double_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:283)"
pulsec_com_pulse_lang_String_valueOf__double_trace_s0_len equ 47
trace_m126 db "com.pulse.lang.String.valueOf"
trace_m126_len equ 29
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:292)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0_len equ 47
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1 db "com.pulse.lang.String.valueOf(String.pulse:293)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1_len equ 47
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2 db "com.pulse.lang.String.valueOf(String.pulse:295)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2_len equ 47
pulsec_com_pulse_lang_String_valueOf__Object_trace_s3 db "com.pulse.lang.String.valueOf(String.pulse:296)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s3_len equ 47
pulsec_com_pulse_lang_String_valueOf__Object_trace_s4 db "com.pulse.lang.String.valueOf(String.pulse:298)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s4_len equ 47
trace_m132 db "com.pulse.lang.String.runtimeCharAt"
trace_m132_len equ 35
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0 db "com.pulse.lang.String.runtimeCharAt(String.pulse:306)"
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0_len equ 53
trace_m134 db "com.pulse.lang.String.runtimeSubstring"
trace_m134_len equ 38
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0 db "com.pulse.lang.String.runtimeSubstring(String.pulse:314)"
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0_len equ 56
trace_m136 db "com.pulse.lang.String.runtimeFromChar"
trace_m136_len equ 37
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0 db "com.pulse.lang.String.runtimeFromChar(String.pulse:322)"
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0_len equ 55
msg0 db "Invalid cast"
msg0_len equ 12
msg1 db "String.compareTo requires String"
msg1_len equ 32
msg2 db "Invalid cast"
msg2_len equ 12
msg3 db 0
msg3_len equ 0
msg4 db "null"
msg4_len equ 4
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db 0
msg6_len equ 0
msg7 db 0
msg7_len equ 0

.code
pulsec_com_pulse_lang_String_length proc
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
pulsec_com_pulse_lang_String_length_b0:
    lea rcx, pulsec_com_pulse_lang_String_length_trace_s0
    mov edx, pulsec_com_pulse_lang_String_length_trace_s0_len
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_length endp

pulsec_com_pulse_lang_String_isEmpty proc
    sub rsp, 200
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_isEmpty endp

pulsec_com_pulse_lang_String_concat__String proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_String_concat__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_concat__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_concat__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_concat__String endp

pulsec_com_pulse_lang_String_charAt__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_String_charAt__int_b0:
    lea rcx, pulsec_com_pulse_lang_String_charAt__int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_charAt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_charAt__int endp

pulsec_com_pulse_lang_String_substring__int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_String_substring__int_b0:
    lea rcx, pulsec_com_pulse_lang_String_substring__int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_substring__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_com_pulse_lang_String_length
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_com_pulse_lang_String_substring__int_int
    jmp pulsec_com_pulse_lang_String_substring__int_epilogue
pulsec_com_pulse_lang_String_substring__int_epilogue:
pulsec_com_pulse_lang_String_substring__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_substring__int endp

pulsec_com_pulse_lang_String_substring__int_int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_lang_String_substring__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_String_substring__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_substring__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_substring__int_int endp

pulsec_com_pulse_lang_String_subSequence__int_int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_lang_String_subSequence__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_String_subSequence__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_String_subSequence__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_com_pulse_lang_String_substring__int_int
    jmp pulsec_com_pulse_lang_String_subSequence__int_int_epilogue
pulsec_com_pulse_lang_String_subSequence__int_int_epilogue:
pulsec_com_pulse_lang_String_subSequence__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_subSequence__int_int endp

pulsec_com_pulse_lang_String_equals__Object proc
    sub rsp, 248
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_com_pulse_lang_String_equals__Object_b0:
    lea rcx, pulsec_com_pulse_lang_String_equals__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    cmp eax, 0
    je String_equals_instof_0_1_false
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_instof_0_1_false
    cmp edx, 36
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
    mov rax, qword ptr [rsp+88]
    cmp eax, 0
    je String_equals_cast_2_5_null
    mov r8, rax
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_cast_2_5_fail
    cmp edx, 36
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
    mov rcx, qword ptr [rsp+80]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+96], eax
    mov qword ptr [rsp+168], rdx
    mov qword ptr [rsp+176], r8
    mov qword ptr [rsp+184], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+168]
    mov r8, qword ptr [rsp+176]
    mov r9, qword ptr [rsp+184]
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
    mov rcx, qword ptr [rsp+80]
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
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov qword ptr [rsp+168], rdx
    mov qword ptr [rsp+176], r8
    mov qword ptr [rsp+184], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+168]
    mov r8, qword ptr [rsp+176]
    mov r9, qword ptr [rsp+184]
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
    add rsp, 248
    ret
pulsec_com_pulse_lang_String_equals__Object endp

pulsec_com_pulse_lang_String_compareTo__Object proc
    sub rsp, 312
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
    mov qword ptr [rsp+120], rcx
    mov qword ptr [rsp+128], rdx
pulsec_com_pulse_lang_String_compareTo__Object_b0:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    cmp eax, 0
    je String_compareTo_instof_0_1_false
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_compareTo_instof_0_1_false
    cmp edx, 36
    je String_compareTo_instof_0_1_true
String_compareTo_instof_0_1_false:
    xor eax, eax
    jmp String_compareTo_instof_0_1_done
String_compareTo_instof_0_1_true:
    mov eax, 1
String_compareTo_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b1
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b2
pulsec_com_pulse_lang_String_compareTo__Object_b1:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s1
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b3
pulsec_com_pulse_lang_String_compareTo__Object_b2:
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b3
pulsec_com_pulse_lang_String_compareTo__Object_b3:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s2
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    cmp eax, 0
    je String_compareTo_cast_2_8_null
    mov r8, rax
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_compareTo_cast_2_8_fail
    cmp edx, 36
    je String_compareTo_cast_2_8_ok
String_compareTo_cast_2_8_fail:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_compareTo_cast_2_8_done
String_compareTo_cast_2_8_null:
    xor eax, eax
    jmp String_compareTo_cast_2_8_done
String_compareTo_cast_2_8_ok:
    mov rax, r8
String_compareTo_cast_2_8_done:
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s3
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+120]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s4
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+232], rdx
    mov qword ptr [rsp+240], r8
    mov qword ptr [rsp+248], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+232]
    mov r8, qword ptr [rsp+240]
    mov r9, qword ptr [rsp+248]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s5
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s6
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b4
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b5
pulsec_com_pulse_lang_String_compareTo__Object_b4:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s7
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s6
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b6
pulsec_com_pulse_lang_String_compareTo__Object_b5:
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b6
pulsec_com_pulse_lang_String_compareTo__Object_b6:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s8
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s9
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b7
pulsec_com_pulse_lang_String_compareTo__Object_b7:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b8
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b9
pulsec_com_pulse_lang_String_compareTo__Object_b8:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s10
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+120]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s11
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov qword ptr [rsp+232], rdx
    mov qword ptr [rsp+240], r8
    mov qword ptr [rsp+248], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+232]
    mov r8, qword ptr [rsp+240]
    mov r9, qword ptr [rsp+248]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s12
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b10
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b11
pulsec_com_pulse_lang_String_compareTo__Object_b9:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s17
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b16
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b17
pulsec_com_pulse_lang_String_compareTo__Object_b10:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s13
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_compareTo__Object_epilogue
pulsec_com_pulse_lang_String_compareTo__Object_b11:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s12
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b12
pulsec_com_pulse_lang_String_compareTo__Object_b12:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s14
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b13
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b14
pulsec_com_pulse_lang_String_compareTo__Object_b13:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s15
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_String_compareTo__Object_epilogue
pulsec_com_pulse_lang_String_compareTo__Object_b14:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s14
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b15
pulsec_com_pulse_lang_String_compareTo__Object_b15:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s16
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s9
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b7
pulsec_com_pulse_lang_String_compareTo__Object_b16:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s18
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_String_compareTo__Object_epilogue
pulsec_com_pulse_lang_String_compareTo__Object_b17:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s17
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s17_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b18
pulsec_com_pulse_lang_String_compareTo__Object_b18:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s19
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_String_compareTo__Object_b19
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b20
pulsec_com_pulse_lang_String_compareTo__Object_b19:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s20
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s20_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_String_compareTo__Object_epilogue
pulsec_com_pulse_lang_String_compareTo__Object_b20:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s19
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s19_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_compareTo__Object_b21
pulsec_com_pulse_lang_String_compareTo__Object_b21:
    lea rcx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s21
    mov edx, pulsec_com_pulse_lang_String_compareTo__Object_trace_s21_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_String_compareTo__Object_epilogue
pulsec_com_pulse_lang_String_compareTo__Object_epilogue:
pulsec_com_pulse_lang_String_compareTo__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 312
    ret
pulsec_com_pulse_lang_String_compareTo__Object endp

pulsec_com_pulse_lang_String_startsWith__String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_String_startsWith__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_startsWith__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_startsWith__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_startsWith__String endp

pulsec_com_pulse_lang_String_endsWith__String proc
    sub rsp, 232
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
pulsec_com_pulse_lang_String_endsWith__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s2
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
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
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    mov r8d, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_com_pulse_lang_String_endsWith__String_trace_s6
    mov edx, pulsec_com_pulse_lang_String_endsWith__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
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
    add rsp, 232
    ret
pulsec_com_pulse_lang_String_endsWith__String endp

pulsec_com_pulse_lang_String_contains__String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_String_contains__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_contains__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_contains__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_contains__String endp

pulsec_com_pulse_lang_String_indexOf__String proc
    sub rsp, 312
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
pulsec_com_pulse_lang_String_indexOf__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_indexOf__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_indexOf__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+112]
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
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
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
    add rsp, 312
    ret
pulsec_com_pulse_lang_String_indexOf__String endp

pulsec_com_pulse_lang_String_lastIndexOf__String proc
    sub rsp, 312
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m82
    mov edx, trace_m82_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+104], rcx
    mov qword ptr [rsp+112], rdx
pulsec_com_pulse_lang_String_lastIndexOf__String_b0:
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+232], rdx
    mov qword ptr [rsp+240], r8
    mov qword ptr [rsp+248], r9
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+232]
    mov r8, qword ptr [rsp+240]
    mov r9, qword ptr [rsp+248]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1
    mov edx, pulsec_com_pulse_lang_String_lastIndexOf__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+104]
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
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+104]
    call pulsec_com_pulse_lang_String_charAt__int
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov qword ptr [rsp+232], rdx
    mov qword ptr [rsp+240], r8
    mov qword ptr [rsp+248], r9
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+232]
    mov r8, qword ptr [rsp+240]
    mov r9, qword ptr [rsp+248]
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
    add rsp, 312
    ret
pulsec_com_pulse_lang_String_lastIndexOf__String endp

pulsec_com_pulse_lang_String_trim proc
    sub rsp, 312
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m102
    mov edx, trace_m102_len
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
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
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
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
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
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov dword ptr [rsp+200], eax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+280], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+240]
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
    add rsp, 312
    ret
pulsec_com_pulse_lang_String_trim endp

pulsec_com_pulse_lang_String_valueOf__int proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m116
    mov edx, trace_m116_len
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
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_valueOf__int endp

pulsec_com_pulse_lang_String_valueOf__boolean proc
    sub rsp, 184
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_valueOf__boolean endp

pulsec_com_pulse_lang_String_valueOf__char proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m120
    mov edx, trace_m120_len
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
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_valueOf__char endp

pulsec_com_pulse_lang_String_valueOf__float proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m122
    mov edx, trace_m122_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_String_valueOf__float_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__float_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_Float_toString__float
    jmp pulsec_com_pulse_lang_String_valueOf__float_epilogue
pulsec_com_pulse_lang_String_valueOf__float_epilogue:
pulsec_com_pulse_lang_String_valueOf__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_valueOf__float endp

pulsec_com_pulse_lang_String_valueOf__double proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m124
    mov edx, trace_m124_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_String_valueOf__double_b0:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__double_trace_s0
    mov edx, pulsec_com_pulse_lang_String_valueOf__double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_Double_toString__double
    jmp pulsec_com_pulse_lang_String_valueOf__double_epilogue
pulsec_com_pulse_lang_String_valueOf__double_epilogue:
pulsec_com_pulse_lang_String_valueOf__double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_valueOf__double endp

pulsec_com_pulse_lang_String_valueOf__Object proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m126
    mov edx, trace_m126_len
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
    lea rcx, msg4
    mov edx, msg4_len
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
    cmp eax, 0
    je String_valueOf_instof_2_5_false
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_valueOf_instof_2_5_false
    cmp edx, 36
    je String_valueOf_instof_2_5_true
String_valueOf_instof_2_5_false:
    xor eax, eax
    jmp String_valueOf_instof_2_5_done
String_valueOf_instof_2_5_true:
    mov eax, 1
String_valueOf_instof_2_5_done:
    test eax, eax
    jne pulsec_com_pulse_lang_String_valueOf__Object_b4
    jmp pulsec_com_pulse_lang_String_valueOf__Object_b5
pulsec_com_pulse_lang_String_valueOf__Object_b4:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s3
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    cmp eax, 0
    je String_valueOf_cast_3_7_null
    mov r8, rax
    mov ecx, eax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_valueOf_cast_3_7_fail
    cmp edx, 36
    je String_valueOf_cast_3_7_ok
String_valueOf_cast_3_7_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_valueOf_cast_3_7_done
String_valueOf_cast_3_7_null:
    xor eax, eax
    jmp String_valueOf_cast_3_7_done
String_valueOf_cast_3_7_ok:
    mov rax, r8
String_valueOf_cast_3_7_done:
    jmp pulsec_com_pulse_lang_String_valueOf__Object_epilogue
pulsec_com_pulse_lang_String_valueOf__Object_b5:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s2
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_String_valueOf__Object_b6
pulsec_com_pulse_lang_String_valueOf__Object_b6:
    lea rcx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s4
    mov edx, pulsec_com_pulse_lang_String_valueOf__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    cmp ecx, 0
    je String_valueOf_vd4_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz String_valueOf_vd4_10_type
    cmp eax, 6
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 16
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 17
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 20
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 21
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 22
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 28
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 29
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 30
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 34
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 40
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 45
    je String_valueOf_vd4_10_assign_ok
    jmp String_valueOf_vd4_10_type
String_valueOf_vd4_10_assign_ok:
    cmp eax, 6
    je String_valueOf_vd4_10_ovr0
    cmp eax, 17
    je String_valueOf_vd4_10_ovr1
    cmp eax, 20
    je String_valueOf_vd4_10_ovr2
    cmp eax, 21
    je String_valueOf_vd4_10_ovr3
    cmp eax, 22
    je String_valueOf_vd4_10_ovr4
    cmp eax, 28
    je String_valueOf_vd4_10_ovr5
    cmp eax, 29
    je String_valueOf_vd4_10_ovr6
    cmp eax, 34
    je String_valueOf_vd4_10_ovr7
    cmp eax, 40
    je String_valueOf_vd4_10_ovr8
    cmp eax, 45
    je String_valueOf_vd4_10_ovr9
    jmp String_valueOf_vd4_10_default
String_valueOf_vd4_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr7:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr8:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr9:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_com_pulse_lang_Object_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
String_valueOf_vd4_10_done:
    jmp pulsec_com_pulse_lang_String_valueOf__Object_epilogue
pulsec_com_pulse_lang_String_valueOf__Object_epilogue:
pulsec_com_pulse_lang_String_valueOf__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_valueOf__Object endp

pulsec_com_pulse_lang_String_runtimeCharAt__String_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m132
    mov edx, trace_m132_len
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_runtimeCharAt__String_int endp

pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m134
    mov edx, trace_m134_len
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
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue:
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int endp

pulsec_com_pulse_lang_String_runtimeFromChar__char proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m136
    mov edx, trace_m136_len
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
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue
pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue:
pulsec_com_pulse_lang_String_runtimeFromChar__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_String_runtimeFromChar__char endp

end
