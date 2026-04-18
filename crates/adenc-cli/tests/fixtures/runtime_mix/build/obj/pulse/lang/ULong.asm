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
extrn pulsec_fget_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Long_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_UInteger_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_UInteger_MAX_VALUE:proc

public pulsec_fld_pulse_lang_ULong_MIN_VALUE
public pulsec_fget_pulse_lang_ULong_MIN_VALUE
public pulsec_fset_pulse_lang_ULong_MIN_VALUE
public pulsec_fld_pulse_lang_ULong_MAX_VALUE
public pulsec_fget_pulse_lang_ULong_MAX_VALUE
public pulsec_fset_pulse_lang_ULong_MAX_VALUE

extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_pulse_lang_ULong dd 0
pulsec_fld_pulse_lang_ULong_MIN_VALUE dq 0
pulsec_fld_pulse_lang_ULong_MAX_VALUE dq -1
trace_m0 db "pulse.lang.ULong.valueOf"
trace_m0_len equ 24
trace_m1 db "pulse.lang.ULong.parse"
trace_m1_len equ 22
trace_m2 db "pulse.lang.ULong.ulongValue"
trace_m2_len equ 27
trace_m3 db "pulse.lang.ULong.equals"
trace_m3_len equ 23
trace_m4 db "pulse.lang.ULong.compare"
trace_m4_len equ 24
trace_m5 db "pulse.lang.ULong.toString"
trace_m5_len equ 25
msg0 db "Invalid ulong literal"
msg0_len equ 21
msg1 db "Invalid ulong literal"
msg1_len equ 21
msg2 db "Invalid ulong literal"
msg2_len equ 21
msg3 db "Invalid ulong literal"
msg3_len equ 21
msg4 db "Invalid ulong literal"
msg4_len equ 21
msg5 db "Invalid ulong literal"
msg5_len equ 21
msg6 db "Invalid ulong literal"
msg6_len equ 21
msg7 db "0"
msg7_len equ 1
msg8 db 0
msg8_len equ 0

.code
pulsec_pulse_lang_ULong_valueOf__ulong proc
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
pulsec_pulse_lang_ULong_valueOf__ulong_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_ULong_valueOf__ulong_epilogue
pulsec_pulse_lang_ULong_valueOf__ulong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_ULong_valueOf__ulong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_ULong_valueOf__ulong endp

pulsec_pulse_lang_ULong_parse__String proc
    sub rsp, 440
    mov qword ptr [rsp+408], rcx
    mov qword ptr [rsp+416], rdx
    mov qword ptr [rsp+424], r8
    mov qword ptr [rsp+432], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+408]
    mov rdx, qword ptr [rsp+416]
    mov r8, qword ptr [rsp+424]
    mov r9, qword ptr [rsp+432]
    mov qword ptr [rsp+136], rcx
pulsec_pulse_lang_ULong_parse__String_b0:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b1
    jmp pulsec_pulse_lang_ULong_parse__String_b2
pulsec_pulse_lang_ULong_parse__String_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b3
pulsec_pulse_lang_ULong_parse__String_b2:
    jmp pulsec_pulse_lang_ULong_parse__String_b3
pulsec_pulse_lang_ULong_parse__String_b3:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+328], rax
    mov rcx, qword ptr [rsp+328]
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
    jne pulsec_pulse_lang_ULong_parse__String_b4
    jmp pulsec_pulse_lang_ULong_parse__String_b5
pulsec_pulse_lang_ULong_parse__String_b4:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b6
pulsec_pulse_lang_ULong_parse__String_b5:
    jmp pulsec_pulse_lang_ULong_parse__String_b6
pulsec_pulse_lang_ULong_parse__String_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+328], rax
    mov eax, 0
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+280], rax
    mov eax, dword ptr [rsp+280]
    mov edx, eax
    mov rcx, qword ptr [rsp+328]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b7
    jmp pulsec_pulse_lang_ULong_parse__String_b8
