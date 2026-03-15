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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_String_valueOf__char:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_stringCharAt:proc
extrn pulsec_rt_stringLength:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Char dd 0
pulsec_fld_com_pulse_lang_Char_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_Char_MAX_VALUE dd 65535
trace_m0 db "com.pulse.lang.Char.valueOf"
trace_m0_len equ 27
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0 db "com.pulse.lang.Char.valueOf(Char.pulse:24)"
pulsec_com_pulse_lang_Char_valueOf__char_trace_s0_len equ 42
trace_m2 db "com.pulse.lang.Char.parse"
trace_m2_len equ 25
pulsec_com_pulse_lang_Char_parse__String_trace_s0 db "com.pulse.lang.Char.parse(Char.pulse:32)"
pulsec_com_pulse_lang_Char_parse__String_trace_s0_len equ 40
pulsec_com_pulse_lang_Char_parse__String_trace_s1 db "com.pulse.lang.Char.parse(Char.pulse:33)"
pulsec_com_pulse_lang_Char_parse__String_trace_s1_len equ 40
pulsec_com_pulse_lang_Char_parse__String_trace_s2 db "com.pulse.lang.Char.parse(Char.pulse:35)"
pulsec_com_pulse_lang_Char_parse__String_trace_s2_len equ 40
trace_m6 db "com.pulse.lang.Char.charValue"
trace_m6_len equ 29
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0 db "com.pulse.lang.Char.charValue(Char.pulse:43)"
pulsec_com_pulse_lang_Char_charValue__Char_trace_s0_len equ 44
trace_m8 db "com.pulse.lang.Char.equals"
trace_m8_len equ 26
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0 db "com.pulse.lang.Char.equals(Char.pulse:51)"
pulsec_com_pulse_lang_Char_equals__char_char_trace_s0_len equ 41
trace_m10 db "com.pulse.lang.Char.compare"
trace_m10_len equ 27
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0 db "com.pulse.lang.Char.compare(Char.pulse:59)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s0_len equ 42
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1 db "com.pulse.lang.Char.compare(Char.pulse:60)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s1_len equ 42
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2 db "com.pulse.lang.Char.compare(Char.pulse:62)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s2_len equ 42
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3 db "com.pulse.lang.Char.compare(Char.pulse:63)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s3_len equ 42
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4 db "com.pulse.lang.Char.compare(Char.pulse:65)"
pulsec_com_pulse_lang_Char_compare__char_char_trace_s4_len equ 42
trace_m16 db "com.pulse.lang.Char.toString"
trace_m16_len equ 28
pulsec_com_pulse_lang_Char_toString__char_trace_s0 db "com.pulse.lang.Char.toString(Char.pulse:73)"
pulsec_com_pulse_lang_Char_toString__char_trace_s0_len equ 43
trace_m18 db "com.pulse.lang.Char.runtimeCharAt"
trace_m18_len equ 33
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_trace_s0 db "com.pulse.lang.Char.runtimeCharAt(Char.pulse:81)"
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_trace_s0_len equ 48
msg0 db "Invalid char literal"
msg0_len equ 20

.code
pulsec_com_pulse_lang_Char_valueOf__char proc
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_Char_valueOf__char endp

pulsec_com_pulse_lang_Char_parse__String proc
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
pulsec_com_pulse_lang_Char_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    xor eax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Char_parse_ternary_then_0_10
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_stringLength
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setne al
    movzx eax, al
    jmp Char_parse_ternary_done_0_10
Char_parse_ternary_then_0_10:
    mov eax, 1
Char_parse_ternary_done_0_10:
    test eax, eax
    jne pulsec_com_pulse_lang_Char_parse__String_b1
    jmp pulsec_com_pulse_lang_Char_parse__String_b2
pulsec_com_pulse_lang_Char_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Char_parse__String_b3
pulsec_com_pulse_lang_Char_parse__String_b2:
    jmp pulsec_com_pulse_lang_Char_parse__String_b3
pulsec_com_pulse_lang_Char_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_Char_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_Char_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov eax, 0
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringCharAt
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_lang_Char_valueOf__char
    jmp pulsec_com_pulse_lang_Char_parse__String_epilogue
pulsec_com_pulse_lang_Char_parse__String_epilogue:
pulsec_com_pulse_lang_Char_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_Char_parse__String endp

pulsec_com_pulse_lang_Char_charValue__Char proc
    sub rsp, 184
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_Char_charValue__Char endp

pulsec_com_pulse_lang_Char_equals__char_char proc
    sub rsp, 200
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
    add rsp, 200
    ret
pulsec_com_pulse_lang_Char_equals__char_char endp

pulsec_com_pulse_lang_Char_compare__char_char proc
    sub rsp, 216
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
    add rsp, 216
    ret
pulsec_com_pulse_lang_Char_compare__char_char endp

pulsec_com_pulse_lang_Char_toString__char proc
    sub rsp, 184
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Char_toString__char_b0:
    lea rcx, pulsec_com_pulse_lang_Char_toString__char_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_toString__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    add rsp, 184
    ret
pulsec_com_pulse_lang_Char_toString__char endp

pulsec_com_pulse_lang_Char_runtimeCharAt__String_int proc
    sub rsp, 200
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_b0:
    lea rcx, pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_trace_s0
    mov edx, pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_epilogue
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_epilogue:
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_Char_runtimeCharAt__String_int endp

end
