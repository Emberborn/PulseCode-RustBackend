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
extrn adenc_fget_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MAX_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MAX_VALUE:proc

public adenc_fld_aden_lang_Long_MIN_VALUE
public adenc_fget_aden_lang_Long_MIN_VALUE
public adenc_fset_aden_lang_Long_MIN_VALUE
public adenc_fld_aden_lang_Long_MAX_VALUE
public adenc_fget_aden_lang_Long_MAX_VALUE
public adenc_fset_aden_lang_Long_MAX_VALUE

extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_aden_lang_Long dd 0
adenc_fld_aden_lang_Long_MIN_VALUE dq -9223372036854775808
adenc_fld_aden_lang_Long_MAX_VALUE dq 9223372036854775807
trace_m0 db "aden.lang.Long.valueOf"
trace_m0_len equ 22
adenc_aden_lang_Long_valueOf__long_trace_s0 db "aden.lang.Long.valueOf(Long.aden:24)"
adenc_aden_lang_Long_valueOf__long_trace_s0_len equ 36
trace_m2 db "aden.lang.Long.parse"
trace_m2_len equ 20
adenc_aden_lang_Long_parse__String_trace_s0 db "aden.lang.Long.parse(Long.aden:32)"
adenc_aden_lang_Long_parse__String_trace_s0_len equ 34
adenc_aden_lang_Long_parse__String_trace_s1 db "aden.lang.Long.parse(Long.aden:33)"
adenc_aden_lang_Long_parse__String_trace_s1_len equ 34
adenc_aden_lang_Long_parse__String_trace_s2 db "aden.lang.Long.parse(Long.aden:36)"
adenc_aden_lang_Long_parse__String_trace_s2_len equ 34
adenc_aden_lang_Long_parse__String_trace_s3 db "aden.lang.Long.parse(Long.aden:37)"
adenc_aden_lang_Long_parse__String_trace_s3_len equ 34
adenc_aden_lang_Long_parse__String_trace_s4 db "aden.lang.Long.parse(Long.aden:38)"
adenc_aden_lang_Long_parse__String_trace_s4_len equ 34
adenc_aden_lang_Long_parse__String_trace_s5 db "aden.lang.Long.parse(Long.aden:41)"
adenc_aden_lang_Long_parse__String_trace_s5_len equ 34
adenc_aden_lang_Long_parse__String_trace_s6 db "aden.lang.Long.parse(Long.aden:42)"
adenc_aden_lang_Long_parse__String_trace_s6_len equ 34
adenc_aden_lang_Long_parse__String_trace_s7 db "aden.lang.Long.parse(Long.aden:43)"
adenc_aden_lang_Long_parse__String_trace_s7_len equ 34
adenc_aden_lang_Long_parse__String_trace_s8 db "aden.lang.Long.parse(Long.aden:44)"
adenc_aden_lang_Long_parse__String_trace_s8_len equ 34
adenc_aden_lang_Long_parse__String_trace_s9 db "aden.lang.Long.parse(Long.aden:45)"
adenc_aden_lang_Long_parse__String_trace_s9_len equ 34
adenc_aden_lang_Long_parse__String_trace_s10 db "aden.lang.Long.parse(Long.aden:46)"
adenc_aden_lang_Long_parse__String_trace_s10_len equ 34
adenc_aden_lang_Long_parse__String_trace_s11 db "aden.lang.Long.parse(Long.aden:47)"
adenc_aden_lang_Long_parse__String_trace_s11_len equ 34
adenc_aden_lang_Long_parse__String_trace_s12 db "aden.lang.Long.parse(Long.aden:48)"
adenc_aden_lang_Long_parse__String_trace_s12_len equ 34
adenc_aden_lang_Long_parse__String_trace_s13 db "aden.lang.Long.parse(Long.aden:49)"
adenc_aden_lang_Long_parse__String_trace_s13_len equ 34
adenc_aden_lang_Long_parse__String_trace_s14 db "aden.lang.Long.parse(Long.aden:50)"
adenc_aden_lang_Long_parse__String_trace_s14_len equ 34
adenc_aden_lang_Long_parse__String_trace_s15 db "aden.lang.Long.parse(Long.aden:53)"
adenc_aden_lang_Long_parse__String_trace_s15_len equ 34
adenc_aden_lang_Long_parse__String_trace_s16 db "aden.lang.Long.parse(Long.aden:54)"
adenc_aden_lang_Long_parse__String_trace_s16_len equ 34
adenc_aden_lang_Long_parse__String_trace_s17 db "aden.lang.Long.parse(Long.aden:57)"
adenc_aden_lang_Long_parse__String_trace_s17_len equ 34
adenc_aden_lang_Long_parse__String_trace_s18 db "aden.lang.Long.parse(Long.aden:58)"
adenc_aden_lang_Long_parse__String_trace_s18_len equ 34
adenc_aden_lang_Long_parse__String_trace_s19 db "aden.lang.Long.parse(Long.aden:59)"
adenc_aden_lang_Long_parse__String_trace_s19_len equ 34
adenc_aden_lang_Long_parse__String_trace_s20 db "aden.lang.Long.parse(Long.aden:60)"
adenc_aden_lang_Long_parse__String_trace_s20_len equ 34
adenc_aden_lang_Long_parse__String_trace_s21 db "aden.lang.Long.parse(Long.aden:61)"
adenc_aden_lang_Long_parse__String_trace_s21_len equ 34
adenc_aden_lang_Long_parse__String_trace_s22 db "aden.lang.Long.parse(Long.aden:62)"
adenc_aden_lang_Long_parse__String_trace_s22_len equ 34
adenc_aden_lang_Long_parse__String_trace_s23 db "aden.lang.Long.parse(Long.aden:64)"
adenc_aden_lang_Long_parse__String_trace_s23_len equ 34
adenc_aden_lang_Long_parse__String_trace_s24 db "aden.lang.Long.parse(Long.aden:65)"
adenc_aden_lang_Long_parse__String_trace_s24_len equ 34
adenc_aden_lang_Long_parse__String_trace_s25 db "aden.lang.Long.parse(Long.aden:66)"
adenc_aden_lang_Long_parse__String_trace_s25_len equ 34
adenc_aden_lang_Long_parse__String_trace_s26 db "aden.lang.Long.parse(Long.aden:68)"
adenc_aden_lang_Long_parse__String_trace_s26_len equ 34
adenc_aden_lang_Long_parse__String_trace_s27 db "aden.lang.Long.parse(Long.aden:69)"
adenc_aden_lang_Long_parse__String_trace_s27_len equ 34
adenc_aden_lang_Long_parse__String_trace_s28 db "aden.lang.Long.parse(Long.aden:70)"
adenc_aden_lang_Long_parse__String_trace_s28_len equ 34
adenc_aden_lang_Long_parse__String_trace_s29 db "aden.lang.Long.parse(Long.aden:72)"
adenc_aden_lang_Long_parse__String_trace_s29_len equ 34
adenc_aden_lang_Long_parse__String_trace_s30 db "aden.lang.Long.parse(Long.aden:73)"
adenc_aden_lang_Long_parse__String_trace_s30_len equ 34
adenc_aden_lang_Long_parse__String_trace_s31 db "aden.lang.Long.parse(Long.aden:76)"
adenc_aden_lang_Long_parse__String_trace_s31_len equ 34
adenc_aden_lang_Long_parse__String_trace_s32 db "aden.lang.Long.parse(Long.aden:77)"
adenc_aden_lang_Long_parse__String_trace_s32_len equ 34
adenc_aden_lang_Long_parse__String_trace_s33 db "aden.lang.Long.parse(Long.aden:79)"
adenc_aden_lang_Long_parse__String_trace_s33_len equ 34
trace_m37 db "aden.lang.Long.longValue"
trace_m37_len equ 24
adenc_aden_lang_Long_longValue__Long_trace_s0 db "aden.lang.Long.longValue(Long.aden:87)"
adenc_aden_lang_Long_longValue__Long_trace_s0_len equ 38
trace_m39 db "aden.lang.Long.equals"
trace_m39_len equ 21
adenc_aden_lang_Long_equals__long_long_trace_s0 db "aden.lang.Long.equals(Long.aden:95)"
adenc_aden_lang_Long_equals__long_long_trace_s0_len equ 35
trace_m41 db "aden.lang.Long.compare"
trace_m41_len equ 22
adenc_aden_lang_Long_compare__long_long_trace_s0 db "aden.lang.Long.compare(Long.aden:103)"
adenc_aden_lang_Long_compare__long_long_trace_s0_len equ 37
adenc_aden_lang_Long_compare__long_long_trace_s1 db "aden.lang.Long.compare(Long.aden:104)"
adenc_aden_lang_Long_compare__long_long_trace_s1_len equ 37
adenc_aden_lang_Long_compare__long_long_trace_s2 db "aden.lang.Long.compare(Long.aden:106)"
adenc_aden_lang_Long_compare__long_long_trace_s2_len equ 37
adenc_aden_lang_Long_compare__long_long_trace_s3 db "aden.lang.Long.compare(Long.aden:107)"
adenc_aden_lang_Long_compare__long_long_trace_s3_len equ 37
adenc_aden_lang_Long_compare__long_long_trace_s4 db "aden.lang.Long.compare(Long.aden:109)"
adenc_aden_lang_Long_compare__long_long_trace_s4_len equ 37
trace_m47 db "aden.lang.Long.toString"
trace_m47_len equ 23
adenc_aden_lang_Long_toString__long_trace_s0 db "aden.lang.Long.toString(Long.aden:117)"
adenc_aden_lang_Long_toString__long_trace_s0_len equ 38
adenc_aden_lang_Long_toString__long_trace_s1 db "aden.lang.Long.toString(Long.aden:118)"
adenc_aden_lang_Long_toString__long_trace_s1_len equ 38
adenc_aden_lang_Long_toString__long_trace_s2 db "aden.lang.Long.toString(Long.aden:121)"
adenc_aden_lang_Long_toString__long_trace_s2_len equ 38
adenc_aden_lang_Long_toString__long_trace_s3 db "aden.lang.Long.toString(Long.aden:122)"
adenc_aden_lang_Long_toString__long_trace_s3_len equ 38
adenc_aden_lang_Long_toString__long_trace_s4 db "aden.lang.Long.toString(Long.aden:123)"
adenc_aden_lang_Long_toString__long_trace_s4_len equ 38
adenc_aden_lang_Long_toString__long_trace_s5 db "aden.lang.Long.toString(Long.aden:124)"
adenc_aden_lang_Long_toString__long_trace_s5_len equ 38
adenc_aden_lang_Long_toString__long_trace_s6 db "aden.lang.Long.toString(Long.aden:127)"
adenc_aden_lang_Long_toString__long_trace_s6_len equ 38
adenc_aden_lang_Long_toString__long_trace_s7 db "aden.lang.Long.toString(Long.aden:128)"
adenc_aden_lang_Long_toString__long_trace_s7_len equ 38
adenc_aden_lang_Long_toString__long_trace_s8 db "aden.lang.Long.toString(Long.aden:129)"
adenc_aden_lang_Long_toString__long_trace_s8_len equ 38
adenc_aden_lang_Long_toString__long_trace_s9 db "aden.lang.Long.toString(Long.aden:130)"
adenc_aden_lang_Long_toString__long_trace_s9_len equ 38
adenc_aden_lang_Long_toString__long_trace_s10 db "aden.lang.Long.toString(Long.aden:131)"
adenc_aden_lang_Long_toString__long_trace_s10_len equ 38
adenc_aden_lang_Long_toString__long_trace_s11 db "aden.lang.Long.toString(Long.aden:132)"
adenc_aden_lang_Long_toString__long_trace_s11_len equ 38
adenc_aden_lang_Long_toString__long_trace_s12 db "aden.lang.Long.toString(Long.aden:135)"
adenc_aden_lang_Long_toString__long_trace_s12_len equ 38
adenc_aden_lang_Long_toString__long_trace_s13 db "aden.lang.Long.toString(Long.aden:136)"
adenc_aden_lang_Long_toString__long_trace_s13_len equ 38
adenc_aden_lang_Long_toString__long_trace_s14 db "aden.lang.Long.toString(Long.aden:137)"
adenc_aden_lang_Long_toString__long_trace_s14_len equ 38
adenc_aden_lang_Long_toString__long_trace_s15 db "aden.lang.Long.toString(Long.aden:138)"
adenc_aden_lang_Long_toString__long_trace_s15_len equ 38
adenc_aden_lang_Long_toString__long_trace_s16 db "aden.lang.Long.toString(Long.aden:140)"
adenc_aden_lang_Long_toString__long_trace_s16_len equ 38
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
adenc_aden_lang_Long_valueOf__long proc
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
adenc_aden_lang_Long_valueOf__long_b0:
    lea rcx, adenc_aden_lang_Long_valueOf__long_trace_s0
    mov edx, adenc_aden_lang_Long_valueOf__long_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Long_valueOf__long_epilogue
