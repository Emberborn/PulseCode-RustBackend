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
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_valueOf__long:proc
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
extrn pulsec_fget_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MAX_VALUE:proc

public pulsec_fld_pulse_lang_UInteger_MIN_VALUE
public pulsec_fget_pulse_lang_UInteger_MIN_VALUE
public pulsec_fset_pulse_lang_UInteger_MIN_VALUE
public pulsec_fld_pulse_lang_UInteger_MAX_VALUE
public pulsec_fget_pulse_lang_UInteger_MAX_VALUE
public pulsec_fset_pulse_lang_UInteger_MAX_VALUE

.data
written dq 0
pulsec_objc_pulse_lang_UInteger dd 0
pulsec_fld_pulse_lang_UInteger_MIN_VALUE dd 0
pulsec_fld_pulse_lang_UInteger_MAX_VALUE dd 4294967295
trace_m0 db "pulse.lang.UInteger.valueOf"
trace_m0_len equ 27
trace_m1 db "pulse.lang.UInteger.parse"
trace_m1_len equ 25
trace_m2 db "pulse.lang.UInteger.uintValue"
trace_m2_len equ 29
trace_m3 db "pulse.lang.UInteger.equals"
trace_m3_len equ 26
trace_m4 db "pulse.lang.UInteger.compare"
trace_m4_len equ 27
trace_m5 db "pulse.lang.UInteger.toString"
trace_m5_len equ 28
msg0 db "Invalid uint literal"
msg0_len equ 20
msg1 db "Invalid uint literal"
msg1_len equ 20
msg2 db "Invalid uint literal"
msg2_len equ 20
msg3 db "Invalid uint literal"
msg3_len equ 20
msg4 db "Invalid uint literal"
msg4_len equ 20
msg5 db "Invalid uint literal"
msg5_len equ 20
msg6 db "Invalid uint literal"
msg6_len equ 20

.code
pulsec_pulse_lang_UInteger_valueOf__uint proc
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
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_UInteger_valueOf__uint_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_UInteger_valueOf__uint_epilogue
pulsec_pulse_lang_UInteger_valueOf__uint_epilogue:
pulsec_pulse_lang_UInteger_valueOf__uint_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_UInteger_valueOf__uint endp

pulsec_pulse_lang_UInteger_parse__String proc
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
    mov qword ptr [rsp+144], rcx
pulsec_pulse_lang_UInteger_parse__String_b0:
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+152], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b1
    jmp pulsec_pulse_lang_UInteger_parse__String_b2
pulsec_pulse_lang_UInteger_parse__String_b1:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b3
pulsec_pulse_lang_UInteger_parse__String_b2:
    jmp pulsec_pulse_lang_UInteger_parse__String_b3
pulsec_pulse_lang_UInteger_parse__String_b3:
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+160], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b4
    jmp pulsec_pulse_lang_UInteger_parse__String_b5
pulsec_pulse_lang_UInteger_parse__String_b4:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b6
pulsec_pulse_lang_UInteger_parse__String_b5:
    jmp pulsec_pulse_lang_UInteger_parse__String_b6
pulsec_pulse_lang_UInteger_parse__String_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+336], rax
    mov eax, 0
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov eax, eax
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b7
    jmp pulsec_pulse_lang_UInteger_parse__String_b8
pulsec_pulse_lang_UInteger_parse__String_b7:
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_UInteger_parse__String_b9
pulsec_pulse_lang_UInteger_parse__String_b8:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+176], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b10
    jmp pulsec_pulse_lang_UInteger_parse__String_b11
pulsec_pulse_lang_UInteger_parse__String_b9:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b13
    jmp pulsec_pulse_lang_UInteger_parse__String_b14
pulsec_pulse_lang_UInteger_parse__String_b10:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b12
pulsec_pulse_lang_UInteger_parse__String_b11:
    jmp pulsec_pulse_lang_UInteger_parse__String_b12
pulsec_pulse_lang_UInteger_parse__String_b12:
    jmp pulsec_pulse_lang_UInteger_parse__String_b9
pulsec_pulse_lang_UInteger_parse__String_b13:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b15
pulsec_pulse_lang_UInteger_parse__String_b14:
    jmp pulsec_pulse_lang_UInteger_parse__String_b15
pulsec_pulse_lang_UInteger_parse__String_b15:
    mov rax, 0
    mov qword ptr [rsp+88], rax
    mov rax, 10
    mov qword ptr [rsp+96], rax
    mov rax, 4294967295
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+104], rax
    mov rax, 4294967295
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rdx
    cqo
    idiv rcx
    mov rax, rdx
    mov qword ptr [rsp+112], rax
    jmp pulsec_pulse_lang_UInteger_parse__String_b16
pulsec_pulse_lang_UInteger_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+208], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b17
    jmp pulsec_pulse_lang_UInteger_parse__String_b18
pulsec_pulse_lang_UInteger_parse__String_b17:
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+336], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov eax, eax
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+216], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne UInteger_parse_ternary_then_19_63
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+224], eax
    mov eax, 57
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp UInteger_parse_ternary_done_19_63
UInteger_parse_ternary_then_19_63:
    mov eax, 1
