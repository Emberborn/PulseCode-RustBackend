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
extrn adenc_rt_stringFromBytes:proc
extrn adenc_rt_consoleWrite:proc
extrn adenc_rt_panic:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_charAt__int:proc
extrn adenc_aden_lang_String_length:proc
extrn adenc_aden_lang_String_valueOf__char:proc
extrn adenc_rt_panic:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MAX_VALUE:proc

public adenc_fld_aden_lang_ULong_MIN_VALUE
public adenc_fget_aden_lang_ULong_MIN_VALUE
public adenc_fset_aden_lang_ULong_MIN_VALUE
public adenc_fld_aden_lang_ULong_MAX_VALUE
public adenc_fget_aden_lang_ULong_MAX_VALUE
public adenc_fset_aden_lang_ULong_MAX_VALUE

extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_aden_lang_ULong dd 0
adenc_fld_aden_lang_ULong_MIN_VALUE dq 0
adenc_fld_aden_lang_ULong_MAX_VALUE dq -1
trace_m0 db "aden.lang.ULong.valueOf"
trace_m0_len equ 23
adenc_aden_lang_ULong_valueOf__ulong_trace_s0 db "aden.lang.ULong.valueOf(ULong.aden:24)"
adenc_aden_lang_ULong_valueOf__ulong_trace_s0_len equ 38
trace_m2 db "aden.lang.ULong.parse"
trace_m2_len equ 21
adenc_aden_lang_ULong_parse__String_trace_s0 db "aden.lang.ULong.parse(ULong.aden:32)"
adenc_aden_lang_ULong_parse__String_trace_s0_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s1 db "aden.lang.ULong.parse(ULong.aden:33)"
adenc_aden_lang_ULong_parse__String_trace_s1_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s2 db "aden.lang.ULong.parse(ULong.aden:36)"
adenc_aden_lang_ULong_parse__String_trace_s2_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s3 db "aden.lang.ULong.parse(ULong.aden:37)"
adenc_aden_lang_ULong_parse__String_trace_s3_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s4 db "aden.lang.ULong.parse(ULong.aden:38)"
adenc_aden_lang_ULong_parse__String_trace_s4_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s5 db "aden.lang.ULong.parse(ULong.aden:41)"
adenc_aden_lang_ULong_parse__String_trace_s5_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s6 db "aden.lang.ULong.parse(ULong.aden:42)"
adenc_aden_lang_ULong_parse__String_trace_s6_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s7 db "aden.lang.ULong.parse(ULong.aden:43)"
adenc_aden_lang_ULong_parse__String_trace_s7_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s8 db "aden.lang.ULong.parse(ULong.aden:44)"
adenc_aden_lang_ULong_parse__String_trace_s8_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s9 db "aden.lang.ULong.parse(ULong.aden:45)"
adenc_aden_lang_ULong_parse__String_trace_s9_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s10 db "aden.lang.ULong.parse(ULong.aden:46)"
adenc_aden_lang_ULong_parse__String_trace_s10_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s11 db "aden.lang.ULong.parse(ULong.aden:49)"
adenc_aden_lang_ULong_parse__String_trace_s11_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s12 db "aden.lang.ULong.parse(ULong.aden:50)"
adenc_aden_lang_ULong_parse__String_trace_s12_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s13 db "aden.lang.ULong.parse(ULong.aden:53)"
adenc_aden_lang_ULong_parse__String_trace_s13_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s14 db "aden.lang.ULong.parse(ULong.aden:54)"
adenc_aden_lang_ULong_parse__String_trace_s14_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s15 db "aden.lang.ULong.parse(ULong.aden:55)"
adenc_aden_lang_ULong_parse__String_trace_s15_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s16 db "aden.lang.ULong.parse(ULong.aden:56)"
adenc_aden_lang_ULong_parse__String_trace_s16_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s17 db "aden.lang.ULong.parse(ULong.aden:57)"
adenc_aden_lang_ULong_parse__String_trace_s17_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s18 db "aden.lang.ULong.parse(ULong.aden:58)"
adenc_aden_lang_ULong_parse__String_trace_s18_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s19 db "aden.lang.ULong.parse(ULong.aden:59)"
adenc_aden_lang_ULong_parse__String_trace_s19_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s20 db "aden.lang.ULong.parse(ULong.aden:60)"
adenc_aden_lang_ULong_parse__String_trace_s20_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s21 db "aden.lang.ULong.parse(ULong.aden:63)"
adenc_aden_lang_ULong_parse__String_trace_s21_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s22 db "aden.lang.ULong.parse(ULong.aden:64)"
adenc_aden_lang_ULong_parse__String_trace_s22_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s23 db "aden.lang.ULong.parse(ULong.aden:65)"
adenc_aden_lang_ULong_parse__String_trace_s23_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s24 db "aden.lang.ULong.parse(ULong.aden:67)"
adenc_aden_lang_ULong_parse__String_trace_s24_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s25 db "aden.lang.ULong.parse(ULong.aden:68)"
adenc_aden_lang_ULong_parse__String_trace_s25_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s26 db "aden.lang.ULong.parse(ULong.aden:71)"
adenc_aden_lang_ULong_parse__String_trace_s26_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s27 db "aden.lang.ULong.parse(ULong.aden:72)"
adenc_aden_lang_ULong_parse__String_trace_s27_len equ 36
adenc_aden_lang_ULong_parse__String_trace_s28 db "aden.lang.ULong.parse(ULong.aden:75)"
adenc_aden_lang_ULong_parse__String_trace_s28_len equ 36
trace_m32 db "aden.lang.ULong.ulongValue"
trace_m32_len equ 26
adenc_aden_lang_ULong_ulongValue__ULong_trace_s0 db "aden.lang.ULong.ulongValue(ULong.aden:83)"
adenc_aden_lang_ULong_ulongValue__ULong_trace_s0_len equ 41
trace_m34 db "aden.lang.ULong.equals"
trace_m34_len equ 22
adenc_aden_lang_ULong_equals__ulong_ulong_trace_s0 db "aden.lang.ULong.equals(ULong.aden:91)"
adenc_aden_lang_ULong_equals__ulong_ulong_trace_s0_len equ 37
trace_m36 db "aden.lang.ULong.compare"
trace_m36_len equ 23
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0 db "aden.lang.ULong.compare(ULong.aden:99)"
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0_len equ 38
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s1 db "aden.lang.ULong.compare(ULong.aden:100)"
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s1_len equ 39
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2 db "aden.lang.ULong.compare(ULong.aden:102)"
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2_len equ 39
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s3 db "aden.lang.ULong.compare(ULong.aden:103)"
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s3_len equ 39
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s4 db "aden.lang.ULong.compare(ULong.aden:105)"
adenc_aden_lang_ULong_compare__ulong_ulong_trace_s4_len equ 39
trace_m42 db "aden.lang.ULong.toString"
trace_m42_len equ 24
adenc_aden_lang_ULong_toString__ulong_trace_s0 db "aden.lang.ULong.toString(ULong.aden:113)"
adenc_aden_lang_ULong_toString__ulong_trace_s0_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s1 db "aden.lang.ULong.toString(ULong.aden:114)"
adenc_aden_lang_ULong_toString__ulong_trace_s1_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s2 db "aden.lang.ULong.toString(ULong.aden:117)"
adenc_aden_lang_ULong_toString__ulong_trace_s2_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s3 db "aden.lang.ULong.toString(ULong.aden:118)"
adenc_aden_lang_ULong_toString__ulong_trace_s3_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s4 db "aden.lang.ULong.toString(ULong.aden:119)"
adenc_aden_lang_ULong_toString__ulong_trace_s4_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s5 db "aden.lang.ULong.toString(ULong.aden:120)"
adenc_aden_lang_ULong_toString__ulong_trace_s5_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s6 db "aden.lang.ULong.toString(ULong.aden:121)"
adenc_aden_lang_ULong_toString__ulong_trace_s6_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s7 db "aden.lang.ULong.toString(ULong.aden:122)"
adenc_aden_lang_ULong_toString__ulong_trace_s7_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s8 db "aden.lang.ULong.toString(ULong.aden:123)"
adenc_aden_lang_ULong_toString__ulong_trace_s8_len equ 40
adenc_aden_lang_ULong_toString__ulong_trace_s9 db "aden.lang.ULong.toString(ULong.aden:126)"
adenc_aden_lang_ULong_toString__ulong_trace_s9_len equ 40
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
adenc_aden_lang_ULong_valueOf__ulong proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_ULong_valueOf__ulong_b0:
    lea rcx, adenc_aden_lang_ULong_valueOf__ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_valueOf__ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_ULong_valueOf__ulong_epilogue