adenc_aden_lang_Long_valueOf__long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Long_valueOf__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Long_valueOf__long endp

adenc_aden_lang_Long_parse__String proc
    sub rsp, 456
    mov qword ptr [rsp+424], rcx
    mov qword ptr [rsp+432], rdx
    mov qword ptr [rsp+440], r8
    mov qword ptr [rsp+448], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
adenc_aden_lang_Long_parse__String_b0:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s0
    mov edx, adenc_aden_lang_Long_parse__String_trace_s0_len
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
    jne adenc_aden_lang_Long_parse__String_b1
    jmp adenc_aden_lang_Long_parse__String_b2
adenc_aden_lang_Long_parse__String_b1:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s1
    mov edx, adenc_aden_lang_Long_parse__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s0
    mov edx, adenc_aden_lang_Long_parse__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b3
adenc_aden_lang_Long_parse__String_b2:
    jmp adenc_aden_lang_Long_parse__String_b3
adenc_aden_lang_Long_parse__String_b3:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s2
    mov edx, adenc_aden_lang_Long_parse__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s3
    mov edx, adenc_aden_lang_Long_parse__String_trace_s3_len
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
    jne adenc_aden_lang_Long_parse__String_b4
    jmp adenc_aden_lang_Long_parse__String_b5
adenc_aden_lang_Long_parse__String_b4:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s4
    mov edx, adenc_aden_lang_Long_parse__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s3
    mov edx, adenc_aden_lang_Long_parse__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b6
