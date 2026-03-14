option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Enum dd 0
trace_m0 db "com.pulse.lang.Enum.Enum"
trace_m0_len equ $ - trace_m0

.code
pulsec_com_pulse_lang_Enum_Enum proc
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
    mov ecx, 14
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Enum_Enum_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Enum_Enum_epilogue
pulsec_com_pulse_lang_Enum_Enum_epilogue:
pulsec_com_pulse_lang_Enum_Enum_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Enum_Enum endp

end
