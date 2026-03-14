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
extrn pulsec_rt_panic:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_Float dd 0
trace_m0 db "com.pulse.lang.Float.valueOf"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.Float.parse"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.Float.floatValue"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.Float.equals"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.Float.compare"
trace_m4_len equ $ - trace_m4
msg0 db "Float.parse is not supported yet"
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_Float_valueOf__float proc
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
pulsec_com_pulse_lang_Float_valueOf__float_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_valueOf__float_epilogue
pulsec_com_pulse_lang_Float_valueOf__float_epilogue:
pulsec_com_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_valueOf__float endp

pulsec_com_pulse_lang_Float_parse__String proc
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
pulsec_com_pulse_lang_Float_parse__String_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+72], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+72]
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_Float]
    cmp eax, 63
    jae Float_ctor_expr_sat_5
    add eax, 1
    jmp Float_ctor_expr_done_5
Float_ctor_expr_sat_5:
    mov eax, 63
Float_ctor_expr_done_5:
    mov dword ptr [pulsec_objc_com_pulse_lang_Float], eax
    jmp pulsec_com_pulse_lang_Float_parse__String_epilogue
pulsec_com_pulse_lang_Float_parse__String_epilogue:
pulsec_com_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_parse__String endp

pulsec_com_pulse_lang_Float_floatValue__Float proc
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
pulsec_com_pulse_lang_Float_floatValue__Float_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_floatValue__Float_epilogue
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue:
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_floatValue__Float endp

pulsec_com_pulse_lang_Float_equals__float_float proc
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Float_equals__float_float_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Float_equals__float_float_epilogue
pulsec_com_pulse_lang_Float_equals__float_float_epilogue:
pulsec_com_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_equals__float_float endp

pulsec_com_pulse_lang_Float_compare__float_float proc
    sub rsp, 136
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_Float_compare__float_float_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b2
pulsec_com_pulse_lang_Float_compare__float_float_b1:
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b2:
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b3
pulsec_com_pulse_lang_Float_compare__float_float_b3:
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_epilogue:
pulsec_com_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_compare__float_float endp

end
