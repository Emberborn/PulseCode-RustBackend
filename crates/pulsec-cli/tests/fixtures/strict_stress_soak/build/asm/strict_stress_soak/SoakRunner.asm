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
extrn pulsec_com_pulse_collections_ArrayList_ArrayList:proc
extrn pulsec_com_pulse_collections_ArrayList_add__int:proc
extrn pulsec_com_pulse_collections_ArrayList_clear:proc
extrn pulsec_com_pulse_collections_ArrayList_size:proc
extrn pulsec_com_pulse_collections_HashMap_HashMap:proc
extrn pulsec_com_pulse_collections_HashMap_getInt__String:proc
extrn pulsec_com_pulse_collections_HashMap_putInt__String_int:proc
extrn pulsec_com_pulse_collections_HashSet_HashSet:proc
extrn pulsec_com_pulse_collections_HashSet_add__String:proc
extrn pulsec_com_pulse_collections_HashSet_size:proc
extrn pulsec_com_pulse_collections_LinkedList_LinkedList:proc
extrn pulsec_com_pulse_collections_LinkedList_offer__int:proc
extrn pulsec_com_pulse_collections_LinkedList_poll:proc
extrn pulsec_com_pulse_collections_LinkedList_size:proc
extrn pulsec_com_pulse_lang_String_concat__String:proc
extrn pulsec_com_pulse_lang_String_length:proc
extrn pulsec_strict_stress_soak_Token_Token__int:proc
extrn pulsec_strict_stress_soak_Token_value:proc


.data
written dq 0
pulsec_objc_strict_stress_soak_SoakRunner dd 0
trace_m0 db "strict_stress_soak.SoakRunner.run"
trace_m0_len equ $ - trace_m0
msg0 db "x"
msg0_len equ $ - msg0
msg1 db "last"
msg1_len equ $ - msg1
msg2 db "even"
msg2_len equ $ - msg2
msg3 db "odd"
msg3_len equ $ - msg3
msg4 db "a"
msg4_len equ $ - msg4
msg5 db "x"
msg5_len equ $ - msg5
msg6 db "last"
msg6_len equ $ - msg6

.code
pulsec_strict_stress_soak_SoakRunner_run__int proc
    sub rsp, 376
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
    mov dword ptr [rsp+176], edx
    mov qword ptr [rsp+184], rcx
pulsec_strict_stress_soak_SoakRunner_run__int_b0:
    call pulsec_com_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+64], rax
    call pulsec_com_pulse_collections_LinkedList_LinkedList
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+72], rax
    call pulsec_com_pulse_collections_HashMap_HashMap
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+80], rax
    call pulsec_com_pulse_collections_HashSet_HashSet
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+88], rax
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov dword ptr [rsp+128], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b1
pulsec_strict_stress_soak_SoakRunner_run__int_b1:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+176]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b2
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b3
pulsec_strict_stress_soak_SoakRunner_run__int_b2:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+200], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    call pulsec_strict_stress_soak_Token_Token__int
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd11_18_null
    call pulsec_strict_stress_soak_Token_value
    jmp SoakRunner_run_vd11_18_done
SoakRunner_run_vd11_18_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd11_18_done:
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_12_4_null
    call pulsec_com_pulse_collections_ArrayList_add__int
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_12_4_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_12_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_12_4_done:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd13_25_null
    call pulsec_com_pulse_collections_ArrayList_size
    jmp SoakRunner_run_vd13_25_done
SoakRunner_run_vd13_25_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd13_25_done:
    mov dword ptr [rsp+208], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b4
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b5
pulsec_strict_stress_soak_SoakRunner_run__int_b3:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b16
pulsec_strict_stress_soak_SoakRunner_run__int_b4:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_14_0_null
    call pulsec_com_pulse_collections_ArrayList_clear
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_14_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_14_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_14_0_done:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b6
pulsec_strict_stress_soak_SoakRunner_run__int_b5:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b6
pulsec_strict_stress_soak_SoakRunner_run__int_b6:
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_15_0_null
    call pulsec_com_pulse_collections_LinkedList_offer__int
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_15_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_15_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_15_0_done:
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd16_37_null
    call pulsec_com_pulse_collections_LinkedList_size
    jmp SoakRunner_run_vd16_37_done
