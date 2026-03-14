option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc

extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc

.data
written dq 0

rt_handle_next dd 0
rt_slot_capacity dd 63
rt_str_count dd 0
rt_str_lens_ptr dq 0
rt_str_data_ptr dq 0
rt_tmpbuf db 32 dup(0)
rt_tmp_concat db 256 dup(0)
rt_tmp_concat_len dd 0
rt_tmp_arr_slot dd 0
rt_tmp_arr_len dd 0
rt_tmp_arr_bytes dq 0
rt_tmp_size dd 0
rt_tmp_arg_key dd 0
rt_tmp_arg_val dd 0
rt_tmp_ptr_a dq 0
rt_tmp_ptr_b dq 0
rt_tmp_ptr_c dq 0
rt_tmp_ptr_d dq 0
rt_true db 't','r','u','e'
rt_false db 'f','a','l','s','e'
rt_newline db 13,10
rt_empty db 0

rt_debug_alloc_mode dd 0
rt_debug_arc_retain_err db 'D','e','b','u','g',' ','a','l','l','o','c','a','t','o','r',':',' ','i','n','v','a','l','i','d',' ','A','R','C',' ','r','e','t','a','i','n',' ','(','s','t','a','l','e','/','d','e','a','d',')'
rt_debug_arc_retain_err_len equ $ - rt_debug_arc_retain_err
rt_debug_arc_release_err db 'D','e','b','u','g',' ','a','l','l','o','c','a','t','o','r',':',' ','i','n','v','a','l','i','d',' ','A','R','C',' ','r','e','l','e','a','s','e',' ','(','d','o','u','b','l','e','/','s','t','a','l','e',')'
rt_debug_arc_release_err_len equ $ - rt_debug_arc_release_err

rt_parse_int_err db 'I','n','v','a','l','i','d',' ','i','n','t','e','g','e','r',' ','l','i','t','e','r','a','l'
rt_parse_bool_err db 'I','n','v','a','l','i','d',' ','b','o','o','l','e','a','n',' ','l','i','t','e','r','a','l'

rt_arc_gen_overflow_err db 'A','R','C',' ','g','e','n','e','r','a','t','i','o','n',' ','o','v','e','r','f','l','o','w'
rt_arc_gen_overflow_err_len equ $ - rt_arc_gen_overflow_err
rt_weak_generation_overflow_err db 'W','e','a','k',' ','g','e','n','e','r','a','t','i','o','n',' ','o','v','e','r','f','l','o','w'
rt_weak_generation_overflow_err_len equ $ - rt_weak_generation_overflow_err
rt_weak_exhausted_err db 'W','e','a','k',' ','h','a','n','d','l','e',' ','t','a','b','l','e',' ','e','x','h','a','u','s','t','e','d'
rt_weak_exhausted_err_len equ $ - rt_weak_exhausted_err
rt_arc_refcount_saturation_err db 'A','R','C',' ','r','e','f','c','o','u','n','t',' ','s','a','t','u','r','a','t','i','o','n'
rt_arc_refcount_saturation_err_len equ $ - rt_arc_refcount_saturation_err
rt_arc_cycle_lag_err db 'A','R','C',' ','c','y','c','l','e',' ','d','e','t','e','c','t','o','r',' ','l','a','g'
rt_arc_cycle_lag_err_len equ $ - rt_arc_cycle_lag_err

rt_array_alloc_err db 'A','r','r','a','y',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'
rt_array_alloc_err_len equ $ - rt_array_alloc_err

rt_string_alloc_err db 'S','t','r','i','n','g',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'
rt_string_alloc_err_len equ $ - rt_string_alloc_err
rt_list_alloc_err db 'L','i','s','t',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'
rt_list_alloc_err_len equ $ - rt_list_alloc_err
rt_map_alloc_err db 'M','a','p',' ','a','l','l','o','c','a','t','i','o','n',' ','f','a','i','l','e','d'
rt_map_alloc_err_len equ $ - rt_map_alloc_err
rt_list_growth_err db 'L','i','s','t',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'
rt_list_growth_err_len equ $ - rt_list_growth_err
rt_map_growth_err db 'M','a','p',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'
rt_map_growth_err_len equ $ - rt_map_growth_err

rt_stale_handle_err db 'S','t','a','l','e',' ','r','u','n','t','i','m','e',' ','h','a','n','d','l','e'
rt_stale_handle_err_len equ $ - rt_stale_handle_err

rt_arr_count dd 0
rt_arr_len dd 64 dup(0)
rt_arr_alive dd 64 dup(0)
rt_arr_i_ptr dq 64 dup(0)
rt_arr_s_ptr dq 64 dup(0)
rt_arr_heap_owned dd 0
rt_arr_len_ptr dq 0
rt_arr_alive_ptr dq 0
rt_arr_i_ptr_ptr dq 0
rt_arr_s_ptr_ptr dq 0
rt_list_count dd 0
rt_list_size dd 64 dup(0)
rt_list_cap dd 64 dup(0)
rt_list_alive dd 64 dup(0)
rt_list_kind dd 64 dup(0)
rt_list_i_ptr dq 64 dup(0)
rt_list_s_ptr dq 64 dup(0)
rt_list_heap_owned dd 0
rt_list_size_ptr dq 0
rt_list_cap_ptr dq 0
rt_list_alive_ptr dq 0
rt_list_kind_ptr dq 0
rt_list_i_ptr_ptr dq 0
rt_list_s_ptr_ptr dq 0
rt_map_count dd 0
rt_map_size dd 64 dup(0)
rt_map_cap dd 64 dup(0)
rt_map_alive dd 64 dup(0)
rt_map_keys_ptr dq 64 dup(0)
rt_map_tags_ptr dq 64 dup(0)
rt_map_i_ptr dq 64 dup(0)
rt_map_s_ptr dq 64 dup(0)

rt_map_heap_owned dd 0
rt_map_size_ptr dq 0
rt_map_cap_ptr dq 0
rt_map_alive_ptr dq 0
rt_map_keys_ptr_ptr dq 0
rt_map_tags_ptr_ptr dq 0
rt_map_i_ptr_ptr dq 0
rt_map_s_ptr_ptr dq 0

rt_arc_refcounts_tbl dd 64 dup(0)
rt_arc_kinds_tbl dd 64 dup(0)
rt_arc_flags_tbl dd 64 dup(0)
rt_arc_meta_tbl dd 64 dup(0)
rt_arc_generation_tbl dd 64 dup(0)
rt_arc_free_head dd 0
rt_arc_free_next_tbl dd 64 dup(0)
rt_arc_heap_owned dd 0
rt_weak_next dd 0
rt_weak_free_head dd 0
rt_weak_heap_owned dd 0
rt_weak_free_next_ptr dq 0
rt_weak_target_slot_ptr dq 0
rt_weak_target_gen_ptr dq 0
rt_weak_generation_ptr dq 0
rt_weak_free_next dd 64 dup(0)
rt_weak_target_slot dd 64 dup(0)
rt_weak_target_gen dd 64 dup(0)
rt_weak_generation dd 64 dup(0)
rt_arc_cycle_epoch dd 0
rt_arc_cycle_young_cursor dd 1
rt_arc_cycle_last_reclaimed dd 0
rt_arc_cycle_zero_reclaim_streak dd 0
rt_trace_depth dd 0
rt_trace_ptrs dq 1024 dup(0)
rt_trace_lens dd 1024 dup(0)
rt_trace_hdr db 'S','t','a','c','k',' ','t','r','a','c','e',':',13,10
rt_trace_hdr_len equ $ - rt_trace_hdr
rt_trace_prefix db ' ',' ','a','t',' '
rt_trace_prefix_len equ $ - rt_trace_prefix

rt_arc_refcounts textequ <r12>
rt_arc_kinds textequ <r13>
rt_arc_flags textequ <r14>
rt_arc_meta textequ <r15>
rt_arc_generation textequ <rdi>
rt_arc_free_next textequ <rsi>

pulsec_objc_app_stress_Main dd 0
pulsec_objc_app_stress_SoakRunner dd 0
pulsec_objc_app_stress_Token dd 0
pulsec_fld_app_stress_Token_v dd 64 dup(0)
pulsec_objc_com_pulse_collections_Array dd 0
pulsec_fld_com_pulse_collections_Array_handle dd 64 dup(0)
pulsec_objc_com_pulse_collections_ArrayList dd 0
pulsec_fld_com_pulse_collections_ArrayList_handle dd 64 dup(0)
pulsec_objc_com_pulse_collections_Collection dd 0
pulsec_objc_com_pulse_collections_Deque dd 0
pulsec_objc_com_pulse_collections_HashMap dd 0
pulsec_fld_com_pulse_collections_HashMap_handle dd 64 dup(0)
pulsec_objc_com_pulse_collections_HashSet dd 0
pulsec_fld_com_pulse_collections_HashSet_handle dd 64 dup(0)
pulsec_objc_com_pulse_collections_LinkedList dd 0
pulsec_fld_com_pulse_collections_LinkedList_handle dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueHandle dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueHead dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueTail dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeHandle dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeHead dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeTail dd 64 dup(0)
pulsec_objc_com_pulse_collections_List dd 0
pulsec_objc_com_pulse_collections_Map dd 0
pulsec_fld_com_pulse_collections_Map_handle dd 64 dup(0)
pulsec_objc_com_pulse_collections_Queue dd 0
pulsec_objc_com_pulse_collections_Set dd 0
pulsec_objc_com_pulse_lang_Boolean dd 0
pulsec_objc_com_pulse_lang_Byte dd 0
pulsec_objc_com_pulse_lang_Char dd 0
pulsec_objc_com_pulse_lang_Class dd 0
pulsec_fld_com_pulse_lang_Class_name dd 64 dup(0)
pulsec_objc_com_pulse_lang_Comparable dd 0
pulsec_objc_com_pulse_lang_ConsoleWriter dd 0
pulsec_objc_com_pulse_lang_Double dd 0
pulsec_objc_com_pulse_lang_Exception dd 0
pulsec_objc_com_pulse_lang_Float dd 0
pulsec_objc_com_pulse_lang_IO dd 0
pulsec_objc_com_pulse_lang_IllegalArgumentException dd 0
pulsec_objc_com_pulse_lang_IllegalStateException dd 0
pulsec_objc_com_pulse_lang_IndexOutOfBoundsException dd 0
pulsec_objc_com_pulse_lang_Integer dd 0
pulsec_objc_com_pulse_lang_Iterable dd 0
pulsec_objc_com_pulse_lang_Iterator dd 0
pulsec_objc_com_pulse_lang_Long dd 0
pulsec_objc_com_pulse_lang_NullPointerException dd 0
pulsec_objc_com_pulse_lang_NumberFormatException dd 0
pulsec_objc_com_pulse_lang_Object dd 0
pulsec_objc_com_pulse_lang_PrintStream dd 0
pulsec_objc_com_pulse_lang_RuntimeException dd 0
pulsec_objc_com_pulse_lang_Short dd 0
pulsec_objc_com_pulse_lang_String dd 0
pulsec_objc_com_pulse_lang_StringBuilder dd 0
pulsec_fld_com_pulse_lang_StringBuilder_value dd 64 dup(0)
pulsec_objc_com_pulse_lang_System dd 0
pulsec_fld_com_pulse_lang_System_out dd 0
pulsec_objc_com_pulse_lang_Throwable dd 0
pulsec_fld_com_pulse_lang_Throwable_message dd 64 dup(0)
pulsec_objc_com_pulse_lang_UByte dd 0
pulsec_objc_com_pulse_lang_UInteger dd 0
pulsec_objc_com_pulse_lang_ULong dd 0
pulsec_objc_com_pulse_lang_UShort dd 0
pulsec_objc_com_pulse_lang_UnsupportedOperationException dd 0
pulsec_objc_com_pulse_lang_Void dd 0
pulsec_objc_com_pulse_rt_Intrinsics dd 0
trace_m0 db "app.stress.Main.main"
trace_m0_len equ $ - trace_m0
trace_m1 db "app.stress.SoakRunner.run"
trace_m1_len equ $ - trace_m1
trace_m2 db "app.stress.Token.Token"
trace_m2_len equ $ - trace_m2
trace_m3 db "app.stress.Token.value"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.collections.Array.Array"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.collections.Array.length"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.collections.Array.getInt"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.collections.Array.setInt"
trace_m7_len equ $ - trace_m7
trace_m8 db "com.pulse.collections.Array.getString"
trace_m8_len equ $ - trace_m8
trace_m9 db "com.pulse.collections.Array.setString"
trace_m9_len equ $ - trace_m9
trace_m10 db "com.pulse.collections.ArrayList.ArrayList"
trace_m10_len equ $ - trace_m10
trace_m11 db "com.pulse.collections.ArrayList.size"
trace_m11_len equ $ - trace_m11
trace_m12 db "com.pulse.collections.ArrayList.clear"
trace_m12_len equ $ - trace_m12
trace_m13 db "com.pulse.collections.ArrayList.add"
trace_m13_len equ $ - trace_m13
trace_m14 db "com.pulse.collections.ArrayList.add"
trace_m14_len equ $ - trace_m14
trace_m15 db "com.pulse.collections.ArrayList.getInt"
trace_m15_len equ $ - trace_m15
trace_m16 db "com.pulse.collections.ArrayList.getString"
trace_m16_len equ $ - trace_m16
trace_m17 db "com.pulse.collections.Collection.size"
trace_m17_len equ $ - trace_m17
trace_m18 db "com.pulse.collections.Collection.clear"
trace_m18_len equ $ - trace_m18
trace_m19 db "com.pulse.collections.Deque.addFirst"
trace_m19_len equ $ - trace_m19
trace_m20 db "com.pulse.collections.Deque.addLast"
trace_m20_len equ $ - trace_m20
trace_m21 db "com.pulse.collections.Deque.removeFirst"
trace_m21_len equ $ - trace_m21
trace_m22 db "com.pulse.collections.Deque.removeLast"
trace_m22_len equ $ - trace_m22
trace_m23 db "com.pulse.collections.Deque.isEmpty"
trace_m23_len equ $ - trace_m23
trace_m24 db "com.pulse.collections.HashMap.HashMap"
trace_m24_len equ $ - trace_m24
trace_m25 db "com.pulse.collections.HashMap.size"
trace_m25_len equ $ - trace_m25
trace_m26 db "com.pulse.collections.HashMap.clear"
trace_m26_len equ $ - trace_m26
trace_m27 db "com.pulse.collections.HashMap.containsKey"
trace_m27_len equ $ - trace_m27
trace_m28 db "com.pulse.collections.HashMap.put"
trace_m28_len equ $ - trace_m28
trace_m29 db "com.pulse.collections.HashMap.putInt"
trace_m29_len equ $ - trace_m29
trace_m30 db "com.pulse.collections.HashMap.get"
trace_m30_len equ $ - trace_m30
trace_m31 db "com.pulse.collections.HashMap.getInt"
trace_m31_len equ $ - trace_m31
trace_m32 db "com.pulse.collections.HashSet.HashSet"
trace_m32_len equ $ - trace_m32
trace_m33 db "com.pulse.collections.HashSet.size"
trace_m33_len equ $ - trace_m33
trace_m34 db "com.pulse.collections.HashSet.clear"
trace_m34_len equ $ - trace_m34
trace_m35 db "com.pulse.collections.HashSet.add"
trace_m35_len equ $ - trace_m35
trace_m36 db "com.pulse.collections.HashSet.contains"
trace_m36_len equ $ - trace_m36
trace_m37 db "com.pulse.collections.LinkedList.LinkedList"
trace_m37_len equ $ - trace_m37
trace_m38 db "com.pulse.collections.LinkedList.size"
trace_m38_len equ $ - trace_m38
trace_m39 db "com.pulse.collections.LinkedList.clear"
trace_m39_len equ $ - trace_m39
trace_m40 db "com.pulse.collections.LinkedList.add"
trace_m40_len equ $ - trace_m40
trace_m41 db "com.pulse.collections.LinkedList.add"
trace_m41_len equ $ - trace_m41
trace_m42 db "com.pulse.collections.LinkedList.getInt"
trace_m42_len equ $ - trace_m42
trace_m43 db "com.pulse.collections.LinkedList.getString"
trace_m43_len equ $ - trace_m43
trace_m44 db "com.pulse.collections.LinkedList.offer"
trace_m44_len equ $ - trace_m44
trace_m45 db "com.pulse.collections.LinkedList.poll"
trace_m45_len equ $ - trace_m45
trace_m46 db "com.pulse.collections.LinkedList.isEmpty"
trace_m46_len equ $ - trace_m46
trace_m47 db "com.pulse.collections.LinkedList.addFirst"
trace_m47_len equ $ - trace_m47
trace_m48 db "com.pulse.collections.LinkedList.addLast"
trace_m48_len equ $ - trace_m48
trace_m49 db "com.pulse.collections.LinkedList.removeFirst"
trace_m49_len equ $ - trace_m49
trace_m50 db "com.pulse.collections.LinkedList.removeLast"
trace_m50_len equ $ - trace_m50
trace_m51 db "com.pulse.collections.List.size"
trace_m51_len equ $ - trace_m51
trace_m52 db "com.pulse.collections.List.clear"
trace_m52_len equ $ - trace_m52
trace_m53 db "com.pulse.collections.List.add"
trace_m53_len equ $ - trace_m53
trace_m54 db "com.pulse.collections.List.add"
trace_m54_len equ $ - trace_m54
trace_m55 db "com.pulse.collections.List.getInt"
trace_m55_len equ $ - trace_m55
trace_m56 db "com.pulse.collections.List.getString"
trace_m56_len equ $ - trace_m56
trace_m57 db "com.pulse.collections.Map.Map"
trace_m57_len equ $ - trace_m57
trace_m58 db "com.pulse.collections.Map.size"
trace_m58_len equ $ - trace_m58
trace_m59 db "com.pulse.collections.Map.clear"
trace_m59_len equ $ - trace_m59
trace_m60 db "com.pulse.collections.Map.containsKey"
trace_m60_len equ $ - trace_m60
trace_m61 db "com.pulse.collections.Map.put"
trace_m61_len equ $ - trace_m61
trace_m62 db "com.pulse.collections.Map.putInt"
trace_m62_len equ $ - trace_m62
trace_m63 db "com.pulse.collections.Map.get"
trace_m63_len equ $ - trace_m63
trace_m64 db "com.pulse.collections.Map.getInt"
trace_m64_len equ $ - trace_m64
trace_m65 db "com.pulse.collections.Queue.offer"
trace_m65_len equ $ - trace_m65
trace_m66 db "com.pulse.collections.Queue.poll"
trace_m66_len equ $ - trace_m66
trace_m67 db "com.pulse.collections.Queue.isEmpty"
trace_m67_len equ $ - trace_m67
trace_m68 db "com.pulse.collections.Set.size"
trace_m68_len equ $ - trace_m68
trace_m69 db "com.pulse.collections.Set.clear"
trace_m69_len equ $ - trace_m69
trace_m70 db "com.pulse.collections.Set.add"
trace_m70_len equ $ - trace_m70
trace_m71 db "com.pulse.collections.Set.contains"
trace_m71_len equ $ - trace_m71
trace_m72 db "com.pulse.lang.Boolean.valueOf"
trace_m72_len equ $ - trace_m72
trace_m73 db "com.pulse.lang.Boolean.parse"
trace_m73_len equ $ - trace_m73
trace_m74 db "com.pulse.lang.Boolean.booleanValue"
trace_m74_len equ $ - trace_m74
trace_m75 db "com.pulse.lang.Boolean.equals"
trace_m75_len equ $ - trace_m75
trace_m76 db "com.pulse.lang.Boolean.compare"
trace_m76_len equ $ - trace_m76
trace_m77 db "com.pulse.lang.Byte.valueOf"
trace_m77_len equ $ - trace_m77
trace_m78 db "com.pulse.lang.Byte.parse"
trace_m78_len equ $ - trace_m78
trace_m79 db "com.pulse.lang.Byte.byteValue"
trace_m79_len equ $ - trace_m79
trace_m80 db "com.pulse.lang.Byte.equals"
trace_m80_len equ $ - trace_m80
trace_m81 db "com.pulse.lang.Byte.compare"
trace_m81_len equ $ - trace_m81
trace_m82 db "com.pulse.lang.Char.valueOf"
trace_m82_len equ $ - trace_m82
trace_m83 db "com.pulse.lang.Char.parse"
trace_m83_len equ $ - trace_m83
trace_m84 db "com.pulse.lang.Char.charValue"
trace_m84_len equ $ - trace_m84
trace_m85 db "com.pulse.lang.Char.equals"
trace_m85_len equ $ - trace_m85
trace_m86 db "com.pulse.lang.Char.compare"
trace_m86_len equ $ - trace_m86
trace_m87 db "com.pulse.lang.Class.Class"
trace_m87_len equ $ - trace_m87
trace_m88 db "com.pulse.lang.Class.getName"
trace_m88_len equ $ - trace_m88
trace_m89 db "com.pulse.lang.Class.toString"
trace_m89_len equ $ - trace_m89
trace_m90 db "com.pulse.lang.Comparable.compareTo"
trace_m90_len equ $ - trace_m90
trace_m91 db "com.pulse.lang.ConsoleWriter.println"
trace_m91_len equ $ - trace_m91
trace_m92 db "com.pulse.lang.ConsoleWriter.println"
trace_m92_len equ $ - trace_m92
trace_m93 db "com.pulse.lang.ConsoleWriter.println"
trace_m93_len equ $ - trace_m93
trace_m94 db "com.pulse.lang.ConsoleWriter.print"
trace_m94_len equ $ - trace_m94
trace_m95 db "com.pulse.lang.ConsoleWriter.print"
trace_m95_len equ $ - trace_m95
trace_m96 db "com.pulse.lang.ConsoleWriter.print"
trace_m96_len equ $ - trace_m96
trace_m97 db "com.pulse.lang.Double.valueOf"
trace_m97_len equ $ - trace_m97
trace_m98 db "com.pulse.lang.Double.parse"
trace_m98_len equ $ - trace_m98
trace_m99 db "com.pulse.lang.Double.doubleValue"
trace_m99_len equ $ - trace_m99
trace_m100 db "com.pulse.lang.Double.equals"
trace_m100_len equ $ - trace_m100
trace_m101 db "com.pulse.lang.Double.compare"
trace_m101_len equ $ - trace_m101
trace_m102 db "com.pulse.lang.Exception.Exception"
trace_m102_len equ $ - trace_m102
trace_m103 db "com.pulse.lang.Exception.Exception"
trace_m103_len equ $ - trace_m103
trace_m104 db "com.pulse.lang.Exception.toString"
trace_m104_len equ $ - trace_m104
trace_m105 db "com.pulse.lang.Float.valueOf"
trace_m105_len equ $ - trace_m105
trace_m106 db "com.pulse.lang.Float.parse"
trace_m106_len equ $ - trace_m106
trace_m107 db "com.pulse.lang.Float.floatValue"
trace_m107_len equ $ - trace_m107
trace_m108 db "com.pulse.lang.Float.equals"
trace_m108_len equ $ - trace_m108
trace_m109 db "com.pulse.lang.Float.compare"
trace_m109_len equ $ - trace_m109
trace_m110 db "com.pulse.lang.IO.println"
trace_m110_len equ $ - trace_m110
trace_m111 db "com.pulse.lang.IO.println"
trace_m111_len equ $ - trace_m111
trace_m112 db "com.pulse.lang.IO.println"
trace_m112_len equ $ - trace_m112
trace_m113 db "com.pulse.lang.IO.print"
trace_m113_len equ $ - trace_m113
trace_m114 db "com.pulse.lang.IO.print"
trace_m114_len equ $ - trace_m114
trace_m115 db "com.pulse.lang.IO.print"
trace_m115_len equ $ - trace_m115
trace_m116 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m116_len equ $ - trace_m116
trace_m117 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m117_len equ $ - trace_m117
trace_m118 db "com.pulse.lang.IllegalArgumentException.toString"
trace_m118_len equ $ - trace_m118
trace_m119 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m119_len equ $ - trace_m119
trace_m120 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m120_len equ $ - trace_m120
trace_m121 db "com.pulse.lang.IllegalStateException.toString"
trace_m121_len equ $ - trace_m121
trace_m122 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException"
trace_m122_len equ $ - trace_m122
trace_m123 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException"
trace_m123_len equ $ - trace_m123
trace_m124 db "com.pulse.lang.IndexOutOfBoundsException.toString"
trace_m124_len equ $ - trace_m124
trace_m125 db "com.pulse.lang.Integer.valueOf"
trace_m125_len equ $ - trace_m125
trace_m126 db "com.pulse.lang.Integer.parse"
trace_m126_len equ $ - trace_m126
trace_m127 db "com.pulse.lang.Integer.intValue"
trace_m127_len equ $ - trace_m127
trace_m128 db "com.pulse.lang.Integer.equals"
trace_m128_len equ $ - trace_m128
trace_m129 db "com.pulse.lang.Integer.compare"
trace_m129_len equ $ - trace_m129
trace_m130 db "com.pulse.lang.Iterable.iterator"
trace_m130_len equ $ - trace_m130
trace_m131 db "com.pulse.lang.Iterator.hasNext"
trace_m131_len equ $ - trace_m131
trace_m132 db "com.pulse.lang.Iterator.next"
trace_m132_len equ $ - trace_m132
trace_m133 db "com.pulse.lang.Long.valueOf"
trace_m133_len equ $ - trace_m133
trace_m134 db "com.pulse.lang.Long.parse"
trace_m134_len equ $ - trace_m134
trace_m135 db "com.pulse.lang.Long.longValue"
trace_m135_len equ $ - trace_m135
trace_m136 db "com.pulse.lang.Long.equals"
trace_m136_len equ $ - trace_m136
trace_m137 db "com.pulse.lang.Long.compare"
trace_m137_len equ $ - trace_m137
trace_m138 db "com.pulse.lang.NullPointerException.NullPointerException"
trace_m138_len equ $ - trace_m138
trace_m139 db "com.pulse.lang.NullPointerException.NullPointerException"
trace_m139_len equ $ - trace_m139
trace_m140 db "com.pulse.lang.NullPointerException.toString"
trace_m140_len equ $ - trace_m140
trace_m141 db "com.pulse.lang.NumberFormatException.NumberFormatException"
trace_m141_len equ $ - trace_m141
trace_m142 db "com.pulse.lang.NumberFormatException.NumberFormatException"
trace_m142_len equ $ - trace_m142
trace_m143 db "com.pulse.lang.NumberFormatException.toString"
trace_m143_len equ $ - trace_m143
trace_m144 db "com.pulse.lang.Object.toString"
trace_m144_len equ $ - trace_m144
trace_m145 db "com.pulse.lang.Object.equals"
trace_m145_len equ $ - trace_m145
trace_m146 db "com.pulse.lang.Object.getClass"
trace_m146_len equ $ - trace_m146
trace_m147 db "com.pulse.lang.PrintStream.println"
trace_m147_len equ $ - trace_m147
trace_m148 db "com.pulse.lang.PrintStream.println"
trace_m148_len equ $ - trace_m148
trace_m149 db "com.pulse.lang.PrintStream.println"
trace_m149_len equ $ - trace_m149
trace_m150 db "com.pulse.lang.PrintStream.print"
trace_m150_len equ $ - trace_m150
trace_m151 db "com.pulse.lang.PrintStream.print"
trace_m151_len equ $ - trace_m151
trace_m152 db "com.pulse.lang.PrintStream.print"
trace_m152_len equ $ - trace_m152
trace_m153 db "com.pulse.lang.RuntimeException.RuntimeException"
trace_m153_len equ $ - trace_m153
trace_m154 db "com.pulse.lang.RuntimeException.RuntimeException"
trace_m154_len equ $ - trace_m154
trace_m155 db "com.pulse.lang.RuntimeException.toString"
trace_m155_len equ $ - trace_m155
trace_m156 db "com.pulse.lang.Short.valueOf"
trace_m156_len equ $ - trace_m156
trace_m157 db "com.pulse.lang.Short.parse"
trace_m157_len equ $ - trace_m157
trace_m158 db "com.pulse.lang.Short.shortValue"
trace_m158_len equ $ - trace_m158
trace_m159 db "com.pulse.lang.Short.equals"
trace_m159_len equ $ - trace_m159
trace_m160 db "com.pulse.lang.Short.compare"
trace_m160_len equ $ - trace_m160
trace_m161 db "com.pulse.lang.String.length"
trace_m161_len equ $ - trace_m161
trace_m162 db "com.pulse.lang.String.isEmpty"
trace_m162_len equ $ - trace_m162
trace_m163 db "com.pulse.lang.String.concat"
trace_m163_len equ $ - trace_m163
trace_m164 db "com.pulse.lang.String.valueOf"
trace_m164_len equ $ - trace_m164
trace_m165 db "com.pulse.lang.String.valueOf"
trace_m165_len equ $ - trace_m165
trace_m166 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m166_len equ $ - trace_m166
trace_m167 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m167_len equ $ - trace_m167
trace_m168 db "com.pulse.lang.StringBuilder.append"
trace_m168_len equ $ - trace_m168
trace_m169 db "com.pulse.lang.StringBuilder.append"
trace_m169_len equ $ - trace_m169
trace_m170 db "com.pulse.lang.StringBuilder.append"
trace_m170_len equ $ - trace_m170
trace_m171 db "com.pulse.lang.StringBuilder.length"
trace_m171_len equ $ - trace_m171
trace_m172 db "com.pulse.lang.StringBuilder.clear"
trace_m172_len equ $ - trace_m172
trace_m173 db "com.pulse.lang.StringBuilder.toString"
trace_m173_len equ $ - trace_m173
trace_m174 db "com.pulse.lang.Throwable.Throwable"
trace_m174_len equ $ - trace_m174
trace_m175 db "com.pulse.lang.Throwable.Throwable"
trace_m175_len equ $ - trace_m175
trace_m176 db "com.pulse.lang.Throwable.getMessage"
trace_m176_len equ $ - trace_m176
trace_m177 db "com.pulse.lang.Throwable.toString"
trace_m177_len equ $ - trace_m177
trace_m178 db "com.pulse.lang.UByte.valueOf"
trace_m178_len equ $ - trace_m178
trace_m179 db "com.pulse.lang.UByte.parse"
trace_m179_len equ $ - trace_m179
trace_m180 db "com.pulse.lang.UByte.ubyteValue"
trace_m180_len equ $ - trace_m180
trace_m181 db "com.pulse.lang.UByte.equals"
trace_m181_len equ $ - trace_m181
trace_m182 db "com.pulse.lang.UByte.compare"
trace_m182_len equ $ - trace_m182
trace_m183 db "com.pulse.lang.UInteger.valueOf"
trace_m183_len equ $ - trace_m183
trace_m184 db "com.pulse.lang.UInteger.parse"
trace_m184_len equ $ - trace_m184
trace_m185 db "com.pulse.lang.UInteger.uintValue"
trace_m185_len equ $ - trace_m185
trace_m186 db "com.pulse.lang.UInteger.equals"
trace_m186_len equ $ - trace_m186
trace_m187 db "com.pulse.lang.UInteger.compare"
trace_m187_len equ $ - trace_m187
trace_m188 db "com.pulse.lang.ULong.valueOf"
trace_m188_len equ $ - trace_m188
trace_m189 db "com.pulse.lang.ULong.parse"
trace_m189_len equ $ - trace_m189
trace_m190 db "com.pulse.lang.ULong.ulongValue"
trace_m190_len equ $ - trace_m190
trace_m191 db "com.pulse.lang.ULong.equals"
trace_m191_len equ $ - trace_m191
trace_m192 db "com.pulse.lang.ULong.compare"
trace_m192_len equ $ - trace_m192
trace_m193 db "com.pulse.lang.UShort.valueOf"
trace_m193_len equ $ - trace_m193
trace_m194 db "com.pulse.lang.UShort.parse"
trace_m194_len equ $ - trace_m194
trace_m195 db "com.pulse.lang.UShort.ushortValue"
trace_m195_len equ $ - trace_m195
trace_m196 db "com.pulse.lang.UShort.equals"
trace_m196_len equ $ - trace_m196
trace_m197 db "com.pulse.lang.UShort.compare"
trace_m197_len equ $ - trace_m197
trace_m198 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException"
trace_m198_len equ $ - trace_m198
trace_m199 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException"
trace_m199_len equ $ - trace_m199
trace_m200 db "com.pulse.lang.UnsupportedOperationException.toString"
trace_m200_len equ $ - trace_m200
trace_m201 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m201_len equ $ - trace_m201
trace_m202 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m202_len equ $ - trace_m202
trace_m203 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m203_len equ $ - trace_m203
trace_m204 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m204_len equ $ - trace_m204
trace_m205 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m205_len equ $ - trace_m205
trace_m206 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m206_len equ $ - trace_m206
trace_m207 db "com.pulse.rt.Intrinsics.panic"
trace_m207_len equ $ - trace_m207
trace_m208 db "com.pulse.rt.Intrinsics.stringConcat"
trace_m208_len equ $ - trace_m208
trace_m209 db "com.pulse.rt.Intrinsics.stringLength"
trace_m209_len equ $ - trace_m209
trace_m210 db "com.pulse.rt.Intrinsics.intToString"
trace_m210_len equ $ - trace_m210
trace_m211 db "com.pulse.rt.Intrinsics.booleanToString"
trace_m211_len equ $ - trace_m211
trace_m212 db "com.pulse.rt.Intrinsics.parseInt"
trace_m212_len equ $ - trace_m212
trace_m213 db "com.pulse.rt.Intrinsics.parseBoolean"
trace_m213_len equ $ - trace_m213
trace_m214 db "com.pulse.rt.Intrinsics.arrayNew"
trace_m214_len equ $ - trace_m214
trace_m215 db "com.pulse.rt.Intrinsics.arrayLength"
trace_m215_len equ $ - trace_m215
trace_m216 db "com.pulse.rt.Intrinsics.arrayGetInt"
trace_m216_len equ $ - trace_m216
trace_m217 db "com.pulse.rt.Intrinsics.arraySetInt"
trace_m217_len equ $ - trace_m217
trace_m218 db "com.pulse.rt.Intrinsics.arrayGetString"
trace_m218_len equ $ - trace_m218
trace_m219 db "com.pulse.rt.Intrinsics.arraySetString"
trace_m219_len equ $ - trace_m219
trace_m220 db "com.pulse.rt.Intrinsics.listNew"
trace_m220_len equ $ - trace_m220
trace_m221 db "com.pulse.rt.Intrinsics.listSize"
trace_m221_len equ $ - trace_m221
trace_m222 db "com.pulse.rt.Intrinsics.listClear"
trace_m222_len equ $ - trace_m222
trace_m223 db "com.pulse.rt.Intrinsics.listAddInt"
trace_m223_len equ $ - trace_m223
trace_m224 db "com.pulse.rt.Intrinsics.listAddString"
trace_m224_len equ $ - trace_m224
trace_m225 db "com.pulse.rt.Intrinsics.listGetInt"
trace_m225_len equ $ - trace_m225
trace_m226 db "com.pulse.rt.Intrinsics.listGetString"
trace_m226_len equ $ - trace_m226
trace_m227 db "com.pulse.rt.Intrinsics.mapNew"
trace_m227_len equ $ - trace_m227
trace_m228 db "com.pulse.rt.Intrinsics.mapSize"
trace_m228_len equ $ - trace_m228
trace_m229 db "com.pulse.rt.Intrinsics.mapClear"
trace_m229_len equ $ - trace_m229
trace_m230 db "com.pulse.rt.Intrinsics.mapContainsKey"
trace_m230_len equ $ - trace_m230
trace_m231 db "com.pulse.rt.Intrinsics.mapPut"
trace_m231_len equ $ - trace_m231
trace_m232 db "com.pulse.rt.Intrinsics.mapPutInt"
trace_m232_len equ $ - trace_m232
trace_m233 db "com.pulse.rt.Intrinsics.mapGet"
trace_m233_len equ $ - trace_m233
trace_m234 db "com.pulse.rt.Intrinsics.mapGetInt"
trace_m234_len equ $ - trace_m234
trace_m235 db "com.pulse.rt.Intrinsics.arcRetain"
trace_m235_len equ $ - trace_m235
trace_m236 db "com.pulse.rt.Intrinsics.arcRelease"
trace_m236_len equ $ - trace_m236
trace_m237 db "com.pulse.rt.Intrinsics.arcRelease"
trace_m237_len equ $ - trace_m237
trace_m238 db "com.pulse.rt.Intrinsics.arcCycleYoungPass"
trace_m238_len equ $ - trace_m238
trace_m239 db "com.pulse.rt.Intrinsics.arcCycleFullPass"
trace_m239_len equ $ - trace_m239
trace_m240 db "com.pulse.rt.Intrinsics.arcCycleTick"
trace_m240_len equ $ - trace_m240
trace_m241 db "com.pulse.rt.Intrinsics.weakNew"
trace_m241_len equ $ - trace_m241
trace_m242 db "com.pulse.rt.Intrinsics.weakGet"
trace_m242_len equ $ - trace_m242
trace_m243 db "com.pulse.rt.Intrinsics.weakClear"
trace_m243_len equ $ - trace_m243