adenc_aden_lang_Long_parse__String_b5:
    jmp adenc_aden_lang_Long_parse__String_b6
adenc_aden_lang_Long_parse__String_b6:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s5
    mov edx, adenc_aden_lang_Long_parse__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s6
    mov edx, adenc_aden_lang_Long_parse__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s7
    mov edx, adenc_aden_lang_Long_parse__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+160], rax
    call adenc_fget_aden_lang_Long_MAX_VALUE
    mov rdx, rax
    mov rax, qword ptr [rsp+160]
    sub rax, rdx
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s8
    mov edx, adenc_aden_lang_Long_parse__String_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s9
    mov edx, adenc_aden_lang_Long_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b7
    jmp adenc_aden_lang_Long_parse__String_b8
adenc_aden_lang_Long_parse__String_b7:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s10
    mov edx, adenc_aden_lang_Long_parse__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s11
    mov edx, adenc_aden_lang_Long_parse__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    call adenc_fget_aden_lang_Long_MIN_VALUE
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s12
    mov edx, adenc_aden_lang_Long_parse__String_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s9
    mov edx, adenc_aden_lang_Long_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b9
adenc_aden_lang_Long_parse__String_b8:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s13
    mov edx, adenc_aden_lang_Long_parse__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+176], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b10
    jmp adenc_aden_lang_Long_parse__String_b11
