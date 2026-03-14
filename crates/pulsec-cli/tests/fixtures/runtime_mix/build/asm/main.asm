option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc

extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc

.data
written dq 0

pulsec_rt_obj_counter dd 0
pulsec_rt_obj_class_ids dq pulsec_rt_obj_class_ids_init
pulsec_rt_obj_class_ids_heap_owned dd 0
pulsec_rt_obj_class_ids_init dd 64 dup(0)

public rt_slot_capacity
rt_handle_next dd 0
rt_slot_capacity dd 63
public rt_runtime_init_state
rt_runtime_init_state dd 0
public rt_runtime_init_epoch
rt_runtime_init_epoch dd 0
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
rt_tmp_arg_key dq 0
rt_tmp_arg_val dq 0
rt_tmp_ptr_a dq 0
rt_tmp_ptr_b dq 0
rt_tmp_ptr_c dq 0
rt_tmp_ptr_d dq 0
rt_true db 't','r','u','e'
rt_false db 'f','a','l','s','e'
rt_newline db 13,10
rt_empty db 0

rt_compiler_abi_expected dd 2
rt_runtime_abi_version dd 2
rt_abi_mismatch_err db "Runtime ABI mismatch"
rt_abi_mismatch_err_len equ $ - rt_abi_mismatch_err

rt_compiler_object_model_abi_expected dd 1
rt_runtime_object_model_abi_version dd 1
rt_object_model_abi_mismatch_err db "Object model ABI mismatch"
rt_object_model_abi_mismatch_err_len equ $ - rt_object_model_abi_mismatch_err

rt_debug_alloc_mode dd 0
rt_debug_arc_retain_err db "Debug allocator: invalid ARC retain"
rt_debug_arc_retain_err_len equ $ - rt_debug_arc_retain_err
rt_debug_arc_release_err db "Debug allocator: invalid ARC release"
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

rt_fp_int_min dq 0C1E0000000000000h
rt_fp_long_min dq 0C3E0000000000000h

rt_dispatch_null_receiver_err db 'N','u','l','l',' ','d','i','s','p','a','t','c','h',' ','r','e','c','e','i','v','e','r'
rt_dispatch_null_receiver_err_len equ $ - rt_dispatch_null_receiver_err
rt_dispatch_invalid_type_err db 'I','n','v','a','l','i','d',' ','d','i','s','p','a','t','c','h',' ','r','e','c','e','i','v','e','r',' ','t','y','p','e'
rt_dispatch_invalid_type_err_len equ $ - rt_dispatch_invalid_type_err

rt_object_alloc_err db 'O','b','j','e','c','t',' ','s','l','o','t',' ','c','a','p','a','c','i','t','y',' ','e','x','h','a','u','s','t','e','d'
rt_object_alloc_err_len equ $ - rt_object_alloc_err

rt_string_index_oob_err db 'S','t','r','i','n','g',' ','i','n','d','e','x',' ','o','u','t',' ','o','f',' ','b','o','u','n','d','s'
rt_string_index_oob_err_len equ $ - rt_string_index_oob_err
rt_string_substring_bounds_err db 'S','u','b','s','t','r','i','n','g',' ','b','o','u','n','d','s',' ','o','u','t',' ','o','f',' ','r','a','n','g','e'
rt_string_substring_bounds_err_len equ $ - rt_string_substring_bounds_err

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

public rt_arc_refcounts_tbl
public rt_arc_kinds_tbl
public rt_arc_flags_tbl
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

rt_exc_depth dd 0
rt_exc_target_ptrs dq 1024 dup(0)
rt_exc_saved_rsp dq 1024 dup(0)
rt_exc_trace_depths dd 1024 dup(0)
rt_pending_exception dq 0
rt_exception_stack_overflow_err db 'E','x','c','e','p','t','i','o','n',' ','h','a','n','d','l','e','r',' ','s','t','a','c','k',' ','o','v','e','r','f','l','o','w'
rt_exception_stack_overflow_err_len equ $ - rt_exception_stack_overflow_err

rt_arc_refcounts textequ <r12>
rt_arc_kinds textequ <r13>
rt_arc_flags textequ <r14>
rt_arc_meta textequ <r15>
rt_arc_generation textequ <rdi>
rt_arc_free_next textequ <rsi>

