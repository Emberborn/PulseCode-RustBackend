option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc

extrn ExitProcess:proc

extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc

extrn Sleep:proc
extrn SwitchToThread:proc
extrn GetCurrentThreadId:proc
extrn CreateThread:proc

extrn CreateMutexA:proc
extrn ReleaseMutex:proc
extrn CreateEventA:proc
extrn SetEvent:proc
extrn ResetEvent:proc
extrn CloseHandle:proc

extrn CreateSemaphoreA:proc
extrn ReleaseSemaphore:proc

extrn GetProcessHeap:proc
extrn GetFileAttributesA:proc
extrn CreateDirectoryA:proc
extrn CopyFileA:proc
extrn CreateFileA:proc
extrn LoadLibraryA:proc
extrn GetModuleHandleA:proc
extrn FreeLibrary:proc
extrn GetProcAddress:proc
extrn CreateProcessA:proc
extrn GetFileSize:proc
extrn GetExitCodeProcess:proc
extrn CloseHandle:proc
extrn FindFirstFileA:proc
extrn FindNextFileA:proc
extrn FindClose:proc
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
extrn HeapFree:proc

extrn WaitForSingleObject:proc

extrn pulsec_fcap_pulse_lang_Class_arc_teardown:proc
extrn pulsec_fcap_pulse_lang_Class_arc_scan_edges:proc
extrn pulsec_fcap_pulse_lang_Class_arc_invalidate_edges:proc
extrn pulsec_fcap_pulse_lang_StringBuilder_arc_teardown:proc
extrn pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges:proc
extrn pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges:proc
extrn pulsec_fcap_pulse_lang_Throwable_arc_teardown:proc
extrn pulsec_fcap_pulse_lang_Throwable_arc_scan_edges:proc
extrn pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges:proc

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
rt_runtime_memory_lock dq 0
rt_str_count dd 0
rt_str_lens_ptr dq 0
rt_str_data_ptr dq 0
rt_tmpbuf db 4096 dup(0)
rt_tmp_concat db 4096 dup(0)
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
rt_native_callback0_slots dd 16 dup(0)
rt_native_callback0_entrypoints dq pulsec_rt_nativeCallback0_slot1
    dq pulsec_rt_nativeCallback0_slot2
    dq pulsec_rt_nativeCallback0_slot3
    dq pulsec_rt_nativeCallback0_slot4
    dq pulsec_rt_nativeCallback0_slot5
    dq pulsec_rt_nativeCallback0_slot6
    dq pulsec_rt_nativeCallback0_slot7
    dq pulsec_rt_nativeCallback0_slot8
    dq pulsec_rt_nativeCallback0_slot9
    dq pulsec_rt_nativeCallback0_slot10
    dq pulsec_rt_nativeCallback0_slot11
    dq pulsec_rt_nativeCallback0_slot12
    dq pulsec_rt_nativeCallback0_slot13
    dq pulsec_rt_nativeCallback0_slot14
    dq pulsec_rt_nativeCallback0_slot15
    dq pulsec_rt_nativeCallback0_slot16
rt_native_callback1_slots dd 16 dup(0)
rt_native_callback1_entrypoints dq pulsec_rt_nativeCallback1_slot1
    dq pulsec_rt_nativeCallback1_slot2
    dq pulsec_rt_nativeCallback1_slot3
    dq pulsec_rt_nativeCallback1_slot4
    dq pulsec_rt_nativeCallback1_slot5
    dq pulsec_rt_nativeCallback1_slot6
    dq pulsec_rt_nativeCallback1_slot7
    dq pulsec_rt_nativeCallback1_slot8
    dq pulsec_rt_nativeCallback1_slot9
    dq pulsec_rt_nativeCallback1_slot10
    dq pulsec_rt_nativeCallback1_slot11
    dq pulsec_rt_nativeCallback1_slot12
    dq pulsec_rt_nativeCallback1_slot13
    dq pulsec_rt_nativeCallback1_slot14
    dq pulsec_rt_nativeCallback1_slot15
    dq pulsec_rt_nativeCallback1_slot16
rt_native_callback2_slots dd 16 dup(0)
rt_native_callback2_entrypoints dq pulsec_rt_nativeCallback2_slot1
    dq pulsec_rt_nativeCallback2_slot2
    dq pulsec_rt_nativeCallback2_slot3
    dq pulsec_rt_nativeCallback2_slot4
    dq pulsec_rt_nativeCallback2_slot5
    dq pulsec_rt_nativeCallback2_slot6
    dq pulsec_rt_nativeCallback2_slot7
    dq pulsec_rt_nativeCallback2_slot8
    dq pulsec_rt_nativeCallback2_slot9
    dq pulsec_rt_nativeCallback2_slot10
    dq pulsec_rt_nativeCallback2_slot11
    dq pulsec_rt_nativeCallback2_slot12
    dq pulsec_rt_nativeCallback2_slot13
    dq pulsec_rt_nativeCallback2_slot14
    dq pulsec_rt_nativeCallback2_slot15
    dq pulsec_rt_nativeCallback2_slot16
rt_native_callback3_slots dd 16 dup(0)
rt_native_callback3_entrypoints dq pulsec_rt_nativeCallback3_slot1
    dq pulsec_rt_nativeCallback3_slot2
    dq pulsec_rt_nativeCallback3_slot3
    dq pulsec_rt_nativeCallback3_slot4
    dq pulsec_rt_nativeCallback3_slot5
    dq pulsec_rt_nativeCallback3_slot6
    dq pulsec_rt_nativeCallback3_slot7
    dq pulsec_rt_nativeCallback3_slot8
    dq pulsec_rt_nativeCallback3_slot9
    dq pulsec_rt_nativeCallback3_slot10
    dq pulsec_rt_nativeCallback3_slot11
    dq pulsec_rt_nativeCallback3_slot12
    dq pulsec_rt_nativeCallback3_slot13
    dq pulsec_rt_nativeCallback3_slot14
    dq pulsec_rt_nativeCallback3_slot15
    dq pulsec_rt_nativeCallback3_slot16
rt_native_callback4_slots dd 16 dup(0)
rt_native_callback4_entrypoints dq pulsec_rt_nativeCallback4_slot1
    dq pulsec_rt_nativeCallback4_slot2
    dq pulsec_rt_nativeCallback4_slot3
    dq pulsec_rt_nativeCallback4_slot4
    dq pulsec_rt_nativeCallback4_slot5
    dq pulsec_rt_nativeCallback4_slot6
    dq pulsec_rt_nativeCallback4_slot7
    dq pulsec_rt_nativeCallback4_slot8
    dq pulsec_rt_nativeCallback4_slot9
    dq pulsec_rt_nativeCallback4_slot10
    dq pulsec_rt_nativeCallback4_slot11
    dq pulsec_rt_nativeCallback4_slot12
    dq pulsec_rt_nativeCallback4_slot13
    dq pulsec_rt_nativeCallback4_slot14
    dq pulsec_rt_nativeCallback4_slot15
    dq pulsec_rt_nativeCallback4_slot16
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

rt_runtime_memory_lock_alloc_err db "Runtime memory lock allocation failed"
rt_runtime_memory_lock_alloc_err_len equ $ - rt_runtime_memory_lock_alloc_err
rt_runtime_memory_lock_err db "Runtime memory lock acquire failed"
rt_runtime_memory_lock_err_len equ $ - rt_runtime_memory_lock_err
rt_runtime_memory_unlock_err db "Runtime memory lock release failed"
rt_runtime_memory_unlock_err_len equ $ - rt_runtime_memory_unlock_err

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

rt_native_callback_exhausted_err db 'N','a','t','i','v','e',' ','c','a','l','l','b','a','c','k',' ','s','l','o','t','s',' ','e','x','h','a','u','s','t','e','d'
rt_native_callback_exhausted_err_len equ $ - rt_native_callback_exhausted_err
rt_native_callback_invalid_err db 'I','n','v','a','l','i','d',' ','n','a','t','i','v','e',' ','c','a','l','l','b','a','c','k',' ','s','l','o','t'
rt_native_callback_invalid_err_len equ $ - rt_native_callback_invalid_err

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

rt_obj_class_name_1 db "app.core.Main"
rt_obj_class_name_1_len equ 13
rt_obj_class_name_2 db "pulse.interop.NativeCallback0"
rt_obj_class_name_2_len equ 29
rt_obj_class_name_3 db "pulse.interop.NativeCallback1"
rt_obj_class_name_3_len equ 29
rt_obj_class_name_4 db "pulse.interop.NativeCallback2"
rt_obj_class_name_4_len equ 29
rt_obj_class_name_5 db "pulse.interop.NativeCallback3"
rt_obj_class_name_5_len equ 29
rt_obj_class_name_6 db "pulse.interop.NativeCallback4"
rt_obj_class_name_6_len equ 29
rt_obj_class_name_7 db "pulse.lang.Appendable"
rt_obj_class_name_7_len equ 21
rt_obj_class_name_8 db "pulse.lang.CharSequence"
rt_obj_class_name_8_len equ 23
rt_obj_class_name_9 db "pulse.lang.Class"
rt_obj_class_name_9_len equ 16
rt_obj_class_name_10 db "pulse.lang.Comparable"
rt_obj_class_name_10_len equ 21
rt_obj_class_name_11 db "pulse.lang.Double"
rt_obj_class_name_11_len equ 17
rt_obj_class_name_12 db "pulse.lang.Exception"
rt_obj_class_name_12_len equ 20
rt_obj_class_name_13 db "pulse.lang.Float"
rt_obj_class_name_13_len equ 16
rt_obj_class_name_14 db "pulse.lang.IO"
rt_obj_class_name_14_len equ 13
rt_obj_class_name_15 db "pulse.lang.Integer"
rt_obj_class_name_15_len equ 18
rt_obj_class_name_16 db "pulse.lang.Long"
rt_obj_class_name_16_len equ 15
rt_obj_class_name_17 db "pulse.lang.NumberFormatException"
rt_obj_class_name_17_len equ 32
rt_obj_class_name_18 db "pulse.lang.Object"
rt_obj_class_name_18_len equ 17
rt_obj_class_name_19 db "pulse.lang.RuntimeException"
rt_obj_class_name_19_len equ 27
rt_obj_class_name_20 db "pulse.lang.String"
rt_obj_class_name_20_len equ 17
rt_obj_class_name_21 db "pulse.lang.StringBuilder"
rt_obj_class_name_21_len equ 24
rt_obj_class_name_22 db "pulse.lang.Throwable"
rt_obj_class_name_22_len equ 20
rt_obj_class_name_23 db "pulse.lang.UInteger"
rt_obj_class_name_23_len equ 19
rt_obj_class_name_24 db "pulse.lang.ULong"
rt_obj_class_name_24_len equ 16
rt_obj_class_name_25 db "pulse.memory.Memory"
rt_obj_class_name_25_len equ 19
rt_obj_class_name_26 db "pulse.rt.Intrinsics"
rt_obj_class_name_26_len equ 19

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
    mov r8d, 512
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
    xor ecx, ecx
    xor edx, edx
    xor r8d, r8d
    call CreateMutexA
    test rax, rax
    jz pulsec_rt_init_fail_lock_alloc
    mov qword ptr [rt_runtime_memory_lock], rax
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
pulsec_rt_init_fail_lock_alloc:
    lea rcx, rt_runtime_memory_lock_alloc_err
    mov edx, rt_runtime_memory_lock_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    jmp pulsec_rt_init_fail_free_data
pulsec_rt_init_fail_free_data:
    mov rcx, qword ptr [rsp+32]
    xor edx, edx
    mov r8, qword ptr [rt_str_data_ptr]
    test r8, r8
    jz pulsec_rt_init_fail_free_lens
    call HeapFree
    mov qword ptr [rt_str_data_ptr], 0
pulsec_rt_init_fail_free_lens:
    mov rcx, qword ptr [rsp+32]
    xor edx, edx
    mov r8, qword ptr [rt_str_lens_ptr]
    call HeapFree
    mov qword ptr [rt_str_lens_ptr], 0
pulsec_rt_init_fail:
    cmp qword ptr [rt_runtime_memory_lock], 0
    je @F
    mov rcx, qword ptr [rt_runtime_memory_lock]
    call CloseHandle
    mov qword ptr [rt_runtime_memory_lock], 0
@@:
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
    mov rcx, qword ptr [rt_runtime_memory_lock]
    test rcx, rcx
    jz @F
    call CloseHandle
@@:
    mov qword ptr [rt_runtime_memory_lock], 0
    mov dword ptr [rt_runtime_init_state], 0
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_shutdown_done:
    xor eax, eax
    ret
pulsec_rt_shutdown endp

pulsec_rt_runtimeMemoryLock proc
    mov rcx, qword ptr [rt_runtime_memory_lock]
    test rcx, rcx
    jz pulsec_rt_runtimeMemoryLock_no_handle
    mov edx, 0FFFFFFFFh
    sub rsp, 40
    call WaitForSingleObject
    add rsp, 40
    cmp eax, 0
    je pulsec_rt_runtimeMemoryLock_done
    cmp eax, 80h
    je pulsec_rt_runtimeMemoryLock_done
pulsec_rt_runtimeMemoryLock_fail:
    sub rsp, 40
    lea rcx, rt_runtime_memory_lock_err
    mov edx, rt_runtime_memory_lock_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
pulsec_rt_runtimeMemoryLock_no_handle:
pulsec_rt_runtimeMemoryLock_done:
    xor eax, eax
    ret
pulsec_rt_runtimeMemoryLock endp

pulsec_rt_runtimeMemoryUnlock proc
    mov rcx, qword ptr [rt_runtime_memory_lock]
    test rcx, rcx
    jz pulsec_rt_runtimeMemoryUnlock_no_handle
    sub rsp, 40
    call ReleaseMutex
    add rsp, 40
    test eax, eax
    jnz pulsec_rt_runtimeMemoryUnlock_done
pulsec_rt_runtimeMemoryUnlock_fail:
    sub rsp, 40
    lea rcx, rt_runtime_memory_unlock_err
    mov edx, rt_runtime_memory_unlock_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 40
pulsec_rt_runtimeMemoryUnlock_no_handle:
pulsec_rt_runtimeMemoryUnlock_done:
    xor eax, eax
    ret
pulsec_rt_runtimeMemoryUnlock endp

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
    mov eax, 20
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

pulsec_rt_classIdInSet proc
    xor eax, eax
    test r8d, r8d
    jle pulsec_rt_classIdInSet_done
