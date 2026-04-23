option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn Sleep:proc
extrn SwitchToThread:proc
extrn GetCurrentThreadId:proc
extrn CreateThread:proc
extrn CreateMutexA:proc
extrn ReleaseMutex:proc
extrn CreateEventA:proc
extrn SetEvent:proc
extrn ResetEvent:proc
extrn CloseHandle:proc
extrn CreateSemaphoreA:proc
extrn ReleaseSemaphore:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_valueOf__char:proc
extrn pulsec_rt_panic:proc
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
extrn pulsec_fget_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MAX_VALUE:proc

public pulsec_fld_pulse_lang_Long_MIN_VALUE
public pulsec_fget_pulse_lang_Long_MIN_VALUE
public pulsec_fset_pulse_lang_Long_MIN_VALUE
public pulsec_fld_pulse_lang_Long_MAX_VALUE
public pulsec_fget_pulse_lang_Long_MAX_VALUE
public pulsec_fset_pulse_lang_Long_MAX_VALUE

extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_pulse_lang_Long dd 0
pulsec_fld_pulse_lang_Long_MIN_VALUE dq -9223372036854775808
pulsec_fld_pulse_lang_Long_MAX_VALUE dq 9223372036854775807
trace_m0 db "pulse.lang.Long.valueOf"
trace_m0_len equ 23
trace_m1 db "pulse.lang.Long.parse"
trace_m1_len equ 21
trace_m2 db "pulse.lang.Long.longValue"
trace_m2_len equ 25
trace_m3 db "pulse.lang.Long.equals"
trace_m3_len equ 22
trace_m4 db "pulse.lang.Long.compare"
trace_m4_len equ 23
trace_m5 db "pulse.lang.Long.toString"
trace_m5_len equ 24
msg0 db "Invalid long literal"
msg0_len equ 20
msg1 db "Invalid long literal"
msg1_len equ 20
msg2 db "Invalid long literal"
msg2_len equ 20
msg3 db "Invalid long literal"
msg3_len equ 20
msg4 db "Invalid long literal"
msg4_len equ 20
msg5 db "Invalid long literal"
msg5_len equ 20
msg6 db "0"
msg6_len equ 1
msg7 db 0
msg7_len equ 0
msg8 db "-"
msg8_len equ 1

.code
pulsec_pulse_lang_Long_valueOf__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Long_valueOf__long_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Long_valueOf__long_epilogue
pulsec_pulse_lang_Long_valueOf__long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Long_valueOf__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Long_valueOf__long endp

pulsec_pulse_lang_Long_parse__String proc
    sub rsp, 456
    mov qword ptr [rsp+424], rcx
    mov qword ptr [rsp+432], rdx
    mov qword ptr [rsp+440], r8
    mov qword ptr [rsp+448], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
pulsec_pulse_lang_Long_parse__String_b0:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b1
    jmp pulsec_pulse_lang_Long_parse__String_b2
pulsec_pulse_lang_Long_parse__String_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b3
pulsec_pulse_lang_Long_parse__String_b2:
    jmp pulsec_pulse_lang_Long_parse__String_b3
pulsec_pulse_lang_Long_parse__String_b3:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b4
    jmp pulsec_pulse_lang_Long_parse__String_b5
pulsec_pulse_lang_Long_parse__String_b4:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b6
pulsec_pulse_lang_Long_parse__String_b5:
    jmp pulsec_pulse_lang_Long_parse__String_b6
pulsec_pulse_lang_Long_parse__String_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov dword ptr [rsp+80], eax
    mov rax, 0
    mov qword ptr [rsp+160], rax
    call pulsec_fget_pulse_lang_Long_MAX_VALUE
    mov rdx, rax
    mov rax, qword ptr [rsp+160]
    sub rax, rdx
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov eax, 0
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b7
    jmp pulsec_pulse_lang_Long_parse__String_b8