adenc_aden_lang_Long_parse__String_b9:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s15
    mov edx, adenc_aden_lang_Long_parse__String_trace_s15_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b13
    jmp adenc_aden_lang_Long_parse__String_b14
adenc_aden_lang_Long_parse__String_b10:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s14
    mov edx, adenc_aden_lang_Long_parse__String_trace_s14_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s13
    mov edx, adenc_aden_lang_Long_parse__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b12
adenc_aden_lang_Long_parse__String_b11:
    jmp adenc_aden_lang_Long_parse__String_b12
adenc_aden_lang_Long_parse__String_b12:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s9
    mov edx, adenc_aden_lang_Long_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b9
adenc_aden_lang_Long_parse__String_b13:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s16
    mov edx, adenc_aden_lang_Long_parse__String_trace_s16_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s15
    mov edx, adenc_aden_lang_Long_parse__String_trace_s15_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b15
adenc_aden_lang_Long_parse__String_b14:
    jmp adenc_aden_lang_Long_parse__String_b15
adenc_aden_lang_Long_parse__String_b15:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s17
    mov edx, adenc_aden_lang_Long_parse__String_trace_s17_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+192], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+104], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s18
    mov edx, adenc_aden_lang_Long_parse__String_trace_s18_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s19
    mov edx, adenc_aden_lang_Long_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b16