pulsec_rt_classIdInSet_loop:
    cmp ecx, dword ptr [rdx]
    je pulsec_rt_classIdInSet_found
    add rdx, 4
    sub r8d, 1
    jg pulsec_rt_classIdInSet_loop
    jmp pulsec_rt_classIdInSet_done
pulsec_rt_classIdInSet_found:
    mov eax, 1
pulsec_rt_classIdInSet_done:
    ret
pulsec_rt_classIdInSet endp

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
    mov dword ptr [rt_tmp_size], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_stringFromBytes_fail
    mov qword ptr [rt_tmp_ptr_b], rax
    mov ecx, dword ptr [rt_tmp_arg_val]
    add ecx, 1
    mov r8d, ecx
    mov rcx, qword ptr [rt_tmp_ptr_b]
    xor edx, edx
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_stringFromBytes_fail
    mov qword ptr [rt_tmp_ptr_a], rax
pulsec_rt_stringFromBytes_buf_alloc_ok:
    mov r10, qword ptr [rt_tmp_ptr_c]
    mov r11d, dword ptr [rt_tmp_arg_val]
    mov edx, dword ptr [rt_str_count]
    add edx, 1
    mov dword ptr [rt_str_count], edx
    mov r9, qword ptr [rt_str_lens_ptr]
    mov ecx, dword ptr [rt_tmp_size]
    mov dword ptr [r9+rcx*4], r11d
    mov r9, qword ptr [rt_str_data_ptr]
    mov rdx, qword ptr [rt_tmp_ptr_a]
    mov qword ptr [r9+rcx*8], rdx
    mov dword ptr [rt_arc_kinds+rcx*4], 3
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
    mov ecx, dword ptr [rt_tmp_size]
    mov dword ptr [rt_arc_generation+rcx*4], edx
    mov r9, qword ptr [rt_tmp_ptr_a]
    xor ecx, ecx
pulsec_rt_stringFromBytes_copy_loop:
    cmp ecx, r11d
    jae pulsec_rt_stringFromBytes_done
    mov dl, byte ptr [r10+rcx]
    mov byte ptr [r9+rcx], dl
    add ecx, 1
    jmp pulsec_rt_stringFromBytes_copy_loop
pulsec_rt_stringFromBytes_done:
    mov byte ptr [r9+rcx], 0
    mov eax, dword ptr [rt_tmp_size]
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

pulsec_rt_stringEquals proc
    sub rsp, 40
    cmp rcx, rdx
    je pulsec_rt_stringEquals_same
    test rcx, rcx
    jz pulsec_rt_stringEquals_done_false
    test rdx, rdx
    jz pulsec_rt_stringEquals_done_false
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_stringEquals_done_false
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringEquals_done_false
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_stringEquals_left_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_stringEquals_done_false
pulsec_rt_stringEquals_left_plain:
    cmp dword ptr [rt_arc_kinds+r10*4], 3
    jne pulsec_rt_stringEquals_done_false
    cmp dword ptr [rt_arc_refcounts+r10*4], 0
    je pulsec_rt_stringEquals_done_false
pulsec_rt_stringEquals_left_ok:
    mov dword ptr [rsp+32], r10d
    mov r10d, edx
    cmp r10d, 1
    jb pulsec_rt_stringEquals_done_false
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_stringEquals_done_false
    mov r11, rdx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_stringEquals_right_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_stringEquals_done_false
pulsec_rt_stringEquals_right_plain:
    cmp dword ptr [rt_arc_kinds+r10*4], 3
    jne pulsec_rt_stringEquals_done_false
    cmp dword ptr [rt_arc_refcounts+r10*4], 0
    je pulsec_rt_stringEquals_done_false
pulsec_rt_stringEquals_right_ok:
    mov dword ptr [rsp+36], r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r10d, dword ptr [rsp+32]
    mov r11d, dword ptr [rsp+36]
    mov ecx, dword ptr [rax+r10*4]
    cmp ecx, dword ptr [rax+r11*4]
    jne pulsec_rt_stringEquals_done_false
    xor eax, eax
pulsec_rt_stringEquals_loop:
    cmp eax, ecx
    jae pulsec_rt_stringEquals_done_true
    mov r8, qword ptr [rt_str_data_ptr]
    mov r10d, dword ptr [rsp+32]
    mov r10, qword ptr [r8+r10*8]
    mov r11d, dword ptr [rsp+36]
    mov r11, qword ptr [r8+r11*8]
    mov dl, byte ptr [r10+rax]
    cmp dl, byte ptr [r11+rax]
    jne pulsec_rt_stringEquals_done_false
    add eax, 1
    jmp pulsec_rt_stringEquals_loop
pulsec_rt_stringEquals_same:
    mov eax, 1
    add rsp, 40
    ret
pulsec_rt_stringEquals_done_true:
    mov eax, 1
    add rsp, 40
    ret
pulsec_rt_stringEquals_done_false:
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_stringEquals endp

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

pulsec_rt_hostPathAlloc proc
    sub rsp, 56
    test rcx, rcx
    jz pulsec_rt_hostPathAlloc_null_input
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_hostPathAlloc_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_hostPathAlloc_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_hostPathAlloc_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_hostPathAlloc_live_panic
pulsec_rt_hostPathAlloc_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_hostPathAlloc_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_hostPathAlloc_live_panic
    jmp pulsec_rt_hostPathAlloc_ok
pulsec_rt_hostPathAlloc_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostPathAlloc_ok:
    mov ecx, r10d
    mov dword ptr [rsp+44], ecx
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+rcx*4]
    mov dword ptr [rsp+48], edx
    mov ecx, edx
    add ecx, 1
    mov dword ptr [rsp+40], ecx
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_hostPathAlloc_alloc_fail
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    xor edx, edx
    mov r8d, dword ptr [rsp+40]
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_hostPathAlloc_alloc_fail
    mov r10, rax
    mov ecx, dword ptr [rsp+44]
    mov rax, qword ptr [rt_str_data_ptr]
    mov r9, qword ptr [rax+rcx*8]
    mov r8d, dword ptr [rsp+48]
    xor ecx, ecx
pulsec_rt_hostPathAlloc_copy_loop:
    cmp ecx, r8d
    jae pulsec_rt_hostPathAlloc_copy_done
    mov al, byte ptr [r9+rcx]
    cmp al, '/'
    jne @F
    mov al, '\'
@@:
    mov byte ptr [r10+rcx], al
    add ecx, 1
    jmp pulsec_rt_hostPathAlloc_copy_loop
pulsec_rt_hostPathAlloc_copy_done:
    mov byte ptr [r10+rcx], 0
    mov edx, r8d
    mov rax, r10
    add rsp, 56
    ret
pulsec_rt_hostPathAlloc_alloc_fail:
    xor eax, eax
    xor edx, edx
    add rsp, 56
    ret
pulsec_rt_hostPathAlloc_null_input:
    xor eax, eax
    xor edx, edx
    add rsp, 56
    ret
pulsec_rt_hostPathAlloc endp

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
    shl eax, 3
    mov dword ptr [rsp+264], eax
    mov eax, dword ptr [rsp+252]
    add eax, 1
    shl eax, 3
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
    cmp ecx, dword ptr [rsp+256]
    jae pulsec_rt_ensureSlotCapacity_grow_str_data_done
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_ensureSlotCapacity_grow_str_data_next
    mov r11, qword ptr [rsp+144]
    mov rdx, qword ptr [r10+rcx*8]
    mov qword ptr [r11+rcx*8], rdx
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
    jae pulsec_rt_ensureSlotCapacity_grow_tbl_17_copy_done
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
    sub rsp, 72
    cmp ecx, 1
    jb pulsec_rt_arcTeardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_done
    mov dword ptr [rsp+32], ecx
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
    cmp edx, 9
    je pulsec_rt_arcTeardown_kind_object_c9
    cmp edx, 21
    je pulsec_rt_arcTeardown_kind_object_c21
    cmp edx, 22
    je pulsec_rt_arcTeardown_kind_object_c22
    jmp pulsec_rt_arcTeardown_kind_object_unmatched
pulsec_rt_arcTeardown_kind_object_c9:
    call pulsec_fcap_pulse_lang_Class_arc_teardown
    mov ecx, dword ptr [rsp+32]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_c21:
    call pulsec_fcap_pulse_lang_StringBuilder_arc_teardown
    mov ecx, dword ptr [rsp+32]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_c22:
    call pulsec_fcap_pulse_lang_Throwable_arc_teardown
    mov ecx, dword ptr [rsp+32]
    jmp pulsec_rt_arcTeardown_kind_object_done
pulsec_rt_arcTeardown_kind_object_unmatched:
pulsec_rt_arcTeardown_kind_object_done:
    jmp pulsec_rt_arcTeardown_clear_header
pulsec_rt_arcTeardown_kind_array:
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_rt_arcTeardown_clear_header
    mov rax, qword ptr [rt_arr_len_ptr]
    mov eax, dword ptr [rax+rcx*4]
    mov dword ptr [rsp+36], eax
    mov rax, qword ptr [rt_arr_len_ptr]
    mov dword ptr [rax+rcx*4], 0
    mov rax, qword ptr [rt_arr_alive_ptr]
    mov dword ptr [rax+rcx*4], 0
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
    mov ecx, dword ptr [rsp+32]
    mov rax, qword ptr [rt_arr_s_ptr_ptr]
    mov r11, qword ptr [rax+rcx*8]
    mov qword ptr [rax+rcx*8], 0
    mov qword ptr [rsp+56], r11
    mov dword ptr [rsp+64], 0
pulsec_rt_arcTeardown_release_array_loop:
    mov ecx, dword ptr [rsp+64]
    cmp ecx, dword ptr [rsp+36]
    jae pulsec_rt_arcTeardown_release_array_done
    mov rax, qword ptr [rsp+56]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_array_skip
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_array_skip:
    mov ecx, dword ptr [rsp+64]
    add ecx, 1
    mov dword ptr [rsp+64], ecx
    jmp pulsec_rt_arcTeardown_release_array_loop
pulsec_rt_arcTeardown_release_array_done:
    mov r11, qword ptr [rsp+56]
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
    mov rax, qword ptr [rt_str_data_ptr]
    mov r11, qword ptr [rax+rcx*8]
    mov qword ptr [rax+rcx*8], 0
    test r11, r11
    jz pulsec_rt_arcTeardown_clear_header
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, r11
    call HeapFree
    add rsp, 40
    jmp pulsec_rt_arcTeardown_clear_header
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
    mov dword ptr [rsp+36], eax
    mov rax, qword ptr [rt_list_kind_ptr]
    mov eax, dword ptr [rax+r10*4]
    cmp eax, 2
    jne pulsec_rt_arcTeardown_release_list_done
    mov rax, qword ptr [rt_list_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+56], rax
    mov dword ptr [rsp+64], 0
pulsec_rt_arcTeardown_release_list_loop:
    mov ecx, dword ptr [rsp+64]
    cmp ecx, dword ptr [rsp+36]
    jae pulsec_rt_arcTeardown_release_list_done
    mov rax, qword ptr [rsp+56]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_list_skip
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_list_skip:
    mov ecx, dword ptr [rsp+64]
    add ecx, 1
    mov dword ptr [rsp+64], ecx
    jmp pulsec_rt_arcTeardown_release_list_loop
pulsec_rt_arcTeardown_release_list_done:
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov dword ptr [rsp+36], eax
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+40], rax
    mov rax, qword ptr [rt_map_tags_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rt_map_s_ptr_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rsp+56], rax
    mov dword ptr [rsp+64], 0
pulsec_rt_arcTeardown_release_map_loop:
    mov ecx, dword ptr [rsp+64]
    cmp ecx, dword ptr [rsp+36]
    jae pulsec_rt_arcTeardown_release_map_done
    mov rax, qword ptr [rsp+40]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_key
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_map_skip_key:
    mov ecx, dword ptr [rsp+64]
    mov rax, qword ptr [rsp+48]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_value
    cmp dword ptr [rax+rcx*4], 2
    jne pulsec_rt_arcTeardown_release_map_skip_value
    mov rax, qword ptr [rsp+56]
    test rax, rax
    jz pulsec_rt_arcTeardown_release_map_skip_value
    mov rcx, qword ptr [rax+rcx*8]
    call pulsec_rt_arcRelease
pulsec_rt_arcTeardown_release_map_skip_value:
    mov ecx, dword ptr [rsp+64]
    add ecx, 1
    mov dword ptr [rsp+64], ecx
    jmp pulsec_rt_arcTeardown_release_map_loop
pulsec_rt_arcTeardown_release_map_done:
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov r10d, dword ptr [rsp+32]
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
    mov ecx, dword ptr [rsp+32]
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
    add rsp, 72
    ret
pulsec_rt_arcTeardown endp

pulsec_rt_arcCycleFullPass proc
    call pulsec_rt_runtimeMemoryLock
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
    cmp edx, 9
    je pulsec_rt_arcCycleFullPass_scan_edges_c9
    cmp edx, 21
    je pulsec_rt_arcCycleFullPass_scan_edges_c21
    cmp edx, 22
    je pulsec_rt_arcCycleFullPass_scan_edges_c22
    jmp pulsec_rt_arcCycleFullPass_scan_edges_unmatched
pulsec_rt_arcCycleFullPass_scan_edges_c9:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_Class_arc_scan_edges
    jmp pulsec_rt_arcCycleFullPass_scan_edges_next
pulsec_rt_arcCycleFullPass_scan_edges_c21:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges
    jmp pulsec_rt_arcCycleFullPass_scan_edges_next
pulsec_rt_arcCycleFullPass_scan_edges_c22:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_Throwable_arc_scan_edges
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
    cmp edx, 9
    je pulsec_rt_arcCycleFullPass_invalidate_c9
    cmp edx, 21
    je pulsec_rt_arcCycleFullPass_invalidate_c21
    cmp edx, 22
    je pulsec_rt_arcCycleFullPass_invalidate_c22
    jmp pulsec_rt_arcCycleFullPass_invalidate_unmatched
pulsec_rt_arcCycleFullPass_invalidate_c9:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_Class_arc_invalidate_edges
    jmp pulsec_rt_arcCycleFullPass_invalidate_next
pulsec_rt_arcCycleFullPass_invalidate_c21:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges
    jmp pulsec_rt_arcCycleFullPass_invalidate_next
pulsec_rt_arcCycleFullPass_invalidate_c22:
    mov ecx, r8d
    call pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges
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
    mov dword ptr [rt_tmp_size], eax
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, dword ptr [rt_tmp_size]
    ret
