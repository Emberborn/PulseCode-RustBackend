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
extrn pulsec_rt_objectClassName:proc
extrn pulsec_rt_objectHashCode:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_Class_Class__String:proc
extrn pulsec_rt_objectClassName:proc
extrn pulsec_rt_objectHashCode:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Object dd 0
trace_m0 db "com.pulse.lang.Object.hashCode"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Object_hashCode_trace_s0 db "com.pulse.lang.Object.hashCode(Object.pulse:14)"
pulsec_com_pulse_lang_Object_hashCode_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_hashCode_trace_s0
trace_m2 db "com.pulse.lang.Object.toString"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Object_toString_trace_s0 db "com.pulse.lang.Object.toString(Object.pulse:22)"
pulsec_com_pulse_lang_Object_toString_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_toString_trace_s0
trace_m4 db "com.pulse.lang.Object.equals"
trace_m4_len equ $ - trace_m4
pulsec_com_pulse_lang_Object_equals__Object_trace_s0 db "com.pulse.lang.Object.equals(Object.pulse:30)"
pulsec_com_pulse_lang_Object_equals__Object_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_equals__Object_trace_s0
trace_m6 db "com.pulse.lang.Object.getClass"
trace_m6_len equ $ - trace_m6
pulsec_com_pulse_lang_Object_getClass_trace_s0 db "com.pulse.lang.Object.getClass(Object.pulse:38)"
pulsec_com_pulse_lang_Object_getClass_trace_s0_len equ $ - pulsec_com_pulse_lang_Object_getClass_trace_s0

.code
pulsec_com_pulse_lang_Object_hashCode proc
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
pulsec_com_pulse_lang_Object_hashCode_b0:
    lea rcx, pulsec_com_pulse_lang_Object_hashCode_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_hashCode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectHashCode
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Object_hashCode_epilogue
pulsec_com_pulse_lang_Object_hashCode_epilogue:
pulsec_com_pulse_lang_Object_hashCode_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_hashCode endp

pulsec_com_pulse_lang_Object_toString proc
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
pulsec_com_pulse_lang_Object_toString_b0:
    lea rcx, pulsec_com_pulse_lang_Object_toString_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectClassName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_com_pulse_lang_Object_toString_epilogue
pulsec_com_pulse_lang_Object_toString_epilogue:
pulsec_com_pulse_lang_Object_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_toString endp

pulsec_com_pulse_lang_Object_equals__Object proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_Object_equals__Object_b0:
    lea rcx, pulsec_com_pulse_lang_Object_equals__Object_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_com_pulse_lang_Object_equals__Object_epilogue
pulsec_com_pulse_lang_Object_equals__Object_epilogue:
pulsec_com_pulse_lang_Object_equals__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Object_equals__Object endp

pulsec_com_pulse_lang_Object_getClass proc
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
pulsec_com_pulse_lang_Object_getClass_b0:
    lea rcx, pulsec_com_pulse_lang_Object_getClass_trace_s0
    mov edx, pulsec_com_pulse_lang_Object_getClass_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_objectClassName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    call pulsec_com_pulse_lang_Class_Class__String
    jmp pulsec_com_pulse_lang_Object_getClass_epilogue
pulsec_com_pulse_lang_Object_getClass_epilogue:
pulsec_com_pulse_lang_Object_getClass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Object_getClass endp

end
