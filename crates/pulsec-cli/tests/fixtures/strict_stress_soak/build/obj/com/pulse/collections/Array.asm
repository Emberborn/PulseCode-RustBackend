option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_obj_counter:dword
extrn pulsec_rt_obj_class_ids:qword
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_arrayGetInt:proc
extrn pulsec_rt_arrayGetString:proc
extrn pulsec_rt_arrayLength:proc
extrn pulsec_rt_arrayNew:proc
extrn pulsec_rt_arraySetInt:proc
extrn pulsec_rt_arraySetString:proc

public pulsec_fld_com_pulse_collections_Array_handle
public pulsec_fld_com_pulse_collections_Array_handle_heap_owned

.data
written dq 0
pulsec_objc_com_pulse_collections_Array dd 0
pulsec_fcap_com_pulse_collections_Array dd 63
pulsec_fld_com_pulse_collections_Array_handle_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_Array_handle dq pulsec_fld_com_pulse_collections_Array_handle_tbl
pulsec_fld_com_pulse_collections_Array_handle_heap_owned dd 0
trace_m0 db "com.pulse.collections.Array.Array"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.collections.Array.length"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.collections.Array.getInt"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.collections.Array.setInt"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.collections.Array.getString"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.collections.Array.setString"
trace_m5_len equ $ - trace_m5

.code
pulsec_fcap_com_pulse_collections_Array_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_collections_Array_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_collections_Array]
    jbe pulsec_fcap_com_pulse_collections_Array_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_collections_Array]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_Array_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_Array_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
    xor esi, esi
pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_Array_handle_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_Array_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_Array_handle], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_Array_handle_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_collections_Array], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_collections_Array_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_collections_Array_ensure_alloc_fail:
pulsec_fcap_com_pulse_collections_Array_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_collections_Array_ensure endp

pulsec_com_pulse_collections_Array_Array__int proc
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
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
    mov ecx, 1
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_collections_Array_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_Array_Array__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_rt_arrayNew
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
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
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_collections_Array_length_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_Array_getInt__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
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
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_Array_setInt__int_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_Array_getString__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
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
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], r8
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_Array_setString__int_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_Array_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    call pulsec_rt_arraySetString
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+104]
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

end