pulsec_rt_arcCycleFullPass endp

pulsec_rt_arcCycleTick proc
    call pulsec_rt_runtimeMemoryLock
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
    mov dword ptr [rt_tmp_size], eax
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, dword ptr [rt_tmp_size]
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
    mov dword ptr [rt_tmp_size], eax
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, dword ptr [rt_tmp_size]
    ret
pulsec_rt_arcCycleTick endp

pulsec_rt_arcCycleYoungPass proc
    call pulsec_rt_runtimeMemoryLock
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
    mov dword ptr [rt_tmp_size], eax
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, dword ptr [rt_tmp_size]
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
pulsec_rt_arcRelease_retry:
    test eax, eax
    jz pulsec_rt_arcRelease_debug_invalid
    lea edx, [eax-1]
    lock cmpxchg dword ptr [rt_arc_refcounts+r8*4], edx
    jne pulsec_rt_arcRelease_retry
    test edx, edx
    jnz pulsec_rt_arcRelease_done
    sub rsp, 40
    mov dword ptr [rsp+32], r8d
    call pulsec_rt_runtimeMemoryLock
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcTeardown
    call pulsec_rt_runtimeMemoryUnlock
    add rsp, 40
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
pulsec_rt_arcRetain_retry:
    mov edx, dword ptr [rt_arc_refcounts+r8*4]
    test edx, edx
    jz pulsec_rt_arcRetain_debug_invalid
    cmp edx, 4294967294
    jae pulsec_rt_arcRetain_saturation
    lea r10d, [edx+1]
    mov eax, edx
    lock cmpxchg dword ptr [rt_arc_refcounts+r8*4], r10d
    jne pulsec_rt_arcRetain_retry
pulsec_rt_arcRetain_done:
    mov rax, rcx
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
    mov edx, 8
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
    mov edx, 8
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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov qword ptr [rt_tmp_arg_val], r8
    mov rax, qword ptr [r10+rdx*8]
    test rax, rax
    jz pulsec_rt_arraySetString_ref_release_done
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_rt_arraySetString_ref_release_done:
    mov rcx, qword ptr [rt_tmp_arg_val]
    call pulsec_rt_arcRetain
    mov ecx, dword ptr [rt_tmp_arr_slot]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov r11, qword ptr [rt_arr_s_ptr_ptr]
    mov r10, qword ptr [r11+rcx*8]
    mov r8, qword ptr [rt_tmp_arg_val]
    mov qword ptr [r10+rdx*8], r8
@@:
    xor eax, eax
    ret
pulsec_rt_arraySetString endp

pulsec_rt_charToString proc
    sub rsp, 40
    mov byte ptr [rt_tmpbuf], cl
    lea rcx, rt_tmpbuf
    mov edx, 1
    call pulsec_rt_stringFromBytes
    add rsp, 40
    ret
pulsec_rt_charToString endp

pulsec_rt_consoleErrorWrite proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_rt_consoleErrorWrite_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_consoleErrorWrite_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_consoleErrorWrite_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_consoleErrorWrite_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_consoleErrorWrite_stale
pulsec_rt_consoleErrorWrite_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_consoleErrorWrite_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_consoleErrorWrite_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov rax, qword ptr [rt_str_data_ptr]
    mov rcx, qword ptr [rax+r10*8]
    jmp pulsec_rt_consoleErrorWrite_ready
pulsec_rt_consoleErrorWrite_empty:
    lea rcx, rt_empty
pulsec_rt_consoleErrorWrite_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -12
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
pulsec_rt_consoleErrorWrite_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleErrorWrite endp

pulsec_rt_consoleErrorWriteLine proc
    sub rsp, 56
    xor edx, edx
    cmp ecx, 0
    je pulsec_rt_consoleErrorWriteLine_empty
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_consoleErrorWriteLine_empty
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_consoleErrorWriteLine_empty
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_consoleErrorWriteLine_plain
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_consoleErrorWriteLine_stale
pulsec_rt_consoleErrorWriteLine_plain:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_consoleErrorWriteLine_stale
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_consoleErrorWriteLine_stale
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov rax, qword ptr [rt_str_data_ptr]
    mov rcx, qword ptr [rax+r10*8]
    jmp pulsec_rt_consoleErrorWriteLine_ready
pulsec_rt_consoleErrorWriteLine_empty:
    lea rcx, rt_empty
pulsec_rt_consoleErrorWriteLine_ready:
    mov qword ptr [rsp+16], rcx
    mov dword ptr [rsp+24], edx
    mov rcx, -12
    call GetStdHandle
    mov rcx, rax
    mov rdx, qword ptr [rsp+16]
    mov r8d, dword ptr [rsp+24]
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    mov rcx, -12
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
pulsec_rt_consoleErrorWriteLine_stale:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_consoleErrorWriteLine endp

pulsec_rt_consoleReadLine proc
    sub rsp, 120
    mov qword ptr [rsp+40], 0
    mov qword ptr [rsp+48], 0
    mov dword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov dword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
    mov rcx, -10
    call GetStdHandle
    mov qword ptr [rsp+40], rax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_consoleReadLine_cleanup
    mov qword ptr [rsp+80], rax
    mov dword ptr [rsp+72], 256
    mov rcx, qword ptr [rsp+80]
    xor edx, edx
    mov r8d, 256
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_consoleReadLine_cleanup
    mov qword ptr [rsp+64], rax
pulsec_rt_consoleReadLine_loop:
    mov eax, dword ptr [rsp+56]
    cmp eax, dword ptr [rsp+72]
    jb pulsec_rt_consoleReadLine_have_capacity
pulsec_rt_consoleReadLine_grow:
    mov eax, dword ptr [rsp+72]
    add eax, eax
    test eax, eax
    jnz pulsec_rt_consoleReadLine_grow_done
    mov eax, 256
pulsec_rt_consoleReadLine_grow_done:
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+80]
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    mov r9d, dword ptr [rsp+72]
    mov qword ptr [rsp+32], 0
    call HeapReAlloc
    test rax, rax
    jz pulsec_rt_consoleReadLine_cleanup
    mov qword ptr [rsp+64], rax
pulsec_rt_consoleReadLine_have_capacity:
    mov eax, dword ptr [rsp+56]
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+64]
    add rdx, rax
    mov r8d, 1
    lea r9, [rsp+48]
    mov qword ptr [rsp+32], 0
    call ReadFile
    cmp eax, 0
    je pulsec_rt_consoleReadLine_eof
    cmp qword ptr [rsp+48], 0
    je pulsec_rt_consoleReadLine_eof
    mov eax, dword ptr [rsp+56]
    mov r10, qword ptr [rsp+64]
    add r10, rax
    movzx edx, byte ptr [r10]
    cmp dl, 10
    je pulsec_rt_consoleReadLine_finish
    cmp dl, 13
    je pulsec_rt_consoleReadLine_loop
    add eax, 1
    mov dword ptr [rsp+56], eax
    jmp pulsec_rt_consoleReadLine_loop
pulsec_rt_consoleReadLine_eof:
    cmp dword ptr [rsp+56], 0
    je pulsec_rt_consoleReadLine_null
pulsec_rt_consoleReadLine_finish:
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+56]
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    jmp pulsec_rt_consoleReadLine_cleanup
pulsec_rt_consoleReadLine_null:
    xor eax, eax
    mov qword ptr [rsp+88], rax
pulsec_rt_consoleReadLine_cleanup:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz pulsec_rt_consoleReadLine_return
    mov rcx, qword ptr [rsp+80]
    xor edx, edx
    call HeapFree
pulsec_rt_consoleReadLine_return:
    mov rax, qword ptr [rsp+88]
    add rsp, 120
    ret
pulsec_rt_consoleReadLine endp

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
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov rax, qword ptr [rt_str_data_ptr]
    mov rcx, qword ptr [rax+r10*8]
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
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+r10*4]
    mov rax, qword ptr [rt_str_data_ptr]
    mov rcx, qword ptr [rax+r10*8]
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

pulsec_rt_currentThreadId proc
    sub rsp, 40
    call GetCurrentThreadId
    add rsp, 40
    mov eax, eax
    ret
pulsec_rt_currentThreadId endp

pulsec_rt_currentTimeMillis proc
    sub rsp, 40
    lea rcx, qword ptr [rsp+32]
    call GetSystemTimeAsFileTime
    mov rax, qword ptr [rsp+32]
    mov rcx, 116444736000000000
    sub rax, rcx
    xor rdx, rdx
    mov rcx, 10000
    div rcx
    add rsp, 40
    ret
pulsec_rt_currentTimeMillis endp

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

pulsec_rt_hostAllocBytes proc
    cmp ecx, 0
    jle pulsec_rt_hostAllocBytes_done
    sub rsp, 56
    mov dword ptr [rsp+32], ecx
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_hostAllocBytes_fail
    mov rcx, rax
    mov edx, 8
    mov r8d, dword ptr [rsp+32]
    call HeapAlloc
    add rsp, 56
    ret
pulsec_rt_hostAllocBytes_fail:
    add rsp, 56
    xor eax, eax
    ret
pulsec_rt_hostAllocBytes_done:
    xor eax, eax
    ret
pulsec_rt_hostAllocBytes endp

pulsec_rt_hostAllocUtf8Z proc
    sub rsp, 56
    test rcx, rcx
    jz pulsec_rt_hostAllocUtf8Z_null_input
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_hostAllocUtf8Z_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_hostAllocUtf8Z_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_hostAllocUtf8Z_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_hostAllocUtf8Z_live_panic
pulsec_rt_hostAllocUtf8Z_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_hostAllocUtf8Z_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_hostAllocUtf8Z_live_panic
    jmp pulsec_rt_hostAllocUtf8Z_ok
pulsec_rt_hostAllocUtf8Z_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostAllocUtf8Z_ok:
    mov ecx, r10d
    mov dword ptr [rsp+44], ecx
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+rcx*4]
    mov dword ptr [rsp+48], edx
    mov ecx, edx
    add ecx, 1
    call pulsec_rt_hostAllocBytes
    test rax, rax
    jz pulsec_rt_hostAllocUtf8Z_alloc_fail
    mov r10, rax
    mov ecx, dword ptr [rsp+44]
    mov rax, qword ptr [rt_str_data_ptr]
    mov r9, qword ptr [rax+rcx*8]
    mov r8d, dword ptr [rsp+48]
    xor ecx, ecx
pulsec_rt_hostAllocUtf8Z_copy_loop:
    cmp ecx, r8d
    jae pulsec_rt_hostAllocUtf8Z_copy_done
    mov al, byte ptr [r9+rcx]
    mov byte ptr [r10+rcx], al
    add ecx, 1
    jmp pulsec_rt_hostAllocUtf8Z_copy_loop
pulsec_rt_hostAllocUtf8Z_copy_done:
    mov byte ptr [r10+rcx], 0
    mov rax, r10
    add rsp, 56
    ret
pulsec_rt_hostAllocUtf8Z_alloc_fail:
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_hostAllocUtf8Z_null_input:
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_hostAllocUtf8Z endp

pulsec_rt_hostAtomicCompareAndSetReference proc
    test rcx, rcx
    jz pulsec_rt_hostAtomicCompareAndSetReference_done_false
    sub rsp, 72
    mov qword ptr [rsp+32], rcx
    mov qword ptr [rsp+40], rdx
    mov qword ptr [rsp+48], r8
    test r8, r8
    jz pulsec_rt_hostAtomicCompareAndSetReference_skip_retain
    mov rcx, r8
    call pulsec_rt_arcRetain
pulsec_rt_hostAtomicCompareAndSetReference_skip_retain:
    mov rcx, qword ptr [rsp+32]
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov rax, rdx
    lock cmpxchg qword ptr [rcx], r8
    jne pulsec_rt_hostAtomicCompareAndSetReference_skip_expected_release
    mov rdx, qword ptr [rsp+40]
    test rdx, rdx
    jz pulsec_rt_hostAtomicCompareAndSetReference_done_true
    mov rcx, rdx
    call pulsec_rt_arcRelease
    jmp pulsec_rt_hostAtomicCompareAndSetReference_done_true
pulsec_rt_hostAtomicCompareAndSetReference_skip_expected_release:
    mov rdx, qword ptr [rsp+48]
    test rdx, rdx
    jz pulsec_rt_hostAtomicCompareAndSetReference_skip_replacement_release
    mov rcx, rdx
    call pulsec_rt_arcRelease
pulsec_rt_hostAtomicCompareAndSetReference_skip_replacement_release:
    add rsp, 72
pulsec_rt_hostAtomicCompareAndSetReference_done_false:
    xor eax, eax
    ret
pulsec_rt_hostAtomicCompareAndSetReference_done_true:
    add rsp, 72
    mov eax, 1
    ret
pulsec_rt_hostAtomicCompareAndSetReference endp

pulsec_rt_hostAtomicCompareExchangeInt proc
    test rcx, rcx
    jz @F
    mov eax, edx
    lock cmpxchg dword ptr [rcx], r8d
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_hostAtomicCompareExchangeInt endp

pulsec_rt_hostAtomicCompareExchangeLong proc
    test rcx, rcx
    jz @F
    mov rax, rdx
    lock cmpxchg qword ptr [rcx], r8
    ret
@@:
    xor rax, rax
    ret
pulsec_rt_hostAtomicCompareExchangeLong endp

pulsec_rt_hostAtomicExchangeInt proc
    test rcx, rcx
    jz @F
    xchg dword ptr [rcx], edx
    mov eax, edx
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_hostAtomicExchangeInt endp

pulsec_rt_hostAtomicExchangeLong proc
    test rcx, rcx
    jz @F
    xchg qword ptr [rcx], rdx
    mov rax, rdx
    ret
@@:
    xor rax, rax
    ret
pulsec_rt_hostAtomicExchangeLong endp

pulsec_rt_hostAtomicExchangeReference proc
    test rcx, rcx
    jz pulsec_rt_hostAtomicExchangeReference_done_zero
    sub rsp, 56
    mov qword ptr [rsp+32], rcx
    mov qword ptr [rsp+40], rdx
    test rdx, rdx
    jz pulsec_rt_hostAtomicExchangeReference_skip_retain
    mov rcx, rdx
    call pulsec_rt_arcRetain
pulsec_rt_hostAtomicExchangeReference_skip_retain:
    mov rcx, qword ptr [rsp+32]
    mov rdx, qword ptr [rsp+40]
    xchg qword ptr [rcx], rdx
    mov rax, rdx
    add rsp, 56
    ret
