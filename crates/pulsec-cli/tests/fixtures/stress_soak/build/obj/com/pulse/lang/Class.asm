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

.data
written dq 0
pulsec_objc_com_pulse_lang_Class dd 0
pulsec_fld_com_pulse_lang_Class_name dd 64 dup(0)
trace_m0 db "com.pulse.lang.Class.Class"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.Class.getName"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.Class.toString"
trace_m2_len equ $ - trace_m2

.code
pulsec_com_pulse_lang_Class_Class__String proc
    sub rsp, 136
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Class]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Class_Class__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Class_Class__String_ctor_sat_done
pulsec_com_pulse_lang_Class_Class__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Class_Class__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Class], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Class_Class__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Class_Class__String_epilogue
pulsec_com_pulse_lang_Class_Class__String_epilogue:
pulsec_com_pulse_lang_Class_Class__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Class_Class__String endp

pulsec_com_pulse_lang_Class_getName proc
    sub rsp, 120
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
pulsec_com_pulse_lang_Class_getName_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Class_getName_epilogue
pulsec_com_pulse_lang_Class_getName_epilogue:
pulsec_com_pulse_lang_Class_getName_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_getName endp

pulsec_com_pulse_lang_Class_toString proc
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
pulsec_com_pulse_lang_Class_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Class_name
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Class_toString_epilogue
pulsec_com_pulse_lang_Class_toString_epilogue:
pulsec_com_pulse_lang_Class_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Class_toString endp

end