pulsec_objc_app_runtime_GameLoop dd 0
pulsec_objc_app_runtime_Main dd 0
pulsec_objc_app_runtime_Rank dd 0
pulsec_objc_app_runtime_Runner dd 0
pulsec_objc_com_pulse_lang_AssertionError dd 0
pulsec_objc_com_pulse_lang_AutoCloseable dd 0
pulsec_objc_com_pulse_lang_Boolean dd 0
pulsec_fld_com_pulse_lang_Boolean_TRUE dq 0
pulsec_fld_com_pulse_lang_Boolean_FALSE dq 0
pulsec_objc_com_pulse_lang_Byte dd 0
pulsec_fld_com_pulse_lang_Byte_MIN_VALUE dd -128
pulsec_fld_com_pulse_lang_Byte_MAX_VALUE dd 127
pulsec_objc_com_pulse_lang_Char dd 0
pulsec_fld_com_pulse_lang_Char_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_Char_MAX_VALUE dd 65535
pulsec_objc_com_pulse_lang_Class dd 0
pulsec_fcap_com_pulse_lang_Class dd 63
pulsec_fld_com_pulse_lang_Class_name_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_Class_name dq pulsec_fld_com_pulse_lang_Class_name_tbl
pulsec_fld_com_pulse_lang_Class_name_heap_owned dd 0
pulsec_objc_com_pulse_lang_Comparable dd 0
pulsec_objc_com_pulse_lang_ConsoleWriter dd 0
pulsec_objc_com_pulse_lang_Double dd 0
pulsec_objc_com_pulse_lang_Enum dd 0
pulsec_objc_com_pulse_lang_Exception dd 0
pulsec_objc_com_pulse_lang_Float dd 0
pulsec_objc_com_pulse_lang_IO dd 0
pulsec_objc_com_pulse_lang_IllegalArgumentException dd 0
pulsec_objc_com_pulse_lang_IllegalStateException dd 0
pulsec_objc_com_pulse_lang_IndexOutOfBoundsException dd 0
pulsec_objc_com_pulse_lang_Integer dd 0
pulsec_fld_com_pulse_lang_Integer_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_Integer_MAX_VALUE dd 2147483647
pulsec_objc_com_pulse_lang_Iterable dd 0
pulsec_objc_com_pulse_lang_Iterator dd 0
pulsec_objc_com_pulse_lang_Long dd 0
pulsec_fld_com_pulse_lang_Long_MIN_VALUE dq 0
pulsec_fld_com_pulse_lang_Long_MAX_VALUE dq 0
pulsec_objc_com_pulse_lang_NotNull dd 0
pulsec_objc_com_pulse_lang_NullPointerException dd 0
pulsec_objc_com_pulse_lang_NumberFormatException dd 0
pulsec_objc_com_pulse_lang_Object dd 0
pulsec_objc_com_pulse_lang_Override dd 0
pulsec_objc_com_pulse_lang_PrintStream dd 0
pulsec_objc_com_pulse_lang_RuntimeException dd 0
pulsec_objc_com_pulse_lang_Short dd 0
pulsec_fld_com_pulse_lang_Short_MIN_VALUE dd -32768
pulsec_fld_com_pulse_lang_Short_MAX_VALUE dd 32767
pulsec_objc_com_pulse_lang_String dd 0
pulsec_objc_com_pulse_lang_StringBuilder dd 0
pulsec_fcap_com_pulse_lang_StringBuilder dd 63
pulsec_fld_com_pulse_lang_StringBuilder_value_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_StringBuilder_value dq pulsec_fld_com_pulse_lang_StringBuilder_value_tbl
pulsec_fld_com_pulse_lang_StringBuilder_value_heap_owned dd 0
pulsec_objc_com_pulse_lang_System dd 0
pulsec_fld_com_pulse_lang_System_out dq 0
pulsec_objc_com_pulse_lang_Test dd 0
pulsec_objc_com_pulse_lang_Throwable dd 0
pulsec_fcap_com_pulse_lang_Throwable dd 63
pulsec_fld_com_pulse_lang_Throwable_typeName_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_Throwable_typeName dq pulsec_fld_com_pulse_lang_Throwable_typeName_tbl
pulsec_fld_com_pulse_lang_Throwable_typeName_heap_owned dd 0
pulsec_fld_com_pulse_lang_Throwable_message_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_Throwable_message dq pulsec_fld_com_pulse_lang_Throwable_message_tbl
pulsec_fld_com_pulse_lang_Throwable_message_heap_owned dd 0
pulsec_fld_com_pulse_lang_Throwable_cause_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_Throwable_cause dq pulsec_fld_com_pulse_lang_Throwable_cause_tbl
pulsec_fld_com_pulse_lang_Throwable_cause_heap_owned dd 0
pulsec_objc_com_pulse_lang_UByte dd 0
pulsec_fld_com_pulse_lang_UByte_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UByte_MAX_VALUE dd 255
pulsec_objc_com_pulse_lang_UInteger dd 0
pulsec_fld_com_pulse_lang_UInteger_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UInteger_MAX_VALUE dd 4294967295
pulsec_objc_com_pulse_lang_ULong dd 0
pulsec_fld_com_pulse_lang_ULong_MIN_VALUE dq 0
pulsec_fld_com_pulse_lang_ULong_MAX_VALUE dq 0
pulsec_objc_com_pulse_lang_UShort dd 0
pulsec_fld_com_pulse_lang_UShort_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UShort_MAX_VALUE dd 65535
pulsec_objc_com_pulse_lang_UnsupportedOperationException dd 0
pulsec_objc_com_pulse_lang_Void dd 0
pulsec_objc_com_pulse_rt_Intrinsics dd 0
trace_m0 db "app.runtime.GameLoop.tick"
trace_m0_len equ $ - trace_m0
pulsec_app_runtime_GameLoop_tick_trace_s0 db "app.runtime.GameLoop.tick(GameLoop.pulse:5)"
pulsec_app_runtime_GameLoop_tick_trace_s0_len equ $ - pulsec_app_runtime_GameLoop_tick_trace_s0
trace_m2 db "app.runtime.Main.main"
trace_m2_len equ $ - trace_m2
pulsec_app_runtime_Main_main_trace_s0 db "app.runtime.Main.main(Main.pulse:6)"
pulsec_app_runtime_Main_main_trace_s0_len equ $ - pulsec_app_runtime_Main_main_trace_s0
trace_m4 db "app.runtime.Rank.value"
trace_m4_len equ $ - trace_m4
trace_m5 db "app.runtime.Runner.value"
trace_m5_len equ $ - trace_m5
pulsec_app_runtime_Runner_value_trace_s0 db "app.runtime.Runner.value(Runner.pulse:5)"
pulsec_app_runtime_Runner_value_trace_s0_len equ $ - pulsec_app_runtime_Runner_value_trace_s0
trace_m7 db "com.pulse.lang.AssertionError.AssertionError"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0 db "com.pulse.lang.AssertionError.AssertionError(AssertionError.pulse:14)"
pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0
trace_m9 db "com.pulse.lang.AssertionError.AssertionError"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0 db "com.pulse.lang.AssertionError.AssertionError(AssertionError.pulse:22)"
pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0
trace_m11 db "com.pulse.lang.AssertionError.fail"
trace_m11_len equ $ - trace_m11
pulsec_com_pulse_lang_AssertionError_fail_trace_s0 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:30)"
pulsec_com_pulse_lang_AssertionError_fail_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_fail_trace_s0
trace_m13 db "com.pulse.lang.AssertionError.fail"
trace_m13_len equ $ - trace_m13
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:38)"
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:39)"
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1_len equ $ - pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1
trace_m16 db "com.pulse.lang.AutoCloseable.close"
trace_m16_len equ $ - trace_m16
trace_m17 db "com.pulse.lang.Boolean.valueOf"
trace_m17_len equ $ - trace_m17
pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0 db "com.pulse.lang.Boolean.valueOf(Boolean.pulse:24)"
pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0
trace_m19 db "com.pulse.lang.Boolean.parse"
trace_m19_len equ $ - trace_m19
pulsec_com_pulse_lang_Boolean_parse__String_trace_s0 db "com.pulse.lang.Boolean.parse(Boolean.pulse:32)"
pulsec_com_pulse_lang_Boolean_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_parse__String_trace_s0
trace_m21 db "com.pulse.lang.Boolean.booleanValue"
trace_m21_len equ $ - trace_m21
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0 db "com.pulse.lang.Boolean.booleanValue(Boolean.pulse:40)"
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0
trace_m23 db "com.pulse.lang.Boolean.equals"
trace_m23_len equ $ - trace_m23
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0 db "com.pulse.lang.Boolean.equals(Boolean.pulse:48)"
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0
trace_m25 db "com.pulse.lang.Boolean.compare"
trace_m25_len equ $ - trace_m25
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0 db "com.pulse.lang.Boolean.compare(Boolean.pulse:56)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1 db "com.pulse.lang.Boolean.compare(Boolean.pulse:57)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2 db "com.pulse.lang.Boolean.compare(Boolean.pulse:59)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3 db "com.pulse.lang.Boolean.compare(Boolean.pulse:60)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4 db "com.pulse.lang.Boolean.compare(Boolean.pulse:62)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4
trace_m31 db "com.pulse.lang.Boolean.toString"
trace_m31_len equ $ - trace_m31
pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0 db "com.pulse.lang.Boolean.toString(Boolean.pulse:70)"
pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0
trace_m33 db "com.pulse.lang.Byte.valueOf"
trace_m33_len equ $ - trace_m33
pulsec_com_pulse_lang_Byte_valueOf__byte_trace_s0 db "com.pulse.lang.Byte.valueOf(Byte.pulse:24)"
pulsec_com_pulse_lang_Byte_valueOf__byte_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_valueOf__byte_trace_s0
trace_m35 db "com.pulse.lang.Byte.parse"
trace_m35_len equ $ - trace_m35
pulsec_com_pulse_lang_Byte_parse__String_trace_s0 db "com.pulse.lang.Byte.parse(Byte.pulse:32)"
pulsec_com_pulse_lang_Byte_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_parse__String_trace_s0
pulsec_com_pulse_lang_Byte_parse__String_trace_s1 db "com.pulse.lang.Byte.parse(Byte.pulse:33)"
pulsec_com_pulse_lang_Byte_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Byte_parse__String_trace_s1
pulsec_com_pulse_lang_Byte_parse__String_trace_s2 db "com.pulse.lang.Byte.parse(Byte.pulse:34)"
pulsec_com_pulse_lang_Byte_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Byte_parse__String_trace_s2
pulsec_com_pulse_lang_Byte_parse__String_trace_s3 db "com.pulse.lang.Byte.parse(Byte.pulse:36)"
pulsec_com_pulse_lang_Byte_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_Byte_parse__String_trace_s3
trace_m40 db "com.pulse.lang.Byte.byteValue"
trace_m40_len equ $ - trace_m40
pulsec_com_pulse_lang_Byte_byteValue__Byte_trace_s0 db "com.pulse.lang.Byte.byteValue(Byte.pulse:44)"
pulsec_com_pulse_lang_Byte_byteValue__Byte_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_byteValue__Byte_trace_s0
trace_m42 db "com.pulse.lang.Byte.equals"
trace_m42_len equ $ - trace_m42
pulsec_com_pulse_lang_Byte_equals__byte_byte_trace_s0 db "com.pulse.lang.Byte.equals(Byte.pulse:52)"
pulsec_com_pulse_lang_Byte_equals__byte_byte_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_equals__byte_byte_trace_s0
trace_m44 db "com.pulse.lang.Byte.compare"
trace_m44_len equ $ - trace_m44
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0 db "com.pulse.lang.Byte.compare(Byte.pulse:60)"
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s1 db "com.pulse.lang.Byte.compare(Byte.pulse:61)"
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s1_len equ $ - pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s1
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2 db "com.pulse.lang.Byte.compare(Byte.pulse:63)"
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2_len equ $ - pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s3 db "com.pulse.lang.Byte.compare(Byte.pulse:64)"
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s3_len equ $ - pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s3
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s4 db "com.pulse.lang.Byte.compare(Byte.pulse:66)"
pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s4_len equ $ - pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s4
trace_m50 db "com.pulse.lang.Byte.toString"
trace_m50_len equ $ - trace_m50
pulsec_com_pulse_lang_Byte_toString__byte_trace_s0 db "com.pulse.lang.Byte.toString(Byte.pulse:74)"
pulsec_com_pulse_lang_Byte_toString__byte_trace_s0_len equ $ - pulsec_com_pulse_lang_Byte_toString__byte_trace_s0
trace_m52 db "com.pulse.lang.Char.valueOf"
trace_m52_len equ $ - trace_m52
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0 db "com.pulse.lang.Char.valueOf(Char.pulse:24)"
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_valueOf__char_trace_s0
trace_m54 db "com.pulse.lang.Char.parse"
trace_m54_len equ $ - trace_m54
pulsec_com_pulse_lang_Char_parse__String_trace_s0 db "com.pulse.lang.Char.parse(Char.pulse:32)"
pulsec_com_pulse_lang_Char_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_parse__String_trace_s0
pulsec_com_pulse_lang_Char_parse__String_trace_s1 db "com.pulse.lang.Char.parse(Char.pulse:33)"
pulsec_com_pulse_lang_Char_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Char_parse__String_trace_s1
trace_m57 db "com.pulse.lang.Char.charValue"
trace_m57_len equ $ - trace_m57
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0 db "com.pulse.lang.Char.charValue(Char.pulse:41)"
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_charValue__Char_trace_s0
trace_m59 db "com.pulse.lang.Char.equals"
trace_m59_len equ $ - trace_m59
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0 db "com.pulse.lang.Char.equals(Char.pulse:49)"
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_equals__char_char_trace_s0
trace_m61 db "com.pulse.lang.Char.compare"
trace_m61_len equ $ - trace_m61
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0 db "com.pulse.lang.Char.compare(Char.pulse:57)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1 db "com.pulse.lang.Char.compare(Char.pulse:58)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s1
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2 db "com.pulse.lang.Char.compare(Char.pulse:60)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3 db "com.pulse.lang.Char.compare(Char.pulse:61)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s3
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4 db "com.pulse.lang.Char.compare(Char.pulse:63)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s4
trace_m67 db "com.pulse.lang.Char.toString"
trace_m67_len equ $ - trace_m67
pulsec_com_pulse_lang_Char_toString__char_trace_s0 db "com.pulse.lang.Char.toString(Char.pulse:71)"
pulsec_com_pulse_lang_Char_toString__char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_toString__char_trace_s0
trace_m69 db "com.pulse.lang.Class.Class"
trace_m69_len equ $ - trace_m69
pulsec_com_pulse_lang_Class_Class__String_trace_s0 db "com.pulse.lang.Class.Class(Class.pulse:14)"
pulsec_com_pulse_lang_Class_Class__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_Class__String_trace_s0
trace_m71 db "com.pulse.lang.Class.getName"
trace_m71_len equ $ - trace_m71
pulsec_com_pulse_lang_Class_getName_trace_s0 db "com.pulse.lang.Class.getName(Class.pulse:22)"
pulsec_com_pulse_lang_Class_getName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getName_trace_s0
trace_m73 db "com.pulse.lang.Class.getSimpleName"
trace_m73_len equ $ - trace_m73
pulsec_com_pulse_lang_Class_getSimpleName_trace_s0 db "com.pulse.lang.Class.getSimpleName(Class.pulse:30)"
pulsec_com_pulse_lang_Class_getSimpleName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getSimpleName_trace_s0
trace_m75 db "com.pulse.lang.Class.getPackageName"
trace_m75_len equ $ - trace_m75
pulsec_com_pulse_lang_Class_getPackageName_trace_s0 db "com.pulse.lang.Class.getPackageName(Class.pulse:38)"
pulsec_com_pulse_lang_Class_getPackageName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getPackageName_trace_s0
trace_m77 db "com.pulse.lang.Class.toString"
trace_m77_len equ $ - trace_m77
pulsec_com_pulse_lang_Class_toString_trace_s0 db "com.pulse.lang.Class.toString(Class.pulse:46)"
pulsec_com_pulse_lang_Class_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_toString_trace_s0
trace_m79 db "com.pulse.lang.Class.runtimeSimpleName"
trace_m79_len equ $ - trace_m79
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0 db "com.pulse.lang.Class.runtimeSimpleName(Class.pulse:54)"
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0
trace_m81 db "com.pulse.lang.Class.runtimePackageName"
trace_m81_len equ $ - trace_m81
pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0 db "com.pulse.lang.Class.runtimePackageName(Class.pulse:62)"
pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0
trace_m83 db "com.pulse.lang.Comparable.compareTo"
trace_m83_len equ $ - trace_m83
trace_m84 db "com.pulse.lang.ConsoleWriter.println"
trace_m84_len equ $ - trace_m84
trace_m85 db "com.pulse.lang.ConsoleWriter.println"
trace_m85_len equ $ - trace_m85
trace_m86 db "com.pulse.lang.ConsoleWriter.println"
trace_m86_len equ $ - trace_m86
trace_m87 db "com.pulse.lang.ConsoleWriter.print"
trace_m87_len equ $ - trace_m87
trace_m88 db "com.pulse.lang.ConsoleWriter.print"
trace_m88_len equ $ - trace_m88
trace_m89 db "com.pulse.lang.ConsoleWriter.print"
trace_m89_len equ $ - trace_m89
trace_m90 db "com.pulse.lang.Double.valueOf"
trace_m90_len equ $ - trace_m90
pulsec_com_pulse_lang_Double_valueOf__double_trace_s0 db "com.pulse.lang.Double.valueOf(Double.pulse:14)"
pulsec_com_pulse_lang_Double_valueOf__double_trace_s0_len equ $ - pulsec_com_pulse_lang_Double_valueOf__double_trace_s0
trace_m92 db "com.pulse.lang.Double.parse"
trace_m92_len equ $ - trace_m92
pulsec_com_pulse_lang_Double_parse__String_trace_s0 db "com.pulse.lang.Double.parse(Double.pulse:22)"
pulsec_com_pulse_lang_Double_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Double_parse__String_trace_s0
pulsec_com_pulse_lang_Double_parse__String_trace_s1 db "com.pulse.lang.Double.parse(Double.pulse:23)"
pulsec_com_pulse_lang_Double_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Double_parse__String_trace_s1
trace_m95 db "com.pulse.lang.Double.doubleValue"
trace_m95_len equ $ - trace_m95
pulsec_com_pulse_lang_Double_doubleValue__Double_trace_s0 db "com.pulse.lang.Double.doubleValue(Double.pulse:31)"
pulsec_com_pulse_lang_Double_doubleValue__Double_trace_s0_len equ $ - pulsec_com_pulse_lang_Double_doubleValue__Double_trace_s0
trace_m97 db "com.pulse.lang.Double.equals"
trace_m97_len equ $ - trace_m97
pulsec_com_pulse_lang_Double_equals__double_double_trace_s0 db "com.pulse.lang.Double.equals(Double.pulse:39)"
pulsec_com_pulse_lang_Double_equals__double_double_trace_s0_len equ $ - pulsec_com_pulse_lang_Double_equals__double_double_trace_s0
trace_m99 db "com.pulse.lang.Double.compare"
trace_m99_len equ $ - trace_m99
pulsec_com_pulse_lang_Double_compare__double_double_trace_s0 db "com.pulse.lang.Double.compare(Double.pulse:47)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s0_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s0
pulsec_com_pulse_lang_Double_compare__double_double_trace_s1 db "com.pulse.lang.Double.compare(Double.pulse:48)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s1_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s1
pulsec_com_pulse_lang_Double_compare__double_double_trace_s2 db "com.pulse.lang.Double.compare(Double.pulse:50)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s2_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s2
pulsec_com_pulse_lang_Double_compare__double_double_trace_s3 db "com.pulse.lang.Double.compare(Double.pulse:51)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s3_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s3
pulsec_com_pulse_lang_Double_compare__double_double_trace_s4 db "com.pulse.lang.Double.compare(Double.pulse:53)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s4_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s4
pulsec_com_pulse_lang_Double_compare__double_double_trace_s5 db "com.pulse.lang.Double.compare(Double.pulse:54)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s5_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s5
pulsec_com_pulse_lang_Double_compare__double_double_trace_s6 db "com.pulse.lang.Double.compare(Double.pulse:56)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s6_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s6
pulsec_com_pulse_lang_Double_compare__double_double_trace_s7 db "com.pulse.lang.Double.compare(Double.pulse:57)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s7_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s7
pulsec_com_pulse_lang_Double_compare__double_double_trace_s8 db "com.pulse.lang.Double.compare(Double.pulse:58)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s8_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s8
pulsec_com_pulse_lang_Double_compare__double_double_trace_s9 db "com.pulse.lang.Double.compare(Double.pulse:59)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s9_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s9
pulsec_com_pulse_lang_Double_compare__double_double_trace_s10 db "com.pulse.lang.Double.compare(Double.pulse:61)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s10_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s10
pulsec_com_pulse_lang_Double_compare__double_double_trace_s11 db "com.pulse.lang.Double.compare(Double.pulse:62)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s11_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s11
pulsec_com_pulse_lang_Double_compare__double_double_trace_s12 db "com.pulse.lang.Double.compare(Double.pulse:64)"
pulsec_com_pulse_lang_Double_compare__double_double_trace_s12_len equ $ - pulsec_com_pulse_lang_Double_compare__double_double_trace_s12
trace_m113 db "com.pulse.lang.Enum.Enum"
trace_m113_len equ $ - trace_m113
trace_m114 db "com.pulse.lang.Exception.Exception"
trace_m114_len equ $ - trace_m114
pulsec_com_pulse_lang_Exception_Exception_trace_s0 db "com.pulse.lang.Exception.Exception(Exception.pulse:12)"
pulsec_com_pulse_lang_Exception_Exception_trace_s0_len equ $ - pulsec_com_pulse_lang_Exception_Exception_trace_s0
trace_m116 db "com.pulse.lang.Exception.Exception"
trace_m116_len equ $ - trace_m116
pulsec_com_pulse_lang_Exception_Exception__String_trace_s0 db "com.pulse.lang.Exception.Exception(Exception.pulse:20)"
pulsec_com_pulse_lang_Exception_Exception__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Exception_Exception__String_trace_s0
trace_m118 db "com.pulse.lang.Exception.Exception"
trace_m118_len equ $ - trace_m118
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_trace_s0 db "com.pulse.lang.Exception.Exception(Exception.pulse:28)"
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Exception_Exception__String_Throwable_trace_s0
trace_m120 db "com.pulse.lang.Float.valueOf"
trace_m120_len equ $ - trace_m120
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0 db "com.pulse.lang.Float.valueOf(Float.pulse:14)"
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_valueOf__float_trace_s0
trace_m122 db "com.pulse.lang.Float.parse"
trace_m122_len equ $ - trace_m122
pulsec_com_pulse_lang_Float_parse__String_trace_s0 db "com.pulse.lang.Float.parse(Float.pulse:22)"
pulsec_com_pulse_lang_Float_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_parse__String_trace_s0
pulsec_com_pulse_lang_Float_parse__String_trace_s1 db "com.pulse.lang.Float.parse(Float.pulse:23)"
pulsec_com_pulse_lang_Float_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Float_parse__String_trace_s1
trace_m125 db "com.pulse.lang.Float.floatValue"
trace_m125_len equ $ - trace_m125
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0 db "com.pulse.lang.Float.floatValue(Float.pulse:31)"
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0
trace_m127 db "com.pulse.lang.Float.equals"
trace_m127_len equ $ - trace_m127
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0 db "com.pulse.lang.Float.equals(Float.pulse:39)"
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_equals__float_float_trace_s0
trace_m129 db "com.pulse.lang.Float.compare"
trace_m129_len equ $ - trace_m129
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0 db "com.pulse.lang.Float.compare(Float.pulse:47)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1 db "com.pulse.lang.Float.compare(Float.pulse:48)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s1
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2 db "com.pulse.lang.Float.compare(Float.pulse:50)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3 db "com.pulse.lang.Float.compare(Float.pulse:51)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s3
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4 db "com.pulse.lang.Float.compare(Float.pulse:53)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5 db "com.pulse.lang.Float.compare(Float.pulse:54)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s5
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6 db "com.pulse.lang.Float.compare(Float.pulse:56)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s6
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7 db "com.pulse.lang.Float.compare(Float.pulse:57)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s7
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8 db "com.pulse.lang.Float.compare(Float.pulse:58)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9 db "com.pulse.lang.Float.compare(Float.pulse:59)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s9
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10 db "com.pulse.lang.Float.compare(Float.pulse:61)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11 db "com.pulse.lang.Float.compare(Float.pulse:62)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s11
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12 db "com.pulse.lang.Float.compare(Float.pulse:64)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s12
trace_m143 db "com.pulse.lang.IO.println"
trace_m143_len equ $ - trace_m143
pulsec_com_pulse_lang_IO_println__String_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:14)"
pulsec_com_pulse_lang_IO_println__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__String_trace_s0
trace_m145 db "com.pulse.lang.IO.println"
trace_m145_len equ $ - trace_m145
pulsec_com_pulse_lang_IO_println__int_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:22)"
pulsec_com_pulse_lang_IO_println__int_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__int_trace_s0
trace_m147 db "com.pulse.lang.IO.println"
trace_m147_len equ $ - trace_m147
pulsec_com_pulse_lang_IO_println__boolean_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:30)"
pulsec_com_pulse_lang_IO_println__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__boolean_trace_s0
trace_m149 db "com.pulse.lang.IO.print"
trace_m149_len equ $ - trace_m149
pulsec_com_pulse_lang_IO_print__String_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:38)"
pulsec_com_pulse_lang_IO_print__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__String_trace_s0
trace_m151 db "com.pulse.lang.IO.print"
trace_m151_len equ $ - trace_m151
pulsec_com_pulse_lang_IO_print__int_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:46)"
pulsec_com_pulse_lang_IO_print__int_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__int_trace_s0
trace_m153 db "com.pulse.lang.IO.print"
trace_m153_len equ $ - trace_m153
pulsec_com_pulse_lang_IO_print__boolean_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:54)"
pulsec_com_pulse_lang_IO_print__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__boolean_trace_s0
trace_m155 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m155_len equ $ - trace_m155
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:12)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0
trace_m157 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m157_len equ $ - trace_m157
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:20)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0
trace_m159 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m159_len equ $ - trace_m159
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:28)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0
trace_m161 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m161_len equ $ - trace_m161
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_trace_s0 db "com.pulse.lang.IllegalStateException.IllegalStateException(IllegalStateException.pulse:12)"
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_trace_s0
trace_m163 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m163_len equ $ - trace_m163
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_trace_s0 db "com.pulse.lang.IllegalStateException.IllegalStateException(IllegalStateException.pulse:20)"
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_trace_s0
trace_m165 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m165_len equ $ - trace_m165
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_trace_s0 db "com.pulse.lang.IllegalStateException.IllegalStateException(IllegalStateException.pulse:28)"
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_trace_s0
trace_m167 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException"
trace_m167_len equ $ - trace_m167
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_trace_s0 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException(IndexOutOfBoundsException.pulse:12)"
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_trace_s0_len equ $ - pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_trace_s0
trace_m169 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException"
trace_m169_len equ $ - trace_m169
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_trace_s0 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException(IndexOutOfBoundsException.pulse:20)"
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_trace_s0
trace_m171 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException"
trace_m171_len equ $ - trace_m171
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_trace_s0 db "com.pulse.lang.IndexOutOfBoundsException.IndexOutOfBoundsException(IndexOutOfBoundsException.pulse:28)"
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_trace_s0
trace_m173 db "com.pulse.lang.Integer.valueOf"
trace_m173_len equ $ - trace_m173
pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0 db "com.pulse.lang.Integer.valueOf(Integer.pulse:24)"
pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0
trace_m175 db "com.pulse.lang.Integer.parse"
trace_m175_len equ $ - trace_m175
pulsec_com_pulse_lang_Integer_parse__String_trace_s0 db "com.pulse.lang.Integer.parse(Integer.pulse:32)"
pulsec_com_pulse_lang_Integer_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_parse__String_trace_s0
trace_m177 db "com.pulse.lang.Integer.intValue"
trace_m177_len equ $ - trace_m177
pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0 db "com.pulse.lang.Integer.intValue(Integer.pulse:40)"
pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0
trace_m179 db "com.pulse.lang.Integer.equals"
trace_m179_len equ $ - trace_m179
pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0 db "com.pulse.lang.Integer.equals(Integer.pulse:48)"
pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0
trace_m181 db "com.pulse.lang.Integer.compare"
trace_m181_len equ $ - trace_m181
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0 db "com.pulse.lang.Integer.compare(Integer.pulse:56)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1 db "com.pulse.lang.Integer.compare(Integer.pulse:57)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1_len equ $ - pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2 db "com.pulse.lang.Integer.compare(Integer.pulse:59)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len equ $ - pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3 db "com.pulse.lang.Integer.compare(Integer.pulse:60)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3_len equ $ - pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4 db "com.pulse.lang.Integer.compare(Integer.pulse:62)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4_len equ $ - pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4
trace_m187 db "com.pulse.lang.Integer.toString"
trace_m187_len equ $ - trace_m187
pulsec_com_pulse_lang_Integer_toString__int_trace_s0 db "com.pulse.lang.Integer.toString(Integer.pulse:70)"
pulsec_com_pulse_lang_Integer_toString__int_trace_s0_len equ $ - pulsec_com_pulse_lang_Integer_toString__int_trace_s0
trace_m189 db "com.pulse.lang.Iterable.iterator"
trace_m189_len equ $ - trace_m189
trace_m190 db "com.pulse.lang.Iterator.hasNext"
trace_m190_len equ $ - trace_m190
trace_m191 db "com.pulse.lang.Iterator.next"
trace_m191_len equ $ - trace_m191
trace_m192 db "com.pulse.lang.Long.valueOf"
trace_m192_len equ $ - trace_m192
pulsec_com_pulse_lang_Long_valueOf__long_trace_s0 db "com.pulse.lang.Long.valueOf(Long.pulse:24)"
pulsec_com_pulse_lang_Long_valueOf__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_valueOf__long_trace_s0
trace_m194 db "com.pulse.lang.Long.parse"
trace_m194_len equ $ - trace_m194
pulsec_com_pulse_lang_Long_parse__String_trace_s0 db "com.pulse.lang.Long.parse(Long.pulse:32)"
pulsec_com_pulse_lang_Long_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_parse__String_trace_s0
pulsec_com_pulse_lang_Long_parse__String_trace_s1 db "com.pulse.lang.Long.parse(Long.pulse:33)"
pulsec_com_pulse_lang_Long_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_parse__String_trace_s1
trace_m197 db "com.pulse.lang.Long.longValue"
trace_m197_len equ $ - trace_m197
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0 db "com.pulse.lang.Long.longValue(Long.pulse:41)"
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_longValue__Long_trace_s0
trace_m199 db "com.pulse.lang.Long.equals"
trace_m199_len equ $ - trace_m199
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0 db "com.pulse.lang.Long.equals(Long.pulse:49)"
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_equals__long_long_trace_s0
trace_m201 db "com.pulse.lang.Long.compare"
trace_m201_len equ $ - trace_m201
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0 db "com.pulse.lang.Long.compare(Long.pulse:57)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1 db "com.pulse.lang.Long.compare(Long.pulse:58)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s1
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2 db "com.pulse.lang.Long.compare(Long.pulse:60)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3 db "com.pulse.lang.Long.compare(Long.pulse:61)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s3
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4 db "com.pulse.lang.Long.compare(Long.pulse:63)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s4
trace_m207 db "com.pulse.lang.Long.toString"
trace_m207_len equ $ - trace_m207
pulsec_com_pulse_lang_Long_toString__long_trace_s0 db "com.pulse.lang.Long.toString(Long.pulse:71)"
pulsec_com_pulse_lang_Long_toString__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_toString__long_trace_s0
pulsec_com_pulse_lang_Long_toString__long_trace_s1 db "com.pulse.lang.Long.toString(Long.pulse:72)"
pulsec_com_pulse_lang_Long_toString__long_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_toString__long_trace_s1
trace_m210 db "com.pulse.lang.NullPointerException.NullPointerException"
trace_m210_len equ $ - trace_m210
pulsec_com_pulse_lang_NullPointerException_NullPointerException_trace_s0 db "com.pulse.lang.NullPointerException.NullPointerException(NullPointerException.pulse:12)"
pulsec_com_pulse_lang_NullPointerException_NullPointerException_trace_s0_len equ $ - pulsec_com_pulse_lang_NullPointerException_NullPointerException_trace_s0
trace_m212 db "com.pulse.lang.NullPointerException.NullPointerException"
trace_m212_len equ $ - trace_m212
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_trace_s0 db "com.pulse.lang.NullPointerException.NullPointerException(NullPointerException.pulse:20)"
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_trace_s0
trace_m214 db "com.pulse.lang.NullPointerException.NullPointerException"
trace_m214_len equ $ - trace_m214
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_trace_s0 db "com.pulse.lang.NullPointerException.NullPointerException(NullPointerException.pulse:28)"
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_trace_s0
trace_m216 db "com.pulse.lang.NumberFormatException.NumberFormatException"
trace_m216_len equ $ - trace_m216
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_trace_s0 db "com.pulse.lang.NumberFormatException.NumberFormatException(NumberFormatException.pulse:12)"
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_trace_s0_len equ $ - pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_trace_s0
trace_m218 db "com.pulse.lang.NumberFormatException.NumberFormatException"
trace_m218_len equ $ - trace_m218
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_trace_s0 db "com.pulse.lang.NumberFormatException.NumberFormatException(NumberFormatException.pulse:20)"
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_trace_s0
trace_m220 db "com.pulse.lang.NumberFormatException.NumberFormatException"
trace_m220_len equ $ - trace_m220
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_trace_s0 db "com.pulse.lang.NumberFormatException.NumberFormatException(NumberFormatException.pulse:28)"
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_trace_s0
trace_m222 db "com.pulse.lang.Object.hashCode"
trace_m222_len equ $ - trace_m222
pulsec_com_pulse_lang_Object_hashCode_trace_s0 db "com.pulse.lang.Object.hashCode(Object.pulse:14)"
pulsec_com_pulse_lang_Object_hashCode_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_hashCode_trace_s0
trace_m224 db "com.pulse.lang.Object.toString"
trace_m224_len equ $ - trace_m224
pulsec_com_pulse_lang_Object_toString_trace_s0 db "com.pulse.lang.Object.toString(Object.pulse:22)"
pulsec_com_pulse_lang_Object_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_toString_trace_s0
trace_m226 db "com.pulse.lang.Object.equals"
trace_m226_len equ $ - trace_m226
pulsec_com_pulse_lang_Object_equals__Object_trace_s0 db "com.pulse.lang.Object.equals(Object.pulse:30)"
pulsec_com_pulse_lang_Object_equals__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_equals__Object_trace_s0
trace_m228 db "com.pulse.lang.Object.getClass"
trace_m228_len equ $ - trace_m228
pulsec_com_pulse_lang_Object_getClass_trace_s0 db "com.pulse.lang.Object.getClass(Object.pulse:38)"
pulsec_com_pulse_lang_Object_getClass_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_getClass_trace_s0
trace_m230 db "com.pulse.lang.PrintStream.println"
trace_m230_len equ $ - trace_m230
pulsec_com_pulse_lang_PrintStream_println__String_trace_s0 db "com.pulse.lang.PrintStream.println(PrintStream.pulse:14)"
pulsec_com_pulse_lang_PrintStream_println__String_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_println__String_trace_s0
trace_m232 db "com.pulse.lang.PrintStream.println"
trace_m232_len equ $ - trace_m232
pulsec_com_pulse_lang_PrintStream_println__int_trace_s0 db "com.pulse.lang.PrintStream.println(PrintStream.pulse:22)"
pulsec_com_pulse_lang_PrintStream_println__int_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_println__int_trace_s0
trace_m234 db "com.pulse.lang.PrintStream.println"
trace_m234_len equ $ - trace_m234
pulsec_com_pulse_lang_PrintStream_println__boolean_trace_s0 db "com.pulse.lang.PrintStream.println(PrintStream.pulse:30)"
pulsec_com_pulse_lang_PrintStream_println__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_println__boolean_trace_s0
trace_m236 db "com.pulse.lang.PrintStream.print"
trace_m236_len equ $ - trace_m236
pulsec_com_pulse_lang_PrintStream_print__String_trace_s0 db "com.pulse.lang.PrintStream.print(PrintStream.pulse:38)"
pulsec_com_pulse_lang_PrintStream_print__String_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_print__String_trace_s0
trace_m238 db "com.pulse.lang.PrintStream.print"
trace_m238_len equ $ - trace_m238
pulsec_com_pulse_lang_PrintStream_print__int_trace_s0 db "com.pulse.lang.PrintStream.print(PrintStream.pulse:46)"
pulsec_com_pulse_lang_PrintStream_print__int_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_print__int_trace_s0
trace_m240 db "com.pulse.lang.PrintStream.print"
trace_m240_len equ $ - trace_m240
pulsec_com_pulse_lang_PrintStream_print__boolean_trace_s0 db "com.pulse.lang.PrintStream.print(PrintStream.pulse:54)"
pulsec_com_pulse_lang_PrintStream_print__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_PrintStream_print__boolean_trace_s0
trace_m242 db "com.pulse.lang.RuntimeException.RuntimeException"
trace_m242_len equ $ - trace_m242
pulsec_com_pulse_lang_RuntimeException_RuntimeException_trace_s0 db "com.pulse.lang.RuntimeException.RuntimeException(RuntimeException.pulse:12)"
pulsec_com_pulse_lang_RuntimeException_RuntimeException_trace_s0_len equ $ - pulsec_com_pulse_lang_RuntimeException_RuntimeException_trace_s0
trace_m244 db "com.pulse.lang.RuntimeException.RuntimeException"
trace_m244_len equ $ - trace_m244
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_trace_s0 db "com.pulse.lang.RuntimeException.RuntimeException(RuntimeException.pulse:20)"
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_trace_s0
trace_m246 db "com.pulse.lang.RuntimeException.RuntimeException"
trace_m246_len equ $ - trace_m246
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0 db "com.pulse.lang.RuntimeException.RuntimeException(RuntimeException.pulse:28)"
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0
trace_m248 db "com.pulse.lang.Short.valueOf"
trace_m248_len equ $ - trace_m248
pulsec_com_pulse_lang_Short_valueOf__short_trace_s0 db "com.pulse.lang.Short.valueOf(Short.pulse:24)"
pulsec_com_pulse_lang_Short_valueOf__short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_valueOf__short_trace_s0
trace_m250 db "com.pulse.lang.Short.parse"
trace_m250_len equ $ - trace_m250
pulsec_com_pulse_lang_Short_parse__String_trace_s0 db "com.pulse.lang.Short.parse(Short.pulse:32)"
pulsec_com_pulse_lang_Short_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s0
pulsec_com_pulse_lang_Short_parse__String_trace_s1 db "com.pulse.lang.Short.parse(Short.pulse:33)"
pulsec_com_pulse_lang_Short_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s1
pulsec_com_pulse_lang_Short_parse__String_trace_s2 db "com.pulse.lang.Short.parse(Short.pulse:34)"
pulsec_com_pulse_lang_Short_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s2
pulsec_com_pulse_lang_Short_parse__String_trace_s3 db "com.pulse.lang.Short.parse(Short.pulse:36)"
pulsec_com_pulse_lang_Short_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s3
trace_m255 db "com.pulse.lang.Short.shortValue"
trace_m255_len equ $ - trace_m255
pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0 db "com.pulse.lang.Short.shortValue(Short.pulse:44)"
pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0
trace_m257 db "com.pulse.lang.Short.equals"
trace_m257_len equ $ - trace_m257
pulsec_com_pulse_lang_Short_equals__short_short_trace_s0 db "com.pulse.lang.Short.equals(Short.pulse:52)"
pulsec_com_pulse_lang_Short_equals__short_short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_equals__short_short_trace_s0
trace_m259 db "com.pulse.lang.Short.compare"
trace_m259_len equ $ - trace_m259
pulsec_com_pulse_lang_Short_compare__short_short_trace_s0 db "com.pulse.lang.Short.compare(Short.pulse:60)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
pulsec_com_pulse_lang_Short_compare__short_short_trace_s1 db "com.pulse.lang.Short.compare(Short.pulse:61)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s1_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s1
pulsec_com_pulse_lang_Short_compare__short_short_trace_s2 db "com.pulse.lang.Short.compare(Short.pulse:63)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
pulsec_com_pulse_lang_Short_compare__short_short_trace_s3 db "com.pulse.lang.Short.compare(Short.pulse:64)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s3_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s3
pulsec_com_pulse_lang_Short_compare__short_short_trace_s4 db "com.pulse.lang.Short.compare(Short.pulse:66)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s4_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s4
trace_m265 db "com.pulse.lang.Short.toString"
trace_m265_len equ $ - trace_m265
pulsec_com_pulse_lang_Short_toString__short_trace_s0 db "com.pulse.lang.Short.toString(Short.pulse:74)"
pulsec_com_pulse_lang_Short_toString__short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_toString__short_trace_s0
trace_m267 db "com.pulse.lang.String.length"
trace_m267_len equ $ - trace_m267
pulsec_com_pulse_lang_String_length_trace_s0 db "com.pulse.lang.String.length(String.pulse:13)"
pulsec_com_pulse_lang_String_length_trace_s0_len equ $ - pulsec_com_pulse_lang_String_length_trace_s0
trace_m269 db "com.pulse.lang.String.isEmpty"
trace_m269_len equ $ - trace_m269
pulsec_com_pulse_lang_String_isEmpty_trace_s0 db "com.pulse.lang.String.isEmpty(String.pulse:21)"
pulsec_com_pulse_lang_String_isEmpty_trace_s0_len equ $ - pulsec_com_pulse_lang_String_isEmpty_trace_s0
trace_m271 db "com.pulse.lang.String.concat"
trace_m271_len equ $ - trace_m271
pulsec_com_pulse_lang_String_concat__String_trace_s0 db "com.pulse.lang.String.concat(String.pulse:29)"
pulsec_com_pulse_lang_String_concat__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_concat__String_trace_s0
trace_m273 db "com.pulse.lang.String.charAt"
trace_m273_len equ $ - trace_m273
pulsec_com_pulse_lang_String_charAt__int_trace_s0 db "com.pulse.lang.String.charAt(String.pulse:37)"
pulsec_com_pulse_lang_String_charAt__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_charAt__int_trace_s0
trace_m275 db "com.pulse.lang.String.substring"
trace_m275_len equ $ - trace_m275
pulsec_com_pulse_lang_String_substring__int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:45)"
pulsec_com_pulse_lang_String_substring__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_substring__int_trace_s0
trace_m277 db "com.pulse.lang.String.substring"
trace_m277_len equ $ - trace_m277
pulsec_com_pulse_lang_String_substring__int_int_trace_s0 db "com.pulse.lang.String.substring(String.pulse:53)"
pulsec_com_pulse_lang_String_substring__int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_substring__int_int_trace_s0
trace_m279 db "com.pulse.lang.String.equals"
trace_m279_len equ $ - trace_m279
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
trace_m291 db "com.pulse.lang.String.startsWith"
trace_m291_len equ $ - trace_m291
pulsec_com_pulse_lang_String_startsWith__String_trace_s0 db "com.pulse.lang.String.startsWith(String.pulse:83)"
pulsec_com_pulse_lang_String_startsWith__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_startsWith__String_trace_s0
trace_m293 db "com.pulse.lang.String.endsWith"
trace_m293_len equ $ - trace_m293
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
trace_m301 db "com.pulse.lang.String.contains"
trace_m301_len equ $ - trace_m301
pulsec_com_pulse_lang_String_contains__String_trace_s0 db "com.pulse.lang.String.contains(String.pulse:106)"
pulsec_com_pulse_lang_String_contains__String_trace_s0_len equ $ - pulsec_com_pulse_lang_String_contains__String_trace_s0
trace_m303 db "com.pulse.lang.String.indexOf"
trace_m303_len equ $ - trace_m303
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
trace_m324 db "com.pulse.lang.String.lastIndexOf"
trace_m324_len equ $ - trace_m324
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
trace_m344 db "com.pulse.lang.String.trim"
trace_m344_len equ $ - trace_m344
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
trace_m358 db "com.pulse.lang.String.valueOf"
trace_m358_len equ $ - trace_m358
pulsec_com_pulse_lang_String_valueOf__int_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:207)"
pulsec_com_pulse_lang_String_valueOf__int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__int_trace_s0
trace_m360 db "com.pulse.lang.String.valueOf"
trace_m360_len equ $ - trace_m360
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:215)"
pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__boolean_trace_s0
trace_m362 db "com.pulse.lang.String.valueOf"
trace_m362_len equ $ - trace_m362
pulsec_com_pulse_lang_String_valueOf__char_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:223)"
pulsec_com_pulse_lang_String_valueOf__char_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__char_trace_s0
trace_m364 db "com.pulse.lang.String.valueOf"
trace_m364_len equ $ - trace_m364
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0 db "com.pulse.lang.String.valueOf(String.pulse:231)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s0
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1 db "com.pulse.lang.String.valueOf(String.pulse:232)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s1_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s1
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2 db "com.pulse.lang.String.valueOf(String.pulse:234)"
pulsec_com_pulse_lang_String_valueOf__Object_trace_s2_len equ $ - pulsec_com_pulse_lang_String_valueOf__Object_trace_s2
trace_m368 db "com.pulse.lang.String.runtimeCharAt"
trace_m368_len equ $ - trace_m368
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0 db "com.pulse.lang.String.runtimeCharAt(String.pulse:242)"
pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeCharAt__String_int_trace_s0
trace_m370 db "com.pulse.lang.String.runtimeSubstring"
trace_m370_len equ $ - trace_m370
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0 db "com.pulse.lang.String.runtimeSubstring(String.pulse:250)"
pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeSubstring__String_int_int_trace_s0
trace_m372 db "com.pulse.lang.String.runtimeFromChar"
trace_m372_len equ $ - trace_m372
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0 db "com.pulse.lang.String.runtimeFromChar(String.pulse:258)"
pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0_len equ $ - pulsec_com_pulse_lang_String_runtimeFromChar__char_trace_s0
trace_m374 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m374_len equ $ - trace_m374
pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0 db "com.pulse.lang.StringBuilder.StringBuilder(StringBuilder.pulse:14)"
pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0
trace_m376 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m376_len equ $ - trace_m376
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0 db "com.pulse.lang.StringBuilder.StringBuilder(StringBuilder.pulse:22)"
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0
trace_m378 db "com.pulse.lang.StringBuilder.append"
trace_m378_len equ $ - trace_m378
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:30)"
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:31)"
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1
trace_m381 db "com.pulse.lang.StringBuilder.append"
trace_m381_len equ $ - trace_m381
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:39)"
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:40)"
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1
trace_m384 db "com.pulse.lang.StringBuilder.append"
trace_m384_len equ $ - trace_m384
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:48)"
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:49)"
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1
trace_m387 db "com.pulse.lang.StringBuilder.append"
trace_m387_len equ $ - trace_m387
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:57)"
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:58)"
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1
trace_m390 db "com.pulse.lang.StringBuilder.append"
trace_m390_len equ $ - trace_m390
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:66)"
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:67)"
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1
trace_m393 db "com.pulse.lang.StringBuilder.length"
trace_m393_len equ $ - trace_m393
pulsec_com_pulse_lang_StringBuilder_length_trace_s0 db "com.pulse.lang.StringBuilder.length(StringBuilder.pulse:75)"
pulsec_com_pulse_lang_StringBuilder_length_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_length_trace_s0
trace_m395 db "com.pulse.lang.StringBuilder.clear"
trace_m395_len equ $ - trace_m395
pulsec_com_pulse_lang_StringBuilder_clear_trace_s0 db "com.pulse.lang.StringBuilder.clear(StringBuilder.pulse:83)"
pulsec_com_pulse_lang_StringBuilder_clear_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_clear_trace_s0
trace_m397 db "com.pulse.lang.StringBuilder.insert"
trace_m397_len equ $ - trace_m397
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:91)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:92)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:93)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2_len equ $ - pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:94)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3_len equ $ - pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:95)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4_len equ $ - pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4
trace_m403 db "com.pulse.lang.StringBuilder.delete"
trace_m403_len equ $ - trace_m403
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:103)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:104)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:105)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2_len equ $ - pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:106)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3_len equ $ - pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3
trace_m408 db "com.pulse.lang.StringBuilder.setLength"
trace_m408_len equ $ - trace_m408
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:114)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:115)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:116)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:117)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:119)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:120)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:121)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6_len equ $ - pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6
trace_m416 db "com.pulse.lang.StringBuilder.toString"
trace_m416_len equ $ - trace_m416
pulsec_com_pulse_lang_StringBuilder_toString_trace_s0 db "com.pulse.lang.StringBuilder.toString(StringBuilder.pulse:130)"
pulsec_com_pulse_lang_StringBuilder_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_StringBuilder_toString_trace_s0
trace_m418 db "com.pulse.lang.Throwable.Throwable"
trace_m418_len equ $ - trace_m418
pulsec_com_pulse_lang_Throwable_Throwable_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:17)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:18)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:19)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s2
trace_m422 db "com.pulse.lang.Throwable.Throwable"
trace_m422_len equ $ - trace_m422
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:27)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:28)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:29)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2
trace_m426 db "com.pulse.lang.Throwable.Throwable"
trace_m426_len equ $ - trace_m426
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:37)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:38)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:39)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2
trace_m430 db "com.pulse.lang.Throwable.initThrowableState"
trace_m430_len equ $ - trace_m430
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:47)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:48)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:49)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2
trace_m434 db "com.pulse.lang.Throwable.getMessage"
trace_m434_len equ $ - trace_m434
pulsec_com_pulse_lang_Throwable_getMessage_trace_s0 db "com.pulse.lang.Throwable.getMessage(Throwable.pulse:57)"
pulsec_com_pulse_lang_Throwable_getMessage_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_getMessage_trace_s0
trace_m436 db "com.pulse.lang.Throwable.getCause"
trace_m436_len equ $ - trace_m436
pulsec_com_pulse_lang_Throwable_getCause_trace_s0 db "com.pulse.lang.Throwable.getCause(Throwable.pulse:65)"
pulsec_com_pulse_lang_Throwable_getCause_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_getCause_trace_s0
trace_m438 db "com.pulse.lang.Throwable.initCause"
trace_m438_len equ $ - trace_m438
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:73)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s1 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:74)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:76)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s3 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:77)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s3_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s3
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s4 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:79)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s4_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s4
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s5 db "com.pulse.lang.Throwable.initCause(Throwable.pulse:80)"
pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s5_len equ $ - pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s5
trace_m445 db "com.pulse.lang.Throwable.formatThrowable"
trace_m445_len equ $ - trace_m445
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s0 db "com.pulse.lang.Throwable.formatThrowable(Throwable.pulse:88)"
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s0
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1 db "com.pulse.lang.Throwable.formatThrowable(Throwable.pulse:89)"
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s2 db "com.pulse.lang.Throwable.formatThrowable(Throwable.pulse:90)"
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s2
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s3 db "com.pulse.lang.Throwable.formatThrowable(Throwable.pulse:92)"
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s3_len equ $ - pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s3
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s4 db "com.pulse.lang.Throwable.formatThrowable(Throwable.pulse:93)"
pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s4_len equ $ - pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s4
trace_m451 db "com.pulse.lang.Throwable.describe"
trace_m451_len equ $ - trace_m451
pulsec_com_pulse_lang_Throwable_describe_trace_s0 db "com.pulse.lang.Throwable.describe(Throwable.pulse:101)"
pulsec_com_pulse_lang_Throwable_describe_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s0
pulsec_com_pulse_lang_Throwable_describe_trace_s1 db "com.pulse.lang.Throwable.describe(Throwable.pulse:102)"
pulsec_com_pulse_lang_Throwable_describe_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s1
pulsec_com_pulse_lang_Throwable_describe_trace_s2 db "com.pulse.lang.Throwable.describe(Throwable.pulse:103)"
pulsec_com_pulse_lang_Throwable_describe_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s2
pulsec_com_pulse_lang_Throwable_describe_trace_s3 db "com.pulse.lang.Throwable.describe(Throwable.pulse:104)"
pulsec_com_pulse_lang_Throwable_describe_trace_s3_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s3
pulsec_com_pulse_lang_Throwable_describe_trace_s4 db "com.pulse.lang.Throwable.describe(Throwable.pulse:106)"
pulsec_com_pulse_lang_Throwable_describe_trace_s4_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s4
pulsec_com_pulse_lang_Throwable_describe_trace_s5 db "com.pulse.lang.Throwable.describe(Throwable.pulse:107)"
pulsec_com_pulse_lang_Throwable_describe_trace_s5_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s5
pulsec_com_pulse_lang_Throwable_describe_trace_s6 db "com.pulse.lang.Throwable.describe(Throwable.pulse:108)"
pulsec_com_pulse_lang_Throwable_describe_trace_s6_len equ $ - pulsec_com_pulse_lang_Throwable_describe_trace_s6
trace_m459 db "com.pulse.lang.Throwable.toString"
trace_m459_len equ $ - trace_m459
pulsec_com_pulse_lang_Throwable_toString_trace_s0 db "com.pulse.lang.Throwable.toString(Throwable.pulse:116)"
pulsec_com_pulse_lang_Throwable_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_toString_trace_s0
trace_m461 db "com.pulse.lang.UByte.valueOf"
trace_m461_len equ $ - trace_m461
pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0 db "com.pulse.lang.UByte.valueOf(UByte.pulse:24)"
pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0
trace_m463 db "com.pulse.lang.UByte.parse"
trace_m463_len equ $ - trace_m463
pulsec_com_pulse_lang_UByte_parse__String_trace_s0 db "com.pulse.lang.UByte.parse(UByte.pulse:32)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_parse__String_trace_s0
pulsec_com_pulse_lang_UByte_parse__String_trace_s1 db "com.pulse.lang.UByte.parse(UByte.pulse:33)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_UByte_parse__String_trace_s1
pulsec_com_pulse_lang_UByte_parse__String_trace_s2 db "com.pulse.lang.UByte.parse(UByte.pulse:34)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_UByte_parse__String_trace_s2
pulsec_com_pulse_lang_UByte_parse__String_trace_s3 db "com.pulse.lang.UByte.parse(UByte.pulse:36)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_UByte_parse__String_trace_s3
trace_m468 db "com.pulse.lang.UByte.ubyteValue"
trace_m468_len equ $ - trace_m468
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0 db "com.pulse.lang.UByte.ubyteValue(UByte.pulse:44)"
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0
trace_m470 db "com.pulse.lang.UByte.equals"
trace_m470_len equ $ - trace_m470
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0 db "com.pulse.lang.UByte.equals(UByte.pulse:52)"
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0
trace_m472 db "com.pulse.lang.UByte.compare"
trace_m472_len equ $ - trace_m472
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0 db "com.pulse.lang.UByte.compare(UByte.pulse:60)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1 db "com.pulse.lang.UByte.compare(UByte.pulse:61)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1_len equ $ - pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2 db "com.pulse.lang.UByte.compare(UByte.pulse:63)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len equ $ - pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3 db "com.pulse.lang.UByte.compare(UByte.pulse:64)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3_len equ $ - pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4 db "com.pulse.lang.UByte.compare(UByte.pulse:66)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4_len equ $ - pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4
trace_m478 db "com.pulse.lang.UByte.toString"
trace_m478_len equ $ - trace_m478
pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0 db "com.pulse.lang.UByte.toString(UByte.pulse:74)"
pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0_len equ $ - pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0
trace_m480 db "com.pulse.lang.UInteger.valueOf"
trace_m480_len equ $ - trace_m480
pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0 db "com.pulse.lang.UInteger.valueOf(UInteger.pulse:24)"
pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0
trace_m482 db "com.pulse.lang.UInteger.parse"
trace_m482_len equ $ - trace_m482
pulsec_com_pulse_lang_UInteger_parse__String_trace_s0 db "com.pulse.lang.UInteger.parse(UInteger.pulse:32)"
pulsec_com_pulse_lang_UInteger_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_parse__String_trace_s0
pulsec_com_pulse_lang_UInteger_parse__String_trace_s1 db "com.pulse.lang.UInteger.parse(UInteger.pulse:33)"
pulsec_com_pulse_lang_UInteger_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_UInteger_parse__String_trace_s1
trace_m485 db "com.pulse.lang.UInteger.uintValue"
trace_m485_len equ $ - trace_m485
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0 db "com.pulse.lang.UInteger.uintValue(UInteger.pulse:41)"
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0
trace_m487 db "com.pulse.lang.UInteger.equals"
trace_m487_len equ $ - trace_m487
pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0 db "com.pulse.lang.UInteger.equals(UInteger.pulse:49)"
pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0
trace_m489 db "com.pulse.lang.UInteger.compare"
trace_m489_len equ $ - trace_m489
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0 db "com.pulse.lang.UInteger.compare(UInteger.pulse:57)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1 db "com.pulse.lang.UInteger.compare(UInteger.pulse:58)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2 db "com.pulse.lang.UInteger.compare(UInteger.pulse:60)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3 db "com.pulse.lang.UInteger.compare(UInteger.pulse:61)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4 db "com.pulse.lang.UInteger.compare(UInteger.pulse:63)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4
trace_m495 db "com.pulse.lang.UInteger.toString"
trace_m495_len equ $ - trace_m495
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0 db "com.pulse.lang.UInteger.toString(UInteger.pulse:71)"
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s1 db "com.pulse.lang.UInteger.toString(UInteger.pulse:72)"
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s1_len equ $ - pulsec_com_pulse_lang_UInteger_toString__uint_trace_s1
trace_m498 db "com.pulse.lang.ULong.valueOf"
trace_m498_len equ $ - trace_m498
pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0 db "com.pulse.lang.ULong.valueOf(ULong.pulse:24)"
pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0
trace_m500 db "com.pulse.lang.ULong.parse"
trace_m500_len equ $ - trace_m500
pulsec_com_pulse_lang_ULong_parse__String_trace_s0 db "com.pulse.lang.ULong.parse(ULong.pulse:32)"
pulsec_com_pulse_lang_ULong_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_parse__String_trace_s0
pulsec_com_pulse_lang_ULong_parse__String_trace_s1 db "com.pulse.lang.ULong.parse(ULong.pulse:33)"
pulsec_com_pulse_lang_ULong_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_ULong_parse__String_trace_s1
trace_m503 db "com.pulse.lang.ULong.ulongValue"
trace_m503_len equ $ - trace_m503
pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0 db "com.pulse.lang.ULong.ulongValue(ULong.pulse:41)"
pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0
trace_m505 db "com.pulse.lang.ULong.equals"
trace_m505_len equ $ - trace_m505
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0 db "com.pulse.lang.ULong.equals(ULong.pulse:49)"
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0
trace_m507 db "com.pulse.lang.ULong.compare"
trace_m507_len equ $ - trace_m507
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0 db "com.pulse.lang.ULong.compare(ULong.pulse:57)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1 db "com.pulse.lang.ULong.compare(ULong.pulse:58)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1_len equ $ - pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2 db "com.pulse.lang.ULong.compare(ULong.pulse:60)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len equ $ - pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3 db "com.pulse.lang.ULong.compare(ULong.pulse:61)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3_len equ $ - pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4 db "com.pulse.lang.ULong.compare(ULong.pulse:63)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4_len equ $ - pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4
trace_m513 db "com.pulse.lang.ULong.toString"
trace_m513_len equ $ - trace_m513
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0 db "com.pulse.lang.ULong.toString(ULong.pulse:71)"
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0_len equ $ - pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s1 db "com.pulse.lang.ULong.toString(ULong.pulse:72)"
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s1_len equ $ - pulsec_com_pulse_lang_ULong_toString__ulong_trace_s1
trace_m516 db "com.pulse.lang.UShort.valueOf"
trace_m516_len equ $ - trace_m516
pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0 db "com.pulse.lang.UShort.valueOf(UShort.pulse:24)"
pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0
trace_m518 db "com.pulse.lang.UShort.parse"
trace_m518_len equ $ - trace_m518
pulsec_com_pulse_lang_UShort_parse__String_trace_s0 db "com.pulse.lang.UShort.parse(UShort.pulse:32)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s0
pulsec_com_pulse_lang_UShort_parse__String_trace_s1 db "com.pulse.lang.UShort.parse(UShort.pulse:33)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s1
pulsec_com_pulse_lang_UShort_parse__String_trace_s2 db "com.pulse.lang.UShort.parse(UShort.pulse:34)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s2
pulsec_com_pulse_lang_UShort_parse__String_trace_s3 db "com.pulse.lang.UShort.parse(UShort.pulse:36)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s3
trace_m523 db "com.pulse.lang.UShort.ushortValue"
trace_m523_len equ $ - trace_m523
pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0 db "com.pulse.lang.UShort.ushortValue(UShort.pulse:44)"
pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0
trace_m525 db "com.pulse.lang.UShort.equals"
trace_m525_len equ $ - trace_m525
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0 db "com.pulse.lang.UShort.equals(UShort.pulse:52)"
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0
trace_m527 db "com.pulse.lang.UShort.compare"
trace_m527_len equ $ - trace_m527
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0 db "com.pulse.lang.UShort.compare(UShort.pulse:60)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1 db "com.pulse.lang.UShort.compare(UShort.pulse:61)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2 db "com.pulse.lang.UShort.compare(UShort.pulse:63)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3 db "com.pulse.lang.UShort.compare(UShort.pulse:64)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4 db "com.pulse.lang.UShort.compare(UShort.pulse:66)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4
trace_m533 db "com.pulse.lang.UShort.toString"
trace_m533_len equ $ - trace_m533
pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0 db "com.pulse.lang.UShort.toString(UShort.pulse:74)"
pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0
trace_m535 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException"
trace_m535_len equ $ - trace_m535
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_trace_s0 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException(UnsupportedOperationException.pulse:12)"
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_trace_s0_len equ $ - pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_trace_s0
trace_m537 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException"
trace_m537_len equ $ - trace_m537
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_trace_s0 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException(UnsupportedOperationException.pulse:20)"
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_trace_s0
trace_m539 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException"
trace_m539_len equ $ - trace_m539
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_trace_s0 db "com.pulse.lang.UnsupportedOperationException.UnsupportedOperationException(UnsupportedOperationException.pulse:28)"
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_trace_s0
trace_m541 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m541_len equ $ - trace_m541
trace_m542 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m542_len equ $ - trace_m542
trace_m543 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m543_len equ $ - trace_m543
trace_m544 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m544_len equ $ - trace_m544
trace_m545 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m545_len equ $ - trace_m545
trace_m546 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m546_len equ $ - trace_m546
trace_m547 db "com.pulse.rt.Intrinsics.panic"
trace_m547_len equ $ - trace_m547
trace_m548 db "com.pulse.rt.Intrinsics.stringConcat"
trace_m548_len equ $ - trace_m548
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0 db "com.pulse.rt.Intrinsics.stringConcat(Intrinsics.pulse:61)"
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0
trace_m550 db "com.pulse.rt.Intrinsics.stringLength"
trace_m550_len equ $ - trace_m550
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0 db "com.pulse.rt.Intrinsics.stringLength(Intrinsics.pulse:69)"
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0
trace_m552 db "com.pulse.rt.Intrinsics.intToString"
trace_m552_len equ $ - trace_m552
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0 db "com.pulse.rt.Intrinsics.intToString(Intrinsics.pulse:77)"
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0
trace_m554 db "com.pulse.rt.Intrinsics.booleanToString"
trace_m554_len equ $ - trace_m554
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0 db "com.pulse.rt.Intrinsics.booleanToString(Intrinsics.pulse:85)"
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0
trace_m556 db "com.pulse.rt.Intrinsics.parseInt"
trace_m556_len equ $ - trace_m556
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0 db "com.pulse.rt.Intrinsics.parseInt(Intrinsics.pulse:93)"
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0
trace_m558 db "com.pulse.rt.Intrinsics.parseBoolean"
trace_m558_len equ $ - trace_m558
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0 db "com.pulse.rt.Intrinsics.parseBoolean(Intrinsics.pulse:101)"
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0
trace_m560 db "com.pulse.rt.Intrinsics.objectClassName"
trace_m560_len equ $ - trace_m560
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectClassName(Intrinsics.pulse:109)"
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0
trace_m562 db "com.pulse.rt.Intrinsics.objectHashCode"
trace_m562_len equ $ - trace_m562
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectHashCode(Intrinsics.pulse:117)"
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0
trace_m564 db "com.pulse.rt.Intrinsics.arrayNew"
trace_m564_len equ $ - trace_m564
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0 db "com.pulse.rt.Intrinsics.arrayNew(Intrinsics.pulse:125)"
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0
trace_m566 db "com.pulse.rt.Intrinsics.arrayLength"
trace_m566_len equ $ - trace_m566
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0 db "com.pulse.rt.Intrinsics.arrayLength(Intrinsics.pulse:133)"
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0
trace_m568 db "com.pulse.rt.Intrinsics.arrayGetInt"
trace_m568_len equ $ - trace_m568
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetInt(Intrinsics.pulse:141)"
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0
trace_m570 db "com.pulse.rt.Intrinsics.arraySetInt"
trace_m570_len equ $ - trace_m570
trace_m571 db "com.pulse.rt.Intrinsics.arrayGetString"
trace_m571_len equ $ - trace_m571
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetString(Intrinsics.pulse:156)"
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0
trace_m573 db "com.pulse.rt.Intrinsics.arraySetString"
trace_m573_len equ $ - trace_m573
trace_m574 db "com.pulse.rt.Intrinsics.listNew"
trace_m574_len equ $ - trace_m574
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0 db "com.pulse.rt.Intrinsics.listNew(Intrinsics.pulse:171)"
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0
trace_m576 db "com.pulse.rt.Intrinsics.listSize"
trace_m576_len equ $ - trace_m576
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0 db "com.pulse.rt.Intrinsics.listSize(Intrinsics.pulse:179)"
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0
trace_m578 db "com.pulse.rt.Intrinsics.listClear"
trace_m578_len equ $ - trace_m578
trace_m579 db "com.pulse.rt.Intrinsics.listAddInt"
trace_m579_len equ $ - trace_m579
trace_m580 db "com.pulse.rt.Intrinsics.listAddString"
trace_m580_len equ $ - trace_m580
trace_m581 db "com.pulse.rt.Intrinsics.listGetInt"
trace_m581_len equ $ - trace_m581
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetInt(Intrinsics.pulse:208)"
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0
trace_m583 db "com.pulse.rt.Intrinsics.listGetString"
trace_m583_len equ $ - trace_m583
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetString(Intrinsics.pulse:216)"
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0
trace_m585 db "com.pulse.rt.Intrinsics.mapNew"
trace_m585_len equ $ - trace_m585
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0 db "com.pulse.rt.Intrinsics.mapNew(Intrinsics.pulse:224)"
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0
trace_m587 db "com.pulse.rt.Intrinsics.mapSize"
trace_m587_len equ $ - trace_m587
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0 db "com.pulse.rt.Intrinsics.mapSize(Intrinsics.pulse:232)"
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0
trace_m589 db "com.pulse.rt.Intrinsics.mapClear"
trace_m589_len equ $ - trace_m589
trace_m590 db "com.pulse.rt.Intrinsics.mapContainsKey"
trace_m590_len equ $ - trace_m590
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapContainsKey(Intrinsics.pulse:247)"
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0
trace_m592 db "com.pulse.rt.Intrinsics.mapPut"
trace_m592_len equ $ - trace_m592
trace_m593 db "com.pulse.rt.Intrinsics.mapPutInt"
trace_m593_len equ $ - trace_m593
trace_m594 db "com.pulse.rt.Intrinsics.mapGet"
trace_m594_len equ $ - trace_m594
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGet(Intrinsics.pulse:269)"
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0
trace_m596 db "com.pulse.rt.Intrinsics.mapGetInt"
trace_m596_len equ $ - trace_m596
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGetInt(Intrinsics.pulse:277)"
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0
rt_obj_class_name_1 db "app.runtime.GameLoop"
rt_obj_class_name_1_len equ $ - rt_obj_class_name_1
rt_obj_class_name_2 db "app.runtime.Main"
rt_obj_class_name_2_len equ $ - rt_obj_class_name_2
rt_obj_class_name_3 db "app.runtime.Rank"
rt_obj_class_name_3_len equ $ - rt_obj_class_name_3
rt_obj_class_name_4 db "app.runtime.Runner"
rt_obj_class_name_4_len equ $ - rt_obj_class_name_4
rt_obj_class_name_5 db "com.pulse.lang.AssertionError"
rt_obj_class_name_5_len equ $ - rt_obj_class_name_5
rt_obj_class_name_6 db "com.pulse.lang.AutoCloseable"
rt_obj_class_name_6_len equ $ - rt_obj_class_name_6
rt_obj_class_name_7 db "com.pulse.lang.Boolean"
rt_obj_class_name_7_len equ $ - rt_obj_class_name_7
rt_obj_class_name_8 db "com.pulse.lang.Byte"
rt_obj_class_name_8_len equ $ - rt_obj_class_name_8
rt_obj_class_name_9 db "com.pulse.lang.Char"
rt_obj_class_name_9_len equ $ - rt_obj_class_name_9
rt_obj_class_name_10 db "com.pulse.lang.Class"
rt_obj_class_name_10_len equ $ - rt_obj_class_name_10
rt_obj_class_name_11 db "com.pulse.lang.Comparable"
rt_obj_class_name_11_len equ $ - rt_obj_class_name_11
rt_obj_class_name_12 db "com.pulse.lang.ConsoleWriter"
rt_obj_class_name_12_len equ $ - rt_obj_class_name_12
rt_obj_class_name_13 db "com.pulse.lang.Double"
rt_obj_class_name_13_len equ $ - rt_obj_class_name_13
rt_obj_class_name_14 db "com.pulse.lang.Enum"
rt_obj_class_name_14_len equ $ - rt_obj_class_name_14
rt_obj_class_name_15 db "com.pulse.lang.Exception"
rt_obj_class_name_15_len equ $ - rt_obj_class_name_15
rt_obj_class_name_16 db "com.pulse.lang.Float"
rt_obj_class_name_16_len equ $ - rt_obj_class_name_16
rt_obj_class_name_17 db "com.pulse.lang.IO"
rt_obj_class_name_17_len equ $ - rt_obj_class_name_17
rt_obj_class_name_18 db "com.pulse.lang.IllegalArgumentException"
rt_obj_class_name_18_len equ $ - rt_obj_class_name_18
rt_obj_class_name_19 db "com.pulse.lang.IllegalStateException"
rt_obj_class_name_19_len equ $ - rt_obj_class_name_19
rt_obj_class_name_20 db "com.pulse.lang.IndexOutOfBoundsException"
rt_obj_class_name_20_len equ $ - rt_obj_class_name_20
rt_obj_class_name_21 db "com.pulse.lang.Integer"
rt_obj_class_name_21_len equ $ - rt_obj_class_name_21
rt_obj_class_name_22 db "com.pulse.lang.Iterable"
rt_obj_class_name_22_len equ $ - rt_obj_class_name_22
rt_obj_class_name_23 db "com.pulse.lang.Iterator"
rt_obj_class_name_23_len equ $ - rt_obj_class_name_23
rt_obj_class_name_24 db "com.pulse.lang.Long"
rt_obj_class_name_24_len equ $ - rt_obj_class_name_24
rt_obj_class_name_25 db "com.pulse.lang.NotNull"
rt_obj_class_name_25_len equ $ - rt_obj_class_name_25
rt_obj_class_name_26 db "com.pulse.lang.NullPointerException"
rt_obj_class_name_26_len equ $ - rt_obj_class_name_26
rt_obj_class_name_27 db "com.pulse.lang.NumberFormatException"
rt_obj_class_name_27_len equ $ - rt_obj_class_name_27
rt_obj_class_name_28 db "com.pulse.lang.Object"
rt_obj_class_name_28_len equ $ - rt_obj_class_name_28
rt_obj_class_name_29 db "com.pulse.lang.Override"
rt_obj_class_name_29_len equ $ - rt_obj_class_name_29
rt_obj_class_name_30 db "com.pulse.lang.PrintStream"
rt_obj_class_name_30_len equ $ - rt_obj_class_name_30
rt_obj_class_name_31 db "com.pulse.lang.RuntimeException"
rt_obj_class_name_31_len equ $ - rt_obj_class_name_31
rt_obj_class_name_32 db "com.pulse.lang.Short"
rt_obj_class_name_32_len equ $ - rt_obj_class_name_32
rt_obj_class_name_33 db "com.pulse.lang.String"
rt_obj_class_name_33_len equ $ - rt_obj_class_name_33
rt_obj_class_name_34 db "com.pulse.lang.StringBuilder"
rt_obj_class_name_34_len equ $ - rt_obj_class_name_34
rt_obj_class_name_35 db "com.pulse.lang.System"
rt_obj_class_name_35_len equ $ - rt_obj_class_name_35
rt_obj_class_name_36 db "com.pulse.lang.Test"
rt_obj_class_name_36_len equ $ - rt_obj_class_name_36
rt_obj_class_name_37 db "com.pulse.lang.Throwable"
rt_obj_class_name_37_len equ $ - rt_obj_class_name_37
rt_obj_class_name_38 db "com.pulse.lang.UByte"
rt_obj_class_name_38_len equ $ - rt_obj_class_name_38
rt_obj_class_name_39 db "com.pulse.lang.UInteger"
rt_obj_class_name_39_len equ $ - rt_obj_class_name_39
rt_obj_class_name_40 db "com.pulse.lang.ULong"
rt_obj_class_name_40_len equ $ - rt_obj_class_name_40
rt_obj_class_name_41 db "com.pulse.lang.UShort"
rt_obj_class_name_41_len equ $ - rt_obj_class_name_41
rt_obj_class_name_42 db "com.pulse.lang.UnsupportedOperationException"
rt_obj_class_name_42_len equ $ - rt_obj_class_name_42
rt_obj_class_name_43 db "com.pulse.lang.Void"
rt_obj_class_name_43_len equ $ - rt_obj_class_name_43
rt_obj_class_name_44 db "com.pulse.rt.Intrinsics"
rt_obj_class_name_44_len equ $ - rt_obj_class_name_44

