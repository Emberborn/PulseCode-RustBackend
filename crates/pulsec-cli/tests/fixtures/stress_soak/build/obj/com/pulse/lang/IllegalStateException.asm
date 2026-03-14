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
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_com_pulse_lang_Throwable_getMessage:proc
extrn pulsec_rt_stringConcat:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_IllegalStateException dd 0
trace_m0 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.IllegalStateException.toString"
trace_m2_len equ $ - trace_m2
msg0 db "IllegalStateException"
msg0_len equ $ - msg0
msg1 db "IllegalStateException: "
msg1_len equ $ - msg1

.code
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException proc
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException endp

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException]
    cmp eax, 63
    jae pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat_done
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_IllegalStateException], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String endp

pulsec_com_pulse_lang_IllegalStateException_toString proc
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
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_IllegalStateException_toString_b0:
    mov ecx, dword ptr [rsp+72]
    call pulsec_com_pulse_lang_Throwable_getMessage
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_IllegalStateException_toString_b1
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b2
pulsec_com_pulse_lang_IllegalStateException_toString_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_b2:
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b3
pulsec_com_pulse_lang_IllegalStateException_toString_b3:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue:
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_toString endp

end