adenc_aden_lang_Long_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b17
    jmp adenc_aden_lang_Long_parse__String_b18
adenc_aden_lang_Long_parse__String_b17:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s20
    mov edx, adenc_aden_lang_Long_parse__String_trace_s20_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s21
    mov edx, adenc_aden_lang_Long_parse__String_trace_s21_len
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
    jne adenc_aden_lang_Long_parse__String_b19
    jmp adenc_aden_lang_Long_parse__String_b20
adenc_aden_lang_Long_parse__String_b18:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s31
    mov edx, adenc_aden_lang_Long_parse__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b28
    jmp adenc_aden_lang_Long_parse__String_b29
adenc_aden_lang_Long_parse__String_b19:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s22
    mov edx, adenc_aden_lang_Long_parse__String_trace_s22_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s21
    mov edx, adenc_aden_lang_Long_parse__String_trace_s21_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b21
adenc_aden_lang_Long_parse__String_b20:
    jmp adenc_aden_lang_Long_parse__String_b21
adenc_aden_lang_Long_parse__String_b21:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s23
    mov edx, adenc_aden_lang_Long_parse__String_trace_s23_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s24
    mov edx, adenc_aden_lang_Long_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+232]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_parse__String_b22
    jmp adenc_aden_lang_Long_parse__String_b23
adenc_aden_lang_Long_parse__String_b22:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s25
    mov edx, adenc_aden_lang_Long_parse__String_trace_s25_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s24
    mov edx, adenc_aden_lang_Long_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b24
adenc_aden_lang_Long_parse__String_b23:
    jmp adenc_aden_lang_Long_parse__String_b24
adenc_aden_lang_Long_parse__String_b24:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s26
    mov edx, adenc_aden_lang_Long_parse__String_trace_s26_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+240]
    imul rax, rdx
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s27
    mov edx, adenc_aden_lang_Long_parse__String_trace_s27_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_lang_Long_parse__String_b25
    jmp adenc_aden_lang_Long_parse__String_b26
adenc_aden_lang_Long_parse__String_b25:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s28
    mov edx, adenc_aden_lang_Long_parse__String_trace_s28_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s27
    mov edx, adenc_aden_lang_Long_parse__String_trace_s27_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b27
adenc_aden_lang_Long_parse__String_b26:
    jmp adenc_aden_lang_Long_parse__String_b27
