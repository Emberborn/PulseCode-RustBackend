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
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_IO dd 0
trace_m0 db "com.pulse.lang.IO.println"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_IO_println__String_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:14)"
pulsec_com_pulse_lang_IO_println__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__String_trace_s0
trace_m2 db "com.pulse.lang.IO.println"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_IO_println__int_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:22)"
pulsec_com_pulse_lang_IO_println__int_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__int_trace_s0
trace_m4 db "com.pulse.lang.IO.println"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_IO_println__boolean_trace_s0 db "com.pulse.lang.IO.println(IO.pulse:30)"
pulsec_com_pulse_lang_IO_println__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_println__boolean_trace_s0
trace_m6 db "com.pulse.lang.IO.print"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_IO_print__String_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:38)"
pulsec_com_pulse_lang_IO_print__String_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__String_trace_s0
trace_m8 db "com.pulse.lang.IO.print"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_IO_print__int_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:46)"
pulsec_com_pulse_lang_IO_print__int_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__int_trace_s0
trace_m10 db "com.pulse.lang.IO.print"
trace_m10_len equ $ - trace_m10
pulsec_com_pulse_lang_IO_print__boolean_trace_s0 db "com.pulse.lang.IO.print(IO.pulse:54)"
pulsec_com_pulse_lang_IO_print__boolean_trace_s0_len equ $ - pulsec_com_pulse_lang_IO_print__boolean_trace_s0

.code
pulsec_com_pulse_lang_IO_println__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IO_println__String_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__String_epilogue
pulsec_com_pulse_lang_IO_println__String_epilogue:
pulsec_com_pulse_lang_IO_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__String endp

pulsec_com_pulse_lang_IO_println__int proc
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
pulsec_com_pulse_lang_IO_println__int_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__int_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__int_epilogue
pulsec_com_pulse_lang_IO_println__int_epilogue:
pulsec_com_pulse_lang_IO_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__int endp

pulsec_com_pulse_lang_IO_println__boolean proc
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
pulsec_com_pulse_lang_IO_println__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_IO_println__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_println__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_println__boolean_epilogue
pulsec_com_pulse_lang_IO_println__boolean_epilogue:
pulsec_com_pulse_lang_IO_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_println__boolean endp

pulsec_com_pulse_lang_IO_print__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IO_print__String_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__String_epilogue
pulsec_com_pulse_lang_IO_print__String_epilogue:
pulsec_com_pulse_lang_IO_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__String endp

pulsec_com_pulse_lang_IO_print__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__int_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__int_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__int_epilogue
pulsec_com_pulse_lang_IO_print__int_epilogue:
pulsec_com_pulse_lang_IO_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__int endp

pulsec_com_pulse_lang_IO_print__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_lang_IO_print__boolean_b0:
    lea rcx, pulsec_com_pulse_lang_IO_print__boolean_trace_s0
    mov edx, pulsec_com_pulse_lang_IO_print__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_booleanToString
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_com_pulse_lang_IO_print__boolean_epilogue
pulsec_com_pulse_lang_IO_print__boolean_epilogue:
pulsec_com_pulse_lang_IO_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IO_print__boolean endp

end