.code
pulsec_rt_init proc
    sub rsp, 40
    mov eax, dword ptr [rt_runtime_abi_version]
    cmp eax, dword ptr [rt_compiler_abi_expected]
    jne pulsec_rt_init_abi_mismatch
    mov eax, dword ptr [rt_runtime_object_model_abi_version]
    cmp eax, dword ptr [rt_compiler_object_model_abi_expected]
    jne pulsec_rt_init_obj_abi_mismatch
    cmp dword ptr [rt_runtime_init_state], 1
    je pulsec_rt_init_done
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
    mov dword ptr [rt_runtime_init_state], 1
    mov eax, dword ptr [rt_runtime_init_epoch]
    add eax, 1
    mov dword ptr [rt_runtime_init_epoch], eax
pulsec_rt_init_done:
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_init_abi_mismatch:
    lea rcx, rt_abi_mismatch_err
    mov edx, rt_abi_mismatch_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_init_obj_abi_mismatch:
    lea rcx, rt_object_model_abi_mismatch_err
    mov edx, rt_object_model_abi_mismatch_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
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

pulsec_rt_shutdown proc
    cmp dword ptr [rt_runtime_init_state], 1
    jne pulsec_rt_shutdown_done
pulsec_rt_shutdown_teardown:
    sub rsp, 40
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_shutdown_free_data
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rt_str_lens_ptr]
    test r8, r8
    jz pulsec_rt_shutdown_free_data
    call HeapFree