.code
pulsec_rt_init proc
    sub rsp, 40
    cmp qword ptr [rt_str_lens_ptr], 0
    jne pulsec_rt_init_done
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_init_fail
    mov qword ptr [rsp+32], rax
    mov rcx, qword ptr [rsp+32]
    mov edx, 8
    mov r8d, 256
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_init_fail
    mov qword ptr [rt_str_lens_ptr], rax
    mov rcx, qword ptr [rsp+32]
    mov edx, 8
    mov r8d, 16384
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_init_fail_free_lens
    mov qword ptr [rt_str_data_ptr], rax
    lea rax, rt_weak_free_next
    mov qword ptr [rt_weak_free_next_ptr], rax
    lea rax, rt_weak_target_slot
    mov qword ptr [rt_weak_target_slot_ptr], rax
    lea rax, rt_weak_target_gen
    mov qword ptr [rt_weak_target_gen_ptr], rax
    lea rax, rt_weak_generation
    mov qword ptr [rt_weak_generation_ptr], rax
    lea rax, rt_arr_len
    mov qword ptr [rt_arr_len_ptr], rax
    lea rax, rt_arr_alive
    mov qword ptr [rt_arr_alive_ptr], rax
    lea rax, rt_arr_i_ptr
    mov qword ptr [rt_arr_i_ptr_ptr], rax
    lea rax, rt_arr_s_ptr
    mov qword ptr [rt_arr_s_ptr_ptr], rax
    lea rax, rt_list_size
    mov qword ptr [rt_list_size_ptr], rax
    lea rax, rt_list_cap
    mov qword ptr [rt_list_cap_ptr], rax
    lea rax, rt_list_alive
    mov qword ptr [rt_list_alive_ptr], rax
    lea rax, rt_list_kind
    mov qword ptr [rt_list_kind_ptr], rax
    lea rax, rt_list_i_ptr
    mov qword ptr [rt_list_i_ptr_ptr], rax
    lea rax, rt_list_s_ptr
    mov qword ptr [rt_list_s_ptr_ptr], rax
    lea rax, rt_map_size
    mov qword ptr [rt_map_size_ptr], rax
    lea rax, rt_map_cap
    mov qword ptr [rt_map_cap_ptr], rax
    lea rax, rt_map_alive
    mov qword ptr [rt_map_alive_ptr], rax
    lea rax, rt_map_keys_ptr
    mov qword ptr [rt_map_keys_ptr_ptr], rax
    lea rax, rt_map_tags_ptr
    mov qword ptr [rt_map_tags_ptr_ptr], rax
    lea rax, rt_map_i_ptr
    mov qword ptr [rt_map_i_ptr_ptr], rax
    lea rax, rt_map_s_ptr
    mov qword ptr [rt_map_s_ptr_ptr], rax
    lea r12, rt_arc_refcounts_tbl
    lea r13, rt_arc_kinds_tbl
    lea r14, rt_arc_flags_tbl
    lea r15, rt_arc_meta_tbl
    lea rdi, rt_arc_generation_tbl
    lea rsi, rt_arc_free_next_tbl
pulsec_rt_init_done:
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_init_fail_free_lens:
    mov rcx, qword ptr [rsp+32]
    xor edx, edx
    mov r8, qword ptr [rt_str_lens_ptr]
    call HeapFree
    mov qword ptr [rt_str_lens_ptr], 0
pulsec_rt_init_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_init endp

pulsec_rt_stringFromBytes proc
    mov r10, rcx
    mov r11d, edx
    cmp r11d, 255
    jbe pulsec_rt_stringFromBytes_len_ok
    jmp pulsec_rt_stringFromBytes_fail
pulsec_rt_stringFromBytes_len_ok:
    mov qword ptr [rt_tmp_ptr_c], r10
    mov dword ptr [rt_tmp_arg_val], r11d
    mov eax, dword ptr [rt_arc_free_head]
    cmp eax, 1
    jb pulsec_rt_stringFromBytes_allocslot_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringFromBytes_allocslot_fresh
    mov r9d, eax
    mov eax, dword ptr [rt_arc_free_next+r9*4]
    mov dword ptr [rt_arc_free_head], eax
    mov eax, r9d
    mov dword ptr [rt_arc_free_next+rax*4], 0
    jmp pulsec_rt_stringFromBytes_allocslot_done
pulsec_rt_stringFromBytes_allocslot_fresh:
    mov eax, dword ptr [rt_handle_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_stringFromBytes_allocslot_have_room
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    cmp eax, 0
    jne pulsec_rt_stringFromBytes_fail
    mov eax, dword ptr [rt_handle_next]
pulsec_rt_stringFromBytes_allocslot_have_room:
    add eax, 1
    mov dword ptr [rt_handle_next], eax
pulsec_rt_stringFromBytes_allocslot_done:
    mov r10, qword ptr [rt_tmp_ptr_c]
    mov r11d, dword ptr [rt_tmp_arg_val]
    mov edx, dword ptr [rt_str_count]
    add edx, 1
    mov dword ptr [rt_str_count], edx
    mov r9, qword ptr [rt_str_lens_ptr]
    mov dword ptr [r9+rax*4], r11d
    mov dword ptr [rt_arc_kinds+rax*4], 3
    mov dword ptr [rt_arc_refcounts+rax*4], 1
    mov dword ptr [rt_arc_flags+rax*4], 0
    mov dword ptr [rt_arc_meta+rax*4], 0
    mov edx, dword ptr [rt_arc_generation+rax*4]
    add edx, 1
    jnz @F
    sub rsp, 40
    lea rcx, rt_arc_gen_overflow_err
    mov edx, rt_arc_gen_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
@@:
    mov dword ptr [rt_arc_generation+rax*4], edx
    mov r8d, eax
    imul r8d, 256
    mov r9, qword ptr [rt_str_data_ptr]
    add r9, r8
    xor ecx, ecx
pulsec_rt_stringFromBytes_copy_loop:
    cmp ecx, r11d
    jae pulsec_rt_stringFromBytes_done
    mov dl, byte ptr [r10+rcx]
    mov byte ptr [r9+rcx], dl
    add ecx, 1
    jmp pulsec_rt_stringFromBytes_copy_loop
pulsec_rt_stringFromBytes_done:
    mov edx, dword ptr [rt_arc_generation+rax*4]
    shl rdx, 32
    or rax, rdx
    ret
pulsec_rt_stringFromBytes_fail:
    sub rsp, 40
    lea rcx, rt_string_alloc_err
    mov edx, rt_string_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_stringFromBytes endp

pulsec_rt_writeRaw proc
    sub rsp, 40
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_writeRaw endp

pulsec_rt_tracePush proc
    mov eax, dword ptr [rt_trace_depth]
    cmp eax, 1023
    ja pulsec_rt_tracePush_done
    mov r8d, eax
    mov qword ptr [rt_trace_ptrs+r8*8], rcx
    mov dword ptr [rt_trace_lens+r8*4], edx
    add eax, 1
    mov dword ptr [rt_trace_depth], eax
pulsec_rt_tracePush_done:
    xor eax, eax
    ret
pulsec_rt_tracePush endp

pulsec_rt_tracePop proc
    mov eax, dword ptr [rt_trace_depth]
    test eax, eax
    jz pulsec_rt_tracePop_done
    sub eax, 1
    mov dword ptr [rt_trace_depth], eax
pulsec_rt_tracePop_done:
    xor eax, eax
    ret
pulsec_rt_tracePop endp

pulsec_rt_traceDump proc
    sub rsp, 40
    lea rcx, rt_trace_hdr
    mov edx, rt_trace_hdr_len
    call pulsec_rt_writeRaw
    mov eax, dword ptr [rt_trace_depth]
    test eax, eax
    jz pulsec_rt_traceDump_done
    sub eax, 1
    mov dword ptr [rsp+32], eax
pulsec_rt_traceDump_loop:
    lea rcx, rt_trace_prefix
    mov edx, rt_trace_prefix_len
    call pulsec_rt_writeRaw
    mov eax, dword ptr [rsp+32]
    mov r8d, eax
    mov rcx, qword ptr [rt_trace_ptrs+r8*8]
    mov edx, dword ptr [rt_trace_lens+r8*4]
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov eax, dword ptr [rsp+32]
    sub eax, 1
    mov dword ptr [rsp+32], eax
    cmp eax, -1
    jne pulsec_rt_traceDump_loop
pulsec_rt_traceDump_done:
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_traceDump endp

pulsec_rt_ensureSlotCapacity proc
    cmp ecx, 1
    jb pulsec_rt_ensureSlotCapacity_done_ok
    mov eax, dword ptr [rt_slot_capacity]
    cmp ecx, eax
    ja pulsec_rt_ensureSlotCapacity_need_grow
pulsec_rt_ensureSlotCapacity_done_ok:
    xor eax, eax
    ret
pulsec_rt_ensureSlotCapacity_need_grow:
    mov edx, eax
    mov r9d, eax
pulsec_rt_ensureSlotCapacity_grow_loop:
    cmp edx, ecx
    jae pulsec_rt_ensureSlotCapacity_prep_alloc
    cmp edx, 4294967295
    jae pulsec_rt_ensureSlotCapacity_cap_max
    mov r8d, edx
    shl edx, 1
    cmp edx, r8d
    jbe pulsec_rt_ensureSlotCapacity_cap_max
    cmp edx, 4294967295
    jbe pulsec_rt_ensureSlotCapacity_grow_loop
pulsec_rt_ensureSlotCapacity_cap_max:
    mov edx, 4294967295
    cmp edx, ecx
    jb pulsec_rt_ensureSlotCapacity_fail
pulsec_rt_ensureSlotCapacity_prep_alloc:
    sub rsp, 280
    mov dword ptr [rsp+248], edx
    mov dword ptr [rsp+252], r9d
    mov eax, edx
    add eax, 1
    shl eax, 2
    mov dword ptr [rsp+232], eax
    mov eax, dword ptr [rsp+248]
    add eax, 1
    shl eax, 3
    mov dword ptr [rsp+260], eax
    mov eax, dword ptr [rsp+248]
    add eax, 1
    shl eax, 8
    mov dword ptr [rsp+264], eax
    mov eax, dword ptr [rsp+252]
    add eax, 1
    shl eax, 8
    mov dword ptr [rsp+268], eax
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+104], 0
    mov qword ptr [rsp+112], 0
    mov qword ptr [rsp+120], 0
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+144], 0
    mov qword ptr [rsp+200], 0
    mov qword ptr [rsp+208], 0
    mov qword ptr [rsp+216], 0
    mov qword ptr [rsp+224], 0
    mov qword ptr [rsp+40], r12
    mov qword ptr [rsp+48], r13
    mov qword ptr [rsp+56], r14
    mov qword ptr [rsp+64], r15
    mov qword ptr [rsp+72], rdi
    mov qword ptr [rsp+80], rsi
    mov rax, qword ptr [rt_weak_free_next_ptr]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rt_weak_target_slot_ptr]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rt_weak_target_gen_ptr]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rt_weak_generation_ptr]
    mov qword ptr [rsp+192], rax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_stack
    mov qword ptr [rsp+240], rax
