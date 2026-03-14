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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable:proc
extrn pulsec_rt_panic:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_AssertionError dd 0
trace_m0 db "com.pulse.lang.AssertionError.AssertionError"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0 db "com.pulse.lang.AssertionError.AssertionError(AssertionError.pulse:14)"
pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0
trace_m2 db "com.pulse.lang.AssertionError.AssertionError"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0 db "com.pulse.lang.AssertionError.AssertionError(AssertionError.pulse:22)"
pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0
trace_m4 db "com.pulse.lang.AssertionError.fail"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_AssertionError_fail_trace_s0 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:30)"
pulsec_com_pulse_lang_AssertionError_fail_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_fail_trace_s0
trace_m6 db "com.pulse.lang.AssertionError.fail"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:38)"
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0_len equ $ - pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1 db "com.pulse.lang.AssertionError.fail(AssertionError.pulse:39)"
pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1_len equ $ - pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1
msg0 db "AssertionError"
msg0_len equ $ - msg0
msg1 db "AssertionError"
msg1_len equ $ - msg1
msg2 db "AssertionError"
msg2_len equ $ - msg2
msg3 db "AssertionError: "
msg3_len equ $ - msg3

.code
pulsec_com_pulse_lang_AssertionError_AssertionError proc
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
    mov ecx, 5
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_AssertionError_AssertionError_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_AssertionError_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    xor eax, eax
    mov dword ptr [rsp+80], eax
    xor eax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_AssertionError_AssertionError_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue
pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue:
pulsec_com_pulse_lang_AssertionError_AssertionError_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_AssertionError_AssertionError endp

pulsec_com_pulse_lang_AssertionError_AssertionError__String proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 5
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_AssertionError_AssertionError__String_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_AssertionError__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    xor eax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_AssertionError_AssertionError__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue
pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue:
pulsec_com_pulse_lang_AssertionError_AssertionError__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_AssertionError_AssertionError__String endp

pulsec_com_pulse_lang_AssertionError_fail proc
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
pulsec_com_pulse_lang_AssertionError_fail_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_fail_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+64], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    xor eax, eax
    jmp pulsec_com_pulse_lang_AssertionError_fail_epilogue
pulsec_com_pulse_lang_AssertionError_fail_epilogue:
pulsec_com_pulse_lang_AssertionError_fail_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_AssertionError_fail endp

pulsec_com_pulse_lang_AssertionError_fail__String proc
    sub rsp, 136
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_AssertionError_fail__String_b0:
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0
    mov edx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1
    mov edx, pulsec_com_pulse_lang_AssertionError_fail__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_rt_panic
    xor eax, eax
    jmp pulsec_com_pulse_lang_AssertionError_fail__String_epilogue
pulsec_com_pulse_lang_AssertionError_fail__String_epilogue:
pulsec_com_pulse_lang_AssertionError_fail__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_AssertionError_fail__String endp

end