pulsec_pulse_lang_Long_parse__String_b7:
    mov eax, 1
    mov dword ptr [rsp+80], eax
    call pulsec_fget_pulse_lang_Long_MIN_VALUE
    mov qword ptr [rsp+88], rax
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Long_parse__String_b9
pulsec_pulse_lang_Long_parse__String_b8:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+176], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b10
    jmp pulsec_pulse_lang_Long_parse__String_b11
pulsec_pulse_lang_Long_parse__String_b9:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b13
    jmp pulsec_pulse_lang_Long_parse__String_b14
pulsec_pulse_lang_Long_parse__String_b10:
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Long_parse__String_b12
pulsec_pulse_lang_Long_parse__String_b11:
    jmp pulsec_pulse_lang_Long_parse__String_b12
pulsec_pulse_lang_Long_parse__String_b12:
    jmp pulsec_pulse_lang_Long_parse__String_b9
pulsec_pulse_lang_Long_parse__String_b13:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b15
pulsec_pulse_lang_Long_parse__String_b14:
    jmp pulsec_pulse_lang_Long_parse__String_b15
pulsec_pulse_lang_Long_parse__String_b15:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+192], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+104], rax
    mov rax, 0
    mov qword ptr [rsp+112], rax
    jmp pulsec_pulse_lang_Long_parse__String_b16
pulsec_pulse_lang_Long_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b17
    jmp pulsec_pulse_lang_Long_parse__String_b18
pulsec_pulse_lang_Long_parse__String_b17:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+208], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Long_parse_ternary_then_21_67
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+216], eax
    mov eax, 57
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp Long_parse_ternary_done_21_67
Long_parse_ternary_then_21_67:
    mov eax, 1
Long_parse_ternary_done_21_67:
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b19
    jmp pulsec_pulse_lang_Long_parse__String_b20
pulsec_pulse_lang_Long_parse__String_b18:
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b28
    jmp pulsec_pulse_lang_Long_parse__String_b29
pulsec_pulse_lang_Long_parse__String_b19:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b21
pulsec_pulse_lang_Long_parse__String_b20:
    jmp pulsec_pulse_lang_Long_parse__String_b21
pulsec_pulse_lang_Long_parse__String_b21:
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+232]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b22
    jmp pulsec_pulse_lang_Long_parse__String_b23
pulsec_pulse_lang_Long_parse__String_b22:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b24
pulsec_pulse_lang_Long_parse__String_b23:
    jmp pulsec_pulse_lang_Long_parse__String_b24
pulsec_pulse_lang_Long_parse__String_b24:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+240]
    imul rax, rdx
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+128]
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+248]
    add rax, rdx
    mov rdx, rax
    mov rax, qword ptr [rsp+256]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b25
    jmp pulsec_pulse_lang_Long_parse__String_b26
pulsec_pulse_lang_Long_parse__String_b25:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Long_parse__String_b27
pulsec_pulse_lang_Long_parse__String_b26:
    jmp pulsec_pulse_lang_Long_parse__String_b27
pulsec_pulse_lang_Long_parse__String_b27:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+264], rax
    mov eax, dword ptr [rsp+128]
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+264]
    sub rax, rdx
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Long_parse__String_b16
pulsec_pulse_lang_Long_parse__String_b28:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_pulse_lang_Long_valueOf__long
    jmp pulsec_pulse_lang_Long_parse__String_epilogue
pulsec_pulse_lang_Long_parse__String_b29:
    jmp pulsec_pulse_lang_Long_parse__String_b30
pulsec_pulse_lang_Long_parse__String_b30:
    mov rax, 0
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+280]
    sub rax, rdx
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_pulse_lang_Long_valueOf__long
    jmp pulsec_pulse_lang_Long_parse__String_epilogue
pulsec_pulse_lang_Long_parse__String_epilogue:
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
pulsec_pulse_lang_Long_parse__String_epilogue_post:
    mov qword ptr [rsp+328], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+328]
    add rsp, 456
    ret
pulsec_pulse_lang_Long_parse__String endp

pulsec_pulse_lang_Long_longValue__Long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Long_longValue__Long_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Long_longValue__Long_epilogue
pulsec_pulse_lang_Long_longValue__Long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Long_longValue__Long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Long_longValue__Long endp

