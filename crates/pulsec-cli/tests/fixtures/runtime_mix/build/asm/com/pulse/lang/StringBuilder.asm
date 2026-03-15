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
extrn pulsec_com_pulse_lang_String_charAt__int:proc
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_com_pulse_lang_String_substring__int:proc
extrn pulsec_com_pulse_lang_String_substring__int_int:proc
extrn pulsec_com_pulse_lang_String_valueOf__Object:proc
extrn pulsec_com_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_com_pulse_lang_String_valueOf__char:proc
extrn pulsec_com_pulse_lang_String_valueOf__double:proc
extrn pulsec_com_pulse_lang_String_valueOf__float:proc
extrn pulsec_com_pulse_lang_String_valueOf__int:proc

public pulsec_fld_com_pulse_lang_StringBuilder_value
public pulsec_fld_com_pulse_lang_StringBuilder_value_heap_owned

.data
written dq 0
pulsec_objc_com_pulse_lang_StringBuilder dd 0
pulsec_fcap_com_pulse_lang_StringBuilder dd 63
pulsec_fld_com_pulse_lang_StringBuilder_value_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_StringBuilder_value dq pulsec_fld_com_pulse_lang_StringBuilder_value_tbl
pulsec_fld_com_pulse_lang_StringBuilder_value_heap_owned dd 0
trace_m0 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m0_len equ 42
pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0 db "com.pulse.lang.StringBuilder.StringBuilder(StringBuilder.pulse:14)"
pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0_len equ 66
trace_m2 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m2_len equ 42
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0 db "com.pulse.lang.StringBuilder.StringBuilder(StringBuilder.pulse:22)"
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0_len equ 66
trace_m4 db "com.pulse.lang.StringBuilder.append"
trace_m4_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:30)"
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:31)"
pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1_len equ 59
trace_m7 db "com.pulse.lang.StringBuilder.append"
trace_m7_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:39)"
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:40)"
pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1_len equ 59
trace_m10 db "com.pulse.lang.StringBuilder.append"
trace_m10_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:48)"
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:49)"
pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1_len equ 59
trace_m13 db "com.pulse.lang.StringBuilder.append"
trace_m13_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:57)"
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:58)"
pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1_len equ 59
trace_m16 db "com.pulse.lang.StringBuilder.append"
trace_m16_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__float_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:66)"
pulsec_com_pulse_lang_StringBuilder_append__float_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__float_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:67)"
pulsec_com_pulse_lang_StringBuilder_append__float_trace_s1_len equ 59
trace_m19 db "com.pulse.lang.StringBuilder.append"
trace_m19_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__double_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:75)"
pulsec_com_pulse_lang_StringBuilder_append__double_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__double_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:76)"
pulsec_com_pulse_lang_StringBuilder_append__double_trace_s1_len equ 59
trace_m22 db "com.pulse.lang.StringBuilder.append"
trace_m22_len equ 35
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:85)"
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0_len equ 59
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1 db "com.pulse.lang.StringBuilder.append(StringBuilder.pulse:86)"
pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1_len equ 59
trace_m25 db "com.pulse.lang.StringBuilder.length"
trace_m25_len equ 35
pulsec_com_pulse_lang_StringBuilder_length_trace_s0 db "com.pulse.lang.StringBuilder.length(StringBuilder.pulse:94)"
pulsec_com_pulse_lang_StringBuilder_length_trace_s0_len equ 59
trace_m27 db "com.pulse.lang.StringBuilder.charAt"
trace_m27_len equ 35
pulsec_com_pulse_lang_StringBuilder_charAt__int_trace_s0 db "com.pulse.lang.StringBuilder.charAt(StringBuilder.pulse:102)"
pulsec_com_pulse_lang_StringBuilder_charAt__int_trace_s0_len equ 60
trace_m29 db "com.pulse.lang.StringBuilder.subSequence"
trace_m29_len equ 40
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_trace_s0 db "com.pulse.lang.StringBuilder.subSequence(StringBuilder.pulse:110)"
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_trace_s0_len equ 65
trace_m31 db "com.pulse.lang.StringBuilder.clear"
trace_m31_len equ 34
pulsec_com_pulse_lang_StringBuilder_clear_trace_s0 db "com.pulse.lang.StringBuilder.clear(StringBuilder.pulse:118)"
pulsec_com_pulse_lang_StringBuilder_clear_trace_s0_len equ 59
trace_m33 db "com.pulse.lang.StringBuilder.insert"
trace_m33_len equ 35
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:126)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0_len equ 60
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:127)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1_len equ 60
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:128)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2_len equ 60
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:129)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s3_len equ 60
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4 db "com.pulse.lang.StringBuilder.insert(StringBuilder.pulse:130)"
pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4_len equ 60
trace_m39 db "com.pulse.lang.StringBuilder.delete"
trace_m39_len equ 35
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:138)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0_len equ 60
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:139)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1_len equ 60
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:140)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2_len equ 60
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3 db "com.pulse.lang.StringBuilder.delete(StringBuilder.pulse:141)"
pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3_len equ 60
trace_m44 db "com.pulse.lang.StringBuilder.setLength"
trace_m44_len equ 38
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:149)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:150)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:151)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s2_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:152)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s3_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:154)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s4_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:155)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s5_len equ 63
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6 db "com.pulse.lang.StringBuilder.setLength(StringBuilder.pulse:156)"
pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s6_len equ 63
trace_m52 db "com.pulse.lang.StringBuilder.toString"
trace_m52_len equ 37
pulsec_com_pulse_lang_StringBuilder_toString_trace_s0 db "com.pulse.lang.StringBuilder.toString(StringBuilder.pulse:165)"
pulsec_com_pulse_lang_StringBuilder_toString_trace_s0_len equ 62
msg0 db 0
msg0_len equ 0
msg1 db 0
msg1_len equ 0

