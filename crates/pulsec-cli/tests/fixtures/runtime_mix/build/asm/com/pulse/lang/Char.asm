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
extrn pulsec_com_pulse_lang_String_valueOf__char:proc
extrn pulsec_rt_panic:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Char dd 0
pulsec_fld_com_pulse_lang_Char_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_Char_MAX_VALUE dd 65535
trace_m0 db "com.pulse.lang.Char.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0 db "com.pulse.lang.Char.valueOf(Char.pulse:24)"
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_valueOf__char_trace_s0
trace_m2 db "com.pulse.lang.Char.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Char_parse__String_trace_s0 db "com.pulse.lang.Char.parse(Char.pulse:32)"
pulsec_com_pulse_lang_Char_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_parse__String_trace_s0
pulsec_com_pulse_lang_Char_parse__String_trace_s1 db "com.pulse.lang.Char.parse(Char.pulse:33)"
pulsec_com_pulse_lang_Char_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Char_parse__String_trace_s1
trace_m5 db "com.pulse.lang.Char.charValue"
trace_m5_len equ $ - trace_m5
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0 db "com.pulse.lang.Char.charValue(Char.pulse:41)"
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_charValue__Char_trace_s0
trace_m7 db "com.pulse.lang.Char.equals"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0 db "com.pulse.lang.Char.equals(Char.pulse:49)"
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_equals__char_char_trace_s0
trace_m9 db "com.pulse.lang.Char.compare"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0 db "com.pulse.lang.Char.compare(Char.pulse:57)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1 db "com.pulse.lang.Char.compare(Char.pulse:58)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s1
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2 db "com.pulse.lang.Char.compare(Char.pulse:60)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3 db "com.pulse.lang.Char.compare(Char.pulse:61)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s3
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4 db "com.pulse.lang.Char.compare(Char.pulse:63)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4_len equ $ - pulsec_com_pulse_lang_Char_compare__char_char_trace_s4
trace_m15 db "com.pulse.lang.Char.toString"
trace_m15_len equ $ - trace_m15
pulsec_com_pulse_lang_Char_toString__char_trace_s0 db "com.pulse.lang.Char.toString(Char.pulse:71)"
pulsec_com_pulse_lang_Char_toString__char_trace_s0_len equ $ - pulsec_com_pulse_lang_Char_toString__char_trace_s0
msg0 db "Char.parse is not supported yet"
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_Char_valueOf__char proc
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
pulsec_com_pulse_lang_Char_valueOf__char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_valueOf__char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_valueOf__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Char_valueOf__char_epilogue
pulsec_com_pulse_lang_Char_valueOf__char_epilogue:
pulsec_com_pulse_lang_Char_valueOf__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_valueOf__char endp

pulsec_com_pulse_lang_Char_parse__String proc
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
pulsec_com_pulse_lang_Char_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s0_len
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
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 9
    call pulsec_rt_objectNew
    jmp pulsec_com_pulse_lang_Char_parse__String_epilogue
pulsec_com_pulse_lang_Char_parse__String_epilogue:
pulsec_com_pulse_lang_Char_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_parse__String endp

pulsec_com_pulse_lang_Char_charValue__Char proc
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
pulsec_com_pulse_lang_Char_charValue__Char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_charValue__Char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_charValue__Char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Char_charValue__Char_epilogue
pulsec_com_pulse_lang_Char_charValue__Char_epilogue:
pulsec_com_pulse_lang_Char_charValue__Char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_charValue__Char endp

pulsec_com_pulse_lang_Char_equals__char_char proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_equals__char_char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_equals__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_equals__char_char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Char_equals__char_char_epilogue
pulsec_com_pulse_lang_Char_equals__char_char_epilogue:
pulsec_com_pulse_lang_Char_equals__char_char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Char_equals__char_char endp

pulsec_com_pulse_lang_Char_compare__char_char proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_compare__char_char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len
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
    jne pulsec_com_pulse_lang_Char_compare__char_char_b1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b2
pulsec_com_pulse_lang_Char_compare__char_char_b1:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s1
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_b2:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b3
pulsec_com_pulse_lang_Char_compare__char_char_b3:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len
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
    jne pulsec_com_pulse_lang_Char_compare__char_char_b4
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b5
pulsec_com_pulse_lang_Char_compare__char_char_b4:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s3
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_b5:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Char_compare__char_char_b6
pulsec_com_pulse_lang_Char_compare__char_char_b6:
    lea rcx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s4
    mov edx, pulsec_com_pulse_lang_Char_compare__char_char_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Char_compare__char_char_epilogue
pulsec_com_pulse_lang_Char_compare__char_char_epilogue:
pulsec_com_pulse_lang_Char_compare__char_char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_Char_compare__char_char endp

pulsec_com_pulse_lang_Char_toString__char proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Char_toString__char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_toString__char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_toString__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__char
    jmp pulsec_com_pulse_lang_Char_toString__char_epilogue
pulsec_com_pulse_lang_Char_toString__char_epilogue:
pulsec_com_pulse_lang_Char_toString__char_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Char_toString__char endp

end
