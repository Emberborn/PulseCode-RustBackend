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
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_objectNew:proc
extrn rt_slot_capacity:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MAX_VALUE:proc
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

public pulsec_fld_app_stress_Token_v
public pulsec_fld_app_stress_Token_v_heap_owned

.data
written dq 0
pulsec_objc_app_stress_Token dd 0
pulsec_fcap_app_stress_Token dd 63
pulsec_fld_app_stress_Token_v_tbl dd 64 dup(0)
pulsec_fld_app_stress_Token_v dq pulsec_fld_app_stress_Token_v_tbl
pulsec_fld_app_stress_Token_v_heap_owned dd 0
trace_m0 db "app.stress.Token.Token"
trace_m0_len equ 22
pulsec_app_stress_Token_Token__int_trace_s0 db "app.stress.Token.Token(Token.aden:7)"
pulsec_app_stress_Token_Token__int_trace_s0_len equ 37
trace_m2 db "app.stress.Token.value"
trace_m2_len equ 22
pulsec_app_stress_Token_value_trace_s0 db "app.stress.Token.value(Token.aden:11)"
pulsec_app_stress_Token_value_trace_s0_len equ 38

.code
pulsec_fcap_app_stress_Token_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_app_stress_Token_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_app_stress_Token]
    jbe pulsec_fcap_app_stress_Token_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_app_stress_Token]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_app_stress_Token_ensure_fail
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
    jz pulsec_fcap_app_stress_Token_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_app_stress_Token_v]
    xor esi, esi
pulsec_fcap_app_stress_Token_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_app_stress_Token_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_app_stress_Token_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_app_stress_Token_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_app_stress_Token_ensure_field_0_done_copy_loop
pulsec_fcap_app_stress_Token_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_app_stress_Token_v_heap_owned], 0
    je pulsec_fcap_app_stress_Token_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_app_stress_Token_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_app_stress_Token_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_app_stress_Token_v], r12
    mov dword ptr [pulsec_fld_app_stress_Token_v_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_app_stress_Token], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_app_stress_Token_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_app_stress_Token_ensure_alloc_fail:
pulsec_fcap_app_stress_Token_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_app_stress_Token_ensure endp

pulsec_app_stress_Token_Token__int proc
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
    mov dword ptr [rsp+72], edx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_app_stress_Token_Token__int_ctor_reuse
    mov ecx, 3
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_app_stress_Token_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_app_stress_Token_Token__int_ctor_ready
pulsec_app_stress_Token_Token__int_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_app_stress_Token_Token__int_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_app_stress_Token_Token__int_b0:
    lea rcx, pulsec_app_stress_Token_Token__int_trace_s0
    mov edx, pulsec_app_stress_Token_Token__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_app_stress_Token_v]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_app_stress_Token_Token__int_epilogue
pulsec_app_stress_Token_Token__int_epilogue:
pulsec_app_stress_Token_Token__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_app_stress_Token_Token__int endp

pulsec_app_stress_Token_value proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_app_stress_Token_value_b0:
    lea rcx, pulsec_app_stress_Token_value_trace_s0
    mov edx, pulsec_app_stress_Token_value_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_app_stress_Token_v]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_app_stress_Token_value_epilogue
pulsec_app_stress_Token_value_epilogue:
pulsec_app_stress_Token_value_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_app_stress_Token_value endp

end
