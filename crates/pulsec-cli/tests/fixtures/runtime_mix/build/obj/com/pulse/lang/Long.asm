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
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_longToString:proc
extrn pulsec_rt_parseLong:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Long dd 0
pulsec_fld_com_pulse_lang_Long_MIN_VALUE dq 0
pulsec_fld_com_pulse_lang_Long_MAX_VALUE dq 0
trace_m0 db "com.pulse.lang.Long.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Long_valueOf__long_trace_s0 db "com.pulse.lang.Long.valueOf(Long.pulse:24)"
pulsec_com_pulse_lang_Long_valueOf__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_valueOf__long_trace_s0
trace_m2 db "com.pulse.lang.Long.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Long_parse__String_trace_s0 db "com.pulse.lang.Long.parse(Long.pulse:32)"
pulsec_com_pulse_lang_Long_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_parse__String_trace_s0
trace_m4 db "com.pulse.lang.Long.longValue"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0 db "com.pulse.lang.Long.longValue(Long.pulse:40)"
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_longValue__Long_trace_s0
trace_m6 db "com.pulse.lang.Long.equals"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0 db "com.pulse.lang.Long.equals(Long.pulse:48)"
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_equals__long_long_trace_s0
trace_m8 db "com.pulse.lang.Long.compare"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0 db "com.pulse.lang.Long.compare(Long.pulse:56)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1 db "com.pulse.lang.Long.compare(Long.pulse:57)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s1
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2 db "com.pulse.lang.Long.compare(Long.pulse:59)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3 db "com.pulse.lang.Long.compare(Long.pulse:60)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s3
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4 db "com.pulse.lang.Long.compare(Long.pulse:62)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s4
trace_m14 db "com.pulse.lang.Long.toString"
trace_m14_len equ $ - trace_m14
pulsec_com_pulse_lang_Long_toString__long_trace_s0 db "com.pulse.lang.Long.toString(Long.pulse:70)"
pulsec_com_pulse_lang_Long_toString__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_toString__long_trace_s0
trace_m16 db "com.pulse.lang.Long.runtimeParse"
trace_m16_len equ $ - trace_m16
pulsec_com_pulse_lang_Long_runtimeParse__String_trace_s0 db "com.pulse.lang.Long.runtimeParse(Long.pulse:78)"
pulsec_com_pulse_lang_Long_runtimeParse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_runtimeParse__String_trace_s0
trace_m18 db "com.pulse.lang.Long.runtimeToString"
trace_m18_len equ $ - trace_m18
pulsec_com_pulse_lang_Long_runtimeToString__long_trace_s0 db "com.pulse.lang.Long.runtimeToString(Long.pulse:86)"
pulsec_com_pulse_lang_Long_runtimeToString__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_runtimeToString__long_trace_s0
msg0 db 0
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_Long_valueOf__long proc
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
pulsec_com_pulse_lang_Long_valueOf__long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_valueOf__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_valueOf__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Long_valueOf__long_epilogue
pulsec_com_pulse_lang_Long_valueOf__long_epilogue:
pulsec_com_pulse_lang_Long_valueOf__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_valueOf__long endp

pulsec_com_pulse_lang_Long_parse__String proc
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
pulsec_com_pulse_lang_Long_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Long_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseLong
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_Long_valueOf__long
    jmp pulsec_com_pulse_lang_Long_parse__String_epilogue
pulsec_com_pulse_lang_Long_parse__String_epilogue:
pulsec_com_pulse_lang_Long_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_parse__String endp

pulsec_com_pulse_lang_Long_longValue__Long proc
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
pulsec_com_pulse_lang_Long_longValue__Long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_longValue__Long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_longValue__Long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Long_longValue__Long_epilogue
pulsec_com_pulse_lang_Long_longValue__Long_epilogue:
pulsec_com_pulse_lang_Long_longValue__Long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_longValue__Long endp

pulsec_com_pulse_lang_Long_equals__long_long proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_equals__long_long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_equals__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_equals__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Long_equals__long_long_epilogue
pulsec_com_pulse_lang_Long_equals__long_long_epilogue:
pulsec_com_pulse_lang_Long_equals__long_long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Long_equals__long_long endp

pulsec_com_pulse_lang_Long_compare__long_long proc
    sub rsp, 152
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Long_compare__long_long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Long_compare__long_long_b1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b2
pulsec_com_pulse_lang_Long_compare__long_long_b1:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_b2:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b3
pulsec_com_pulse_lang_Long_compare__long_long_b3:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Long_compare__long_long_b4
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b5
pulsec_com_pulse_lang_Long_compare__long_long_b4:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s3
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_b5:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Long_compare__long_long_b6
pulsec_com_pulse_lang_Long_compare__long_long_b6:
    lea rcx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s4
    mov edx, pulsec_com_pulse_lang_Long_compare__long_long_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Long_compare__long_long_epilogue
pulsec_com_pulse_lang_Long_compare__long_long_epilogue:
pulsec_com_pulse_lang_Long_compare__long_long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Long_compare__long_long endp

pulsec_com_pulse_lang_Long_toString__long proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Long_toString__long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_toString__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_toString__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_longToString
    jmp pulsec_com_pulse_lang_Long_toString__long_epilogue
pulsec_com_pulse_lang_Long_toString__long_epilogue:
pulsec_com_pulse_lang_Long_toString__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_toString__long endp

pulsec_com_pulse_lang_Long_runtimeParse__String proc
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
pulsec_com_pulse_lang_Long_runtimeParse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Long_runtimeParse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_runtimeParse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    jmp pulsec_com_pulse_lang_Long_runtimeParse__String_epilogue
pulsec_com_pulse_lang_Long_runtimeParse__String_epilogue:
pulsec_com_pulse_lang_Long_runtimeParse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_runtimeParse__String endp

pulsec_com_pulse_lang_Long_runtimeToString__long proc
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
pulsec_com_pulse_lang_Long_runtimeToString__long_b0:
    lea rcx, pulsec_com_pulse_lang_Long_runtimeToString__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Long_runtimeToString__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Long_runtimeToString__long_epilogue
pulsec_com_pulse_lang_Long_runtimeToString__long_epilogue:
pulsec_com_pulse_lang_Long_runtimeToString__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_runtimeToString__long endp

end