pulsec_rt_shutdown_free_data:
    mov rcx, qword ptr [rsp+32]
    xor edx, edx
    mov r8, qword ptr [rt_str_data_ptr]
    test r8, r8
    jz pulsec_rt_shutdown_final
    call HeapFree
pulsec_rt_shutdown_final:
    mov qword ptr [rt_str_lens_ptr], 0
    mov qword ptr [rt_str_data_ptr], 0
    mov qword ptr [rt_weak_free_next_ptr], 0
    mov qword ptr [rt_weak_target_slot_ptr], 0
    mov qword ptr [rt_weak_target_gen_ptr], 0
    mov qword ptr [rt_weak_generation_ptr], 0
    mov qword ptr [rt_arr_len_ptr], 0
    mov qword ptr [rt_arr_alive_ptr], 0
    mov qword ptr [rt_arr_i_ptr_ptr], 0
    mov qword ptr [rt_arr_s_ptr_ptr], 0
    mov qword ptr [rt_list_size_ptr], 0
    mov qword ptr [rt_list_cap_ptr], 0
    mov qword ptr [rt_list_alive_ptr], 0
    mov qword ptr [rt_list_kind_ptr], 0
    mov qword ptr [rt_list_i_ptr_ptr], 0
    mov qword ptr [rt_list_s_ptr_ptr], 0
    mov qword ptr [rt_map_size_ptr], 0
    mov qword ptr [rt_map_cap_ptr], 0
    mov qword ptr [rt_map_alive_ptr], 0
    mov qword ptr [rt_map_keys_ptr_ptr], 0
    mov qword ptr [rt_map_tags_ptr_ptr], 0
    mov qword ptr [rt_map_i_ptr_ptr], 0
    mov qword ptr [rt_map_s_ptr_ptr], 0
    mov dword ptr [rt_runtime_init_state], 0
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_shutdown_done:
    xor eax, eax
    ret
pulsec_rt_shutdown endp

pulsec_rt_objectNew proc
    mov r10d, ecx
    mov eax, dword ptr [rt_arc_free_head]
    cmp eax, 1
    jb pulsec_rt_objectNew_allocslot_fresh
    cmp eax, dword ptr [rt_slot_capacity]
    ja pulsec_rt_objectNew_allocslot_fresh
    mov r9d, eax
    mov eax, dword ptr [rt_arc_free_next+r9*4]
    mov dword ptr [rt_arc_free_head], eax
    mov eax, r9d
    mov dword ptr [rt_arc_free_next+rax*4], 0
    jmp pulsec_rt_objectNew_allocslot_done
pulsec_rt_objectNew_allocslot_fresh:
    mov eax, dword ptr [rt_handle_next]
    cmp eax, dword ptr [rt_slot_capacity]
    jb pulsec_rt_objectNew_allocslot_have_room
    mov rcx, rax
    add ecx, 1
    sub rsp, 40
    call pulsec_rt_ensureSlotCapacity
    add rsp, 40
    cmp eax, 0
    jne pulsec_rt_objectNew_fail
    mov eax, dword ptr [rt_handle_next]
pulsec_rt_objectNew_allocslot_have_room:
    add eax, 1
    mov dword ptr [rt_handle_next], eax
pulsec_rt_objectNew_allocslot_done:
    mov ecx, eax
    cmp ecx, 4294967295
    ja pulsec_rt_objectNew_cap_fail
    mov r11, qword ptr [pulsec_rt_obj_class_ids]
    mov dword ptr [r11+rcx*4], r10d
    mov dword ptr [rt_arc_kinds+rcx*4], 1
    mov dword ptr [rt_arc_refcounts+rcx*4], 1
    mov dword ptr [rt_arc_flags+rcx*4], 0
    mov dword ptr [rt_arc_meta+rcx*4], 0
    mov edx, dword ptr [rt_arc_generation+rcx*4]
    add edx, 1
    jnz pulsec_rt_objectNew_gen_ok
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
pulsec_rt_objectNew_gen_ok:
    mov dword ptr [rt_arc_generation+rcx*4], edx
    mov eax, ecx
    shl rdx, 32
    or rax, rdx
    ret
pulsec_rt_objectNew_cap_fail:
    mov dword ptr [rt_arc_refcounts+rcx*4], 0
    mov dword ptr [rt_arc_kinds+rcx*4], 0
    mov dword ptr [rt_arc_flags+rcx*4], 0
    mov dword ptr [rt_arc_meta+rcx*4], 0
    mov eax, dword ptr [rt_arc_free_head]
    mov dword ptr [rt_arc_free_next+rcx*4], eax
    mov dword ptr [rt_arc_free_head], ecx
    jmp pulsec_rt_objectNew_fail
pulsec_rt_objectNew_fail:
    sub rsp, 40
    lea rcx, rt_object_alloc_err
    mov edx, rt_object_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_objectNew endp

pulsec_rt_objectClassId proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r11, rcx
    shr r11, 32
    cmp r10d, 1
    jb pulsec_rt_objectClassId_invalid
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_objectClassId_invalid
    test r11d, r11d
    jz pulsec_rt_objectClassId_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_objectClassId_stale
pulsec_rt_objectClassId_plain:
    cmp dword ptr [rt_arc_refcounts+r10*4], 0
    je pulsec_rt_objectClassId_stale
    cmp dword ptr [rt_arc_kinds+r10*4], 3
    je pulsec_rt_objectClassId_string_kind
    cmp dword ptr [rt_arc_kinds+r10*4], 1
    jne pulsec_rt_objectClassId_stale
    mov rax, qword ptr [pulsec_rt_obj_class_ids]
    mov eax, dword ptr [rax+r10*4]
    ret
pulsec_rt_objectClassId_string_kind:
    mov eax, 33
    ret
pulsec_rt_objectClassId_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_objectClassId_invalid:
    xor eax, eax
    ret
pulsec_rt_objectClassId endp

pulsec_rt_objectHashCode proc
    test rcx, rcx
    jz pulsec_rt_objectHashCode_done
    mov eax, ecx
    mov rdx, rcx
    shr rdx, 32
    xor eax, edx
    test eax, eax
    jnz pulsec_rt_objectHashCode_done
    mov eax, 1
pulsec_rt_objectHashCode_done:
    ret
pulsec_rt_objectHashCode endp

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

pulsec_rt_fpToInt proc
    movq xmm0, rcx
    ucomisd xmm0, xmm0
    jp pulsec_rt_fpToInt_nan
    cvttsd2si eax, xmm0
    cmp eax, 80000000h
    je pulsec_rt_fpToInt_check_overflow
pulsec_rt_fpToInt_done:
    ret
pulsec_rt_fpToInt_check_overflow:
    mov rax, qword ptr [rt_fp_int_min]
    movq xmm1, rax
    ucomisd xmm0, xmm1
    je pulsec_rt_fpToInt_done
    xorpd xmm1, xmm1
    ucomisd xmm0, xmm1
    jb pulsec_rt_fpToInt_neg_overflow
    mov eax, 7fffffffh
    ret
pulsec_rt_fpToInt_neg_overflow:
    mov eax, 80000000h
    ret
pulsec_rt_fpToInt_nan:
    xor eax, eax
    ret
pulsec_rt_fpToInt endp

pulsec_rt_fpToLong proc
    movq xmm0, rcx
    ucomisd xmm0, xmm0
    jp pulsec_rt_fpToLong_nan
    cvttsd2si rax, xmm0
    mov r10, 08000000000000000h
    cmp rax, r10
    je pulsec_rt_fpToLong_check_overflow
pulsec_rt_fpToLong_done:
    ret
pulsec_rt_fpToLong_check_overflow:
    mov r10, qword ptr [rt_fp_long_min]
    movq xmm1, r10
    ucomisd xmm0, xmm1
    je pulsec_rt_fpToLong_done
    xorpd xmm1, xmm1
    ucomisd xmm0, xmm1
    jb pulsec_rt_fpToLong_neg_overflow
    mov rax, 07fffffffffffffffh
    ret
pulsec_rt_fpToLong_neg_overflow:
    mov rax, 08000000000000000h
    ret
pulsec_rt_fpToLong_nan:
    xor eax, eax
    ret
