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

public pulsec_fld_strict_stress_soak_Token_v
public pulsec_fld_strict_stress_soak_Token_v_heap_owned

.data
written dq 0
pulsec_objc_strict_stress_soak_Token dd 0
pulsec_fcap_strict_stress_soak_Token dd 63
pulsec_fld_strict_stress_soak_Token_v_tbl dd 64 dup(0)
pulsec_fld_strict_stress_soak_Token_v dq pulsec_fld_strict_stress_soak_Token_v_tbl
pulsec_fld_strict_stress_soak_Token_v_heap_owned dd 0
trace_m0 db "strict_stress_soak.Token.Token"
trace_m0_len equ $ - trace_m0
trace_m1 db "strict_stress_soak.Token.value"
trace_m1_len equ $ - trace_m1

.code
pulsec_fcap_strict_stress_soak_Token_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_strict_stress_soak_Token_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_strict_stress_soak_Token]
    jbe pulsec_fcap_strict_stress_soak_Token_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_strict_stress_soak_Token]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_strict_stress_soak_Token_ensure_fail
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
    jz pulsec_fcap_strict_stress_soak_Token_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_strict_stress_soak_Token_v]
    xor esi, esi
pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_copy_loop
pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_strict_stress_soak_Token_v_heap_owned], 0
    je pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_strict_stress_soak_Token_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_strict_stress_soak_Token_v], r12
    mov dword ptr [pulsec_fld_strict_stress_soak_Token_v_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_strict_stress_soak_Token], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_strict_stress_soak_Token_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_strict_stress_soak_Token_ensure_alloc_fail:
pulsec_fcap_strict_stress_soak_Token_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_strict_stress_soak_Token_ensure endp

pulsec_strict_stress_soak_Token_Token__int proc
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
    mov ecx, 48
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_strict_stress_soak_Token_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_strict_stress_soak_Token_Token__int_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_strict_stress_soak_Token_v]
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_strict_stress_soak_Token_Token__int_epilogue
pulsec_strict_stress_soak_Token_Token__int_epilogue:
pulsec_strict_stress_soak_Token_Token__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_strict_stress_soak_Token_Token__int endp

pulsec_strict_stress_soak_Token_value proc
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
pulsec_strict_stress_soak_Token_value_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_strict_stress_soak_Token_v]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_strict_stress_soak_Token_value_epilogue
pulsec_strict_stress_soak_Token_value_epilogue:
pulsec_strict_stress_soak_Token_value_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_strict_stress_soak_Token_value endp

end