adenc_aden_lang_ULong_valueOf__ulong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_ULong_valueOf__ulong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_ULong_valueOf__ulong endp

adenc_aden_lang_ULong_parse__String proc
    sub rsp, 440
    mov qword ptr [rsp+408], rcx
    mov qword ptr [rsp+416], rdx
    mov qword ptr [rsp+424], r8
    mov qword ptr [rsp+432], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+408]
    mov rdx, qword ptr [rsp+416]
    mov r8, qword ptr [rsp+424]
    mov r9, qword ptr [rsp+432]
    mov qword ptr [rsp+136], rcx
adenc_aden_lang_ULong_parse__String_b0:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s0
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b1
    jmp adenc_aden_lang_ULong_parse__String_b2
adenc_aden_lang_ULong_parse__String_b1:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s1
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s0
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b3
adenc_aden_lang_ULong_parse__String_b2:
    jmp adenc_aden_lang_ULong_parse__String_b3
adenc_aden_lang_ULong_parse__String_b3:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s2
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+328], rax
    mov rcx, qword ptr [rsp+328]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s3
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b4
    jmp adenc_aden_lang_ULong_parse__String_b5
adenc_aden_lang_ULong_parse__String_b4:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s4
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s3
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b6
adenc_aden_lang_ULong_parse__String_b5:
    jmp adenc_aden_lang_ULong_parse__String_b6