pulsec_rt_fpToLong endp

pulsec_rt_tracePush proc
    mov eax, dword ptr [rt_trace_depth]
    cmp eax, 1023
    ja pulsec_rt_tracePush_done
    mov r8d, eax
    lea r10, rt_trace_ptrs
    mov qword ptr [r10+r8*8], rcx
    lea r10, rt_trace_lens
    mov dword ptr [r10+r8*4], edx
    add eax, 1
    mov dword ptr [rt_trace_depth], eax
pulsec_rt_tracePush_done:
    xor eax, eax
    ret
pulsec_rt_tracePush endp

pulsec_rt_traceUpdateTop proc
    mov eax, dword ptr [rt_trace_depth]
    test eax, eax
    jz pulsec_rt_traceUpdateTop_done
    sub eax, 1
    mov r8d, eax
    lea r10, rt_trace_ptrs
    mov qword ptr [r10+r8*8], rcx
    lea r10, rt_trace_lens
    mov dword ptr [r10+r8*4], edx
pulsec_rt_traceUpdateTop_done:
    xor eax, eax
    ret
pulsec_rt_traceUpdateTop endp

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
    lea r10, rt_trace_ptrs
    mov rcx, qword ptr [r10+r8*8]
    lea r10, rt_trace_lens
    mov edx, dword ptr [r10+r8*4]
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

pulsec_rt_pushExceptionHandler proc
    mov eax, dword ptr [rt_exc_depth]
    cmp eax, 1023
    ja pulsec_rt_pushExceptionHandler_overflow
    mov r8d, eax
    lea r10, rt_exc_target_ptrs
    mov qword ptr [r10+r8*8], rcx
    lea r10, rt_exc_saved_rsp
    mov qword ptr [r10+r8*8], rdx
    lea r10, rt_exc_trace_depths
    mov ecx, dword ptr [rt_trace_depth]
    mov dword ptr [r10+r8*4], ecx
    add eax, 1
    mov dword ptr [rt_exc_depth], eax
pulsec_rt_pushExceptionHandler_done:
    xor eax, eax
    ret
pulsec_rt_pushExceptionHandler_overflow:
    sub rsp, 40
    lea rcx, rt_exception_stack_overflow_err
    mov edx, rt_exception_stack_overflow_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
    xor eax, eax
    ret
pulsec_rt_pushExceptionHandler endp

pulsec_rt_popExceptionHandler proc
    mov eax, dword ptr [rt_exc_depth]
    test eax, eax
    jz pulsec_rt_popExceptionHandler_done
    sub eax, 1
    mov dword ptr [rt_exc_depth], eax
pulsec_rt_popExceptionHandler_done:
    xor eax, eax
    ret
pulsec_rt_popExceptionHandler endp

pulsec_rt_takePendingException proc
    mov rax, qword ptr [rt_pending_exception]
    mov qword ptr [rt_pending_exception], 0
    ret
pulsec_rt_takePendingException endp

pulsec_rt_throw proc
    mov qword ptr [rt_pending_exception], rcx
    mov eax, dword ptr [rt_exc_depth]
    test eax, eax
    jz pulsec_rt_throw_uncaught
    sub eax, 1
    mov dword ptr [rt_exc_depth], eax
    mov r8d, eax
    lea r10, rt_exc_target_ptrs
    mov r11, qword ptr [r10+r8*8]
    lea r10, rt_exc_saved_rsp
    mov rdx, qword ptr [r10+r8*8]
    lea r10, rt_exc_trace_depths
    mov ecx, dword ptr [r10+r8*4]
    mov dword ptr [rt_trace_depth], ecx
    mov rsp, rdx
    jmp r11
pulsec_rt_throw_uncaught:
    mov rax, rcx
    ret
pulsec_rt_throw endp

pulsec_rt_objectClassName proc
    sub rsp, 56
    call pulsec_rt_objectClassId
    cmp eax, 1
    je pulsec_rt_objectClassName_c1
    cmp eax, 2
    je pulsec_rt_objectClassName_c2
    cmp eax, 3
    je pulsec_rt_objectClassName_c3
    cmp eax, 4
    je pulsec_rt_objectClassName_c4
    cmp eax, 5
    je pulsec_rt_objectClassName_c5
    cmp eax, 6
    je pulsec_rt_objectClassName_c6
    cmp eax, 7
    je pulsec_rt_objectClassName_c7
    cmp eax, 8
    je pulsec_rt_objectClassName_c8
    cmp eax, 9
    je pulsec_rt_objectClassName_c9
    cmp eax, 10
    je pulsec_rt_objectClassName_c10
    cmp eax, 11
    je pulsec_rt_objectClassName_c11
    cmp eax, 12
    je pulsec_rt_objectClassName_c12
    cmp eax, 13
    je pulsec_rt_objectClassName_c13
    cmp eax, 14
    je pulsec_rt_objectClassName_c14
    cmp eax, 15
    je pulsec_rt_objectClassName_c15
    cmp eax, 16
    je pulsec_rt_objectClassName_c16
    cmp eax, 17
    je pulsec_rt_objectClassName_c17
    cmp eax, 18
    je pulsec_rt_objectClassName_c18
    cmp eax, 19
    je pulsec_rt_objectClassName_c19
    cmp eax, 20
    je pulsec_rt_objectClassName_c20
    cmp eax, 21
    je pulsec_rt_objectClassName_c21
    cmp eax, 22
    je pulsec_rt_objectClassName_c22
    cmp eax, 23
    je pulsec_rt_objectClassName_c23
    cmp eax, 24
    je pulsec_rt_objectClassName_c24
    cmp eax, 25
    je pulsec_rt_objectClassName_c25
    cmp eax, 26
    je pulsec_rt_objectClassName_c26
    cmp eax, 27
    je pulsec_rt_objectClassName_c27
    cmp eax, 28
    je pulsec_rt_objectClassName_c28
    cmp eax, 29
    je pulsec_rt_objectClassName_c29
    cmp eax, 30
    je pulsec_rt_objectClassName_c30
    cmp eax, 31
    je pulsec_rt_objectClassName_c31
    cmp eax, 32
    je pulsec_rt_objectClassName_c32
    cmp eax, 33
    je pulsec_rt_objectClassName_c33
    cmp eax, 34
    je pulsec_rt_objectClassName_c34
    cmp eax, 35
    je pulsec_rt_objectClassName_c35
    cmp eax, 36
    je pulsec_rt_objectClassName_c36
    cmp eax, 37
    je pulsec_rt_objectClassName_c37
    cmp eax, 38
    je pulsec_rt_objectClassName_c38
    cmp eax, 39
    je pulsec_rt_objectClassName_c39
    cmp eax, 40
    je pulsec_rt_objectClassName_c40
    cmp eax, 41
    je pulsec_rt_objectClassName_c41
    cmp eax, 42
    je pulsec_rt_objectClassName_c42
    cmp eax, 43
    je pulsec_rt_objectClassName_c43
    cmp eax, 44
    je pulsec_rt_objectClassName_c44
    jmp pulsec_rt_objectClassName_invalid
pulsec_rt_objectClassName_c1:
    lea rcx, rt_obj_class_name_1
    mov edx, rt_obj_class_name_1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c2:
    lea rcx, rt_obj_class_name_2
    mov edx, rt_obj_class_name_2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c3:
    lea rcx, rt_obj_class_name_3
    mov edx, rt_obj_class_name_3_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c4:
    lea rcx, rt_obj_class_name_4
    mov edx, rt_obj_class_name_4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c5:
    lea rcx, rt_obj_class_name_5
    mov edx, rt_obj_class_name_5_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c6:
    lea rcx, rt_obj_class_name_6
    mov edx, rt_obj_class_name_6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c7:
    lea rcx, rt_obj_class_name_7
    mov edx, rt_obj_class_name_7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c8:
    lea rcx, rt_obj_class_name_8
    mov edx, rt_obj_class_name_8_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c9:
    lea rcx, rt_obj_class_name_9
    mov edx, rt_obj_class_name_9_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c10:
    lea rcx, rt_obj_class_name_10
    mov edx, rt_obj_class_name_10_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c11:
    lea rcx, rt_obj_class_name_11
    mov edx, rt_obj_class_name_11_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c12:
    lea rcx, rt_obj_class_name_12
    mov edx, rt_obj_class_name_12_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c13:
    lea rcx, rt_obj_class_name_13
    mov edx, rt_obj_class_name_13_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c14:
    lea rcx, rt_obj_class_name_14
    mov edx, rt_obj_class_name_14_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c15:
    lea rcx, rt_obj_class_name_15
    mov edx, rt_obj_class_name_15_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c16:
    lea rcx, rt_obj_class_name_16
    mov edx, rt_obj_class_name_16_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c17:
    lea rcx, rt_obj_class_name_17
    mov edx, rt_obj_class_name_17_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c18:
    lea rcx, rt_obj_class_name_18
    mov edx, rt_obj_class_name_18_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c19:
    lea rcx, rt_obj_class_name_19
    mov edx, rt_obj_class_name_19_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c20:
    lea rcx, rt_obj_class_name_20
    mov edx, rt_obj_class_name_20_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c21:
    lea rcx, rt_obj_class_name_21
    mov edx, rt_obj_class_name_21_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c22:
    lea rcx, rt_obj_class_name_22
    mov edx, rt_obj_class_name_22_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c23:
    lea rcx, rt_obj_class_name_23
    mov edx, rt_obj_class_name_23_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c24:
    lea rcx, rt_obj_class_name_24
    mov edx, rt_obj_class_name_24_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c25:
    lea rcx, rt_obj_class_name_25
    mov edx, rt_obj_class_name_25_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c26:
    lea rcx, rt_obj_class_name_26
    mov edx, rt_obj_class_name_26_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c27:
    lea rcx, rt_obj_class_name_27
    mov edx, rt_obj_class_name_27_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c28:
    lea rcx, rt_obj_class_name_28
    mov edx, rt_obj_class_name_28_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c29:
    lea rcx, rt_obj_class_name_29
    mov edx, rt_obj_class_name_29_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c30:
    lea rcx, rt_obj_class_name_30
    mov edx, rt_obj_class_name_30_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c31:
    lea rcx, rt_obj_class_name_31
    mov edx, rt_obj_class_name_31_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c32:
    lea rcx, rt_obj_class_name_32
    mov edx, rt_obj_class_name_32_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c33:
    lea rcx, rt_obj_class_name_33
    mov edx, rt_obj_class_name_33_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c34:
    lea rcx, rt_obj_class_name_34
    mov edx, rt_obj_class_name_34_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c35:
    lea rcx, rt_obj_class_name_35
    mov edx, rt_obj_class_name_35_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c36:
    lea rcx, rt_obj_class_name_36
    mov edx, rt_obj_class_name_36_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c37:
    lea rcx, rt_obj_class_name_37
    mov edx, rt_obj_class_name_37_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c38:
    lea rcx, rt_obj_class_name_38
    mov edx, rt_obj_class_name_38_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c39:
    lea rcx, rt_obj_class_name_39
    mov edx, rt_obj_class_name_39_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c40:
    lea rcx, rt_obj_class_name_40
    mov edx, rt_obj_class_name_40_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c41:
    lea rcx, rt_obj_class_name_41
    mov edx, rt_obj_class_name_41_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c42:
    lea rcx, rt_obj_class_name_42
    mov edx, rt_obj_class_name_42_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c43:
    lea rcx, rt_obj_class_name_43
    mov edx, rt_obj_class_name_43_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_c44:
    lea rcx, rt_obj_class_name_44
    mov edx, rt_obj_class_name_44_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_objectClassName_done
pulsec_rt_objectClassName_invalid:
    lea rcx, rt_empty
    xor edx, edx
    call pulsec_rt_stringFromBytes
pulsec_rt_objectClassName_done:
    add rsp, 56
    ret
pulsec_rt_objectClassName endp

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
    ja pulsec_rt_ensureSlotCapacity_grow_str_lens_done
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
    ja pulsec_rt_ensureSlotCapacity_copy_kinds
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
    ja pulsec_rt_ensureSlotCapacity_copy_flags
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
    ja pulsec_rt_ensureSlotCapacity_copy_meta
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
    ja pulsec_rt_ensureSlotCapacity_copy_gen
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
    ja pulsec_rt_ensureSlotCapacity_copy_free
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
    ja pulsec_rt_ensureSlotCapacity_copy_wfree
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
    ja pulsec_rt_ensureSlotCapacity_copy_wslot
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
    ja pulsec_rt_ensureSlotCapacity_copy_wtgen
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
    ja pulsec_rt_ensureSlotCapacity_copy_wgen
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
    ja pulsec_rt_ensureSlotCapacity_free_old
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_0_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_1_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_2_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_3_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_4_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_5_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_6_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_7_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_8_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_9_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_10_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_11_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_12_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_13_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_14_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_15_copy_done
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
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_16_copy_done
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
    mov r10, qword ptr [pulsec_rt_obj_class_ids]
    mov qword ptr [rt_tmp_ptr_b], r10
    mov rcx, qword ptr [rsp+240]
    mov edx, 8
    mov r8d, dword ptr [rsp+232]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_17_alloc_fail
    mov qword ptr [rt_tmp_ptr_a], rax
    xor ecx, ecx
pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_loop:
    cmp ecx, dword ptr [rsp+256]
    ja pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_next
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov edx, dword ptr [r10+rcx*4]
    mov dword ptr [r11+rcx*4], edx
pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_next:
    add ecx, 1
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_loop
pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_done:
    cmp dword ptr [pulsec_rt_obj_class_ids_heap_owned], 0
    je pulsec_rt_ensureSlotCapacity_grow_tbl_17_skip_free
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_tbl_17_skip_free
    mov rcx, qword ptr [rsp+240]
    xor edx, edx
    mov r8, r10
    call HeapFree
pulsec_rt_ensureSlotCapacity_grow_tbl_17_skip_free:
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [pulsec_rt_obj_class_ids], rax
    jmp pulsec_rt_ensureSlotCapacity_grow_tbl_17_done
pulsec_rt_ensureSlotCapacity_grow_tbl_17_alloc_fail:
    jmp pulsec_rt_ensureSlotCapacity_fail_stack
pulsec_rt_ensureSlotCapacity_grow_tbl_17_done:
    mov dword ptr [pulsec_rt_obj_class_ids_heap_owned], 1
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
    cmp eax, 1
    je pulsec_rt_arcTeardown_kind_object
    cmp eax, 2
    je pulsec_rt_arcTeardown_kind_array
    cmp eax, 3
    je pulsec_rt_arcTeardown_kind_string
    cmp eax, 4
    je pulsec_rt_arcTeardown_kind_collection
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_kind_object:
    mov r10, qword ptr [pulsec_rt_obj_class_ids]
    mov edx, dword ptr [r10+rcx*4]
    cmp edx, 10
    je pulsec_rt_arcTeardown_kind_object_c10
    cmp edx, 34
    je pulsec_rt_arcTeardown_kind_object_c34
    cmp edx, 37
    je pulsec_rt_arcTeardown_kind_object_c37
    jmp pulsec_rt_arcTeardown_kind_object_unmatched
pulsec_rt_arcTeardown_kind_object_c10:
    call pulsec_fcap_com_pulse_lang_Class_arc_teardown
    mov ecx, dword ptr [rt_tmp_arr_slot]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_c34:
    call pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown
    mov ecx, dword ptr [rt_tmp_arr_slot]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_c37:
    call pulsec_fcap_com_pulse_lang_Throwable_arc_teardown
    mov ecx, dword ptr [rt_tmp_arr_slot]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_unmatched:
pulsec_rt_arcTeardown_kind_object_done:
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_kind_array:
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_clear_header
    mov rax, qword ptr [rt_arr_len_ptr]
    mov eax, dword ptr [rax+rcx*4]
    mov dword ptr [rt_tmp_size], eax
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
    mov qword ptr [rt_tmp_ptr_d], r11
    mov dword ptr [rt_tmp_arr_len], 0
pulsec_rt_arcTeardown_release_array_loop:
    mov ecx, dword ptr [rt_tmp_arr_len]
    cmp ecx, dword ptr [rt_tmp_size]
    jae pulsec_rt_arcTeardown_release_array_done
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_array_skip
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_array_skip:
    mov ecx, dword ptr [rt_tmp_arr_len]
    add ecx, 1
    mov dword ptr [rt_tmp_arr_len], ecx
    jmp pulsec_rt_arcTeardown_release_array_loop
pulsec_rt_arcTeardown_release_array_done:
    mov r11, qword ptr [rt_tmp_ptr_d]
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
    mov rcx, qword ptr [rax+rcx*8]
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
    mov rcx, qword ptr [rax+rcx*8]
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
    mov rcx, qword ptr [rax+rcx*8]
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
    cmp ecx, 4294967295
    ja pulsec_rt_arcTeardown_clear_obj_id_skip
    mov r10, qword ptr [pulsec_rt_obj_class_ids]
    mov dword ptr [r10+rcx*4], 0
pulsec_rt_arcTeardown_clear_obj_id_skip:
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
    call pulsec_app_runtime_Main_main
    mov ecx, eax
    mov dword ptr [rsp+32], ecx
    call pulsec_rt_shutdown
    mov ecx, dword ptr [rsp+32]
    call ExitProcess
mainCRTStartup endp


pulsec_app_runtime_GameLoop_tick proc
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
pulsec_app_runtime_GameLoop_tick_b0:
    lea rcx, pulsec_app_runtime_GameLoop_tick_trace_s0
    mov edx, pulsec_app_runtime_GameLoop_tick_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_app_runtime_GameLoop_tick_epilogue
pulsec_app_runtime_GameLoop_tick_epilogue:
pulsec_app_runtime_GameLoop_tick_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_GameLoop_tick endp

pulsec_app_runtime_Main_main proc
    sub rsp, 120
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
pulsec_app_runtime_Main_main_b0:
    lea rcx, pulsec_app_runtime_Main_main_trace_s0
    mov edx, pulsec_app_runtime_Main_main_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_app_runtime_Main_main_epilogue
pulsec_app_runtime_Main_main_epilogue:
pulsec_app_runtime_Main_main_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_Main_main endp

pulsec_app_runtime_Rank_value proc
    sub rsp, 120
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
pulsec_app_runtime_Rank_value_b0:
    xor eax, eax
    jmp pulsec_app_runtime_Rank_value_epilogue
pulsec_app_runtime_Rank_value_epilogue:
pulsec_app_runtime_Rank_value_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_Rank_value endp

pulsec_app_runtime_Runner_value proc
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
    mov qword ptr [rsp+64], rcx
pulsec_app_runtime_Runner_value_b0:
    lea rcx, pulsec_app_runtime_Runner_value_trace_s0
    mov edx, pulsec_app_runtime_Runner_value_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_app_runtime_Runner_value_epilogue
pulsec_app_runtime_Runner_value_epilogue:
pulsec_app_runtime_Runner_value_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_Runner_value endp

pulsec_com_pulse_lang_AssertionError_AssertionError proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 5
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_AssertionError_AssertionError_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue
pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue:
pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_AssertionError_AssertionError endp

pulsec_com_pulse_lang_AssertionError_AssertionError__String proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 5
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_AssertionError_AssertionError__String_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue
pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue:
pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_AssertionError_AssertionError__String endp

pulsec_com_pulse_lang_AssertionError_fail proc
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
pulsec_com_pulse_lang_AssertionError_fail_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_fail_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+64], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    xor eax, eax
    jmp pulsec_com_pulse_lang_AssertionError_fail_epilogue
pulsec_com_pulse_lang_AssertionError_fail_epilogue:
pulsec_com_pulse_lang_AssertionError_fail_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_AssertionError_fail endp

pulsec_com_pulse_lang_AssertionError_fail__String proc
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_AssertionError_fail__String_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1
    mov edx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_rt_panic
    xor eax, eax
    jmp pulsec_com_pulse_lang_AssertionError_fail__String_epilogue
pulsec_com_pulse_lang_AssertionError_fail__String_epilogue:
pulsec_com_pulse_lang_AssertionError_fail__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_AssertionError_fail__String endp

pulsec_com_pulse_lang_AutoCloseable_close proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_AutoCloseable_close_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_AutoCloseable_close_epilogue
pulsec_com_pulse_lang_AutoCloseable_close_epilogue:
pulsec_com_pulse_lang_AutoCloseable_close_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_AutoCloseable_close endp

pulsec_com_pulse_lang_Boolean_valueOf__boolean proc
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
pulsec_com_pulse_lang_Boolean_valueOf__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Boolean_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseBoolean
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
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
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b2:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4_len
    call pulsec_rt_traceUpdateTop
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

pulsec_com_pulse_lang_Boolean_toString__boolean proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Boolean_toString__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    jmp pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue
pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue:
pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_toString__boolean endp

pulsec_com_pulse_lang_Byte_valueOf__byte proc
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
pulsec_com_pulse_lang_Byte_valueOf__byte_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_valueOf__byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_valueOf__byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Byte_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_Byte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Byte_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 128
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Byte_parse_ternary_then_1_15
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 127
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp Byte_parse_ternary_done_1_15
Byte_parse_ternary_then_1_15:
    mov eax, 1
Byte_parse_ternary_done_1_15:
    test eax, eax
    jne pulsec_com_pulse_lang_Byte_parse__String_b1
    jmp pulsec_com_pulse_lang_Byte_parse__String_b2
pulsec_com_pulse_lang_Byte_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_Byte_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Byte_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_Byte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Byte_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Byte_parse__String_b3
pulsec_com_pulse_lang_Byte_parse__String_b2:
    jmp pulsec_com_pulse_lang_Byte_parse__String_b3
pulsec_com_pulse_lang_Byte_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_Byte_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_Byte_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, al
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Byte_valueOf__byte
    jmp pulsec_com_pulse_lang_Byte_parse__String_epilogue
pulsec_com_pulse_lang_Byte_parse__String_epilogue:
pulsec_com_pulse_lang_Byte_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Byte_parse__String endp