adenc_aden_lang_Long_parse__String_b27:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s29
    mov edx, adenc_aden_lang_Long_parse__String_trace_s29_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+264], rax
    mov eax, dword ptr [rsp+128]
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+264]
    sub rax, rdx
    mov qword ptr [rsp+112], rax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s30
    mov edx, adenc_aden_lang_Long_parse__String_trace_s30_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s19
    mov edx, adenc_aden_lang_Long_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b16
adenc_aden_lang_Long_parse__String_b28:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s32
    mov edx, adenc_aden_lang_Long_parse__String_trace_s32_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_aden_lang_Long_valueOf__long
    jmp adenc_aden_lang_Long_parse__String_epilogue
adenc_aden_lang_Long_parse__String_b29:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s31
    mov edx, adenc_aden_lang_Long_parse__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_parse__String_b30
adenc_aden_lang_Long_parse__String_b30:
    lea rcx, adenc_aden_lang_Long_parse__String_trace_s33
    mov edx, adenc_aden_lang_Long_parse__String_trace_s33_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_Long_valueOf__long
    jmp adenc_aden_lang_Long_parse__String_epilogue
adenc_aden_lang_Long_parse__String_epilogue:
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
adenc_aden_lang_Long_parse__String_epilogue_post:
    mov qword ptr [rsp+328], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+328]
    add rsp, 456
    ret
adenc_aden_lang_Long_parse__String endp

adenc_aden_lang_Long_longValue__Long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Long_longValue__Long_b0:
    lea rcx, adenc_aden_lang_Long_longValue__Long_trace_s0
    mov edx, adenc_aden_lang_Long_longValue__Long_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Long_longValue__Long_epilogue
adenc_aden_lang_Long_longValue__Long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Long_longValue__Long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Long_longValue__Long endp

adenc_aden_lang_Long_equals__long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Long_equals__long_long_b0:
    lea rcx, adenc_aden_lang_Long_equals__long_long_trace_s0
    mov edx, adenc_aden_lang_Long_equals__long_long_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp adenc_aden_lang_Long_equals__long_long_epilogue
adenc_aden_lang_Long_equals__long_long_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Long_equals__long_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Long_equals__long_long endp

adenc_aden_lang_Long_compare__long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Long_compare__long_long_b0:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s0
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_compare__long_long_b1
    jmp adenc_aden_lang_Long_compare__long_long_b2
adenc_aden_lang_Long_compare__long_long_b1:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s1
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp adenc_aden_lang_Long_compare__long_long_epilogue
adenc_aden_lang_Long_compare__long_long_b2:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s0
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_compare__long_long_b3
adenc_aden_lang_Long_compare__long_long_b3:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s2
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setg al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_compare__long_long_b4
    jmp adenc_aden_lang_Long_compare__long_long_b5
adenc_aden_lang_Long_compare__long_long_b4:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s3
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_lang_Long_compare__long_long_epilogue
adenc_aden_lang_Long_compare__long_long_b5:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s2
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_compare__long_long_b6
adenc_aden_lang_Long_compare__long_long_b6:
    lea rcx, adenc_aden_lang_Long_compare__long_long_trace_s4
    mov edx, adenc_aden_lang_Long_compare__long_long_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_Long_compare__long_long_epilogue
adenc_aden_lang_Long_compare__long_long_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_Long_compare__long_long_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
adenc_aden_lang_Long_compare__long_long endp

adenc_aden_lang_Long_toString__long proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+80], 0
adenc_aden_lang_Long_toString__long_b0:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s0
    mov edx, adenc_aden_lang_Long_toString__long_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_toString__long_b1
    jmp adenc_aden_lang_Long_toString__long_b2
adenc_aden_lang_Long_toString__long_b1:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s1
    mov edx, adenc_aden_lang_Long_toString__long_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Long_toString__long_epilogue
adenc_aden_lang_Long_toString__long_b2:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s0
    mov edx, adenc_aden_lang_Long_toString__long_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_toString__long_b3
