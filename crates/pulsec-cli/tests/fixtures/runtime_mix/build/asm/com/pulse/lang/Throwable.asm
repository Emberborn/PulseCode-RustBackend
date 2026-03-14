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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_rt_panic:proc

public pulsec_fld_com_pulse_lang_Throwable_typeName
public pulsec_fld_com_pulse_lang_Throwable_typeName_heap_owned
public pulsec_fld_com_pulse_lang_Throwable_message
public pulsec_fld_com_pulse_lang_Throwable_message_heap_owned
public pulsec_fld_com_pulse_lang_Throwable_cause
public pulsec_fld_com_pulse_lang_Throwable_cause_heap_owned

.data
written dq 0
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
trace_m0 db "com.pulse.lang.Throwable.Throwable"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Throwable_Throwable_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:17)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:18)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:19)"
pulsec_com_pulse_lang_Throwable_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable_trace_s2
trace_m4 db "com.pulse.lang.Throwable.Throwable"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:27)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:28)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:29)"
pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_trace_s2
trace_m8 db "com.pulse.lang.Throwable.Throwable"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:37)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:38)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2 db "com.pulse.lang.Throwable.Throwable(Throwable.pulse:39)"
pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_Throwable__String_Throwable_trace_s2
trace_m12 db "com.pulse.lang.Throwable.initThrowableState"
trace_m12_len equ $ - trace_m12
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:47)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:48)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2 db "com.pulse.lang.Throwable.initThrowableState(Throwable.pulse:49)"
pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2_len equ $ - pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2
trace_m16 db "com.pulse.lang.Throwable.getMessage"
trace_m16_len equ $ - trace_m16
pulsec_com_pulse_lang_Throwable_getMessage_trace_s0 db "com.pulse.lang.Throwable.getMessage(Throwable.pulse:57)"
pulsec_com_pulse_lang_Throwable_getMessage_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_getMessage_trace_s0
trace_m18 db "com.pulse.lang.Throwable.getCause"
trace_m18_len equ $ - trace_m18
pulsec_com_pulse_lang_Throwable_getCause_trace_s0 db "com.pulse.lang.Throwable.getCause(Throwable.pulse:65)"
pulsec_com_pulse_lang_Throwable_getCause_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_getCause_trace_s0
trace_m20 db "com.pulse.lang.Throwable.initCause"
trace_m20_len equ $ - trace_m20
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
trace_m27 db "com.pulse.lang.Throwable.formatThrowable"
trace_m27_len equ $ - trace_m27
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
trace_m33 db "com.pulse.lang.Throwable.describe"
trace_m33_len equ $ - trace_m33
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
trace_m41 db "com.pulse.lang.Throwable.toString"
trace_m41_len equ $ - trace_m41
pulsec_com_pulse_lang_Throwable_toString_trace_s0 db "com.pulse.lang.Throwable.toString(Throwable.pulse:116)"
pulsec_com_pulse_lang_Throwable_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Throwable_toString_trace_s0
msg0 db "Throwable"
msg0_len equ $ - msg0
msg1 db "Throwable"
msg1_len equ $ - msg1
msg2 db "Throwable"
msg2_len equ $ - msg2
msg3 db "Self-causation is not permitted"
msg3_len equ $ - msg3
msg4 db "Cause already initialized"
msg4_len equ $ - msg4
msg5 db ": "
msg5_len equ $ - msg5
msg6 db 10, 67, 97, 117, 115, 101, 100, 32, 98, 121, 58, 32
msg6_len equ $ - msg6

.code
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
    lea rcx, trace_m0
    mov edx, trace_m0_len
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
    lea rcx, msg0
    mov edx, msg0_len
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
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
    lea rcx, msg1
    mov edx, msg1_len
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
    lea rcx, trace_m8
    mov edx, trace_m8_len
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
    lea rcx, msg2
    mov edx, msg2_len
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
    lea rcx, trace_m12
    mov edx, trace_m12_len
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
    lea rcx, trace_m16
    mov edx, trace_m16_len
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
    lea rcx, trace_m18
    mov edx, trace_m18_len
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
    lea rcx, trace_m20
    mov edx, trace_m20_len
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
    lea rcx, msg3
    mov edx, msg3_len
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
    lea rcx, msg4
    mov edx, msg4_len
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
    lea rcx, trace_m27
    mov edx, trace_m27_len
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
    lea rcx, msg5
    mov edx, msg5_len
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
    lea rcx, trace_m33
    mov edx, trace_m33_len
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
    lea rcx, msg6
    mov edx, msg6_len
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
    lea rcx, trace_m41
    mov edx, trace_m41_len
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

end
