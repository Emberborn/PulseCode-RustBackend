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
pulsec_objc_com_pulse_collections_Deque dd 0
trace_m0 db "com.pulse.collections.Deque.addFirst"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.collections.Deque.addLast"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.collections.Deque.removeFirst"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.collections.Deque.removeLast"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.collections.Deque.isEmpty"
trace_m4_len equ $ - trace_m4

.code
pulsec_com_pulse_collections_Deque_addFirst__int proc
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
pulsec_com_pulse_collections_Deque_addFirst__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_addFirst__int_epilogue
pulsec_com_pulse_collections_Deque_addFirst__int_epilogue:
pulsec_com_pulse_collections_Deque_addFirst__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Deque_addFirst__int endp

pulsec_com_pulse_collections_Deque_addLast__int proc
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
pulsec_com_pulse_collections_Deque_addLast__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_addLast__int_epilogue
pulsec_com_pulse_collections_Deque_addLast__int_epilogue:
pulsec_com_pulse_collections_Deque_addLast__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_Deque_addLast__int endp

pulsec_com_pulse_collections_Deque_removeFirst proc
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
pulsec_com_pulse_collections_Deque_removeFirst_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_removeFirst_epilogue
pulsec_com_pulse_collections_Deque_removeFirst_epilogue:
pulsec_com_pulse_collections_Deque_removeFirst_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_removeFirst endp

pulsec_com_pulse_collections_Deque_removeLast proc
    sub rsp, 120
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
pulsec_com_pulse_collections_Deque_removeLast_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_removeLast_epilogue
pulsec_com_pulse_collections_Deque_removeLast_epilogue:
pulsec_com_pulse_collections_Deque_removeLast_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_removeLast endp

pulsec_com_pulse_collections_Deque_isEmpty proc
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
pulsec_com_pulse_collections_Deque_isEmpty_b0:
    xor eax, eax
    jmp pulsec_com_pulse_collections_Deque_isEmpty_epilogue
pulsec_com_pulse_collections_Deque_isEmpty_epilogue:
pulsec_com_pulse_collections_Deque_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_Deque_isEmpty endp

end
