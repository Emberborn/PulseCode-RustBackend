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
extrn pulsec_app_stress_Token_Token__int:proc
extrn pulsec_app_stress_Token_value:proc
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

.data
written dq 0
pulsec_objc_app_stress_SoakRunner dd 0
trace_m0 db "app.stress.SoakRunner.run"
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
pulsec_app_stress_SoakRunner_run__int proc
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
    mov dword ptr [rsp+184], ecx
pulsec_app_stress_SoakRunner_run__int_b0:
    call pulsec_com_pulse_collections_ArrayList_ArrayList
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+64], eax
    call pulsec_com_pulse_collections_LinkedList_LinkedList
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+72], eax
    call pulsec_com_pulse_collections_HashMap_HashMap
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+80], eax
    call pulsec_com_pulse_collections_HashSet_HashSet
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+88], eax
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b1
pulsec_app_stress_SoakRunner_run__int_b1:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+176]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b2
    jmp pulsec_app_stress_SoakRunner_run__int_b3
pulsec_app_stress_SoakRunner_run__int_b2:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+200], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    call pulsec_app_stress_Token_Token__int
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_app_stress_Token_value
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_add__int
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_size
    mov dword ptr [rsp+208], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b4
    jmp pulsec_app_stress_SoakRunner_run__int_b5
pulsec_app_stress_SoakRunner_run__int_b3:
    jmp pulsec_app_stress_SoakRunner_run__int_b16
pulsec_app_stress_SoakRunner_run__int_b4:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_clear
    jmp pulsec_app_stress_SoakRunner_run__int_b6
pulsec_app_stress_SoakRunner_run__int_b5:
    jmp pulsec_app_stress_SoakRunner_run__int_b6
pulsec_app_stress_SoakRunner_run__int_b6:
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_offer__int
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_size
    mov dword ptr [rsp+216], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b7
    jmp pulsec_app_stress_SoakRunner_run__int_b8
pulsec_app_stress_SoakRunner_run__int_b7:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+224], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_poll
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b9
pulsec_app_stress_SoakRunner_run__int_b8:
    jmp pulsec_app_stress_SoakRunner_run__int_b9
pulsec_app_stress_SoakRunner_run__int_b9:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+328], eax
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+328]
    mov r8d, eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashMap_putInt__String_int
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
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
    jne pulsec_app_stress_SoakRunner_run__int_b10
    jmp pulsec_app_stress_SoakRunner_run__int_b11
pulsec_app_stress_SoakRunner_run__int_b10:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_add__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 1
    mov dword ptr [rsp+120], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b12
pulsec_app_stress_SoakRunner_run__int_b11:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_add__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov eax, 0
    mov dword ptr [rsp+120], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b12
pulsec_app_stress_SoakRunner_run__int_b12:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_concat__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov dword ptr [rsp+240], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b13
    jmp pulsec_app_stress_SoakRunner_run__int_b14
pulsec_app_stress_SoakRunner_run__int_b13:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+96], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b15
pulsec_app_stress_SoakRunner_run__int_b14:
    jmp pulsec_app_stress_SoakRunner_run__int_b15
pulsec_app_stress_SoakRunner_run__int_b15:
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
    jmp pulsec_app_stress_SoakRunner_run__int_b1
pulsec_app_stress_SoakRunner_run__int_b16:
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_size
    mov dword ptr [rsp+264], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_SoakRunner_run__int_b17
    jmp pulsec_app_stress_SoakRunner_run__int_b18
pulsec_app_stress_SoakRunner_run__int_b17:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+272], eax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_com_pulse_collections_LinkedList_poll
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_app_stress_SoakRunner_run__int_b16
pulsec_app_stress_SoakRunner_run__int_b18:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov dword ptr [rsp+320], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+320]
    mov eax, dword ptr [rsp+320]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashMap_getInt__String
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+320]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+360]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_com_pulse_collections_HashSet_size
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_com_pulse_collections_ArrayList_size
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
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_length
    mov edx, eax
    mov eax, dword ptr [rsp+312]
    add eax, edx
    jmp pulsec_app_stress_SoakRunner_run__int_epilogue
pulsec_app_stress_SoakRunner_run__int_epilogue:
pulsec_app_stress_SoakRunner_run__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 376
    ret
pulsec_app_stress_SoakRunner_run__int endp

end
