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
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
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
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_rt_panic:proc
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

public pulsec_fld_pulse_lang_Throwable_typeName
public pulsec_fld_pulse_lang_Throwable_typeName_heap_owned
public pulsec_fld_pulse_lang_Throwable_message
public pulsec_fld_pulse_lang_Throwable_message_heap_owned
public pulsec_fld_pulse_lang_Throwable_cause
public pulsec_fld_pulse_lang_Throwable_cause_heap_owned

.data
written dq 0
pulsec_objc_pulse_lang_Throwable dd 0
pulsec_fcap_pulse_lang_Throwable dd 63
pulsec_fld_pulse_lang_Throwable_typeName_tbl dq 64 dup(0)
pulsec_fld_pulse_lang_Throwable_typeName dq pulsec_fld_pulse_lang_Throwable_typeName_tbl
pulsec_fld_pulse_lang_Throwable_typeName_heap_owned dd 0
pulsec_fld_pulse_lang_Throwable_message_tbl dq 64 dup(0)
pulsec_fld_pulse_lang_Throwable_message dq pulsec_fld_pulse_lang_Throwable_message_tbl
pulsec_fld_pulse_lang_Throwable_message_heap_owned dd 0
pulsec_fld_pulse_lang_Throwable_cause_tbl dq 64 dup(0)
pulsec_fld_pulse_lang_Throwable_cause dq pulsec_fld_pulse_lang_Throwable_cause_tbl
pulsec_fld_pulse_lang_Throwable_cause_heap_owned dd 0
trace_m0 db "pulse.lang.Throwable.Throwable"
trace_m0_len equ 30
trace_m1 db "pulse.lang.Throwable.Throwable"
trace_m1_len equ 30
trace_m2 db "pulse.lang.Throwable.Throwable"
trace_m2_len equ 30
trace_m3 db "pulse.lang.Throwable.initThrowableState"
trace_m3_len equ 39
trace_m4 db "pulse.lang.Throwable.getMessage"
trace_m4_len equ 31
trace_m5 db "pulse.lang.Throwable.getCause"
trace_m5_len equ 29
trace_m6 db "pulse.lang.Throwable.initCause"
trace_m6_len equ 30
trace_m7 db "pulse.lang.Throwable.formatThrowable"
trace_m7_len equ 36
trace_m8 db "pulse.lang.Throwable.describe"
trace_m8_len equ 29
trace_m9 db "pulse.lang.Throwable.toString"
trace_m9_len equ 29
msg0 db "Throwable"
msg0_len equ 9
msg1 db "Throwable"
msg1_len equ 9
msg2 db "Throwable"
msg2_len equ 9
msg3 db "Self-causation is not permitted"
msg3_len equ 31
msg4 db "Cause already initialized"
msg4_len equ 25
msg5 db ": "
msg5_len equ 2
msg6 db 10, 67, 97, 117, 115, 101, 100, 32, 98, 121, 58, 32
msg6_len equ 12

.code
pulsec_fcap_pulse_lang_Throwable_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_lang_Throwable]
    jbe pulsec_fcap_pulse_lang_Throwable_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_lang_Throwable]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_ensure_fail
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
    jz pulsec_fcap_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    xor esi, esi
pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_lang_Throwable_typeName_heap_owned], 0
    je pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_lang_Throwable_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_lang_Throwable_typeName], r12
    mov dword ptr [pulsec_fld_pulse_lang_Throwable_typeName_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    xor esi, esi
pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_lang_Throwable_message_heap_owned], 0
    je pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_lang_Throwable_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_lang_Throwable_message], r12
    mov dword ptr [pulsec_fld_pulse_lang_Throwable_message_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    xor esi, esi
pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_copy_loop
pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_pulse_lang_Throwable_cause_heap_owned], 0
    je pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_lang_Throwable_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_pulse_lang_Throwable_cause], r12
    mov dword ptr [pulsec_fld_pulse_lang_Throwable_cause_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_lang_Throwable], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_lang_Throwable_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_Throwable_ensure_alloc_fail:
pulsec_fcap_pulse_lang_Throwable_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_Throwable_ensure endp

pulsec_fcap_pulse_lang_Throwable_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_2_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_lang_Throwable_arc_teardown_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_Throwable_arc_teardown_done:
    ret
pulsec_fcap_pulse_lang_Throwable_arc_teardown endp
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_lang_Throwable_arc_scan_edges endp
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_lang_Throwable_arc_invalidate_edges endp
pulsec_pulse_lang_Throwable_Throwable proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_lang_Throwable_Throwable_ctor_reuse
    mov ecx, 22
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_lang_Throwable_Throwable_ctor_ready
pulsec_pulse_lang_Throwable_Throwable_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_Throwable_Throwable_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_Throwable_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Throwable_Throwable_epilogue
pulsec_pulse_lang_Throwable_Throwable_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Throwable_Throwable_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Throwable_Throwable endp

pulsec_pulse_lang_Throwable_Throwable__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_lang_Throwable_Throwable__String_ctor_reuse
    mov ecx, 22
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_Throwable_Throwable__String_ctor_ready
pulsec_pulse_lang_Throwable_Throwable__String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_Throwable_Throwable__String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_Throwable__String_b0:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Throwable_Throwable__String_epilogue
pulsec_pulse_lang_Throwable_Throwable__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_Throwable_Throwable__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_Throwable_Throwable__String endp