pulsec_rt_ensureSlotCapacity_alloc_ref:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+88], rax
pulsec_rt_ensureSlotCapacity_alloc_kinds:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+96], rax
pulsec_rt_ensureSlotCapacity_alloc_flags:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+104], rax
pulsec_rt_ensureSlotCapacity_alloc_meta:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+112], rax
pulsec_rt_ensureSlotCapacity_alloc_gen:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+120], rax
pulsec_rt_ensureSlotCapacity_alloc_free:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+128], rax
pulsec_rt_ensureSlotCapacity_alloc_weak_free:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+200], rax
pulsec_rt_ensureSlotCapacity_alloc_weak_slot:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+208], rax
pulsec_rt_ensureSlotCapacity_alloc_weak_tgen:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+216], rax
pulsec_rt_ensureSlotCapacity_alloc_weak_gen:
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+224], rax
    mov ecx, dword ptr [rsp+252]
    add ecx, 1
    mov dword ptr [rsp+256], ecx
    mov r10, qword ptr [rt_str_lens_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_fail_cleanup
    mov qword ptr [rsp+136], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_str_lens_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_str_lens_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_str_lens_next
    mov r11, qword ptr [rsp+136]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_str_lens_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_str_lens_loop
pulsec_rt_ensureSlotCapacity_grow_str_lens_done:
    mov r10, qword ptr [rt_str_data_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+264]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_str_data_alloc_fail
    mov qword ptr [rsp+144], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_str_data_loop:
    cmp ecx, dword ptr [rsp+268]
    jae pulsec_rt_ensureSlotCapacity_grow_str_data_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_str_data_next
    mov r11, qword ptr [rsp+144]
    mov dl, byte ptr [r10+rcx]
    mov byte ptr [r11+rcx], dl
pulsec_rt_ensureSlotCapacity_grow_str_data_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_str_data_loop
pulsec_rt_ensureSlotCapacity_grow_str_data_done:
pulsec_rt_ensureSlotCapacity_grow_str_commit:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rt_str_lens_ptr], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rt_str_data_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_copy_ref
pulsec_rt_ensureSlotCapacity_grow_str_data_alloc_fail:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+136]
    test r8, r8
    jz pulsec_rt_ensureSlotCapacity_fail_stack
    call HeapFree
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_copy_ref:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_ref_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_kinds
    mov r10, qword ptr [rsp+40]
    mov r11, qword ptr [rsp+88]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_ref_done
pulsec_rt_ensureSlotCapacity_copy_kinds:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_kinds_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_flags
    mov r10, qword ptr [rsp+48]
    mov r11, qword ptr [rsp+96]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_kinds_done
pulsec_rt_ensureSlotCapacity_copy_flags:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_flags_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_meta
    mov r10, qword ptr [rsp+56]
    mov r11, qword ptr [rsp+104]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_flags_done
pulsec_rt_ensureSlotCapacity_copy_meta:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_meta_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_gen
    mov r10, qword ptr [rsp+64]
    mov r11, qword ptr [rsp+112]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_meta_done
pulsec_rt_ensureSlotCapacity_copy_gen:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_gen_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_free
    mov r10, qword ptr [rsp+72]
    mov r11, qword ptr [rsp+120]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_gen_done
pulsec_rt_ensureSlotCapacity_copy_free:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_free_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_wfree
    mov r10, qword ptr [rsp+80]
    mov r11, qword ptr [rsp+128]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_free_done
pulsec_rt_ensureSlotCapacity_copy_wfree:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_wfree_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_wslot
    mov r10, qword ptr [rsp+168]
    mov r11, qword ptr [rsp+200]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_wfree_done
pulsec_rt_ensureSlotCapacity_copy_wslot:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_wslot_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_wtgen
    mov r10, qword ptr [rsp+176]
    mov r11, qword ptr [rsp+208]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_wslot_done
pulsec_rt_ensureSlotCapacity_copy_wtgen:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_wtgen_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_copy_wgen
    mov r10, qword ptr [rsp+184]
    mov r11, qword ptr [rsp+216]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_wtgen_done
pulsec_rt_ensureSlotCapacity_copy_wgen:
    xor eax, eax
pulsec_rt_ensureSlotCapacity_copy_wgen_done:
    cmp eax, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_free_old
    mov r10, qword ptr [rsp+192]
    mov r11, qword ptr [rsp+224]
    mov edx, dword ptr [r10+rax*4]
    mov dword ptr [r11+rax*4], edx
    add eax, 1
    jmp pulsec_rt_ensureSlotCapacity_copy_wgen_done
pulsec_rt_ensureSlotCapacity_free_old:
    cmp dword ptr [rt_arc_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_free_old_weak
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+40]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+48]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+56]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+72]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+80]
    call HeapFree
pulsec_rt_ensureSlotCapacity_free_old_weak:
    cmp dword ptr [rt_weak_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_commit
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+168]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+176]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+184]
    call HeapFree
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+192]
    call HeapFree
pulsec_rt_ensureSlotCapacity_commit:
    mov r12, qword ptr [rsp+88]
    mov r13, qword ptr [rsp+96]
    mov r14, qword ptr [rsp+104]
    mov r15, qword ptr [rsp+112]
    mov rdi, qword ptr [rsp+120]
    mov rsi, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rt_weak_free_next_ptr], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rt_weak_target_slot_ptr], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rt_weak_target_gen_ptr], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rt_weak_generation_ptr], rax
    mov ecx, dword ptr [rsp+252]
    add ecx, 1
    mov dword ptr [rsp+256], ecx
    mov r10, qword ptr [rt_arr_len_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_0_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_done:
    cmp dword ptr [rt_arr_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_0_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_0_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_0_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_arr_len_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_0_done
pulsec_rt_ensureSlotCapacity_grow_tbl_0_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_0_done:
    mov r10, qword ptr [rt_arr_alive_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_1_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_done:
    cmp dword ptr [rt_arr_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_1_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_1_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_1_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_arr_alive_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_1_done
pulsec_rt_ensureSlotCapacity_grow_tbl_1_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_1_done:
    mov r10, qword ptr [rt_arr_i_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_2_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_done:
    cmp dword ptr [rt_arr_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_2_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_2_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_2_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_arr_i_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_2_done
pulsec_rt_ensureSlotCapacity_grow_tbl_2_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_2_done:
    mov r10, qword ptr [rt_arr_s_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_3_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_done:
    cmp dword ptr [rt_arr_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_3_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_3_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_3_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_arr_s_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_3_done
pulsec_rt_ensureSlotCapacity_grow_tbl_3_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_3_done:
    mov dword ptr [rt_arr_heap_owned], 1
    mov r10, qword ptr [rt_list_size_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_4_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_4_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_4_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_4_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_size_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_4_done
pulsec_rt_ensureSlotCapacity_grow_tbl_4_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_4_done:
    mov r10, qword ptr [rt_list_cap_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_5_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_5_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_5_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_5_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_cap_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_5_done
pulsec_rt_ensureSlotCapacity_grow_tbl_5_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_5_done:
    mov r10, qword ptr [rt_list_alive_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_6_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_6_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_6_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_6_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_alive_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_6_done
pulsec_rt_ensureSlotCapacity_grow_tbl_6_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_6_done:
    mov r10, qword ptr [rt_list_kind_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_7_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_7_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_7_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_7_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_kind_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_7_done
pulsec_rt_ensureSlotCapacity_grow_tbl_7_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_7_done:
    mov r10, qword ptr [rt_list_i_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_8_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_8_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_8_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_8_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_i_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_8_done
pulsec_rt_ensureSlotCapacity_grow_tbl_8_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_8_done:
    mov r10, qword ptr [rt_list_s_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_9_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_done:
    cmp dword ptr [rt_list_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_9_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_9_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_9_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_list_s_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_9_done
pulsec_rt_ensureSlotCapacity_grow_tbl_9_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_9_done:
    mov dword ptr [rt_list_heap_owned], 1
    mov r10, qword ptr [rt_map_size_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_10_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_10_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_10_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_10_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_size_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_10_done
pulsec_rt_ensureSlotCapacity_grow_tbl_10_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_10_done:
    mov r10, qword ptr [rt_map_cap_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_11_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_11_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_11_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_11_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_cap_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_11_done
pulsec_rt_ensureSlotCapacity_grow_tbl_11_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_11_done:
    mov r10, qword ptr [rt_map_alive_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_12_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_12_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_12_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_12_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_alive_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_12_done
pulsec_rt_ensureSlotCapacity_grow_tbl_12_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_12_done:
    mov r10, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_13_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_13_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_13_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_13_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_keys_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_13_done
pulsec_rt_ensureSlotCapacity_grow_tbl_13_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_13_done:
    mov r10, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_14_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_14_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_14_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_14_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_tags_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_14_done
pulsec_rt_ensureSlotCapacity_grow_tbl_14_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_14_done:
    mov r10, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_15_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_15_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_15_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_15_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_i_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_15_done
pulsec_rt_ensureSlotCapacity_grow_tbl_15_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_15_done:
    mov r10, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+260]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_16_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_done:
    cmp dword ptr [rt_map_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_16_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_16_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_16_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rt_map_s_ptr_ptr], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_16_done
pulsec_rt_ensureSlotCapacity_grow_tbl_16_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_16_done:
    mov dword ptr [rt_map_heap_owned], 1
    mov dword ptr [rt_arc_heap_owned], 1
    mov dword ptr [rt_weak_heap_owned], 1
    mov eax, dword ptr [rsp+248]
    mov dword ptr [rt_slot_capacity], eax
    xor eax, eax
    add rsp, 280
    ret
pulsec_rt_ensureSlotCapacity_fail_cleanup:
    mov rcx, qword ptr [rsp+240]
    test rcx, rcx
    jz pulsec_rt_ensureSlotCapacity_fail_stack
    xor edx, edx
    mov r8, qword ptr [rsp+88]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+96]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+104]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+112]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+120]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+128]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+200]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+208]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+216]
    test r8, r8
    jz @F
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, qword ptr [rsp+224]
    test r8, r8
    jz @F
    call HeapFree
@@:
pulsec_rt_ensureSlotCapacity_fail_stack:
    mov eax, 1
    add rsp, 280
    ret
pulsec_rt_ensureSlotCapacity_fail:
    mov eax, 1
    ret
pulsec_rt_ensureSlotCapacity endp

pulsec_rt_arcTeardown proc
    cmp ecx, 1
    jb pulsec_rt_arcTeardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_done
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov eax, dword ptr [rt_arc_kinds+rcx*4]
    cmp eax, 2
    je pulsec_rt_arcTeardown_kind_array
    cmp eax, 3
    je pulsec_rt_arcTeardown_kind_string
    cmp eax, 4
    je pulsec_rt_arcTeardown_kind_collection
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_kind_array:
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_clear_header
    mov rax, qword ptr [rt_arr_len_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov rax, qword ptr [rt_arr_alive_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov rax, qword ptr [rt_arr_i_ptr_ptr]
    mov r11, qword ptr [rax+rcx*8]
    mov qword ptr [rax+rcx*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_array_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_array_i_done:
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_arr_s_ptr_ptr]
    mov r11, qword ptr [rax+rcx*8]
    mov qword ptr [rax+rcx*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_array_s_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_array_s_done:
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_kind_string:
    mov rax, qword ptr [rt_str_lens_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov r8d, ecx
    imul r8d, 256
    xor eax, eax
pulsec_rt_arcTeardown_loop_string:
    cmp eax, 256
    jae pulsec_rt_arcTeardown_clear_header
    mov r11, qword ptr [rt_str_data_ptr]
    add r11, r8
    mov byte ptr [r11+rax], 0
    add eax, 1
    jmp pulsec_rt_arcTeardown_loop_string
pulsec_rt_arcTeardown_kind_collection:
    mov eax, dword ptr [rt_arc_meta+rcx*4]
    cmp eax, 1
    je pulsec_rt_arcTeardown_collection_list
    cmp eax, 2
    je pulsec_rt_arcTeardown_collection_map
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_collection_list:
    cmp ecx, 1
    jb pulsec_rt_arcTeardown_clear_header
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_clear_header
    mov r10d, ecx
    mov rax, qword ptr [rt_list_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], eax
    mov rax, qword ptr [rt_list_kind_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 2
    jne pulsec_rt_arcTeardown_release_list_done
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov dword ptr [rt_tmp_arr_len], 0
pulsec_rt_arcTeardown_release_list_loop:
    mov ecx, dword ptr [rt_tmp_arr_len]
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_arcTeardown_release_list_done
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_list_skip
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_list_skip:
    mov ecx, dword ptr [rt_tmp_arr_len]
    add ecx, 1
    mov dword ptr [rt_tmp_arr_len], ecx
    jmp pulsec_rt_arcTeardown_release_list_loop
pulsec_rt_arcTeardown_release_list_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_cap_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_alive_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_list_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_list_i_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_list_s_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_list_s_done:
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_collection_map:
    cmp ecx, 1
    jb pulsec_rt_arcTeardown_clear_header
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_clear_header
    mov r10d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], eax
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov dword ptr [rt_tmp_arr_len], 0
pulsec_rt_arcTeardown_release_map_loop:
    mov ecx, dword ptr [rt_tmp_arr_len]
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_arcTeardown_release_map_done
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_key
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_map_skip_key:
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_value
    cmp dword ptr [rax+rcx*4], 2
    jne pulsec_rt_arcTeardown_release_map_skip_value
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_value
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_map_skip_value:
    mov ecx, dword ptr [rt_tmp_arr_len]
    add ecx, 1
    mov dword ptr [rt_tmp_arr_len], ecx
    jmp pulsec_rt_arcTeardown_release_map_loop
pulsec_rt_arcTeardown_release_map_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_cap_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_alive_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_map_keys_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_map_keys_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_map_tags_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_map_tags_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_map_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_map_i_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_free_map_s_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arcTeardown_free_map_s_done:
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_clear_header:
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov dword ptr [rt_arc_refcounts+rcx*4], 0
    mov dword ptr [rt_arc_kinds+rcx*4], 0
    mov dword ptr [rt_arc_flags+rcx*4], 0
    mov dword ptr [rt_arc_meta+rcx*4], 0
    mov eax, dword ptr [rt_arc_free_head]
    mov dword ptr [rt_arc_free_next+rcx*4], eax
    mov dword ptr [rt_arc_free_head], ecx
pulsec_rt_arcTeardown_done:
    xor eax, eax
    ret
pulsec_rt_arcTeardown endp

mainCRTStartup proc
    sub rsp, 40
    call pulsec_rt_init
    call pulsec_app_stress_Main_main
    mov ecx, eax
    call ExitProcess
mainCRTStartup endp

pulsec_app_stress_Main_main proc
    sub rsp, 136
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
pulsec_app_stress_Main_main_b0:
    mov eax, dword ptr [pulsec_objc_app_stress_Main]
    cmp eax, 63
    jae Main_ctor_expr_sat_1
    add eax, 1
    jmp Main_ctor_expr_done_1
Main_ctor_expr_sat_1:
    mov eax, 63
Main_ctor_expr_done_1:
    mov dword ptr [pulsec_objc_app_stress_Main], eax
    mov dword ptr [rsp+64], eax
    mov eax, 200
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_app_stress_SoakRunner_run__int
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 20313
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_Main_main_b1
    jmp pulsec_app_stress_Main_main_b2
pulsec_app_stress_Main_main_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    jmp pulsec_app_stress_Main_main_b3
pulsec_app_stress_Main_main_b2:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    jmp pulsec_app_stress_Main_main_b3
pulsec_app_stress_Main_main_b3:
    xor eax, eax
    jmp pulsec_app_stress_Main_main_epilogue
pulsec_app_stress_Main_main_epilogue:
pulsec_app_stress_Main_main_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_app_stress_Main_main endp

pulsec_app_stress_SoakRunner_run__int proc
    sub rsp, 376
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+176], edx
    mov dword ptr [rsp+184], ecx
pulsec_app_stress_SoakRunner_run__int_b0:
    call pulsec_com_pulse_collections_ArrayList_ArrayList
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+64], eax
    call pulsec_com_pulse_collections_LinkedList_LinkedList
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+72], eax
    call pulsec_com_pulse_collections_HashMap_HashMap
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+80], eax
    call pulsec_com_pulse_collections_HashSet_HashSet
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+88], eax
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b1
pulsec_app_stress_SoakRunner_run__int_b1:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+176]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b2
    jmp pulsec_app_stress_SoakRunner_run__int_b3
pulsec_app_stress_SoakRunner_run__int_b2:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+200], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    call pulsec_app_stress_Token_Token__int
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_app_stress_Token_value
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_add__int
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_size
    mov dword ptr [rsp+208], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b4
    jmp pulsec_app_stress_SoakRunner_run__int_b5
pulsec_app_stress_SoakRunner_run__int_b3:
    jmp pulsec_app_stress_SoakRunner_run__int_b16
pulsec_app_stress_SoakRunner_run__int_b4:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_clear
    jmp pulsec_app_stress_SoakRunner_run__int_b6
pulsec_app_stress_SoakRunner_run__int_b5:
    jmp pulsec_app_stress_SoakRunner_run__int_b6
pulsec_app_stress_SoakRunner_run__int_b6:
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_offer__int
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_size
    mov dword ptr [rsp+216], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b7
    jmp pulsec_app_stress_SoakRunner_run__int_b8
pulsec_app_stress_SoakRunner_run__int_b7:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+224], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_poll
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b9
pulsec_app_stress_SoakRunner_run__int_b8:
    jmp pulsec_app_stress_SoakRunner_run__int_b9
pulsec_app_stress_SoakRunner_run__int_b9:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+328], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+328]
    mov r8d, eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashMap_putInt__String_int
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+232], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b10
    jmp pulsec_app_stress_SoakRunner_run__int_b11
pulsec_app_stress_SoakRunner_run__int_b10:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_add__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 1
    mov dword ptr [rsp+120], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b12
pulsec_app_stress_SoakRunner_run__int_b11:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_add__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 0
    mov dword ptr [rsp+120], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b12
pulsec_app_stress_SoakRunner_run__int_b12:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+240], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b13
    jmp pulsec_app_stress_SoakRunner_run__int_b14
pulsec_app_stress_SoakRunner_run__int_b13:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+96], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b15
pulsec_app_stress_SoakRunner_run__int_b14:
    jmp pulsec_app_stress_SoakRunner_run__int_b15
pulsec_app_stress_SoakRunner_run__int_b15:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+248], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+256], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    add eax, edx
    mov dword ptr [rsp+112], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b1
pulsec_app_stress_SoakRunner_run__int_b16:
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_size
    mov dword ptr [rsp+264], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b17
    jmp pulsec_app_stress_SoakRunner_run__int_b18
pulsec_app_stress_SoakRunner_run__int_b17:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+272], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_poll
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b16
pulsec_app_stress_SoakRunner_run__int_b18:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashMap_getInt__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_size
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_size
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+280], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    add eax, edx
    mov dword ptr [rsp+288], eax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov eax, dword ptr [rsp+288]
    add eax, edx
    mov dword ptr [rsp+296], eax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    add eax, edx
    mov dword ptr [rsp+304], eax
    mov eax, dword ptr [rsp+168]
    mov edx, eax
    mov eax, dword ptr [rsp+304]
    add eax, edx
    mov dword ptr [rsp+312], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov edx, eax
    mov eax, dword ptr [rsp+312]
    add eax, edx
    jmp pulsec_app_stress_SoakRunner_run__int_epilogue
pulsec_app_stress_SoakRunner_run__int_epilogue:
pulsec_app_stress_SoakRunner_run__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 376
    ret
pulsec_app_stress_SoakRunner_run__int endp

pulsec_app_stress_Token_Token__int proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_app_stress_Token]
    cmp eax, 63
    jae pulsec_app_stress_Token_Token__int_ctor_sat
    add eax, 1
    jmp pulsec_app_stress_Token_Token__int_ctor_sat_done
pulsec_app_stress_Token_Token__int_ctor_sat:
    mov eax, 63
pulsec_app_stress_Token_Token__int_ctor_sat_done:
    mov dword ptr [pulsec_objc_app_stress_Token], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_app_stress_Token_Token__int_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_app_stress_Token_v
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_app_stress_Token_Token__int_epilogue
pulsec_app_stress_Token_Token__int_epilogue:
pulsec_app_stress_Token_Token__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_app_stress_Token_Token__int endp

pulsec_app_stress_Token_value proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_app_stress_Token_value_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_app_stress_Token_v
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_app_stress_Token_value_epilogue
pulsec_app_stress_Token_value_epilogue:
pulsec_app_stress_Token_value_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_stress_Token_value endp

pulsec_com_pulse_collections_Array_Array__int proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_Array]
    cmp eax, 63
    jae pulsec_com_pulse_collections_Array_Array__int_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_Array_Array__int_ctor_sat_done
pulsec_com_pulse_collections_Array_Array__int_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_Array_Array__int_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_Array], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Array_Array__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_rt_arrayNew
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_collections_Array_Array__int_epilogue
pulsec_com_pulse_collections_Array_Array__int_epilogue:
pulsec_com_pulse_collections_Array_Array__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Array_Array__int endp

pulsec_com_pulse_collections_Array_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Array_length_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arrayLength
    jmp pulsec_com_pulse_collections_Array_length_epilogue
pulsec_com_pulse_collections_Array_length_epilogue:
pulsec_com_pulse_collections_Array_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Array_length endp

pulsec_com_pulse_collections_Array_getInt__int proc
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
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Array_getInt__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_arrayGetInt
    jmp pulsec_com_pulse_collections_Array_getInt__int_epilogue
pulsec_com_pulse_collections_Array_getInt__int_epilogue:
pulsec_com_pulse_collections_Array_getInt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Array_getInt__int endp

pulsec_com_pulse_collections_Array_setInt__int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_Array_setInt__int_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
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
    call pulsec_rt_arraySetInt
    xor eax, eax
    jmp pulsec_com_pulse_collections_Array_setInt__int_int_epilogue
pulsec_com_pulse_collections_Array_setInt__int_int_epilogue:
pulsec_com_pulse_collections_Array_setInt__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Array_setInt__int_int endp

pulsec_com_pulse_collections_Array_getString__int proc
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
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Array_getString__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_arrayGetString
    jmp pulsec_com_pulse_collections_Array_getString__int_epilogue
pulsec_com_pulse_collections_Array_getString__int_epilogue:
pulsec_com_pulse_collections_Array_getString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Array_getString__int endp

pulsec_com_pulse_collections_Array_setString__int_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_Array_setString__int_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Array_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_arraySetString
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_Array_setString__int_String_epilogue
pulsec_com_pulse_collections_Array_setString__int_String_epilogue:
pulsec_com_pulse_collections_Array_setString__int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Array_setString__int_String endp

pulsec_com_pulse_collections_ArrayList_ArrayList proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_ArrayList]
    cmp eax, 63
    jae pulsec_com_pulse_collections_ArrayList_ArrayList_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_ArrayList_ArrayList_ctor_sat_done
pulsec_com_pulse_collections_ArrayList_ArrayList_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_ArrayList_ArrayList_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_ArrayList], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_ArrayList_ArrayList_b0:
    call pulsec_rt_listNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_ArrayList_ArrayList_epilogue
pulsec_com_pulse_collections_ArrayList_ArrayList_epilogue:
pulsec_com_pulse_collections_ArrayList_ArrayList_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_ArrayList_ArrayList endp

pulsec_com_pulse_collections_ArrayList_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_ArrayList_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listSize
    jmp pulsec_com_pulse_collections_ArrayList_size_epilogue
pulsec_com_pulse_collections_ArrayList_size_epilogue:
pulsec_com_pulse_collections_ArrayList_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_ArrayList_size endp

pulsec_com_pulse_collections_ArrayList_clear proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_ArrayList_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listClear
    xor eax, eax
    jmp pulsec_com_pulse_collections_ArrayList_clear_epilogue
pulsec_com_pulse_collections_ArrayList_clear_epilogue:
pulsec_com_pulse_collections_ArrayList_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_ArrayList_clear endp

pulsec_com_pulse_collections_ArrayList_add__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_ArrayList_add__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_ArrayList_add__int_b1
    jmp pulsec_com_pulse_collections_ArrayList_add__int_b2
pulsec_com_pulse_collections_ArrayList_add__int_b1:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_ArrayList_add__int_b3
pulsec_com_pulse_collections_ArrayList_add__int_b2:
    jmp pulsec_com_pulse_collections_ArrayList_add__int_b3
pulsec_com_pulse_collections_ArrayList_add__int_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_listAddInt
    xor eax, eax
    jmp pulsec_com_pulse_collections_ArrayList_add__int_epilogue
pulsec_com_pulse_collections_ArrayList_add__int_epilogue:
pulsec_com_pulse_collections_ArrayList_add__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_ArrayList_add__int endp

pulsec_com_pulse_collections_ArrayList_add__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_ArrayList_add__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_ArrayList_add__String_b1
    jmp pulsec_com_pulse_collections_ArrayList_add__String_b2
pulsec_com_pulse_collections_ArrayList_add__String_b1:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_ArrayList_add__String_b3
pulsec_com_pulse_collections_ArrayList_add__String_b2:
    jmp pulsec_com_pulse_collections_ArrayList_add__String_b3
pulsec_com_pulse_collections_ArrayList_add__String_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_listAddString
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_ArrayList_add__String_epilogue
pulsec_com_pulse_collections_ArrayList_add__String_epilogue:
pulsec_com_pulse_collections_ArrayList_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_ArrayList_add__String endp