pulsec_pulse_lang_ULong_parse__String_b7:
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_ULong_parse__String_b9
pulsec_pulse_lang_ULong_parse__String_b8:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b10
    jmp pulsec_pulse_lang_ULong_parse__String_b11
pulsec_pulse_lang_ULong_parse__String_b9:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b13
    jmp pulsec_pulse_lang_ULong_parse__String_b14
pulsec_pulse_lang_ULong_parse__String_b10:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b12
pulsec_pulse_lang_ULong_parse__String_b11:
    jmp pulsec_pulse_lang_ULong_parse__String_b12
pulsec_pulse_lang_ULong_parse__String_b12:
    jmp pulsec_pulse_lang_ULong_parse__String_b9
pulsec_pulse_lang_ULong_parse__String_b13:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b15
pulsec_pulse_lang_ULong_parse__String_b14:
    jmp pulsec_pulse_lang_ULong_parse__String_b15
pulsec_pulse_lang_ULong_parse__String_b15:
    mov rax, 10
    mov qword ptr [rsp+88], rax
    call pulsec_fget_pulse_lang_ULong_MAX_VALUE
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov qword ptr [rsp+96], rax
    call pulsec_fget_pulse_lang_ULong_MAX_VALUE
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov rax, rdx
    mov qword ptr [rsp+104], rax
    mov rax, 0
    mov qword ptr [rsp+112], rax
    jmp pulsec_pulse_lang_ULong_parse__String_b16
pulsec_pulse_lang_ULong_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b17
    jmp pulsec_pulse_lang_ULong_parse__String_b18
pulsec_pulse_lang_ULong_parse__String_b17:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+328], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+280], rax
    mov eax, dword ptr [rsp+280]
    mov edx, eax
    mov rcx, qword ptr [rsp+328]
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
    jne ULong_parse_ternary_then_19_67
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+216], eax
    mov eax, 57
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp ULong_parse_ternary_done_19_67
ULong_parse_ternary_then_19_67:
    mov eax, 1
ULong_parse_ternary_done_19_67:
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b19
    jmp pulsec_pulse_lang_ULong_parse__String_b20
pulsec_pulse_lang_ULong_parse__String_b18:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_pulse_lang_ULong_valueOf__ulong
    jmp pulsec_pulse_lang_ULong_parse__String_epilogue
pulsec_pulse_lang_ULong_parse__String_b19:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b21
pulsec_pulse_lang_ULong_parse__String_b20:
    jmp pulsec_pulse_lang_ULong_parse__String_b21
pulsec_pulse_lang_ULong_parse__String_b21:
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+232]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b22
    jmp pulsec_pulse_lang_ULong_parse__String_b23
pulsec_pulse_lang_ULong_parse__String_b22:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b24
pulsec_pulse_lang_ULong_parse__String_b23:
    jmp pulsec_pulse_lang_ULong_parse__String_b24
pulsec_pulse_lang_ULong_parse__String_b24:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+240]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne ULong_parse_ternary_then_24_92
    mov eax, 0
    jmp ULong_parse_ternary_done_24_92
ULong_parse_ternary_then_24_92:
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+248]
    cmp rax, rdx
    seta al
    movzx eax, al
ULong_parse_ternary_done_24_92:
    test eax, eax
    jne pulsec_pulse_lang_ULong_parse__String_b25
    jmp pulsec_pulse_lang_ULong_parse__String_b26
pulsec_pulse_lang_ULong_parse__String_b25:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    jmp pulsec_pulse_lang_ULong_parse__String_b27
pulsec_pulse_lang_ULong_parse__String_b26:
    jmp pulsec_pulse_lang_ULong_parse__String_b27
pulsec_pulse_lang_ULong_parse__String_b27:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+256]
    imul rax, rdx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+264]
    add rax, rdx
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_ULong_parse__String_b16
pulsec_pulse_lang_ULong_parse__String_epilogue:
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
pulsec_pulse_lang_ULong_parse__String_epilogue_post:
    mov qword ptr [rsp+320], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+320]
    add rsp, 440
    ret