pulsec_pulse_lang_Throwable_Throwable__String_Throwable proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_lang_Throwable_Throwable__String_Throwable_ctor_reuse
    mov ecx, 22
    call pulsec_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_Throwable_ensure
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_Throwable_Throwable__String_Throwable_ctor_ready
pulsec_pulse_lang_Throwable_Throwable__String_Throwable_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_Throwable_Throwable__String_Throwable_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_Throwable__String_Throwable_b0:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Throwable_Throwable__String_Throwable_epilogue
pulsec_pulse_lang_Throwable_Throwable__String_Throwable_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Throwable_Throwable__String_Throwable_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Throwable_Throwable__String_Throwable endp

pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue
pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_Throwable_initThrowableState__String_String_Throwable endp

pulsec_pulse_lang_Throwable_getMessage proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_getMessage_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Throwable_getMessage_epilogue
pulsec_pulse_lang_Throwable_getMessage_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Throwable_getMessage_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Throwable_getMessage endp

pulsec_pulse_lang_Throwable_getCause proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_getCause_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Throwable_getCause_epilogue
pulsec_pulse_lang_Throwable_getCause_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Throwable_getCause_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Throwable_getCause endp

pulsec_pulse_lang_Throwable_initCause__Throwable proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Throwable_initCause__Throwable_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Throwable_initCause__Throwable_b1
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b2
pulsec_pulse_lang_Throwable_initCause__Throwable_b1:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
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
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b3
pulsec_pulse_lang_Throwable_initCause__Throwable_b2:
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b3
pulsec_pulse_lang_Throwable_initCause__Throwable_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Throwable_initCause__Throwable_b4
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b5
pulsec_pulse_lang_Throwable_initCause__Throwable_b4:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
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
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b6
pulsec_pulse_lang_Throwable_initCause__Throwable_b5:
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_b6
pulsec_pulse_lang_Throwable_initCause__Throwable_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Throwable_initCause__Throwable_epilogue
pulsec_pulse_lang_Throwable_initCause__Throwable_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_Throwable_initCause__Throwable_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_lang_Throwable_initCause__Throwable endp

pulsec_pulse_lang_Throwable_formatThrowable__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_Throwable_formatThrowable__String_b0:
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je Throwable_formatThrowable_vd0_2_null
    call pulsec_pulse_lang_Throwable_getMessage
    jmp Throwable_formatThrowable_vd0_2_done
Throwable_formatThrowable_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_formatThrowable_vd0_2_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne Throwable_formatThrowable_ternary_then_1_12
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
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
    jne pulsec_pulse_lang_Throwable_formatThrowable__String_b1
    jmp pulsec_pulse_lang_Throwable_formatThrowable__String_b2
pulsec_pulse_lang_Throwable_formatThrowable__String_b1:
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Throwable_formatThrowable__String_epilogue
pulsec_pulse_lang_Throwable_formatThrowable__String_b2:
    jmp pulsec_pulse_lang_Throwable_formatThrowable__String_b3
pulsec_pulse_lang_Throwable_formatThrowable__String_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_lang_Throwable_formatThrowable__String_epilogue
pulsec_pulse_lang_Throwable_formatThrowable__String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_Throwable_formatThrowable__String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_lang_Throwable_formatThrowable__String endp

pulsec_pulse_lang_Throwable_describe proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_Throwable_describe_b0:
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je Throwable_describe_vd0_2_null
    call pulsec_pulse_lang_Throwable_toString
    jmp Throwable_describe_vd0_2_done
Throwable_describe_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd0_2_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je Throwable_describe_vd1_5_null
    call pulsec_pulse_lang_Throwable_getCause
    jmp Throwable_describe_vd1_5_done
Throwable_describe_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd1_5_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Throwable_describe_b1
    jmp pulsec_pulse_lang_Throwable_describe_b2
pulsec_pulse_lang_Throwable_describe_b1:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Throwable_describe_epilogue
pulsec_pulse_lang_Throwable_describe_b2:
    jmp pulsec_pulse_lang_Throwable_describe_b3
pulsec_pulse_lang_Throwable_describe_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je Throwable_describe_vd5_17_null
    call pulsec_pulse_lang_Throwable_describe
    jmp Throwable_describe_vd5_17_done
Throwable_describe_vd5_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_describe_vd5_17_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp pulsec_pulse_lang_Throwable_describe_epilogue
pulsec_pulse_lang_Throwable_describe_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_Throwable_describe_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_lang_Throwable_describe endp

pulsec_pulse_lang_Throwable_toString proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Throwable_toString_vd0_4_null
    call pulsec_pulse_lang_Throwable_formatThrowable__String
    jmp Throwable_toString_vd0_4_done
Throwable_toString_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_toString_vd0_4_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_Throwable_toString_epilogue
pulsec_pulse_lang_Throwable_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Throwable_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_Throwable_toString endp

pulsec_pulse_lang_Throwable_panic proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Throwable_panic_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Throwable_panic_vd0_4_null
    call pulsec_pulse_lang_Throwable_describe
    jmp Throwable_panic_vd0_4_done
Throwable_panic_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Throwable_panic_vd0_4_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    xor eax, eax
    jmp pulsec_pulse_lang_Throwable_panic_epilogue
pulsec_pulse_lang_Throwable_panic_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Throwable_panic_epilogue_post:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_Throwable_panic endp

end
