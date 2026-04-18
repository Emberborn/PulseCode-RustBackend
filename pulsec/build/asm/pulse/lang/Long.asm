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
extrn pulsec_rt_traceUpdateTop:proc
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
pulsec_pulse_lang_Long_valueOf__long_trace_s0 db "pulse.lang.Long.valueOf(Long.pulse:24)"
pulsec_pulse_lang_Long_valueOf__long_trace_s0_len equ 38
trace_m2 db "pulse.lang.Long.parse"
trace_m2_len equ 21
pulsec_pulse_lang_Long_parse__String_trace_s0 db "pulse.lang.Long.parse(Long.pulse:32)"
pulsec_pulse_lang_Long_parse__String_trace_s0_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s1 db "pulse.lang.Long.parse(Long.pulse:33)"
pulsec_pulse_lang_Long_parse__String_trace_s1_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s2 db "pulse.lang.Long.parse(Long.pulse:36)"
pulsec_pulse_lang_Long_parse__String_trace_s2_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s3 db "pulse.lang.Long.parse(Long.pulse:37)"
pulsec_pulse_lang_Long_parse__String_trace_s3_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s4 db "pulse.lang.Long.parse(Long.pulse:38)"
pulsec_pulse_lang_Long_parse__String_trace_s4_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s5 db "pulse.lang.Long.parse(Long.pulse:41)"
pulsec_pulse_lang_Long_parse__String_trace_s5_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s6 db "pulse.lang.Long.parse(Long.pulse:42)"
pulsec_pulse_lang_Long_parse__String_trace_s6_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s7 db "pulse.lang.Long.parse(Long.pulse:43)"
pulsec_pulse_lang_Long_parse__String_trace_s7_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s8 db "pulse.lang.Long.parse(Long.pulse:44)"
pulsec_pulse_lang_Long_parse__String_trace_s8_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s9 db "pulse.lang.Long.parse(Long.pulse:45)"
pulsec_pulse_lang_Long_parse__String_trace_s9_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s10 db "pulse.lang.Long.parse(Long.pulse:46)"
pulsec_pulse_lang_Long_parse__String_trace_s10_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s11 db "pulse.lang.Long.parse(Long.pulse:47)"
pulsec_pulse_lang_Long_parse__String_trace_s11_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s12 db "pulse.lang.Long.parse(Long.pulse:48)"
pulsec_pulse_lang_Long_parse__String_trace_s12_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s13 db "pulse.lang.Long.parse(Long.pulse:49)"
pulsec_pulse_lang_Long_parse__String_trace_s13_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s14 db "pulse.lang.Long.parse(Long.pulse:50)"
pulsec_pulse_lang_Long_parse__String_trace_s14_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s15 db "pulse.lang.Long.parse(Long.pulse:53)"
pulsec_pulse_lang_Long_parse__String_trace_s15_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s16 db "pulse.lang.Long.parse(Long.pulse:54)"
pulsec_pulse_lang_Long_parse__String_trace_s16_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s17 db "pulse.lang.Long.parse(Long.pulse:57)"
pulsec_pulse_lang_Long_parse__String_trace_s17_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s18 db "pulse.lang.Long.parse(Long.pulse:58)"
pulsec_pulse_lang_Long_parse__String_trace_s18_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s19 db "pulse.lang.Long.parse(Long.pulse:59)"
pulsec_pulse_lang_Long_parse__String_trace_s19_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s20 db "pulse.lang.Long.parse(Long.pulse:60)"
pulsec_pulse_lang_Long_parse__String_trace_s20_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s21 db "pulse.lang.Long.parse(Long.pulse:61)"
pulsec_pulse_lang_Long_parse__String_trace_s21_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s22 db "pulse.lang.Long.parse(Long.pulse:62)"
pulsec_pulse_lang_Long_parse__String_trace_s22_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s23 db "pulse.lang.Long.parse(Long.pulse:64)"
pulsec_pulse_lang_Long_parse__String_trace_s23_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s24 db "pulse.lang.Long.parse(Long.pulse:65)"
pulsec_pulse_lang_Long_parse__String_trace_s24_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s25 db "pulse.lang.Long.parse(Long.pulse:66)"
pulsec_pulse_lang_Long_parse__String_trace_s25_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s26 db "pulse.lang.Long.parse(Long.pulse:68)"
pulsec_pulse_lang_Long_parse__String_trace_s26_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s27 db "pulse.lang.Long.parse(Long.pulse:69)"
pulsec_pulse_lang_Long_parse__String_trace_s27_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s28 db "pulse.lang.Long.parse(Long.pulse:70)"
pulsec_pulse_lang_Long_parse__String_trace_s28_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s29 db "pulse.lang.Long.parse(Long.pulse:72)"
pulsec_pulse_lang_Long_parse__String_trace_s29_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s30 db "pulse.lang.Long.parse(Long.pulse:73)"
pulsec_pulse_lang_Long_parse__String_trace_s30_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s31 db "pulse.lang.Long.parse(Long.pulse:76)"
pulsec_pulse_lang_Long_parse__String_trace_s31_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s32 db "pulse.lang.Long.parse(Long.pulse:77)"
pulsec_pulse_lang_Long_parse__String_trace_s32_len equ 36
pulsec_pulse_lang_Long_parse__String_trace_s33 db "pulse.lang.Long.parse(Long.pulse:79)"
pulsec_pulse_lang_Long_parse__String_trace_s33_len equ 36
trace_m37 db "pulse.lang.Long.longValue"
trace_m37_len equ 25
pulsec_pulse_lang_Long_longValue__Long_trace_s0 db "pulse.lang.Long.longValue(Long.pulse:87)"
pulsec_pulse_lang_Long_longValue__Long_trace_s0_len equ 40
trace_m39 db "pulse.lang.Long.equals"
trace_m39_len equ 22
pulsec_pulse_lang_Long_equals__long_long_trace_s0 db "pulse.lang.Long.equals(Long.pulse:95)"
pulsec_pulse_lang_Long_equals__long_long_trace_s0_len equ 37
trace_m41 db "pulse.lang.Long.compare"
trace_m41_len equ 23
pulsec_pulse_lang_Long_compare__long_long_trace_s0 db "pulse.lang.Long.compare(Long.pulse:103)"
pulsec_pulse_lang_Long_compare__long_long_trace_s0_len equ 39
pulsec_pulse_lang_Long_compare__long_long_trace_s1 db "pulse.lang.Long.compare(Long.pulse:104)"
pulsec_pulse_lang_Long_compare__long_long_trace_s1_len equ 39
pulsec_pulse_lang_Long_compare__long_long_trace_s2 db "pulse.lang.Long.compare(Long.pulse:106)"
pulsec_pulse_lang_Long_compare__long_long_trace_s2_len equ 39
pulsec_pulse_lang_Long_compare__long_long_trace_s3 db "pulse.lang.Long.compare(Long.pulse:107)"
pulsec_pulse_lang_Long_compare__long_long_trace_s3_len equ 39
pulsec_pulse_lang_Long_compare__long_long_trace_s4 db "pulse.lang.Long.compare(Long.pulse:109)"
pulsec_pulse_lang_Long_compare__long_long_trace_s4_len equ 39
trace_m47 db "pulse.lang.Long.toString"
trace_m47_len equ 24
pulsec_pulse_lang_Long_toString__long_trace_s0 db "pulse.lang.Long.toString(Long.pulse:117)"
pulsec_pulse_lang_Long_toString__long_trace_s0_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s1 db "pulse.lang.Long.toString(Long.pulse:118)"
pulsec_pulse_lang_Long_toString__long_trace_s1_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s2 db "pulse.lang.Long.toString(Long.pulse:121)"
pulsec_pulse_lang_Long_toString__long_trace_s2_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s3 db "pulse.lang.Long.toString(Long.pulse:122)"
pulsec_pulse_lang_Long_toString__long_trace_s3_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s4 db "pulse.lang.Long.toString(Long.pulse:123)"
pulsec_pulse_lang_Long_toString__long_trace_s4_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s5 db "pulse.lang.Long.toString(Long.pulse:124)"
pulsec_pulse_lang_Long_toString__long_trace_s5_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s6 db "pulse.lang.Long.toString(Long.pulse:127)"
pulsec_pulse_lang_Long_toString__long_trace_s6_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s7 db "pulse.lang.Long.toString(Long.pulse:128)"
pulsec_pulse_lang_Long_toString__long_trace_s7_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s8 db "pulse.lang.Long.toString(Long.pulse:129)"
pulsec_pulse_lang_Long_toString__long_trace_s8_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s9 db "pulse.lang.Long.toString(Long.pulse:130)"
pulsec_pulse_lang_Long_toString__long_trace_s9_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s10 db "pulse.lang.Long.toString(Long.pulse:131)"
pulsec_pulse_lang_Long_toString__long_trace_s10_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s11 db "pulse.lang.Long.toString(Long.pulse:132)"
pulsec_pulse_lang_Long_toString__long_trace_s11_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s12 db "pulse.lang.Long.toString(Long.pulse:135)"
pulsec_pulse_lang_Long_toString__long_trace_s12_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s13 db "pulse.lang.Long.toString(Long.pulse:136)"
pulsec_pulse_lang_Long_toString__long_trace_s13_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s14 db "pulse.lang.Long.toString(Long.pulse:137)"
pulsec_pulse_lang_Long_toString__long_trace_s14_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s15 db "pulse.lang.Long.toString(Long.pulse:138)"
pulsec_pulse_lang_Long_toString__long_trace_s15_len equ 40
pulsec_pulse_lang_Long_toString__long_trace_s16 db "pulse.lang.Long.toString(Long.pulse:140)"
pulsec_pulse_lang_Long_toString__long_trace_s16_len equ 40
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
    lea rcx, pulsec_pulse_lang_Long_valueOf__long_trace_s0
    mov edx, pulsec_pulse_lang_Long_valueOf__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