adenc_aden_lang_Long_toString__long_b3:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s2
    mov edx, adenc_aden_lang_Long_toString__long_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+128], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    setl al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s3
    mov edx, adenc_aden_lang_Long_toString__long_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s4
    mov edx, adenc_aden_lang_Long_toString__long_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Long_toString__long_b4
    jmp adenc_aden_lang_Long_toString__long_b5
adenc_aden_lang_Long_toString__long_b4:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s5
    mov edx, adenc_aden_lang_Long_toString__long_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    sub rax, rdx
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s4
    mov edx, adenc_aden_lang_Long_toString__long_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_toString__long_b6
adenc_aden_lang_Long_toString__long_b5:
    jmp adenc_aden_lang_Long_toString__long_b6
adenc_aden_lang_Long_toString__long_b6:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s6
    mov edx, adenc_aden_lang_Long_toString__long_trace_s6_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s7
    mov edx, adenc_aden_lang_Long_toString__long_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_toString__long_b7
adenc_aden_lang_Long_toString__long_b7:
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
    jne adenc_aden_lang_Long_toString__long_b8
    jmp adenc_aden_lang_Long_toString__long_b9
adenc_aden_lang_Long_toString__long_b8:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s8
    mov edx, adenc_aden_lang_Long_toString__long_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+88], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s9
    mov edx, adenc_aden_lang_Long_toString__long_trace_s9_len
    call adenc_rt_traceUpdateTop
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
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s10
    mov edx, adenc_aden_lang_Long_toString__long_trace_s10_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_valueOf__char
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s11
    mov edx, adenc_aden_lang_Long_toString__long_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s7
    mov edx, adenc_aden_lang_Long_toString__long_trace_s7_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_toString__long_b7
adenc_aden_lang_Long_toString__long_b9:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s12
    mov edx, adenc_aden_lang_Long_toString__long_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    sub rax, rdx
    mov dword ptr [rsp+104], eax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s13
    mov edx, adenc_aden_lang_Long_toString__long_trace_s13_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_valueOf__char
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s14
    mov edx, adenc_aden_lang_Long_toString__long_trace_s14_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne adenc_aden_lang_Long_toString__long_b10
    jmp adenc_aden_lang_Long_toString__long_b11
adenc_aden_lang_Long_toString__long_b10:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s15
    mov edx, adenc_aden_lang_Long_toString__long_trace_s15_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+200]
    mov rdx, rax
    mov rcx, qword ptr [rsp+248]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+240]
    jmp adenc_aden_lang_Long_toString__long_epilogue
adenc_aden_lang_Long_toString__long_b11:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s14
    mov edx, adenc_aden_lang_Long_toString__long_trace_s14_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Long_toString__long_b12
adenc_aden_lang_Long_toString__long_b12:
    lea rcx, adenc_aden_lang_Long_toString__long_trace_s16
    mov edx, adenc_aden_lang_Long_toString__long_trace_s16_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Long_toString__long_epilogue
adenc_aden_lang_Long_toString__long_epilogue:
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+240]
adenc_aden_lang_Long_toString__long_epilogue_post:
    mov qword ptr [rsp+240], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+240]
    add rsp, 408
    ret
adenc_aden_lang_Long_toString__long endp

adenc_fget_aden_lang_Long_MIN_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_Long_MIN_VALUE]
    ret
adenc_fget_aden_lang_Long_MIN_VALUE endp

adenc_fset_aden_lang_Long_MIN_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_Long_MIN_VALUE], rcx
    ret
adenc_fset_aden_lang_Long_MIN_VALUE endp


adenc_fget_aden_lang_Long_MAX_VALUE proc
    mov rax, qword ptr [adenc_fld_aden_lang_Long_MAX_VALUE]
    ret
adenc_fget_aden_lang_Long_MAX_VALUE endp

adenc_fset_aden_lang_Long_MAX_VALUE proc
    mov qword ptr [adenc_fld_aden_lang_Long_MAX_VALUE], rcx
    ret
adenc_fset_aden_lang_Long_MAX_VALUE endp


end
