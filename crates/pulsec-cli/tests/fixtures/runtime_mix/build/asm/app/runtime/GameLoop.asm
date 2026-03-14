option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_app_runtime_GameLoop dd 0
trace_m0 db "app.runtime.GameLoop.tick"
trace_m0_len equ $ - trace_m0
pulsec_app_runtime_GameLoop_tick_trace_s0 db "app.runtime.GameLoop.tick(GameLoop.pulse:5)"
pulsec_app_runtime_GameLoop_tick_trace_s0_len equ $ - pulsec_app_runtime_GameLoop_tick_trace_s0

.code
pulsec_app_runtime_GameLoop_tick proc
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
pulsec_app_runtime_GameLoop_tick_b0:
    lea rcx, pulsec_app_runtime_GameLoop_tick_trace_s0
    mov edx, pulsec_app_runtime_GameLoop_tick_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_app_runtime_GameLoop_tick_epilogue
pulsec_app_runtime_GameLoop_tick_epilogue:
pulsec_app_runtime_GameLoop_tick_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_app_runtime_GameLoop_tick endp

end