UInteger_parse_ternary_done_19_63:
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b19
    jmp pulsec_pulse_lang_UInteger_parse__String_b20
pulsec_pulse_lang_UInteger_parse__String_b18:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov eax, eax
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov ecx, eax
    call pulsec_pulse_lang_UInteger_valueOf__uint
    jmp pulsec_pulse_lang_UInteger_parse__String_epilogue
pulsec_pulse_lang_UInteger_parse__String_b19:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b21
pulsec_pulse_lang_UInteger_parse__String_b20:
    jmp pulsec_pulse_lang_UInteger_parse__String_b21
pulsec_pulse_lang_UInteger_parse__String_b21:
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+232], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    sub eax, edx
    movsxd rax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+240]
    cmp rax, rdx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b22
    jmp pulsec_pulse_lang_UInteger_parse__String_b23
pulsec_pulse_lang_UInteger_parse__String_b22:
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b24
pulsec_pulse_lang_UInteger_parse__String_b23:
    jmp pulsec_pulse_lang_UInteger_parse__String_b24
pulsec_pulse_lang_UInteger_parse__String_b24:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+248]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne UInteger_parse_ternary_then_24_88
    mov eax, 0
    jmp UInteger_parse_ternary_done_24_88
UInteger_parse_ternary_then_24_88:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+256]
    cmp rax, rdx
    setg al
    movzx eax, al
UInteger_parse_ternary_done_24_88:
    test eax, eax
    jne pulsec_pulse_lang_UInteger_parse__String_b25
    jmp pulsec_pulse_lang_UInteger_parse__String_b26
pulsec_pulse_lang_UInteger_parse__String_b25:
    lea rcx, msg6
    mov edx, msg6_len
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
    jmp pulsec_pulse_lang_UInteger_parse__String_b27
pulsec_pulse_lang_UInteger_parse__String_b26:
    jmp pulsec_pulse_lang_UInteger_parse__String_b27
pulsec_pulse_lang_UInteger_parse__String_b27:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+264]
    imul rax, rdx
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rax, qword ptr [rsp+272]
    add rax, rdx
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+280], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_UInteger_parse__String_b16
pulsec_pulse_lang_UInteger_parse__String_epilogue:
pulsec_pulse_lang_UInteger_parse__String_epilogue_post:
    mov qword ptr [rsp+328], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+328]
    add rsp, 456
    ret
pulsec_pulse_lang_UInteger_parse__String endp

pulsec_pulse_lang_UInteger_uintValue__UInteger proc
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
pulsec_pulse_lang_UInteger_uintValue__UInteger_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_UInteger_uintValue__UInteger_epilogue
pulsec_pulse_lang_UInteger_uintValue__UInteger_epilogue:
pulsec_pulse_lang_UInteger_uintValue__UInteger_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_UInteger_uintValue__UInteger endp

pulsec_pulse_lang_UInteger_equals__uint_uint proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_UInteger_equals__uint_uint_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_UInteger_equals__uint_uint_epilogue
pulsec_pulse_lang_UInteger_equals__uint_uint_epilogue:
pulsec_pulse_lang_UInteger_equals__uint_uint_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_UInteger_equals__uint_uint endp

pulsec_pulse_lang_UInteger_compare__uint_uint proc
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
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_UInteger_compare__uint_uint_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_compare__uint_uint_b1
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b2
pulsec_pulse_lang_UInteger_compare__uint_uint_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_b2:
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b3
pulsec_pulse_lang_UInteger_compare__uint_uint_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_UInteger_compare__uint_uint_b4
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b5
pulsec_pulse_lang_UInteger_compare__uint_uint_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_b5:
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b6
pulsec_pulse_lang_UInteger_compare__uint_uint_b6:
    mov eax, 0
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue:
pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_UInteger_compare__uint_uint endp

pulsec_pulse_lang_UInteger_toString__uint proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_UInteger_toString__uint_b0:
    mov eax, dword ptr [rsp+64]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    jmp pulsec_pulse_lang_UInteger_toString__uint_epilogue
pulsec_pulse_lang_UInteger_toString__uint_epilogue:
pulsec_pulse_lang_UInteger_toString__uint_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_UInteger_toString__uint endp

pulsec_fget_pulse_lang_UInteger_MIN_VALUE proc
    mov eax, dword ptr [pulsec_fld_pulse_lang_UInteger_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_UInteger_MIN_VALUE endp

pulsec_fset_pulse_lang_UInteger_MIN_VALUE proc
    mov dword ptr [pulsec_fld_pulse_lang_UInteger_MIN_VALUE], ecx
    ret
pulsec_fset_pulse_lang_UInteger_MIN_VALUE endp


pulsec_fget_pulse_lang_UInteger_MAX_VALUE proc
    mov eax, dword ptr [pulsec_fld_pulse_lang_UInteger_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_UInteger_MAX_VALUE endp

pulsec_fset_pulse_lang_UInteger_MAX_VALUE proc
    mov dword ptr [pulsec_fld_pulse_lang_UInteger_MAX_VALUE], ecx
    ret
pulsec_fset_pulse_lang_UInteger_MAX_VALUE endp


end