.code
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
    and ecx, 4294967295
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
    and ecx, 4294967295
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
    sub rsp, 184
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
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+104]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_StringBuilder_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder endp

pulsec_com_pulse_lang_StringBuilder_StringBuilder__String proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov ecx, 37
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String endp

pulsec_com_pulse_lang_StringBuilder_append__String proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_StringBuilder_append__String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__String_epilogue
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__String endp

pulsec_com_pulse_lang_StringBuilder_append__int proc
    sub rsp, 200
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_StringBuilder_append__int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__int_epilogue
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__int endp

pulsec_com_pulse_lang_StringBuilder_append__boolean proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_StringBuilder_append__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__boolean_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__boolean endp

pulsec_com_pulse_lang_StringBuilder_append__char proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_StringBuilder_append__char_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__char_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__char_epilogue
pulsec_com_pulse_lang_StringBuilder_append__char_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__char endp

pulsec_com_pulse_lang_StringBuilder_append__float proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_StringBuilder_append__float_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__float_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_valueOf__float
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__float_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__float_epilogue
pulsec_com_pulse_lang_StringBuilder_append__float_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__float endp

pulsec_com_pulse_lang_StringBuilder_append__double proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_StringBuilder_append__double_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__double_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__double_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_valueOf__double
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__double_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__double_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__double_epilogue
pulsec_com_pulse_lang_StringBuilder_append__double_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__double_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__double endp

pulsec_com_pulse_lang_StringBuilder_append__Object proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_StringBuilder_append__Object_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
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
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_append__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue
pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_append__Object endp

pulsec_com_pulse_lang_StringBuilder_length proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_length_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_length_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_length_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+112], rdx
    mov qword ptr [rsp+120], r8
    mov qword ptr [rsp+128], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+112]
    mov r8, qword ptr [rsp+120]
    mov r9, qword ptr [rsp+128]
    call pulsec_com_pulse_lang_String_length
    jmp pulsec_com_pulse_lang_StringBuilder_length_epilogue
pulsec_com_pulse_lang_StringBuilder_length_epilogue:
pulsec_com_pulse_lang_StringBuilder_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_StringBuilder_length endp

pulsec_com_pulse_lang_StringBuilder_charAt__int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_StringBuilder_charAt__int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_charAt__int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_charAt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+128], r8
    mov qword ptr [rsp+136], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+120]
    mov r8, qword ptr [rsp+128]
    mov r9, qword ptr [rsp+136]
    call pulsec_com_pulse_lang_String_charAt__int
    jmp pulsec_com_pulse_lang_StringBuilder_charAt__int_epilogue
pulsec_com_pulse_lang_StringBuilder_charAt__int_epilogue:
pulsec_com_pulse_lang_StringBuilder_charAt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_charAt__int endp

pulsec_com_pulse_lang_StringBuilder_subSequence__int_int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    call pulsec_com_pulse_lang_String_substring__int_int
    jmp pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_epilogue
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_epilogue:
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_StringBuilder_subSequence__int_int endp

pulsec_com_pulse_lang_StringBuilder_clear proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_clear_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_clear_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_clear_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_StringBuilder_clear endp

pulsec_com_pulse_lang_StringBuilder_insert__int_String proc
    sub rsp, 216
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
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+96], r8
pulsec_com_pulse_lang_StringBuilder_insert__int_String_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_substring__int
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
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
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4
    mov edx, pulsec_com_pulse_lang_StringBuilder_insert__int_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue
pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue:
pulsec_com_pulse_lang_StringBuilder_insert__int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_StringBuilder_insert__int_String endp

pulsec_com_pulse_lang_StringBuilder_delete__int_int proc
    sub rsp, 216
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
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
pulsec_com_pulse_lang_StringBuilder_delete__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_substring__int
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3
    mov edx, pulsec_com_pulse_lang_StringBuilder_delete__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    jmp pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue
pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue:
pulsec_com_pulse_lang_StringBuilder_delete__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_StringBuilder_delete__int_int endp

pulsec_com_pulse_lang_StringBuilder_setLength__int proc
    sub rsp, 232
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
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
pulsec_com_pulse_lang_StringBuilder_setLength__int_b0:
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+152], rdx
    mov qword ptr [rsp+160], r8
    mov qword ptr [rsp+168], r9
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+152]
    mov r8, qword ptr [rsp+160]
    mov r9, qword ptr [rsp+168]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1
    mov edx, pulsec_com_pulse_lang_StringBuilder_setLength__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
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
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov qword ptr [rsp+152], rdx
    mov qword ptr [rsp+160], r8
    mov qword ptr [rsp+168], r9
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+152]
    mov r8, qword ptr [rsp+160]
    mov r9, qword ptr [rsp+168]
    call pulsec_com_pulse_lang_String_substring__int_int
    mov edx, dword ptr [rsp+72]
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
    mov eax, dword ptr [rsp+80]
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
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov qword ptr [rsp+152], rdx
    mov qword ptr [rsp+160], r8
    mov qword ptr [rsp+168], r9
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    mov rdx, qword ptr [rsp+152]
    mov r8, qword ptr [rsp+160]
    mov r9, qword ptr [rsp+168]
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+72]
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
    add rsp, 232
    ret
pulsec_com_pulse_lang_StringBuilder_setLength__int endp

pulsec_com_pulse_lang_StringBuilder_toString proc
    sub rsp, 184
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_StringBuilder_toString endp

end
