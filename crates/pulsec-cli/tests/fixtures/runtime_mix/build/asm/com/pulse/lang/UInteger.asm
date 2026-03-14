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
extrn pulsec_rt_parseUInt:proc
extrn pulsec_rt_uintToString:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_UInteger dd 0
pulsec_fld_com_pulse_lang_UInteger_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UInteger_MAX_VALUE dd 4294967295
trace_m0 db "com.pulse.lang.UInteger.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0 db "com.pulse.lang.UInteger.valueOf(UInteger.pulse:24)"
pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0
trace_m2 db "com.pulse.lang.UInteger.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_UInteger_parse__String_trace_s0 db "com.pulse.lang.UInteger.parse(UInteger.pulse:32)"
pulsec_com_pulse_lang_UInteger_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_parse__String_trace_s0
trace_m4 db "com.pulse.lang.UInteger.uintValue"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0 db "com.pulse.lang.UInteger.uintValue(UInteger.pulse:40)"
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0
trace_m6 db "com.pulse.lang.UInteger.equals"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0 db "com.pulse.lang.UInteger.equals(UInteger.pulse:48)"
pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0
trace_m8 db "com.pulse.lang.UInteger.compare"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0 db "com.pulse.lang.UInteger.compare(UInteger.pulse:56)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1 db "com.pulse.lang.UInteger.compare(UInteger.pulse:57)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2 db "com.pulse.lang.UInteger.compare(UInteger.pulse:59)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3 db "com.pulse.lang.UInteger.compare(UInteger.pulse:60)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4 db "com.pulse.lang.UInteger.compare(UInteger.pulse:62)"
pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4_len equ $ - pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4
trace_m14 db "com.pulse.lang.UInteger.toString"
trace_m14_len equ $ - trace_m14
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0 db "com.pulse.lang.UInteger.toString(UInteger.pulse:70)"
pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0
trace_m16 db "com.pulse.lang.UInteger.runtimeParse"
trace_m16_len equ $ - trace_m16
pulsec_com_pulse_lang_UInteger_runtimeParse__String_trace_s0 db "com.pulse.lang.UInteger.runtimeParse(UInteger.pulse:78)"
pulsec_com_pulse_lang_UInteger_runtimeParse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_runtimeParse__String_trace_s0
trace_m18 db "com.pulse.lang.UInteger.runtimeToString"
trace_m18_len equ $ - trace_m18
pulsec_com_pulse_lang_UInteger_runtimeToString__uint_trace_s0 db "com.pulse.lang.UInteger.runtimeToString(UInteger.pulse:86)"
pulsec_com_pulse_lang_UInteger_runtimeToString__uint_trace_s0_len equ $ - pulsec_com_pulse_lang_UInteger_runtimeToString__uint_trace_s0
msg0 db 0
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_UInteger_valueOf__uint proc
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
pulsec_com_pulse_lang_UInteger_valueOf__uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_valueOf__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue
pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue:
pulsec_com_pulse_lang_UInteger_valueOf__uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_valueOf__uint endp

pulsec_com_pulse_lang_UInteger_parse__String proc
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
pulsec_com_pulse_lang_UInteger_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_parseUInt
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_UInteger_valueOf__uint
    jmp pulsec_com_pulse_lang_UInteger_parse__String_epilogue
pulsec_com_pulse_lang_UInteger_parse__String_epilogue:
pulsec_com_pulse_lang_UInteger_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_parse__String endp

pulsec_com_pulse_lang_UInteger_uintValue__UInteger proc
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
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue:
pulsec_com_pulse_lang_UInteger_uintValue__UInteger_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_uintValue__UInteger endp

pulsec_com_pulse_lang_UInteger_equals__uint_uint proc
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
pulsec_com_pulse_lang_UInteger_equals__uint_uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_equals__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue:
pulsec_com_pulse_lang_UInteger_equals__uint_uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UInteger_equals__uint_uint endp

pulsec_com_pulse_lang_UInteger_compare__uint_uint proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b1:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b2:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b3:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_UInteger_compare__uint_uint_b4
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b5
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b4:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b5:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_b6
pulsec_com_pulse_lang_UInteger_compare__uint_uint_b6:
    lea rcx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4
    mov edx, pulsec_com_pulse_lang_UInteger_compare__uint_uint_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue:
pulsec_com_pulse_lang_UInteger_compare__uint_uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UInteger_compare__uint_uint endp

pulsec_com_pulse_lang_UInteger_toString__uint proc
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
pulsec_com_pulse_lang_UInteger_toString__uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_toString__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_uintToString
    jmp pulsec_com_pulse_lang_UInteger_toString__uint_epilogue
pulsec_com_pulse_lang_UInteger_toString__uint_epilogue:
pulsec_com_pulse_lang_UInteger_toString__uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_toString__uint endp

pulsec_com_pulse_lang_UInteger_runtimeParse__String proc
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
pulsec_com_pulse_lang_UInteger_runtimeParse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_runtimeParse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_runtimeParse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov eax, eax
    jmp pulsec_com_pulse_lang_UInteger_runtimeParse__String_epilogue
pulsec_com_pulse_lang_UInteger_runtimeParse__String_epilogue:
pulsec_com_pulse_lang_UInteger_runtimeParse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_runtimeParse__String endp

pulsec_com_pulse_lang_UInteger_runtimeToString__uint proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_UInteger_runtimeToString__uint_b0:
    lea rcx, pulsec_com_pulse_lang_UInteger_runtimeToString__uint_trace_s0
    mov edx, pulsec_com_pulse_lang_UInteger_runtimeToString__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_UInteger_runtimeToString__uint_epilogue
pulsec_com_pulse_lang_UInteger_runtimeToString__uint_epilogue:
pulsec_com_pulse_lang_UInteger_runtimeToString__uint_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UInteger_runtimeToString__uint endp

end