pulsec_com_pulse_collections_ArrayList_getInt__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_ArrayList_getInt__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_ArrayList_getInt__int_b1
    jmp pulsec_com_pulse_collections_ArrayList_getInt__int_b2
pulsec_com_pulse_collections_ArrayList_getInt__int_b1:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov eax, 0
    jmp pulsec_com_pulse_collections_ArrayList_getInt__int_epilogue
pulsec_com_pulse_collections_ArrayList_getInt__int_b2:
    jmp pulsec_com_pulse_collections_ArrayList_getInt__int_b3
pulsec_com_pulse_collections_ArrayList_getInt__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetInt
    jmp pulsec_com_pulse_collections_ArrayList_getInt__int_epilogue
pulsec_com_pulse_collections_ArrayList_getInt__int_epilogue:
pulsec_com_pulse_collections_ArrayList_getInt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_ArrayList_getInt__int endp

pulsec_com_pulse_collections_ArrayList_getString__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_ArrayList_getString__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_ArrayList_getString__int_b1
    jmp pulsec_com_pulse_collections_ArrayList_getString__int_b2
pulsec_com_pulse_collections_ArrayList_getString__int_b1:
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_collections_ArrayList_getString__int_epilogue
pulsec_com_pulse_collections_ArrayList_getString__int_b2:
    jmp pulsec_com_pulse_collections_ArrayList_getString__int_b3
pulsec_com_pulse_collections_ArrayList_getString__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_ArrayList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetString
    jmp pulsec_com_pulse_collections_ArrayList_getString__int_epilogue
pulsec_com_pulse_collections_ArrayList_getString__int_epilogue:
pulsec_com_pulse_collections_ArrayList_getString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_ArrayList_getString__int endp

pulsec_com_pulse_collections_Collection_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Collection_size_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Collection_size_epilogue
pulsec_com_pulse_collections_Collection_size_epilogue:
pulsec_com_pulse_collections_Collection_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Collection_size endp

pulsec_com_pulse_collections_Collection_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Collection_clear_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Collection_clear_epilogue
pulsec_com_pulse_collections_Collection_clear_epilogue:
pulsec_com_pulse_collections_Collection_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Collection_clear endp

pulsec_com_pulse_collections_Deque_addFirst__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Deque_addFirst__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_addFirst__int_epilogue
pulsec_com_pulse_collections_Deque_addFirst__int_epilogue:
pulsec_com_pulse_collections_Deque_addFirst__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Deque_addFirst__int endp

pulsec_com_pulse_collections_Deque_addLast__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Deque_addLast__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_addLast__int_epilogue
pulsec_com_pulse_collections_Deque_addLast__int_epilogue:
pulsec_com_pulse_collections_Deque_addLast__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Deque_addLast__int endp

pulsec_com_pulse_collections_Deque_removeFirst proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Deque_removeFirst_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_removeFirst_epilogue
pulsec_com_pulse_collections_Deque_removeFirst_epilogue:
pulsec_com_pulse_collections_Deque_removeFirst_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_removeFirst endp

pulsec_com_pulse_collections_Deque_removeLast proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Deque_removeLast_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_removeLast_epilogue
pulsec_com_pulse_collections_Deque_removeLast_epilogue:
pulsec_com_pulse_collections_Deque_removeLast_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_removeLast endp

pulsec_com_pulse_collections_Deque_isEmpty proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Deque_isEmpty_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_isEmpty_epilogue
pulsec_com_pulse_collections_Deque_isEmpty_epilogue:
pulsec_com_pulse_collections_Deque_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_isEmpty endp

pulsec_com_pulse_collections_HashMap_HashMap proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_HashMap]
    cmp eax, 63
    jae pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat_done
pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_HashMap], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_HashMap_b0:
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_HashMap_HashMap_epilogue
pulsec_com_pulse_collections_HashMap_HashMap_epilogue:
pulsec_com_pulse_collections_HashMap_HashMap_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_HashMap endp

pulsec_com_pulse_collections_HashMap_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapSize
    jmp pulsec_com_pulse_collections_HashMap_size_epilogue
pulsec_com_pulse_collections_HashMap_size_epilogue:
pulsec_com_pulse_collections_HashMap_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_size endp

pulsec_com_pulse_collections_HashMap_clear proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapClear
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_clear_epilogue
pulsec_com_pulse_collections_HashMap_clear_epilogue:
pulsec_com_pulse_collections_HashMap_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_clear endp

pulsec_com_pulse_collections_HashMap_containsKey__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_containsKey__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapContainsKey
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue
pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue:
pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_containsKey__String endp

pulsec_com_pulse_collections_HashMap_put__String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_HashMap_put__String_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPut
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_put__String_String_epilogue
pulsec_com_pulse_collections_HashMap_put__String_String_epilogue:
pulsec_com_pulse_collections_HashMap_put__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_put__String_String endp

pulsec_com_pulse_collections_HashMap_putInt__String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_HashMap_putInt__String_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue
pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue:
pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_putInt__String_int endp

pulsec_com_pulse_collections_HashMap_get__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_get__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGet
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_get__String_epilogue
pulsec_com_pulse_collections_HashMap_get__String_epilogue:
pulsec_com_pulse_collections_HashMap_get__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_get__String endp

pulsec_com_pulse_collections_HashMap_getInt__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_getInt__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_getInt__String_epilogue
pulsec_com_pulse_collections_HashMap_getInt__String_epilogue:
pulsec_com_pulse_collections_HashMap_getInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_getInt__String endp

pulsec_com_pulse_collections_HashSet_HashSet proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_HashSet]
    cmp eax, 63
    jae pulsec_com_pulse_collections_HashSet_HashSet_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_HashSet_HashSet_ctor_sat_done
pulsec_com_pulse_collections_HashSet_HashSet_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_HashSet_HashSet_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_HashSet], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashSet_HashSet_b0:
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_HashSet_HashSet_epilogue
pulsec_com_pulse_collections_HashSet_HashSet_epilogue:
pulsec_com_pulse_collections_HashSet_HashSet_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashSet_HashSet endp

pulsec_com_pulse_collections_HashSet_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashSet_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapSize
    jmp pulsec_com_pulse_collections_HashSet_size_epilogue
pulsec_com_pulse_collections_HashSet_size_epilogue:
pulsec_com_pulse_collections_HashSet_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashSet_size endp

pulsec_com_pulse_collections_HashSet_clear proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashSet_clear_b0:
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashSet_clear_epilogue
pulsec_com_pulse_collections_HashSet_clear_epilogue:
pulsec_com_pulse_collections_HashSet_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashSet_clear endp

pulsec_com_pulse_collections_HashSet_add__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashSet_add__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapContainsKey
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_HashSet_add__String_b1
    jmp pulsec_com_pulse_collections_HashSet_add__String_b2
pulsec_com_pulse_collections_HashSet_add__String_b1:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, 1
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashSet_add__String_b3
pulsec_com_pulse_collections_HashSet_add__String_b2:
    jmp pulsec_com_pulse_collections_HashSet_add__String_b3
pulsec_com_pulse_collections_HashSet_add__String_b3:
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashSet_add__String_epilogue
pulsec_com_pulse_collections_HashSet_add__String_epilogue:
pulsec_com_pulse_collections_HashSet_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashSet_add__String endp

pulsec_com_pulse_collections_HashSet_contains__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashSet_contains__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashSet_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapContainsKey
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashSet_contains__String_epilogue
pulsec_com_pulse_collections_HashSet_contains__String_epilogue:
pulsec_com_pulse_collections_HashSet_contains__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashSet_contains__String endp

pulsec_com_pulse_collections_LinkedList_LinkedList proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_LinkedList]
    cmp eax, 63
    jae pulsec_com_pulse_collections_LinkedList_LinkedList_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_LinkedList_LinkedList_ctor_sat_done
pulsec_com_pulse_collections_LinkedList_LinkedList_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_LinkedList_LinkedList_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_LinkedList], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_LinkedList_LinkedList_b0:
    call pulsec_rt_listNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHandle
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue
pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue:
pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_LinkedList endp

pulsec_com_pulse_collections_LinkedList_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_LinkedList_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listSize
    jmp pulsec_com_pulse_collections_LinkedList_size_epilogue
pulsec_com_pulse_collections_LinkedList_size_epilogue:
pulsec_com_pulse_collections_LinkedList_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_size endp

pulsec_com_pulse_collections_LinkedList_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_LinkedList_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listClear
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHandle
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_clear_epilogue
pulsec_com_pulse_collections_LinkedList_clear_epilogue:
pulsec_com_pulse_collections_LinkedList_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_clear endp

pulsec_com_pulse_collections_LinkedList_add__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_LinkedList_add__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_add__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b2
pulsec_com_pulse_collections_LinkedList_add__int_b1:
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b3
pulsec_com_pulse_collections_LinkedList_add__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b3
pulsec_com_pulse_collections_LinkedList_add__int_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_listAddInt
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_add__int_epilogue
pulsec_com_pulse_collections_LinkedList_add__int_epilogue:
pulsec_com_pulse_collections_LinkedList_add__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_add__int endp

pulsec_com_pulse_collections_LinkedList_add__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_LinkedList_add__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_add__String_b1
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b2
pulsec_com_pulse_collections_LinkedList_add__String_b1:
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b3
pulsec_com_pulse_collections_LinkedList_add__String_b2:
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b3
pulsec_com_pulse_collections_LinkedList_add__String_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_listAddString
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_add__String_epilogue
pulsec_com_pulse_collections_LinkedList_add__String_epilogue:
pulsec_com_pulse_collections_LinkedList_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_add__String endp

pulsec_com_pulse_collections_LinkedList_getInt__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_getInt__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_getInt__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_b2
pulsec_com_pulse_collections_LinkedList_getInt__int_b1:
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_com_pulse_collections_LinkedList_getInt__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_b3
pulsec_com_pulse_collections_LinkedList_getInt__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetInt
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue:
pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_LinkedList_getInt__int endp

pulsec_com_pulse_collections_LinkedList_getString__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_getString__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_getString__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_b2
pulsec_com_pulse_collections_LinkedList_getString__int_b1:
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_epilogue
pulsec_com_pulse_collections_LinkedList_getString__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_b3
pulsec_com_pulse_collections_LinkedList_getString__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetString
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_epilogue
pulsec_com_pulse_collections_LinkedList_getString__int_epilogue:
pulsec_com_pulse_collections_LinkedList_getString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_LinkedList_getString__int endp

pulsec_com_pulse_collections_LinkedList_offer__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_offer__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_offer__int_epilogue
pulsec_com_pulse_collections_LinkedList_offer__int_epilogue:
pulsec_com_pulse_collections_LinkedList_offer__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_offer__int endp

pulsec_com_pulse_collections_LinkedList_poll proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_poll_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueTail
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_poll_b1
    jmp pulsec_com_pulse_collections_LinkedList_poll_b2
pulsec_com_pulse_collections_LinkedList_poll_b1:
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_poll_epilogue
pulsec_com_pulse_collections_LinkedList_poll_b2:
    jmp pulsec_com_pulse_collections_LinkedList_poll_b3
pulsec_com_pulse_collections_LinkedList_poll_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_queueHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_collections_LinkedList_poll_epilogue
pulsec_com_pulse_collections_LinkedList_poll_epilogue:
pulsec_com_pulse_collections_LinkedList_poll_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_poll endp

pulsec_com_pulse_collections_LinkedList_isEmpty proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_LinkedList_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue
pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue:
pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_isEmpty endp

pulsec_com_pulse_collections_LinkedList_addFirst__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_addFirst__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov dword ptr [r10+rdx*4], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue
pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue:
pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_addFirst__int endp

pulsec_com_pulse_collections_LinkedList_addLast__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_addLast__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue
pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue:
pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_addLast__int endp

pulsec_com_pulse_collections_LinkedList_removeFirst proc
    sub rsp, 152
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
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_LinkedList_removeFirst_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_removeFirst_b1
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_b2
pulsec_com_pulse_collections_LinkedList_removeFirst_b1:
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_com_pulse_collections_LinkedList_removeFirst_b2:
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_b3
pulsec_com_pulse_collections_LinkedList_removeFirst_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue:
pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_removeFirst endp

pulsec_com_pulse_collections_LinkedList_removeLast proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_LinkedList_removeLast_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHead
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+80], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_removeLast_b1
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_b2
pulsec_com_pulse_collections_LinkedList_removeLast_b1:
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_epilogue
pulsec_com_pulse_collections_LinkedList_removeLast_b2:
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_b3
pulsec_com_pulse_collections_LinkedList_removeLast_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov dword ptr [r10+rdx*4], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeTail
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_epilogue
pulsec_com_pulse_collections_LinkedList_removeLast_epilogue:
pulsec_com_pulse_collections_LinkedList_removeLast_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_removeLast endp

pulsec_com_pulse_collections_List_size proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_List_size_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_size_epilogue
pulsec_com_pulse_collections_List_size_epilogue:
pulsec_com_pulse_collections_List_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_List_size endp

pulsec_com_pulse_collections_List_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_List_clear_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_clear_epilogue
pulsec_com_pulse_collections_List_clear_epilogue:
pulsec_com_pulse_collections_List_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_List_clear endp

pulsec_com_pulse_collections_List_add__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_List_add__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_add__int_epilogue
pulsec_com_pulse_collections_List_add__int_epilogue:
pulsec_com_pulse_collections_List_add__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_List_add__int endp

pulsec_com_pulse_collections_List_add__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_List_add__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_add__String_epilogue
pulsec_com_pulse_collections_List_add__String_epilogue:
pulsec_com_pulse_collections_List_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_List_add__String endp

pulsec_com_pulse_collections_List_getInt__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_List_getInt__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_getInt__int_epilogue
pulsec_com_pulse_collections_List_getInt__int_epilogue:
pulsec_com_pulse_collections_List_getInt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_List_getInt__int endp

pulsec_com_pulse_collections_List_getString__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_List_getString__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_List_getString__int_epilogue
pulsec_com_pulse_collections_List_getString__int_epilogue:
pulsec_com_pulse_collections_List_getString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_List_getString__int endp

pulsec_com_pulse_collections_Map_Map proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_Map]
    cmp eax, 63
    jae pulsec_com_pulse_collections_Map_Map_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_Map_Map_ctor_sat_done
pulsec_com_pulse_collections_Map_Map_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_Map_Map_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_Map], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Map_Map_b0:
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_Map_Map_epilogue
pulsec_com_pulse_collections_Map_Map_epilogue:
pulsec_com_pulse_collections_Map_Map_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Map_Map endp

pulsec_com_pulse_collections_Map_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Map_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapSize
    jmp pulsec_com_pulse_collections_Map_size_epilogue
pulsec_com_pulse_collections_Map_size_epilogue:
pulsec_com_pulse_collections_Map_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Map_size endp

pulsec_com_pulse_collections_Map_clear proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Map_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapClear
    xor eax, eax
    jmp pulsec_com_pulse_collections_Map_clear_epilogue
pulsec_com_pulse_collections_Map_clear_epilogue:
pulsec_com_pulse_collections_Map_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Map_clear endp

pulsec_com_pulse_collections_Map_containsKey__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Map_containsKey__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapContainsKey
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_Map_containsKey__String_epilogue
pulsec_com_pulse_collections_Map_containsKey__String_epilogue:
pulsec_com_pulse_collections_Map_containsKey__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Map_containsKey__String endp

pulsec_com_pulse_collections_Map_put__String_String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_Map_put__String_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPut
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_Map_put__String_String_epilogue
pulsec_com_pulse_collections_Map_put__String_String_epilogue:
pulsec_com_pulse_collections_Map_put__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Map_put__String_String endp

pulsec_com_pulse_collections_Map_putInt__String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_Map_putInt__String_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_Map_putInt__String_int_epilogue
pulsec_com_pulse_collections_Map_putInt__String_int_epilogue:
pulsec_com_pulse_collections_Map_putInt__String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Map_putInt__String_int endp

pulsec_com_pulse_collections_Map_get__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Map_get__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGet
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_Map_get__String_epilogue
pulsec_com_pulse_collections_Map_get__String_epilogue:
pulsec_com_pulse_collections_Map_get__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Map_get__String endp

pulsec_com_pulse_collections_Map_getInt__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Map_getInt__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_Map_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_Map_getInt__String_epilogue
pulsec_com_pulse_collections_Map_getInt__String_epilogue:
pulsec_com_pulse_collections_Map_getInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Map_getInt__String endp

pulsec_com_pulse_collections_Queue_offer__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m65
    mov edx, trace_m65_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Queue_offer__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_offer__int_epilogue
pulsec_com_pulse_collections_Queue_offer__int_epilogue:
pulsec_com_pulse_collections_Queue_offer__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Queue_offer__int endp

pulsec_com_pulse_collections_Queue_poll proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m66
    mov edx, trace_m66_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Queue_poll_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_poll_epilogue
pulsec_com_pulse_collections_Queue_poll_epilogue:
pulsec_com_pulse_collections_Queue_poll_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Queue_poll endp

pulsec_com_pulse_collections_Queue_isEmpty proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m67
    mov edx, trace_m67_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Queue_isEmpty_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_isEmpty_epilogue
pulsec_com_pulse_collections_Queue_isEmpty_epilogue:
pulsec_com_pulse_collections_Queue_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Queue_isEmpty endp

pulsec_com_pulse_collections_Set_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m68
    mov edx, trace_m68_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Set_size_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Set_size_epilogue
pulsec_com_pulse_collections_Set_size_epilogue:
pulsec_com_pulse_collections_Set_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Set_size endp

pulsec_com_pulse_collections_Set_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m69
    mov edx, trace_m69_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_Set_clear_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Set_clear_epilogue
pulsec_com_pulse_collections_Set_clear_epilogue:
pulsec_com_pulse_collections_Set_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Set_clear endp

pulsec_com_pulse_collections_Set_add__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Set_add__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Set_add__String_epilogue
pulsec_com_pulse_collections_Set_add__String_epilogue:
pulsec_com_pulse_collections_Set_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Set_add__String endp

pulsec_com_pulse_collections_Set_contains__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_Set_contains__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Set_contains__String_epilogue
pulsec_com_pulse_collections_Set_contains__String_epilogue:
pulsec_com_pulse_collections_Set_contains__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Set_contains__String endp

pulsec_com_pulse_lang_Boolean_valueOf__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Boolean_valueOf__boolean_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue
pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue:
pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_valueOf__boolean endp

pulsec_com_pulse_lang_Boolean_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m73
    mov edx, trace_m73_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Boolean_parse__String_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_parseBoolean
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_Boolean_valueOf__boolean
    jmp pulsec_com_pulse_lang_Boolean_parse__String_epilogue
pulsec_com_pulse_lang_Boolean_parse__String_epilogue:
pulsec_com_pulse_lang_Boolean_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_parse__String endp

pulsec_com_pulse_lang_Boolean_booleanValue__Boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m74
    mov edx, trace_m74_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue:
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean endp

pulsec_com_pulse_lang_Boolean_equals__boolean_boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m75
    mov edx, trace_m75_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue:
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean endp

pulsec_com_pulse_lang_Boolean_compare__boolean_boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b1
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b2
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b2:
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3:
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5:
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6:
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue:
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean endp

pulsec_com_pulse_lang_Byte_valueOf__byte proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Byte_valueOf__byte_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Byte_valueOf__byte_epilogue
pulsec_com_pulse_lang_Byte_valueOf__byte_epilogue:
pulsec_com_pulse_lang_Byte_valueOf__byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Byte_valueOf__byte endp

pulsec_com_pulse_lang_Byte_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m78
    mov edx, trace_m78_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Byte_parse__String_b0:
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Byte]
    cmp eax, 63
    jae Byte_ctor_expr_sat_5
    add eax, 1
    jmp Byte_ctor_expr_done_5
Byte_ctor_expr_sat_5:
    mov eax, 63
Byte_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Byte], eax
    jmp pulsec_com_pulse_lang_Byte_parse__String_epilogue
pulsec_com_pulse_lang_Byte_parse__String_epilogue:
pulsec_com_pulse_lang_Byte_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Byte_parse__String endp

pulsec_com_pulse_lang_Byte_byteValue__Byte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m79
    mov edx, trace_m79_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Byte_byteValue__Byte_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Byte_byteValue__Byte_epilogue
pulsec_com_pulse_lang_Byte_byteValue__Byte_epilogue:
pulsec_com_pulse_lang_Byte_byteValue__Byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Byte_byteValue__Byte endp

pulsec_com_pulse_lang_Byte_equals__byte_byte proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m80
    mov edx, trace_m80_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Byte_equals__byte_byte_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Byte_equals__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_equals__byte_byte_epilogue:
pulsec_com_pulse_lang_Byte_equals__byte_byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Byte_equals__byte_byte endp

pulsec_com_pulse_lang_Byte_compare__byte_byte proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m81
    mov edx, trace_m81_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Byte_compare__byte_byte_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Byte_compare__byte_byte_b1
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b2
pulsec_com_pulse_lang_Byte_compare__byte_byte_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_compare__byte_byte_b2:
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b3
pulsec_com_pulse_lang_Byte_compare__byte_byte_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue:
pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Byte_compare__byte_byte endp

pulsec_com_pulse_lang_Char_valueOf__char proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Char_valueOf__char_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Char_valueOf__char_epilogue
pulsec_com_pulse_lang_Char_valueOf__char_epilogue:
pulsec_com_pulse_lang_Char_valueOf__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_valueOf__char endp

pulsec_com_pulse_lang_Char_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m83
    mov edx, trace_m83_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Char_parse__String_b0:
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Char]
    cmp eax, 63
    jae Char_ctor_expr_sat_5
    add eax, 1
    jmp Char_ctor_expr_done_5
Char_ctor_expr_sat_5:
    mov eax, 63
Char_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Char], eax
    jmp pulsec_com_pulse_lang_Char_parse__String_epilogue
pulsec_com_pulse_lang_Char_parse__String_epilogue:
pulsec_com_pulse_lang_Char_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_parse__String endp

pulsec_com_pulse_lang_Char_charValue__Char proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Char_charValue__Char_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Char_charValue__Char_epilogue
pulsec_com_pulse_lang_Char_charValue__Char_epilogue:
pulsec_com_pulse_lang_Char_charValue__Char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_charValue__Char endp

pulsec_com_pulse_lang_Char_equals__char_char proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m85
    mov edx, trace_m85_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_equals__char_char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Char_equals__char_char_epilogue
pulsec_com_pulse_lang_Char_equals__char_char_epilogue:
pulsec_com_pulse_lang_Char_equals__char_char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Char_equals__char_char endp

pulsec_com_pulse_lang_Char_compare__char_char proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m86
    mov edx, trace_m86_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_compare__char_char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Char_compare__char_char_b1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b2
pulsec_com_pulse_lang_Char_compare__char_char_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_b2:
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b3
pulsec_com_pulse_lang_Char_compare__char_char_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_epilogue:
pulsec_com_pulse_lang_Char_compare__char_char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Char_compare__char_char endp

pulsec_com_pulse_lang_Class_Class__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m87
    mov edx, trace_m87_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Class]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Class_Class__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Class_Class__String_ctor_sat_done
pulsec_com_pulse_lang_Class_Class__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Class_Class__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Class], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Class_Class__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Class_Class__String_epilogue
pulsec_com_pulse_lang_Class_Class__String_epilogue:
pulsec_com_pulse_lang_Class_Class__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Class_Class__String endp

pulsec_com_pulse_lang_Class_getName proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m88
    mov edx, trace_m88_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Class_getName_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Class_getName_epilogue
pulsec_com_pulse_lang_Class_getName_epilogue:
pulsec_com_pulse_lang_Class_getName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getName endp

pulsec_com_pulse_lang_Class_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m89
    mov edx, trace_m89_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Class_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Class_toString_epilogue
pulsec_com_pulse_lang_Class_toString_epilogue:
pulsec_com_pulse_lang_Class_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_toString endp

pulsec_com_pulse_lang_Comparable_compareTo__Object proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Comparable_compareTo__Object_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_Comparable_compareTo__Object_epilogue
pulsec_com_pulse_lang_Comparable_compareTo__Object_epilogue:
pulsec_com_pulse_lang_Comparable_compareTo__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Comparable_compareTo__Object endp

pulsec_com_pulse_lang_ConsoleWriter_println__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_println__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__String endp

pulsec_com_pulse_lang_ConsoleWriter_println__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_println__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__int endp

