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
extrn pulsec_com_pulse_lang_String_valueOf__int:proc
extrn pulsec_rt_parseInt:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Integer dd 0
pulsec_fld_com_pulse_lang_Integer_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_Integer_MAX_VALUE dd 2147483647
trace_m0 db "com.pulse.lang.Integer.valueOf"
trace_m0_len equ 30
pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0 db "com.pulse.lang.Integer.valueOf(Integer.pulse:24)"
pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0_len equ 48
trace_m2 db "com.pulse.lang.Integer.parse"
trace_m2_len equ 28
pulsec_com_pulse_lang_Integer_parse__String_trace_s0 db "com.pulse.lang.Integer.parse(Integer.pulse:32)"
pulsec_com_pulse_lang_Integer_parse__String_trace_s0_len equ 46
trace_m4 db "com.pulse.lang.Integer.intValue"
trace_m4_len equ 31
pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0 db "com.pulse.lang.Integer.intValue(Integer.pulse:40)"
pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0_len equ 49
trace_m6 db "com.pulse.lang.Integer.equals"
trace_m6_len equ 29
pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0 db "com.pulse.lang.Integer.equals(Integer.pulse:48)"
pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0_len equ 47
trace_m8 db "com.pulse.lang.Integer.compare"
trace_m8_len equ 30
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0 db "com.pulse.lang.Integer.compare(Integer.pulse:56)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len equ 48
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1 db "com.pulse.lang.Integer.compare(Integer.pulse:57)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1_len equ 48
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2 db "com.pulse.lang.Integer.compare(Integer.pulse:59)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len equ 48
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3 db "com.pulse.lang.Integer.compare(Integer.pulse:60)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3_len equ 48
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4 db "com.pulse.lang.Integer.compare(Integer.pulse:62)"
pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4_len equ 48
trace_m14 db "com.pulse.lang.Integer.toString"
trace_m14_len equ 31
pulsec_com_pulse_lang_Integer_toString__int_trace_s0 db "com.pulse.lang.Integer.toString(Integer.pulse:70)"
pulsec_com_pulse_lang_Integer_toString__int_trace_s0_len equ 49

.code
pulsec_com_pulse_lang_Integer_valueOf__int proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Integer_valueOf__int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_valueOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_valueOf__int_epilogue
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue:
pulsec_com_pulse_lang_Integer_valueOf__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Integer_valueOf__int endp

pulsec_com_pulse_lang_Integer_parse__String proc
    sub rsp, 184
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
pulsec_com_pulse_lang_Integer_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
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
    mov qword ptr [rsp+112], rax
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_Integer_parse__String endp

pulsec_com_pulse_lang_Integer_intValue__Integer proc
    sub rsp, 184
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
pulsec_com_pulse_lang_Integer_intValue__Integer_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_intValue__Integer_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue:
pulsec_com_pulse_lang_Integer_intValue__Integer_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Integer_intValue__Integer endp

pulsec_com_pulse_lang_Integer_equals__int_int proc
    sub rsp, 200
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
pulsec_com_pulse_lang_Integer_equals__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_equals__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_Integer_equals__int_int endp

pulsec_com_pulse_lang_Integer_compare__int_int proc
    sub rsp, 216
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
pulsec_com_pulse_lang_Integer_compare__int_int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b2:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b3
pulsec_com_pulse_lang_Integer_compare__int_int_b3:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_b5:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_b6
pulsec_com_pulse_lang_Integer_compare__int_int_b6:
    lea rcx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4
    mov edx, pulsec_com_pulse_lang_Integer_compare__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Integer_compare__int_int_epilogue
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue:
pulsec_com_pulse_lang_Integer_compare__int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_Integer_compare__int_int endp

pulsec_com_pulse_lang_Integer_toString__int proc
    sub rsp, 184
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
pulsec_com_pulse_lang_Integer_toString__int_b0:
    lea rcx, pulsec_com_pulse_lang_Integer_toString__int_trace_s0
    mov edx, pulsec_com_pulse_lang_Integer_toString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_Integer_toString__int_epilogue
pulsec_com_pulse_lang_Integer_toString__int_epilogue:
pulsec_com_pulse_lang_Integer_toString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Integer_toString__int endp

end
