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
pulsec_pulse_lang_UInteger_valueOf__uint_trace_s0 db "pulse.lang.UInteger.valueOf(UInteger.pulse:24)"
pulsec_pulse_lang_UInteger_valueOf__uint_trace_s0_len equ 46
trace_m2 db "pulse.lang.UInteger.parse"
trace_m2_len equ 25
pulsec_pulse_lang_UInteger_parse__String_trace_s0 db "pulse.lang.UInteger.parse(UInteger.pulse:32)"
pulsec_pulse_lang_UInteger_parse__String_trace_s0_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s1 db "pulse.lang.UInteger.parse(UInteger.pulse:33)"
pulsec_pulse_lang_UInteger_parse__String_trace_s1_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s2 db "pulse.lang.UInteger.parse(UInteger.pulse:36)"
pulsec_pulse_lang_UInteger_parse__String_trace_s2_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s3 db "pulse.lang.UInteger.parse(UInteger.pulse:37)"
pulsec_pulse_lang_UInteger_parse__String_trace_s3_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s4 db "pulse.lang.UInteger.parse(UInteger.pulse:38)"
pulsec_pulse_lang_UInteger_parse__String_trace_s4_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s5 db "pulse.lang.UInteger.parse(UInteger.pulse:41)"
pulsec_pulse_lang_UInteger_parse__String_trace_s5_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s6 db "pulse.lang.UInteger.parse(UInteger.pulse:42)"
pulsec_pulse_lang_UInteger_parse__String_trace_s6_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s7 db "pulse.lang.UInteger.parse(UInteger.pulse:43)"
pulsec_pulse_lang_UInteger_parse__String_trace_s7_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s8 db "pulse.lang.UInteger.parse(UInteger.pulse:44)"
pulsec_pulse_lang_UInteger_parse__String_trace_s8_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s9 db "pulse.lang.UInteger.parse(UInteger.pulse:45)"
pulsec_pulse_lang_UInteger_parse__String_trace_s9_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s10 db "pulse.lang.UInteger.parse(UInteger.pulse:46)"
pulsec_pulse_lang_UInteger_parse__String_trace_s10_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s11 db "pulse.lang.UInteger.parse(UInteger.pulse:49)"
pulsec_pulse_lang_UInteger_parse__String_trace_s11_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s12 db "pulse.lang.UInteger.parse(UInteger.pulse:50)"
pulsec_pulse_lang_UInteger_parse__String_trace_s12_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s13 db "pulse.lang.UInteger.parse(UInteger.pulse:53)"
pulsec_pulse_lang_UInteger_parse__String_trace_s13_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s14 db "pulse.lang.UInteger.parse(UInteger.pulse:54)"
pulsec_pulse_lang_UInteger_parse__String_trace_s14_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s15 db "pulse.lang.UInteger.parse(UInteger.pulse:55)"
pulsec_pulse_lang_UInteger_parse__String_trace_s15_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s16 db "pulse.lang.UInteger.parse(UInteger.pulse:56)"
pulsec_pulse_lang_UInteger_parse__String_trace_s16_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s17 db "pulse.lang.UInteger.parse(UInteger.pulse:57)"
pulsec_pulse_lang_UInteger_parse__String_trace_s17_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s18 db "pulse.lang.UInteger.parse(UInteger.pulse:58)"
pulsec_pulse_lang_UInteger_parse__String_trace_s18_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s19 db "pulse.lang.UInteger.parse(UInteger.pulse:59)"
pulsec_pulse_lang_UInteger_parse__String_trace_s19_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s20 db "pulse.lang.UInteger.parse(UInteger.pulse:60)"
pulsec_pulse_lang_UInteger_parse__String_trace_s20_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s21 db "pulse.lang.UInteger.parse(UInteger.pulse:63)"
pulsec_pulse_lang_UInteger_parse__String_trace_s21_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s22 db "pulse.lang.UInteger.parse(UInteger.pulse:64)"
pulsec_pulse_lang_UInteger_parse__String_trace_s22_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s23 db "pulse.lang.UInteger.parse(UInteger.pulse:65)"
pulsec_pulse_lang_UInteger_parse__String_trace_s23_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s24 db "pulse.lang.UInteger.parse(UInteger.pulse:67)"
pulsec_pulse_lang_UInteger_parse__String_trace_s24_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s25 db "pulse.lang.UInteger.parse(UInteger.pulse:68)"
pulsec_pulse_lang_UInteger_parse__String_trace_s25_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s26 db "pulse.lang.UInteger.parse(UInteger.pulse:71)"
pulsec_pulse_lang_UInteger_parse__String_trace_s26_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s27 db "pulse.lang.UInteger.parse(UInteger.pulse:72)"
pulsec_pulse_lang_UInteger_parse__String_trace_s27_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s28 db "pulse.lang.UInteger.parse(UInteger.pulse:75)"
pulsec_pulse_lang_UInteger_parse__String_trace_s28_len equ 44
pulsec_pulse_lang_UInteger_parse__String_trace_s29 db "pulse.lang.UInteger.parse(UInteger.pulse:76)"
pulsec_pulse_lang_UInteger_parse__String_trace_s29_len equ 44
trace_m33 db "pulse.lang.UInteger.uintValue"
trace_m33_len equ 29
pulsec_pulse_lang_UInteger_uintValue__UInteger_trace_s0 db "pulse.lang.UInteger.uintValue(UInteger.pulse:84)"
pulsec_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len equ 48
trace_m35 db "pulse.lang.UInteger.equals"
trace_m35_len equ 26
pulsec_pulse_lang_UInteger_equals__uint_uint_trace_s0 db "pulse.lang.UInteger.equals(UInteger.pulse:92)"
pulsec_pulse_lang_UInteger_equals__uint_uint_trace_s0_len equ 45
trace_m37 db "pulse.lang.UInteger.compare"
trace_m37_len equ 27
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0 db "pulse.lang.UInteger.compare(UInteger.pulse:100)"
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0_len equ 47
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s1 db "pulse.lang.UInteger.compare(UInteger.pulse:101)"
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s1_len equ 47
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2 db "pulse.lang.UInteger.compare(UInteger.pulse:103)"
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2_len equ 47
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s3 db "pulse.lang.UInteger.compare(UInteger.pulse:104)"
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s3_len equ 47
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s4 db "pulse.lang.UInteger.compare(UInteger.pulse:106)"
pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s4_len equ 47
trace_m43 db "pulse.lang.UInteger.toString"
trace_m43_len equ 28
pulsec_pulse_lang_UInteger_toString__uint_trace_s0 db "pulse.lang.UInteger.toString(UInteger.pulse:114)"
pulsec_pulse_lang_UInteger_toString__uint_trace_s0_len equ 48
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
    lea rcx, pulsec_pulse_lang_UInteger_valueOf__uint_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_valueOf__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_UInteger_valueOf__uint_epilogue