pulsec_com_pulse_lang_ConsoleWriter_println__boolean proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__boolean endp

pulsec_com_pulse_lang_ConsoleWriter_print__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m94
    mov edx, trace_m94_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_print__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__String endp

pulsec_com_pulse_lang_ConsoleWriter_print__int proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_print__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__int endp

pulsec_com_pulse_lang_ConsoleWriter_print__boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m96
    mov edx, trace_m96_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__boolean endp

pulsec_com_pulse_lang_Double_valueOf__double proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Double_valueOf__double_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Double_valueOf__double_epilogue
pulsec_com_pulse_lang_Double_valueOf__double_epilogue:
pulsec_com_pulse_lang_Double_valueOf__double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Double_valueOf__double endp

pulsec_com_pulse_lang_Double_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Double_parse__String_b0:
    lea rcx, msg24
    mov edx, msg24_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Double]
    cmp eax, 63
    jae Double_ctor_expr_sat_5
    add eax, 1
    jmp Double_ctor_expr_done_5
Double_ctor_expr_sat_5:
    mov eax, 63
Double_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Double], eax
    jmp pulsec_com_pulse_lang_Double_parse__String_epilogue
pulsec_com_pulse_lang_Double_parse__String_epilogue:
pulsec_com_pulse_lang_Double_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Double_parse__String endp

pulsec_com_pulse_lang_Double_doubleValue__Double proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m99
    mov edx, trace_m99_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Double_doubleValue__Double_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Double_doubleValue__Double_epilogue
pulsec_com_pulse_lang_Double_doubleValue__Double_epilogue:
pulsec_com_pulse_lang_Double_doubleValue__Double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Double_doubleValue__Double endp

pulsec_com_pulse_lang_Double_equals__double_double proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m100
    mov edx, trace_m100_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Double_equals__double_double_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Double_equals__double_double_epilogue
pulsec_com_pulse_lang_Double_equals__double_double_epilogue:
pulsec_com_pulse_lang_Double_equals__double_double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Double_equals__double_double endp

pulsec_com_pulse_lang_Double_compare__double_double proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Double_compare__double_double_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b1
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b2
pulsec_com_pulse_lang_Double_compare__double_double_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b2:
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b3
pulsec_com_pulse_lang_Double_compare__double_double_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_epilogue:
pulsec_com_pulse_lang_Double_compare__double_double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Double_compare__double_double endp

pulsec_com_pulse_lang_Exception_Exception proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Exception]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Exception_Exception_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Exception_Exception_ctor_sat_done
pulsec_com_pulse_lang_Exception_Exception_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Exception_Exception_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Exception], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Exception_Exception_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Exception_Exception_epilogue
pulsec_com_pulse_lang_Exception_Exception_epilogue:
pulsec_com_pulse_lang_Exception_Exception_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Exception_Exception endp

pulsec_com_pulse_lang_Exception_Exception__String proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Exception]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Exception_Exception__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Exception_Exception__String_ctor_sat_done
pulsec_com_pulse_lang_Exception_Exception__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Exception_Exception__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Exception], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Exception_Exception__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Exception_Exception__String_epilogue
pulsec_com_pulse_lang_Exception_Exception__String_epilogue:
pulsec_com_pulse_lang_Exception_Exception__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Exception_Exception__String endp

pulsec_com_pulse_lang_Exception_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m104
    mov edx, trace_m104_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Exception_toString_b0:
    lea rcx, msg25
    mov edx, msg25_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Exception_toString_epilogue
pulsec_com_pulse_lang_Exception_toString_epilogue:
pulsec_com_pulse_lang_Exception_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Exception_toString endp

pulsec_com_pulse_lang_Float_valueOf__float proc
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
pulsec_com_pulse_lang_Float_valueOf__float_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_valueOf__float_epilogue
pulsec_com_pulse_lang_Float_valueOf__float_epilogue:
pulsec_com_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_valueOf__float endp

pulsec_com_pulse_lang_Float_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m106
    mov edx, trace_m106_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Float_parse__String_b0:
    lea rcx, msg26
    mov edx, msg26_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Float]
    cmp eax, 63
    jae Float_ctor_expr_sat_5
    add eax, 1
    jmp Float_ctor_expr_done_5
Float_ctor_expr_sat_5:
    mov eax, 63
Float_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Float], eax
    jmp pulsec_com_pulse_lang_Float_parse__String_epilogue
pulsec_com_pulse_lang_Float_parse__String_epilogue:
pulsec_com_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_parse__String endp

pulsec_com_pulse_lang_Float_floatValue__Float proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m107
    mov edx, trace_m107_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Float_floatValue__Float_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_floatValue__Float_epilogue
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue:
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_floatValue__Float endp

pulsec_com_pulse_lang_Float_equals__float_float proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m108
    mov edx, trace_m108_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Float_equals__float_float_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Float_equals__float_float_epilogue
pulsec_com_pulse_lang_Float_equals__float_float_epilogue:
pulsec_com_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_equals__float_float endp

pulsec_com_pulse_lang_Float_compare__float_float proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m109
    mov edx, trace_m109_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Float_compare__float_float_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b2
pulsec_com_pulse_lang_Float_compare__float_float_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b2:
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b3
pulsec_com_pulse_lang_Float_compare__float_float_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_epilogue:
pulsec_com_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_compare__float_float endp

pulsec_com_pulse_lang_IO_println__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m110
    mov edx, trace_m110_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_println__String_b0:
    mov eax, dword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__String_epilogue
pulsec_com_pulse_lang_IO_println__String_epilogue:
pulsec_com_pulse_lang_IO_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__String endp

pulsec_com_pulse_lang_IO_println__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m111
    mov edx, trace_m111_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_println__int_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__int_epilogue
pulsec_com_pulse_lang_IO_println__int_epilogue:
pulsec_com_pulse_lang_IO_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__int endp

pulsec_com_pulse_lang_IO_println__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m112
    mov edx, trace_m112_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_println__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__boolean_epilogue
pulsec_com_pulse_lang_IO_println__boolean_epilogue:
pulsec_com_pulse_lang_IO_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__boolean endp

pulsec_com_pulse_lang_IO_print__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m113
    mov edx, trace_m113_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__String_b0:
    mov eax, dword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__String_epilogue
pulsec_com_pulse_lang_IO_print__String_epilogue:
pulsec_com_pulse_lang_IO_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__String endp

pulsec_com_pulse_lang_IO_print__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m114
    mov edx, trace_m114_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__int_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__int_epilogue
pulsec_com_pulse_lang_IO_print__int_epilogue:
pulsec_com_pulse_lang_IO_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__int endp

pulsec_com_pulse_lang_IO_print__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m115
    mov edx, trace_m115_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__boolean_epilogue
pulsec_com_pulse_lang_IO_print__boolean_epilogue:
pulsec_com_pulse_lang_IO_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__boolean endp

pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException proc
    sub rsp, 120
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalArgumentException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_ctor_sat_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalArgumentException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException endp

pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m117
    mov edx, trace_m117_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalArgumentException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_ctor_sat_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalArgumentException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String endp

pulsec_com_pulse_lang_IllegalArgumentException_toString proc
    sub rsp, 120
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
pulsec_com_pulse_lang_IllegalArgumentException_toString_b0:
    lea rcx, msg27
    mov edx, msg27_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_IllegalArgumentException_toString_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_toString_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IllegalArgumentException_toString endp

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m119
    mov edx, trace_m119_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException endp

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String endp

pulsec_com_pulse_lang_IllegalStateException_toString proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m121
    mov edx, trace_m121_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IllegalStateException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_IllegalStateException_toString_b1
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b2
pulsec_com_pulse_lang_IllegalStateException_toString_b1:
    lea rcx, msg28
    mov edx, msg28_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_b2:
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b3
pulsec_com_pulse_lang_IllegalStateException_toString_b3:
    lea rcx, msg29
    mov edx, msg29_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue:
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_toString endp

pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IndexOutOfBoundsException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_ctor_sat_done
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IndexOutOfBoundsException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_epilogue
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_epilogue:
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException endp

pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m123
    mov edx, trace_m123_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IndexOutOfBoundsException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_ctor_sat_done
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IndexOutOfBoundsException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_epilogue
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_epilogue:
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String endp

pulsec_com_pulse_lang_IndexOutOfBoundsException_toString proc
    sub rsp, 136
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
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b1
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b2
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b1:
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_epilogue
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b2:
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b3
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_b3:
    lea rcx, msg31
    mov edx, msg31_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_epilogue
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_epilogue:
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IndexOutOfBoundsException_toString endp

pulsec_com_pulse_lang_Integer_valueOf__int proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Integer_valueOf__int_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_valueOf__int_epilogue
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue:
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_valueOf__int endp

pulsec_com_pulse_lang_Integer_parse__String proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Integer_parse__String_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_parseInt
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_valueOf__int
    jmp pulsec_com_pulse_lang_Integer_parse__String_epilogue
pulsec_com_pulse_lang_Integer_parse__String_epilogue:
pulsec_com_pulse_lang_Integer_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_parse__String endp

pulsec_com_pulse_lang_Integer_intValue__Integer proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m127
    mov edx, trace_m127_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Integer_intValue__Integer_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue:
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_intValue__Integer endp

pulsec_com_pulse_lang_Integer_equals__int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m128
    mov edx, trace_m128_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_equals__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Integer_equals__int_int_epilogue
pulsec_com_pulse_lang_Integer_equals__int_int_epilogue:
pulsec_com_pulse_lang_Integer_equals__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Integer_equals__int_int endp

pulsec_com_pulse_lang_Integer_compare__int_int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m129
    mov edx, trace_m129_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_compare__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Integer_compare__int_int_b1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b2
pulsec_com_pulse_lang_Integer_compare__int_int_b1:
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b2:
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b3
pulsec_com_pulse_lang_Integer_compare__int_int_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Integer_compare__int_int_b4
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b5
pulsec_com_pulse_lang_Integer_compare__int_int_b4:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b5:
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b6
pulsec_com_pulse_lang_Integer_compare__int_int_b6:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue:
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Integer_compare__int_int endp

pulsec_com_pulse_lang_Iterable_iterator proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m130
    mov edx, trace_m130_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Iterable_iterator_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_Iterable_iterator_epilogue
pulsec_com_pulse_lang_Iterable_iterator_epilogue:
pulsec_com_pulse_lang_Iterable_iterator_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Iterable_iterator endp

pulsec_com_pulse_lang_Iterator_hasNext proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m131
    mov edx, trace_m131_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Iterator_hasNext_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_Iterator_hasNext_epilogue
pulsec_com_pulse_lang_Iterator_hasNext_epilogue:
pulsec_com_pulse_lang_Iterator_hasNext_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Iterator_hasNext endp

pulsec_com_pulse_lang_Iterator_next proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Iterator_next_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_Iterator_next_epilogue
pulsec_com_pulse_lang_Iterator_next_epilogue:
pulsec_com_pulse_lang_Iterator_next_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Iterator_next endp

pulsec_com_pulse_lang_Long_valueOf__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m133
    mov edx, trace_m133_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_valueOf__long_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Long_valueOf__long_epilogue
pulsec_com_pulse_lang_Long_valueOf__long_epilogue:
pulsec_com_pulse_lang_Long_valueOf__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_valueOf__long endp

pulsec_com_pulse_lang_Long_parse__String proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Long_parse__String_b0:
    lea rcx, msg32
    mov edx, msg32_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Long]
    cmp eax, 63
    jae Long_ctor_expr_sat_5
    add eax, 1
    jmp Long_ctor_expr_done_5
Long_ctor_expr_sat_5:
    mov eax, 63
Long_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Long], eax
    jmp pulsec_com_pulse_lang_Long_parse__String_epilogue
pulsec_com_pulse_lang_Long_parse__String_epilogue:
pulsec_com_pulse_lang_Long_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_parse__String endp

pulsec_com_pulse_lang_Long_longValue__Long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m135
    mov edx, trace_m135_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Long_longValue__Long_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Long_longValue__Long_epilogue
pulsec_com_pulse_lang_Long_longValue__Long_epilogue:
pulsec_com_pulse_lang_Long_longValue__Long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_longValue__Long endp

pulsec_com_pulse_lang_Long_equals__long_long proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_equals__long_long_b0:
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Long_equals__long_long_epilogue
pulsec_com_pulse_lang_Long_equals__long_long_epilogue:
pulsec_com_pulse_lang_Long_equals__long_long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Long_equals__long_long endp

pulsec_com_pulse_lang_Long_compare__long_long proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m137
    mov edx, trace_m137_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_compare__long_long_b0:
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Long_compare__long_long_b1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b2
pulsec_com_pulse_lang_Long_compare__long_long_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_b2:
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b3
pulsec_com_pulse_lang_Long_compare__long_long_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_epilogue:
pulsec_com_pulse_lang_Long_compare__long_long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Long_compare__long_long endp

pulsec_com_pulse_lang_NullPointerException_NullPointerException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m138
    mov edx, trace_m138_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_NullPointerException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_NullPointerException_NullPointerException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException_ctor_sat_done
pulsec_com_pulse_lang_NullPointerException_NullPointerException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_NullPointerException_NullPointerException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_NullPointerException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_NullPointerException_NullPointerException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException_epilogue
pulsec_com_pulse_lang_NullPointerException_NullPointerException_epilogue:
pulsec_com_pulse_lang_NullPointerException_NullPointerException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_NullPointerException_NullPointerException endp

pulsec_com_pulse_lang_NullPointerException_NullPointerException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m139
    mov edx, trace_m139_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_NullPointerException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_ctor_sat_done
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_NullPointerException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_epilogue
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_epilogue:
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String endp

pulsec_com_pulse_lang_NullPointerException_toString proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m140
    mov edx, trace_m140_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_NullPointerException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_NullPointerException_toString_b1
    jmp pulsec_com_pulse_lang_NullPointerException_toString_b2
pulsec_com_pulse_lang_NullPointerException_toString_b1:
    lea rcx, msg33
    mov edx, msg33_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_NullPointerException_toString_epilogue
pulsec_com_pulse_lang_NullPointerException_toString_b2:
    jmp pulsec_com_pulse_lang_NullPointerException_toString_b3
pulsec_com_pulse_lang_NullPointerException_toString_b3:
    lea rcx, msg34
    mov edx, msg34_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_NullPointerException_toString_epilogue
pulsec_com_pulse_lang_NullPointerException_toString_epilogue:
pulsec_com_pulse_lang_NullPointerException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NullPointerException_toString endp

pulsec_com_pulse_lang_NumberFormatException_NumberFormatException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m141
    mov edx, trace_m141_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_NumberFormatException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_ctor_sat_done
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_NumberFormatException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_epilogue
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_epilogue:
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException endp

pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m142
    mov edx, trace_m142_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_NumberFormatException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_ctor_sat_done
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_NumberFormatException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_epilogue
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_epilogue:
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String endp

pulsec_com_pulse_lang_NumberFormatException_toString proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m143
    mov edx, trace_m143_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_NumberFormatException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_NumberFormatException_toString_b1
    jmp pulsec_com_pulse_lang_NumberFormatException_toString_b2
pulsec_com_pulse_lang_NumberFormatException_toString_b1:
    lea rcx, msg35
    mov edx, msg35_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_NumberFormatException_toString_epilogue
pulsec_com_pulse_lang_NumberFormatException_toString_b2:
    jmp pulsec_com_pulse_lang_NumberFormatException_toString_b3
pulsec_com_pulse_lang_NumberFormatException_toString_b3:
    lea rcx, msg36
    mov edx, msg36_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_NumberFormatException_toString_epilogue
pulsec_com_pulse_lang_NumberFormatException_toString_epilogue:
pulsec_com_pulse_lang_NumberFormatException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NumberFormatException_toString endp

pulsec_com_pulse_lang_Object_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m144
    mov edx, trace_m144_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Object_toString_b0:
    lea rcx, msg37
    mov edx, msg37_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Object_toString_epilogue
pulsec_com_pulse_lang_Object_toString_epilogue:
pulsec_com_pulse_lang_Object_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_toString endp

pulsec_com_pulse_lang_Object_equals__Object proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m145
    mov edx, trace_m145_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Object_equals__Object_b0:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Object_equals__Object_epilogue
pulsec_com_pulse_lang_Object_equals__Object_epilogue:
pulsec_com_pulse_lang_Object_equals__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Object_equals__Object endp

pulsec_com_pulse_lang_Object_getClass proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m146
    mov edx, trace_m146_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Object_getClass_b0:
    lea rcx, msg38
    mov edx, msg38_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    call pulsec_com_pulse_lang_Class_Class__String
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Object_getClass_epilogue
pulsec_com_pulse_lang_Object_getClass_epilogue:
pulsec_com_pulse_lang_Object_getClass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_getClass endp

pulsec_com_pulse_lang_PrintStream_println__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m147
    mov edx, trace_m147_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_println__String_b0:
    mov eax, dword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_println__String_epilogue
pulsec_com_pulse_lang_PrintStream_println__String_epilogue:
pulsec_com_pulse_lang_PrintStream_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_println__String endp

pulsec_com_pulse_lang_PrintStream_println__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m148
    mov edx, trace_m148_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_println__int_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_println__int_epilogue
pulsec_com_pulse_lang_PrintStream_println__int_epilogue:
pulsec_com_pulse_lang_PrintStream_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_println__int endp

pulsec_com_pulse_lang_PrintStream_println__boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m149
    mov edx, trace_m149_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_println__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_println__boolean_epilogue
pulsec_com_pulse_lang_PrintStream_println__boolean_epilogue:
pulsec_com_pulse_lang_PrintStream_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_println__boolean endp

pulsec_com_pulse_lang_PrintStream_print__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m150
    mov edx, trace_m150_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_print__String_b0:
    mov eax, dword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_print__String_epilogue
pulsec_com_pulse_lang_PrintStream_print__String_epilogue:
pulsec_com_pulse_lang_PrintStream_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_print__String endp

pulsec_com_pulse_lang_PrintStream_print__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m151
    mov edx, trace_m151_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_print__int_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_print__int_epilogue
pulsec_com_pulse_lang_PrintStream_print__int_epilogue:
pulsec_com_pulse_lang_PrintStream_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_print__int endp

pulsec_com_pulse_lang_PrintStream_print__boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m152
    mov edx, trace_m152_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_PrintStream_print__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_PrintStream_print__boolean_epilogue
pulsec_com_pulse_lang_PrintStream_print__boolean_epilogue:
pulsec_com_pulse_lang_PrintStream_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_PrintStream_print__boolean endp

pulsec_com_pulse_lang_RuntimeException_RuntimeException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m153
    mov edx, trace_m153_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_RuntimeException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_RuntimeException_RuntimeException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException_ctor_sat_done
pulsec_com_pulse_lang_RuntimeException_RuntimeException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_RuntimeException_RuntimeException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_RuntimeException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_RuntimeException_RuntimeException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException_epilogue
pulsec_com_pulse_lang_RuntimeException_RuntimeException_epilogue:
pulsec_com_pulse_lang_RuntimeException_RuntimeException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_RuntimeException_RuntimeException endp

pulsec_com_pulse_lang_RuntimeException_RuntimeException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m154
    mov edx, trace_m154_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_RuntimeException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_ctor_sat_done
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_RuntimeException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_epilogue
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_epilogue:
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String endp

pulsec_com_pulse_lang_RuntimeException_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m155
    mov edx, trace_m155_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_RuntimeException_toString_b0:
    lea rcx, msg39
    mov edx, msg39_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_RuntimeException_toString_epilogue
pulsec_com_pulse_lang_RuntimeException_toString_epilogue:
pulsec_com_pulse_lang_RuntimeException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_RuntimeException_toString endp

pulsec_com_pulse_lang_Short_valueOf__short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m156
    mov edx, trace_m156_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_valueOf__short_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Short_valueOf__short_epilogue
pulsec_com_pulse_lang_Short_valueOf__short_epilogue:
pulsec_com_pulse_lang_Short_valueOf__short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_valueOf__short endp

pulsec_com_pulse_lang_Short_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m157
    mov edx, trace_m157_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_parse__String_b0:
    lea rcx, msg40
    mov edx, msg40_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Short]
    cmp eax, 63
    jae Short_ctor_expr_sat_5
    add eax, 1
    jmp Short_ctor_expr_done_5
Short_ctor_expr_sat_5:
    mov eax, 63
Short_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Short], eax
    jmp pulsec_com_pulse_lang_Short_parse__String_epilogue
pulsec_com_pulse_lang_Short_parse__String_epilogue:
pulsec_com_pulse_lang_Short_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_parse__String endp

pulsec_com_pulse_lang_Short_shortValue__Short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m158
    mov edx, trace_m158_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_shortValue__Short_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Short_shortValue__Short_epilogue
pulsec_com_pulse_lang_Short_shortValue__Short_epilogue:
pulsec_com_pulse_lang_Short_shortValue__Short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_shortValue__Short endp

pulsec_com_pulse_lang_Short_equals__short_short proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m159
    mov edx, trace_m159_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_equals__short_short_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Short_equals__short_short_epilogue
pulsec_com_pulse_lang_Short_equals__short_short_epilogue:
pulsec_com_pulse_lang_Short_equals__short_short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Short_equals__short_short endp

pulsec_com_pulse_lang_Short_compare__short_short proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m160
    mov edx, trace_m160_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_compare__short_short_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Short_compare__short_short_b1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b2
pulsec_com_pulse_lang_Short_compare__short_short_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_b2:
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b3
pulsec_com_pulse_lang_Short_compare__short_short_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_epilogue:
pulsec_com_pulse_lang_Short_compare__short_short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Short_compare__short_short endp

pulsec_com_pulse_lang_String_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m161
    mov edx, trace_m161_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_length_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_stringLength
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
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
    lea rcx, trace_m162
    mov edx, trace_m162_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_isEmpty_b0:
    mov ecx, dword ptr [rsp+64]
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
    lea rcx, trace_m163
    mov edx, trace_m163_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_String_concat__String_b0:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+88]
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

pulsec_com_pulse_lang_String_valueOf__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m164
    mov edx, trace_m164_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__int_b0:
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
    lea rcx, trace_m165
    mov edx, trace_m165_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__boolean_b0:
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

pulsec_com_pulse_lang_StringBuilder_StringBuilder proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m166
    mov edx, trace_m166_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_StringBuilder]
    cmp eax, 63
    jae pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat_done
pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_StringBuilder], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_StringBuilder_b0:
    lea rcx, msg41
    mov edx, msg41_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue
pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue:
pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder endp

pulsec_com_pulse_lang_StringBuilder_StringBuilder__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m167
    mov edx, trace_m167_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_StringBuilder]
    cmp eax, 63
    jae pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat_done
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_StringBuilder], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String endp

pulsec_com_pulse_lang_StringBuilder_append__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m168
    mov edx, trace_m168_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_append__String_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__String_epilogue
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__String endp

pulsec_com_pulse_lang_StringBuilder_append__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m169
    mov edx, trace_m169_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_append__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__int_epilogue
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__int endp

pulsec_com_pulse_lang_StringBuilder_append__boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m170
    mov edx, trace_m170_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_append__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__boolean endp

pulsec_com_pulse_lang_StringBuilder_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m171
    mov edx, trace_m171_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_length_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    jmp pulsec_com_pulse_lang_StringBuilder_length_epilogue
pulsec_com_pulse_lang_StringBuilder_length_epilogue:
pulsec_com_pulse_lang_StringBuilder_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_length endp

pulsec_com_pulse_lang_StringBuilder_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m172
    mov edx, trace_m172_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_clear_b0:
    lea rcx, msg42
    mov edx, msg42_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_lang_StringBuilder_clear_epilogue
pulsec_com_pulse_lang_StringBuilder_clear_epilogue:
pulsec_com_pulse_lang_StringBuilder_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_clear endp

pulsec_com_pulse_lang_StringBuilder_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m173
    mov edx, trace_m173_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_StringBuilder_toString_epilogue
pulsec_com_pulse_lang_StringBuilder_toString_epilogue:
pulsec_com_pulse_lang_StringBuilder_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_toString endp

pulsec_com_pulse_lang_Throwable_Throwable proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m174
    mov edx, trace_m174_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Throwable]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat_done
pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Throwable], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Throwable_Throwable_b0:
    lea rcx, msg43
    mov edx, msg43_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Throwable_Throwable_epilogue
pulsec_com_pulse_lang_Throwable_Throwable_epilogue:
pulsec_com_pulse_lang_Throwable_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_Throwable endp