pulsec_com_pulse_lang_Byte_byteValue__Byte proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Byte_byteValue__Byte_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_byteValue__Byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_byteValue__Byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Byte_equals__byte_byte_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_equals__byte_byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_equals__byte_byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Byte_compare__byte_byte_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Byte_compare__byte_byte_b1
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b2
pulsec_com_pulse_lang_Byte_compare__byte_byte_b1:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s1
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_compare__byte_byte_b2:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b3
pulsec_com_pulse_lang_Byte_compare__byte_byte_b3:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Byte_compare__byte_byte_b4
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b5
pulsec_com_pulse_lang_Byte_compare__byte_byte_b4:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s3
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_compare__byte_byte_b5:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_b6
pulsec_com_pulse_lang_Byte_compare__byte_byte_b6:
    lea rcx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s4
    mov edx, pulsec_com_pulse_lang_Byte_compare__byte_byte_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue
pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue:
pulsec_com_pulse_lang_Byte_compare__byte_byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Byte_compare__byte_byte endp

pulsec_com_pulse_lang_Byte_toString__byte proc
    sub rsp, 120
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Byte_toString__byte_b0:
    lea rcx, pulsec_com_pulse_lang_Byte_toString__byte_trace_s0
    mov edx, pulsec_com_pulse_lang_Byte_toString__byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_Byte_toString__byte_epilogue
pulsec_com_pulse_lang_Byte_toString__byte_epilogue:
pulsec_com_pulse_lang_Byte_toString__byte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Byte_toString__byte endp

pulsec_com_pulse_lang_Char_valueOf__char proc
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
pulsec_com_pulse_lang_Char_valueOf__char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_valueOf__char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_valueOf__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Char_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 9
    call pulsec_rt_objectNew
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
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Char_charValue__Char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_charValue__Char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_charValue__Char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_equals__char_char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_equals__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_equals__char_char_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_compare__char_char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Char_compare__char_char_b1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b2
pulsec_com_pulse_lang_Char_compare__char_char_b1:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s1
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_b2:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b3
pulsec_com_pulse_lang_Char_compare__char_char_b3:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Char_compare__char_char_b4
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b5
pulsec_com_pulse_lang_Char_compare__char_char_b4:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s3
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_b5:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b6
pulsec_com_pulse_lang_Char_compare__char_char_b6:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s4
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_epilogue:
pulsec_com_pulse_lang_Char_compare__char_char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Char_compare__char_char endp

pulsec_com_pulse_lang_Char_toString__char proc
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
pulsec_com_pulse_lang_Char_toString__char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_toString__char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_toString__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    jmp pulsec_com_pulse_lang_Char_toString__char_epilogue
pulsec_com_pulse_lang_Char_toString__char_epilogue:
pulsec_com_pulse_lang_Char_toString__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_toString__char endp

pulsec_fcap_com_pulse_lang_Class_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_lang_Class]
    jbe pulsec_fcap_com_pulse_lang_Class_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_lang_Class]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Class_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Class_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    xor esi, esi
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_Class_name_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_Class_name], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_Class_name_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_lang_Class], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_lang_Class_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Class_ensure_alloc_fail:
pulsec_fcap_com_pulse_lang_Class_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Class_ensure endp

pulsec_fcap_com_pulse_lang_Class_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Class_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_Class_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_teardown_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_teardown endp
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges endp
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges endp
pulsec_com_pulse_lang_Class_Class__String proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 10
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_Class_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Class_Class__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_Class__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_Class__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov qword ptr [r10+rdx*8], rax
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
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_getName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Class_getName_epilogue
pulsec_com_pulse_lang_Class_getName_epilogue:
pulsec_com_pulse_lang_Class_getName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getName endp

pulsec_com_pulse_lang_Class_getSimpleName proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_getSimpleName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getSimpleName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getSimpleName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_classSimpleName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Class_getSimpleName_epilogue
pulsec_com_pulse_lang_Class_getSimpleName_epilogue:
pulsec_com_pulse_lang_Class_getSimpleName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getSimpleName endp

pulsec_com_pulse_lang_Class_getPackageName proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_getPackageName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getPackageName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getPackageName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_classPackageName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Class_getPackageName_epilogue
pulsec_com_pulse_lang_Class_getPackageName_epilogue:
pulsec_com_pulse_lang_Class_getPackageName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getPackageName endp

pulsec_com_pulse_lang_Class_toString proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_toString_b0:
    lea rcx, pulsec_com_pulse_lang_Class_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Class_toString_epilogue
pulsec_com_pulse_lang_Class_toString_epilogue:
pulsec_com_pulse_lang_Class_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_toString endp

pulsec_com_pulse_lang_Class_runtimeSimpleName__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue:
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_runtimeSimpleName__String endp

pulsec_com_pulse_lang_Class_runtimePackageName__String proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_runtimePackageName__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue
pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue:
pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_runtimePackageName__String endp

pulsec_com_pulse_lang_Comparable_compareTo__Object proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m85
    mov edx, trace_m85_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m86
    mov edx, trace_m86_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m87
    mov edx, trace_m87_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m88
    mov edx, trace_m88_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m89
    mov edx, trace_m89_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
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
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Double_valueOf__double_b0:
    lea rcx, pulsec_com_pulse_lang_Double_valueOf__double_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_valueOf__double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Double_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Double_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Double_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Double_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 13
    call pulsec_rt_objectNew
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
    lea rcx, trace_m95
    mov edx, trace_m95_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Double_doubleValue__Double_b0:
    lea rcx, pulsec_com_pulse_lang_Double_doubleValue__Double_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_doubleValue__Double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m97
    mov edx, trace_m97_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Double_equals__double_double_b0:
    lea rcx, pulsec_com_pulse_lang_Double_equals__double_double_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_equals__double_double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    ucomisd xmm0, xmm1
    jp Double_equals_fp_cmp_0_2_unordered
    sete al
    jmp Double_equals_fp_cmp_0_2_done
Double_equals_fp_cmp_0_2_unordered:
    xor eax, eax
Double_equals_fp_cmp_0_2_done:
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
    sub rsp, 184
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
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_com_pulse_lang_Double_compare__double_double_b0:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+96], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+96]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_0_2_unordered
    setb al
    jmp Double_compare_fp_cmp_0_2_done
Double_compare_fp_cmp_0_2_unordered:
    xor eax, eax
Double_compare_fp_cmp_0_2_done:
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b1
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b2
pulsec_com_pulse_lang_Double_compare__double_double_b1:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s1
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b2:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s0
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b3
pulsec_com_pulse_lang_Double_compare__double_double_b3:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s2
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+104], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+104]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_2_7_unordered
    seta al
    jmp Double_compare_fp_cmp_2_7_done
Double_compare_fp_cmp_2_7_unordered:
    xor eax, eax
Double_compare_fp_cmp_2_7_done:
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b4
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b5
pulsec_com_pulse_lang_Double_compare__double_double_b4:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s3
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b5:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s2
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b6
pulsec_com_pulse_lang_Double_compare__double_double_b6:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s4
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+112], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+112]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_4_11_unordered
    sete al
    jmp Double_compare_fp_cmp_4_11_done
Double_compare_fp_cmp_4_11_unordered:
    xor eax, eax
Double_compare_fp_cmp_4_11_done:
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b7
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b8
pulsec_com_pulse_lang_Double_compare__double_double_b7:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s5
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b8:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s4
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b9
pulsec_com_pulse_lang_Double_compare__double_double_b9:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s6
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+120], xmm0
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+120]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_6_15_unordered
    setne al
    jmp Double_compare_fp_cmp_6_15_done
Double_compare_fp_cmp_6_15_unordered:
    mov al, 1
Double_compare_fp_cmp_6_15_done:
    movzx eax, al
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s7
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+128], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+128]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_7_18_unordered
    setne al
    jmp Double_compare_fp_cmp_7_18_done
Double_compare_fp_cmp_7_18_unordered:
    mov al, 1
Double_compare_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s8
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Double_compare_ternary_then_8_22
    mov eax, 0
    jmp Double_compare_ternary_done_8_22
Double_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Double_compare_ternary_done_8_22:
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b10
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b11
pulsec_com_pulse_lang_Double_compare__double_double_b10:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s9
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b11:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s8
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b12
pulsec_com_pulse_lang_Double_compare__double_double_b12:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s10
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Double_compare__double_double_b13
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b14
pulsec_com_pulse_lang_Double_compare__double_double_b13:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s11
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_b14:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s10
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Double_compare__double_double_b15
pulsec_com_pulse_lang_Double_compare__double_double_b15:
    lea rcx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s12
    mov edx, pulsec_com_pulse_lang_Double_compare__double_double_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Double_compare__double_double_epilogue
pulsec_com_pulse_lang_Double_compare__double_double_epilogue:
pulsec_com_pulse_lang_Double_compare__double_double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Double_compare__double_double endp

pulsec_com_pulse_lang_Enum_Enum proc
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 14
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Enum_Enum_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Enum_Enum_epilogue
pulsec_com_pulse_lang_Enum_Enum_epilogue:
pulsec_com_pulse_lang_Enum_Enum_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Enum_Enum endp

pulsec_com_pulse_lang_Exception_Exception proc
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 15
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Exception_Exception_b0:
    lea rcx, pulsec_com_pulse_lang_Exception_Exception_trace_s0
    mov edx, pulsec_com_pulse_lang_Exception_Exception_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Exception_Exception_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_Exception_Exception_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_Exception_Exception_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Exception_Exception_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m116
    mov edx, trace_m116_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 15
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Exception_Exception__String_b0:
    lea rcx, pulsec_com_pulse_lang_Exception_Exception__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Exception_Exception__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Exception_Exception__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_Exception_Exception__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_Exception_Exception__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Exception_Exception__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_Exception_Exception__String_Throwable proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 15
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_Exception_Exception__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Exception_Exception__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_Exception_Exception__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_Exception_Exception__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_Exception_Exception__String_Throwable_epilogue
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_epilogue:
pulsec_com_pulse_lang_Exception_Exception__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Exception_Exception__String_Throwable endp

pulsec_com_pulse_lang_Float_valueOf__float proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_valueOf__float endp

pulsec_com_pulse_lang_Float_parse__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Float_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Float_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 16
    call pulsec_rt_objectNew
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
    lea rcx, trace_m125
    mov edx, trace_m125_len
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
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_floatValue__Float endp

pulsec_com_pulse_lang_Float_equals__float_float proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_equals__float_float endp

pulsec_com_pulse_lang_Float_compare__float_float proc
    sub rsp, 184
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_Float_compare__float_float endp

pulsec_com_pulse_lang_IO_println__String proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IO_println__String_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m145
    mov edx, trace_m145_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_println__int_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__int_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m147
    mov edx, trace_m147_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_println__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m149
    mov edx, trace_m149_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IO_print__String_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m151
    mov edx, trace_m151_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__int_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__int_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m153
    mov edx, trace_m153_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m155
    mov edx, trace_m155_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 18
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m157
    mov edx, trace_m157_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 18
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 18
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable endp

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException proc
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 19
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m163
    mov edx, trace_m163_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 19
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 19
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_Throwable endp

pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_b0:
    lea rcx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_trace_s0
    mov edx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m169
    mov edx, trace_m169_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_b0:
    lea rcx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_epilogue
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_epilogue:
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IndexOutOfBoundsException_IndexOutOfBoundsException__String_Throwable endp

pulsec_com_pulse_lang_Integer_valueOf__int proc
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
pulsec_com_pulse_lang_Integer_valueOf__int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m175
    mov edx, trace_m175_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Integer_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseInt
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
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
    lea rcx, trace_m177
    mov edx, trace_m177_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Integer_intValue__Integer_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m179
    mov edx, trace_m179_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_equals__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m181
    mov edx, trace_m181_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_compare__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b2:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b3
pulsec_com_pulse_lang_Integer_compare__int_int_b3:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b5:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b6
pulsec_com_pulse_lang_Integer_compare__int_int_b6:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
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

pulsec_com_pulse_lang_Integer_toString__int proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Integer_toString__int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_toString__int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_toString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_Integer_toString__int_epilogue
pulsec_com_pulse_lang_Integer_toString__int_epilogue:
pulsec_com_pulse_lang_Integer_toString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_toString__int endp

pulsec_com_pulse_lang_Iterable_iterator proc
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
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m190
    mov edx, trace_m190_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m191
    mov edx, trace_m191_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m192
    mov edx, trace_m192_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_valueOf__long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_valueOf__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_valueOf__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m194
    mov edx, trace_m194_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Long_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Long_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 24
    call pulsec_rt_objectNew
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
    lea rcx, trace_m197
    mov edx, trace_m197_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_longValue__Long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_longValue__Long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_longValue__Long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m199
    mov edx, trace_m199_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_equals__long_long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_equals__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_equals__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
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
    sub rsp, 152
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_compare__long_long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Long_compare__long_long_b1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b2
pulsec_com_pulse_lang_Long_compare__long_long_b1:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_b2:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b3
pulsec_com_pulse_lang_Long_compare__long_long_b3:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Long_compare__long_long_b4
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b5
pulsec_com_pulse_lang_Long_compare__long_long_b4:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s3
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_b5:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b6
pulsec_com_pulse_lang_Long_compare__long_long_b6:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s4
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_epilogue:
pulsec_com_pulse_lang_Long_compare__long_long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Long_compare__long_long endp

pulsec_com_pulse_lang_Long_toString__long proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_toString__long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_toString__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_toString__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg24
    mov edx, msg24_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Long_toString__long_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_toString__long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg25
    mov edx, msg25_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Long_toString__long_epilogue
pulsec_com_pulse_lang_Long_toString__long_epilogue:
pulsec_com_pulse_lang_Long_toString__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_toString__long endp

pulsec_com_pulse_lang_NullPointerException_NullPointerException proc
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
    mov qword ptr [rsp+64], rcx
    mov ecx, 26
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_NullPointerException_NullPointerException_b0:
    lea rcx, pulsec_com_pulse_lang_NullPointerException_NullPointerException_trace_s0
    mov edx, pulsec_com_pulse_lang_NullPointerException_NullPointerException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg26
    mov edx, msg26_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NullPointerException_NullPointerException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NullPointerException_NullPointerException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NullPointerException_NullPointerException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m212
    mov edx, trace_m212_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 26
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_b0:
    lea rcx, pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg27
    mov edx, msg27_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 26
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg28
    mov edx, msg28_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_epilogue
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_epilogue:
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NullPointerException_NullPointerException__String_Throwable endp

pulsec_com_pulse_lang_NumberFormatException_NumberFormatException proc
    sub rsp, 120
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
    mov ecx, 27
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_b0:
    lea rcx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_trace_s0
    mov edx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg29
    mov edx, msg29_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m218
    mov edx, trace_m218_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 27
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_b0:
    lea rcx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 27
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg31
    mov edx, msg31_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_epilogue
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_epilogue:
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_NumberFormatException_NumberFormatException__String_Throwable endp

pulsec_com_pulse_lang_Object_hashCode proc
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
pulsec_com_pulse_lang_Object_hashCode_b0:
    lea rcx, pulsec_com_pulse_lang_Object_hashCode_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_hashCode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectHashCode
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Object_hashCode_epilogue
pulsec_com_pulse_lang_Object_hashCode_epilogue:
pulsec_com_pulse_lang_Object_hashCode_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_hashCode endp

pulsec_com_pulse_lang_Object_toString proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Object_toString_b0:
    lea rcx, pulsec_com_pulse_lang_Object_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectClassName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m226
    mov edx, trace_m226_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Object_equals__Object_b0:
    lea rcx, pulsec_com_pulse_lang_Object_equals__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m228
    mov edx, trace_m228_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Object_getClass_b0:
    lea rcx, pulsec_com_pulse_lang_Object_getClass_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_getClass_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectClassName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    call pulsec_com_pulse_lang_Class_Class__String
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
    lea rcx, trace_m230
    mov edx, trace_m230_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_println__String_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_println__String_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_println__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m232
    mov edx, trace_m232_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_println__int_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_println__int_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_println__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m234
    mov edx, trace_m234_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_println__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_println__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_println__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m236
    mov edx, trace_m236_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_print__String_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_print__String_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_print__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m238
    mov edx, trace_m238_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_print__int_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_print__int_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_print__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m240
    mov edx, trace_m240_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_PrintStream_print__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_PrintStream_print__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_PrintStream_print__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m242
    mov edx, trace_m242_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 31
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_RuntimeException_RuntimeException_b0:
    lea rcx, pulsec_com_pulse_lang_RuntimeException_RuntimeException_trace_s0
    mov edx, pulsec_com_pulse_lang_RuntimeException_RuntimeException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg32
    mov edx, msg32_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m244
    mov edx, trace_m244_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 31
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_b0:
    lea rcx, pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg33
    mov edx, msg33_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m246
    mov edx, trace_m246_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 31
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg34
    mov edx, msg34_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_epilogue
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_epilogue:
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_RuntimeException_RuntimeException__String_Throwable endp

pulsec_com_pulse_lang_Short_valueOf__short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m248
    mov edx, trace_m248_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_valueOf__short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_valueOf__short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_valueOf__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m250
    mov edx, trace_m250_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Short_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 32768
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Short_parse_ternary_then_1_15
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 32767
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp Short_parse_ternary_done_1_15
Short_parse_ternary_then_1_15:
    mov eax, 1
Short_parse_ternary_done_1_15:
    test eax, eax
    jne pulsec_com_pulse_lang_Short_parse__String_b1
    jmp pulsec_com_pulse_lang_Short_parse__String_b2
pulsec_com_pulse_lang_Short_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg35
    mov edx, msg35_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_parse__String_b3
pulsec_com_pulse_lang_Short_parse__String_b2:
    jmp pulsec_com_pulse_lang_Short_parse__String_b3
pulsec_com_pulse_lang_Short_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Short_valueOf__short
    jmp pulsec_com_pulse_lang_Short_parse__String_epilogue
pulsec_com_pulse_lang_Short_parse__String_epilogue:
pulsec_com_pulse_lang_Short_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Short_parse__String endp

pulsec_com_pulse_lang_Short_shortValue__Short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m255
    mov edx, trace_m255_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Short_shortValue__Short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m257
    mov edx, trace_m257_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_equals__short_short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_equals__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_equals__short_short_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m259
    mov edx, trace_m259_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_compare__short_short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Short_compare__short_short_b1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b2
pulsec_com_pulse_lang_Short_compare__short_short_b1:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_b2:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b3
pulsec_com_pulse_lang_Short_compare__short_short_b3:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Short_compare__short_short_b4
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b5
pulsec_com_pulse_lang_Short_compare__short_short_b4:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s3
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_b5:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b6
pulsec_com_pulse_lang_Short_compare__short_short_b6:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s4
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_epilogue:
pulsec_com_pulse_lang_Short_compare__short_short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Short_compare__short_short endp

pulsec_com_pulse_lang_Short_toString__short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m265
    mov edx, trace_m265_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_toString__short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_toString__short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_toString__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, ax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_Short_toString__short_epilogue
pulsec_com_pulse_lang_Short_toString__short_epilogue:
pulsec_com_pulse_lang_Short_toString__short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_toString__short endp

pulsec_com_pulse_lang_String_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m267
    mov edx, trace_m267_len
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
    lea rcx, trace_m269
    mov edx, trace_m269_len
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
    lea rcx, trace_m271
    mov edx, trace_m271_len
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
    lea rcx, trace_m273
    mov edx, trace_m273_len
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
    lea rcx, trace_m275
    mov edx, trace_m275_len
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
    lea rcx, trace_m277
    mov edx, trace_m277_len
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
    lea rcx, trace_m279
    mov edx, trace_m279_len
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
    lea rcx, msg36
    mov edx, msg36_len
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
    lea rcx, trace_m291
    mov edx, trace_m291_len
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
    lea rcx, trace_m293
    mov edx, trace_m293_len
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
    lea rcx, msg37
    mov edx, msg37_len
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
    lea rcx, trace_m301
    mov edx, trace_m301_len
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
    lea rcx, trace_m303
    mov edx, trace_m303_len
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
    lea rcx, trace_m324
    mov edx, trace_m324_len
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
    lea rcx, trace_m344
    mov edx, trace_m344_len
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
    lea rcx, trace_m358
    mov edx, trace_m358_len
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
    lea rcx, trace_m360
    mov edx, trace_m360_len
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
    lea rcx, trace_m362
    mov edx, trace_m362_len
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
    lea rcx, trace_m364
    mov edx, trace_m364_len
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
    lea rcx, msg38
    mov edx, msg38_len
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
    lea rcx, trace_m368
    mov edx, trace_m368_len
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
    lea rcx, trace_m370
    mov edx, trace_m370_len
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
    lea rcx, msg39
    mov edx, msg39_len
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
    lea rcx, trace_m372
    mov edx, trace_m372_len
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
    lea rcx, msg40
    mov edx, msg40_len
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

pulsec_fcap_com_pulse_lang_StringBuilder_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_lang_StringBuilder]
    jbe pulsec_fcap_com_pulse_lang_StringBuilder_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_lang_StringBuilder]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_StringBuilder_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_StringBuilder_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    xor esi, esi
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_lang_StringBuilder], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_alloc_fail:
pulsec_fcap_com_pulse_lang_StringBuilder_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_StringBuilder_ensure endp

pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown_done:
    ret
pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown endp
pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_done:
    ret
pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges endp
pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_done:
    ret
pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges endp
pulsec_com_pulse_lang_StringBuilder_StringBuilder proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m374
    mov edx, trace_m374_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 34
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+104]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg41
    mov edx, msg41_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
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
    lea rcx, trace_m376
    mov edx, trace_m376_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 34
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
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
    lea rcx, trace_m378
    mov edx, trace_m378_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
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
    lea rcx, trace_m381
    mov edx, trace_m381_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
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
    lea rcx, trace_m384
    mov edx, trace_m384_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__boolean endp

pulsec_com_pulse_lang_StringBuilder_append__char proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m387
    mov edx, trace_m387_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__char_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__char_epilogue
pulsec_com_pulse_lang_StringBuilder_append__char_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__char endp

pulsec_com_pulse_lang_StringBuilder_append__Object proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m390
    mov edx, trace_m390_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__Object_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_valueOf__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue
pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__Object endp

