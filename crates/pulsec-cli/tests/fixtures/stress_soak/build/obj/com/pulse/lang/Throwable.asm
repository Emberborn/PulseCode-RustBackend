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
extrn pulsec_rt_stringConcat:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_Throwable dd 0
pulsec_fld_com_pulse_lang_Throwable_message dd 64 dup(0)
trace_m0 db "com.pulse.lang.Throwable.Throwable"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.Throwable.Throwable"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.Throwable.getMessage"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.Throwable.toString"
trace_m3_len equ $ - trace_m3
msg0 db 0
msg0_len equ $ - msg0
msg1 db "Throwable"
msg1_len equ $ - msg1
msg2 db "Throwable: "
msg2_len equ $ - msg2

.code
pulsec_com_pulse_lang_Throwable_Throwable proc
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Throwable]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat_done
pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Throwable_Throwable_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Throwable], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_Throwable_Throwable_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Throwable_Throwable_epilogue
pulsec_com_pulse_lang_Throwable_Throwable_epilogue:
pulsec_com_pulse_lang_Throwable_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_Throwable endp

pulsec_com_pulse_lang_Throwable_Throwable__String proc
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Throwable]
    cmp eax, 63
    jae pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat_done
pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_Throwable_Throwable__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_Throwable], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_Throwable_Throwable__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue
pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue:
pulsec_com_pulse_lang_Throwable_Throwable__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Throwable_Throwable__String endp

pulsec_com_pulse_lang_Throwable_getMessage proc
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
pulsec_com_pulse_lang_Throwable_getMessage_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_Throwable_getMessage_epilogue
pulsec_com_pulse_lang_Throwable_getMessage_epilogue:
pulsec_com_pulse_lang_Throwable_getMessage_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Throwable_getMessage endp

pulsec_com_pulse_lang_Throwable_toString proc
    sub rsp, 136
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
pulsec_com_pulse_lang_Throwable_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Throwable_toString_b1
    jmp pulsec_com_pulse_lang_Throwable_toString_b2
pulsec_com_pulse_lang_Throwable_toString_b1:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_Throwable_toString_epilogue
pulsec_com_pulse_lang_Throwable_toString_b2:
    jmp pulsec_com_pulse_lang_Throwable_toString_b3
pulsec_com_pulse_lang_Throwable_toString_b3:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_Throwable_message
    mov eax, dword ptr [r10+rdx*4]
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
    jmp pulsec_com_pulse_lang_Throwable_toString_epilogue
pulsec_com_pulse_lang_Throwable_toString_epilogue:
pulsec_com_pulse_lang_Throwable_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Throwable_toString endp

end
