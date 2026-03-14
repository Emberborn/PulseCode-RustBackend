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
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_com_pulse_lang_Throwable_getMessage:proc
extrn pulsec_rt_stringConcat:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_IllegalStateException dd 0
trace_m0 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.lang.IllegalStateException.IllegalStateException"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.lang.IllegalStateException.toString"
trace_m2_len equ $ - trace_m2
msg0 db "IllegalStateException"
msg0_len equ $ - msg0
msg1 db "IllegalStateException: "
msg1_len equ $ - msg1

.code
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException proc
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
    mov ecx, 26
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException endp

pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String proc
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
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
    mov ecx, 26
    call pulsec_rt_objectNew
    mov ecx, eax
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_b0:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue:
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_IllegalStateException__String endp

pulsec_com_pulse_lang_IllegalStateException_toString proc
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
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_lang_IllegalStateException_toString_b0:
    mov rcx, qword ptr [rsp+72]
    cmp ecx, 0
    je IllegalStateException_toString_vd0_2_null
    call pulsec_com_pulse_lang_Throwable_getMessage
    jmp IllegalStateException_toString_vd0_2_done
IllegalStateException_toString_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
IllegalStateException_toString_vd0_2_done:
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_lang_IllegalStateException_toString_b1
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b2
pulsec_com_pulse_lang_IllegalStateException_toString_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_b2:
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_b3
pulsec_com_pulse_lang_IllegalStateException_toString_b3:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_lang_IllegalStateException_toString_epilogue
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue:
pulsec_com_pulse_lang_IllegalStateException_toString_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_IllegalStateException_toString endp

end