pulsec_rt_hostAtomicExchangeReference_done_zero:
    xor rax, rax
    ret
pulsec_rt_hostAtomicExchangeReference endp

pulsec_rt_hostAtomicFetchAddInt proc
    test rcx, rcx
    jz @F
    lock xadd dword ptr [rcx], edx
    mov eax, edx
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_hostAtomicFetchAddInt endp

pulsec_rt_hostAtomicFetchAddLong proc
    test rcx, rcx
    jz @F
    lock xadd qword ptr [rcx], rdx
    mov rax, rdx
    ret
@@:
    xor rax, rax
    ret
pulsec_rt_hostAtomicFetchAddLong endp

pulsec_rt_hostAtomicLoadInt proc
    test rcx, rcx
    jz @F
    mov eax, dword ptr [rcx]
    ret
@@:
    xor eax, eax
    ret
pulsec_rt_hostAtomicLoadInt endp

pulsec_rt_hostAtomicLoadLong proc
    test rcx, rcx
    jz @F
    mov rax, qword ptr [rcx]
    ret
@@:
    xor rax, rax
    ret
pulsec_rt_hostAtomicLoadLong endp

pulsec_rt_hostAtomicLoadReference proc
    test rcx, rcx
    jz pulsec_rt_hostAtomicLoadReference_done_zero
    sub rsp, 56
    mov qword ptr [rsp+32], rcx
    mov qword ptr [rsp+40], 0
pulsec_rt_hostAtomicLoadReference_retry:
    mov rcx, qword ptr [rsp+32]
    mov rax, qword ptr [rcx]
    test rax, rax
    jz pulsec_rt_hostAtomicLoadReference_done
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rcx, qword ptr [rsp+32]
    mov rdx, qword ptr [rsp+40]
    cmp qword ptr [rcx], rdx
    je pulsec_rt_hostAtomicLoadReference_done
    mov rcx, rdx
    call pulsec_rt_arcRelease
    jmp pulsec_rt_hostAtomicLoadReference_retry
pulsec_rt_hostAtomicLoadReference_done:
    mov rax, qword ptr [rsp+40]
    add rsp, 56
    ret
pulsec_rt_hostAtomicLoadReference_done_zero:
    xor rax, rax
    ret
pulsec_rt_hostAtomicLoadReference endp

pulsec_rt_hostAtomicStoreInt proc
    test rcx, rcx
    jz @F
    xchg dword ptr [rcx], edx
@@:
    ret
pulsec_rt_hostAtomicStoreInt endp

pulsec_rt_hostAtomicStoreLong proc
    test rcx, rcx
    jz @F
    xchg qword ptr [rcx], rdx
@@:
    ret
pulsec_rt_hostAtomicStoreLong endp

pulsec_rt_hostAtomicStoreReference proc
    test rcx, rcx
    jz pulsec_rt_hostAtomicStoreReference_done
    sub rsp, 56
    mov qword ptr [rsp+32], rcx
    mov qword ptr [rsp+40], rdx
    test rdx, rdx
    jz pulsec_rt_hostAtomicStoreReference_skip_retain
    mov rcx, rdx
    call pulsec_rt_arcRetain
pulsec_rt_hostAtomicStoreReference_skip_retain:
    mov rcx, qword ptr [rsp+32]
    mov rdx, qword ptr [rsp+40]
    xchg qword ptr [rcx], rdx
    test rdx, rdx
    jz pulsec_rt_hostAtomicStoreReference_skip_release
    mov rcx, rdx
    call pulsec_rt_arcRelease
pulsec_rt_hostAtomicStoreReference_skip_release:
    add rsp, 56
pulsec_rt_hostAtomicStoreReference_done:
    ret
pulsec_rt_hostAtomicStoreReference endp

pulsec_rt_hostCallNative0 proc
    test rcx, rcx
    jz pulsec_rt_hostCallNative0_done
    sub rsp, 40
    call rcx
    add rsp, 40
    ret
pulsec_rt_hostCallNative0_done:
    xor eax, eax
    ret
pulsec_rt_hostCallNative0 endp

pulsec_rt_hostCallNative1 proc
    test rcx, rcx
    jz pulsec_rt_hostCallNative1_done
    mov r10, rcx
    mov rcx, rdx
    sub rsp, 40
    call r10
    add rsp, 40
    ret
pulsec_rt_hostCallNative1_done:
    xor eax, eax
    ret
pulsec_rt_hostCallNative1 endp

pulsec_rt_hostCallNative2 proc
    test rcx, rcx
    jz pulsec_rt_hostCallNative2_done
    mov r10, rcx
    mov rcx, rdx
    mov rdx, r8
    sub rsp, 40
    call r10
    add rsp, 40
    ret
pulsec_rt_hostCallNative2_done:
    xor eax, eax
    ret
pulsec_rt_hostCallNative2 endp

pulsec_rt_hostCallNative3 proc
    test rcx, rcx
    jz pulsec_rt_hostCallNative3_done
    mov r10, rcx
    mov rcx, rdx
    mov rdx, r8
    mov r8, r9
    sub rsp, 40
    call r10
    add rsp, 40
    ret
pulsec_rt_hostCallNative3_done:
    xor eax, eax
    ret
pulsec_rt_hostCallNative3 endp

pulsec_rt_hostCallNative4 proc
    test rcx, rcx
    jz pulsec_rt_hostCallNative4_done
    mov r10, rcx
    mov r11, qword ptr [rsp+40]
    mov rcx, rdx
    mov rdx, r8
    mov r8, r9
    mov r9, r11
    sub rsp, 40
    call r10
    add rsp, 40
    ret
pulsec_rt_hostCallNative4_done:
    xor eax, eax
    ret
pulsec_rt_hostCallNative4 endp

pulsec_rt_hostCloseHandle proc
    sub rsp, 40
    call CloseHandle
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_hostCloseHandle endp

pulsec_rt_hostCopyBytes proc
    cmp r8d, 0
    jl pulsec_rt_hostCopyBytes_done
    cmp r8d, 0
    je pulsec_rt_hostCopyBytes_success
    test rcx, rcx
    jz pulsec_rt_hostCopyBytes_done
    test rdx, rdx
    jz pulsec_rt_hostCopyBytes_done
    mov r10, rcx
    mov r11, rdx
    cmp r11, r10
    jbe pulsec_rt_hostCopyBytes_forward
    mov eax, r8d
    movsxd rax, eax
    lea r9, [r10+rax]
    cmp r11, r9
    jae pulsec_rt_hostCopyBytes_forward
pulsec_rt_hostCopyBytes_backward:
    mov eax, r8d
pulsec_rt_hostCopyBytes_backward_loop:
    sub eax, 1
    jl pulsec_rt_hostCopyBytes_success
    movsxd r9, eax
    mov dl, byte ptr [r10+r9]
    mov byte ptr [r11+r9], dl
    jmp pulsec_rt_hostCopyBytes_backward_loop
pulsec_rt_hostCopyBytes_forward:
    xor eax, eax
pulsec_rt_hostCopyBytes_forward_loop:
    cmp eax, r8d
    jae pulsec_rt_hostCopyBytes_success
    movsxd r9, eax
    mov dl, byte ptr [r10+r9]
    mov byte ptr [r11+r9], dl
    add eax, 1
    jmp pulsec_rt_hostCopyBytes_forward_loop
pulsec_rt_hostCopyBytes_success:
    mov eax, 1
    ret
pulsec_rt_hostCopyBytes_done:
    xor eax, eax
    ret
pulsec_rt_hostCopyBytes endp

pulsec_rt_hostCopyFile proc
    sub rsp, 104
    mov dword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], rdx
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostCopyFile_fail
    mov qword ptr [rsp+64], rax
    mov ecx, dword ptr [rsp+80]
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostCopyFile_cleanup
    mov qword ptr [rsp+72], rax
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    xor r8d, r8d
    call CopyFileA
    test eax, eax
    jz pulsec_rt_hostCopyFile_cleanup
    mov dword ptr [rsp+56], 1
    jmp pulsec_rt_hostCopyFile_cleanup
pulsec_rt_hostCopyFile_fail:
    mov dword ptr [rsp+56], 0
pulsec_rt_hostCopyFile_cleanup:
    mov r8, qword ptr [rsp+72]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+72]
    call HeapFree
@@:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov eax, dword ptr [rsp+56]
pulsec_rt_hostCopyFile_done:
    add rsp, 104
    ret
pulsec_rt_hostCopyFile endp

pulsec_rt_hostCreateDirectory proc
    sub rsp, 56
    mov qword ptr [rsp+32], 0
    mov dword ptr [rsp+40], -1
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostCreateDirectory_fail
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    xor edx, edx
    call CreateDirectoryA
    test eax, eax
    jnz @F
    mov rcx, qword ptr [rsp+32]
    call GetFileAttributesA
    mov dword ptr [rsp+40], eax
    cmp dword ptr [rsp+40], -1
    je pulsec_rt_hostCreateDirectory_fail
    test dword ptr [rsp+40], 10h
    jz pulsec_rt_hostCreateDirectory_fail
@@:
    mov eax, 1
    jmp pulsec_rt_hostCreateDirectory_cleanup
pulsec_rt_hostCreateDirectory_fail:
    xor eax, eax
pulsec_rt_hostCreateDirectory_cleanup:
    mov dword ptr [rsp+40], eax
    mov r8, qword ptr [rsp+32]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+32]
    call HeapFree
@@:
    mov eax, dword ptr [rsp+40]
pulsec_rt_hostCreateDirectory_done:
    add rsp, 56
    ret
pulsec_rt_hostCreateDirectory endp

pulsec_rt_hostCreateEvent proc
    sub rsp, 40
    and ecx, 1
    and edx, 1
    mov r8d, edx
    mov edx, ecx
    xor ecx, ecx
    xor r9d, r9d
    call CreateEventA
    add rsp, 40
    ret
pulsec_rt_hostCreateEvent endp

pulsec_rt_hostCreateMutex proc
    sub rsp, 40
    xor ecx, ecx
    xor edx, edx
    xor r8d, r8d
    call CreateMutexA
    add rsp, 40
    ret
pulsec_rt_hostCreateMutex endp

pulsec_rt_hostCreateSemaphore proc
    sub rsp, 40
    xor r8d, r8d
    mov r8d, edx
    mov edx, ecx
    xor ecx, ecx
    xor r9d, r9d
    call CreateSemaphoreA
    add rsp, 40
    ret
pulsec_rt_hostCreateSemaphore endp

pulsec_rt_hostExists proc
    sub rsp, 56
    mov dword ptr [rsp+40], -1
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostExists_done
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call GetFileAttributesA
    mov dword ptr [rsp+40], eax
    call GetProcessHeap
    mov rcx, rax
    mov r8, qword ptr [rsp+32]
    xor edx, edx
    call HeapFree
    cmp dword ptr [rsp+40], -1
    jne @F
    xor eax, eax
    jmp pulsec_rt_hostExists_done
@@:
    mov eax, 1
pulsec_rt_hostExists_done:
    add rsp, 56
    ret
pulsec_rt_hostExists endp

pulsec_rt_hostFreeBytes proc
    test rcx, rcx
    jz pulsec_rt_hostFreeBytes_done
    mov r8, rcx
    sub rsp, 40
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    call HeapFree
    add rsp, 40
    ret
pulsec_rt_hostFreeBytes_done:
    xor eax, eax
    ret
pulsec_rt_hostFreeBytes endp

pulsec_rt_hostFreeDynamicLibrary proc
    test rcx, rcx
    jz pulsec_rt_hostFreeDynamicLibrary_done
    sub rsp, 40
    call FreeLibrary
    add rsp, 40
    ret
pulsec_rt_hostFreeDynamicLibrary_done:
    xor eax, eax
    ret
pulsec_rt_hostFreeDynamicLibrary endp

pulsec_rt_hostGetNativeCallbackAddress0 proc
    cmp ecx, 1
    jb pulsec_rt_hostGetNativeCallbackAddress0_invalid
    cmp ecx, 16
    ja pulsec_rt_hostGetNativeCallbackAddress0_invalid
    cmp dword ptr [rt_native_callback0_slots+rcx*4-4], 0
    je pulsec_rt_hostGetNativeCallbackAddress0_invalid
    mov rax, qword ptr [rt_native_callback0_entrypoints+rcx*8-8]
    ret
pulsec_rt_hostGetNativeCallbackAddress0_invalid:
    xor eax, eax
    ret
pulsec_rt_hostGetNativeCallbackAddress0 endp

pulsec_rt_hostGetNativeCallbackAddress1 proc
    cmp ecx, 1
    jb pulsec_rt_hostGetNativeCallbackAddress1_invalid
    cmp ecx, 16
    ja pulsec_rt_hostGetNativeCallbackAddress1_invalid
    cmp dword ptr [rt_native_callback1_slots+rcx*4-4], 0
    je pulsec_rt_hostGetNativeCallbackAddress1_invalid
    mov rax, qword ptr [rt_native_callback1_entrypoints+rcx*8-8]
    ret
pulsec_rt_hostGetNativeCallbackAddress1_invalid:
    xor eax, eax
    ret
pulsec_rt_hostGetNativeCallbackAddress1 endp

pulsec_rt_hostGetNativeCallbackAddress2 proc
    cmp ecx, 1
    jb pulsec_rt_hostGetNativeCallbackAddress2_invalid
    cmp ecx, 16
    ja pulsec_rt_hostGetNativeCallbackAddress2_invalid
    cmp dword ptr [rt_native_callback2_slots+rcx*4-4], 0
    je pulsec_rt_hostGetNativeCallbackAddress2_invalid
    mov rax, qword ptr [rt_native_callback2_entrypoints+rcx*8-8]
    ret
pulsec_rt_hostGetNativeCallbackAddress2_invalid:
    xor eax, eax
    ret
pulsec_rt_hostGetNativeCallbackAddress2 endp

pulsec_rt_hostGetNativeCallbackAddress3 proc
    cmp ecx, 1
    jb pulsec_rt_hostGetNativeCallbackAddress3_invalid
    cmp ecx, 16
    ja pulsec_rt_hostGetNativeCallbackAddress3_invalid
    cmp dword ptr [rt_native_callback3_slots+rcx*4-4], 0
    je pulsec_rt_hostGetNativeCallbackAddress3_invalid
    mov rax, qword ptr [rt_native_callback3_entrypoints+rcx*8-8]
    ret
pulsec_rt_hostGetNativeCallbackAddress3_invalid:
    xor eax, eax
    ret
pulsec_rt_hostGetNativeCallbackAddress3 endp

