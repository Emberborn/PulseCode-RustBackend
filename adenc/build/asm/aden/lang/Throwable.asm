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
extrn adenc_rt_stringFromBytes:proc
extrn adenc_rt_consoleWrite:proc
extrn adenc_rt_panic:proc
extrn adenc_rt_dispatchNullReceiverPanic:proc
extrn adenc_rt_objectNew:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_concat__String:proc
extrn adenc_aden_lang_String_length:proc
extrn adenc_rt_panic:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MAX_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MAX_VALUE:proc

public adenc_fld_aden_lang_Throwable_typeName
public adenc_fld_aden_lang_Throwable_typeName_heap_owned
public adenc_fld_aden_lang_Throwable_message
public adenc_fld_aden_lang_Throwable_message_heap_owned
public adenc_fld_aden_lang_Throwable_cause
public adenc_fld_aden_lang_Throwable_cause_heap_owned

.data
written dq 0
adenc_objc_aden_lang_Throwable dd 0
adenc_fcap_aden_lang_Throwable dd 63
adenc_fld_aden_lang_Throwable_typeName_tbl dq 64 dup(0)
adenc_fld_aden_lang_Throwable_typeName dq adenc_fld_aden_lang_Throwable_typeName_tbl
adenc_fld_aden_lang_Throwable_typeName_heap_owned dd 0
adenc_fld_aden_lang_Throwable_message_tbl dq 64 dup(0)
adenc_fld_aden_lang_Throwable_message dq adenc_fld_aden_lang_Throwable_message_tbl
adenc_fld_aden_lang_Throwable_message_heap_owned dd 0
adenc_fld_aden_lang_Throwable_cause_tbl dq 64 dup(0)
adenc_fld_aden_lang_Throwable_cause dq adenc_fld_aden_lang_Throwable_cause_tbl
adenc_fld_aden_lang_Throwable_cause_heap_owned dd 0
trace_m0 db "aden.lang.Throwable.Throwable"
trace_m0_len equ 29
adenc_aden_lang_Throwable_Throwable_trace_s0 db "aden.lang.Throwable.Throwable(Throwable.aden:17)"
adenc_aden_lang_Throwable_Throwable_trace_s0_len equ 48
adenc_aden_lang_Throwable_Throwable_trace_s1 db "aden.lang.Throwable.Throwable(Throwable.aden:18)"
adenc_aden_lang_Throwable_Throwable_trace_s1_len equ 48
adenc_aden_lang_Throwable_Throwable_trace_s2 db "aden.lang.Throwable.Throwable(Throwable.aden:19)"
adenc_aden_lang_Throwable_Throwable_trace_s2_len equ 48
trace_m4 db "aden.lang.Throwable.Throwable"
trace_m4_len equ 29
adenc_aden_lang_Throwable_Throwable__String_trace_s0 db "aden.lang.Throwable.Throwable(Throwable.aden:27)"
adenc_aden_lang_Throwable_Throwable__String_trace_s0_len equ 48
adenc_aden_lang_Throwable_Throwable__String_trace_s1 db "aden.lang.Throwable.Throwable(Throwable.aden:28)"
adenc_aden_lang_Throwable_Throwable__String_trace_s1_len equ 48
adenc_aden_lang_Throwable_Throwable__String_trace_s2 db "aden.lang.Throwable.Throwable(Throwable.aden:29)"
adenc_aden_lang_Throwable_Throwable__String_trace_s2_len equ 48
trace_m8 db "aden.lang.Throwable.Throwable"
trace_m8_len equ 29
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s0 db "aden.lang.Throwable.Throwable(Throwable.aden:37)"
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s0_len equ 48
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s1 db "aden.lang.Throwable.Throwable(Throwable.aden:38)"
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s1_len equ 48
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s2 db "aden.lang.Throwable.Throwable(Throwable.aden:39)"
adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s2_len equ 48
trace_m12 db "aden.lang.Throwable.initThrowableState"
trace_m12_len equ 38
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0 db "aden.lang.Throwable.initThrowableState(Throwable.aden:47)"
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0_len equ 57
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1 db "aden.lang.Throwable.initThrowableState(Throwable.aden:48)"
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1_len equ 57
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2 db "aden.lang.Throwable.initThrowableState(Throwable.aden:49)"
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2_len equ 57
trace_m16 db "aden.lang.Throwable.getMessage"
trace_m16_len equ 30
adenc_aden_lang_Throwable_getMessage_trace_s0 db "aden.lang.Throwable.getMessage(Throwable.aden:57)"
adenc_aden_lang_Throwable_getMessage_trace_s0_len equ 49
trace_m18 db "aden.lang.Throwable.getCause"
trace_m18_len equ 28
adenc_aden_lang_Throwable_getCause_trace_s0 db "aden.lang.Throwable.getCause(Throwable.aden:65)"
adenc_aden_lang_Throwable_getCause_trace_s0_len equ 47
trace_m20 db "aden.lang.Throwable.initCause"
trace_m20_len equ 29
adenc_aden_lang_Throwable_initCause__Throwable_trace_s0 db "aden.lang.Throwable.initCause(Throwable.aden:73)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s0_len equ 48
adenc_aden_lang_Throwable_initCause__Throwable_trace_s1 db "aden.lang.Throwable.initCause(Throwable.aden:74)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s1_len equ 48
adenc_aden_lang_Throwable_initCause__Throwable_trace_s2 db "aden.lang.Throwable.initCause(Throwable.aden:76)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s2_len equ 48
adenc_aden_lang_Throwable_initCause__Throwable_trace_s3 db "aden.lang.Throwable.initCause(Throwable.aden:77)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s3_len equ 48
adenc_aden_lang_Throwable_initCause__Throwable_trace_s4 db "aden.lang.Throwable.initCause(Throwable.aden:79)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s4_len equ 48
adenc_aden_lang_Throwable_initCause__Throwable_trace_s5 db "aden.lang.Throwable.initCause(Throwable.aden:80)"
adenc_aden_lang_Throwable_initCause__Throwable_trace_s5_len equ 48
trace_m27 db "aden.lang.Throwable.formatThrowable"
trace_m27_len equ 35
adenc_aden_lang_Throwable_formatThrowable__String_trace_s0 db "aden.lang.Throwable.formatThrowable(Throwable.aden:88)"
adenc_aden_lang_Throwable_formatThrowable__String_trace_s0_len equ 54
adenc_aden_lang_Throwable_formatThrowable__String_trace_s1 db "aden.lang.Throwable.formatThrowable(Throwable.aden:89)"
adenc_aden_lang_Throwable_formatThrowable__String_trace_s1_len equ 54
adenc_aden_lang_Throwable_formatThrowable__String_trace_s2 db "aden.lang.Throwable.formatThrowable(Throwable.aden:90)"
adenc_aden_lang_Throwable_formatThrowable__String_trace_s2_len equ 54
adenc_aden_lang_Throwable_formatThrowable__String_trace_s3 db "aden.lang.Throwable.formatThrowable(Throwable.aden:92)"
adenc_aden_lang_Throwable_formatThrowable__String_trace_s3_len equ 54
adenc_aden_lang_Throwable_formatThrowable__String_trace_s4 db "aden.lang.Throwable.formatThrowable(Throwable.aden:93)"
adenc_aden_lang_Throwable_formatThrowable__String_trace_s4_len equ 54
trace_m33 db "aden.lang.Throwable.describe"
trace_m33_len equ 28
adenc_aden_lang_Throwable_describe_trace_s0 db "aden.lang.Throwable.describe(Throwable.aden:101)"
adenc_aden_lang_Throwable_describe_trace_s0_len equ 48
adenc_aden_lang_Throwable_describe_trace_s1 db "aden.lang.Throwable.describe(Throwable.aden:102)"
adenc_aden_lang_Throwable_describe_trace_s1_len equ 48
adenc_aden_lang_Throwable_describe_trace_s2 db "aden.lang.Throwable.describe(Throwable.aden:103)"
adenc_aden_lang_Throwable_describe_trace_s2_len equ 48
adenc_aden_lang_Throwable_describe_trace_s3 db "aden.lang.Throwable.describe(Throwable.aden:104)"
adenc_aden_lang_Throwable_describe_trace_s3_len equ 48
adenc_aden_lang_Throwable_describe_trace_s4 db "aden.lang.Throwable.describe(Throwable.aden:106)"
adenc_aden_lang_Throwable_describe_trace_s4_len equ 48
adenc_aden_lang_Throwable_describe_trace_s5 db "aden.lang.Throwable.describe(Throwable.aden:107)"
adenc_aden_lang_Throwable_describe_trace_s5_len equ 48
adenc_aden_lang_Throwable_describe_trace_s6 db "aden.lang.Throwable.describe(Throwable.aden:108)"
adenc_aden_lang_Throwable_describe_trace_s6_len equ 48
trace_m41 db "aden.lang.Throwable.toString"
trace_m41_len equ 28
adenc_aden_lang_Throwable_toString_trace_s0 db "aden.lang.Throwable.toString(Throwable.aden:116)"
adenc_aden_lang_Throwable_toString_trace_s0_len equ 48
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
adenc_fcap_aden_lang_Throwable_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_lang_Throwable]
    jbe adenc_fcap_aden_lang_Throwable_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_lang_Throwable]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_ensure_fail
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
    jz adenc_fcap_aden_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    xor esi, esi
