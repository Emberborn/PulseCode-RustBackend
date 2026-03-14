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
extrn pulsec_rt_parseInt:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Integer dd 0
trace_m0 db "com.pulse.lang.Integer.valueOf"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.Integer.parse"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.Integer.intValue"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.Integer.equals"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.Integer.compare"
trace_m4_len equ $ - trace_m4

.code
pulsec_com_pulse_lang_Integer_valueOf__int proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Integer_valueOf__int_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_valueOf__int_epilogue
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue:
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_valueOf__int endp

pulsec_com_pulse_lang_Integer_parse__String proc
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
pulsec_com_pulse_lang_Integer_parse__String_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseInt
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_valueOf__int
    jmp pulsec_com_pulse_lang_Integer_parse__String_epilogue
pulsec_com_pulse_lang_Integer_parse__String_epilogue:
pulsec_com_pulse_lang_Integer_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_parse__String endp

pulsec_com_pulse_lang_Integer_intValue__Integer proc
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
pulsec_com_pulse_lang_Integer_intValue__Integer_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue:
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Integer_intValue__Integer endp

pulsec_com_pulse_lang_Integer_equals__int_int proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_equals__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Integer_equals__int_int_epilogue
pulsec_com_pulse_lang_Integer_equals__int_int_epilogue:
pulsec_com_pulse_lang_Integer_equals__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Integer_equals__int_int endp

pulsec_com_pulse_lang_Integer_compare__int_int proc
    sub rsp, 152
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Integer_compare__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Integer_compare__int_int_b1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b2
pulsec_com_pulse_lang_Integer_compare__int_int_b1:
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b2:
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b3
pulsec_com_pulse_lang_Integer_compare__int_int_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Integer_compare__int_int_b4
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b5
pulsec_com_pulse_lang_Integer_compare__int_int_b4:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b5:
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b6
pulsec_com_pulse_lang_Integer_compare__int_int_b6:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue:
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Integer_compare__int_int endp

end