SoakRunner_run_vd16_37_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd16_37_done:
    mov dword ptr [rsp+216], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b7
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b8
pulsec_strict_stress_soak_SoakRunner_run__int_b7:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+224], eax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd17_44_null
    call pulsec_com_pulse_collections_LinkedList_poll
    jmp SoakRunner_run_vd17_44_done
SoakRunner_run_vd17_44_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd17_44_done:
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b9
pulsec_strict_stress_soak_SoakRunner_run__int_b8:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b9
pulsec_strict_stress_soak_SoakRunner_run__int_b9:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+320]
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+328], eax
    mov rax, qword ptr [rsp+320]
    mov rdx, rax
    mov eax, dword ptr [rsp+328]
    mov r8d, eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_18_0_null
    call pulsec_com_pulse_collections_HashMap_putInt__String_int
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_18_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_18_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_18_0_done:
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+232], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b10
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b11
pulsec_strict_stress_soak_SoakRunner_run__int_b10:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+320]
    mov rax, qword ptr [rsp+320]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_20_0_null
    call pulsec_com_pulse_collections_HashSet_add__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_20_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_20_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_20_0_done:
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 1
    mov dword ptr [rsp+120], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b12
pulsec_strict_stress_soak_SoakRunner_run__int_b11:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+320]
    mov rax, qword ptr [rsp+320]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    cmp ecx, 0
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_22_0_null
    call pulsec_com_pulse_collections_HashSet_add__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_22_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_22_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_22_0_done:
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 0
    mov dword ptr [rsp+120], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b12
pulsec_strict_stress_soak_SoakRunner_run__int_b12:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+320]
    mov rax, qword ptr [rsp+320]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+240], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b13
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b14
pulsec_strict_stress_soak_SoakRunner_run__int_b13:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+96], rax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b15
pulsec_strict_stress_soak_SoakRunner_run__int_b14:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b15
pulsec_strict_stress_soak_SoakRunner_run__int_b15:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+248], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+256], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    add eax, edx
    mov dword ptr [rsp+112], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b1
pulsec_strict_stress_soak_SoakRunner_run__int_b16:
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd29_88_null
    call pulsec_com_pulse_collections_LinkedList_size
    jmp SoakRunner_run_vd29_88_done
SoakRunner_run_vd29_88_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd29_88_done:
    mov dword ptr [rsp+264], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b17
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b18
pulsec_strict_stress_soak_SoakRunner_run__int_b17:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+272], eax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd30_95_null
    call pulsec_com_pulse_collections_LinkedList_poll
    jmp SoakRunner_run_vd30_95_done
SoakRunner_run_vd30_95_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd30_95_done:
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b16
pulsec_strict_stress_soak_SoakRunner_run__int_b18:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+320]
    mov rax, qword ptr [rsp+320]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd31_100_null
    call pulsec_com_pulse_collections_HashMap_getInt__String
    jmp SoakRunner_run_vd31_100_done
SoakRunner_run_vd31_100_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd31_100_done:
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov dword ptr [rsp+152], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd32_103_null
    call pulsec_com_pulse_collections_HashSet_size
    jmp SoakRunner_run_vd32_103_done
SoakRunner_run_vd32_103_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd32_103_done:
    mov dword ptr [rsp+160], eax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    cmp ecx, 0
    je SoakRunner_run_vd33_106_null
    call pulsec_com_pulse_collections_ArrayList_size
    jmp SoakRunner_run_vd33_106_done
SoakRunner_run_vd33_106_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd33_106_done:
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+280], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    add eax, edx
    mov dword ptr [rsp+288], eax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov eax, dword ptr [rsp+288]
    add eax, edx
    mov dword ptr [rsp+296], eax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    add eax, edx
    mov dword ptr [rsp+304], eax
    mov eax, dword ptr [rsp+168]
    mov edx, eax
    mov eax, dword ptr [rsp+304]
    add eax, edx
    mov dword ptr [rsp+312], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_com_pulse_lang_String_length
    mov edx, eax
    mov eax, dword ptr [rsp+312]
    add eax, edx
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_epilogue
pulsec_strict_stress_soak_SoakRunner_run__int_epilogue:
pulsec_strict_stress_soak_SoakRunner_run__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 376
    ret
pulsec_strict_stress_soak_SoakRunner_run__int endp

end
