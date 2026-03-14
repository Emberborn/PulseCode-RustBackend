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
extrn pulsec_std_com_pulse_lang_IO_println:proc
extrn pulsec_strict_stress_soak_SoakRunner_run__int:proc


.data
written dq 0
pulsec_objc_strict_stress_soak_Main dd 0
trace_m0 db "strict_stress_soak.Main.main"
trace_m0_len equ $ - trace_m0
msg0 db "soak_ok"
msg0_len equ $ - msg0
msg1 db "soak_bad"
msg1_len equ $ - msg1

.code
pulsec_strict_stress_soak_Main_main proc
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
pulsec_strict_stress_soak_Main_main_b0:
    mov ecx, 53
    call pulsec_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    mov eax, 200
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je Main_main_vd1_4_null
    call pulsec_strict_stress_soak_SoakRunner_run__int
    jmp Main_main_vd1_4_done
Main_main_vd1_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Main_main_vd1_4_done:
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 20313
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_Main_main_b1
    jmp pulsec_strict_stress_soak_Main_main_b2
pulsec_strict_stress_soak_Main_main_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    jmp pulsec_strict_stress_soak_Main_main_b3
pulsec_strict_stress_soak_Main_main_b2:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_intToString
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    jmp pulsec_strict_stress_soak_Main_main_b3
pulsec_strict_stress_soak_Main_main_b3:
    xor eax, eax
    jmp pulsec_strict_stress_soak_Main_main_epilogue
pulsec_strict_stress_soak_Main_main_epilogue:
pulsec_strict_stress_soak_Main_main_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_strict_stress_soak_Main_main endp

end