pulsec_pulse_lang_UInteger_valueOf__uint_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+144], rcx
pulsec_pulse_lang_UInteger_parse__String_b0:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s1
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s1_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b3
pulsec_pulse_lang_UInteger_parse__String_b2:
    jmp pulsec_pulse_lang_UInteger_parse__String_b3
pulsec_pulse_lang_UInteger_parse__String_b3:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s2
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s4
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s4_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b6
pulsec_pulse_lang_UInteger_parse__String_b5:
    jmp pulsec_pulse_lang_UInteger_parse__String_b6
pulsec_pulse_lang_UInteger_parse__String_b6:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s5
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s6
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
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
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s7
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s8
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s7
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b9
pulsec_pulse_lang_UInteger_parse__String_b8:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s11
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s11_len
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
    jne pulsec_pulse_lang_UInteger_parse__String_b13
    jmp pulsec_pulse_lang_UInteger_parse__String_b14
pulsec_pulse_lang_UInteger_parse__String_b10:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s10
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s10_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b12
pulsec_pulse_lang_UInteger_parse__String_b11:
    jmp pulsec_pulse_lang_UInteger_parse__String_b12
pulsec_pulse_lang_UInteger_parse__String_b12:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s7
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b9
pulsec_pulse_lang_UInteger_parse__String_b13:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s12
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s12_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s11
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b15
pulsec_pulse_lang_UInteger_parse__String_b14:
    jmp pulsec_pulse_lang_UInteger_parse__String_b15
pulsec_pulse_lang_UInteger_parse__String_b15:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s13
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, 0
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s14
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, 10
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s15
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, 4294967295
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rdx
    cqo
    idiv rcx
    mov qword ptr [rsp+104], rax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s16
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s17
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s18
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+144]
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s28
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s28_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+128], rax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s29
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov ecx, eax
    call pulsec_pulse_lang_UInteger_valueOf__uint
    jmp pulsec_pulse_lang_UInteger_parse__String_epilogue
pulsec_pulse_lang_UInteger_parse__String_b19:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s20
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s20_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b21
pulsec_pulse_lang_UInteger_parse__String_b20:
    jmp pulsec_pulse_lang_UInteger_parse__String_b21
pulsec_pulse_lang_UInteger_parse__String_b21:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s21
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s22
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s22_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s23
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s23_len
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s22
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s22_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b24
pulsec_pulse_lang_UInteger_parse__String_b23:
    jmp pulsec_pulse_lang_UInteger_parse__String_b24
pulsec_pulse_lang_UInteger_parse__String_b24:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s25
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s25_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b27
pulsec_pulse_lang_UInteger_parse__String_b26:
    jmp pulsec_pulse_lang_UInteger_parse__String_b27
pulsec_pulse_lang_UInteger_parse__String_b27:
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s26
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s26_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s27
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+280], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_UInteger_parse__String_trace_s17
    mov edx, pulsec_pulse_lang_UInteger_parse__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_parse__String_b16
pulsec_pulse_lang_UInteger_parse__String_epilogue:
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
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
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_UInteger_uintValue__UInteger_b0:
    lea rcx, pulsec_pulse_lang_UInteger_uintValue__UInteger_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_uintValue__UInteger_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_UInteger_uintValue__UInteger_epilogue
pulsec_pulse_lang_UInteger_uintValue__UInteger_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_UInteger_equals__uint_uint_b0:
    lea rcx, pulsec_pulse_lang_UInteger_equals__uint_uint_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_equals__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
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
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_UInteger_compare__uint_uint_b0:
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s1
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_b2:
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b3
pulsec_pulse_lang_UInteger_compare__uint_uint_b3:
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s3
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_b5:
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_b6
pulsec_pulse_lang_UInteger_compare__uint_uint_b6:
    lea rcx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s4
    mov edx, pulsec_pulse_lang_UInteger_compare__uint_uint_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue
pulsec_pulse_lang_UInteger_compare__uint_uint_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
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
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_UInteger_toString__uint_b0:
    lea rcx, pulsec_pulse_lang_UInteger_toString__uint_trace_s0
    mov edx, pulsec_pulse_lang_UInteger_toString__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    jmp pulsec_pulse_lang_UInteger_toString__uint_epilogue
pulsec_pulse_lang_UInteger_toString__uint_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
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
