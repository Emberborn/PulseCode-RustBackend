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
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_IllegalArgumentException dd 0
trace_m0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m0_len equ 64
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:12)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0_len equ 99
trace_m2 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m2_len equ 64
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:20)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0_len equ 99
trace_m4 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException"
trace_m4_len equ 64
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0 db "com.pulse.lang.IllegalArgumentException.IllegalArgumentException(IllegalArgumentException.pulse:28)"
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0_len equ 99
msg0 db "IllegalArgumentException"
msg0_len equ 24
msg1 db "IllegalArgumentException"
msg1_len equ 24
msg2 db "IllegalArgumentException"
msg2_len equ 24

.code
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException proc
    sub rsp, 184
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
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov eax, dword ptr [rsp+80]
    mov r8d, eax
    mov eax, dword ptr [rsp+88]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException endp

pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String proc
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
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    xor eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+120]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov eax, dword ptr [rsp+96]
    mov r9d, eax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String endp

pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable proc
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
    mov qword ptr [rsp+80], r8
    mov ecx, 20
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_b0:
    lea rcx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0
    mov edx, pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+104], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+64]
    cmp ecx, 0
    je pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_null
    call pulsec_com_pulse_lang_Throwable_initThrowableState__String_String_Throwable
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_done
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue:
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_lang_IllegalArgumentException_IllegalArgumentException__String_Throwable endp

end