pulsec_pulse_lang_Long_parse__String_b0:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s1
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b3
pulsec_pulse_lang_Long_parse__String_b2:
    jmp pulsec_pulse_lang_Long_parse__String_b3
pulsec_pulse_lang_Long_parse__String_b3:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s2
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s4
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b6
pulsec_pulse_lang_Long_parse__String_b5:
    jmp pulsec_pulse_lang_Long_parse__String_b6
pulsec_pulse_lang_Long_parse__String_b6:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s5
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s6
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s7
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+160], rax
    call pulsec_fget_pulse_lang_Long_MAX_VALUE
    mov rdx, rax
    mov rax, qword ptr [rsp+160]
    sub rax, rdx
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s8
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s10
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s11
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    call pulsec_fget_pulse_lang_Long_MIN_VALUE
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s12
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b9
pulsec_pulse_lang_Long_parse__String_b8:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s13
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s15
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s14
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s13
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b12
pulsec_pulse_lang_Long_parse__String_b11:
    jmp pulsec_pulse_lang_Long_parse__String_b12
pulsec_pulse_lang_Long_parse__String_b12:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b9
pulsec_pulse_lang_Long_parse__String_b13:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s16
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s15
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b15
pulsec_pulse_lang_Long_parse__String_b14:
    jmp pulsec_pulse_lang_Long_parse__String_b15