pulsec_pulse_lang_ULong_parse__String endp

pulsec_pulse_lang_ULong_ulongValue__ULong proc
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
pulsec_pulse_lang_ULong_ulongValue__ULong_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_ULong_ulongValue__ULong_epilogue
pulsec_pulse_lang_ULong_ulongValue__ULong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_ULong_ulongValue__ULong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_ULong_ulongValue__ULong endp

pulsec_pulse_lang_ULong_equals__ulong_ulong proc
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
pulsec_pulse_lang_ULong_equals__ulong_ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_ULong_equals__ulong_ulong_epilogue
pulsec_pulse_lang_ULong_equals__ulong_ulong_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_ULong_equals__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_ULong_equals__ulong_ulong endp

pulsec_pulse_lang_ULong_compare__ulong_ulong proc
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
pulsec_pulse_lang_ULong_compare__ulong_ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setb al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_compare__ulong_ulong_b1
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_b2
pulsec_pulse_lang_ULong_compare__ulong_ulong_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_pulse_lang_ULong_compare__ulong_ulong_b2:
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_b3
pulsec_pulse_lang_ULong_compare__ulong_ulong_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_compare__ulong_ulong_b4
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_b5
pulsec_pulse_lang_ULong_compare__ulong_ulong_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_pulse_lang_ULong_compare__ulong_ulong_b5:
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_b6
pulsec_pulse_lang_ULong_compare__ulong_ulong_b6:
    mov eax, 0
    jmp pulsec_pulse_lang_ULong_compare__ulong_ulong_epilogue
pulsec_pulse_lang_ULong_compare__ulong_ulong_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_ULong_compare__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_ULong_compare__ulong_ulong endp

pulsec_pulse_lang_ULong_toString__ulong proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_ULong_toString__ulong_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+104], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_toString__ulong_b1
    jmp pulsec_pulse_lang_ULong_toString__ulong_b2
pulsec_pulse_lang_ULong_toString__ulong_b1:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_ULong_toString__ulong_epilogue
pulsec_pulse_lang_ULong_toString__ulong_b2:
    jmp pulsec_pulse_lang_ULong_toString__ulong_b3
pulsec_pulse_lang_ULong_toString__ulong_b3:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+64], rax
    mov rax, 10
    mov qword ptr [rsp+72], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    jmp pulsec_pulse_lang_ULong_toString__ulong_b4
pulsec_pulse_lang_ULong_toString__ulong_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_ULong_toString__ulong_b5
    jmp pulsec_pulse_lang_ULong_toString__ulong_b6
pulsec_pulse_lang_ULong_toString__ulong_b5:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov rax, rdx
    and rax, 0FFFFFFFFh
    mov dword ptr [rsp+88], eax
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_lang_ULong_toString__ulong_b4
pulsec_pulse_lang_ULong_toString__ulong_b6:
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_ULong_toString__ulong_epilogue
pulsec_pulse_lang_ULong_toString__ulong_epilogue:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
pulsec_pulse_lang_ULong_toString__ulong_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 344
    ret
pulsec_pulse_lang_ULong_toString__ulong endp

pulsec_fget_pulse_lang_ULong_MIN_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_ULong_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_ULong_MIN_VALUE endp

pulsec_fset_pulse_lang_ULong_MIN_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_ULong_MIN_VALUE], rcx
    ret
pulsec_fset_pulse_lang_ULong_MIN_VALUE endp


pulsec_fget_pulse_lang_ULong_MAX_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_ULong_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_ULong_MAX_VALUE endp

pulsec_fset_pulse_lang_ULong_MAX_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_ULong_MAX_VALUE], rcx
    ret
pulsec_fset_pulse_lang_ULong_MAX_VALUE endp


end