pulsec_pulse_lang_Long_equals__long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Long_equals__long_long_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_Long_equals__long_long_epilogue
pulsec_pulse_lang_Long_equals__long_long_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Long_equals__long_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Long_equals__long_long endp

pulsec_pulse_lang_Long_compare__long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Long_compare__long_long_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_compare__long_long_b1
    jmp pulsec_pulse_lang_Long_compare__long_long_b2
pulsec_pulse_lang_Long_compare__long_long_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Long_compare__long_long_epilogue
pulsec_pulse_lang_Long_compare__long_long_b2:
    jmp pulsec_pulse_lang_Long_compare__long_long_b3
pulsec_pulse_lang_Long_compare__long_long_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_compare__long_long_b4
    jmp pulsec_pulse_lang_Long_compare__long_long_b5
pulsec_pulse_lang_Long_compare__long_long_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_Long_compare__long_long_epilogue
pulsec_pulse_lang_Long_compare__long_long_b5:
    jmp pulsec_pulse_lang_Long_compare__long_long_b6
pulsec_pulse_lang_Long_compare__long_long_b6:
    mov eax, 0
    jmp pulsec_pulse_lang_Long_compare__long_long_epilogue
pulsec_pulse_lang_Long_compare__long_long_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_Long_compare__long_long_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_Long_compare__long_long endp

pulsec_pulse_lang_Long_toString__long proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_Long_toString__long_b0:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b1
    jmp pulsec_pulse_lang_Long_toString__long_b2
pulsec_pulse_lang_Long_toString__long_b1:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Long_toString__long_epilogue
pulsec_pulse_lang_Long_toString__long_b2:
    jmp pulsec_pulse_lang_Long_toString__long_b3
pulsec_pulse_lang_Long_toString__long_b3:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+128], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    setl al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b4
    jmp pulsec_pulse_lang_Long_toString__long_b5
pulsec_pulse_lang_Long_toString__long_b4:
    mov rax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    sub rax, rdx
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_Long_toString__long_b6
pulsec_pulse_lang_Long_toString__long_b5:
    jmp pulsec_pulse_lang_Long_toString__long_b6
pulsec_pulse_lang_Long_toString__long_b6:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    jmp pulsec_pulse_lang_Long_toString__long_b7
pulsec_pulse_lang_Long_toString__long_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, 10
    neg rax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b8
    jmp pulsec_pulse_lang_Long_toString__long_b9
pulsec_pulse_lang_Long_toString__long_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+160]
    imul rax, rdx
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+168]
    sub rax, rdx
    mov dword ptr [rsp+96], eax
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_Long_toString__long_b7
pulsec_pulse_lang_Long_toString__long_b9:
    mov rax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    sub rax, rdx
    mov dword ptr [rsp+104], eax
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b10
    jmp pulsec_pulse_lang_Long_toString__long_b11
pulsec_pulse_lang_Long_toString__long_b10:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    jmp pulsec_pulse_lang_Long_toString__long_epilogue
pulsec_pulse_lang_Long_toString__long_b11:
    jmp pulsec_pulse_lang_Long_toString__long_b12
pulsec_pulse_lang_Long_toString__long_b12:
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Long_toString__long_epilogue
pulsec_pulse_lang_Long_toString__long_epilogue:
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+240]
pulsec_pulse_lang_Long_toString__long_epilogue_post:
    mov qword ptr [rsp+240], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+240]
    add rsp, 408
    ret
pulsec_pulse_lang_Long_toString__long endp

pulsec_fget_pulse_lang_Long_MIN_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Long_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_Long_MIN_VALUE endp

pulsec_fset_pulse_lang_Long_MIN_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Long_MIN_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Long_MIN_VALUE endp


pulsec_fget_pulse_lang_Long_MAX_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Long_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_Long_MAX_VALUE endp

pulsec_fset_pulse_lang_Long_MAX_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Long_MAX_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Long_MAX_VALUE endp


end
