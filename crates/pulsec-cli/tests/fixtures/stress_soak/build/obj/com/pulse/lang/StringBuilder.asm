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
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_com_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_com_pulse_lang_String_valueOf__int:proc

.data
written dq 0
pulsec_objc_com_pulse_lang_StringBuilder dd 0
pulsec_fld_com_pulse_lang_StringBuilder_value dd 64 dup(0)
trace_m0 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.StringBuilder.StringBuilder"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.StringBuilder.append"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.StringBuilder.append"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.StringBuilder.append"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.lang.StringBuilder.length"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.lang.StringBuilder.clear"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.lang.StringBuilder.toString"
trace_m7_len equ $ - trace_m7
msg0 db 0
msg0_len equ $ - msg0
msg1 db 0
msg1_len equ $ - msg1

.code
pulsec_com_pulse_lang_StringBuilder_StringBuilder proc
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_StringBuilder]
    cmp eax, 63
    jae pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat_done
pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_StringBuilder_StringBuilder_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_StringBuilder], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_StringBuilder_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue
pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue:
pulsec_com_pulse_lang_StringBuilder_StringBuilder_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder endp

pulsec_com_pulse_lang_StringBuilder_StringBuilder__String proc
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
    mov eax, dword ptr [pulsec_objc_com_pulse_lang_StringBuilder]
    cmp eax, 63
    jae pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat_done
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat:
    mov eax, 63
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_lang_StringBuilder], eax
    mov ecx, eax
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_b0:
    mov eax, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_StringBuilder__String endp

pulsec_com_pulse_lang_StringBuilder_append__String proc
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
pulsec_com_pulse_lang_StringBuilder_append__String_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+80]
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__String_epilogue
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__String endp

pulsec_com_pulse_lang_StringBuilder_append__int proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_append__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__int
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__int_epilogue
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__int endp

pulsec_com_pulse_lang_StringBuilder_append__boolean proc
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
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_lang_StringBuilder_append__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue:
pulsec_com_pulse_lang_StringBuilder_append__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_StringBuilder_append__boolean endp

pulsec_com_pulse_lang_StringBuilder_length proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_length_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    jmp pulsec_com_pulse_lang_StringBuilder_length_epilogue
pulsec_com_pulse_lang_StringBuilder_length_epilogue:
pulsec_com_pulse_lang_StringBuilder_length_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_length endp

pulsec_com_pulse_lang_StringBuilder_clear proc
    sub rsp, 120
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
pulsec_com_pulse_lang_StringBuilder_clear_b0:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_lang_StringBuilder_clear_epilogue
pulsec_com_pulse_lang_StringBuilder_clear_epilogue:
pulsec_com_pulse_lang_StringBuilder_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_clear endp

pulsec_com_pulse_lang_StringBuilder_toString proc
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_StringBuilder_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_lang_StringBuilder_value
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_com_pulse_lang_StringBuilder_toString_epilogue
pulsec_com_pulse_lang_StringBuilder_toString_epilogue:
pulsec_com_pulse_lang_StringBuilder_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_StringBuilder_toString endp

end
