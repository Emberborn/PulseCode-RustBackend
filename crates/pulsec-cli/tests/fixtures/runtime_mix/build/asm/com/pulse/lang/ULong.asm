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
extrn pulsec_rt_parseULong:proc
extrn pulsec_rt_ulongToString:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_ULong dd 0
pulsec_fld_com_pulse_lang_ULong_MIN_VALUE dq 0
pulsec_fld_com_pulse_lang_ULong_MAX_VALUE dq 0
trace_m0 db "com.pulse.lang.ULong.valueOf"
trace_m0_len equ 28
pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0 db "com.pulse.lang.ULong.valueOf(ULong.pulse:24)"
pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0_len equ 44
trace_m2 db "com.pulse.lang.ULong.parse"
trace_m2_len equ 26
pulsec_com_pulse_lang_ULong_parse__String_trace_s0 db "com.pulse.lang.ULong.parse(ULong.pulse:32)"
pulsec_com_pulse_lang_ULong_parse__String_trace_s0_len equ 42
trace_m4 db "com.pulse.lang.ULong.ulongValue"
trace_m4_len equ 31
pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0 db "com.pulse.lang.ULong.ulongValue(ULong.pulse:40)"
pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0_len equ 47
trace_m6 db "com.pulse.lang.ULong.equals"
trace_m6_len equ 27
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0 db "com.pulse.lang.ULong.equals(ULong.pulse:48)"
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0_len equ 43
trace_m8 db "com.pulse.lang.ULong.compare"
trace_m8_len equ 28
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0 db "com.pulse.lang.ULong.compare(ULong.pulse:56)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len equ 44
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1 db "com.pulse.lang.ULong.compare(ULong.pulse:57)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1_len equ 44
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2 db "com.pulse.lang.ULong.compare(ULong.pulse:59)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len equ 44
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3 db "com.pulse.lang.ULong.compare(ULong.pulse:60)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3_len equ 44
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4 db "com.pulse.lang.ULong.compare(ULong.pulse:62)"
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4_len equ 44
trace_m14 db "com.pulse.lang.ULong.toString"
trace_m14_len equ 29
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0 db "com.pulse.lang.ULong.toString(ULong.pulse:70)"
pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0_len equ 45
trace_m16 db "com.pulse.lang.ULong.runtimeParse"
trace_m16_len equ 33
pulsec_com_pulse_lang_ULong_runtimeParse__String_trace_s0 db "com.pulse.lang.ULong.runtimeParse(ULong.pulse:78)"
pulsec_com_pulse_lang_ULong_runtimeParse__String_trace_s0_len equ 49
trace_m18 db "com.pulse.lang.ULong.runtimeToString"
trace_m18_len equ 36
pulsec_com_pulse_lang_ULong_runtimeToString__ulong_trace_s0 db "com.pulse.lang.ULong.runtimeToString(ULong.pulse:86)"
pulsec_com_pulse_lang_ULong_runtimeToString__ulong_trace_s0_len equ 52
msg0 db 0
msg0_len equ 0

.code
pulsec_com_pulse_lang_ULong_valueOf__ulong proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_valueOf__ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_valueOf__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue
pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue:
pulsec_com_pulse_lang_ULong_valueOf__ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_valueOf__ulong endp

pulsec_com_pulse_lang_ULong_parse__String proc
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
pulsec_com_pulse_lang_ULong_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_parse__String_trace_s0_len
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
    call pulsec_rt_parseULong
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_com_pulse_lang_ULong_valueOf__ulong
    jmp pulsec_com_pulse_lang_ULong_parse__String_epilogue
pulsec_com_pulse_lang_ULong_parse__String_epilogue:
pulsec_com_pulse_lang_ULong_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_parse__String endp

pulsec_com_pulse_lang_ULong_ulongValue__ULong proc
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
pulsec_com_pulse_lang_ULong_ulongValue__ULong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_ulongValue__ULong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue
pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue:
pulsec_com_pulse_lang_ULong_ulongValue__ULong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_ulongValue__ULong endp

pulsec_com_pulse_lang_ULong_equals__ulong_ulong proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_equals__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue:
pulsec_com_pulse_lang_ULong_equals__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ULong_equals__ulong_ulong endp

pulsec_com_pulse_lang_ULong_compare__ulong_ulong proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b1:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b2:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b3:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b4
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b5
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b4:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b5:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b6
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_b6:
    lea rcx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4
    mov edx, pulsec_com_pulse_lang_ULong_compare__ulong_ulong_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue:
pulsec_com_pulse_lang_ULong_compare__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_ULong_compare__ulong_ulong endp

pulsec_com_pulse_lang_ULong_toString__ulong proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_toString__ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_toString__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_ulongToString
    jmp pulsec_com_pulse_lang_ULong_toString__ulong_epilogue
pulsec_com_pulse_lang_ULong_toString__ulong_epilogue:
pulsec_com_pulse_lang_ULong_toString__ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_toString__ulong endp

pulsec_com_pulse_lang_ULong_runtimeParse__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_ULong_runtimeParse__String_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_runtimeParse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_runtimeParse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    jmp pulsec_com_pulse_lang_ULong_runtimeParse__String_epilogue
pulsec_com_pulse_lang_ULong_runtimeParse__String_epilogue:
pulsec_com_pulse_lang_ULong_runtimeParse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_runtimeParse__String endp

pulsec_com_pulse_lang_ULong_runtimeToString__ulong proc
    sub rsp, 184
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
pulsec_com_pulse_lang_ULong_runtimeToString__ulong_b0:
    lea rcx, pulsec_com_pulse_lang_ULong_runtimeToString__ulong_trace_s0
    mov edx, pulsec_com_pulse_lang_ULong_runtimeToString__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_ULong_runtimeToString__ulong_epilogue
pulsec_com_pulse_lang_ULong_runtimeToString__ulong_epilogue:
pulsec_com_pulse_lang_ULong_runtimeToString__ulong_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_ULong_runtimeToString__ulong endp

end
