option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_ArrayList_ArrayList:proc
extrn pulsec_pulse_collections_ArrayList_add__String:proc
extrn pulsec_pulse_collections_ArrayList_clear:proc
extrn pulsec_pulse_collections_ArrayList_size:proc
extrn pulsec_pulse_collections_HashMap_HashMap:proc
extrn pulsec_pulse_collections_HashMap_get__Object:proc
extrn pulsec_pulse_collections_HashMap_put__Object_Object:proc
extrn pulsec_pulse_collections_HashSet_HashSet:proc
extrn pulsec_pulse_collections_HashSet_add__String:proc
extrn pulsec_pulse_collections_HashSet_size:proc
extrn pulsec_pulse_collections_LinkedList_LinkedList:proc
extrn pulsec_pulse_collections_LinkedList_offer__String:proc
extrn pulsec_pulse_collections_LinkedList_poll:proc
extrn pulsec_pulse_collections_LinkedList_size:proc
extrn pulsec_pulse_lang_Integer_parse__String:proc
extrn pulsec_pulse_lang_Integer_toString__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_strict_stress_soak_Token_Token__int:proc
extrn pulsec_strict_stress_soak_Token_value:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Integer_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Integer_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Integer_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Integer_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MAX_VALUE:proc


.data
written dq 0
pulsec_objc_strict_stress_soak_SoakRunner dd 0
trace_m0 db "strict_stress_soak.SoakRunner.run"
trace_m0_len equ 33
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s0 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:11)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s0_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s1 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:12)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s1_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s2 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:13)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s2_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s3 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:14)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s3_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s4 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:16)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s4_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s5 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:17)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s5_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s6 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:18)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s6_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s7 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:19)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s7_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s8 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:20)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s8_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:22)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s10 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:23)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s10_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s11 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:24)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s11_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s12 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:25)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s12_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s13 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:27)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s13_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:28)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s15 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:29)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s15_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s16 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:32)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s16_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:33)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s18 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:34)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s18_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s19 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:35)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s19_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s20 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:36)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s20_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s21 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:39)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s21_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:41)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s23 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:42)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s23_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s24 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:43)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s24_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s25 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:45)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s25_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s26 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:46)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s26_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s27 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:49)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s27_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:50)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s29 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:51)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s29_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s30 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:54)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s30_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s31 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:55)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s31_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:58)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s33 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:59)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s33_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s34 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:60)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s34_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s35 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:61)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s35_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s36 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:64)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s36_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s37 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:65)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s37_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s38 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:66)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s38_len equ 54
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s39 db "strict_stress_soak.SoakRunner.run(SoakRunner.aden:67)"
pulsec_strict_stress_soak_SoakRunner_run__int_trace_s39_len equ 54
cidset_0 dd 34
msg0 db "x"
msg0_len equ 1
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "last"
msg2_len equ 4
msg3 db "even"
msg3_len equ 4
msg4 db "odd"
msg4_len equ 3
msg5 db "a"
msg5_len equ 1
msg6 db "x"
msg6_len equ 1
msg7 db "Invalid cast"
msg7_len equ 12
msg8 db "last"
msg8_len equ 4
msg9 db "Invalid cast"
msg9_len equ 12

.code
pulsec_strict_stress_soak_SoakRunner_run__int proc
    sub rsp, 552
    mov qword ptr [rsp+520], rcx
    mov qword ptr [rsp+528], rdx
    mov qword ptr [rsp+536], r8
    mov qword ptr [rsp+544], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+520]
    mov rdx, qword ptr [rsp+528]
    mov r8, qword ptr [rsp+536]
    mov r9, qword ptr [rsp+544]
    mov qword ptr [rsp+200], rcx
    mov dword ptr [rsp+208], edx
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+152], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+160], 0
    mov qword ptr [rsp+80], 0
pulsec_strict_stress_soak_SoakRunner_run__int_b0:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s0
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s1
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedList_LinkedList
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s2
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_HashMap_HashMap
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s3
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_HashSet_HashSet
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s4
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s5
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s6
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s7
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s8
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+128], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b1
pulsec_strict_stress_soak_SoakRunner_run__int_b1:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+216], eax
    mov eax, dword ptr [rsp+208]
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b2
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b3
pulsec_strict_stress_soak_SoakRunner_run__int_b2:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s10
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov eax, eax
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+344]
    mov edx, eax
    xor ecx, ecx
    call pulsec_strict_stress_soak_Token_Token__int
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+136], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s11
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd11_18_null
    call pulsec_strict_stress_soak_Token_value
    jmp SoakRunner_run_vd11_18_done