pulsec_rt_hostGetNativeCallbackAddress4 proc
    cmp ecx, 1
    jb pulsec_rt_hostGetNativeCallbackAddress4_invalid
    cmp ecx, 16
    ja pulsec_rt_hostGetNativeCallbackAddress4_invalid
    cmp dword ptr [rt_native_callback4_slots+rcx*4-4], 0
    je pulsec_rt_hostGetNativeCallbackAddress4_invalid
    mov rax, qword ptr [rt_native_callback4_entrypoints+rcx*8-8]
    ret
pulsec_rt_hostGetNativeCallbackAddress4_invalid:
    xor eax, eax
    ret
pulsec_rt_hostGetNativeCallbackAddress4 endp

pulsec_rt_hostIsDirectory proc
    sub rsp, 56
    mov dword ptr [rsp+40], -1
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostIsDirectory_done
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call GetFileAttributesA
    mov dword ptr [rsp+40], eax
    call GetProcessHeap
    mov rcx, rax
    mov r8, qword ptr [rsp+32]
    xor edx, edx
    call HeapFree
    cmp dword ptr [rsp+40], -1
    jne @F
    xor eax, eax
    jmp pulsec_rt_hostIsDirectory_done
@@:
    test dword ptr [rsp+40], 10h
    jz @F
    mov eax, 1
    jmp pulsec_rt_hostIsDirectory_done
@@:
    xor eax, eax
pulsec_rt_hostIsDirectory_done:
    add rsp, 56
    ret
pulsec_rt_hostIsDirectory endp

pulsec_rt_hostIsFile proc
    sub rsp, 56
    mov dword ptr [rsp+40], -1
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostIsFile_done
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call GetFileAttributesA
    mov dword ptr [rsp+40], eax
    call GetProcessHeap
    mov rcx, rax
    mov r8, qword ptr [rsp+32]
    xor edx, edx
    call HeapFree
    cmp dword ptr [rsp+40], -1
    jne @F
    xor eax, eax
    jmp pulsec_rt_hostIsFile_done
@@:
    test dword ptr [rsp+40], 10h
    jz @F
    xor eax, eax
    jmp pulsec_rt_hostIsFile_done
@@:
    mov eax, 1
pulsec_rt_hostIsFile_done:
    add rsp, 56
    ret
pulsec_rt_hostIsFile endp

pulsec_rt_hostListChildren proc
    sub rsp, 440
    mov qword ptr [rsp+32], 0
    mov dword ptr [rsp+40], 0
    mov qword ptr [rsp+48], 0
    mov qword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov dword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostListChildren_empty
    mov qword ptr [rsp+32], rax
    mov dword ptr [rsp+40], edx
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_hostListChildren_cleanup
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    xor edx, edx
    mov r8d, dword ptr [rsp+40]
    add r8d, 3
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_hostListChildren_cleanup
    mov qword ptr [rsp+48], rax
    mov r10, rax
    mov r11, qword ptr [rsp+32]
    mov r8d, dword ptr [rsp+40]
    xor ecx, ecx
@@:
    cmp ecx, r8d
    jae @F
    mov al, byte ptr [r11+rcx]
    mov byte ptr [r10+rcx], al
    add ecx, 1
    jmp @B
@@:
    test ecx, ecx
    jz @F
    mov al, byte ptr [r10+rcx-1]
    cmp al, '\'
    je @F
    mov byte ptr [r10+rcx], '\'
    add ecx, 1
@@:
    mov byte ptr [r10+rcx], '*'
    add ecx, 1
    mov byte ptr [r10+rcx], 0
    mov rcx, qword ptr [rsp+80]
    xor edx, edx
    mov r8d, 4096
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_hostListChildren_cleanup
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+48]
    lea rdx, [rsp+96]
    call FindFirstFileA
    cmp rax, -1
    je pulsec_rt_hostListChildren_empty
    mov qword ptr [rsp+56], rax
pulsec_rt_hostListChildren_loop:
    lea r10, [rsp+96]
    lea r11, [r10+44]
    mov al, byte ptr [r11]
    cmp al, '.'
    jne pulsec_rt_hostListChildren_append
    mov al, byte ptr [r11+1]
    test al, al
    jz pulsec_rt_hostListChildren_next
    cmp al, '.'
    jne pulsec_rt_hostListChildren_append
    cmp byte ptr [r11+2], 0
    je pulsec_rt_hostListChildren_next
pulsec_rt_hostListChildren_append:
    xor ecx, ecx
pulsec_rt_hostListChildren_name_len_loop:
    cmp byte ptr [r11+rcx], 0
    je @F
    add ecx, 1
    jmp pulsec_rt_hostListChildren_name_len_loop
@@:
    mov edx, dword ptr [rsp+72]
    add edx, ecx
    add edx, 1
    cmp edx, 4095
    ja pulsec_rt_hostListChildren_overflow
    mov r10, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    add r10, rdx
    xor edx, edx
pulsec_rt_hostListChildren_copy_loop:
    cmp byte ptr [r11+rdx], 0
    je @F
    mov al, byte ptr [r11+rdx]
    mov byte ptr [r10+rdx], al
    add edx, 1
    jmp pulsec_rt_hostListChildren_copy_loop
@@:
    mov byte ptr [r10+rdx], 10
    mov eax, dword ptr [rsp+72]
    add eax, edx
    add eax, 1
    mov dword ptr [rsp+72], eax
pulsec_rt_hostListChildren_next:
    mov rcx, qword ptr [rsp+56]
    lea rdx, [rsp+96]
    call FindNextFileA
    test eax, eax
    jnz pulsec_rt_hostListChildren_loop
pulsec_rt_hostListChildren_close_find:
    mov rcx, qword ptr [rsp+56]
    test rcx, rcx
    jz @F
    call FindClose
    mov qword ptr [rsp+56], 0
@@:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    jz pulsec_rt_hostListChildren_empty
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_hostListChildren_cleanup
pulsec_rt_hostListChildren_overflow:
    lea rcx, rt_string_alloc_err
    mov edx, rt_string_alloc_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostListChildren_empty:
    lea rcx, rt_empty
    xor edx, edx
    call pulsec_rt_stringFromBytes
pulsec_rt_hostListChildren_cleanup:
    mov qword ptr [rsp+24], rax
    mov rcx, qword ptr [rsp+56]
    test rcx, rcx
    jz @F
    call FindClose
@@:
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    jz pulsec_rt_hostListChildren_done
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    xor edx, edx
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+80]
    mov r8, qword ptr [rsp+48]
    test r8, r8
    jz @F
    xor edx, edx
    call HeapFree
@@:
    mov rcx, qword ptr [rsp+80]
    mov r8, qword ptr [rsp+32]
    test r8, r8
    jz @F
    xor edx, edx
    call HeapFree
@@:
pulsec_rt_hostListChildren_done:
    mov rax, qword ptr [rsp+24]
    add rsp, 440
    ret
pulsec_rt_hostListChildren_fail:
    xor eax, eax
    add rsp, 440
    ret
pulsec_rt_hostListChildren endp

pulsec_rt_hostLoadDynamicLibrary proc
    sub rsp, 88
    mov qword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostLoadDynamicLibrary_cleanup
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call LoadLibraryA
    mov qword ptr [rsp+56], rax
pulsec_rt_hostLoadDynamicLibrary_cleanup:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov rax, qword ptr [rsp+56]
    add rsp, 88
    ret
pulsec_rt_hostLoadDynamicLibrary endp

pulsec_rt_hostLookupLoadedDynamicLibrary proc
    sub rsp, 88
    mov qword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostLookupLoadedDynamicLibrary_cleanup
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call GetModuleHandleA
    mov qword ptr [rsp+56], rax
pulsec_rt_hostLookupLoadedDynamicLibrary_cleanup:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov rax, qword ptr [rsp+56]
    add rsp, 88
    ret
pulsec_rt_hostLookupLoadedDynamicLibrary endp

pulsec_rt_hostLookupSelfDynamicLibrary proc
    sub rsp, 40
    xor ecx, ecx
    call GetModuleHandleA
    add rsp, 40
    ret
pulsec_rt_hostLookupSelfDynamicLibrary endp

pulsec_rt_hostReadAllText proc
    sub rsp, 120
    mov qword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
    mov dword ptr [rsp+96], 0
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostReadAllText_fail
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+64]
    mov edx, 80000000h
    mov r8d, 1
    xor r9d, r9d
    mov qword ptr [rsp+32], 3
    mov qword ptr [rsp+40], 80h
    mov qword ptr [rsp+48], 0
    call CreateFileA
    cmp rax, -1
    je pulsec_rt_hostReadAllText_cleanup
    mov qword ptr [rsp+72], rax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_hostReadAllText_cleanup
    mov rcx, rax
    xor edx, edx
    mov r8d, 4096
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_hostReadAllText_cleanup
    mov qword ptr [rsp+80], rax
    mov rcx, qword ptr [rsp+72]
    mov rdx, rax
    mov r8d, 4095
    lea r9, [rsp+88]
    mov qword ptr [rsp+32], 0
    call ReadFile
    test eax, eax
    jz pulsec_rt_hostReadAllText_cleanup
    mov eax, dword ptr [rsp+88]
    test eax, eax
    jz pulsec_rt_hostReadAllText_empty
    cmp eax, 4095
    jne pulsec_rt_hostReadAllText_emit
    mov rcx, qword ptr [rsp+72]
    lea rdx, [rsp+104]
    mov r8d, 1
    lea r9, [rsp+96]
    mov qword ptr [rsp+32], 0
    call ReadFile
    test eax, eax
    jz pulsec_rt_hostReadAllText_cleanup
    cmp dword ptr [rsp+96], 0
    jne pulsec_rt_hostReadAllText_overflow
pulsec_rt_hostReadAllText_emit:
    mov rcx, qword ptr [rsp+80]
    mov edx, dword ptr [rsp+88]
    call pulsec_rt_stringFromBytes
    jmp pulsec_rt_hostReadAllText_cleanup
pulsec_rt_hostReadAllText_overflow:
    lea rcx, rt_string_alloc_err
    mov edx, rt_string_alloc_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostReadAllText_empty:
    lea rcx, rt_empty
    xor edx, edx
    call pulsec_rt_stringFromBytes
pulsec_rt_hostReadAllText_cleanup:
    mov qword ptr [rsp+56], rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    jz @F
    call CloseHandle
@@:
    mov r8, qword ptr [rsp+80]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+80]
    call HeapFree
@@:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov rax, qword ptr [rsp+56]
    jmp pulsec_rt_hostReadAllText_done
pulsec_rt_hostReadAllText_fail:
    xor eax, eax
pulsec_rt_hostReadAllText_done:
    add rsp, 120
    ret
pulsec_rt_hostReadAllText endp

pulsec_rt_hostReadByte proc
    test rcx, rcx
    jz pulsec_rt_hostReadByte_done
    cmp edx, 0
    jl pulsec_rt_hostReadByte_done
    movsxd rax, edx
    movzx eax, byte ptr [rcx+rax]
    ret
pulsec_rt_hostReadByte_done:
    xor eax, eax
    ret
pulsec_rt_hostReadByte endp

pulsec_rt_hostReadLong proc
    test rcx, rcx
    jz pulsec_rt_hostReadLong_done
    cmp edx, 0
    jl pulsec_rt_hostReadLong_done
    movsxd rax, edx
    mov rax, qword ptr [rcx+rax]
    ret
pulsec_rt_hostReadLong_done:
    xor eax, eax
    ret
pulsec_rt_hostReadLong endp

pulsec_rt_hostRegisterNativeCallback0 proc
    test ecx, ecx
    jz pulsec_rt_hostRegisterNativeCallback0_zero
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov edx, 1
pulsec_rt_hostRegisterNativeCallback0_loop:
    cmp edx, 16
    ja pulsec_rt_hostRegisterNativeCallback0_exhausted
    cmp dword ptr [rt_native_callback0_slots+rdx*4-4], 0
    jne pulsec_rt_hostRegisterNativeCallback0_next
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcRetain
    mov dword ptr [rt_native_callback0_slots+rdx*4-4], eax
    mov eax, edx
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback0_next:
    add edx, 1
    jmp pulsec_rt_hostRegisterNativeCallback0_loop
pulsec_rt_hostRegisterNativeCallback0_exhausted:
    lea rcx, rt_native_callback_exhausted_err
    mov edx, rt_native_callback_exhausted_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback0_zero:
    xor eax, eax
    ret
pulsec_rt_hostRegisterNativeCallback0 endp

pulsec_rt_hostRegisterNativeCallback1 proc
    test ecx, ecx
    jz pulsec_rt_hostRegisterNativeCallback1_zero
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov edx, 1
pulsec_rt_hostRegisterNativeCallback1_loop:
    cmp edx, 16
    ja pulsec_rt_hostRegisterNativeCallback1_exhausted
    cmp dword ptr [rt_native_callback1_slots+rdx*4-4], 0
    jne pulsec_rt_hostRegisterNativeCallback1_next
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcRetain
    mov dword ptr [rt_native_callback1_slots+rdx*4-4], eax
    mov eax, edx
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback1_next:
    add edx, 1
    jmp pulsec_rt_hostRegisterNativeCallback1_loop
pulsec_rt_hostRegisterNativeCallback1_exhausted:
    lea rcx, rt_native_callback_exhausted_err
    mov edx, rt_native_callback_exhausted_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback1_zero:
    xor eax, eax
    ret
pulsec_rt_hostRegisterNativeCallback1 endp

pulsec_rt_hostRegisterNativeCallback2 proc
    test ecx, ecx
    jz pulsec_rt_hostRegisterNativeCallback2_zero
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov edx, 1
pulsec_rt_hostRegisterNativeCallback2_loop:
    cmp edx, 16
    ja pulsec_rt_hostRegisterNativeCallback2_exhausted
    cmp dword ptr [rt_native_callback2_slots+rdx*4-4], 0
    jne pulsec_rt_hostRegisterNativeCallback2_next
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcRetain
    mov dword ptr [rt_native_callback2_slots+rdx*4-4], eax
    mov eax, edx
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback2_next:
    add edx, 1
    jmp pulsec_rt_hostRegisterNativeCallback2_loop
pulsec_rt_hostRegisterNativeCallback2_exhausted:
    lea rcx, rt_native_callback_exhausted_err
    mov edx, rt_native_callback_exhausted_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback2_zero:
    xor eax, eax
    ret
pulsec_rt_hostRegisterNativeCallback2 endp