adenc_fcap_aden_lang_Throwable_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_lang_Throwable_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_lang_Throwable_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_lang_Throwable_ensure_field_0_done_copy_loop
adenc_fcap_aden_lang_Throwable_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_lang_Throwable_typeName_heap_owned], 0
    je adenc_fcap_aden_lang_Throwable_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_lang_Throwable_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_lang_Throwable_typeName], r12
    mov dword ptr [adenc_fld_aden_lang_Throwable_typeName_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_lang_Throwable_message]
    xor esi, esi
adenc_fcap_aden_lang_Throwable_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_lang_Throwable_ensure_field_1_done
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_lang_Throwable_ensure_field_1_done_next:
    add esi, 1
    jmp adenc_fcap_aden_lang_Throwable_ensure_field_1_done_copy_loop
adenc_fcap_aden_lang_Throwable_ensure_field_1_done:
    cmp dword ptr [adenc_fld_aden_lang_Throwable_message_heap_owned], 0
    je adenc_fcap_aden_lang_Throwable_ensure_field_1_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_lang_Throwable_ensure_field_1_done_commit:
    mov qword ptr [adenc_fld_aden_lang_Throwable_message], r12
    mov dword ptr [adenc_fld_aden_lang_Throwable_message_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    xor esi, esi
adenc_fcap_aden_lang_Throwable_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_lang_Throwable_ensure_field_2_done
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_lang_Throwable_ensure_field_2_done_next:
    add esi, 1
    jmp adenc_fcap_aden_lang_Throwable_ensure_field_2_done_copy_loop
adenc_fcap_aden_lang_Throwable_ensure_field_2_done:
    cmp dword ptr [adenc_fld_aden_lang_Throwable_cause_heap_owned], 0
    je adenc_fcap_aden_lang_Throwable_ensure_field_2_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_lang_Throwable_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_lang_Throwable_ensure_field_2_done_commit:
    mov qword ptr [adenc_fld_aden_lang_Throwable_cause], r12
    mov dword ptr [adenc_fld_aden_lang_Throwable_cause_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_lang_Throwable], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_lang_Throwable_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_lang_Throwable_ensure_alloc_fail:
adenc_fcap_aden_lang_Throwable_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_lang_Throwable_ensure endp

adenc_fcap_aden_lang_Throwable_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_lang_Throwable_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_arc_teardown_field_1_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_lang_Throwable_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_lang_Throwable_arc_teardown_field_2_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_lang_Throwable_arc_teardown_field_2_skip:
    add rsp, 40
adenc_fcap_aden_lang_Throwable_arc_teardown_done:
    ret
adenc_fcap_aden_lang_Throwable_arc_teardown endp
adenc_fcap_aden_lang_Throwable_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_lang_Throwable_arc_scan_edges_field_2_skip:
    add rsp, 40
adenc_fcap_aden_lang_Throwable_arc_scan_edges_done:
    ret
adenc_fcap_aden_lang_Throwable_arc_scan_edges endp
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_field_2_skip:
    add rsp, 40
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges_done:
    ret
adenc_fcap_aden_lang_Throwable_arc_invalidate_edges endp
adenc_aden_lang_Throwable_Throwable proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_Throwable_Throwable_ctor_reuse
    mov ecx, 32
    call adenc_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_fcap_aden_lang_Throwable_ensure
    mov rax, qword ptr [rsp+104]
    jmp adenc_aden_lang_Throwable_Throwable_ctor_ready
adenc_aden_lang_Throwable_Throwable_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_Throwable_Throwable_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_Throwable_b0:
    lea rcx, adenc_aden_lang_Throwable_Throwable_trace_s0
    mov edx, adenc_aden_lang_Throwable_Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_Throwable_trace_s1
    mov edx, adenc_aden_lang_Throwable_Throwable_trace_s1_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    lea rcx, adenc_aden_lang_Throwable_Throwable_trace_s2
    mov edx, adenc_aden_lang_Throwable_Throwable_trace_s2_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Throwable_Throwable_epilogue
adenc_aden_lang_Throwable_Throwable_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Throwable_Throwable_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Throwable_Throwable endp

adenc_aden_lang_Throwable_Throwable__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_Throwable_Throwable__String_ctor_reuse
    mov ecx, 32
    call adenc_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_fcap_aden_lang_Throwable_ensure
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Throwable_Throwable__String_ctor_ready
adenc_aden_lang_Throwable_Throwable__String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_Throwable_Throwable__String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_Throwable__String_b0:
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_trace_s0
    mov edx, adenc_aden_lang_Throwable_Throwable__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_trace_s1
    mov edx, adenc_aden_lang_Throwable_Throwable__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_trace_s2
    mov edx, adenc_aden_lang_Throwable_Throwable__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Throwable_Throwable__String_epilogue
adenc_aden_lang_Throwable_Throwable__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_lang_Throwable_Throwable__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_lang_Throwable_Throwable__String endp

adenc_aden_lang_Throwable_Throwable__String_Throwable proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_Throwable_Throwable__String_Throwable_ctor_reuse
    mov ecx, 32
    call adenc_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_fcap_aden_lang_Throwable_ensure
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_lang_Throwable_Throwable__String_Throwable_ctor_ready
adenc_aden_lang_Throwable_Throwable__String_Throwable_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_Throwable_Throwable__String_Throwable_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_Throwable__String_Throwable_b0:
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s0
    mov edx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s1
    mov edx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s2
    mov edx, adenc_aden_lang_Throwable_Throwable__String_Throwable_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Throwable_Throwable__String_Throwable_epilogue
adenc_aden_lang_Throwable_Throwable__String_Throwable_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Throwable_Throwable__String_Throwable_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Throwable_Throwable__String_Throwable endp

adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_b0:
    lea rcx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0
    mov edx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1
    mov edx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2
    mov edx, adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_epilogue
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable endp

adenc_aden_lang_Throwable_getMessage proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_getMessage_b0:
    lea rcx, adenc_aden_lang_Throwable_getMessage_trace_s0
    mov edx, adenc_aden_lang_Throwable_getMessage_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_message]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Throwable_getMessage_epilogue
