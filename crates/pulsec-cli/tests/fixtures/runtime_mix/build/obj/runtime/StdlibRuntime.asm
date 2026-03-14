option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc

extrn ExitProcess:proc

extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc

extrn pulsec_fcap_com_pulse_lang_Class_arc_teardown:proc
extrn pulsec_fcap_com_pulse_lang_Class_arc_scan_edges:proc
extrn pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges:proc
extrn pulsec_fcap_com_pulse_lang_StringBuilder_arc_teardown:proc
extrn pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges:proc
extrn pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges:proc
extrn pulsec_fcap_com_pulse_lang_Throwable_arc_teardown:proc
extrn pulsec_fcap_com_pulse_lang_Throwable_arc_scan_edges:proc
extrn pulsec_fcap_com_pulse_lang_Throwable_arc_invalidate_edges:proc

.data
written dq 0

public pulsec_rt_obj_counter
pulsec_rt_obj_counter dd 0
public pulsec_rt_obj_class_ids
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
rt_tmpbuf db 256 dup(0)
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
rt_parse_long_err db 'I','n','v','a','l','i','d',' ','l','o','n','g',' ','l','i','t','e','r','a','l'
rt_parse_bool_err db 'I','n','v','a','l','i','d',' ','b','o','o','l','e','a','n',' ','l','i','t','e','r','a','l'
rt_parse_uint_err db 'I','n','v','a','l','i','d',' ','u','i','n','t',' ','l','i','t','e','r','a','l'
rt_parse_ulong_err db 'I','n','v','a','l','i','d',' ','u','l','o','n','g',' ','l','i','t','e','r','a','l'

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

pulsec_rt_longToString proc
    mov rax, rcx
    lea r8, rt_tmpbuf
    add r8, 31
    xor r9d, r9d
    xor ecx, ecx
    cmp rax, 0
    jne pulsec_rt_longToString_nonzero
    mov byte ptr [r8], '0'
    mov rcx, r8
    mov edx, 1
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_longToString_nonzero:
    cmp rax, 0
    jge pulsec_rt_longToString_digit_loop
    mov r9d, 1
pulsec_rt_longToString_digit_loop:
    mov r10, 10
    cqo
    idiv r10
    mov r11, rdx
    test r11, r11
    jge pulsec_rt_longToString_positive_rem
    neg r11
pulsec_rt_longToString_positive_rem:
    add r11b, '0'
    mov byte ptr [r8], r11b
    sub r8, 1
    add ecx, 1
    test rax, rax
    jne pulsec_rt_longToString_digit_loop
    cmp r9d, 0
    je pulsec_rt_longToString_after_sign
    mov byte ptr [r8], '-'
    sub r8, 1
    add ecx, 1
pulsec_rt_longToString_after_sign:
    add r8, 1
    mov rdx, rcx
    mov rcx, r8
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_longToString endp

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

pulsec_rt_parseLong proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r8, rcx
    shr r8, 32
    cmp r10d, 0
    jl rt_parse_long_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    jg rt_parse_long_fail
    test r8d, r8d
    jz rt_parse_long_plain
    cmp r8d, dword ptr [rt_arc_generation+r10*4]
    jne rt_parse_long_stale
rt_parse_long_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je rt_parse_long_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne rt_parse_long_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r11d, dword ptr [rax+r10*4]
    cmp r11d, 0
    je rt_parse_long_fail
    mov r9, qword ptr [rt_str_data_ptr]
    mov r8d, r10d
    imul r8d, 256
    add r9, r8
    xor rax, rax
    xor r8d, r8d
    mov ecx, 1
    mov bl, byte ptr [r9]
    cmp bl, '-'
    jne rt_parse_long_loop
    cmp r11d, 1
    je rt_parse_long_fail
    mov ecx, -1
    mov r8d, 1
rt_parse_long_loop:
    cmp r8d, r11d
    jge rt_parse_long_done
    mov bl, byte ptr [r9+r8]
    cmp bl, '0'
    jb rt_parse_long_fail
    cmp bl, '9'
    ja rt_parse_long_fail
    movzx edx, bl
    sub edx, '0'
    imul rax, rax, 10
    add rax, rdx
    inc r8d
    jmp rt_parse_long_loop
rt_parse_long_done:
    cmp ecx, -1
    jne rt_parse_long_ret
    neg rax
rt_parse_long_ret:
    ret
rt_parse_long_fail:
    lea rcx, rt_parse_long_err
    mov edx, 20
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
rt_parse_long_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_parseLong endp