pulsec_com_pulse_lang_Throwable_Throwable__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m175
    mov edx, trace_m175_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Throwable]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat_done
pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Throwable], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Throwable_Throwable__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue
pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue:
pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Throwable_Throwable__String endp

pulsec_com_pulse_lang_Throwable_getMessage proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m176
    mov edx, trace_m176_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Throwable_getMessage_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Throwable_getMessage_epilogue
pulsec_com_pulse_lang_Throwable_getMessage_epilogue:
pulsec_com_pulse_lang_Throwable_getMessage_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_getMessage endp

pulsec_com_pulse_lang_Throwable_toString proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m177
    mov edx, trace_m177_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Throwable_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_toString_b1
    jmp pulsec_com_pulse_lang_Throwable_toString_b2
pulsec_com_pulse_lang_Throwable_toString_b1:
    lea rcx, msg44
    mov edx, msg44_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Throwable_toString_epilogue
pulsec_com_pulse_lang_Throwable_toString_b2:
    jmp pulsec_com_pulse_lang_Throwable_toString_b3
pulsec_com_pulse_lang_Throwable_toString_b3:
    lea rcx, msg45
    mov edx, msg45_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_lang_Throwable_toString_epilogue
pulsec_com_pulse_lang_Throwable_toString_epilogue:
pulsec_com_pulse_lang_Throwable_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Throwable_toString endp

pulsec_com_pulse_lang_UByte_valueOf__ubyte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m178
    mov edx, trace_m178_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UByte_valueOf__ubyte_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue
pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue:
pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UByte_valueOf__ubyte endp

pulsec_com_pulse_lang_UByte_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m179
    mov edx, trace_m179_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UByte_parse__String_b0:
    lea rcx, msg46
    mov edx, msg46_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_UByte]
    cmp eax, 63
    jae UByte_ctor_expr_sat_5
    add eax, 1
    jmp UByte_ctor_expr_done_5
UByte_ctor_expr_sat_5:
    mov eax, 63
UByte_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_UByte], eax
    jmp pulsec_com_pulse_lang_UByte_parse__String_epilogue
pulsec_com_pulse_lang_UByte_parse__String_epilogue:
pulsec_com_pulse_lang_UByte_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UByte_parse__String endp

pulsec_com_pulse_lang_UByte_ubyteValue__UByte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m180
    mov edx, trace_m180_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue:
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UByte_ubyteValue__UByte endp

pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m181
    mov edx, trace_m181_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue:
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte endp

pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m182
    mov edx, trace_m182_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2:
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue:
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte endp

pulsec_com_pulse_lang_UInteger_valueOf__uint proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m183
    mov edx, trace_m183_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_valueOf__uint_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue
pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue:
pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_valueOf__uint endp

pulsec_com_pulse_lang_UInteger_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m184
    mov edx, trace_m184_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_parse__String_b0:
    lea rcx, msg47
    mov edx, msg47_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_UInteger]
    cmp eax, 63
    jae UInteger_ctor_expr_sat_5
    add eax, 1
    jmp UInteger_ctor_expr_done_5
UInteger_ctor_expr_sat_5:
    mov eax, 63
UInteger_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_UInteger], eax
    jmp pulsec_com_pulse_lang_UInteger_parse__String_epilogue
pulsec_com_pulse_lang_UInteger_parse__String_epilogue:
pulsec_com_pulse_lang_UInteger_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_parse__String endp

pulsec_com_pulse_lang_UInteger_uintValue__UInteger proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m185
    mov edx, trace_m185_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue:
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_uintValue__UInteger endp

pulsec_com_pulse_lang_UInteger_equals__uint_uint proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m186
    mov edx, trace_m186_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UInteger_equals__uint_uint_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue:
pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UInteger_equals__uint_uint endp

pulsec_com_pulse_lang_UInteger_compare__uint_uint proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m187
    mov edx, trace_m187_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2:
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue:
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UInteger_compare__uint_uint endp

pulsec_com_pulse_lang_ULong_valueOf__ulong proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m188
    mov edx, trace_m188_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_valueOf__ulong_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue
pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue:
pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_ULong_valueOf__ulong endp

pulsec_com_pulse_lang_ULong_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m189
    mov edx, trace_m189_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_ULong_parse__String_b0:
    lea rcx, msg48
    mov edx, msg48_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_ULong]
    cmp eax, 63
    jae ULong_ctor_expr_sat_5
    add eax, 1
    jmp ULong_ctor_expr_done_5
ULong_ctor_expr_sat_5:
    mov eax, 63
ULong_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_ULong], eax
    jmp pulsec_com_pulse_lang_ULong_parse__String_epilogue
pulsec_com_pulse_lang_ULong_parse__String_epilogue:
pulsec_com_pulse_lang_ULong_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_ULong_parse__String endp

pulsec_com_pulse_lang_ULong_ulongValue__ULong proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m190
    mov edx, trace_m190_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_ULong_ulongValue__ULong_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue
pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue:
pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_ULong_ulongValue__ULong endp

pulsec_com_pulse_lang_ULong_equals__ulong_ulong proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m191
    mov edx, trace_m191_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue:
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ULong_equals__ulong_ulong endp

pulsec_com_pulse_lang_ULong_compare__ulong_ulong proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m192
    mov edx, trace_m192_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2:
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue:
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ULong_compare__ulong_ulong endp

pulsec_com_pulse_lang_UShort_valueOf__ushort proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m193
    mov edx, trace_m193_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UShort_valueOf__ushort_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue
pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue:
pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_valueOf__ushort endp

pulsec_com_pulse_lang_UShort_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m194
    mov edx, trace_m194_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UShort_parse__String_b0:
    lea rcx, msg49
    mov edx, msg49_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_UShort]
    cmp eax, 63
    jae UShort_ctor_expr_sat_5
    add eax, 1
    jmp UShort_ctor_expr_done_5
UShort_ctor_expr_sat_5:
    mov eax, 63
UShort_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_UShort], eax
    jmp pulsec_com_pulse_lang_UShort_parse__String_epilogue
pulsec_com_pulse_lang_UShort_parse__String_epilogue:
pulsec_com_pulse_lang_UShort_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_parse__String endp

pulsec_com_pulse_lang_UShort_ushortValue__UShort proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m195
    mov edx, trace_m195_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UShort_ushortValue__UShort_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue
pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue:
pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_ushortValue__UShort endp

pulsec_com_pulse_lang_UShort_equals__ushort_ushort proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m196
    mov edx, trace_m196_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue:
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UShort_equals__ushort_ushort endp

pulsec_com_pulse_lang_UShort_compare__ushort_ushort proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m197
    mov edx, trace_m197_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2:
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue:
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UShort_compare__ushort_ushort endp

pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m198
    mov edx, trace_m198_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_UnsupportedOperationException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_ctor_sat_done
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_UnsupportedOperationException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_epilogue
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_epilogue:
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException endp

pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m199
    mov edx, trace_m199_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_UnsupportedOperationException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_ctor_sat_done
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_UnsupportedOperationException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_epilogue
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_epilogue:
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String endp

pulsec_com_pulse_lang_UnsupportedOperationException_toString proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m200
    mov edx, trace_m200_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_UnsupportedOperationException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UnsupportedOperationException_toString_b1
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_toString_b2
pulsec_com_pulse_lang_UnsupportedOperationException_toString_b1:
    lea rcx, msg50
    mov edx, msg50_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_toString_epilogue
pulsec_com_pulse_lang_UnsupportedOperationException_toString_b2:
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_toString_b3
pulsec_com_pulse_lang_UnsupportedOperationException_toString_b3:
    lea rcx, msg51
    mov edx, msg51_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_toString_epilogue
pulsec_com_pulse_lang_UnsupportedOperationException_toString_epilogue:
pulsec_com_pulse_lang_UnsupportedOperationException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UnsupportedOperationException_toString endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m201
    mov edx, trace_m201_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m202
    mov edx, trace_m202_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m203
    mov edx, trace_m203_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m204
    mov edx, trace_m204_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m205
    mov edx, trace_m205_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m206
    mov edx, trace_m206_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean endp

pulsec_com_pulse_rt_Intrinsics_panic__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m207
    mov edx, trace_m207_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_panic__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_panic__String endp

pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m208
    mov edx, trace_m208_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_b0:
    lea rcx, msg52
    mov edx, msg52_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String endp

pulsec_com_pulse_rt_Intrinsics_stringLength__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m209
    mov edx, trace_m209_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_stringLength__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_stringLength__String endp

pulsec_com_pulse_rt_Intrinsics_intToString__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m210
    mov edx, trace_m210_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_intToString__int_b0:
    lea rcx, msg53
    mov edx, msg53_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_intToString__int endp

pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m211
    mov edx, trace_m211_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_b0:
    lea rcx, msg54
    mov edx, msg54_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean endp

pulsec_com_pulse_rt_Intrinsics_parseInt__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m212
    mov edx, trace_m212_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_parseInt__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseInt__String endp

pulsec_com_pulse_rt_Intrinsics_parseBoolean__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m213
    mov edx, trace_m213_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String endp

pulsec_com_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m214
    mov edx, trace_m214_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayNew__int endp

pulsec_com_pulse_rt_Intrinsics_arrayLength__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m215
    mov edx, trace_m215_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayLength__long endp

pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m216
    mov edx, trace_m216_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m217
    mov edx, trace_m217_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int endp

pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m218
    mov edx, trace_m218_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_b0:
    lea rcx, msg55
    mov edx, msg55_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m219
    mov edx, trace_m219_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String endp

pulsec_com_pulse_rt_Intrinsics_listNew proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m220
    mov edx, trace_m220_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_listNew_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listNew_epilogue
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listNew endp

pulsec_com_pulse_rt_Intrinsics_listSize__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m221
    mov edx, trace_m221_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_listSize__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listSize__long endp

pulsec_com_pulse_rt_Intrinsics_listClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m222
    mov edx, trace_m222_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_listClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listClear__long endp

pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m223
    mov edx, trace_m223_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listAddString__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m224
    mov edx, trace_m224_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String endp

pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m225
    mov edx, trace_m225_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m226
    mov edx, trace_m226_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_b0:
    lea rcx, msg56
    mov edx, msg56_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_mapNew proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m227
    mov edx, trace_m227_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_mapNew_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapNew endp

pulsec_com_pulse_rt_Intrinsics_mapSize__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m228
    mov edx, trace_m228_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapSize__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapSize__long endp

pulsec_com_pulse_rt_Intrinsics_mapClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m229
    mov edx, trace_m229_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapClear__long endp

pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m230
    mov edx, trace_m230_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m231
    mov edx, trace_m231_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String endp

pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m232
    mov edx, trace_m232_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int endp

pulsec_com_pulse_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m233
    mov edx, trace_m233_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_b0:
    lea rcx, msg57
    mov edx, msg57_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m234
    mov edx, trace_m234_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String endp

pulsec_com_pulse_rt_Intrinsics_arcRetain__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m235
    mov edx, trace_m235_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRetain__long endp

pulsec_com_pulse_rt_Intrinsics_arcRelease__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m236
    mov edx, trace_m236_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRelease__long endp

pulsec_com_pulse_rt_Intrinsics_arcRelease__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m237
    mov edx, trace_m237_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRelease__String endp

pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m238
    mov edx, trace_m238_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass endp

pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m239
    mov edx, trace_m239_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass endp

pulsec_com_pulse_rt_Intrinsics_arcCycleTick proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m240
    mov edx, trace_m240_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleTick endp

pulsec_com_pulse_rt_Intrinsics_weakNew__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m241
    mov edx, trace_m241_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_weakNew__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue
pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakNew__String endp

pulsec_com_pulse_rt_Intrinsics_weakGet__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m242
    mov edx, trace_m242_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_weakGet__long_b0:
    lea rcx, msg58
    mov edx, msg58_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue
pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakGet__long endp

pulsec_com_pulse_rt_Intrinsics_weakClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m243
    mov edx, trace_m243_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_weakClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakClear__long endp

pulsec_rt_arcCycleFullPass proc
    xor r11d, r11d
    mov r8d, 1
pulsec_rt_arcCycleFullPass_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_done
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    jne pulsec_rt_arcCycleFullPass_next
    cmp dword ptr [rt_arc_kinds+r8*4], 0
    je pulsec_rt_arcCycleFullPass_next
    mov ecx, r8d
    call pulsec_rt_arcTeardown
    add r11d, 1
pulsec_rt_arcCycleFullPass_next:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_loop
pulsec_rt_arcCycleFullPass_done:
    mov eax, r11d
    ret
pulsec_rt_arcCycleFullPass endp

pulsec_rt_arcCycleTick proc
    mov eax, dword ptr [rt_arc_cycle_epoch]
    add eax, 1
    mov dword ptr [rt_arc_cycle_epoch], eax
    mov edx, eax
    and edx, 7
    cmp edx, 0
    je pulsec_rt_arcCycleTick_full
    call pulsec_rt_arcCycleYoungPass
    jmp pulsec_rt_arcCycleTick_after_pass
pulsec_rt_arcCycleTick_full:
    call pulsec_rt_arcCycleFullPass
pulsec_rt_arcCycleTick_after_pass:
    mov dword ptr [rt_arc_cycle_last_reclaimed], eax
    cmp eax, 0
    je pulsec_rt_arcCycleTick_update_lag
pulsec_rt_arcCycleTick_reset_lag:
    mov dword ptr [rt_arc_cycle_zero_reclaim_streak], 0
    mov eax, dword ptr [rt_arc_cycle_last_reclaimed]
    ret
pulsec_rt_arcCycleTick_update_lag:
    mov eax, dword ptr [rt_arc_cycle_zero_reclaim_streak]
    add eax, 1
    cmp eax, 1024
    jbe @F
    mov eax, 1024
@@:
    mov dword ptr [rt_arc_cycle_zero_reclaim_streak], eax
    xor eax, eax
    ret
pulsec_rt_arcCycleTick endp

pulsec_rt_arcCycleYoungPass proc
    xor r11d, r11d
    mov r8d, dword ptr [rt_arc_cycle_young_cursor]
    cmp r8d, 1
    jb pulsec_rt_arcCycleYoungPass_wrap
    cmp r8d, dword ptr [rt_slot_capacity]
    jbe pulsec_rt_arcCycleYoungPass_init
pulsec_rt_arcCycleYoungPass_wrap:
    mov r8d, 1
pulsec_rt_arcCycleYoungPass_init:
    mov r9d, 64
pulsec_rt_arcCycleYoungPass_loop:
    cmp r9d, 0
    je pulsec_rt_arcCycleYoungPass_done
    cmp r8d, dword ptr [rt_slot_capacity]
    jbe pulsec_rt_arcCycleYoungPass_scan
    mov r8d, 1
pulsec_rt_arcCycleYoungPass_scan:
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    jne pulsec_rt_arcCycleYoungPass_next
    cmp dword ptr [rt_arc_kinds+r8*4], 0
    je pulsec_rt_arcCycleYoungPass_next
    mov ecx, r8d
    call pulsec_rt_arcTeardown
    add r11d, 1
pulsec_rt_arcCycleYoungPass_next:
    add r8d, 1
    sub r9d, 1
    jmp pulsec_rt_arcCycleYoungPass_loop
pulsec_rt_arcCycleYoungPass_done:
    cmp r8d, dword ptr [rt_slot_capacity]
    jbe pulsec_rt_arcCycleYoungPass_store
    mov r8d, 1
pulsec_rt_arcCycleYoungPass_store:
    mov dword ptr [rt_arc_cycle_young_cursor], r8d
    mov eax, r11d
    ret
pulsec_rt_arcCycleYoungPass endp

pulsec_rt_arcRelease proc
    cmp ecx, 0
    je pulsec_rt_arcRelease_done
    mov r8d, ecx
    cmp r8d, 1
    jb pulsec_rt_arcRelease_debug_invalid
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcRelease_debug_invalid
    mov r9, rcx
    shr r9, 32
    test r9d, r9d
    jz pulsec_rt_arcRelease_valid
    cmp r9d, dword ptr [rt_arc_generation+r8*4]
    jne pulsec_rt_arcRelease_debug_invalid
pulsec_rt_arcRelease_valid:
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    test eax, eax
    jz pulsec_rt_arcRelease_debug_invalid
    sub eax, 1
    mov dword ptr [rt_arc_refcounts+r8*4], eax
    test eax, eax
    jnz pulsec_rt_arcRelease_done
    mov ecx, r8d
    call pulsec_rt_arcTeardown
pulsec_rt_arcRelease_done:
    xor eax, eax
    ret
pulsec_rt_arcRelease_debug_invalid:
    cmp dword ptr [rt_debug_alloc_mode], 0
    je pulsec_rt_arcRelease_debug_skip
    sub rsp, 40
    lea rcx, rt_debug_arc_release_err
    mov edx, rt_debug_arc_release_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
pulsec_rt_arcRelease_debug_skip:
    xor eax, eax
    ret
pulsec_rt_arcRelease endp

pulsec_rt_arcRetain proc
    mov rax, rcx
    cmp ecx, 0
    je pulsec_rt_arcRetain_done
    mov r8d, ecx
    cmp r8d, 1
    jb pulsec_rt_arcRetain_debug_invalid
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcRetain_debug_invalid
    mov r9, rcx
    shr r9, 32
    test r9d, r9d
    jz pulsec_rt_arcRetain_valid
    cmp r9d, dword ptr [rt_arc_generation+r8*4]
    jne pulsec_rt_arcRetain_debug_invalid
pulsec_rt_arcRetain_valid:
    mov edx, dword ptr [rt_arc_refcounts+r8*4]
    test edx, edx
    jz pulsec_rt_arcRetain_debug_invalid
    cmp edx, 4294967294
    jae pulsec_rt_arcRetain_saturation
    add edx, 1
    mov dword ptr [rt_arc_refcounts+r8*4], edx
pulsec_rt_arcRetain_skip_inc:
pulsec_rt_arcRetain_done:
    ret
pulsec_rt_arcRetain_saturation:
    sub rsp, 40
    lea rcx, rt_arc_refcount_saturation_err
    mov edx, rt_arc_refcount_saturation_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    jmp pulsec_rt_arcRetain_done
pulsec_rt_arcRetain_debug_invalid:
    cmp dword ptr [rt_debug_alloc_mode], 0
    je pulsec_rt_arcRetain_debug_skip
    sub rsp, 40
    lea rcx, rt_debug_arc_retain_err
    mov edx, rt_debug_arc_retain_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
pulsec_rt_arcRetain_debug_skip:
    jmp pulsec_rt_arcRetain_done
pulsec_rt_arcRetain endp

pulsec_rt_arrayGetInt proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arrayGetInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arrayGetInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arrayGetInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arrayGetInt_live_panic
pulsec_rt_arrayGetInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arrayGetInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arrayGetInt_live_panic
    jmp pulsec_rt_arrayGetInt_ok
pulsec_rt_arrayGetInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arrayGetInt_ok:
    mov ecx, r10d
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_arr_len_ptr]
    mov r8d, dword ptr [rax+rcx*4]
    cmp edx, r8d
    jae @F
    mov r11, qword ptr [rt_arr_i_ptr_ptr]
    mov r9, qword ptr [r11+rcx*8]
    test r9, r9
    jz @F
    mov eax, dword ptr [r9+rdx*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_arrayGetInt endp

pulsec_rt_arrayGetString proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arrayGetString_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arrayGetString_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arrayGetString_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arrayGetString_live_panic
pulsec_rt_arrayGetString_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arrayGetString_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arrayGetString_live_panic
    jmp pulsec_rt_arrayGetString_ok
pulsec_rt_arrayGetString_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arrayGetString_ok:
    mov ecx, r10d
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_arr_len_ptr]
    mov r8d, dword ptr [rax+rcx*4]
    cmp edx, r8d
    jae @F
    mov r11, qword ptr [rt_arr_s_ptr_ptr]
    mov r9, qword ptr [r11+rcx*8]
    test r9, r9
    jz @F
    mov eax, dword ptr [r9+rdx*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_arrayGetString endp

pulsec_rt_arrayLength proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arrayLength_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arrayLength_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arrayLength_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arrayLength_live_panic
pulsec_rt_arrayLength_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arrayLength_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arrayLength_live_panic
    jmp pulsec_rt_arrayLength_ok
pulsec_rt_arrayLength_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arrayLength_ok:
    mov ecx, r10d
    mov rax, qword ptr [rt_arr_len_ptr]
    mov eax, dword ptr [rax+rcx*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_arrayLength endp

pulsec_rt_arrayNew proc
    cmp ecx, 0
    jge @F
    xor ecx, ecx
@@:
    mov dword ptr [rt_tmp_arr_len], ecx
    mov eax, dword ptr [rt_arc_free_head]
    cmp eax, 1
    jb pulsec_rt_arrayNew_allocslot_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arrayNew_allocslot_fresh
    mov r9d, eax
    mov eax, dword ptr [rt_arc_free_next+r9*4]
    mov dword ptr [rt_arc_free_head], eax
    mov eax, r9d
    mov dword ptr [rt_arc_free_next+rax*4], 0
    jmp pulsec_rt_arrayNew_allocslot_done
pulsec_rt_arrayNew_allocslot_fresh:
    mov eax, dword ptr [rt_handle_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_arrayNew_allocslot_have_room
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    cmp eax, 0
    jne pulsec_rt_arrayNew_done
    mov eax, dword ptr [rt_handle_next]
pulsec_rt_arrayNew_allocslot_have_room:
    add eax, 1
    mov dword ptr [rt_handle_next], eax
pulsec_rt_arrayNew_allocslot_done:
    mov dword ptr [rt_tmp_arr_slot], eax
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov edx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_arr_len_ptr]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_arr_alive_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov rax, qword ptr [rt_arr_i_ptr_ptr]
    mov qword ptr [rax+rcx*8], 0
    mov rax, qword ptr [rt_arr_s_ptr_ptr]
    mov qword ptr [rax+rcx*8], 0
    cmp edx, 0
    je pulsec_rt_arrayNew_alloc_done
    mov eax, edx
    cmp eax, 2147483647
    ja pulsec_rt_arrayNew_alloc_fail
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_arrayNew_alloc_fail
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_arr_i_ptr_ptr]
    mov qword ptr [r11+rcx*8], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_arrayNew_alloc_fail_free_i
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_arr_s_ptr_ptr]
    mov qword ptr [r11+rcx*8], rax
pulsec_rt_arrayNew_alloc_done:
    mov edx, dword ptr [rt_arr_count]
    add edx, 1
    mov dword ptr [rt_arr_count], edx
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_arr_alive_ptr]
    mov dword ptr [rax+rcx*4], 1
    mov dword ptr [rt_arc_kinds+rcx*4], 2
    mov dword ptr [rt_arc_refcounts+rcx*4], 1
    mov dword ptr [rt_arc_flags+rcx*4], 0
    mov dword ptr [rt_arc_meta+rcx*4], 0
    mov edx, dword ptr [rt_arc_generation+rcx*4]
    add edx, 1
    jnz @F
    sub rsp, 40
    lea rcx, rt_arc_gen_overflow_err
    mov edx, rt_arc_gen_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
@@:
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov dword ptr [rt_arc_generation+rcx*4], edx
    mov eax, ecx
    shl rdx, 32
    or rax, rdx
    ret
pulsec_rt_arrayNew_alloc_fail_free_i:
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_arr_i_ptr_ptr]
    mov r11, qword ptr [rax+rcx*8]
    mov qword ptr [rax+rcx*8], 0
    test r11, r11
    jz pulsec_rt_arrayNew_alloc_fail
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_arrayNew_alloc_fail:
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_arr_len_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov rax, qword ptr [rt_arr_alive_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov rax, qword ptr [rt_arr_i_ptr_ptr]
    mov qword ptr [rax+rcx*8], 0
    mov rax, qword ptr [rt_arr_s_ptr_ptr]
    mov qword ptr [rax+rcx*8], 0
    mov dword ptr [rt_arc_refcounts+rcx*4], 0
    mov dword ptr [rt_arc_kinds+rcx*4], 0
    mov dword ptr [rt_arc_flags+rcx*4], 0
    mov dword ptr [rt_arc_meta+rcx*4], 0
    mov eax, dword ptr [rt_arc_free_head]
    mov dword ptr [rt_arc_free_next+rcx*4], eax
    mov dword ptr [rt_arc_free_head], ecx
    jmp pulsec_rt_arrayNew_alloc_panic
pulsec_rt_arrayNew_alloc_panic:
    sub rsp, 40
    lea rcx, rt_array_alloc_err
    mov edx, rt_array_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_arrayNew_done:
    xor eax, eax
    ret
pulsec_rt_arrayNew endp

pulsec_rt_arraySetInt proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arraySetInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arraySetInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arraySetInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arraySetInt_live_panic
pulsec_rt_arraySetInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arraySetInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arraySetInt_live_panic
    jmp pulsec_rt_arraySetInt_ok
pulsec_rt_arraySetInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arraySetInt_ok:
    mov ecx, r10d
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_arr_len_ptr]
    mov r9d, dword ptr [rax+rcx*4]
    cmp edx, r9d
    jae @F
    mov r11, qword ptr [rt_arr_i_ptr_ptr]
    mov r10, qword ptr [r11+rcx*8]
    test r10, r10
    jz @F
    mov dword ptr [r10+rdx*4], r8d