pulsec_pulse_lang_Long_parse__String_b15:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s17
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+192], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+104], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s18
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s20
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s20_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s21
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s31
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne pulsec_pulse_lang_Long_parse__String_b28
    jmp pulsec_pulse_lang_Long_parse__String_b29
pulsec_pulse_lang_Long_parse__String_b19:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s22
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s22_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s21
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b21
pulsec_pulse_lang_Long_parse__String_b20:
    jmp pulsec_pulse_lang_Long_parse__String_b21
pulsec_pulse_lang_Long_parse__String_b21:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s23
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s23_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s25
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s25_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b24
pulsec_pulse_lang_Long_parse__String_b23:
    jmp pulsec_pulse_lang_Long_parse__String_b24
pulsec_pulse_lang_Long_parse__String_b24:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s26
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+240]
    imul rax, rdx
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s27
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s28
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s28_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s27
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b27
pulsec_pulse_lang_Long_parse__String_b26:
    jmp pulsec_pulse_lang_Long_parse__String_b27
pulsec_pulse_lang_Long_parse__String_b27:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s29
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+264], rax
    mov eax, dword ptr [rsp+128]
    movsxd rax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+264]
    sub rax, rdx
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s30
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b16
pulsec_pulse_lang_Long_parse__String_b28:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s32
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s32_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_pulse_lang_Long_valueOf__long
    jmp pulsec_pulse_lang_Long_parse__String_epilogue
