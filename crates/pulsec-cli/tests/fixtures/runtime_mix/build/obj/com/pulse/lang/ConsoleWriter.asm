option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_ConsoleWriter dd 0
trace_m0 db "com.pulse.lang.ConsoleWriter.println"
trace_m0_len equ 36
trace_m1 db "com.pulse.lang.ConsoleWriter.println"
trace_m1_len equ 36
trace_m2 db "com.pulse.lang.ConsoleWriter.println"
trace_m2_len equ 36
trace_m3 db "com.pulse.lang.ConsoleWriter.println"
trace_m3_len equ 36
trace_m4 db "com.pulse.lang.ConsoleWriter.print"
trace_m4_len equ 34
trace_m5 db "com.pulse.lang.ConsoleWriter.print"
trace_m5_len equ 34
trace_m6 db "com.pulse.lang.ConsoleWriter.print"
trace_m6_len equ 34
trace_m7 db "com.pulse.lang.ConsoleWriter.print"
trace_m7_len equ 34

.code
pulsec_com_pulse_lang_ConsoleWriter_println__String proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ConsoleWriter_println__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__String endp

pulsec_com_pulse_lang_ConsoleWriter_println__int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_ConsoleWriter_println__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__int endp

pulsec_com_pulse_lang_ConsoleWriter_println__long proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ConsoleWriter_println__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__long_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__long_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__long endp

pulsec_com_pulse_lang_ConsoleWriter_println__boolean proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__boolean endp

pulsec_com_pulse_lang_ConsoleWriter_print__String proc
    sub rsp, 200
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
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ConsoleWriter_print__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__String endp

pulsec_com_pulse_lang_ConsoleWriter_print__int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_ConsoleWriter_print__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__int endp

pulsec_com_pulse_lang_ConsoleWriter_print__long proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_ConsoleWriter_print__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__long_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__long_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__long endp

pulsec_com_pulse_lang_ConsoleWriter_print__boolean proc
    sub rsp, 200
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
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__boolean endp

end
