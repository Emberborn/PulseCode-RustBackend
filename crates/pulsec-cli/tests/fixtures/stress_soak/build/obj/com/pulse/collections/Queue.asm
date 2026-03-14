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
pulsec_objc_com_pulse_collections_Queue dd 0
trace_m0 db "com.pulse.collections.Queue.offer"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.collections.Queue.poll"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.collections.Queue.isEmpty"
trace_m2_len equ $ - trace_m2

.code
pulsec_com_pulse_collections_Queue_offer__int proc
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
pulsec_com_pulse_collections_Queue_offer__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_offer__int_epilogue
pulsec_com_pulse_collections_Queue_offer__int_epilogue:
pulsec_com_pulse_collections_Queue_offer__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Queue_offer__int endp

pulsec_com_pulse_collections_Queue_poll proc
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
pulsec_com_pulse_collections_Queue_poll_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_poll_epilogue
pulsec_com_pulse_collections_Queue_poll_epilogue:
pulsec_com_pulse_collections_Queue_poll_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Queue_poll endp

pulsec_com_pulse_collections_Queue_isEmpty proc
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
pulsec_com_pulse_collections_Queue_isEmpty_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Queue_isEmpty_epilogue
pulsec_com_pulse_collections_Queue_isEmpty_epilogue:
pulsec_com_pulse_collections_Queue_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Queue_isEmpty endp

end
