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
pulsec_objc_com_pulse_lang_UShort dd 0
pulsec_fld_com_pulse_lang_UShort_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UShort_MAX_VALUE dd 65535
trace_m0 db "com.pulse.lang.UShort.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0 db "com.pulse.lang.UShort.valueOf(UShort.pulse:24)"
pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0
trace_m2 db "com.pulse.lang.UShort.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_UShort_parse__String_trace_s0 db "com.pulse.lang.UShort.parse(UShort.pulse:32)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s0
pulsec_com_pulse_lang_UShort_parse__String_trace_s1 db "com.pulse.lang.UShort.parse(UShort.pulse:33)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s1
pulsec_com_pulse_lang_UShort_parse__String_trace_s2 db "com.pulse.lang.UShort.parse(UShort.pulse:34)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s2_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s2
pulsec_com_pulse_lang_UShort_parse__String_trace_s3 db "com.pulse.lang.UShort.parse(UShort.pulse:36)"
pulsec_com_pulse_lang_UShort_parse__String_trace_s3_len equ $ - pulsec_com_pulse_lang_UShort_parse__String_trace_s3
trace_m7 db "com.pulse.lang.UShort.ushortValue"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0 db "com.pulse.lang.UShort.ushortValue(UShort.pulse:44)"
pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0
trace_m9 db "com.pulse.lang.UShort.equals"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0 db "com.pulse.lang.UShort.equals(UShort.pulse:52)"
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0
trace_m11 db "com.pulse.lang.UShort.compare"
trace_m11_len equ $ - trace_m11
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0 db "com.pulse.lang.UShort.compare(UShort.pulse:60)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1 db "com.pulse.lang.UShort.compare(UShort.pulse:61)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2 db "com.pulse.lang.UShort.compare(UShort.pulse:63)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3 db "com.pulse.lang.UShort.compare(UShort.pulse:64)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4 db "com.pulse.lang.UShort.compare(UShort.pulse:66)"
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4_len equ $ - pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4
trace_m17 db "com.pulse.lang.UShort.toString"
trace_m17_len equ $ - trace_m17
pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0 db "com.pulse.lang.UShort.toString(UShort.pulse:74)"
pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0_len equ $ - pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0
msg0 db "UShort.parse out of range"
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_UShort_valueOf__ushort proc
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
pulsec_com_pulse_lang_UShort_valueOf__ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_valueOf__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue
pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue:
pulsec_com_pulse_lang_UShort_valueOf__ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_valueOf__ushort endp

pulsec_com_pulse_lang_UShort_parse__String proc
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
pulsec_com_pulse_lang_UShort_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s0_len
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
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne UShort_parse_ternary_then_1_14
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 65535
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp UShort_parse_ternary_done_1_14
UShort_parse_ternary_then_1_14:
    mov eax, 1
UShort_parse_ternary_done_1_14:
    test eax, eax
    jne pulsec_com_pulse_lang_UShort_parse__String_b1
    jmp pulsec_com_pulse_lang_UShort_parse__String_b2
pulsec_com_pulse_lang_UShort_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s2_len
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
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_parse__String_b3
pulsec_com_pulse_lang_UShort_parse__String_b2:
    jmp pulsec_com_pulse_lang_UShort_parse__String_b3
pulsec_com_pulse_lang_UShort_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_UShort_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_UShort_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_UShort_valueOf__ushort
    jmp pulsec_com_pulse_lang_UShort_parse__String_epilogue
pulsec_com_pulse_lang_UShort_parse__String_epilogue:
pulsec_com_pulse_lang_UShort_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UShort_parse__String endp

pulsec_com_pulse_lang_UShort_ushortValue__UShort proc
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
pulsec_com_pulse_lang_UShort_ushortValue__UShort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_ushortValue__UShort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue
pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue:
pulsec_com_pulse_lang_UShort_ushortValue__UShort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_ushortValue__UShort endp

pulsec_com_pulse_lang_UShort_equals__ushort_ushort proc
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
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_equals__ushort_ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue:
pulsec_com_pulse_lang_UShort_equals__ushort_ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_UShort_equals__ushort_ushort endp

pulsec_com_pulse_lang_UShort_compare__ushort_ushort proc
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
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len
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
    jne pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b1:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b2:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b3:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len
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
    jne pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b4
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b5
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b4:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b5:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b6
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_b6:
    lea rcx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4
    mov edx, pulsec_com_pulse_lang_UShort_compare__ushort_ushort_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue:
pulsec_com_pulse_lang_UShort_compare__ushort_ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_lang_UShort_compare__ushort_ushort endp

pulsec_com_pulse_lang_UShort_toString__ushort proc
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
pulsec_com_pulse_lang_UShort_toString__ushort_b0:
    lea rcx, pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0
    mov edx, pulsec_com_pulse_lang_UShort_toString__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, ax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_UShort_toString__ushort_epilogue
pulsec_com_pulse_lang_UShort_toString__ushort_epilogue:
pulsec_com_pulse_lang_UShort_toString__ushort_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_UShort_toString__ushort endp

end
