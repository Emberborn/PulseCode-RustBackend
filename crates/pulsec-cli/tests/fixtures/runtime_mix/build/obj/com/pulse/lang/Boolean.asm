option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_rt_parseBoolean:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Boolean dd 0
pulsec_fld_com_pulse_lang_Boolean_TRUE dq 0
pulsec_fld_com_pulse_lang_Boolean_FALSE dq 0
trace_m0 db "com.pulse.lang.Boolean.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0 db "com.pulse.lang.Boolean.valueOf(Boolean.pulse:24)"
pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0
trace_m2 db "com.pulse.lang.Boolean.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Boolean_parse__String_trace_s0 db "com.pulse.lang.Boolean.parse(Boolean.pulse:32)"
pulsec_com_pulse_lang_Boolean_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_parse__String_trace_s0
trace_m4 db "com.pulse.lang.Boolean.booleanValue"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0 db "com.pulse.lang.Boolean.booleanValue(Boolean.pulse:40)"
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0
trace_m6 db "com.pulse.lang.Boolean.equals"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0 db "com.pulse.lang.Boolean.equals(Boolean.pulse:48)"
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0
trace_m8 db "com.pulse.lang.Boolean.compare"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0 db "com.pulse.lang.Boolean.compare(Boolean.pulse:56)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1 db "com.pulse.lang.Boolean.compare(Boolean.pulse:57)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2 db "com.pulse.lang.Boolean.compare(Boolean.pulse:59)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3 db "com.pulse.lang.Boolean.compare(Boolean.pulse:60)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4 db "com.pulse.lang.Boolean.compare(Boolean.pulse:62)"
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4_len equ $ - pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4
trace_m14 db "com.pulse.lang.Boolean.toString"
trace_m14_len equ $ - trace_m14
pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0 db "com.pulse.lang.Boolean.toString(Boolean.pulse:70)"
pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0

.code
pulsec_com_pulse_lang_Boolean_valueOf__boolean proc
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
pulsec_com_pulse_lang_Boolean_valueOf__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_valueOf__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue
pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue:
pulsec_com_pulse_lang_Boolean_valueOf__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_valueOf__boolean endp

pulsec_com_pulse_lang_Boolean_parse__String proc
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
pulsec_com_pulse_lang_Boolean_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseBoolean
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_Boolean_valueOf__boolean
    jmp pulsec_com_pulse_lang_Boolean_parse__String_epilogue
pulsec_com_pulse_lang_Boolean_parse__String_epilogue:
pulsec_com_pulse_lang_Boolean_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_parse__String endp

pulsec_com_pulse_lang_Boolean_booleanValue__Boolean proc
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
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue:
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_booleanValue__Boolean endp

pulsec_com_pulse_lang_Boolean_equals__boolean_boolean proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue:
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Boolean_equals__boolean_boolean endp

pulsec_com_pulse_lang_Boolean_compare__boolean_boolean proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b1
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b2
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b1:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b2:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b3:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b4:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b5:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_b6:
    lea rcx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4
    mov edx, pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue:
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Boolean_compare__boolean_boolean endp

pulsec_com_pulse_lang_Boolean_toString__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Boolean_toString__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_Boolean_toString__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    jmp pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue
pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue:
pulsec_com_pulse_lang_Boolean_toString__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Boolean_toString__boolean endp

end