pulsec_rt_parseUInt proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r8, rcx
    shr r8, 32
    cmp r10d, 0
    jl rt_parse_uint_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    jg rt_parse_uint_fail
    test r8d, r8d
    jz rt_parse_uint_plain
    cmp r8d, dword ptr [rt_arc_generation+r10*4]
    jne rt_parse_uint_stale
rt_parse_uint_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je rt_parse_uint_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne rt_parse_uint_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r11d, dword ptr [rax+r10*4]
    cmp r11d, 0
    je rt_parse_uint_fail
    mov r9, qword ptr [rt_str_data_ptr]
    mov r8d, r10d
    imul r8d, 256
    add r9, r8
    xor eax, eax
    xor r8d, r8d
rt_parse_uint_loop:
    cmp r8d, r11d
    jge rt_parse_uint_ret
    mov bl, byte ptr [r9+r8]
    cmp bl, '0'
    jb rt_parse_uint_fail
    cmp bl, '9'
    ja rt_parse_uint_fail
    movzx ecx, bl
    sub ecx, '0'
    imul eax, eax, 10
    add eax, ecx
    inc r8d
    jmp rt_parse_uint_loop
rt_parse_uint_ret:
    ret
rt_parse_uint_fail:
    lea rcx, rt_parse_uint_err
    mov edx, 20
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
rt_parse_uint_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_parseUInt endp

pulsec_rt_parseULong proc
    mov r10d, ecx
    and r10d, 4294967295
    mov r8, rcx
    shr r8, 32
    cmp r10d, 0
    jl rt_parse_ulong_fail
    cmp r10d, dword ptr [rt_slot_capacity]
    jg rt_parse_ulong_fail
    test r8d, r8d
    jz rt_parse_ulong_plain
    cmp r8d, dword ptr [rt_arc_generation+r10*4]
    jne rt_parse_ulong_stale
rt_parse_ulong_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je rt_parse_ulong_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne rt_parse_ulong_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r11d, dword ptr [rax+r10*4]
    cmp r11d, 0
    je rt_parse_ulong_fail
    mov r9, qword ptr [rt_str_data_ptr]
    mov r8d, r10d
    imul r8d, 256
    add r9, r8
    xor rax, rax
    xor r8d, r8d
rt_parse_ulong_loop:
    cmp r8d, r11d
    jge rt_parse_ulong_ret
    mov bl, byte ptr [r9+r8]
    cmp bl, '0'
    jb rt_parse_ulong_fail
    cmp bl, '9'
    ja rt_parse_ulong_fail
    movzx edx, bl
    sub edx, '0'
    imul rax, rax, 10
    add rax, rdx
    inc r8d
    jmp rt_parse_ulong_loop
rt_parse_ulong_ret:
    ret
rt_parse_ulong_fail:
    lea rcx, rt_parse_ulong_err
    mov edx, 21
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
rt_parse_ulong_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_parseULong endp

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

pulsec_rt_uintToString proc
    mov eax, ecx
    lea r8, rt_tmpbuf
    add r8, 31
    xor ecx, ecx
    cmp eax, 0
    jne pulsec_rt_uintToString_nonzero
    mov byte ptr [r8], '0'
    mov rcx, r8
    mov edx, 1
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_uintToString_nonzero:
    mov r10d, 10
pulsec_rt_uintToString_digit_loop:
    xor edx, edx
    div r10d
    add dl, '0'
    mov byte ptr [r8], dl
    sub r8, 1
    add ecx, 1
    test eax, eax
    jne pulsec_rt_uintToString_digit_loop
    add r8, 1
    mov rdx, rcx
    mov rcx, r8
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_uintToString endp

pulsec_rt_ulongToString proc
    mov rax, rcx
    lea r8, rt_tmpbuf
    add r8, 31
    xor ecx, ecx
    cmp rax, 0
    jne pulsec_rt_ulongToString_nonzero
    mov byte ptr [r8], '0'
    mov rcx, r8
    mov edx, 1
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_ulongToString_nonzero:
    mov r10, 10
pulsec_rt_ulongToString_digit_loop:
    xor edx, edx
    div r10
    add dl, '0'
    mov byte ptr [r8], dl
    sub r8, 1
    add ecx, 1
    test rax, rax
    jne pulsec_rt_ulongToString_digit_loop
    add r8, 1
    mov rdx, rcx
    mov rcx, r8
    call pulsec_rt_stringFromBytes
    ret
pulsec_rt_ulongToString endp

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