pulsec_rt_hostRegisterNativeCallback3 proc
    test ecx, ecx
    jz pulsec_rt_hostRegisterNativeCallback3_zero
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov edx, 1
pulsec_rt_hostRegisterNativeCallback3_loop:
    cmp edx, 16
    ja pulsec_rt_hostRegisterNativeCallback3_exhausted
    cmp dword ptr [rt_native_callback3_slots+rdx*4-4], 0
    jne pulsec_rt_hostRegisterNativeCallback3_next
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcRetain
    mov dword ptr [rt_native_callback3_slots+rdx*4-4], eax
    mov eax, edx
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback3_next:
    add edx, 1
    jmp pulsec_rt_hostRegisterNativeCallback3_loop
pulsec_rt_hostRegisterNativeCallback3_exhausted:
    lea rcx, rt_native_callback_exhausted_err
    mov edx, rt_native_callback_exhausted_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback3_zero:
    xor eax, eax
    ret
pulsec_rt_hostRegisterNativeCallback3 endp

pulsec_rt_hostRegisterNativeCallback4 proc
    test ecx, ecx
    jz pulsec_rt_hostRegisterNativeCallback4_zero
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov edx, 1
pulsec_rt_hostRegisterNativeCallback4_loop:
    cmp edx, 16
    ja pulsec_rt_hostRegisterNativeCallback4_exhausted
    cmp dword ptr [rt_native_callback4_slots+rdx*4-4], 0
    jne pulsec_rt_hostRegisterNativeCallback4_next
    mov ecx, dword ptr [rsp+32]
    call pulsec_rt_arcRetain
    mov dword ptr [rt_native_callback4_slots+rdx*4-4], eax
    mov eax, edx
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback4_next:
    add edx, 1
    jmp pulsec_rt_hostRegisterNativeCallback4_loop
pulsec_rt_hostRegisterNativeCallback4_exhausted:
    lea rcx, rt_native_callback_exhausted_err
    mov edx, rt_native_callback_exhausted_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    add rsp, 40
    ret
pulsec_rt_hostRegisterNativeCallback4_zero:
    xor eax, eax
    ret
pulsec_rt_hostRegisterNativeCallback4 endp

pulsec_rt_hostReleaseMutex proc
    sub rsp, 40
    call ReleaseMutex
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_hostReleaseMutex endp

pulsec_rt_hostReleaseSemaphore proc
    sub rsp, 40
    mov r8, 0
    call ReleaseSemaphore
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_hostReleaseSemaphore endp

pulsec_rt_hostResetEvent proc
    sub rsp, 40
    call ResetEvent
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_hostResetEvent endp

pulsec_rt_hostResolveDynamicSymbol proc
    sub rsp, 96
    mov qword ptr [rsp+56], rcx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    test rcx, rcx
    jz pulsec_rt_hostResolveDynamicSymbol_cleanup
    mov ecx, edx
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostResolveDynamicSymbol_cleanup
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+56]
    mov rdx, rax
    call GetProcAddress
    mov qword ptr [rsp+72], rax
pulsec_rt_hostResolveDynamicSymbol_cleanup:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov rax, qword ptr [rsp+72]
    add rsp, 96
    ret
pulsec_rt_hostResolveDynamicSymbol endp

pulsec_rt_hostRunShellProcess proc
    sub rsp, 280
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+104], 0
    mov qword ptr [rsp+112], 0
    mov qword ptr [rsp+120], 0
    mov dword ptr [rsp+128], edx
    mov dword ptr [rsp+132], -1
    mov dword ptr [rsp+136], 0
    call pulsec_rt_hostPathAlloc
    mov qword ptr [rsp+96], rax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_hostRunShellProcess_cleanup
    mov qword ptr [rsp+88], rax
    mov ecx, dword ptr [rsp+128]
    test ecx, ecx
    jz pulsec_rt_hostRunShellProcess_cleanup
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_hostRunShellProcess_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_hostRunShellProcess_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_hostRunShellProcess_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_hostRunShellProcess_live_panic
pulsec_rt_hostRunShellProcess_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_hostRunShellProcess_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_hostRunShellProcess_live_panic
    jmp pulsec_rt_hostRunShellProcess_ok
pulsec_rt_hostRunShellProcess_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostRunShellProcess_ok:
    mov ecx, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov edx, dword ptr [rax+rcx*4]
    mov dword ptr [rsp+136], edx
    mov r8d, edx
    add r8d, 1
    mov rcx, qword ptr [rsp+88]
    xor edx, edx
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_hostRunShellProcess_alloc_fail
    mov qword ptr [rsp+104], rax
    mov ecx, dword ptr [rsp+128]
    mov rax, qword ptr [rt_str_data_ptr]
    mov r9, qword ptr [rax+rcx*8]
    mov r10, qword ptr [rsp+104]
    mov r8d, dword ptr [rsp+136]
    xor ecx, ecx
pulsec_rt_hostRunShellProcess_copy_loop:
    cmp ecx, r8d
    jae pulsec_rt_hostRunShellProcess_copy_done
    mov al, byte ptr [r9+rcx]
    mov byte ptr [r10+rcx], al
    add ecx, 1
    jmp pulsec_rt_hostRunShellProcess_copy_loop
pulsec_rt_hostRunShellProcess_copy_done:
    mov byte ptr [r10+rcx], 0
    xor eax, eax
    mov qword ptr [rsp+144], rax
    mov qword ptr [rsp+152], rax
    mov qword ptr [rsp+160], rax
    mov qword ptr [rsp+168], rax
    mov qword ptr [rsp+176], rax
    mov qword ptr [rsp+184], rax
    mov qword ptr [rsp+192], rax
    mov qword ptr [rsp+200], rax
    mov qword ptr [rsp+208], rax
    mov qword ptr [rsp+216], rax
    mov qword ptr [rsp+224], rax
    mov qword ptr [rsp+232], rax
    mov qword ptr [rsp+240], rax
    mov qword ptr [rsp+248], rax
    mov qword ptr [rsp+256], rax
    mov qword ptr [rsp+264], rax
    mov dword ptr [rsp+144], 104
pulsec_rt_hostRunShellProcess_launch:
    xor ecx, ecx
    mov rdx, qword ptr [rsp+104]
    xor r8d, r8d
    xor r9d, r9d
    mov qword ptr [rsp+32], 0
    mov qword ptr [rsp+40], 0
    mov qword ptr [rsp+48], 0
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+56], rax
    lea rax, [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rax, [rsp+248]
    mov qword ptr [rsp+72], rax
    call CreateProcessA
    test eax, eax
    jz pulsec_rt_hostRunShellProcess_cleanup
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+112]
    mov edx, 0FFFFFFFFh
    call WaitForSingleObject
    mov rcx, qword ptr [rsp+112]
    lea rdx, [rsp+132]
    call GetExitCodeProcess
    jmp pulsec_rt_hostRunShellProcess_cleanup
pulsec_rt_hostRunShellProcess_alloc_fail:
    mov dword ptr [rsp+132], -1
pulsec_rt_hostRunShellProcess_cleanup:
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    jz @F
    call CloseHandle
@@:
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    jz @F
    call CloseHandle
@@:
    mov r8, qword ptr [rsp+104]
    test r8, r8
    jz @F
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    jz @F
    xor edx, edx
    call HeapFree
@@:
    mov r8, qword ptr [rsp+96]
    test r8, r8
    jz @F
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    jz @F
    xor edx, edx
    call HeapFree
@@:
    mov eax, dword ptr [rsp+132]
pulsec_rt_hostRunShellProcess_done:
    add rsp, 280
    ret
pulsec_rt_hostRunShellProcess endp

pulsec_rt_hostSetEvent proc
    sub rsp, 40
    call SetEvent
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_hostSetEvent endp

pulsec_rt_hostStartThread proc
    sub rsp, 56
    mov r8, rcx
    mov r9, rdx
    xor ecx, ecx
    xor edx, edx
    mov qword ptr [rsp+32], 0
    mov qword ptr [rsp+40], 0
    call CreateThread
    add rsp, 56
    ret
pulsec_rt_hostStartThread endp

pulsec_rt_hostStringFromUtf8 proc
    jmp pulsec_rt_stringFromBytes
pulsec_rt_hostStringFromUtf8 endp

pulsec_rt_hostStringFromUtf8Z proc
    sub rsp, 56
    test rcx, rcx
    jz pulsec_rt_hostStringFromUtf8Z_null_input
    mov qword ptr [rsp+32], rcx
    xor edx, edx
pulsec_rt_hostStringFromUtf8Z_scan:
    movsxd rax, edx
    mov al, byte ptr [rcx+rax]
    test al, al
    jz pulsec_rt_hostStringFromUtf8Z_done
    add edx, 1
    jmp pulsec_rt_hostStringFromUtf8Z_scan
pulsec_rt_hostStringFromUtf8Z_done:
    mov rcx, qword ptr [rsp+32]
    call pulsec_rt_stringFromBytes
    add rsp, 56
    ret
pulsec_rt_hostStringFromUtf8Z_null_input:
    xor eax, eax
    add rsp, 56
    ret
pulsec_rt_hostStringFromUtf8Z endp

pulsec_rt_hostStringUtf8Length proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_hostStringUtf8Length_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_hostStringUtf8Length_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_hostStringUtf8Length_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_hostStringUtf8Length_live_panic
pulsec_rt_hostStringUtf8Length_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_hostStringUtf8Length_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_hostStringUtf8Length_live_panic
    jmp pulsec_rt_hostStringUtf8Length_ok
pulsec_rt_hostStringUtf8Length_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostStringUtf8Length_ok:
    mov ecx, r10d
    mov rax, qword ptr [rt_str_lens_ptr]
    mov eax, dword ptr [rax+rcx*4]
    ret
pulsec_rt_hostStringUtf8Length endp

