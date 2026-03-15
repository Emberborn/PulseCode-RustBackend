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
extrn pulsec_com_pulse_lang_Integer_intValue__Integer:proc
extrn pulsec_com_pulse_lang_Integer_parse__String:proc
extrn pulsec_com_pulse_lang_String_valueOf__int:proc
extrn pulsec_rt_panic:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_UByte dd 0
pulsec_fld_com_pulse_lang_UByte_MIN_VALUE dd 0
pulsec_fld_com_pulse_lang_UByte_MAX_VALUE dd 255
trace_m0 db "com.pulse.lang.UByte.valueOf"
trace_m0_len equ 28
pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0 db "com.pulse.lang.UByte.valueOf(UByte.pulse:24)"
pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0_len equ 44
trace_m2 db "com.pulse.lang.UByte.parse"
trace_m2_len equ 26
pulsec_com_pulse_lang_UByte_parse__String_trace_s0 db "com.pulse.lang.UByte.parse(UByte.pulse:32)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s0_len equ 42
pulsec_com_pulse_lang_UByte_parse__String_trace_s1 db "com.pulse.lang.UByte.parse(UByte.pulse:33)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len equ 42
pulsec_com_pulse_lang_UByte_parse__String_trace_s2 db "com.pulse.lang.UByte.parse(UByte.pulse:34)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s2_len equ 42
pulsec_com_pulse_lang_UByte_parse__String_trace_s3 db "com.pulse.lang.UByte.parse(UByte.pulse:36)"
pulsec_com_pulse_lang_UByte_parse__String_trace_s3_len equ 42
trace_m7 db "com.pulse.lang.UByte.ubyteValue"
trace_m7_len equ 31
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0 db "com.pulse.lang.UByte.ubyteValue(UByte.pulse:44)"
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0_len equ 47
trace_m9 db "com.pulse.lang.UByte.equals"
trace_m9_len equ 27
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0 db "com.pulse.lang.UByte.equals(UByte.pulse:52)"
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0_len equ 43
trace_m11 db "com.pulse.lang.UByte.compare"
trace_m11_len equ 28
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0 db "com.pulse.lang.UByte.compare(UByte.pulse:60)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len equ 44
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1 db "com.pulse.lang.UByte.compare(UByte.pulse:61)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1_len equ 44
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2 db "com.pulse.lang.UByte.compare(UByte.pulse:63)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len equ 44
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3 db "com.pulse.lang.UByte.compare(UByte.pulse:64)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3_len equ 44
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4 db "com.pulse.lang.UByte.compare(UByte.pulse:66)"
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4_len equ 44
trace_m17 db "com.pulse.lang.UByte.toString"
trace_m17_len equ 29
pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0 db "com.pulse.lang.UByte.toString(UByte.pulse:74)"
pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0_len equ 45
msg0 db "UByte.parse out of range"
msg0_len equ 24

.code
pulsec_com_pulse_lang_UByte_valueOf__ubyte proc
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
pulsec_com_pulse_lang_UByte_valueOf__ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_valueOf__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue
pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue:
pulsec_com_pulse_lang_UByte_valueOf__ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_UByte_valueOf__ubyte endp

pulsec_com_pulse_lang_UByte_parse__String proc
    sub rsp, 216
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
pulsec_com_pulse_lang_UByte_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_Integer_intValue__Integer
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len
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
    jne UByte_parse_ternary_then_1_14
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 255
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp UByte_parse_ternary_done_1_14
UByte_parse_ternary_then_1_14:
    mov eax, 1
UByte_parse_ternary_done_1_14:
    test eax, eax
    jne pulsec_com_pulse_lang_UByte_parse__String_b1
    jmp pulsec_com_pulse_lang_UByte_parse__String_b2
pulsec_com_pulse_lang_UByte_parse__String_b1:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
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
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_parse__String_b3
pulsec_com_pulse_lang_UByte_parse__String_b2:
    jmp pulsec_com_pulse_lang_UByte_parse__String_b3
pulsec_com_pulse_lang_UByte_parse__String_b3:
    lea rcx, pulsec_com_pulse_lang_UByte_parse__String_trace_s3
    mov edx, pulsec_com_pulse_lang_UByte_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, al
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_UByte_valueOf__ubyte
    jmp pulsec_com_pulse_lang_UByte_parse__String_epilogue
pulsec_com_pulse_lang_UByte_parse__String_epilogue:
pulsec_com_pulse_lang_UByte_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_UByte_parse__String endp

pulsec_com_pulse_lang_UByte_ubyteValue__UByte proc
    sub rsp, 184
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
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_ubyteValue__UByte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue:
pulsec_com_pulse_lang_UByte_ubyteValue__UByte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_UByte_ubyteValue__UByte endp

pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte proc
    sub rsp, 200
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
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue:
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_UByte_equals__ubyte_ubyte endp

pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte proc
    sub rsp, 216
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
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len
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
    jne pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b1:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b2:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b3:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len
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
    jne pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b4
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b5
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b4:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b5:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b6
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_b6:
    lea rcx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4
    mov edx, pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue:
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 216
    ret
pulsec_com_pulse_lang_UByte_compare__ubyte_ubyte endp

pulsec_com_pulse_lang_UByte_toString__ubyte proc
    sub rsp, 184
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
pulsec_com_pulse_lang_UByte_toString__ubyte_b0:
    lea rcx, pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0
    mov edx, pulsec_com_pulse_lang_UByte_toString__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    movzx eax, al
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    jmp pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue
pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue:
pulsec_com_pulse_lang_UByte_toString__ubyte_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_UByte_toString__ubyte endp

end