adenc_aden_lang_Throwable_getMessage_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Throwable_getMessage_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Throwable_getMessage endp

adenc_aden_lang_Throwable_getCause proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_getCause_b0:
    lea rcx, adenc_aden_lang_Throwable_getCause_trace_s0
    mov edx, adenc_aden_lang_Throwable_getCause_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Throwable_getCause_epilogue
adenc_aden_lang_Throwable_getCause_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Throwable_getCause_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Throwable_getCause endp

adenc_aden_lang_Throwable_initCause__Throwable proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Throwable_initCause__Throwable_b0:
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s0
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Throwable_initCause__Throwable_b1
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b2
adenc_aden_lang_Throwable_initCause__Throwable_b1:
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s1
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s0
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b3
adenc_aden_lang_Throwable_initCause__Throwable_b2:
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b3
adenc_aden_lang_Throwable_initCause__Throwable_b3:
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s2
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Throwable_initCause__Throwable_b4
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b5
adenc_aden_lang_Throwable_initCause__Throwable_b4:
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s3
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s3_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s2
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b6
adenc_aden_lang_Throwable_initCause__Throwable_b5:
    jmp adenc_aden_lang_Throwable_initCause__Throwable_b6
adenc_aden_lang_Throwable_initCause__Throwable_b6:
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s4
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_cause]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s5
    mov edx, adenc_aden_lang_Throwable_initCause__Throwable_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Throwable_initCause__Throwable_epilogue
