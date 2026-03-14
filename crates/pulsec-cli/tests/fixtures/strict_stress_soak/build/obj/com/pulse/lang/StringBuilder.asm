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
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_com_pulse_lang_String_valueOf__boolean:proc
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
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.StringBuilder.append"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.StringBuilder.append"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.StringBuilder.append"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.lang.StringBuilder.length"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.lang.StringBuilder.clear"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.lang.StringBuilder.toString"
trace_m7_len equ $ - trace_m7
msg0 db 0
msg0_len equ $ - msg0
msg1 db 0
msg1_len equ $ - msg1

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
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    mov eax, dword ptr [rt_arc_refcounts_tbl+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    cmp dword ptr [rt_arc_kinds_tbl+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    mov eax, dword ptr [rt_arc_flags_tbl+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [rt_arc_flags_tbl+rcx*4], eax
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
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp dword ptr [rt_arc_kinds_tbl+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp dword ptr [rt_arc_refcounts_tbl+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp dword ptr [rt_arc_flags_tbl+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    mov dword ptr [rt_arc_flags_tbl+rcx*4], 0
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
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 36
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+104]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder_b0:
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
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder endp

pulsec_com_pulse_lang_StringBuilder_StringBuilder__String proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 36
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_b0:
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__String_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
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
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__int_b0:
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_StringBuilder_append__boolean_b0:
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

pulsec_com_pulse_lang_StringBuilder_length proc
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
pulsec_com_pulse_lang_StringBuilder_length_b0:
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
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_StringBuilder_clear_b0:
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
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_clear endp

pulsec_com_pulse_lang_StringBuilder_toString proc
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
pulsec_com_pulse_lang_StringBuilder_toString_b0:
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

end