pulsec_com_pulse_lang_StringBuilder_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m393
    mov edx, trace_m393_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_length_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_length_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_length_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
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
    lea rcx, trace_m395
    mov edx, trace_m395_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_clear_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_clear_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_clear_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg42
    mov edx, msg42_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
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

pulsec_com_pulse_lang_StringBuilder_insert__int_String proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m397
    mov edx, trace_m397_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+96], rcx
pulsec_com_pulse_lang_StringBuilder_insert__int_String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_substring__int
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    jmp pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue
pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue:
pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_StringBuilder_insert__int_String endp

pulsec_com_pulse_lang_StringBuilder_delete__int_int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m403
    mov edx, trace_m403_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+80], edx
    mov dword ptr [rsp+88], r8d
    mov qword ptr [rsp+96], rcx
pulsec_com_pulse_lang_StringBuilder_delete__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_substring__int
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+96]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    jmp pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue
pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue:
pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_StringBuilder_delete__int_int endp

pulsec_com_pulse_lang_StringBuilder_setLength__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m408
    mov edx, trace_m408_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_StringBuilder_setLength__int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_StringBuilder_setLength__int_b1
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_b2
pulsec_com_pulse_lang_StringBuilder_setLength__int_b1:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_substring__int_int
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_epilogue
pulsec_com_pulse_lang_StringBuilder_setLength__int_b2:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_b3
pulsec_com_pulse_lang_StringBuilder_setLength__int_b3:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_b4
pulsec_com_pulse_lang_StringBuilder_setLength__int_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_StringBuilder_setLength__int_b5
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_b6
pulsec_com_pulse_lang_StringBuilder_setLength__int_b5:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_b4
pulsec_com_pulse_lang_StringBuilder_setLength__int_b6:
    xor eax, eax
    jmp pulsec_com_pulse_lang_StringBuilder_setLength__int_epilogue
pulsec_com_pulse_lang_StringBuilder_setLength__int_epilogue:
pulsec_com_pulse_lang_StringBuilder_setLength__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_lang_StringBuilder_setLength__int endp

pulsec_com_pulse_lang_StringBuilder_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m416
    mov edx, trace_m416_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_toString_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_StringBuilder_toString_epilogue
pulsec_com_pulse_lang_StringBuilder_toString_epilogue:
pulsec_com_pulse_lang_StringBuilder_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_toString endp

pulsec_fcap_com_pulse_lang_Throwable_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_lang_Throwable]
    jbe pulsec_fcap_com_pulse_lang_Throwable_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_lang_Throwable]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    xor esi, esi
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    xor esi, esi
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_copy_loop
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_Throwable_message_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_Throwable_message], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_Throwable_message_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    xor esi, esi
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_copy_loop
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_Throwable_cause_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_Throwable_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_Throwable_cause_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_lang_Throwable], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_lang_Throwable_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Throwable_ensure_alloc_fail:
pulsec_fcap_com_pulse_lang_Throwable_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Throwable_ensure endp

pulsec_fcap_com_pulse_lang_Throwable_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_2_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_field_2_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Throwable_arc_teardown_done:
    ret
pulsec_fcap_com_pulse_lang_Throwable_arc_teardown endp
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges endp
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges endp
pulsec_com_pulse_lang_Throwable_Throwable proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m418
    mov edx, trace_m418_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 37
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+104]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Throwable_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg43
    mov edx, msg43_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    xor eax, eax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
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
    lea rcx, trace_m422
    mov edx, trace_m422_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 37
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Throwable_Throwable__String_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg44
    mov edx, msg44_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    xor eax, eax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
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

pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m426
    mov edx, trace_m426_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 37
    call pulsec_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+120]
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg45
    mov edx, msg45_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_epilogue
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_epilogue:
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable endp

pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m430
    mov edx, trace_m430_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], r9
    mov qword ptr [rsp+88], rcx
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue:
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable endp

pulsec_com_pulse_lang_Throwable_getMessage proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m434
    mov edx, trace_m434_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Throwable_getMessage_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_getMessage_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_getMessage_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Throwable_getMessage_epilogue
pulsec_com_pulse_lang_Throwable_getMessage_epilogue:
pulsec_com_pulse_lang_Throwable_getMessage_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_getMessage endp

pulsec_com_pulse_lang_Throwable_getCause proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m436
    mov edx, trace_m436_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Throwable_getCause_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_getCause_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_getCause_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Throwable_getCause_epilogue
pulsec_com_pulse_lang_Throwable_getCause_epilogue:
pulsec_com_pulse_lang_Throwable_getCause_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_getCause endp

pulsec_com_pulse_lang_Throwable_initCause__Throwable proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m438
    mov edx, trace_m438_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_initCause__Throwable_b1
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b2
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b1:
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg46
    mov edx, msg46_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b3
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b2:
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b3
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b3:
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov dword ptr [rsp+88], eax
    xor eax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_initCause__Throwable_b4
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b5
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b4:
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s3
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg47
    mov edx, msg47_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b6
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b5:
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_b6
pulsec_com_pulse_lang_Throwable_initCause__Throwable_b6:
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s4
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s5
    mov edx, pulsec_com_pulse_lang_Throwable_initCause__Throwable_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Throwable_initCause__Throwable_epilogue
pulsec_com_pulse_lang_Throwable_initCause__Throwable_epilogue:
pulsec_com_pulse_lang_Throwable_initCause__Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Throwable_initCause__Throwable endp

pulsec_com_pulse_lang_Throwable_formatThrowable__String proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m445
    mov edx, trace_m445_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], rcx
pulsec_com_pulse_lang_Throwable_formatThrowable__String_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    cmp ecx, 0
    je Throwable_formatThrowable_vd0_2_null
    call pulsec_com_pulse_lang_Throwable_getMessage
    jmp Throwable_formatThrowable_vd0_2_done
Throwable_formatThrowable_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_formatThrowable_vd0_2_done:
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    xor eax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Throwable_formatThrowable_ternary_then_1_12
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Throwable_formatThrowable_ternary_done_1_12
Throwable_formatThrowable_ternary_then_1_12:
    mov eax, 1
Throwable_formatThrowable_ternary_done_1_12:
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_formatThrowable__String_b1
    jmp pulsec_com_pulse_lang_Throwable_formatThrowable__String_b2
pulsec_com_pulse_lang_Throwable_formatThrowable__String_b1:
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_Throwable_formatThrowable__String_epilogue
pulsec_com_pulse_lang_Throwable_formatThrowable__String_b2:
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Throwable_formatThrowable__String_b3
pulsec_com_pulse_lang_Throwable_formatThrowable__String_b3:
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s3
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg48
    mov edx, msg48_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s4
    mov edx, pulsec_com_pulse_lang_Throwable_formatThrowable__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_com_pulse_lang_Throwable_formatThrowable__String_epilogue
pulsec_com_pulse_lang_Throwable_formatThrowable__String_epilogue:
pulsec_com_pulse_lang_Throwable_formatThrowable__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_lang_Throwable_formatThrowable__String endp

pulsec_com_pulse_lang_Throwable_describe proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m451
    mov edx, trace_m451_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+88], rcx
pulsec_com_pulse_lang_Throwable_describe_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    cmp ecx, 0
    je Throwable_describe_vd0_2_null
    call pulsec_com_pulse_lang_Throwable_toString
    jmp Throwable_describe_vd0_2_done
Throwable_describe_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd0_2_done:
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s1
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    cmp ecx, 0
    je Throwable_describe_vd1_5_null
    call pulsec_com_pulse_lang_Throwable_getCause
    jmp Throwable_describe_vd1_5_done
Throwable_describe_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd1_5_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    xor eax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_describe_b1
    jmp pulsec_com_pulse_lang_Throwable_describe_b2
pulsec_com_pulse_lang_Throwable_describe_b1:
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s3
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Throwable_describe_epilogue
pulsec_com_pulse_lang_Throwable_describe_b2:
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s2
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Throwable_describe_b3
pulsec_com_pulse_lang_Throwable_describe_b3:
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s4
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s4_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg49
    mov edx, msg49_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s5
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je Throwable_describe_vd5_17_null
    call pulsec_com_pulse_lang_Throwable_describe
    jmp Throwable_describe_vd5_17_done
Throwable_describe_vd5_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd5_17_done:
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_com_pulse_lang_Throwable_describe_trace_s6
    mov edx, pulsec_com_pulse_lang_Throwable_describe_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp pulsec_com_pulse_lang_Throwable_describe_epilogue
pulsec_com_pulse_lang_Throwable_describe_epilogue:
pulsec_com_pulse_lang_Throwable_describe_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Throwable_describe endp

pulsec_com_pulse_lang_Throwable_toString proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m459
    mov edx, trace_m459_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Throwable_toString_b0:
    lea rcx, pulsec_com_pulse_lang_Throwable_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_Throwable_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je Throwable_toString_vd0_4_null
    call pulsec_com_pulse_lang_Throwable_formatThrowable__String
    jmp Throwable_toString_vd0_4_done
Throwable_toString_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_toString_vd0_4_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Throwable_toString_epilogue
pulsec_com_pulse_lang_Throwable_toString_epilogue:
pulsec_com_pulse_lang_Throwable_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_toString endp

pulsec_com_pulse_lang_Throwable_panic proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Throwable_panic_b0:
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je Throwable_panic_vd0_4_null
    call pulsec_com_pulse_lang_Throwable_describe
    jmp Throwable_panic_vd0_4_done
Throwable_panic_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_panic_vd0_4_done:
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    xor eax, eax
    jmp pulsec_com_pulse_lang_Throwable_panic_epilogue
pulsec_com_pulse_lang_Throwable_panic_epilogue:
pulsec_com_pulse_lang_Throwable_panic_epilogue_post:
    mov qword ptr [rsp+40], rax
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_panic endp

pulsec_com_pulse_lang_UByte_valueOf__ubyte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m461
    mov edx, trace_m461_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UByte_valueOf__ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m463
    mov edx, trace_m463_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_UByte_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne UByte_parse_ternary_then_1_14
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 255
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp UByte_parse_ternary_done_1_14
UByte_parse_ternary_then_1_14:
    mov eax, 1
UByte_parse_ternary_done_1_14:
    test eax, eax
    jne pulsec_com_pulse_lang_UByte_parse__String_b1
    jmp pulsec_com_pulse_lang_UByte_parse__String_b2
pulsec_com_pulse_lang_UByte_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg50
    mov edx, msg50_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_parse__String_b3
pulsec_com_pulse_lang_UByte_parse__String_b2:
    jmp pulsec_com_pulse_lang_UByte_parse__String_b3
pulsec_com_pulse_lang_UByte_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, al
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_UByte_valueOf__ubyte
    jmp pulsec_com_pulse_lang_UByte_parse__String_epilogue
pulsec_com_pulse_lang_UByte_parse__String_epilogue:
pulsec_com_pulse_lang_UByte_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UByte_parse__String endp

pulsec_com_pulse_lang_UByte_ubyteValue__UByte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m468
    mov edx, trace_m468_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m470
    mov edx, trace_m470_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m472
    mov edx, trace_m472_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b4
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b5
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b4:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b5:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b6
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b6:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue:
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte endp

pulsec_com_pulse_lang_UByte_toString__ubyte proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m478
    mov edx, trace_m478_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UByte_toString__ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue
pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue:
pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UByte_toString__ubyte endp

pulsec_com_pulse_lang_UInteger_valueOf__uint proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m480
    mov edx, trace_m480_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_valueOf__uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m482
    mov edx, trace_m482_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_UInteger_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg51
    mov edx, msg51_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 39
    call pulsec_rt_objectNew
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
    lea rcx, trace_m485
    mov edx, trace_m485_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m487
    mov edx, trace_m487_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UInteger_equals__uint_uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m489
    mov edx, trace_m489_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UInteger_compare__uint_uint_b4
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b5
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b4:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b5:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b6
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b6:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue:
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UInteger_compare__uint_uint endp

pulsec_com_pulse_lang_UInteger_toString__uint proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m495
    mov edx, trace_m495_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_toString__uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg52
    mov edx, msg52_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s1
    mov edx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg53
    mov edx, msg53_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_UInteger_toString__uint_epilogue
pulsec_com_pulse_lang_UInteger_toString__uint_epilogue:
pulsec_com_pulse_lang_UInteger_toString__uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_toString__uint endp

pulsec_com_pulse_lang_ULong_valueOf__ulong proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m498
    mov edx, trace_m498_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_valueOf__ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m500
    mov edx, trace_m500_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg54
    mov edx, msg54_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_ULong_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_ULong_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 40
    call pulsec_rt_objectNew
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
    lea rcx, trace_m503
    mov edx, trace_m503_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_ulongValue__ULong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m505
    mov edx, trace_m505_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m507
    mov edx, trace_m507_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b4
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b5
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b4:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b5:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b6
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b6:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue:
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_ULong_compare__ulong_ulong endp

pulsec_com_pulse_lang_ULong_toString__ulong proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m513
    mov edx, trace_m513_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_toString__ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg55
    mov edx, msg55_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s1
    mov edx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg56
    mov edx, msg56_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_ULong_toString__ulong_epilogue
pulsec_com_pulse_lang_ULong_toString__ulong_epilogue:
pulsec_com_pulse_lang_ULong_toString__ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_ULong_toString__ulong endp

pulsec_com_pulse_lang_UShort_valueOf__ushort proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m516
    mov edx, trace_m516_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UShort_valueOf__ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m518
    mov edx, trace_m518_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_UShort_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne UShort_parse_ternary_then_1_14
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 65535
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp UShort_parse_ternary_done_1_14
UShort_parse_ternary_then_1_14:
    mov eax, 1
UShort_parse_ternary_done_1_14:
    test eax, eax
    jne pulsec_com_pulse_lang_UShort_parse__String_b1
    jmp pulsec_com_pulse_lang_UShort_parse__String_b2
pulsec_com_pulse_lang_UShort_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg57
    mov edx, msg57_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_parse__String_b3
pulsec_com_pulse_lang_UShort_parse__String_b2:
    jmp pulsec_com_pulse_lang_UShort_parse__String_b3
pulsec_com_pulse_lang_UShort_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_UShort_valueOf__ushort
    jmp pulsec_com_pulse_lang_UShort_parse__String_epilogue
pulsec_com_pulse_lang_UShort_parse__String_epilogue:
pulsec_com_pulse_lang_UShort_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UShort_parse__String endp

pulsec_com_pulse_lang_UShort_ushortValue__UShort proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m523
    mov edx, trace_m523_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_UShort_ushortValue__UShort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
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
    lea rcx, trace_m525
    mov edx, trace_m525_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m527
    mov edx, trace_m527_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b4
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b5
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b4:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b5:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b6
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b6:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue:
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UShort_compare__ushort_ushort endp

pulsec_com_pulse_lang_UShort_toString__ushort proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m533
    mov edx, trace_m533_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UShort_toString__ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, ax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_UShort_toString__ushort_epilogue
pulsec_com_pulse_lang_UShort_toString__ushort_epilogue:
pulsec_com_pulse_lang_UShort_toString__ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_toString__ushort endp

pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m535
    mov edx, trace_m535_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 42
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_b0:
    lea rcx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_trace_s0
    mov edx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg58
    mov edx, msg58_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m537
    mov edx, trace_m537_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 42
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_b0:
    lea rcx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg59
    mov edx, msg59_len
    call pulsec_rt_stringFromBytes
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
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
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

pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m539
    mov edx, trace_m539_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
    mov ecx, 42
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg60
    mov edx, msg60_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+80]
    cmp ecx, 0
    je pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_epilogue
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_epilogue:
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String_Throwable endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m541
    mov edx, trace_m541_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m542
    mov edx, trace_m542_len
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
    lea rcx, trace_m543
    mov edx, trace_m543_len
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
    lea rcx, trace_m544
    mov edx, trace_m544_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m545
    mov edx, trace_m545_len
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
    lea rcx, trace_m546
    mov edx, trace_m546_len
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
    lea rcx, trace_m547
    mov edx, trace_m547_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
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
    lea rcx, trace_m548
    mov edx, trace_m548_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg61
    mov edx, msg61_len
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
    lea rcx, trace_m550
    mov edx, trace_m550_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_stringLength__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m552
    mov edx, trace_m552_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_intToString__int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg62
    mov edx, msg62_len
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
    lea rcx, trace_m554
    mov edx, trace_m554_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg63
    mov edx, msg63_len
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
    lea rcx, trace_m556
    mov edx, trace_m556_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_parseInt__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m558
    mov edx, trace_m558_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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

pulsec_com_pulse_rt_Intrinsics_objectClassName__Object proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m560
    mov edx, trace_m560_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg64
    mov edx, msg64_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue:
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object endp

pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m562
    mov edx, trace_m562_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue:
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object endp

pulsec_com_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m564
    mov edx, trace_m564_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
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
    lea rcx, trace_m566
    mov edx, trace_m566_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m568
    mov edx, trace_m568_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m570
    mov edx, trace_m570_len
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
    lea rcx, trace_m571
    mov edx, trace_m571_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg65
    mov edx, msg65_len
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
    lea rcx, trace_m573
    mov edx, trace_m573_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
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
    lea rcx, trace_m574
    mov edx, trace_m574_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_listNew_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
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
    lea rcx, trace_m576
    mov edx, trace_m576_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_listSize__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m578
    mov edx, trace_m578_len
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
    lea rcx, trace_m579
    mov edx, trace_m579_len
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
    lea rcx, trace_m580
    mov edx, trace_m580_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
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
    lea rcx, trace_m581
    mov edx, trace_m581_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m583
    mov edx, trace_m583_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg66
    mov edx, msg66_len
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
    lea rcx, trace_m585
    mov edx, trace_m585_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_mapNew_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
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
    lea rcx, trace_m587
    mov edx, trace_m587_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapSize__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m589
    mov edx, trace_m589_len
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
    lea rcx, trace_m590
    mov edx, trace_m590_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m592
    mov edx, trace_m592_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
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
    lea rcx, trace_m593
    mov edx, trace_m593_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
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
    lea rcx, trace_m594
    mov edx, trace_m594_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg67
    mov edx, msg67_len
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
    lea rcx, trace_m596
    mov edx, trace_m596_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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

pulsec_rt_arcCycleFullPass proc
    xor r11d, r11d
    mov r8d, 1
pulsec_rt_arcCycleFullPass_clear_flags_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_clear_flags_done
    mov dword ptr [rt_arc_flags+r8*4], 0
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_clear_flags_loop
pulsec_rt_arcCycleFullPass_clear_flags_done:
    mov r8d, 1
pulsec_rt_arcCycleFullPass_scan_edges_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_scan_edges_done
    cmp dword ptr [rt_arc_kinds+r8*4], 1
    jne pulsec_rt_arcCycleFullPass_scan_edges_next
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    je pulsec_rt_arcCycleFullPass_scan_edges_next
    mov r10, qword ptr [pulsec_rt_obj_class_ids]
    mov edx, dword ptr [r10+r8*4]
    cmp edx, 10
    je pulsec_rt_arcCycleFullPass_scan_edges_c10
    cmp edx, 34
    je pulsec_rt_arcCycleFullPass_scan_edges_c34
    cmp edx, 37
    je pulsec_rt_arcCycleFullPass_scan_edges_c37
    jmp pulsec_rt_arcCycleFullPass_scan_edges_unmatched
pulsec_rt_arcCycleFullPass_scan_edges_c10:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_Class_arc_scan_edges
    jmp pulsec_rt_arcCycleFullPass_scan_edges_next
pulsec_rt_arcCycleFullPass_scan_edges_c34:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges
    jmp pulsec_rt_arcCycleFullPass_scan_edges_next
pulsec_rt_arcCycleFullPass_scan_edges_c37:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges
    jmp pulsec_rt_arcCycleFullPass_scan_edges_next
pulsec_rt_arcCycleFullPass_scan_edges_unmatched:
pulsec_rt_arcCycleFullPass_scan_edges_next:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_scan_edges_loop
pulsec_rt_arcCycleFullPass_scan_edges_done:
    mov r8d, 1
pulsec_rt_arcCycleFullPass_mark_candidates_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_mark_candidates_done
    cmp dword ptr [rt_arc_kinds+r8*4], 1
    jne pulsec_rt_arcCycleFullPass_mark_candidates_next
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    je pulsec_rt_arcCycleFullPass_mark_candidates_next
    mov edx, dword ptr [rt_arc_flags+r8*4]
    cmp eax, edx
    jne pulsec_rt_arcCycleFullPass_mark_candidates_next
    mov dword ptr [rt_arc_flags+r8*4], 1
    jmp pulsec_rt_arcCycleFullPass_mark_candidates_next
pulsec_rt_arcCycleFullPass_mark_candidates_next:
    cmp dword ptr [rt_arc_flags+r8*4], 1
    je @F
    mov dword ptr [rt_arc_flags+r8*4], 0
@@:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_mark_candidates_loop
pulsec_rt_arcCycleFullPass_mark_candidates_done:
    mov r8d, 1
pulsec_rt_arcCycleFullPass_invalidate_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_invalidate_done
    cmp dword ptr [rt_arc_kinds+r8*4], 1
    jne pulsec_rt_arcCycleFullPass_invalidate_next
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    je pulsec_rt_arcCycleFullPass_invalidate_next
    cmp dword ptr [rt_arc_flags+r8*4], 0
    jne pulsec_rt_arcCycleFullPass_invalidate_next
    mov r10, qword ptr [pulsec_rt_obj_class_ids]
    mov edx, dword ptr [r10+r8*4]
    cmp edx, 10
    je pulsec_rt_arcCycleFullPass_invalidate_c10
    cmp edx, 34
    je pulsec_rt_arcCycleFullPass_invalidate_c34
    cmp edx, 37
    je pulsec_rt_arcCycleFullPass_invalidate_c37
    jmp pulsec_rt_arcCycleFullPass_invalidate_unmatched
pulsec_rt_arcCycleFullPass_invalidate_c10:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges
    jmp pulsec_rt_arcCycleFullPass_invalidate_next
pulsec_rt_arcCycleFullPass_invalidate_c34:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges
    jmp pulsec_rt_arcCycleFullPass_invalidate_next