pulsec_pulse_lang_Long_parse__String_b29:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s31
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_parse__String_b30
pulsec_pulse_lang_Long_parse__String_b30:
    lea rcx, pulsec_pulse_lang_Long_parse__String_trace_s33
    mov edx, pulsec_pulse_lang_Long_parse__String_trace_s33_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Long_longValue__Long_b0:
    lea rcx, pulsec_pulse_lang_Long_longValue__Long_trace_s0
    mov edx, pulsec_pulse_lang_Long_longValue__Long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Long_equals__long_long_b0:
    lea rcx, pulsec_pulse_lang_Long_equals__long_long_trace_s0
    mov edx, pulsec_pulse_lang_Long_equals__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Long_compare__long_long_b0:
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s1
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Long_compare__long_long_epilogue
pulsec_pulse_lang_Long_compare__long_long_b2:
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s0
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_compare__long_long_b3
pulsec_pulse_lang_Long_compare__long_long_b3:
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s3
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_lang_Long_compare__long_long_epilogue
pulsec_pulse_lang_Long_compare__long_long_b5:
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s2
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_compare__long_long_b6
pulsec_pulse_lang_Long_compare__long_long_b6:
    lea rcx, pulsec_pulse_lang_Long_compare__long_long_trace_s4
    mov edx, pulsec_pulse_lang_Long_compare__long_long_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_Long_toString__long_b0:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s0
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s1
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Long_toString__long_epilogue
pulsec_pulse_lang_Long_toString__long_b2:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s0
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_toString__long_b3
pulsec_pulse_lang_Long_toString__long_b3:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s2
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+128], rax
    mov rax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    setl al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s3
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s4
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b4
    jmp pulsec_pulse_lang_Long_toString__long_b5
pulsec_pulse_lang_Long_toString__long_b4:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s5
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    sub rax, rdx
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s4
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_toString__long_b6
pulsec_pulse_lang_Long_toString__long_b5:
    jmp pulsec_pulse_lang_Long_toString__long_b6
pulsec_pulse_lang_Long_toString__long_b6:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s6
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s6_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s7
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s7_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s8
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, 10
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s9
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s9_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s10
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s10_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s11
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s7
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_toString__long_b7
pulsec_pulse_lang_Long_toString__long_b9:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s12
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    sub rax, rdx
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s13
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s13_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s14
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Long_toString__long_b10
    jmp pulsec_pulse_lang_Long_toString__long_b11
pulsec_pulse_lang_Long_toString__long_b10:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s15
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s15_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s14
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Long_toString__long_b12
pulsec_pulse_lang_Long_toString__long_b12:
    lea rcx, pulsec_pulse_lang_Long_toString__long_trace_s16
    mov edx, pulsec_pulse_lang_Long_toString__long_trace_s16_len
    call pulsec_rt_traceUpdateTop
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