adenc_aden_lang_Throwable_initCause__Throwable_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_Throwable_initCause__Throwable_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_aden_lang_Throwable_initCause__Throwable endp

adenc_aden_lang_Throwable_formatThrowable__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_lang_Throwable_formatThrowable__String_b0:
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s0
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je Throwable_formatThrowable_vd0_2_null
    call adenc_aden_lang_Throwable_getMessage
    jmp Throwable_formatThrowable_vd0_2_done
Throwable_formatThrowable_vd0_2_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_formatThrowable_vd0_2_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s1
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s1_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_length
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
    jne adenc_aden_lang_Throwable_formatThrowable__String_b1
    jmp adenc_aden_lang_Throwable_formatThrowable__String_b2
adenc_aden_lang_Throwable_formatThrowable__String_b1:
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s2
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Throwable_formatThrowable__String_epilogue
adenc_aden_lang_Throwable_formatThrowable__String_b2:
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s1
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Throwable_formatThrowable__String_b3
adenc_aden_lang_Throwable_formatThrowable__String_b3:
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s3
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s4
    mov edx, adenc_aden_lang_Throwable_formatThrowable__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp adenc_aden_lang_Throwable_formatThrowable__String_epilogue
adenc_aden_lang_Throwable_formatThrowable__String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
adenc_aden_lang_Throwable_formatThrowable__String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
adenc_aden_lang_Throwable_formatThrowable__String endp