SoakRunner_run_vd11_18_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd11_18_done:
    movsxd rax, eax
    mov dword ptr [rsp+144], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s12
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+144]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov eax, eax
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+344]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+152], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s13
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_13_6_null
    call pulsec_pulse_collections_ArrayList_add__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_13_6_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_13_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_2_13_6_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd14_29_null
    call pulsec_pulse_collections_ArrayList_size
    jmp SoakRunner_run_vd14_29_done
SoakRunner_run_vd14_29_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd14_29_done:
    movsxd rax, eax
    mov dword ptr [rsp+232], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b4
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b5
pulsec_strict_stress_soak_SoakRunner_run__int_b3:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b16
pulsec_strict_stress_soak_SoakRunner_run__int_b4:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s15
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_15_0_null
    call pulsec_pulse_collections_ArrayList_clear
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_15_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_15_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_4_15_0_done:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b6
pulsec_strict_stress_soak_SoakRunner_run__int_b5:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b6
pulsec_strict_stress_soak_SoakRunner_run__int_b6:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s16
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_16_0_null
    call pulsec_pulse_collections_LinkedList_offer__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_16_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_16_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_6_16_0_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd17_41_null
    call pulsec_pulse_collections_LinkedList_size
    jmp SoakRunner_run_vd17_41_done
SoakRunner_run_vd17_41_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd17_41_done:
    movsxd rax, eax
    mov dword ptr [rsp+240], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b7
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b8
pulsec_strict_stress_soak_SoakRunner_run__int_b7:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s18
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd18_46_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp SoakRunner_run_vd18_46_done
SoakRunner_run_vd18_46_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd18_46_done:
    test rax, rax
    je SoakRunner_run_cast_18_47_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz SoakRunner_run_cast_18_47_fail
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz SoakRunner_run_cast_18_47_ok
SoakRunner_run_cast_18_47_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp SoakRunner_run_cast_18_47_done
SoakRunner_run_cast_18_47_null:
    xor eax, eax
    jmp SoakRunner_run_cast_18_47_done
SoakRunner_run_cast_18_47_ok:
    mov rax, qword ptr [rsp+40]
SoakRunner_run_cast_18_47_done:
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+376]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+160], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s19
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    mov dword ptr [rsp+168], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s20
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s20_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+248], eax
    mov eax, dword ptr [rsp+168]
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s17_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b9
pulsec_strict_stress_soak_SoakRunner_run__int_b8:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b9
pulsec_strict_stress_soak_SoakRunner_run__int_b9:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s21
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s21_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov eax, dword ptr [rsp+144]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov eax, eax
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+344]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov rax, qword ptr [rsp+352]
    mov r8, rax
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+448], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+448]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_21_0_null
    call pulsec_pulse_collections_HashMap_put__Object_Object
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_21_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_21_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_9_21_0_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+352]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+256], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b10
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b11
pulsec_strict_stress_soak_SoakRunner_run__int_b10:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s23
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s23_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_23_0_null
    call pulsec_pulse_collections_HashSet_add__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_23_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_23_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_10_23_0_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s24
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s24_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b12
pulsec_strict_stress_soak_SoakRunner_run__int_b11:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s25
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s25_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+440], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+440]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+384]
    mov rcx, rax
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    test rcx, rcx
    je pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_25_0_null
    call pulsec_pulse_collections_HashSet_add__String
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_25_0_done
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_25_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_strict_stress_soak_SoakRunner_run__int_vd_stmt_11_25_0_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s26
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+120], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s22_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b12
pulsec_strict_stress_soak_SoakRunner_run__int_b12:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s27
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s27_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+392], rax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov rcx, qword ptr [rsp+392]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+264], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b13
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b14
pulsec_strict_stress_soak_SoakRunner_run__int_b13:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s29
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s29_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s28_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b15
pulsec_strict_stress_soak_SoakRunner_run__int_b14:
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b15
pulsec_strict_stress_soak_SoakRunner_run__int_b15:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s30
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+272], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s31
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s31_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+280], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    add eax, edx
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b1
pulsec_strict_stress_soak_SoakRunner_run__int_b16:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd32_101_null
    call pulsec_pulse_collections_LinkedList_size
    jmp SoakRunner_run_vd32_101_done