adenc_aden_lang_ULong_parse__String_b6:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s5
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s6
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s6_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s7
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b7
    jmp adenc_aden_lang_ULong_parse__String_b8
adenc_aden_lang_ULong_parse__String_b7:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s8
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s7
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b9
adenc_aden_lang_ULong_parse__String_b8:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s9
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b10
    jmp adenc_aden_lang_ULong_parse__String_b11
adenc_aden_lang_ULong_parse__String_b9:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s11
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b13
    jmp adenc_aden_lang_ULong_parse__String_b14
adenc_aden_lang_ULong_parse__String_b10:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s10
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s9
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b12
adenc_aden_lang_ULong_parse__String_b11:
    jmp adenc_aden_lang_ULong_parse__String_b12
adenc_aden_lang_ULong_parse__String_b12:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s7
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b9
adenc_aden_lang_ULong_parse__String_b13:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s12
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s12_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s11
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b15
adenc_aden_lang_ULong_parse__String_b14:
    jmp adenc_aden_lang_ULong_parse__String_b15
adenc_aden_lang_ULong_parse__String_b15:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s13
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov rax, 10
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s14
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s14_len
    call adenc_rt_traceUpdateTop
    call adenc_fget_aden_lang_ULong_MAX_VALUE
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov qword ptr [rsp+96], rax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s15
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s15_len
    call adenc_rt_traceUpdateTop
    call adenc_fget_aden_lang_ULong_MAX_VALUE
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov rax, rdx
    mov qword ptr [rsp+104], rax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s16
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s16_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s17
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s17_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b16
adenc_aden_lang_ULong_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b17
    jmp adenc_aden_lang_ULong_parse__String_b18
adenc_aden_lang_ULong_parse__String_b17:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s18
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s18_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s19
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_lang_ULong_parse__String_b19
    jmp adenc_aden_lang_ULong_parse__String_b20
adenc_aden_lang_ULong_parse__String_b18:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s28
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s28_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_aden_lang_ULong_valueOf__ulong
    jmp adenc_aden_lang_ULong_parse__String_epilogue
adenc_aden_lang_ULong_parse__String_b19:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s20
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s20_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s19
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b21
adenc_aden_lang_ULong_parse__String_b20:
    jmp adenc_aden_lang_ULong_parse__String_b21
adenc_aden_lang_ULong_parse__String_b21:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s21
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s21_len
    call adenc_rt_traceUpdateTop
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
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s22
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s22_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+232]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_parse__String_b22
    jmp adenc_aden_lang_ULong_parse__String_b23
adenc_aden_lang_ULong_parse__String_b22:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s23
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s23_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s22
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s22_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b24
adenc_aden_lang_ULong_parse__String_b23:
    jmp adenc_aden_lang_ULong_parse__String_b24
adenc_aden_lang_ULong_parse__String_b24:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s24
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_lang_ULong_parse__String_b25
    jmp adenc_aden_lang_ULong_parse__String_b26
adenc_aden_lang_ULong_parse__String_b25:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s25
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s25_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+280], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+280]
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+320]
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s24
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b27
adenc_aden_lang_ULong_parse__String_b26:
    jmp adenc_aden_lang_ULong_parse__String_b27
adenc_aden_lang_ULong_parse__String_b27:
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s26
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s26_len
    call adenc_rt_traceUpdateTop
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
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s27
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s27_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_ULong_parse__String_trace_s17
    mov edx, adenc_aden_lang_ULong_parse__String_trace_s17_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_parse__String_b16
