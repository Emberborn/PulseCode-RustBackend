option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_std_com_pulse_lang_IO_println:proc


.data
written dq 0
pulsec_objc_app_runtime_Main dd 0
trace_m0 db "app.runtime.Main.main"
trace_m0_len equ $ - trace_m0
pulsec_app_runtime_Main_main_trace_s0 db "app.runtime.Main.main(Main.pulse:6)"
pulsec_app_runtime_Main_main_trace_s0_len equ $ - pulsec_app_runtime_Main_main_trace_s0
msg0 db "runtime_mix_ok"
msg0_len equ $ - msg0

.code
pulsec_app_runtime_Main_main proc
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
pulsec_app_runtime_Main_main_b0:
    lea rcx, pulsec_app_runtime_Main_main_trace_s0
    mov edx, pulsec_app_runtime_Main_main_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_app_runtime_Main_main_epilogue
pulsec_app_runtime_Main_main_epilogue:
pulsec_app_runtime_Main_main_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_Main_main endp

end
