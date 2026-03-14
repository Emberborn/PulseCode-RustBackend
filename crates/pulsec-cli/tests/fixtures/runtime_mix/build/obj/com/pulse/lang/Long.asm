option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_panic:proc


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
pulsec_com_pulse_lang_Long_parse__String_trace_s1 db "com.pulse.lang.Long.parse(Long.pulse:33)"
pulsec_com_pulse_lang_Long_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_parse__String_trace_s1
trace_m5 db "com.pulse.lang.Long.longValue"
trace_m5_len equ $ - trace_m5
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0 db "com.pulse.lang.Long.longValue(Long.pulse:41)"
pulsec_com_pulse_lang_Long_longValue__Long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_longValue__Long_trace_s0
trace_m7 db "com.pulse.lang.Long.equals"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0 db "com.pulse.lang.Long.equals(Long.pulse:49)"
pulsec_com_pulse_lang_Long_equals__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_equals__long_long_trace_s0
trace_m9 db "com.pulse.lang.Long.compare"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0 db "com.pulse.lang.Long.compare(Long.pulse:57)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s0
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1 db "com.pulse.lang.Long.compare(Long.pulse:58)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s1
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2 db "com.pulse.lang.Long.compare(Long.pulse:60)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s2_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s2
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3 db "com.pulse.lang.Long.compare(Long.pulse:61)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s3_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s3
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4 db "com.pulse.lang.Long.compare(Long.pulse:63)"
pulsec_com_pulse_lang_Long_compare__long_long_trace_s4_len equ $ - pulsec_com_pulse_lang_Long_compare__long_long_trace_s4
trace_m15 db "com.pulse.lang.Long.toString"
trace_m15_len equ $ - trace_m15
pulsec_com_pulse_lang_Long_toString__long_trace_s0 db "com.pulse.lang.Long.toString(Long.pulse:71)"
pulsec_com_pulse_lang_Long_toString__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Long_toString__long_trace_s0
pulsec_com_pulse_lang_Long_toString__long_trace_s1 db "com.pulse.lang.Long.toString(Long.pulse:72)"
pulsec_com_pulse_lang_Long_toString__long_trace_s1_len equ $ - pulsec_com_pulse_lang_Long_toString__long_trace_s1
msg0 db "Long.parse is not supported yet"
msg0_len equ $ - msg0
msg1 db "Long.toString is not supported yet"
msg1_len equ $ - msg1
msg2 db 0
msg2_len equ $ - msg2

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
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Long_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 24
    call pulsec_rt_objectNew
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
    lea rcx, trace_m5
    mov edx, trace_m5_len
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
    lea rcx, trace_m7
    mov edx, trace_m7_len
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
    lea rcx, trace_m9
    mov edx, trace_m9_len
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
    lea rcx, trace_m15
    mov edx, trace_m15_len
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
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Long_toString__long_trace_s1
    mov edx, pulsec_com_pulse_lang_Long_toString__long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Long_toString__long_epilogue
pulsec_com_pulse_lang_Long_toString__long_epilogue:
pulsec_com_pulse_lang_Long_toString__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Long_toString__long endp

end
