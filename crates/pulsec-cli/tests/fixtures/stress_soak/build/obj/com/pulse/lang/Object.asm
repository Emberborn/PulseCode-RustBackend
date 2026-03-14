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
extrn pulsec_com_pulse_lang_Class_Class__String:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_Object dd 0
trace_m0 db "com.pulse.lang.Object.toString"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.Object.equals"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.Object.getClass"
trace_m2_len equ $ - trace_m2
msg0 db "Object"
msg0_len equ $ - msg0
msg1 db "Object"
msg1_len equ $ - msg1

.code
pulsec_com_pulse_lang_Object_toString proc
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
pulsec_com_pulse_lang_Object_toString_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Object_toString_epilogue
pulsec_com_pulse_lang_Object_toString_epilogue:
pulsec_com_pulse_lang_Object_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_toString endp

pulsec_com_pulse_lang_Object_equals__Object proc
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
pulsec_com_pulse_lang_Object_equals__Object_b0:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Object_equals__Object_epilogue
pulsec_com_pulse_lang_Object_equals__Object_epilogue:
pulsec_com_pulse_lang_Object_equals__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Object_equals__Object endp

pulsec_com_pulse_lang_Object_getClass proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Object_getClass_b0:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    call pulsec_com_pulse_lang_Class_Class__String
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Object_getClass_epilogue
pulsec_com_pulse_lang_Object_getClass_epilogue:
pulsec_com_pulse_lang_Object_getClass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_getClass endp

end