SoakRunner_run_vd32_101_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd32_101_done:
    movsxd rax, eax
    mov dword ptr [rsp+288], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+288]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_strict_stress_soak_SoakRunner_run__int_b17
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b18
pulsec_strict_stress_soak_SoakRunner_run__int_b17:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s33
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s33_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd33_106_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp SoakRunner_run_vd33_106_done
SoakRunner_run_vd33_106_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd33_106_done:
    test rax, rax
    je SoakRunner_run_cast_33_107_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz SoakRunner_run_cast_33_107_fail
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz SoakRunner_run_cast_33_107_ok
SoakRunner_run_cast_33_107_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp SoakRunner_run_cast_33_107_done
SoakRunner_run_cast_33_107_null:
    xor eax, eax
    jmp SoakRunner_run_cast_33_107_done
SoakRunner_run_cast_33_107_ok:
    mov rax, qword ptr [rsp+40]
SoakRunner_run_cast_33_107_done:
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+376]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+160], rax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s34
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s34_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    mov dword ptr [rsp+168], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s35
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s35_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+296], eax
    mov eax, dword ptr [rsp+168]
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    add eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s32_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_b16
pulsec_strict_stress_soak_SoakRunner_run__int_b18:
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s36
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s36_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+432], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rdx, rax
    mov rcx, qword ptr [rsp+432]
    test rcx, rcx
    je SoakRunner_run_vd36_121_null
    call pulsec_pulse_collections_HashMap_get__Object
    jmp SoakRunner_run_vd36_121_done
SoakRunner_run_vd36_121_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd36_121_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    test rax, rax
    je SoakRunner_run_cast_36_122_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz SoakRunner_run_cast_36_122_fail
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz SoakRunner_run_cast_36_122_ok
SoakRunner_run_cast_36_122_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp SoakRunner_run_cast_36_122_done
SoakRunner_run_cast_36_122_null:
    xor eax, eax
    jmp SoakRunner_run_cast_36_122_done
SoakRunner_run_cast_36_122_ok:
    mov rax, qword ptr [rsp+40]
SoakRunner_run_cast_36_122_done:
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+344], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+344]
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_parse__String
    mov qword ptr [rsp+384], rax
    mov rax, qword ptr [rsp+344]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+384]
    mov dword ptr [rsp+176], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s37
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s37_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd37_126_null
    call pulsec_pulse_collections_HashSet_size
    jmp SoakRunner_run_vd37_126_done
SoakRunner_run_vd37_126_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd37_126_done:
    movsxd rax, eax
    mov dword ptr [rsp+184], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s38
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s38_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    test rcx, rcx
    je SoakRunner_run_vd38_129_null
    call pulsec_pulse_collections_ArrayList_size
    jmp SoakRunner_run_vd38_129_done
SoakRunner_run_vd38_129_null:
    call pulsec_rt_dispatchNullReceiverPanic
SoakRunner_run_vd38_129_done:
    movsxd rax, eax
    mov dword ptr [rsp+192], eax
    lea rcx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s39
    mov edx, pulsec_strict_stress_soak_SoakRunner_run__int_trace_s39_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+304], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+304]
    add eax, edx
    mov dword ptr [rsp+312], eax
    mov eax, dword ptr [rsp+176]
    mov edx, eax
    mov eax, dword ptr [rsp+312]
    add eax, edx
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+320]
    add eax, edx
    mov dword ptr [rsp+328], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+328]
    add eax, edx
    mov dword ptr [rsp+336], eax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+392], rax
    mov rcx, qword ptr [rsp+392]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+336]
    add eax, edx
    jmp pulsec_strict_stress_soak_SoakRunner_run__int_epilogue
pulsec_strict_stress_soak_SoakRunner_run__int_epilogue:
pulsec_strict_stress_soak_SoakRunner_run__int_epilogue_post:
    mov qword ptr [rsp+384], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+384]
    add rsp, 552
    ret
pulsec_strict_stress_soak_SoakRunner_run__int endp

end