adenc_aden_lang_Throwable_describe proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_lang_Throwable_describe_b0:
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s0
    mov edx, adenc_aden_lang_Throwable_describe_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je Throwable_describe_vd0_2_null
    call adenc_aden_lang_Throwable_toString
    jmp Throwable_describe_vd0_2_done
Throwable_describe_vd0_2_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_describe_vd0_2_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s1
    mov edx, adenc_aden_lang_Throwable_describe_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je Throwable_describe_vd1_5_null
    call adenc_aden_lang_Throwable_getCause
    jmp Throwable_describe_vd1_5_done
Throwable_describe_vd1_5_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_describe_vd1_5_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s2
    mov edx, adenc_aden_lang_Throwable_describe_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Throwable_describe_b1
    jmp adenc_aden_lang_Throwable_describe_b2
adenc_aden_lang_Throwable_describe_b1:
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s3
    mov edx, adenc_aden_lang_Throwable_describe_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Throwable_describe_epilogue
adenc_aden_lang_Throwable_describe_b2:
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s2
    mov edx, adenc_aden_lang_Throwable_describe_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Throwable_describe_b3
adenc_aden_lang_Throwable_describe_b3:
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s4
    mov edx, adenc_aden_lang_Throwable_describe_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s5
    mov edx, adenc_aden_lang_Throwable_describe_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je Throwable_describe_vd5_17_null
    call adenc_aden_lang_Throwable_describe
    jmp Throwable_describe_vd5_17_done
Throwable_describe_vd5_17_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_describe_vd5_17_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_Throwable_describe_trace_s6
    mov edx, adenc_aden_lang_Throwable_describe_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp adenc_aden_lang_Throwable_describe_epilogue
adenc_aden_lang_Throwable_describe_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
adenc_aden_lang_Throwable_describe_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
adenc_aden_lang_Throwable_describe endp

adenc_aden_lang_Throwable_toString proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Throwable_toString_b0:
    lea rcx, adenc_aden_lang_Throwable_toString_trace_s0
    mov edx, adenc_aden_lang_Throwable_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Throwable_typeName]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Throwable_toString_vd0_4_null
    call adenc_aden_lang_Throwable_formatThrowable__String
    jmp Throwable_toString_vd0_4_done
Throwable_toString_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_toString_vd0_4_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Throwable_toString_epilogue
adenc_aden_lang_Throwable_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Throwable_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_Throwable_toString endp

adenc_aden_lang_Throwable_panic proc
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
adenc_aden_lang_Throwable_panic_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Throwable_panic_vd0_4_null
    call adenc_aden_lang_Throwable_describe
    jmp Throwable_panic_vd0_4_done
Throwable_panic_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
Throwable_panic_vd0_4_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    xor eax, eax
    jmp adenc_aden_lang_Throwable_panic_epilogue
adenc_aden_lang_Throwable_panic_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Throwable_panic_epilogue_post:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
adenc_aden_lang_Throwable_panic endp

end