pulsec_rt_arcCycleFullPass_invalidate_c37:
    mov ecx, r8d
    call pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges
    jmp pulsec_rt_arcCycleFullPass_invalidate_next
pulsec_rt_arcCycleFullPass_invalidate_unmatched:
pulsec_rt_arcCycleFullPass_invalidate_next:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_invalidate_loop
pulsec_rt_arcCycleFullPass_invalidate_done:
    mov r8d, 1
pulsec_rt_arcCycleFullPass_collect_cycles_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_collect_cycles_done
    cmp dword ptr [rt_arc_kinds+r8*4], 1
    jne pulsec_rt_arcCycleFullPass_collect_cycles_next
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    je pulsec_rt_arcCycleFullPass_collect_cycles_next
    mov edx, dword ptr [rt_arc_flags+r8*4]
    cmp edx, 1
    jne pulsec_rt_arcCycleFullPass_collect_cycles_next
    mov ecx, r8d
    call pulsec_rt_arcTeardown
    add r11d, 1
pulsec_rt_arcCycleFullPass_collect_cycles_next:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_collect_cycles_loop
pulsec_rt_arcCycleFullPass_collect_cycles_done:
    mov r8d, 1
pulsec_rt_arcCycleFullPass_zero_sweep_loop:
    cmp r8d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcCycleFullPass_done
    mov eax, dword ptr [rt_arc_refcounts+r8*4]
    cmp eax, 0
    jne pulsec_rt_arcCycleFullPass_zero_sweep_next
    cmp dword ptr [rt_arc_kinds+r8*4], 0
    je pulsec_rt_arcCycleFullPass_zero_sweep_next
    mov ecx, r8d
    call pulsec_rt_arcTeardown
    add r11d, 1
pulsec_rt_arcCycleFullPass_zero_sweep_next:
    add r8d, 1
    jmp pulsec_rt_arcCycleFullPass_zero_sweep_loop
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

pulsec_rt_arrayGetLong proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arrayGetLong_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arrayGetLong_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arrayGetLong_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arrayGetLong_live_panic
pulsec_rt_arrayGetLong_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arrayGetLong_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arrayGetLong_live_panic
    jmp pulsec_rt_arrayGetLong_ok
pulsec_rt_arrayGetLong_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arrayGetLong_ok:
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
    mov rax, qword ptr [r9+rdx*8]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_arrayGetLong endp

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
    mov rax, qword ptr [r9+rdx*8]
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
    shl rax, 3
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
    mov eax, dword ptr [rt_tmp_arr_len]
    shl rax, 3
    mov qword ptr [rt_tmp_arr_bytes], rax
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

pulsec_rt_arrayNewMulti proc
    sub rsp, 88
    mov dword ptr [rsp+32], ecx
    mov qword ptr [rsp+40], rdx
    cmp ecx, 1
    jl pulsec_rt_arrayNewMulti_zero
    mov ecx, dword ptr [rdx]
    call pulsec_rt_arrayNew
    mov qword ptr [rsp+48], rax
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov dword ptr [rsp+56], eax
    mov ecx, dword ptr [rsp+32]
    cmp ecx, 1
    jle pulsec_rt_arrayNewMulti_done
    mov dword ptr [rsp+64], 0
pulsec_rt_arrayNewMulti_loop:
    mov eax, dword ptr [rsp+64]
    cmp eax, dword ptr [rsp+56]
    jae pulsec_rt_arrayNewMulti_done
    mov ecx, dword ptr [rsp+32]
    sub ecx, 1
    mov rdx, qword ptr [rsp+40]
    add rdx, 8
    call pulsec_rt_arrayNewMulti
    mov qword ptr [rsp+72], rax
    mov r8, rax
    mov rcx, qword ptr [rsp+48]
    mov edx, dword ptr [rsp+64]
    call pulsec_rt_arraySetString
    mov rcx, qword ptr [rsp+72]
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+64]
    add eax, 1
    mov dword ptr [rsp+64], eax
    jmp pulsec_rt_arrayNewMulti_loop
pulsec_rt_arrayNewMulti_done:
    mov rax, qword ptr [rsp+48]
    add rsp, 88
    ret
pulsec_rt_arrayNewMulti_zero:
    xor eax, eax
    add rsp, 88
    ret
pulsec_rt_arrayNewMulti endp

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
    mov dword ptr [rt_tmp_arr_slot], ecx
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

pulsec_rt_arraySetLong proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_arraySetLong_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arraySetLong_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_arraySetLong_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_arraySetLong_live_panic
pulsec_rt_arraySetLong_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_arraySetLong_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 2
    jne pulsec_rt_arraySetLong_live_panic
    jmp pulsec_rt_arraySetLong_ok
pulsec_rt_arraySetLong_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_arraySetLong_ok:
    mov ecx, r10d
    mov dword ptr [rt_tmp_arr_slot], ecx
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
    mov qword ptr [r10+rdx*8], r8
@@:
    xor eax, eax
    ret
pulsec_rt_arraySetLong endp

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
    mov dword ptr [rt_tmp_arr_slot], ecx
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
    mov rax, qword ptr [r10+rdx*8]
    test rax, rax
    jz pulsec_rt_arraySetString_ref_release_done
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_rt_arraySetString_ref_release_done:
    mov rcx, r8
    call pulsec_rt_arcRetain
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov r11, qword ptr [rt_arr_s_ptr_ptr]
    mov r10, qword ptr [r11+rcx*8]
    mov qword ptr [r10+rdx*8], r8
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

pulsec_rt_charToString proc
    mov byte ptr [rt_tmpbuf], cl
    lea rcx, rt_tmpbuf
    mov edx, 1
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_charToString endp

pulsec_rt_classPackageName proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_classPackageName_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_classPackageName_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_classPackageName_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_classPackageName_live_panic
pulsec_rt_classPackageName_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_classPackageName_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_classPackageName_live_panic
    jmp pulsec_rt_classPackageName_ok
pulsec_rt_classPackageName_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_classPackageName_ok:
    mov ecx, r10d
    mov r11d, ecx
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r11*4]
    mov eax, r11d
    imul eax, 256
    mov r9, qword ptr [rt_str_data_ptr]
    add r9, rax
    mov r10d, edx
pulsec_rt_classPackageName_scan:
    cmp r10d, 0
    je pulsec_rt_classPackageName_empty
    sub r10d, 1
    cmp byte ptr [r9+r10], '.'
    jne pulsec_rt_classPackageName_scan
    mov rcx, r9
    mov edx, r10d
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_classPackageName_empty:
    lea rcx, rt_empty
    xor edx, edx
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_classPackageName endp

pulsec_rt_classSimpleName proc
    mov r8, rcx
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_classSimpleName_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_classSimpleName_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_classSimpleName_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_classSimpleName_live_panic
pulsec_rt_classSimpleName_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_classSimpleName_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_classSimpleName_live_panic
    jmp pulsec_rt_classSimpleName_ok
pulsec_rt_classSimpleName_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_classSimpleName_ok:
    mov ecx, r10d
    mov r11d, ecx
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r11*4]
    mov eax, r11d
    imul eax, 256
    mov r9, qword ptr [rt_str_data_ptr]
    add r9, rax
    mov r10d, edx
pulsec_rt_classSimpleName_scan:
    cmp r10d, 0
    je pulsec_rt_classSimpleName_no_dot
    sub r10d, 1
    cmp byte ptr [r9+r10], '.'
    jne pulsec_rt_classSimpleName_scan
    lea rcx, [r9+r10+1]
    mov eax, edx
    sub eax, r10d
    sub eax, 1
    mov edx, eax
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_classSimpleName_no_dot:
    mov rax, r8
    ret
pulsec_rt_classSimpleName endp

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

pulsec_rt_dispatchInvalidTypePanic proc
    lea rcx, rt_dispatch_invalid_type_err
    mov edx, rt_dispatch_invalid_type_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_dispatchInvalidTypePanic endp

pulsec_rt_dispatchNullReceiverPanic proc
    lea rcx, rt_dispatch_null_receiver_err
    mov edx, rt_dispatch_null_receiver_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_dispatchNullReceiverPanic endp

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
    mov qword ptr [rt_tmp_arg_val], rdx
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
    mov qword ptr [rt_tmp_arg_val], rdx
    mov r10d, ecx
    mov rax, qword ptr [rt_list_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_list_cap_ptr]
    mov r9d, dword ptr [rax+r10*4]
    cmp r8d, r9d
    jae pulsec_rt_listAddString_grow
pulsec_rt_listAddString_emit:
    mov rcx, qword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov r10d, dword ptr [rt_tmp_arr_slot]
    mov rax, qword ptr [rt_list_kind_ptr]
    mov dword ptr [rax+r10*4], 2
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    test r11, r11
    jz pulsec_rt_listAddString_fail
    mov r8d, dword ptr [rt_tmp_size]
    mov rcx, qword ptr [rt_tmp_arg_val]
    mov qword ptr [r11+r8*8], rcx
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
    shl rax, 3
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
    mov rax, qword ptr [rax+rcx*8]
    mov qword ptr [r11+rcx*8], rax
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
    mov rcx, qword ptr [rax+rcx*8]
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
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    mov rax, qword ptr [r11+rdx*8]
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
    shl rax, 3
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
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    sub rsp, 88
    mov dword ptr [rsp+32], ecx
    mov r10d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov eax, dword ptr [rax+r10*4]
    mov dword ptr [rsp+40], eax
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+56], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+64], rax
    mov dword ptr [rsp+72], 0
pulsec_rt_mapClear_release_loop:
    mov ecx, dword ptr [rsp+72]
    cmp ecx, dword ptr [rsp+40]
    jae pulsec_rt_mapClear_release_done
    mov rax, qword ptr [rsp+48]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_key
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_mapClear_release_skip_key:
    mov ecx, dword ptr [rsp+72]
    mov rax, qword ptr [rsp+56]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_value
    cmp dword ptr [rax+rcx*4], 2
    jne pulsec_rt_mapClear_release_skip_value
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jz pulsec_rt_mapClear_release_skip_value
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_mapClear_release_skip_value:
    mov ecx, dword ptr [rsp+72]
    add ecx, 1
    mov dword ptr [rsp+72], ecx
    jmp pulsec_rt_mapClear_release_loop
pulsec_rt_mapClear_release_done:
    mov r10d, dword ptr [rsp+32]
    mov rax, qword ptr [rt_map_size_ptr]
    mov dword ptr [rax+r10*4], 0
    mov rax, qword ptr [rt_map_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 16
    jbe pulsec_rt_mapClear_done
    cmp eax, 64
    jb pulsec_rt_mapClear_done
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    mov qword ptr [rt_tmp_arr_bytes], 64
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
    mov qword ptr [rt_tmp_arr_bytes], 64
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
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    add rsp, 88
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
    cmp qword ptr [r11+r9*8], rdx
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
    cmp qword ptr [rax+r9*8], rdx
    jne pulsec_rt_mapGet_next
    mov rax, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [rax+r9*4], 2
    jne pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_mapGet_end
    mov rax, qword ptr [rax+r9*8]
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
    cmp qword ptr [rax+r9*8], rdx
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
    shl rax, 3
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
    mov rax, qword ptr [rt_map_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
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
    mov rax, qword ptr [rt_map_cap_ptr]
    mov eax, dword ptr [rax+r10*4]
    shl rax, 3
    mov qword ptr [rt_tmp_arr_bytes], rax
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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov qword ptr [rt_tmp_arg_val], r8
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
    mov qword ptr [rt_tmp_arr_bytes], 64
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov qword ptr [rt_tmp_arr_bytes], 64
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    mov rdx, qword ptr [rt_tmp_arg_key]
    cmp qword ptr [r10+rax*8], rdx
    jne pulsec_rt_mapPut_miss
    mov dword ptr [rt_tmp_arr_len], eax
    mov r10, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [r10+rax*4], 2
    jne @F
    mov r10, qword ptr [rt_tmp_ptr_d]
    test r10, r10
    jz @F
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov rcx, qword ptr [r10+rcx*8]
    call pulsec_rt_arcRelease
@@:
    mov eax, dword ptr [rt_tmp_arr_len]
    mov rcx, qword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rt_tmp_arr_len]
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+rax*4], 2
    mov r10, qword ptr [rt_tmp_ptr_d]
    mov rdx, qword ptr [rt_tmp_arg_val]
    mov qword ptr [r10+rax*8], rdx
    jmp pulsec_rt_mapPut_end
pulsec_rt_mapPut_miss:
    add eax, 1
    jmp pulsec_rt_mapPut_loop
pulsec_rt_mapPut_insert:
    mov r9d, dword ptr [rt_tmp_size]
    cmp r9d, dword ptr [rt_tmp_arr_len]
    jae pulsec_rt_mapPut_grow
    mov rcx, qword ptr [rt_tmp_arg_key]
    call pulsec_rt_arcRetain
    mov rcx, qword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov r9d, dword ptr [rt_tmp_size]
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov qword ptr [r10+r9*8], rdx
    mov r10, qword ptr [rt_tmp_ptr_b]
    mov dword ptr [r10+r9*4], 2
    mov r10, qword ptr [rt_tmp_ptr_d]
    mov rdx, qword ptr [rt_tmp_arg_val]
    mov qword ptr [r10+r9*8], rdx
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
    shl rax, 3
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
    mov eax, dword ptr [rt_tmp_arr_len]
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
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
    mov eax, dword ptr [rt_tmp_arr_len]
    shl rax, 3
    mov qword ptr [rt_tmp_arr_bytes], rax
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
    mov rdx, qword ptr [rax+rcx*8]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rax+rcx*8], rdx
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
    mov rdx, qword ptr [rax+rcx*8]
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov qword ptr [rax+rcx*8], rdx
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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov qword ptr [rt_tmp_arg_val], r8
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
    mov qword ptr [rt_tmp_arr_bytes], 64
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_b], rax
    mov qword ptr [rt_tmp_arr_bytes], 64
    mov rax, qword ptr [rt_map_i_ptr_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
    mov qword ptr [rt_tmp_arr_bytes], 128
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
    mov rdx, qword ptr [rt_tmp_arg_key]
    cmp qword ptr [r10+rax*8], rdx
    jne pulsec_rt_mapPutInt_miss
    mov dword ptr [rt_tmp_arr_len], eax
    mov r10, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [r10+rax*4], 2
    jne @F
    mov r10, qword ptr [rt_tmp_ptr_d]
    test r10, r10
    jz @F
    mov ecx, dword ptr [rt_tmp_arr_len]
    mov rcx, qword ptr [r10+rcx*8]
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
    mov rcx, qword ptr [rt_tmp_arg_key]
    call pulsec_rt_arcRetain
    mov r9d, dword ptr [rt_tmp_size]
    mov r10, qword ptr [rt_tmp_ptr_a]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov qword ptr [r10+r9*8], rdx
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
    shl rax, 3
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
    mov eax, dword ptr [rt_tmp_arr_len]
    shl rax, 2
    mov qword ptr [rt_tmp_arr_bytes], rax
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
    mov eax, dword ptr [rt_tmp_arr_len]
    shl rax, 3
    mov qword ptr [rt_tmp_arr_bytes], rax
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
    mov rdx, qword ptr [rax+rcx*8]
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [rax+rcx*8], rdx
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
    mov rdx, qword ptr [rax+rcx*8]
    mov rax, qword ptr [rt_tmp_ptr_d]
    mov qword ptr [rax+rcx*8], rdx
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

pulsec_rt_stringCharAt proc
    mov r9d, edx
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_stringCharAt_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringCharAt_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_stringCharAt_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_stringCharAt_live_panic
pulsec_rt_stringCharAt_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_stringCharAt_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_stringCharAt_live_panic
    jmp pulsec_rt_stringCharAt_ok
pulsec_rt_stringCharAt_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_stringCharAt_ok:
    mov ecx, r10d
    mov r11d, ecx
    cmp r9d, 0
    jl pulsec_rt_stringCharAt_fail
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r11*4]
    cmp r9d, edx
    jae pulsec_rt_stringCharAt_fail
    mov eax, r11d
    imul eax, 256
    mov r10, qword ptr [rt_str_data_ptr]
    add r10, rax
    movzx eax, byte ptr [r10+r9]
    ret
pulsec_rt_stringCharAt_fail:
    lea rcx, rt_string_index_oob_err
    mov edx, rt_string_index_oob_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_stringCharAt endp

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

pulsec_rt_stringSubstring proc
    mov r9d, edx
    mov r10d, r8d
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_stringSubstring_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringSubstring_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_stringSubstring_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_stringSubstring_live_panic
pulsec_rt_stringSubstring_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_stringSubstring_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_stringSubstring_live_panic
    jmp pulsec_rt_stringSubstring_ok
pulsec_rt_stringSubstring_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_stringSubstring_ok:
    mov ecx, r10d
    mov r11d, ecx
    cmp r9d, 0
    jl pulsec_rt_stringSubstring_fail
    cmp r10d, r9d
    jl pulsec_rt_stringSubstring_fail
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r11*4]
    cmp r10d, edx
    jg pulsec_rt_stringSubstring_fail
    mov eax, r10d
    sub eax, r9d
    mov r8d, eax
    mov eax, r11d
    imul eax, 256
    mov rcx, qword ptr [rt_str_data_ptr]
    add rcx, rax
    add rcx, r9
    mov edx, r8d
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_stringSubstring_fail:
    lea rcx, rt_string_substring_bounds_err
    mov edx, rt_string_substring_bounds_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_stringSubstring endp

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

.data
msg0 db "runtime_mix_ok"
msg0_len equ $ - msg0
msg1 db "AssertionError"
msg1_len equ $ - msg1
msg2 db "AssertionError"
msg2_len equ $ - msg2
msg3 db "AssertionError"
msg3_len equ $ - msg3
msg4 db "AssertionError: "
msg4_len equ $ - msg4
msg5 db "Byte.parse out of range"
msg5_len equ $ - msg5
msg6 db "Char.parse is not supported yet"
msg6_len equ $ - msg6
msg7 db 0
msg7_len equ $ - msg7
msg8 db 0
msg8_len equ $ - msg8
msg9 db "Double.parse is not supported yet"
msg9_len equ $ - msg9
msg10 db "Exception"
msg10_len equ $ - msg10
msg11 db "Exception"
msg11_len equ $ - msg11
msg12 db "Exception"
msg12_len equ $ - msg12
msg13 db "Float.parse is not supported yet"
msg13_len equ $ - msg13
msg14 db "IllegalArgumentException"
msg14_len equ $ - msg14
msg15 db "IllegalArgumentException"
msg15_len equ $ - msg15
msg16 db "IllegalArgumentException"
msg16_len equ $ - msg16
msg17 db "IllegalStateException"
msg17_len equ $ - msg17
msg18 db "IllegalStateException"
msg18_len equ $ - msg18
msg19 db "IllegalStateException"
msg19_len equ $ - msg19
msg20 db "IndexOutOfBoundsException"
msg20_len equ $ - msg20
msg21 db "IndexOutOfBoundsException"
msg21_len equ $ - msg21
msg22 db "IndexOutOfBoundsException"
msg22_len equ $ - msg22
msg23 db "Long.parse is not supported yet"
msg23_len equ $ - msg23
msg24 db "Long.toString is not supported yet"
msg24_len equ $ - msg24
msg25 db 0
msg25_len equ $ - msg25
msg26 db "NullPointerException"
msg26_len equ $ - msg26
msg27 db "NullPointerException"
msg27_len equ $ - msg27
msg28 db "NullPointerException"
msg28_len equ $ - msg28
msg29 db "NumberFormatException"
msg29_len equ $ - msg29
msg30 db "NumberFormatException"
msg30_len equ $ - msg30
msg31 db "NumberFormatException"
msg31_len equ $ - msg31
msg32 db "RuntimeException"
msg32_len equ $ - msg32
msg33 db "RuntimeException"
msg33_len equ $ - msg33
msg34 db "RuntimeException"
msg34_len equ $ - msg34
msg35 db "Short.parse out of range"
msg35_len equ $ - msg35
msg36 db "Invalid cast"
msg36_len equ $ - msg36
msg37 db 0
msg37_len equ $ - msg37
msg38 db "null"
msg38_len equ $ - msg38
msg39 db 0
msg39_len equ $ - msg39
msg40 db 0
msg40_len equ $ - msg40
msg41 db 0
msg41_len equ $ - msg41
msg42 db 0
msg42_len equ $ - msg42
msg43 db "Throwable"
msg43_len equ $ - msg43
msg44 db "Throwable"
msg44_len equ $ - msg44
msg45 db "Throwable"
msg45_len equ $ - msg45
msg46 db "Self-causation is not permitted"
msg46_len equ $ - msg46
msg47 db "Cause already initialized"
msg47_len equ $ - msg47
msg48 db ": "
msg48_len equ $ - msg48
msg49 db 10, 67, 97, 117, 115, 101, 100, 32, 98, 121, 58, 32
msg49_len equ $ - msg49
msg50 db "UByte.parse out of range"
msg50_len equ $ - msg50
msg51 db "UInteger.parse is not supported yet"
msg51_len equ $ - msg51
msg52 db "UInteger.toString is not supported yet"
msg52_len equ $ - msg52
msg53 db 0
msg53_len equ $ - msg53
msg54 db "ULong.parse is not supported yet"
msg54_len equ $ - msg54
msg55 db "ULong.toString is not supported yet"
msg55_len equ $ - msg55
msg56 db 0
msg56_len equ $ - msg56
msg57 db "UShort.parse out of range"
msg57_len equ $ - msg57
msg58 db "UnsupportedOperationException"
msg58_len equ $ - msg58
msg59 db "UnsupportedOperationException"
msg59_len equ $ - msg59
msg60 db "UnsupportedOperationException"
msg60_len equ $ - msg60
msg61 db 0
msg61_len equ $ - msg61
msg62 db 0
msg62_len equ $ - msg62
msg63 db 0
msg63_len equ $ - msg63
msg64 db 0
msg64_len equ $ - msg64
msg65 db 0
msg65_len equ $ - msg65
msg66 db 0
msg66_len equ $ - msg66
msg67 db 0
msg67_len equ $ - msg67

end
