option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_obj_counter:dword
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_ConsoleWriter dd 0
trace_m0 db "com.pulse.lang.ConsoleWriter.println"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.ConsoleWriter.println"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.ConsoleWriter.println"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.lang.ConsoleWriter.print"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.lang.ConsoleWriter.print"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.lang.ConsoleWriter.print"
trace_m5_len equ $ - trace_m5

.code
pulsec_com_pulse_lang_ConsoleWriter_println__String proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_println__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__String endp

pulsec_com_pulse_lang_ConsoleWriter_println__int proc
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_println__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__int endp

pulsec_com_pulse_lang_ConsoleWriter_println__boolean proc
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
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_println__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_println__boolean endp

pulsec_com_pulse_lang_ConsoleWriter_print__String proc
    sub rsp, 136
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_print__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__String endp

pulsec_com_pulse_lang_ConsoleWriter_print__int proc
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
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_print__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__int endp

pulsec_com_pulse_lang_ConsoleWriter_print__boolean proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue:
pulsec_com_pulse_lang_ConsoleWriter_print__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_ConsoleWriter_print__boolean endp

end
