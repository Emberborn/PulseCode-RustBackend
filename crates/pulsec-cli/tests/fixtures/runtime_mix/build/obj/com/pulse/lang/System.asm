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
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_System dd 0
pulsec_fld_com_pulse_lang_System_out dq 0
pulsec_fld_com_pulse_lang_System_err dq 0
trace_m0 db "com.pulse.lang.System.currentTimeMillis"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_System_currentTimeMillis_trace_s0 db "com.pulse.lang.System.currentTimeMillis(System.pulse:24)"
pulsec_com_pulse_lang_System_currentTimeMillis_trace_s0_len equ $ - pulsec_com_pulse_lang_System_currentTimeMillis_trace_s0
trace_m2 db "com.pulse.lang.System.nanoTime"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_System_nanoTime_trace_s0 db "com.pulse.lang.System.nanoTime(System.pulse:32)"
pulsec_com_pulse_lang_System_nanoTime_trace_s0_len equ $ - pulsec_com_pulse_lang_System_nanoTime_trace_s0
trace_m4 db "com.pulse.lang.System.exit"
trace_m4_len equ $ - trace_m4

.code
pulsec_com_pulse_lang_System_currentTimeMillis proc
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
pulsec_com_pulse_lang_System_currentTimeMillis_b0:
    lea rcx, pulsec_com_pulse_lang_System_currentTimeMillis_trace_s0
    mov edx, pulsec_com_pulse_lang_System_currentTimeMillis_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    jmp pulsec_com_pulse_lang_System_currentTimeMillis_epilogue
pulsec_com_pulse_lang_System_currentTimeMillis_epilogue:
pulsec_com_pulse_lang_System_currentTimeMillis_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_System_currentTimeMillis endp

pulsec_com_pulse_lang_System_nanoTime proc
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
pulsec_com_pulse_lang_System_nanoTime_b0:
    lea rcx, pulsec_com_pulse_lang_System_nanoTime_trace_s0
    mov edx, pulsec_com_pulse_lang_System_nanoTime_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    jmp pulsec_com_pulse_lang_System_nanoTime_epilogue
pulsec_com_pulse_lang_System_nanoTime_epilogue:
pulsec_com_pulse_lang_System_nanoTime_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_System_nanoTime endp

pulsec_com_pulse_lang_System_exit__int proc
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
pulsec_com_pulse_lang_System_exit__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_System_exit__int_epilogue
pulsec_com_pulse_lang_System_exit__int_epilogue:
pulsec_com_pulse_lang_System_exit__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_System_exit__int endp

end
