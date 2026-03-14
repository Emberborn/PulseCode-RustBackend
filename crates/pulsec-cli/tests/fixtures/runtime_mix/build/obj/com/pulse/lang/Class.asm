option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
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
extrn pulsec_rt_classPackageName:proc
extrn pulsec_rt_classSimpleName:proc

public pulsec_fld_com_pulse_lang_Class_name
public pulsec_fld_com_pulse_lang_Class_name_heap_owned

.data
written dq 0
pulsec_objc_com_pulse_lang_Class dd 0
pulsec_fcap_com_pulse_lang_Class dd 63
pulsec_fld_com_pulse_lang_Class_name_tbl dq 64 dup(0)
pulsec_fld_com_pulse_lang_Class_name dq pulsec_fld_com_pulse_lang_Class_name_tbl
pulsec_fld_com_pulse_lang_Class_name_heap_owned dd 0
trace_m0 db "com.pulse.lang.Class.Class"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Class_Class__String_trace_s0 db "com.pulse.lang.Class.Class(Class.pulse:14)"
pulsec_com_pulse_lang_Class_Class__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_Class__String_trace_s0
trace_m2 db "com.pulse.lang.Class.getName"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Class_getName_trace_s0 db "com.pulse.lang.Class.getName(Class.pulse:22)"
pulsec_com_pulse_lang_Class_getName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getName_trace_s0
trace_m4 db "com.pulse.lang.Class.getSimpleName"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Class_getSimpleName_trace_s0 db "com.pulse.lang.Class.getSimpleName(Class.pulse:30)"
pulsec_com_pulse_lang_Class_getSimpleName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getSimpleName_trace_s0
trace_m6 db "com.pulse.lang.Class.getPackageName"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_Class_getPackageName_trace_s0 db "com.pulse.lang.Class.getPackageName(Class.pulse:38)"
pulsec_com_pulse_lang_Class_getPackageName_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_getPackageName_trace_s0
trace_m8 db "com.pulse.lang.Class.toString"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_Class_toString_trace_s0 db "com.pulse.lang.Class.toString(Class.pulse:46)"
pulsec_com_pulse_lang_Class_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_toString_trace_s0
trace_m10 db "com.pulse.lang.Class.runtimeSimpleName"
trace_m10_len equ $ - trace_m10
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0 db "com.pulse.lang.Class.runtimeSimpleName(Class.pulse:54)"
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0
trace_m12 db "com.pulse.lang.Class.runtimePackageName"
trace_m12_len equ $ - trace_m12
pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0 db "com.pulse.lang.Class.runtimePackageName(Class.pulse:62)"
pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0
msg0 db 0
msg0_len equ $ - msg0
msg1 db 0
msg1_len equ $ - msg1

.code
pulsec_fcap_com_pulse_lang_Class_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_lang_Class]
    jbe pulsec_fcap_com_pulse_lang_Class_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_lang_Class]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Class_ensure_fail
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
    jz pulsec_fcap_com_pulse_lang_Class_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    xor esi, esi
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_lang_Class_name_heap_owned], 0
    je pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_lang_Class_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_lang_Class_name], r12
    mov dword ptr [pulsec_fld_com_pulse_lang_Class_name_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_lang_Class], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_lang_Class_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Class_ensure_alloc_fail:
pulsec_fcap_com_pulse_lang_Class_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_lang_Class_ensure endp

pulsec_fcap_com_pulse_lang_Class_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_com_pulse_lang_Class_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_com_pulse_lang_Class_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_teardown_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_teardown endp
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_scan_edges endp
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges_done:
    ret
pulsec_fcap_com_pulse_lang_Class_arc_invalidate_edges endp
pulsec_com_pulse_lang_Class_Class__String proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 10
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_lang_Class_ensure
    mov rax, qword ptr [rsp+112]
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Class_Class__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_Class__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_Class__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov qword ptr [r10+rdx*8], rax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Class_Class__String_epilogue
pulsec_com_pulse_lang_Class_Class__String_epilogue:
pulsec_com_pulse_lang_Class_Class__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Class_Class__String endp

pulsec_com_pulse_lang_Class_getName proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Class_getName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Class_getName_epilogue
pulsec_com_pulse_lang_Class_getName_epilogue:
pulsec_com_pulse_lang_Class_getName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getName endp

pulsec_com_pulse_lang_Class_getSimpleName proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Class_getSimpleName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getSimpleName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getSimpleName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_classSimpleName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Class_getSimpleName_epilogue
pulsec_com_pulse_lang_Class_getSimpleName_epilogue:
pulsec_com_pulse_lang_Class_getSimpleName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getSimpleName endp

pulsec_com_pulse_lang_Class_getPackageName proc
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
pulsec_com_pulse_lang_Class_getPackageName_b0:
    lea rcx, pulsec_com_pulse_lang_Class_getPackageName_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_getPackageName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_classPackageName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Class_getPackageName_epilogue
pulsec_com_pulse_lang_Class_getPackageName_epilogue:
pulsec_com_pulse_lang_Class_getPackageName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getPackageName endp

pulsec_com_pulse_lang_Class_toString proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_toString_b0:
    lea rcx, pulsec_com_pulse_lang_Class_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    jmp pulsec_com_pulse_lang_Class_toString_epilogue
pulsec_com_pulse_lang_Class_toString_epilogue:
pulsec_com_pulse_lang_Class_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_toString endp

pulsec_com_pulse_lang_Class_runtimeSimpleName__String proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_runtimeSimpleName__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue:
pulsec_com_pulse_lang_Class_runtimeSimpleName__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_runtimeSimpleName__String endp

pulsec_com_pulse_lang_Class_runtimePackageName__String proc
    sub rsp, 120
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Class_runtimePackageName__String_b0:
    lea rcx, pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Class_runtimePackageName__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue
pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue:
pulsec_com_pulse_lang_Class_runtimePackageName__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_runtimePackageName__String endp

end