pulsec_rt_hostUnregisterNativeCallback0 proc
    cmp ecx, 1
    jb pulsec_rt_hostUnregisterNativeCallback0_invalid
    cmp ecx, 16
    ja pulsec_rt_hostUnregisterNativeCallback0_invalid
    mov eax, dword ptr [rt_native_callback0_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_hostUnregisterNativeCallback0_invalid
    mov dword ptr [rt_native_callback0_slots+rcx*4-4], 0
    mov ecx, eax
    sub rsp, 40
    call pulsec_rt_arcRelease
    add rsp, 40
    mov eax, 1
    ret
pulsec_rt_hostUnregisterNativeCallback0_invalid:
    xor eax, eax
    ret
pulsec_rt_hostUnregisterNativeCallback0 endp

pulsec_rt_hostUnregisterNativeCallback1 proc
    cmp ecx, 1
    jb pulsec_rt_hostUnregisterNativeCallback1_invalid
    cmp ecx, 16
    ja pulsec_rt_hostUnregisterNativeCallback1_invalid
    mov eax, dword ptr [rt_native_callback1_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_hostUnregisterNativeCallback1_invalid
    mov dword ptr [rt_native_callback1_slots+rcx*4-4], 0
    mov ecx, eax
    sub rsp, 40
    call pulsec_rt_arcRelease
    add rsp, 40
    mov eax, 1
    ret
pulsec_rt_hostUnregisterNativeCallback1_invalid:
    xor eax, eax
    ret
pulsec_rt_hostUnregisterNativeCallback1 endp

pulsec_rt_hostUnregisterNativeCallback2 proc
    cmp ecx, 1
    jb pulsec_rt_hostUnregisterNativeCallback2_invalid
    cmp ecx, 16
    ja pulsec_rt_hostUnregisterNativeCallback2_invalid
    mov eax, dword ptr [rt_native_callback2_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_hostUnregisterNativeCallback2_invalid
    mov dword ptr [rt_native_callback2_slots+rcx*4-4], 0
    mov ecx, eax
    sub rsp, 40
    call pulsec_rt_arcRelease
    add rsp, 40
    mov eax, 1
    ret
pulsec_rt_hostUnregisterNativeCallback2_invalid:
    xor eax, eax
    ret
pulsec_rt_hostUnregisterNativeCallback2 endp

pulsec_rt_hostUnregisterNativeCallback3 proc
    cmp ecx, 1
    jb pulsec_rt_hostUnregisterNativeCallback3_invalid
    cmp ecx, 16
    ja pulsec_rt_hostUnregisterNativeCallback3_invalid
    mov eax, dword ptr [rt_native_callback3_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_hostUnregisterNativeCallback3_invalid
    mov dword ptr [rt_native_callback3_slots+rcx*4-4], 0
    mov ecx, eax
    sub rsp, 40
    call pulsec_rt_arcRelease
    add rsp, 40
    mov eax, 1
    ret
pulsec_rt_hostUnregisterNativeCallback3_invalid:
    xor eax, eax
    ret
pulsec_rt_hostUnregisterNativeCallback3 endp

pulsec_rt_hostUnregisterNativeCallback4 proc
    cmp ecx, 1
    jb pulsec_rt_hostUnregisterNativeCallback4_invalid
    cmp ecx, 16
    ja pulsec_rt_hostUnregisterNativeCallback4_invalid
    mov eax, dword ptr [rt_native_callback4_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_hostUnregisterNativeCallback4_invalid
    mov dword ptr [rt_native_callback4_slots+rcx*4-4], 0
    mov ecx, eax
    sub rsp, 40
    call pulsec_rt_arcRelease
    add rsp, 40
    mov eax, 1
    ret
pulsec_rt_hostUnregisterNativeCallback4_invalid:
    xor eax, eax
    ret
pulsec_rt_hostUnregisterNativeCallback4 endp

pulsec_rt_hostWaitHandle proc
    mov r8, rdx
    test r8, r8
    jns pulsec_rt_hostWaitHandle_nonneg
    mov edx, 0FFFFFFFFh
    jmp pulsec_rt_hostWaitHandle_call
pulsec_rt_hostWaitHandle_nonneg:
    mov rax, 4294967295
    cmp r8, rax
    jbe pulsec_rt_hostWaitHandle_call
    mov edx, 0FFFFFFFFh
    jmp pulsec_rt_hostWaitHandle_call
pulsec_rt_hostWaitHandle_call:
    sub rsp, 40
    call WaitForSingleObject
    add rsp, 40
    cmp eax, 0
    je pulsec_rt_hostWaitHandle_done
    cmp eax, 102h
    je pulsec_rt_hostWaitHandle_timeout
    cmp eax, 80h
    je pulsec_rt_hostWaitHandle_abandoned
    jmp pulsec_rt_hostWaitHandle_failed
pulsec_rt_hostWaitHandle_timeout:
    mov eax, 1
    ret
pulsec_rt_hostWaitHandle_abandoned:
    mov eax, 2
    ret
pulsec_rt_hostWaitHandle_failed:
    mov eax, -1
    ret
pulsec_rt_hostWaitHandle_done:
    xor eax, eax
    ret
pulsec_rt_hostWaitHandle endp

pulsec_rt_hostWriteAllText proc
    sub rsp, 120
    mov dword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], 0
    mov dword ptr [rsp+96], 0
    call pulsec_rt_hostPathAlloc
    test rax, rax
    jz pulsec_rt_hostWriteAllText_fail
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+64]
    mov edx, 40000000h
    xor r8d, r8d
    xor r9d, r9d
    mov qword ptr [rsp+32], 2
    mov qword ptr [rsp+40], 80h
    mov qword ptr [rsp+48], 0
    call CreateFileA
    cmp rax, -1
    je pulsec_rt_hostWriteAllText_cleanup
    mov qword ptr [rsp+72], rax
    mov ecx, dword ptr [rsp+80]
    test ecx, ecx
    jz @F
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_hostWriteAllText_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_hostWriteAllText_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_hostWriteAllText_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_hostWriteAllText_live_panic
pulsec_rt_hostWriteAllText_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_hostWriteAllText_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 3
    jne pulsec_rt_hostWriteAllText_live_panic
    jmp pulsec_rt_hostWriteAllText_ok
pulsec_rt_hostWriteAllText_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_hostWriteAllText_ok:
    mov ecx, r10d
    mov rax, qword ptr [rt_str_data_ptr]
    mov rdx, qword ptr [rax+rcx*8]
    mov rax, qword ptr [rt_str_lens_ptr]
    mov r8d, dword ptr [rax+rcx*4]
    mov dword ptr [rsp+96], r8d
    test r8d, r8d
    jz @F
    mov rcx, qword ptr [rsp+72]
    lea r9, [rsp+88]
    mov qword ptr [rsp+32], 0
    call WriteFile
    test eax, eax
    jz pulsec_rt_hostWriteAllText_cleanup
    mov eax, dword ptr [rsp+96]
    cmp dword ptr [rsp+88], eax
    jne pulsec_rt_hostWriteAllText_cleanup
@@:
    mov dword ptr [rsp+56], 1
    jmp pulsec_rt_hostWriteAllText_cleanup
pulsec_rt_hostWriteAllText_fail:
    mov dword ptr [rsp+56], 0
pulsec_rt_hostWriteAllText_cleanup:
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    jz @F
    call CloseHandle
@@:
    mov r8, qword ptr [rsp+64]
    test r8, r8
    jz @F
    call GetProcessHeap
    mov rcx, rax
    xor edx, edx
    mov r8, qword ptr [rsp+64]
    call HeapFree
@@:
    mov eax, dword ptr [rsp+56]
pulsec_rt_hostWriteAllText_done:
    add rsp, 120
    ret
pulsec_rt_hostWriteAllText endp

pulsec_rt_hostWriteByte proc
    test rcx, rcx
    jz pulsec_rt_hostWriteByte_done
    cmp edx, 0
    jl pulsec_rt_hostWriteByte_done
    movsxd rax, edx
    mov byte ptr [rcx+rax], r8b
pulsec_rt_hostWriteByte_done:
    xor eax, eax
    ret
pulsec_rt_hostWriteByte endp

pulsec_rt_hostWriteLong proc
    test rcx, rcx
    jz pulsec_rt_hostWriteLong_done
    cmp edx, 0
    jl pulsec_rt_hostWriteLong_done
    movsxd rax, edx
    mov qword ptr [rcx+rax], r8
pulsec_rt_hostWriteLong_done:
    xor eax, eax
    ret
pulsec_rt_hostWriteLong endp

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

pulsec_rt_listKind proc
    mov r10d, ecx
    cmp r10d, 1
    jb pulsec_rt_listKind_live_panic
    cmp r10d, dword ptr [rt_slot_capacity]
    ja pulsec_rt_listKind_live_panic
    mov r11, rcx
    shr r11, 32
    test r11d, r11d
    jz pulsec_rt_listKind_live
    cmp r11d, dword ptr [rt_arc_generation+r10*4]
    jne pulsec_rt_listKind_live_panic
pulsec_rt_listKind_live:
    mov eax, dword ptr [rt_arc_refcounts+r10*4]
    cmp eax, 0
    je pulsec_rt_listKind_live_panic
    mov eax, dword ptr [rt_arc_kinds+r10*4]
    cmp eax, 4
    jne pulsec_rt_listKind_live_panic
    mov eax, dword ptr [rt_arc_meta+r10*4]
    cmp eax, 1
    jne pulsec_rt_listKind_live_panic
    jmp pulsec_rt_listKind_ok
pulsec_rt_listKind_live_panic:
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_listKind_ok:
    mov ecx, r10d
    mov r10d, ecx
    mov rax, qword ptr [rt_list_kind_ptr]
    mov eax, dword ptr [rax+r10*4]
    ret
pulsec_rt_listKind endp

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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov r10d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r10*4]
    mov dword ptr [rt_tmp_size], r8d
    mov rax, qword ptr [rt_map_keys_ptr_ptr]
    mov r11, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_a], r11
    test r11, r11
    jz pulsec_rt_mapContainsKey_end
    xor r9d, r9d
pulsec_rt_mapContainsKey_loop:
    cmp r9d, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapContainsKey_end
    mov r11, qword ptr [rt_tmp_ptr_a]
    mov rcx, qword ptr [r11+r9*8]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov dword ptr [rt_tmp_arr_bytes], r9d
    call pulsec_rt_stringEquals
    mov r10d, dword ptr [rt_tmp_arr_bytes]
    cmp eax, 1
    jne pulsec_rt_mapContainsKey_next
    mov eax, 1
    ret
pulsec_rt_mapContainsKey_next:
    mov r9d, r10d
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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_size], r8d
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
    cmp r9d, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov rcx, qword ptr [rax+r9*8]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov dword ptr [rt_tmp_arr_bytes], r9d
    call pulsec_rt_stringEquals
    mov r10d, dword ptr [rt_tmp_arr_bytes]
    mov r9d, r10d
    cmp eax, 1
    jne pulsec_rt_mapGet_next
    mov rax, qword ptr [rt_tmp_ptr_b]
    cmp dword ptr [rax+r9*4], 2
    jne pulsec_rt_mapGet_end
    mov rax, qword ptr [rt_tmp_ptr_d]
    test rax, rax
    jz pulsec_rt_mapGet_end
    mov rax, qword ptr [rax+r9*8]
    mov qword ptr [rt_tmp_arg_val], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rt_tmp_arg_val]
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
    mov qword ptr [rt_tmp_arg_key], rdx
    mov r11d, ecx
    mov rax, qword ptr [rt_map_size_ptr]
    mov r8d, dword ptr [rax+r11*4]
    mov dword ptr [rt_tmp_size], r8d
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
    cmp r9d, dword ptr [rt_tmp_size]
    jae pulsec_rt_mapGetInt_end
    mov rax, qword ptr [rt_tmp_ptr_a]
    mov rcx, qword ptr [rax+r9*8]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov dword ptr [rt_tmp_arr_bytes], r9d
    call pulsec_rt_stringEquals
    mov r10d, dword ptr [rt_tmp_arr_bytes]
    mov r9d, r10d
    cmp eax, 1
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
    mov rcx, qword ptr [r10+rax*8]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov dword ptr [rt_tmp_arr_bytes], eax
    call pulsec_rt_stringEquals
    mov r10d, dword ptr [rt_tmp_arr_bytes]
    cmp eax, 1
    jne pulsec_rt_mapPut_miss
    mov dword ptr [rt_tmp_arr_len], r10d
    mov eax, dword ptr [rt_tmp_arr_len]
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
    mov eax, r10d
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
    mov r11d, dword ptr [rt_tmp_arr_slot]
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
    mov rcx, qword ptr [r10+rax*8]
    mov rdx, qword ptr [rt_tmp_arg_key]
    mov dword ptr [rt_tmp_arr_bytes], eax
    call pulsec_rt_stringEquals
    mov r10d, dword ptr [rt_tmp_arr_bytes]
    cmp eax, 1
    jne pulsec_rt_mapPutInt_miss
    mov dword ptr [rt_tmp_arr_len], r10d
    mov eax, dword ptr [rt_tmp_arr_len]
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
    mov eax, r10d
    add eax, 1
    jmp pulsec_rt_mapPutInt_loop
pulsec_rt_mapPutInt_insert:
    mov r9d, dword ptr [rt_tmp_size]
    cmp r9d, dword ptr [rt_tmp_arr_len]
    jae pulsec_rt_mapPutInt_grow
    mov rcx, qword ptr [rt_tmp_arg_key]
    call pulsec_rt_arcRetain
    mov r9d, dword ptr [rt_tmp_size]
    mov r11d, dword ptr [rt_tmp_arr_slot]
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

pulsec_rt_nanoTime proc
    sub rsp, 40
    call GetTickCount64
    mov rcx, 1000000
    imul rax, rcx
    add rsp, 40
    ret
pulsec_rt_nanoTime endp



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
    mov rax, qword ptr [rt_str_data_ptr]
    mov r10, qword ptr [rax+r11*8]
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
    sub rsp, 88
    mov qword ptr [rsp+32], 0
    mov qword ptr [rsp+40], 0
    mov qword ptr [rsp+56], 0
    mov r10, rcx
    mov r11, rdx
    xor r8d, r8d
    xor r9d, r9d
    mov qword ptr [rt_tmp_ptr_b], 0
    mov qword ptr [rt_tmp_ptr_c], 0
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
    mov rax, qword ptr [rt_str_data_ptr]
    mov rax, qword ptr [rax+r10*8]
    mov qword ptr [rt_tmp_ptr_b], rax
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
    mov rax, qword ptr [rt_str_data_ptr]
    mov rax, qword ptr [rax+r11*8]
    mov qword ptr [rt_tmp_ptr_c], rax
pulsec_rt_stringConcat_total_ready:
    mov dword ptr [rsp+48], r8d
    mov dword ptr [rsp+52], r9d
    mov eax, r8d
    add eax, r9d
    mov dword ptr [rsp+64], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_rt_stringConcat_fail
    mov qword ptr [rsp+40], rax
    mov ecx, dword ptr [rsp+64]
    add ecx, 1
    mov r8d, ecx
    mov rcx, qword ptr [rsp+40]
    xor edx, edx
    call HeapAlloc
    test rax, rax
    jz pulsec_rt_stringConcat_fail
    mov qword ptr [rsp+32], rax
    xor ecx, ecx
pulsec_rt_stringConcat_copy_h1_loop:
    cmp ecx, dword ptr [rsp+48]
    jae pulsec_rt_stringConcat_copy_h2
    mov r10, qword ptr [rt_tmp_ptr_b]
    test r10, r10
    jz pulsec_rt_stringConcat_copy_h2
    mov rdx, qword ptr [rsp+32]
    mov al, byte ptr [r10+rcx]
    mov byte ptr [rdx+rcx], al
    add ecx, 1
    jmp pulsec_rt_stringConcat_copy_h1_loop
pulsec_rt_stringConcat_copy_h2:
    xor r8d, r8d
pulsec_rt_stringConcat_copy_h2_loop:
    cmp r8d, dword ptr [rsp+52]
    jae pulsec_rt_stringConcat_emit
    mov r11, qword ptr [rt_tmp_ptr_c]
    test r11, r11
    jz pulsec_rt_stringConcat_emit
    mov rdx, qword ptr [rsp+32]
    mov al, byte ptr [r11+r8]
    mov byte ptr [rdx+rcx], al
    add r8d, 1
    add ecx, 1
    jmp pulsec_rt_stringConcat_copy_h2_loop
pulsec_rt_stringConcat_emit:
    mov rdx, qword ptr [rsp+32]
    mov byte ptr [rdx+rcx], 0
    mov rcx, qword ptr [rsp+32]
    mov edx, dword ptr [rsp+64]
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+56], rax
    mov rcx, qword ptr [rsp+40]
    xor edx, edx
    mov r8, qword ptr [rsp+32]
    call HeapFree
    mov rax, qword ptr [rsp+56]
    add rsp, 88
    ret
pulsec_rt_stringConcat_fail:
    lea rcx, rt_string_alloc_err
    mov edx, rt_string_alloc_err_len
    call pulsec_rt_writeRaw
    lea rcx, rt_newline
    mov edx, 2
    call pulsec_rt_writeRaw
    mov ecx, 1
    call ExitProcess
    add rsp, 88
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

pulsec_rt_systemExit proc
    sub rsp, 40
    call ExitProcess
    add rsp, 40
    ret
pulsec_rt_systemExit endp

pulsec_rt_threadSleepMillis proc
    test rcx, rcx
    jns pulsec_rt_threadSleepMillis_nonneg
    xor ecx, ecx
    jmp pulsec_rt_threadSleepMillis_call
pulsec_rt_threadSleepMillis_nonneg:
    mov rax, 4294967295
    cmp rcx, rax
    jbe pulsec_rt_threadSleepMillis_call
    mov ecx, 4294967295
pulsec_rt_threadSleepMillis_call:
    sub rsp, 40
    call Sleep
    add rsp, 40
    ret
pulsec_rt_threadSleepMillis endp

pulsec_rt_threadYield proc
    sub rsp, 40
    call SwitchToThread
    add rsp, 40
    movzx eax, al
    ret
pulsec_rt_threadYield endp

pulsec_rt_weakClear proc
    mov qword ptr [rt_tmp_arg_key], rcx
    call pulsec_rt_runtimeMemoryLock
    mov rcx, qword ptr [rt_tmp_arg_key]
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
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, r11d
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_weakClear_done:
    call pulsec_rt_runtimeMemoryUnlock
    xor eax, eax
    ret
pulsec_rt_weakClear endp

pulsec_rt_weakGet proc
    mov qword ptr [rt_tmp_arg_key], rcx
    call pulsec_rt_runtimeMemoryLock
    mov rcx, qword ptr [rt_tmp_arg_key]
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
    jmp pulsec_rt_weakGet_target_dead
pulsec_rt_weakGet_target_live:
    mov ecx, r11d
    shl rdx, 32
    or rcx, rdx
    call pulsec_rt_arcRetain
    mov r11, rax
    call pulsec_rt_runtimeMemoryUnlock
    mov rax, r11
    ret
pulsec_rt_weakGet_target_dead:
    call pulsec_rt_runtimeMemoryUnlock
    xor eax, eax
    ret