@@:
    xor eax, eax
    ret
pulsec_rt_arraySetInt endp

pulsec_rt_arraySetString proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arraySetString_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arraySetString_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arraySetString_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arraySetString_live_panic
pulsec_rt_arraySetString_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arraySetString_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arraySetString_live_panic
    jmp pulsec_rt_arraySetString_ok
pulsec_rt_arraySetString_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arraySetString_ok:
    mov ecx, r10d
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_arr_len_ptr]
    mov r9d, dword ptr [rax+rcx*4]
    cmp edx, r9d
    jae @F
    mov r11, qword ptr [rt_arr_s_ptr_ptr]
    mov r10, qword ptr [r11+rcx*8]
    test r10, r10
    jz @F
    mov dword ptr [r10+rdx*4], r8d
@@:
    xor eax, eax
    ret
pulsec_rt_arraySetString endp

pulsec_rt_booleanToString proc
    cmp ecx, 0
    je pulsec_rt_booleanToString_false
    lea rcx, rt_true
    mov edx, 4
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_booleanToString_false:
    lea rcx, rt_false
    mov edx, 5
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_booleanToString endp

pulsec_rt_consoleWrite proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_rt_consoleWrite_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_consoleWrite_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_consoleWrite_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_consoleWrite_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_consoleWrite_stale
pulsec_rt_consoleWrite_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_consoleWrite_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_consoleWrite_stale
    mov eax, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov r8d, r10d
    imul r8d, 256
    mov rcx, qword ptr [rt_str_data_ptr]
    add rcx, r8
    jmp pulsec_rt_consoleWrite_ready
pulsec_rt_consoleWrite_empty:
    lea rcx, rt_empty
pulsec_rt_consoleWrite_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleWrite_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleWrite endp

pulsec_rt_consoleWriteLine proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_rt_consoleWriteLine_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_consoleWriteLine_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_consoleWriteLine_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_consoleWriteLine_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_consoleWriteLine_stale
pulsec_rt_consoleWriteLine_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_consoleWriteLine_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_consoleWriteLine_stale
    mov eax, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov r8d, r10d
    imul r8d, 256
    mov rcx, qword ptr [rt_str_data_ptr]
    add rcx, r8
    jmp pulsec_rt_consoleWriteLine_ready
pulsec_rt_consoleWriteLine_empty:
    lea rcx, rt_empty
pulsec_rt_consoleWriteLine_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    lea rdx, rt_newline
    mov r8d, 2
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleWriteLine_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleWriteLine endp

pulsec_rt_intToString proc
    mov eax, ecx
    lea r8, rt_tmpbuf
    add r8, 31
    xor r9d, r9d
    cmp eax, 0
    jne pulsec_rt_intToString_nonzero
    mov byte ptr [r8], '0'
    mov rcx, r8
    mov edx, 1
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_intToString_nonzero:
    cmp eax, 0
    jge pulsec_rt_intToString_positive
    neg eax
    mov r9d, 1
pulsec_rt_intToString_positive:
    mov r10d, 10
    xor r11d, r11d
pulsec_rt_intToString_digit_loop:
    xor edx, edx
    div r10d
    add dl, '0'
    mov byte ptr [r8], dl
    sub r8, 1
    add r11d, 1
    test eax, eax
    jne pulsec_rt_intToString_digit_loop
    cmp r9d, 0
    je pulsec_rt_intToString_after_sign
    mov byte ptr [r8], '-'
    sub r8, 1
    add r11d, 1
pulsec_rt_intToString_after_sign:
    add r8, 1
    mov rcx, r8
    mov edx, r11d
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_intToString endp

pulsec_rt_listAddInt proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listAddInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listAddInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listAddInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listAddInt_live_panic
pulsec_rt_listAddInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listAddInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listAddInt_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listAddInt_live_panic
    jmp pulsec_rt_listAddInt_ok
pulsec_rt_listAddInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listAddInt_ok:
    mov ecx, r10d
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov dword ptr [rt_tmp_arg_val], edx
    mov r10d, ecx
    mov rax, qword ptr [rt_list_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_list_cap_ptr]
    mov r9d, dword ptr [rax+r10*4]
    cmp r8d, r9d
    jae pulsec_rt_listAddInt_grow
pulsec_rt_listAddInt_emit:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_kind_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 0
    jne pulsec_rt_listAddInt_kind_done
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 1
pulsec_rt_listAddInt_kind_done:
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_listAddInt_fail
    mov r8d, dword ptr [rt_tmp_size]
    mov edx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r11+r8*4], edx
    add r8d, 1
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_list_size_ptr]
    mov dword ptr [rax+r10*4], r8d
    xor eax, eax
    ret
pulsec_rt_listAddInt_grow:
    mov eax, r9d
    cmp eax, 2147483647
    jae pulsec_rt_listAddInt_fail
    add eax, eax
    cmp eax, r9d
    ja @F
    mov eax, r9d
    add eax, 1
@@:
    cmp eax, 2147483647
    jbe @F
    mov eax, 2147483647
@@:
    mov dword ptr [rt_tmp_arr_len], eax
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listAddInt_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_b], rax
    mov r11, rax
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_listAddInt_copy_loop:
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_listAddInt_grow_done
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov eax, dword ptr [rax+rcx*4]
    mov dword ptr [r11+rcx*4], eax
    add ecx, 1
    jmp pulsec_rt_listAddInt_copy_loop
pulsec_rt_listAddInt_grow_done:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_ptr_a]
    call HeapFree
    add rsp, 40
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r11, qword ptr [rt_list_i_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov edx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_list_cap_ptr]
    mov dword ptr [rax+r10*4], edx
    mov r8d, dword ptr [rt_tmp_size]
    jmp pulsec_rt_listAddInt_emit
pulsec_rt_listAddInt_grow_alloc_fail:
    jmp pulsec_rt_listAddInt_fail
pulsec_rt_listAddInt_fail:
    sub rsp, 40
    lea rcx, rt_list_growth_err
    mov edx, rt_list_growth_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_listAddInt endp

pulsec_rt_listAddString proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listAddString_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listAddString_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listAddString_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listAddString_live_panic
pulsec_rt_listAddString_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listAddString_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listAddString_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listAddString_live_panic
    jmp pulsec_rt_listAddString_ok
pulsec_rt_listAddString_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listAddString_ok:
    mov ecx, r10d
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov dword ptr [rt_tmp_arg_val], edx
    mov r10d, ecx
    mov rax, qword ptr [rt_list_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_list_cap_ptr]
    mov r9d, dword ptr [rax+r10*4]
    cmp r8d, r9d
    jae pulsec_rt_listAddString_grow
pulsec_rt_listAddString_emit:
    mov ecx, dword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 2
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_listAddString_fail
    mov r8d, dword ptr [rt_tmp_size]
    mov ecx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r11+r8*4], ecx
    add r8d, 1
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_list_size_ptr]
    mov dword ptr [rax+r10*4], r8d
    xor eax, eax
    ret
pulsec_rt_listAddString_grow:
    mov eax, r9d
    cmp eax, 2147483647
    jae pulsec_rt_listAddString_fail
    add eax, eax
    cmp eax, r9d
    ja @F
    mov eax, r9d
    add eax, 1
@@:
    cmp eax, 2147483647
    jbe @F
    mov eax, 2147483647
@@:
    mov dword ptr [rt_tmp_arr_len], eax
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listAddString_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_b], rax
    mov r11, rax
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_listAddString_copy_loop:
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_listAddString_grow_done
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov eax, dword ptr [rax+rcx*4]
    mov dword ptr [r11+rcx*4], eax
    add ecx, 1
    jmp pulsec_rt_listAddString_copy_loop
pulsec_rt_listAddString_grow_done:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_ptr_a]
    call HeapFree
    add rsp, 40
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r11, qword ptr [rt_list_s_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov edx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_list_cap_ptr]
    mov dword ptr [rax+r10*4], edx
    mov r8d, dword ptr [rt_tmp_size]
    jmp pulsec_rt_listAddString_emit
pulsec_rt_listAddString_grow_alloc_fail:
    jmp pulsec_rt_listAddString_fail
pulsec_rt_listAddString_fail:
    sub rsp, 40
    lea rcx, rt_list_growth_err
    mov edx, rt_list_growth_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_listAddString endp

pulsec_rt_listClear proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listClear_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listClear_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listClear_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listClear_live_panic
pulsec_rt_listClear_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listClear_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listClear_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listClear_live_panic
    jmp pulsec_rt_listClear_ok
pulsec_rt_listClear_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listClear_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov dword ptr [rt_tmp_arr_slot], r10d
    mov rax, qword ptr [rt_list_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], eax
    mov rax, qword ptr [rt_list_kind_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 2
    jne pulsec_rt_listClear_release_done
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov dword ptr [rt_tmp_arr_len], 0
pulsec_rt_listClear_release_loop:
    mov ecx, dword ptr [rt_tmp_arr_len]
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_listClear_release_done
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_listClear_release_skip
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_listClear_release_skip:
    mov ecx, dword ptr [rt_tmp_arr_len]
    add ecx, 1
    mov dword ptr [rt_tmp_arr_len], ecx
    jmp pulsec_rt_listClear_release_loop
pulsec_rt_listClear_release_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 16
    jbe pulsec_rt_listClear_done
    cmp eax, 64
    jb pulsec_rt_listClear_done
    mov qword ptr [rt_tmp_arr_bytes], 64
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listClear_done
    mov qword ptr [rt_tmp_ptr_a], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listClear_alloc_s_fail
    mov qword ptr [rt_tmp_ptr_b], rax
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_c], r11
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_d], r11
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov r11, qword ptr [rt_list_i_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r11, qword ptr [rt_list_s_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_list_cap_ptr]
    mov dword ptr [rax+r10*4], 16
    mov r11, qword ptr [rt_tmp_ptr_c]
    test r11, r11
    jz pulsec_rt_listClear_free_old_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_listClear_free_old_i_done:
    mov r11, qword ptr [rt_tmp_ptr_d]
    test r11, r11
    jz pulsec_rt_listClear_free_old_s_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_listClear_free_old_s_done:
    jmp pulsec_rt_listClear_done
pulsec_rt_listClear_alloc_s_fail:
    mov r11, qword ptr [rt_tmp_ptr_a]
    test r11, r11
    jz pulsec_rt_listClear_free_new_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_listClear_free_new_i_done:
pulsec_rt_listClear_done:
@@:
    xor eax, eax
    ret
pulsec_rt_listClear endp

pulsec_rt_listGetInt proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listGetInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listGetInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listGetInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listGetInt_live_panic
pulsec_rt_listGetInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listGetInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listGetInt_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listGetInt_live_panic
    jmp pulsec_rt_listGetInt_ok
pulsec_rt_listGetInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listGetInt_ok:
    mov ecx, r10d
    mov r10d, ecx
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_list_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    cmp edx, r8d
    jae @F
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz @F
    mov eax, dword ptr [r11+rdx*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_listGetInt endp

pulsec_rt_listGetString proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listGetString_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listGetString_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listGetString_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listGetString_live_panic
pulsec_rt_listGetString_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listGetString_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listGetString_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listGetString_live_panic
    jmp pulsec_rt_listGetString_ok
pulsec_rt_listGetString_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listGetString_ok:
    mov ecx, r10d
    mov r10d, ecx
    cmp edx, 0
    jl @F
    mov rax, qword ptr [rt_list_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    cmp edx, r8d
    jae @F
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz @F
    mov eax, dword ptr [r11+rdx*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_listGetString endp

pulsec_rt_listNew proc
    mov eax, dword ptr [rt_arc_free_head]
    cmp eax, 1
    jb pulsec_rt_listNew_allocslot_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listNew_allocslot_fresh
    mov r9d, eax
    mov eax, dword ptr [rt_arc_free_next+r9*4]
    mov dword ptr [rt_arc_free_head], eax
    mov eax, r9d
    mov dword ptr [rt_arc_free_next+rax*4], 0
    jmp pulsec_rt_listNew_allocslot_done
pulsec_rt_listNew_allocslot_fresh:
    mov eax, dword ptr [rt_handle_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_listNew_allocslot_have_room
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    cmp eax, 0
    jne pulsec_rt_listNew_done
    mov eax, dword ptr [rt_handle_next]
pulsec_rt_listNew_allocslot_have_room:
    add eax, 1
    mov dword ptr [rt_handle_next], eax
pulsec_rt_listNew_allocslot_done:
    mov r10d, eax
    mov dword ptr [rt_tmp_arr_slot], r10d
    mov rax, qword ptr [rt_list_cap_ptr]
    mov dword ptr [rax+r10*4], 16
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_list_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 2147483647
    ja pulsec_rt_listNew_fail
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listNew_fail
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_list_i_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_listNew_alloc_fail_free_i
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_list_s_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    jmp pulsec_rt_listNew_alloc_ok
pulsec_rt_listNew_alloc_fail_free_i:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_listNew_fail
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
    jmp pulsec_rt_listNew_fail
pulsec_rt_listNew_alloc_ok:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov edx, dword ptr [rt_list_count]
    add edx, 1
    mov dword ptr [rt_list_count], edx
    mov rax, qword ptr [rt_list_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_list_alive_ptr]
    mov dword ptr [rax+r10*4], 1
    mov dword ptr [rt_arc_kinds+r10*4], 4
    mov dword ptr [rt_arc_refcounts+r10*4], 1
    mov dword ptr [rt_arc_flags+r10*4], 0
    mov dword ptr [rt_arc_meta+r10*4], 1
    mov edx, dword ptr [rt_arc_generation+r10*4]
    add edx, 1
    jnz @F
    sub rsp, 40
    lea rcx, rt_arc_gen_overflow_err
    mov edx, rt_arc_gen_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
@@:
    mov dword ptr [rt_arc_generation+r10*4], edx
    shl rdx, 32
    mov eax, r10d
    or rax, rdx
    ret
pulsec_rt_listNew_done:
    jmp pulsec_rt_listNew_fail
pulsec_rt_listNew_fail:
    sub rsp, 40
    lea rcx, rt_list_alloc_err
    mov edx, rt_list_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_listNew endp

pulsec_rt_listSize proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listSize_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listSize_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listSize_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listSize_live_panic
pulsec_rt_listSize_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listSize_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listSize_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listSize_live_panic
    jmp pulsec_rt_listSize_ok
pulsec_rt_listSize_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listSize_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov rax, qword ptr [rt_list_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_listSize endp

pulsec_rt_mapClear proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapClear_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapClear_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapClear_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapClear_live_panic
pulsec_rt_mapClear_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapClear_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapClear_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapClear_live_panic
    jmp pulsec_rt_mapClear_ok
pulsec_rt_mapClear_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapClear_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov dword ptr [rt_tmp_arr_slot], r10d
    mov rax, qword ptr [rt_map_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], eax
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov dword ptr [rt_tmp_arr_len], 0
pulsec_rt_mapClear_release_loop:
    mov ecx, dword ptr [rt_tmp_arr_len]
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapClear_release_done
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_key
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_mapClear_release_skip_key:
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_value
    cmp dword ptr [rax+rcx*4], 2
    jne pulsec_rt_mapClear_release_skip_value
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_value
    mov ecx, dword ptr [rax+rcx*4]
    call pulsec_rt_arcRelease
pulsec_rt_mapClear_release_skip_value:
    mov ecx, dword ptr [rt_tmp_arr_len]
    add ecx, 1
    mov dword ptr [rt_tmp_arr_len], ecx
    jmp pulsec_rt_mapClear_release_loop
pulsec_rt_mapClear_release_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 16
    jbe pulsec_rt_mapClear_done
    cmp eax, 64
    jb pulsec_rt_mapClear_done
    mov qword ptr [rt_tmp_arr_bytes], 64
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapClear_done
    mov qword ptr [rt_tmp_ptr_a], rax
pulsec_rt_mapClear_alloc_tags:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapClear_alloc_fail
    mov qword ptr [rt_tmp_ptr_b], rax
pulsec_rt_mapClear_alloc_i:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapClear_alloc_fail
    mov qword ptr [rt_tmp_ptr_c], rax
pulsec_rt_mapClear_alloc_s:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapClear_alloc_fail
    mov qword ptr [rt_tmp_ptr_d], rax
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_mapClear_free_old_keys_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_old_keys_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_mapClear_free_old_tags_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_old_tags_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_mapClear_free_old_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_old_i_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_mapClear_free_old_s_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_old_s_done:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov r11, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r11, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_tmp_ptr_c]
    mov r11, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov r11, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    mov rax, qword ptr [rt_map_cap_ptr]
    mov dword ptr [rax+r10*4], 16
    jmp pulsec_rt_mapClear_done
pulsec_rt_mapClear_alloc_fail:
    mov r11, qword ptr [rt_tmp_ptr_a]
    test r11, r11
    jz pulsec_rt_mapClear_free_new_keys_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_new_keys_done:
    mov r11, qword ptr [rt_tmp_ptr_b]
    test r11, r11
    jz pulsec_rt_mapClear_free_new_tags_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_new_tags_done:
    mov r11, qword ptr [rt_tmp_ptr_c]
    test r11, r11
    jz pulsec_rt_mapClear_free_new_i_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_free_new_i_done:
    mov r11, qword ptr [rt_tmp_ptr_d]
    test r11, r11
    jz pulsec_rt_mapClear_done
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapClear_done:
@@:
    xor eax, eax
    ret
pulsec_rt_mapClear endp

pulsec_rt_mapContainsKey proc
    xor eax, eax
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapContainsKey_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapContainsKey_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapContainsKey_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapContainsKey_live_panic
pulsec_rt_mapContainsKey_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapContainsKey_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapContainsKey_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapContainsKey_live_panic
    jmp pulsec_rt_mapContainsKey_ok
pulsec_rt_mapContainsKey_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapContainsKey_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_mapContainsKey_end
    xor r9d, r9d
pulsec_rt_mapContainsKey_loop:
    cmp r9d, r8d
    jae pulsec_rt_mapContainsKey_end
    cmp dword ptr [r11+r9*4], edx
    jne pulsec_rt_mapContainsKey_next
    mov eax, 1
    ret
pulsec_rt_mapContainsKey_next:
    add r9d, 1
    jmp pulsec_rt_mapContainsKey_loop
pulsec_rt_mapContainsKey_end:
    xor eax, eax
    ret
pulsec_rt_mapContainsKey endp

pulsec_rt_mapGet proc
    xor eax, eax
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapGet_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapGet_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapGet_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapGet_live_panic
pulsec_rt_mapGet_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapGet_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapGet_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapGet_live_panic
    jmp pulsec_rt_mapGet_ok
pulsec_rt_mapGet_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapGet_ok:
    mov ecx, r10d
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_mapGet_end
    xor r9d, r9d
pulsec_rt_mapGet_loop:
    cmp r9d, r8d
    jae pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_a]
    cmp dword ptr [rax+r9*4], edx
    jne pulsec_rt_mapGet_next
    mov rax, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [rax+r9*4], 2
    jne pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_mapGet_end
    mov eax, dword ptr [rax+r9*4]
    ret
pulsec_rt_mapGet_next:
    add r9d, 1
    jmp pulsec_rt_mapGet_loop
pulsec_rt_mapGet_end:
    xor eax, eax
    ret
pulsec_rt_mapGet endp

pulsec_rt_mapGetInt proc
    xor eax, eax
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapGetInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapGetInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapGetInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapGetInt_live_panic
pulsec_rt_mapGetInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapGetInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapGetInt_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapGetInt_live_panic
    jmp pulsec_rt_mapGetInt_ok
pulsec_rt_mapGetInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapGetInt_ok:
    mov ecx, r10d
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_mapGetInt_end
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_mapGetInt_end
    xor r9d, r9d
pulsec_rt_mapGetInt_loop:
    cmp r9d, r8d
    jae pulsec_rt_mapGetInt_end
    mov rax, qword ptr [rt_tmp_ptr_a]
    cmp dword ptr [rax+r9*4], edx
    jne pulsec_rt_mapGetInt_next
    mov rax, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [rax+r9*4], 1
    jne pulsec_rt_mapGetInt_end
    mov rax, qword ptr [rt_tmp_ptr_c]
    test rax, rax
    jz pulsec_rt_mapGetInt_end
    mov eax, dword ptr [rax+r9*4]
    ret
pulsec_rt_mapGetInt_next:
    add r9d, 1
    jmp pulsec_rt_mapGetInt_loop
pulsec_rt_mapGetInt_end:
    xor eax, eax
    ret
pulsec_rt_mapGetInt endp

pulsec_rt_mapNew proc
    mov eax, dword ptr [rt_arc_free_head]
    cmp eax, 1
    jb pulsec_rt_mapNew_allocslot_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapNew_allocslot_fresh
    mov r9d, eax
    mov eax, dword ptr [rt_arc_free_next+r9*4]
    mov dword ptr [rt_arc_free_head], eax
    mov eax, r9d
    mov dword ptr [rt_arc_free_next+rax*4], 0
    jmp pulsec_rt_mapNew_allocslot_done
pulsec_rt_mapNew_allocslot_fresh:
    mov eax, dword ptr [rt_handle_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_mapNew_allocslot_have_room
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    cmp eax, 0
    jne pulsec_rt_mapNew_done
    mov eax, dword ptr [rt_handle_next]
pulsec_rt_mapNew_allocslot_have_room:
    add eax, 1
    mov dword ptr [rt_handle_next], eax
pulsec_rt_mapNew_allocslot_done:
    mov r10d, eax
    mov dword ptr [rt_tmp_arr_slot], r10d
    mov rax, qword ptr [rt_map_cap_ptr]
    mov dword ptr [rax+r10*4], 16
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [rax+r10*8], 0
    mov rax, qword ptr [rt_map_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 2147483647
    ja pulsec_rt_mapNew_fail
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapNew_fail
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapNew_alloc_fail_free_keys
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapNew_alloc_fail_free_tags
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapNew_alloc_fail_free_i
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [r11+r10*8], rax
    jmp pulsec_rt_mapNew_alloc_ok
pulsec_rt_mapNew_alloc_fail_free_i:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_mapNew_alloc_fail_free_tags
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapNew_alloc_fail_free_tags:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_mapNew_alloc_fail_free_keys
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
pulsec_rt_mapNew_alloc_fail_free_keys:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rax+r10*8], 0
    test r11, r11
    jz pulsec_rt_mapNew_fail
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
    jmp pulsec_rt_mapNew_fail
pulsec_rt_mapNew_alloc_ok:
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov edx, dword ptr [rt_map_count]
    add edx, 1
    mov dword ptr [rt_map_count], edx
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_alive_ptr]
    mov dword ptr [rax+r10*4], 1
    mov dword ptr [rt_arc_kinds+r10*4], 4
    mov dword ptr [rt_arc_refcounts+r10*4], 1
    mov dword ptr [rt_arc_flags+r10*4], 0
    mov dword ptr [rt_arc_meta+r10*4], 2
    mov edx, dword ptr [rt_arc_generation+r10*4]
    add edx, 1
    jnz @F
    sub rsp, 40
    lea rcx, rt_arc_gen_overflow_err
    mov edx, rt_arc_gen_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
@@:
    mov dword ptr [rt_arc_generation+r10*4], edx
    shl rdx, 32
    mov eax, r10d
    or rax, rdx
    ret
pulsec_rt_mapNew_done:
    jmp pulsec_rt_mapNew_fail
pulsec_rt_mapNew_fail:
    sub rsp, 40
    lea rcx, rt_map_alloc_err
    mov edx, rt_map_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_mapNew endp

pulsec_rt_mapPut proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapPut_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapPut_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapPut_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapPut_live_panic
pulsec_rt_mapPut_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapPut_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapPut_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapPut_live_panic
    jmp pulsec_rt_mapPut_ok
pulsec_rt_mapPut_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapPut_ok:
    mov ecx, r10d
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov dword ptr [rt_tmp_arg_key], edx
    mov dword ptr [rt_tmp_arg_val], r8d
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r9d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_size], r9d
    mov rax, qword ptr [rt_map_cap_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_arr_len], r8d
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_mapPut_fail
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_mapPut_fail
    xor eax, eax
pulsec_rt_mapPut_loop:
    cmp eax, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapPut_insert
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [rt_tmp_arg_key]
    cmp dword ptr [r10+rax*4], edx
    jne pulsec_rt_mapPut_miss
    mov dword ptr [rt_tmp_arr_len], eax
    mov r10, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [r10+rax*4], 2
    jne @F
    mov r10, qword ptr [rt_tmp_ptr_d]
    test r10, r10
    jz @F
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov ecx, dword ptr [r10+rcx*4]
    call pulsec_rt_arcRelease
@@:
    mov eax, dword ptr [rt_tmp_arr_len]
    mov ecx, dword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rt_tmp_arr_len]
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+rax*4], 2
    mov r10, qword ptr [rt_tmp_ptr_d]
    mov edx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r10+rax*4], edx
    jmp pulsec_rt_mapPut_end
