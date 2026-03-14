option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_stringConcat:proc
extrn pulsec_rt_stringLength:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_String dd 0
trace_m0 db "com.pulse.lang.String.length"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.String.isEmpty"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.String.concat"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.String.valueOf"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.String.valueOf"
trace_m4_len equ $ - trace_m4

.code
pulsec_com_pulse_lang_String_length proc
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
pulsec_com_pulse_lang_String_length_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_stringLength
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_String_length_epilogue
pulsec_com_pulse_lang_String_length_epilogue:
pulsec_com_pulse_lang_String_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_length endp

pulsec_com_pulse_lang_String_isEmpty proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_isEmpty_b0:
    mov ecx, dword ptr [rsp+64]
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_String_isEmpty_epilogue
pulsec_com_pulse_lang_String_isEmpty_epilogue:
pulsec_com_pulse_lang_String_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_isEmpty endp

pulsec_com_pulse_lang_String_concat__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_String_concat__String_b0:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_lang_String_concat__String_epilogue
pulsec_com_pulse_lang_String_concat__String_epilogue:
pulsec_com_pulse_lang_String_concat__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_String_concat__String endp

pulsec_com_pulse_lang_String_valueOf__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    jmp pulsec_com_pulse_lang_String_valueOf__int_epilogue
pulsec_com_pulse_lang_String_valueOf__int_epilogue:
pulsec_com_pulse_lang_String_valueOf__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_valueOf__int endp

pulsec_com_pulse_lang_String_valueOf__boolean proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_String_valueOf__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_booleanToString
    jmp pulsec_com_pulse_lang_String_valueOf__boolean_epilogue
pulsec_com_pulse_lang_String_valueOf__boolean_epilogue:
pulsec_com_pulse_lang_String_valueOf__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_String_valueOf__boolean endp

end
