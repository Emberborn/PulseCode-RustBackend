option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_arcCycleFullPass:proc
extrn pulsec_rt_arcCycleTick:proc
extrn pulsec_rt_arcCycleYoungPass:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_weakClear:proc
extrn pulsec_rt_weakGet:proc
extrn pulsec_rt_weakNew:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Memory dd 0
trace_m0 db "com.pulse.lang.Memory.retain"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Memory_retain__long_trace_s0 db "com.pulse.lang.Memory.retain(Memory.pulse:15)"
pulsec_com_pulse_lang_Memory_retain__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_retain__long_trace_s0
trace_m2 db "com.pulse.lang.Memory.release"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Memory_release__long_trace_s0 db "com.pulse.lang.Memory.release(Memory.pulse:23)"
pulsec_com_pulse_lang_Memory_release__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_release__long_trace_s0
trace_m4 db "com.pulse.lang.Memory.release"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Memory_release__String_trace_s0 db "com.pulse.lang.Memory.release(Memory.pulse:31)"
pulsec_com_pulse_lang_Memory_release__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_release__String_trace_s0
trace_m6 db "com.pulse.lang.Memory.cycleYoungPass"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_Memory_cycleYoungPass_trace_s0 db "com.pulse.lang.Memory.cycleYoungPass(Memory.pulse:39)"
pulsec_com_pulse_lang_Memory_cycleYoungPass_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_cycleYoungPass_trace_s0
trace_m8 db "com.pulse.lang.Memory.cycleFullPass"
trace_m8_len equ $ - trace_m8
pulsec_com_pulse_lang_Memory_cycleFullPass_trace_s0 db "com.pulse.lang.Memory.cycleFullPass(Memory.pulse:47)"
pulsec_com_pulse_lang_Memory_cycleFullPass_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_cycleFullPass_trace_s0
trace_m10 db "com.pulse.lang.Memory.cycleTick"
trace_m10_len equ $ - trace_m10
pulsec_com_pulse_lang_Memory_cycleTick_trace_s0 db "com.pulse.lang.Memory.cycleTick(Memory.pulse:55)"
pulsec_com_pulse_lang_Memory_cycleTick_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_cycleTick_trace_s0
trace_m12 db "com.pulse.lang.Memory.weakNew"
trace_m12_len equ $ - trace_m12
pulsec_com_pulse_lang_Memory_weakNew__String_trace_s0 db "com.pulse.lang.Memory.weakNew(Memory.pulse:63)"
pulsec_com_pulse_lang_Memory_weakNew__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_weakNew__String_trace_s0
trace_m14 db "com.pulse.lang.Memory.weakGet"
trace_m14_len equ $ - trace_m14
pulsec_com_pulse_lang_Memory_weakGet__long_trace_s0 db "com.pulse.lang.Memory.weakGet(Memory.pulse:71)"
pulsec_com_pulse_lang_Memory_weakGet__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_weakGet__long_trace_s0
trace_m16 db "com.pulse.lang.Memory.weakClear"
trace_m16_len equ $ - trace_m16
pulsec_com_pulse_lang_Memory_weakClear__long_trace_s0 db "com.pulse.lang.Memory.weakClear(Memory.pulse:79)"
pulsec_com_pulse_lang_Memory_weakClear__long_trace_s0_len equ $ - pulsec_com_pulse_lang_Memory_weakClear__long_trace_s0

.code
pulsec_com_pulse_lang_Memory_retain__long proc
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
pulsec_com_pulse_lang_Memory_retain__long_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_retain__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_retain__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_com_pulse_lang_Memory_retain__long_epilogue
pulsec_com_pulse_lang_Memory_retain__long_epilogue:
pulsec_com_pulse_lang_Memory_retain__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_retain__long endp

pulsec_com_pulse_lang_Memory_release__long proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Memory_release__long_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_release__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_release__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    xor eax, eax
    jmp pulsec_com_pulse_lang_Memory_release__long_epilogue
pulsec_com_pulse_lang_Memory_release__long_epilogue:
pulsec_com_pulse_lang_Memory_release__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_release__long endp

pulsec_com_pulse_lang_Memory_release__String proc
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Memory_release__String_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_release__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_release__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    xor eax, eax
    jmp pulsec_com_pulse_lang_Memory_release__String_epilogue
pulsec_com_pulse_lang_Memory_release__String_epilogue:
pulsec_com_pulse_lang_Memory_release__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_release__String endp

pulsec_com_pulse_lang_Memory_cycleYoungPass proc
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
pulsec_com_pulse_lang_Memory_cycleYoungPass_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_cycleYoungPass_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_cycleYoungPass_trace_s0_len
    call pulsec_rt_traceUpdateTop
    call pulsec_rt_arcCycleYoungPass
    jmp pulsec_com_pulse_lang_Memory_cycleYoungPass_epilogue
pulsec_com_pulse_lang_Memory_cycleYoungPass_epilogue:
pulsec_com_pulse_lang_Memory_cycleYoungPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_cycleYoungPass endp

pulsec_com_pulse_lang_Memory_cycleFullPass proc
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
pulsec_com_pulse_lang_Memory_cycleFullPass_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_cycleFullPass_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_cycleFullPass_trace_s0_len
    call pulsec_rt_traceUpdateTop
    call pulsec_rt_arcCycleFullPass
    jmp pulsec_com_pulse_lang_Memory_cycleFullPass_epilogue
pulsec_com_pulse_lang_Memory_cycleFullPass_epilogue:
pulsec_com_pulse_lang_Memory_cycleFullPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_cycleFullPass endp

pulsec_com_pulse_lang_Memory_cycleTick proc
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
pulsec_com_pulse_lang_Memory_cycleTick_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_cycleTick_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_cycleTick_trace_s0_len
    call pulsec_rt_traceUpdateTop
    call pulsec_rt_arcCycleTick
    jmp pulsec_com_pulse_lang_Memory_cycleTick_epilogue
pulsec_com_pulse_lang_Memory_cycleTick_epilogue:
pulsec_com_pulse_lang_Memory_cycleTick_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_cycleTick endp

pulsec_com_pulse_lang_Memory_weakNew__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Memory_weakNew__String_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_weakNew__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_weakNew__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_weakNew
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Memory_weakNew__String_epilogue
pulsec_com_pulse_lang_Memory_weakNew__String_epilogue:
pulsec_com_pulse_lang_Memory_weakNew__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_weakNew__String endp

pulsec_com_pulse_lang_Memory_weakGet__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Memory_weakGet__long_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_weakGet__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_weakGet__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_weakGet
    jmp pulsec_com_pulse_lang_Memory_weakGet__long_epilogue
pulsec_com_pulse_lang_Memory_weakGet__long_epilogue:
pulsec_com_pulse_lang_Memory_weakGet__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_weakGet__long endp

pulsec_com_pulse_lang_Memory_weakClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Memory_weakClear__long_b0:
    lea rcx, pulsec_com_pulse_lang_Memory_weakClear__long_trace_s0
    mov edx, pulsec_com_pulse_lang_Memory_weakClear__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_weakClear
    xor eax, eax
    jmp pulsec_com_pulse_lang_Memory_weakClear__long_epilogue
pulsec_com_pulse_lang_Memory_weakClear__long_epilogue:
pulsec_com_pulse_lang_Memory_weakClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Memory_weakClear__long endp

end