adenc_aden_lang_ULong_parse__String_epilogue:
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+320]
adenc_aden_lang_ULong_parse__String_epilogue_post:
    mov qword ptr [rsp+320], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+320]
    add rsp, 440
    ret
adenc_aden_lang_ULong_parse__String endp

adenc_aden_lang_ULong_ulongValue__ULong proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_ULong_ulongValue__ULong_b0:
    lea rcx, adenc_aden_lang_ULong_ulongValue__ULong_trace_s0
    mov edx, adenc_aden_lang_ULong_ulongValue__ULong_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_ULong_ulongValue__ULong_epilogue
adenc_aden_lang_ULong_ulongValue__ULong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_ULong_ulongValue__ULong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_ULong_ulongValue__ULong endp

adenc_aden_lang_ULong_equals__ulong_ulong proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_ULong_equals__ulong_ulong_b0:
    lea rcx, adenc_aden_lang_ULong_equals__ulong_ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_equals__ulong_ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp adenc_aden_lang_ULong_equals__ulong_ulong_epilogue
adenc_aden_lang_ULong_equals__ulong_ulong_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_ULong_equals__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_ULong_equals__ulong_ulong endp

adenc_aden_lang_ULong_compare__ulong_ulong proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_ULong_compare__ulong_ulong_b0:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setb al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_compare__ulong_ulong_b1
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_b2
adenc_aden_lang_ULong_compare__ulong_ulong_b1:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s1
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_epilogue
adenc_aden_lang_ULong_compare__ulong_ulong_b2:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_b3
adenc_aden_lang_ULong_compare__ulong_ulong_b3:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_compare__ulong_ulong_b4
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_b5
adenc_aden_lang_ULong_compare__ulong_ulong_b4:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s3
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_epilogue
adenc_aden_lang_ULong_compare__ulong_ulong_b5:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_b6
adenc_aden_lang_ULong_compare__ulong_ulong_b6:
    lea rcx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s4
    mov edx, adenc_aden_lang_ULong_compare__ulong_ulong_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_ULong_compare__ulong_ulong_epilogue
adenc_aden_lang_ULong_compare__ulong_ulong_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_ULong_compare__ulong_ulong_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
adenc_aden_lang_ULong_compare__ulong_ulong endp

adenc_aden_lang_ULong_toString__ulong proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+80], 0
adenc_aden_lang_ULong_toString__ulong_b0:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+104], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_toString__ulong_b1
    jmp adenc_aden_lang_ULong_toString__ulong_b2
adenc_aden_lang_ULong_toString__ulong_b1:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s1
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_ULong_toString__ulong_epilogue
adenc_aden_lang_ULong_toString__ulong_b2:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s0
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_toString__ulong_b3
adenc_aden_lang_ULong_toString__ulong_b3:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s2
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s3
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, 10
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s4
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s4_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s5
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_toString__ulong_b4
adenc_aden_lang_ULong_toString__ulong_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    seta al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_ULong_toString__ulong_b5
    jmp adenc_aden_lang_ULong_toString__ulong_b6
adenc_aden_lang_ULong_toString__ulong_b5:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s6
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s6_len
    call adenc_rt_traceUpdateTop
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
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s7
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s7_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_valueOf__char
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s8
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rdx
    xor edx, edx
    div rcx
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s5
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s5_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_ULong_toString__ulong_b4
adenc_aden_lang_ULong_toString__ulong_b6:
    lea rcx, adenc_aden_lang_ULong_toString__ulong_trace_s9
    mov edx, adenc_aden_lang_ULong_toString__ulong_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_ULong_toString__ulong_epilogue
adenc_aden_lang_ULong_toString__ulong_epilogue:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
adenc_aden_lang_ULong_toString__ulong_epilogue_post:
    mov qword ptr [rsp+184], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 344
    ret
adenc_aden_lang_ULong_toString__ulong endp

adenc_fget_aden_lang_ULong_MIN_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_ULong_MIN_VALUE]
    ret
adenc_fget_aden_lang_ULong_MIN_VALUE endp

adenc_fset_aden_lang_ULong_MIN_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_ULong_MIN_VALUE], rcx
    ret
adenc_fset_aden_lang_ULong_MIN_VALUE endp


adenc_fget_aden_lang_ULong_MAX_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_ULong_MAX_VALUE]
    ret
adenc_fget_aden_lang_ULong_MAX_VALUE endp

adenc_fset_aden_lang_ULong_MAX_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_ULong_MAX_VALUE], rcx
    ret
adenc_fset_aden_lang_ULong_MAX_VALUE endp


end