pulsec_rt_weakGet_stale:
    call pulsec_rt_runtimeMemoryUnlock
    lea rcx, rt_stale_handle_err
    mov edx, rt_stale_handle_err_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
pulsec_rt_weakGet_done:
    call pulsec_rt_runtimeMemoryUnlock
    xor eax, eax
    ret
pulsec_rt_weakGet endp

pulsec_rt_weakNew proc
    mov qword ptr [rt_tmp_arg_key], rcx
    call pulsec_rt_runtimeMemoryLock
    mov rcx, qword ptr [rt_tmp_arg_key]
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
    mov dword ptr [rt_tmp_size], eax
    call pulsec_rt_runtimeMemoryUnlock
    mov eax, dword ptr [rt_tmp_size]
    ret
pulsec_rt_weakNew endp

pulsec_rt_invokeNativeCallback0 proc
    sub rsp, 40
    cmp ecx, 1
    jb pulsec_rt_invokeNativeCallback0_invalid
    cmp ecx, 16
    ja pulsec_rt_invokeNativeCallback0_invalid
    mov eax, dword ptr [rt_native_callback0_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_invokeNativeCallback0_invalid
    mov dword ptr [rsp+16], eax
    mov ecx, dword ptr [rsp+16]
    call pulsec_rt_objectClassId
    test eax, eax
    jz pulsec_rt_invokeNativeCallback0_type
    jmp pulsec_rt_invokeNativeCallback0_type
pulsec_rt_invokeNativeCallback0_invalid:
    lea rcx, rt_native_callback_invalid_err
    mov edx, rt_native_callback_invalid_err_len
    call pulsec_rt_stringFromBytes
    add rsp, 40
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback0_type:
    add rsp, 40
    call pulsec_rt_dispatchInvalidTypePanic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback0 endp

pulsec_rt_invokeNativeCallback1 proc
    sub rsp, 56
    mov qword ptr [rsp+40], rdx
    cmp ecx, 1
    jb pulsec_rt_invokeNativeCallback1_invalid
    cmp ecx, 16
    ja pulsec_rt_invokeNativeCallback1_invalid
    mov eax, dword ptr [rt_native_callback1_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_invokeNativeCallback1_invalid
    mov dword ptr [rsp+16], eax
    mov ecx, dword ptr [rsp+16]
    call pulsec_rt_objectClassId
    test eax, eax
    jz pulsec_rt_invokeNativeCallback1_type
    jmp pulsec_rt_invokeNativeCallback1_type
pulsec_rt_invokeNativeCallback1_invalid:
    lea rcx, rt_native_callback_invalid_err
    mov edx, rt_native_callback_invalid_err_len
    call pulsec_rt_stringFromBytes
    add rsp, 56
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback1_type:
    add rsp, 56
    call pulsec_rt_dispatchInvalidTypePanic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback1 endp

pulsec_rt_invokeNativeCallback2 proc
    sub rsp, 56
    mov qword ptr [rsp+40], rdx
    mov qword ptr [rsp+48], r8
    cmp ecx, 1
    jb pulsec_rt_invokeNativeCallback2_invalid
    cmp ecx, 16
    ja pulsec_rt_invokeNativeCallback2_invalid
    mov eax, dword ptr [rt_native_callback2_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_invokeNativeCallback2_invalid
    mov dword ptr [rsp+16], eax
    mov ecx, dword ptr [rsp+16]
    call pulsec_rt_objectClassId
    test eax, eax
    jz pulsec_rt_invokeNativeCallback2_type
    jmp pulsec_rt_invokeNativeCallback2_type
pulsec_rt_invokeNativeCallback2_invalid:
    lea rcx, rt_native_callback_invalid_err
    mov edx, rt_native_callback_invalid_err_len
    call pulsec_rt_stringFromBytes
    add rsp, 56
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback2_type:
    add rsp, 56
    call pulsec_rt_dispatchInvalidTypePanic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback2 endp

pulsec_rt_invokeNativeCallback3 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rdx
    mov qword ptr [rsp+48], r8
    mov qword ptr [rsp+56], r9
    cmp ecx, 1
    jb pulsec_rt_invokeNativeCallback3_invalid
    cmp ecx, 16
    ja pulsec_rt_invokeNativeCallback3_invalid
    mov eax, dword ptr [rt_native_callback3_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_invokeNativeCallback3_invalid
    mov dword ptr [rsp+16], eax
    mov ecx, dword ptr [rsp+16]
    call pulsec_rt_objectClassId
    test eax, eax
    jz pulsec_rt_invokeNativeCallback3_type
    jmp pulsec_rt_invokeNativeCallback3_type
pulsec_rt_invokeNativeCallback3_invalid:
    lea rcx, rt_native_callback_invalid_err
    mov edx, rt_native_callback_invalid_err_len
    call pulsec_rt_stringFromBytes
    add rsp, 72
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback3_type:
    add rsp, 72
    call pulsec_rt_dispatchInvalidTypePanic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback3 endp

pulsec_rt_invokeNativeCallback4 proc
    mov rax, qword ptr [rsp+40]
    sub rsp, 72
    mov qword ptr [rsp+40], rdx
    mov qword ptr [rsp+48], r8
    mov qword ptr [rsp+56], r9
    mov qword ptr [rsp+64], rax
    cmp ecx, 1
    jb pulsec_rt_invokeNativeCallback4_invalid
    cmp ecx, 16
    ja pulsec_rt_invokeNativeCallback4_invalid
    mov eax, dword ptr [rt_native_callback4_slots+rcx*4-4]
    test eax, eax
    jz pulsec_rt_invokeNativeCallback4_invalid
    mov dword ptr [rsp+16], eax
    mov ecx, dword ptr [rsp+16]
    call pulsec_rt_objectClassId
    test eax, eax
    jz pulsec_rt_invokeNativeCallback4_type
    jmp pulsec_rt_invokeNativeCallback4_type
pulsec_rt_invokeNativeCallback4_invalid:
    lea rcx, rt_native_callback_invalid_err
    mov edx, rt_native_callback_invalid_err_len
    call pulsec_rt_stringFromBytes
    add rsp, 72
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback4_type:
    add rsp, 72
    call pulsec_rt_dispatchInvalidTypePanic
    xor eax, eax
    ret
pulsec_rt_invokeNativeCallback4 endp

pulsec_rt_nativeCallback0_slot1 proc
    sub rsp, 40
    mov ecx, 1
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot1 endp
pulsec_rt_nativeCallback0_slot2 proc
    sub rsp, 40
    mov ecx, 2
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot2 endp
pulsec_rt_nativeCallback0_slot3 proc
    sub rsp, 40
    mov ecx, 3
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot3 endp
pulsec_rt_nativeCallback0_slot4 proc
    sub rsp, 40
    mov ecx, 4
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot4 endp
pulsec_rt_nativeCallback0_slot5 proc
    sub rsp, 40
    mov ecx, 5
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot5 endp
pulsec_rt_nativeCallback0_slot6 proc
    sub rsp, 40
    mov ecx, 6
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot6 endp
pulsec_rt_nativeCallback0_slot7 proc
    sub rsp, 40
    mov ecx, 7
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot7 endp
pulsec_rt_nativeCallback0_slot8 proc
    sub rsp, 40
    mov ecx, 8
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot8 endp
pulsec_rt_nativeCallback0_slot9 proc
    sub rsp, 40
    mov ecx, 9
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot9 endp
pulsec_rt_nativeCallback0_slot10 proc
    sub rsp, 40
    mov ecx, 10
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot10 endp
pulsec_rt_nativeCallback0_slot11 proc
    sub rsp, 40
    mov ecx, 11
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot11 endp
pulsec_rt_nativeCallback0_slot12 proc
    sub rsp, 40
    mov ecx, 12
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot12 endp
pulsec_rt_nativeCallback0_slot13 proc
    sub rsp, 40
    mov ecx, 13
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot13 endp
pulsec_rt_nativeCallback0_slot14 proc
    sub rsp, 40
    mov ecx, 14
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot14 endp
pulsec_rt_nativeCallback0_slot15 proc
    sub rsp, 40
    mov ecx, 15
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot15 endp
pulsec_rt_nativeCallback0_slot16 proc
    sub rsp, 40
    mov ecx, 16
    call pulsec_rt_invokeNativeCallback0
    add rsp, 40
    ret
pulsec_rt_nativeCallback0_slot16 endp
pulsec_rt_nativeCallback1_slot1 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 1
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot1 endp
pulsec_rt_nativeCallback1_slot2 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 2
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot2 endp
pulsec_rt_nativeCallback1_slot3 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 3
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot3 endp
pulsec_rt_nativeCallback1_slot4 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 4
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot4 endp
pulsec_rt_nativeCallback1_slot5 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 5
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot5 endp
pulsec_rt_nativeCallback1_slot6 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 6
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot6 endp
pulsec_rt_nativeCallback1_slot7 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 7
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot7 endp
pulsec_rt_nativeCallback1_slot8 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 8
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot8 endp
pulsec_rt_nativeCallback1_slot9 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 9
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot9 endp
pulsec_rt_nativeCallback1_slot10 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 10
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot10 endp
pulsec_rt_nativeCallback1_slot11 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 11
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot11 endp
pulsec_rt_nativeCallback1_slot12 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 12
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot12 endp
pulsec_rt_nativeCallback1_slot13 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 13
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot13 endp
pulsec_rt_nativeCallback1_slot14 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 14
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot14 endp
pulsec_rt_nativeCallback1_slot15 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 15
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot15 endp
pulsec_rt_nativeCallback1_slot16 proc
    mov r10, rcx
    sub rsp, 40
    mov ecx, 16
    mov rdx, r10
    call pulsec_rt_invokeNativeCallback1
    add rsp, 40
    ret
pulsec_rt_nativeCallback1_slot16 endp
pulsec_rt_nativeCallback2_slot1 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 1
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot1 endp
pulsec_rt_nativeCallback2_slot2 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 2
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot2 endp
pulsec_rt_nativeCallback2_slot3 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 3
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot3 endp
pulsec_rt_nativeCallback2_slot4 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 4
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot4 endp
pulsec_rt_nativeCallback2_slot5 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 5
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot5 endp
pulsec_rt_nativeCallback2_slot6 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 6
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot6 endp
pulsec_rt_nativeCallback2_slot7 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 7
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot7 endp
pulsec_rt_nativeCallback2_slot8 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 8
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot8 endp
pulsec_rt_nativeCallback2_slot9 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 9
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot9 endp
pulsec_rt_nativeCallback2_slot10 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 10
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot10 endp
pulsec_rt_nativeCallback2_slot11 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 11
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot11 endp
pulsec_rt_nativeCallback2_slot12 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 12
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot12 endp
pulsec_rt_nativeCallback2_slot13 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 13
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot13 endp
pulsec_rt_nativeCallback2_slot14 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 14
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot14 endp
pulsec_rt_nativeCallback2_slot15 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 15
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot15 endp
pulsec_rt_nativeCallback2_slot16 proc
    mov r10, rcx
    mov r11, rdx
    sub rsp, 40
    mov ecx, 16
    mov rdx, r10
    mov r8, r11
    call pulsec_rt_invokeNativeCallback2
    add rsp, 40
    ret
pulsec_rt_nativeCallback2_slot16 endp
pulsec_rt_nativeCallback3_slot1 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 1
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot1 endp
pulsec_rt_nativeCallback3_slot2 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 2
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot2 endp
pulsec_rt_nativeCallback3_slot3 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 3
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot3 endp
pulsec_rt_nativeCallback3_slot4 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 4
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot4 endp
pulsec_rt_nativeCallback3_slot5 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 5
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot5 endp
pulsec_rt_nativeCallback3_slot6 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 6
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot6 endp
pulsec_rt_nativeCallback3_slot7 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 7
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot7 endp
pulsec_rt_nativeCallback3_slot8 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 8
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot8 endp
pulsec_rt_nativeCallback3_slot9 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 9
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot9 endp
pulsec_rt_nativeCallback3_slot10 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 10
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot10 endp
pulsec_rt_nativeCallback3_slot11 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 11
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot11 endp
pulsec_rt_nativeCallback3_slot12 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 12
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot12 endp
pulsec_rt_nativeCallback3_slot13 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 13
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot13 endp
pulsec_rt_nativeCallback3_slot14 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 14
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot14 endp
pulsec_rt_nativeCallback3_slot15 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 15
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot15 endp
pulsec_rt_nativeCallback3_slot16 proc
    mov r10, rcx
    mov r11, rdx
    mov rax, r8
    sub rsp, 40
    mov ecx, 16
    mov rdx, r10
    mov r8, r11
    mov r9, rax
    call pulsec_rt_invokeNativeCallback3
    add rsp, 40
    ret
pulsec_rt_nativeCallback3_slot16 endp
pulsec_rt_nativeCallback4_slot1 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 1
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot1 endp
pulsec_rt_nativeCallback4_slot2 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 2
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot2 endp
pulsec_rt_nativeCallback4_slot3 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 3
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot3 endp
pulsec_rt_nativeCallback4_slot4 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 4
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot4 endp
pulsec_rt_nativeCallback4_slot5 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 5
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot5 endp
pulsec_rt_nativeCallback4_slot6 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 6
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot6 endp
pulsec_rt_nativeCallback4_slot7 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 7
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot7 endp
pulsec_rt_nativeCallback4_slot8 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 8
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot8 endp
pulsec_rt_nativeCallback4_slot9 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 9
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot9 endp
pulsec_rt_nativeCallback4_slot10 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 10
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot10 endp
pulsec_rt_nativeCallback4_slot11 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 11
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot11 endp
pulsec_rt_nativeCallback4_slot12 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 12
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot12 endp
pulsec_rt_nativeCallback4_slot13 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 13
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot13 endp
pulsec_rt_nativeCallback4_slot14 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 14
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot14 endp
pulsec_rt_nativeCallback4_slot15 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 15
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot15 endp
pulsec_rt_nativeCallback4_slot16 proc
    sub rsp, 72
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    mov ecx, 16
    mov rdx, qword ptr [rsp+40]
    mov r8, qword ptr [rsp+48]
    mov r9, qword ptr [rsp+56]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+32], rax
    call pulsec_rt_invokeNativeCallback4
    add rsp, 72
    ret
pulsec_rt_nativeCallback4_slot16 endp
end
