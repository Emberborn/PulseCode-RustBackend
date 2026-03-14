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
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_Integer_intValue__Integer:proc
extrn pulsec_com_pulse_lang_Integer_parse__String:proc
extrn pulsec_com_pulse_lang_String_valueOf__int:proc
extrn pulsec_rt_panic:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Short dd 0
pulsec_fld_com_pulse_lang_Short_MIN_VALUE dd -32768
pulsec_fld_com_pulse_lang_Short_MAX_VALUE dd 32767
trace_m0 db "com.pulse.lang.Short.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Short_valueOf__short_trace_s0 db "com.pulse.lang.Short.valueOf(Short.pulse:24)"
pulsec_com_pulse_lang_Short_valueOf__short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_valueOf__short_trace_s0
trace_m2 db "com.pulse.lang.Short.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Short_parse__String_trace_s0 db "com.pulse.lang.Short.parse(Short.pulse:32)"
pulsec_com_pulse_lang_Short_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s0
pulsec_com_pulse_lang_Short_parse__String_trace_s1 db "com.pulse.lang.Short.parse(Short.pulse:33)"
pulsec_com_pulse_lang_Short_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s1
pulsec_com_pulse_lang_Short_parse__String_trace_s2 db "com.pulse.lang.Short.parse(Short.pulse:34)"
pulsec_com_pulse_lang_Short_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s2
pulsec_com_pulse_lang_Short_parse__String_trace_s3 db "com.pulse.lang.Short.parse(Short.pulse:36)"
pulsec_com_pulse_lang_Short_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_Short_parse__String_trace_s3
trace_m7 db "com.pulse.lang.Short.shortValue"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0 db "com.pulse.lang.Short.shortValue(Short.pulse:44)"
pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0
trace_m9 db "com.pulse.lang.Short.equals"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_Short_equals__short_short_trace_s0 db "com.pulse.lang.Short.equals(Short.pulse:52)"
pulsec_com_pulse_lang_Short_equals__short_short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_equals__short_short_trace_s0
trace_m11 db "com.pulse.lang.Short.compare"
trace_m11_len equ $ - trace_m11
pulsec_com_pulse_lang_Short_compare__short_short_trace_s0 db "com.pulse.lang.Short.compare(Short.pulse:60)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
pulsec_com_pulse_lang_Short_compare__short_short_trace_s1 db "com.pulse.lang.Short.compare(Short.pulse:61)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s1_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s1
pulsec_com_pulse_lang_Short_compare__short_short_trace_s2 db "com.pulse.lang.Short.compare(Short.pulse:63)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
pulsec_com_pulse_lang_Short_compare__short_short_trace_s3 db "com.pulse.lang.Short.compare(Short.pulse:64)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s3_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s3
pulsec_com_pulse_lang_Short_compare__short_short_trace_s4 db "com.pulse.lang.Short.compare(Short.pulse:66)"
pulsec_com_pulse_lang_Short_compare__short_short_trace_s4_len equ $ - pulsec_com_pulse_lang_Short_compare__short_short_trace_s4
trace_m17 db "com.pulse.lang.Short.toString"
trace_m17_len equ $ - trace_m17
pulsec_com_pulse_lang_Short_toString__short_trace_s0 db "com.pulse.lang.Short.toString(Short.pulse:74)"
pulsec_com_pulse_lang_Short_toString__short_trace_s0_len equ $ - pulsec_com_pulse_lang_Short_toString__short_trace_s0
msg0 db "Short.parse out of range"
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_Short_valueOf__short proc
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
pulsec_com_pulse_lang_Short_valueOf__short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_valueOf__short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_valueOf__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Short_valueOf__short_epilogue
pulsec_com_pulse_lang_Short_valueOf__short_epilogue:
pulsec_com_pulse_lang_Short_valueOf__short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_valueOf__short endp

pulsec_com_pulse_lang_Short_parse__String proc
    sub rsp, 152
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Short_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 32768
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Short_parse_ternary_then_1_15
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 32767
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp Short_parse_ternary_done_1_15
Short_parse_ternary_then_1_15:
    mov eax, 1
Short_parse_ternary_done_1_15:
    test eax, eax
    jne pulsec_com_pulse_lang_Short_parse__String_b1
    jmp pulsec_com_pulse_lang_Short_parse__String_b2
pulsec_com_pulse_lang_Short_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
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
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_parse__String_b3
pulsec_com_pulse_lang_Short_parse__String_b2:
    jmp pulsec_com_pulse_lang_Short_parse__String_b3
pulsec_com_pulse_lang_Short_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_Short_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_Short_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_Short_valueOf__short
    jmp pulsec_com_pulse_lang_Short_parse__String_epilogue
pulsec_com_pulse_lang_Short_parse__String_epilogue:
pulsec_com_pulse_lang_Short_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Short_parse__String endp

pulsec_com_pulse_lang_Short_shortValue__Short proc
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
pulsec_com_pulse_lang_Short_shortValue__Short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_shortValue__Short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Short_shortValue__Short_epilogue
pulsec_com_pulse_lang_Short_shortValue__Short_epilogue:
pulsec_com_pulse_lang_Short_shortValue__Short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_shortValue__Short endp

pulsec_com_pulse_lang_Short_equals__short_short proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_equals__short_short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_equals__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_equals__short_short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Short_equals__short_short_epilogue
pulsec_com_pulse_lang_Short_equals__short_short_epilogue:
pulsec_com_pulse_lang_Short_equals__short_short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Short_equals__short_short endp

pulsec_com_pulse_lang_Short_compare__short_short proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Short_compare__short_short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len
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
    jne pulsec_com_pulse_lang_Short_compare__short_short_b1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b2
pulsec_com_pulse_lang_Short_compare__short_short_b1:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s1
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_b2:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b3
pulsec_com_pulse_lang_Short_compare__short_short_b3:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len
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
    jne pulsec_com_pulse_lang_Short_compare__short_short_b4
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b5
pulsec_com_pulse_lang_Short_compare__short_short_b4:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s3
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_b5:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Short_compare__short_short_b6
pulsec_com_pulse_lang_Short_compare__short_short_b6:
    lea rcx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s4
    mov edx, pulsec_com_pulse_lang_Short_compare__short_short_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Short_compare__short_short_epilogue
pulsec_com_pulse_lang_Short_compare__short_short_epilogue:
pulsec_com_pulse_lang_Short_compare__short_short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Short_compare__short_short endp

pulsec_com_pulse_lang_Short_toString__short proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Short_toString__short_b0:
    lea rcx, pulsec_com_pulse_lang_Short_toString__short_trace_s0
    mov edx, pulsec_com_pulse_lang_Short_toString__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movsx eax, ax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_Short_toString__short_epilogue
pulsec_com_pulse_lang_Short_toString__short_epilogue:
pulsec_com_pulse_lang_Short_toString__short_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Short_toString__short endp

end