pulsec_rt_mapPut_miss:
    add eax, 1
    jmp pulsec_rt_mapPut_loop
pulsec_rt_mapPut_insert:
    mov r9d, dword ptr [rt_tmp_size]
    cmp r9d, dword ptr [rt_tmp_arr_len]
    jae pulsec_rt_mapPut_grow
    mov ecx, dword ptr [rt_tmp_arg_key]
    call pulsec_rt_arcRetain
    mov ecx, dword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov r9d, dword ptr [rt_tmp_size]
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [rt_tmp_arg_key]
    mov dword ptr [r10+r9*4], edx
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+r9*4], 2
    mov r10, qword ptr [rt_tmp_ptr_d]
    mov edx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r10+r9*4], edx
    add r9d, 1
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r11*4], r9d
pulsec_rt_mapPut_end:
    xor eax, eax
    ret
pulsec_rt_mapPut_grow:
    mov eax, dword ptr [rt_tmp_arr_len]
    cmp eax, 2147483647
    jae pulsec_rt_mapPut_fail
    mov ecx, eax
    add eax, eax
    cmp eax, ecx
    ja @F
    mov eax, ecx
    add eax, 1
@@:
    cmp eax, 2147483647
    jbe @F
    mov eax, 2147483647
@@:
    mov dword ptr [rt_tmp_arr_len], eax
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPut_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
pulsec_rt_mapPut_grow_alloc_tags:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPut_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_b], rax
pulsec_rt_mapPut_grow_alloc_i:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPut_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_c], rax
pulsec_rt_mapPut_grow_alloc_s:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPut_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_d], rax
    mov r11d, dword ptr [rt_tmp_arr_slot]
    xor ecx, ecx
pulsec_rt_mapPut_grow_copy:
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapPut_grow_done
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_c]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov dword ptr [rax+rcx*4], edx
    add ecx, 1
    jmp pulsec_rt_mapPut_grow_copy
pulsec_rt_mapPut_grow_done:
    sub rsp, 40
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    add rsp, 40
    mov r11d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov r10, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r10, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_c]
    mov r10, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov r10, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov edx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_map_cap_ptr]
    mov dword ptr [rax+r11*4], edx
    jmp pulsec_rt_mapPut_insert
pulsec_rt_mapPut_grow_alloc_fail:
    jmp pulsec_rt_mapPut_fail
pulsec_rt_mapPut_fail:
    sub rsp, 40
    lea rcx, rt_map_growth_err
    mov edx, rt_map_growth_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_mapPut endp

pulsec_rt_mapPutInt proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapPutInt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapPutInt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapPutInt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapPutInt_live_panic
pulsec_rt_mapPutInt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapPutInt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapPutInt_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapPutInt_live_panic
    jmp pulsec_rt_mapPutInt_ok
pulsec_rt_mapPutInt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapPutInt_ok:
    mov ecx, r10d
    mov dword ptr [rt_tmp_arr_slot], ecx
    mov dword ptr [rt_tmp_arg_key], edx
    mov dword ptr [rt_tmp_arg_val], r8d
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r9d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_size], r9d
    mov rax, qword ptr [rt_map_cap_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_arr_len], r8d
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_a], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_d], rax
    mov rax, qword ptr [rt_tmp_ptr_a]
    test rax, rax
    jz pulsec_rt_mapPutInt_fail
    mov rax, qword ptr [rt_tmp_ptr_b]
    test rax, rax
    jz pulsec_rt_mapPutInt_fail
    xor eax, eax
pulsec_rt_mapPutInt_loop:
    cmp eax, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapPutInt_insert
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [rt_tmp_arg_key]
    cmp dword ptr [r10+rax*4], edx
    jne pulsec_rt_mapPutInt_miss
    mov dword ptr [rt_tmp_arr_len], eax
    mov r10, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [r10+rax*4], 2
    jne @F
    mov r10, qword ptr [rt_tmp_ptr_d]
    test r10, r10
    jz @F
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov ecx, dword ptr [r10+rcx*4]
    call pulsec_rt_arcRelease
@@:
    mov eax, dword ptr [rt_tmp_arr_len]
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+rax*4], 1
    mov r10, qword ptr [rt_tmp_ptr_c]
    mov edx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r10+rax*4], edx
    jmp pulsec_rt_mapPutInt_end
pulsec_rt_mapPutInt_miss:
    add eax, 1
    jmp pulsec_rt_mapPutInt_loop
pulsec_rt_mapPutInt_insert:
    mov r9d, dword ptr [rt_tmp_size]
    cmp r9d, dword ptr [rt_tmp_arr_len]
    jae pulsec_rt_mapPutInt_grow
    mov ecx, dword ptr [rt_tmp_arg_key]
    call pulsec_rt_arcRetain
    mov r9d, dword ptr [rt_tmp_size]
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [rt_tmp_arg_key]
    mov dword ptr [r10+r9*4], edx
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+r9*4], 1
    mov r10, qword ptr [rt_tmp_ptr_c]
    mov edx, dword ptr [rt_tmp_arg_val]
    mov dword ptr [r10+r9*4], edx
    add r9d, 1
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r11*4], r9d
pulsec_rt_mapPutInt_end:
    xor eax, eax
    ret
pulsec_rt_mapPutInt_grow:
    mov eax, dword ptr [rt_tmp_arr_len]
    cmp eax, 2147483647
    jae pulsec_rt_mapPutInt_fail
    mov ecx, eax
    add eax, eax
    cmp eax, ecx
    ja @F
    mov eax, ecx
    add eax, 1
@@:
    cmp eax, 2147483647
    jbe @F
    mov eax, 2147483647
@@:
    mov dword ptr [rt_tmp_arr_len], eax
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPutInt_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
pulsec_rt_mapPutInt_grow_alloc_tags:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPutInt_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_b], rax
pulsec_rt_mapPutInt_grow_alloc_i:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPutInt_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_c], rax
pulsec_rt_mapPutInt_grow_alloc_s:
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_tmp_arr_bytes]
    call HeapAlloc
    add rsp, 40
    test rax, rax
    jz pulsec_rt_mapPutInt_grow_alloc_fail
    mov qword ptr [rt_tmp_ptr_d], rax
    mov r11d, dword ptr [rt_tmp_arr_slot]
    xor ecx, ecx
pulsec_rt_mapPutInt_grow_copy:
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapPutInt_grow_done
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_c]
    mov dword ptr [rax+rcx*4], edx
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov edx, dword ptr [rax+rcx*4]
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov dword ptr [rax+rcx*4], edx
    add ecx, 1
    jmp pulsec_rt_mapPutInt_grow_copy
pulsec_rt_mapPutInt_grow_done:
    sub rsp, 40
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    mov r11d, dword ptr [rt_tmp_arr_slot]
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov r8, qword ptr [rax+r11*8]
    call HeapFree
    add rsp, 40
    mov r11d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov r10, qword ptr [rt_map_keys_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_b]
    mov r10, qword ptr [rt_map_tags_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_c]
    mov r10, qword ptr [rt_map_i_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov r10, qword ptr [rt_map_s_ptr_ptr]
    mov qword ptr [r10+r11*8], rax
    mov edx, dword ptr [rt_tmp_arr_len]
    mov rax, qword ptr [rt_map_cap_ptr]
    mov dword ptr [rax+r11*4], edx
    jmp pulsec_rt_mapPutInt_insert
pulsec_rt_mapPutInt_grow_alloc_fail:
    jmp pulsec_rt_mapPutInt_fail
pulsec_rt_mapPutInt_fail:
    sub rsp, 40
    lea rcx, rt_map_growth_err
    mov edx, rt_map_growth_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_mapPutInt endp

pulsec_rt_mapSize proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_mapSize_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_mapSize_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_mapSize_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_mapSize_live_panic
pulsec_rt_mapSize_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_mapSize_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_mapSize_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 2
    jne pulsec_rt_mapSize_live_panic
    jmp pulsec_rt_mapSize_ok
pulsec_rt_mapSize_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_mapSize_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_mapSize endp

pulsec_rt_panic proc
    sub rsp, 56
    call pulsec_rt_consoleWriteLine
    call pulsec_rt_traceDump
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_panic endp

pulsec_rt_parseBoolean proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r8, rcx
    shr r8, 32
    cmp r10d, 0
    jl rt_parse_bool_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    jg rt_parse_bool_fail
    test r8d, r8d
    jz rt_parse_bool_plain
    cmp r8d, dword ptr [rt_arc_generation+r10*4]
    jne rt_parse_bool_stale
rt_parse_bool_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je rt_parse_bool_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne rt_parse_bool_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r11d, dword ptr [rax+r10*4]
    mov r9, qword ptr [rt_str_data_ptr]
    mov r8d, r10d
    imul r8d, 256
    add r9, r8
    cmp r11d, 4
    jne rt_parse_bool_false_check
    mov al, byte ptr [r9]
    cmp al, 't'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+1]
    cmp al, 'r'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+2]
    cmp al, 'u'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+3]
    cmp al, 'e'
    jne rt_parse_bool_fail
    mov eax, 1
    ret
rt_parse_bool_false_check:
    cmp r11d, 5
    jne rt_parse_bool_fail
    mov al, byte ptr [r9]
    cmp al, 'f'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+1]
    cmp al, 'a'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+2]
    cmp al, 'l'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+3]
    cmp al, 's'
    jne rt_parse_bool_fail
    mov al, byte ptr [r9+4]
    cmp al, 'e'
    jne rt_parse_bool_fail
    xor eax, eax
    ret
rt_parse_bool_fail:
    lea rcx, rt_parse_bool_err
    mov edx, 23
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
rt_parse_bool_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_parseBoolean endp

pulsec_rt_parseInt proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r8, rcx
    shr r8, 32
    cmp r10d, 0
    jl rt_parse_int_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    jg rt_parse_int_fail
    test r8d, r8d
    jz rt_parse_int_plain
    cmp r8d, dword ptr [rt_arc_generation+r10*4]
    jne rt_parse_int_stale
rt_parse_int_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je rt_parse_int_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne rt_parse_int_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r11d, dword ptr [rax+r10*4]
    cmp r11d, 0
    je rt_parse_int_fail
    mov r9, qword ptr [rt_str_data_ptr]
    mov r8d, r10d
    imul r8d, 256
    add r9, r8
    xor eax, eax
    xor r8d, r8d
    mov edx, 1
    mov bl, byte ptr [r9]
    cmp bl, '-'
    jne rt_parse_int_loop
    cmp r11d, 1
    je rt_parse_int_fail
    mov edx, -1
    mov r8d, 1
rt_parse_int_loop:
    cmp r8d, r11d
    jge rt_parse_int_done
    mov bl, byte ptr [r9+r8]
    cmp bl, '0'
    jb rt_parse_int_fail
    cmp bl, '9'
    ja rt_parse_int_fail
    movzx ecx, bl
    sub ecx, '0'
    imul eax, eax, 10
    add eax, ecx
    inc r8d
    jmp rt_parse_int_loop
rt_parse_int_done:
    cmp edx, -1
    jne rt_parse_int_ret
    neg eax
rt_parse_int_ret:
    ret
rt_parse_int_fail:
    lea rcx, rt_parse_int_err
    mov edx, 23
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
rt_parse_int_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_parseInt endp

pulsec_rt_stringConcat proc
    mov r10, rcx
    mov r11, rdx
    xor r8d, r8d
    xor r9d, r9d
    mov ecx, r10d
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_rt_stringConcat_check_h2
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringConcat_check_h2
    mov rax, r10
    shr rax, 32
    test eax, eax
    jz pulsec_rt_stringConcat_h1_plain
    cmp eax, dword ptr [rt_arc_generation+rcx*4]
    jne pulsec_rt_stringConcat_h1_stale
pulsec_rt_stringConcat_h1_plain:
    mov r10d, ecx
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    jne pulsec_rt_stringConcat_h2_live
pulsec_rt_stringConcat_h1_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_stringConcat_h2_live:
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_stringConcat_check_h2
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r8d, dword ptr [rax+r10*4]
pulsec_rt_stringConcat_check_h2:
    mov ecx, r11d
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_rt_stringConcat_total_ready
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringConcat_total_ready
    mov rax, r11
    shr rax, 32
    test eax, eax
    jz pulsec_rt_stringConcat_h2_plain
    cmp eax, dword ptr [rt_arc_generation+rcx*4]
    jne pulsec_rt_stringConcat_h2_stale
pulsec_rt_stringConcat_h2_plain:
    mov r11d, ecx
    mov eax, dword ptr [rt_arc_refcounts+r11*4]
    cmp eax, 0
    jne pulsec_rt_stringConcat_h2_ready
pulsec_rt_stringConcat_h2_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_stringConcat_h2_ready:
    mov eax, dword ptr [rt_arc_kinds+r11*4]
    cmp eax, 3
    jne pulsec_rt_stringConcat_total_ready
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r9d, dword ptr [rax+r11*4]
pulsec_rt_stringConcat_total_ready:
    mov eax, r8d
    add eax, r9d
    cmp eax, 255
    jbe pulsec_rt_stringConcat_copy_h1
    jmp pulsec_rt_stringConcat_fail
pulsec_rt_stringConcat_copy_h1:
    mov dword ptr [rt_tmp_concat_len], eax
    xor ecx, ecx
    lea rdx, rt_tmp_concat
    cmp r10d, 1
    jb pulsec_rt_stringConcat_copy_h2
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringConcat_copy_h2
    mov eax, r10d
    imul eax, 256
    mov r10, qword ptr [rt_str_data_ptr]
    add r10, rax
pulsec_rt_stringConcat_copy_h1_loop:
    cmp ecx, r8d
    jae pulsec_rt_stringConcat_copy_h2
    cmp ecx, dword ptr [rt_tmp_concat_len]
    jae pulsec_rt_stringConcat_copy_h2
    mov al, byte ptr [r10+rcx]
    mov byte ptr [rdx+rcx], al
    add ecx, 1
    jmp pulsec_rt_stringConcat_copy_h1_loop
pulsec_rt_stringConcat_copy_h2:
    cmp r11d, 1
    jb pulsec_rt_stringConcat_emit
    cmp r11d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringConcat_emit
    mov eax, r11d
    imul eax, 256
    mov r11, qword ptr [rt_str_data_ptr]
    add r11, rax
    xor r8d, r8d
pulsec_rt_stringConcat_copy_h2_loop:
    cmp r8d, r9d
    jae pulsec_rt_stringConcat_emit
    cmp ecx, dword ptr [rt_tmp_concat_len]
    jae pulsec_rt_stringConcat_emit
    mov al, byte ptr [r11+r8]
    mov byte ptr [rdx+rcx], al
    add r8d, 1
    add ecx, 1
    jmp pulsec_rt_stringConcat_copy_h2_loop
pulsec_rt_stringConcat_emit:
    lea rcx, rt_tmp_concat
    mov edx, dword ptr [rt_tmp_concat_len]
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_stringConcat_fail:
    sub rsp, 40
    lea rcx, rt_string_alloc_err
    mov edx, rt_string_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_stringConcat endp

pulsec_rt_stringLength proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r11, rcx
    shr r11, 32
    cmp r10d, 1
    jb pulsec_rt_stringLength_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringLength_fail
    test r11d, r11d
    jz pulsec_rt_stringLength_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_stringLength_plain_panic
pulsec_rt_stringLength_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_stringLength_plain_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_stringLength_plain_panic
    mov rax, qword ptr [rt_str_lens_ptr]
    mov eax, dword ptr [rax+r10*4]
    ret
pulsec_rt_stringLength_plain_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_stringLength_fail:
    xor eax, eax
    ret
pulsec_rt_stringLength endp

pulsec_rt_weakClear proc
    cmp ecx, 0
    je pulsec_rt_weakClear_done
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_weakClear_stale
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_weakClear_stale
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_weakClear_token_ok
    mov r9, qword ptr [rt_weak_generation_ptr]
    cmp r11d, dword ptr [r9+r10*4]
    jne pulsec_rt_weakClear_stale
pulsec_rt_weakClear_token_ok:
    mov r9, qword ptr [rt_weak_target_slot_ptr]
    mov dword ptr [r9+r10*4], 0
    mov r9, qword ptr [rt_weak_target_gen_ptr]
    cmp dword ptr [r9+r10*4], 0
    je pulsec_rt_weakClear_done
    mov r9, qword ptr [rt_weak_target_gen_ptr]
    mov dword ptr [r9+r10*4], 0
pulsec_rt_weakClear_recycle:
    mov eax, dword ptr [rt_weak_free_head]
    mov r9, qword ptr [rt_weak_free_next_ptr]
    mov dword ptr [r9+r10*4], eax
    mov dword ptr [rt_weak_free_head], r10d
    jmp pulsec_rt_weakClear_done
pulsec_rt_weakClear_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_weakClear_done:
    xor eax, eax
    ret
pulsec_rt_weakClear endp

pulsec_rt_weakGet proc
    cmp ecx, 0
    je pulsec_rt_weakGet_done
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_weakGet_stale
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_weakGet_stale
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_weakGet_token_plain
    mov r9, qword ptr [rt_weak_generation_ptr]
    cmp r11d, dword ptr [r9+r10*4]
    jne pulsec_rt_weakGet_stale
    jmp pulsec_rt_weakGet_token_ok
pulsec_rt_weakGet_token_plain:
    mov r9, qword ptr [rt_weak_generation_ptr]
    cmp dword ptr [r9+r10*4], 0
    je pulsec_rt_weakGet_stale
pulsec_rt_weakGet_token_ok:
    mov r9, qword ptr [rt_weak_target_slot_ptr]
    mov r11d, dword ptr [r9+r10*4]
    cmp r11d, 1
    jb pulsec_rt_weakGet_done
    cmp r11d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_weakGet_done
    mov r9, qword ptr [rt_weak_target_gen_ptr]
    mov edx, dword ptr [r9+r10*4]
    cmp edx, 0
    je pulsec_rt_weakGet_done
    cmp edx, dword ptr [rt_arc_generation+r11*4]
    jne pulsec_rt_weakGet_done
    mov eax, dword ptr [rt_arc_refcounts+r11*4]
    cmp eax, 0
    jne pulsec_rt_weakGet_target_live
    jmp pulsec_rt_weakGet_done
pulsec_rt_weakGet_target_live:
    mov eax, r11d
    shl rdx, 32
    or rax, rdx
    jmp pulsec_rt_weakGet_done
pulsec_rt_weakGet_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_weakGet_done:
    xor eax, eax
    ret
pulsec_rt_weakGet endp

pulsec_rt_weakNew proc
    cmp ecx, 0
    je pulsec_rt_weakNew_fail
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_weakNew_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_weakNew_fail
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_weakNew_valid
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_weakNew_fail
pulsec_rt_weakNew_valid:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_weakNew_fail
pulsec_rt_weakNew_alloc:
    mov eax, dword ptr [rt_weak_free_head]
    cmp eax, 1
    jb pulsec_rt_weakNew_alloc_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_weakNew_alloc_fresh
    mov r11d, eax
    mov r9, qword ptr [rt_weak_free_next_ptr]
    mov eax, dword ptr [r9+r11*4]
    mov dword ptr [rt_weak_free_head], eax
    mov dword ptr [r9+r11*4], 0
    jmp pulsec_rt_weakNew_alloc_done
pulsec_rt_weakNew_alloc_fresh:
    mov eax, dword ptr [rt_weak_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_weakNew_alloc_have_room
    mov dword ptr [rt_tmp_arg_key], r10d
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    mov r10d, dword ptr [rt_tmp_arg_key]
    cmp eax, 0
    jne pulsec_rt_weakNew_exhausted
    mov eax, dword ptr [rt_weak_next]
pulsec_rt_weakNew_alloc_have_room:
    add eax, 1
    mov dword ptr [rt_weak_next], eax
    mov r11d, eax
pulsec_rt_weakNew_alloc_done:
    mov r9, qword ptr [rt_weak_target_slot_ptr]
    mov dword ptr [r9+r11*4], r10d
    mov edx, dword ptr [rt_arc_generation+r10*4]
    mov r9, qword ptr [rt_weak_target_gen_ptr]
    mov dword ptr [r9+r11*4], edx
    mov r9, qword ptr [rt_weak_generation_ptr]
    mov edx, dword ptr [r9+r11*4]
    add edx, 1
    jnz @F
    sub rsp, 40
    lea rcx, rt_weak_generation_overflow_err
    mov edx, rt_weak_generation_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
@@:
    mov r9, qword ptr [rt_weak_generation_ptr]
    mov dword ptr [r9+r11*4], edx
    mov eax, r11d
    shl rdx, 32
    or rax, rdx
    jmp pulsec_rt_weakNew_done
pulsec_rt_weakNew_fail:
    xor eax, eax
    jmp pulsec_rt_weakNew_done
pulsec_rt_weakNew_exhausted:
    sub rsp, 40
    lea rcx, rt_weak_exhausted_err
    mov edx, rt_weak_exhausted_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
pulsec_rt_weakNew_done:
    ret
pulsec_rt_weakNew endp

pulsec_std_com_pulse_lang_IO_print proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_std_com_pulse_lang_IO_print_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_std_com_pulse_lang_IO_print_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_std_com_pulse_lang_IO_print_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_std_com_pulse_lang_IO_print_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_std_com_pulse_lang_IO_print_stale
pulsec_std_com_pulse_lang_IO_print_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_std_com_pulse_lang_IO_print_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_std_com_pulse_lang_IO_print_stale
    mov eax, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov r8d, r10d
    imul r8d, 256
    mov rcx, qword ptr [rt_str_data_ptr]
    add rcx, r8
    jmp pulsec_std_com_pulse_lang_IO_print_ready
pulsec_std_com_pulse_lang_IO_print_empty:
    lea rcx, rt_empty
pulsec_std_com_pulse_lang_IO_print_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor eax, eax
    add rsp, 56
    ret
pulsec_std_com_pulse_lang_IO_print_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_std_com_pulse_lang_IO_print endp

pulsec_std_com_pulse_lang_IO_println proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_std_com_pulse_lang_IO_println_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_std_com_pulse_lang_IO_println_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_std_com_pulse_lang_IO_println_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_std_com_pulse_lang_IO_println_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_std_com_pulse_lang_IO_println_stale
pulsec_std_com_pulse_lang_IO_println_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_std_com_pulse_lang_IO_println_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_std_com_pulse_lang_IO_println_stale
    mov eax, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov r8d, r10d
    imul r8d, 256
    mov rcx, qword ptr [rt_str_data_ptr]
    add rcx, r8
    jmp pulsec_std_com_pulse_lang_IO_println_ready
pulsec_std_com_pulse_lang_IO_println_empty:
    lea rcx, rt_empty
pulsec_std_com_pulse_lang_IO_println_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    lea rdx, rt_newline
    mov r8d, 2
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor eax, eax
    add rsp, 56
    ret
pulsec_std_com_pulse_lang_IO_println_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_std_com_pulse_lang_IO_println endp

pulsec_std_com_pulse_math_Math_abs proc
    mov eax, ecx
    test eax, eax
    jge @F
    neg eax
@@:
    ret
pulsec_std_com_pulse_math_Math_abs endp

pulsec_std_com_pulse_math_Math_max proc
    mov eax, ecx
    cmp edx, ecx
    jle @F
    mov eax, edx
@@:
    ret
pulsec_std_com_pulse_math_Math_max endp

end
