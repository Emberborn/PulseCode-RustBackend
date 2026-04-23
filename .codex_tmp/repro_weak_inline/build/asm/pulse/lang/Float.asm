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
extrn pulsec_rt_fpToInt:proc
extrn pulsec_rt_fpToLong:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_Double_doubleValue__Double:proc
extrn pulsec_pulse_lang_Double_parse__String:proc
extrn pulsec_pulse_lang_Integer_toString__int:proc
extrn pulsec_pulse_lang_Long_toString__long:proc
extrn pulsec_pulse_lang_StringBuilder_StringBuilder:proc
extrn pulsec_pulse_lang_StringBuilder_append__String:proc
extrn pulsec_pulse_lang_StringBuilder_append__char:proc
extrn pulsec_pulse_lang_StringBuilder_toString:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
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

public pulsec_fld_pulse_lang_Float_MIN_VALUE
public pulsec_fget_pulse_lang_Float_MIN_VALUE
public pulsec_fset_pulse_lang_Float_MIN_VALUE
public pulsec_fld_pulse_lang_Float_MAX_VALUE
public pulsec_fget_pulse_lang_Float_MAX_VALUE
public pulsec_fset_pulse_lang_Float_MAX_VALUE

.data
written dq 0
pulsec_objc_pulse_lang_Float dd 0
pulsec_fld_pulse_lang_Float_MIN_VALUE dq 0
pulsec_fld_pulse_lang_Float_MAX_VALUE dq 0
trace_m0 db "pulse.lang.Float.valueOf"
trace_m0_len equ 24
trace_m1 db "pulse.lang.Float.parse"
trace_m1_len equ 22
trace_m2 db "pulse.lang.Float.floatValue"
trace_m2_len equ 27
trace_m3 db "pulse.lang.Float.equals"
trace_m3_len equ 23
trace_m4 db "pulse.lang.Float.compare"
trace_m4_len equ 24
trace_m5 db "pulse.lang.Float.toString"
trace_m5_len equ 25
trace_m6 db "pulse.lang.Float.buildMinValue"
trace_m6_len equ 30
trace_m7 db "pulse.lang.Float.buildMaxValue"
trace_m7_len equ 30
msg0 db "NaN"
msg0_len equ 3
msg1 db "-0.0"
msg1_len equ 4
msg2 db "0.0"
msg2_len equ 3
msg3 db "-"
msg3_len equ 1
msg4 db ".0"
msg4_len equ 2
msg5 db ".0"
msg5_len equ 2

.code
pulsec_pulse_lang_Float_valueOf__float proc
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
pulsec_pulse_lang_Float_valueOf__float_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_valueOf__float_epilogue
pulsec_pulse_lang_Float_valueOf__float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Float_valueOf__float endp

pulsec_pulse_lang_Float_parse__String proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Float_parse__String_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Double_parse__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Double_doubleValue__Double
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Float_valueOf__float
    jmp pulsec_pulse_lang_Float_parse__String_epilogue
pulsec_pulse_lang_Float_parse__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 312
    ret
pulsec_pulse_lang_Float_parse__String endp

pulsec_pulse_lang_Float_floatValue__Float proc
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
pulsec_pulse_lang_Float_floatValue__Float_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Float_floatValue__Float_epilogue
pulsec_pulse_lang_Float_floatValue__Float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Float_floatValue__Float endp

pulsec_pulse_lang_Float_equals__float_float proc
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
pulsec_pulse_lang_Float_equals__float_float_b0:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    ucomisd xmm0, xmm1
    jp Float_equals_fp_cmp_0_2_unordered
    sete al
    jmp Float_equals_fp_cmp_0_2_done
Float_equals_fp_cmp_0_2_unordered:
    xor eax, eax
Float_equals_fp_cmp_0_2_done:
    movzx eax, al
    jmp pulsec_pulse_lang_Float_equals__float_float_epilogue
pulsec_pulse_lang_Float_equals__float_float_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Float_equals__float_float endp

pulsec_pulse_lang_Float_compare__float_float proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_pulse_lang_Float_compare__float_float_b0:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+96], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+96]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_0_2_unordered
    setb al
    jmp Float_compare_fp_cmp_0_2_done
Float_compare_fp_cmp_0_2_unordered:
    xor eax, eax
Float_compare_fp_cmp_0_2_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_pulse_lang_Float_compare__float_float_b2
pulsec_pulse_lang_Float_compare__float_float_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b2:
    jmp pulsec_pulse_lang_Float_compare__float_float_b3
pulsec_pulse_lang_Float_compare__float_float_b3:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+104], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+104]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_2_7_unordered
    seta al
    jmp Float_compare_fp_cmp_2_7_done
Float_compare_fp_cmp_2_7_unordered:
    xor eax, eax
Float_compare_fp_cmp_2_7_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b4
    jmp pulsec_pulse_lang_Float_compare__float_float_b5
pulsec_pulse_lang_Float_compare__float_float_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b5:
    jmp pulsec_pulse_lang_Float_compare__float_float_b6
pulsec_pulse_lang_Float_compare__float_float_b6:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+112], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+112]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_4_11_unordered
    sete al
    jmp Float_compare_fp_cmp_4_11_done
Float_compare_fp_cmp_4_11_unordered:
    xor eax, eax
Float_compare_fp_cmp_4_11_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b7
    jmp pulsec_pulse_lang_Float_compare__float_float_b8
pulsec_pulse_lang_Float_compare__float_float_b7:
    mov eax, 0
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b8:
    jmp pulsec_pulse_lang_Float_compare__float_float_b9
pulsec_pulse_lang_Float_compare__float_float_b9:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+120], xmm0
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+120]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_6_15_unordered
    setne al
    jmp Float_compare_fp_cmp_6_15_done
Float_compare_fp_cmp_6_15_unordered:
    mov al, 1
Float_compare_fp_cmp_6_15_done:
    movzx eax, al
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+128], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+128]
    ucomisd xmm0, xmm1
    jp Float_compare_fp_cmp_7_18_unordered
    setne al
    jmp Float_compare_fp_cmp_7_18_done
Float_compare_fp_cmp_7_18_unordered:
    mov al, 1
Float_compare_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Float_compare_ternary_then_8_22
    mov eax, 0
    jmp Float_compare_ternary_done_8_22
Float_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Float_compare_ternary_done_8_22:
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b10
    jmp pulsec_pulse_lang_Float_compare__float_float_b11
pulsec_pulse_lang_Float_compare__float_float_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b11:
    jmp pulsec_pulse_lang_Float_compare__float_float_b12
pulsec_pulse_lang_Float_compare__float_float_b12:
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Float_compare__float_float_b13
    jmp pulsec_pulse_lang_Float_compare__float_float_b14
pulsec_pulse_lang_Float_compare__float_float_b13:
    mov eax, 1
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_b14:
    jmp pulsec_pulse_lang_Float_compare__float_float_b15
pulsec_pulse_lang_Float_compare__float_float_b15:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Float_compare__float_float_epilogue
pulsec_pulse_lang_Float_compare__float_float_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
pulsec_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 264
    ret
pulsec_pulse_lang_Float_compare__float_float endp

pulsec_pulse_lang_Float_toString__float proc
    sub rsp, 904
    mov qword ptr [rsp+872], rcx
    mov qword ptr [rsp+880], rdx
    mov qword ptr [rsp+888], r8
    mov qword ptr [rsp+896], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+872]
    mov rdx, qword ptr [rsp+880]
    mov r8, qword ptr [rsp+888]
    mov r9, qword ptr [rsp+896]
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+144], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+136], 0
    mov qword ptr [rsp+168], 0
    mov qword ptr [rsp+128], 0
    mov qword ptr [rsp+176], 0
pulsec_pulse_lang_Float_toString__float_b0:
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+208], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+208]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_1_4_unordered
    setne al
    jmp Float_toString_fp_cmp_1_4_done
Float_toString_fp_cmp_1_4_unordered:
    mov al, 1
Float_toString_fp_cmp_1_4_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b1
    jmp pulsec_pulse_lang_Float_toString__float_b2
pulsec_pulse_lang_Float_toString__float_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b2:
    jmp pulsec_pulse_lang_Float_toString__float_b3
pulsec_pulse_lang_Float_toString__float_b3:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+216], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+216]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_3_8_unordered
    sete al
    jmp Float_toString_fp_cmp_3_8_done
Float_toString_fp_cmp_3_8_unordered:
    xor eax, eax
Float_toString_fp_cmp_3_8_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b4
    jmp pulsec_pulse_lang_Float_toString__float_b5
pulsec_pulse_lang_Float_toString__float_b4:
    mov rax, 4607182418800017408
    movq xmm0, rax
    movq qword ptr [rsp+224], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+224]
    divsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+232], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+232]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_4_13_unordered
    setb al
    jmp Float_toString_fp_cmp_4_13_done
Float_toString_fp_cmp_4_13_unordered:
    xor eax, eax
Float_toString_fp_cmp_4_13_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b7
    jmp pulsec_pulse_lang_Float_toString__float_b8
pulsec_pulse_lang_Float_toString__float_b5:
    jmp pulsec_pulse_lang_Float_toString__float_b6
pulsec_pulse_lang_Float_toString__float_b6:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+240], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+240]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_7_18_unordered
    setb al
    jmp Float_toString_fp_cmp_7_18_done
Float_toString_fp_cmp_7_18_unordered:
    xor eax, eax
Float_toString_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b10
    jmp pulsec_pulse_lang_Float_toString__float_b11
pulsec_pulse_lang_Float_toString__float_b7:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b8:
    jmp pulsec_pulse_lang_Float_toString__float_b9
pulsec_pulse_lang_Float_toString__float_b9:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b10:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+248], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+248]
    subsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_lang_Float_toString__float_b12
pulsec_pulse_lang_Float_toString__float_b11:
    jmp pulsec_pulse_lang_Float_toString__float_b12
pulsec_pulse_lang_Float_toString__float_b12:
    mov eax, 0
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Float_toString__float_b13
pulsec_pulse_lang_Float_toString__float_b13:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+256], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+256]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_11_27_unordered
    setae al
    jmp Float_toString_fp_cmp_11_27_done
Float_toString_fp_cmp_11_27_unordered:
    xor eax, eax
Float_toString_fp_cmp_11_27_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b14
    jmp pulsec_pulse_lang_Float_toString__float_b15
pulsec_pulse_lang_Float_toString__float_b14:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+264], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+264]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Float_toString__float_b13
pulsec_pulse_lang_Float_toString__float_b15:
    jmp pulsec_pulse_lang_Float_toString__float_b16
pulsec_pulse_lang_Float_toString__float_b16:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+280], xmm0
    mov rax, 4607182418800017408
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+280]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_14_38_unordered
    setb al
    jmp Float_toString_fp_cmp_14_38_done
Float_toString_fp_cmp_14_38_unordered:
    xor eax, eax
Float_toString_fp_cmp_14_38_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b17
    jmp pulsec_pulse_lang_Float_toString__float_b18
pulsec_pulse_lang_Float_toString__float_b17:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+288], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+288]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+296], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Float_toString__float_b16
pulsec_pulse_lang_Float_toString__float_b18:
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movq qword ptr [rsp+304], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+304]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_17_50_unordered
    setb al
    jmp Float_toString_fp_cmp_17_50_done
Float_toString_fp_cmp_17_50_unordered:
    xor eax, eax
Float_toString_fp_cmp_17_50_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_17_57
    mov rax, qword ptr [rsp+200]
    jmp Float_toString_ternary_done_17_57
Float_toString_ternary_then_17_57:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+312], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+312]
    subsd xmm0, xmm1
    movq rax, xmm0
Float_toString_ternary_done_17_57:
    mov rcx, rax
    call pulsec_rt_fpToLong
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+336], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movq qword ptr [rsp+320], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+320]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_18_65_unordered
    setb al
    jmp Float_toString_fp_cmp_18_65_done
Float_toString_fp_cmp_18_65_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_65_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_18_72
    mov rax, qword ptr [rsp+200]
    jmp Float_toString_ternary_done_18_72
Float_toString_ternary_then_18_72:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+328], xmm0
    mov rax, qword ptr [rsp+200]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+328]
    subsd xmm0, xmm1
    movq rax, xmm0
Float_toString_ternary_done_18_72:
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+336]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_18_73_unordered
    sete al
    jmp Float_toString_fp_cmp_18_73_done
Float_toString_fp_cmp_18_73_unordered:
    xor eax, eax
Float_toString_fp_cmp_18_73_done:
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_18_78
    mov eax, 0
    jmp Float_toString_ternary_done_18_78
Float_toString_ternary_then_18_78:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+344], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+344]
    cmp eax, edx
    setge al
    movzx eax, al
Float_toString_ternary_done_18_78:
    test rax, rax
    jne Float_toString_ternary_then_18_82
    mov eax, 0
    jmp Float_toString_ternary_done_18_82
Float_toString_ternary_then_18_82:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+352], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+352]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_18_82:
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b19
    jmp pulsec_pulse_lang_Float_toString__float_b20
pulsec_pulse_lang_Float_toString__float_b19:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_pulse_lang_Long_toString__long
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b22
    jmp pulsec_pulse_lang_Float_toString__float_b23
pulsec_pulse_lang_Float_toString__float_b20:
    jmp pulsec_pulse_lang_Float_toString__float_b21
pulsec_pulse_lang_Float_toString__float_b21:
    mov eax, 7
    mov dword ptr [rsp+104], eax
    mov rax, 4602678819172646912
    mov qword ptr [rsp+112], rax
    mov eax, 0
    mov dword ptr [rsp+120], eax
    jmp pulsec_pulse_lang_Float_toString__float_b25
pulsec_pulse_lang_Float_toString__float_b22:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+744], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+744], rax
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b23:
    jmp pulsec_pulse_lang_Float_toString__float_b24
pulsec_pulse_lang_Float_toString__float_b24:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+744], rax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov qword ptr [rsp+696], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+696]
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b25:
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+360], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+360]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b26
    jmp pulsec_pulse_lang_Float_toString__float_b27
pulsec_pulse_lang_Float_toString__float_b26:
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    movq qword ptr [rsp+368], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+368]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+376], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+376]
    add eax, edx
    mov dword ptr [rsp+120], eax
    jmp pulsec_pulse_lang_Float_toString__float_b25
pulsec_pulse_lang_Float_toString__float_b27:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+384], xmm0
    mov rax, qword ptr [rsp+112]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+384]
    addsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+392], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+392]
    ucomisd xmm0, xmm1
    jp Float_toString_fp_cmp_32_121_unordered
    setae al
    jmp Float_toString_fp_cmp_32_121_done
Float_toString_fp_cmp_32_121_unordered:
    xor eax, eax
Float_toString_fp_cmp_32_121_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b28
    jmp pulsec_pulse_lang_Float_toString__float_b29
pulsec_pulse_lang_Float_toString__float_b28:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+400], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+400]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+408], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+408]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Float_toString__float_b30
pulsec_pulse_lang_Float_toString__float_b29:
    jmp pulsec_pulse_lang_Float_toString__float_b30
pulsec_pulse_lang_Float_toString__float_b30:
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+144], rax
    mov eax, 0
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b31
pulsec_pulse_lang_Float_toString__float_b31:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+416], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+416]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b32
    jmp pulsec_pulse_lang_Float_toString__float_b33
pulsec_pulse_lang_Float_toString__float_b32:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_fpToInt
    mov dword ptr [rsp+160], eax
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+424], eax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+424]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_32_39_2_done:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+432], xmm0
    mov eax, dword ptr [rsp+160]
    movsxd rax, eax
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+432]
    subsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+440], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+440]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+448], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+448]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b31
pulsec_pulse_lang_Float_toString__float_b33:
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd42_158_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd42_158_done
Float_toString_vd42_158_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd42_158_done:
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+168], rax
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+728], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+176], rax
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b34
    jmp pulsec_pulse_lang_Float_toString__float_b35
pulsec_pulse_lang_Float_toString__float_b34:
    mov eax, 45
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_34_45_0_done:
    jmp pulsec_pulse_lang_Float_toString__float_b36
pulsec_pulse_lang_Float_toString__float_b35:
    jmp pulsec_pulse_lang_Float_toString__float_b36
pulsec_pulse_lang_Float_toString__float_b36:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+456], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+456]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_46_173
    mov eax, 0
    jmp Float_toString_ternary_done_46_173
Float_toString_ternary_then_46_173:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+464], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+464]
    cmp eax, edx
    setl al
    movzx eax, al
Float_toString_ternary_done_46_173:
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b37
    jmp pulsec_pulse_lang_Float_toString__float_b38
pulsec_pulse_lang_Float_toString__float_b37:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+472], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+472]
    add eax, edx
    mov dword ptr [rsp+184], eax
    mov eax, 0
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+480], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+480]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b40
    jmp pulsec_pulse_lang_Float_toString__float_b41
pulsec_pulse_lang_Float_toString__float_b38:
    jmp pulsec_pulse_lang_Float_toString__float_b39
pulsec_pulse_lang_Float_toString__float_b39:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, 0
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_81_0_done:
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_39_82_1_done:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b67
pulsec_pulse_lang_Float_toString__float_b40:
    jmp pulsec_pulse_lang_Float_toString__float_b43
pulsec_pulse_lang_Float_toString__float_b41:
    jmp pulsec_pulse_lang_Float_toString__float_b42
pulsec_pulse_lang_Float_toString__float_b42:
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_67_0_done:
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_42_68_1_done:
    mov eax, 0
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b58
pulsec_pulse_lang_Float_toString__float_b43:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+488], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+488]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b44
    jmp pulsec_pulse_lang_Float_toString__float_b45
pulsec_pulse_lang_Float_toString__float_b44:
    mov eax, 48
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+496], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+496]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b46
    jmp pulsec_pulse_lang_Float_toString__float_b47
pulsec_pulse_lang_Float_toString__float_b45:
    mov eax, 46
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_45_56_0_done:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b49
pulsec_pulse_lang_Float_toString__float_b46:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+160], eax
    jmp pulsec_pulse_lang_Float_toString__float_b48
pulsec_pulse_lang_Float_toString__float_b47:
    jmp pulsec_pulse_lang_Float_toString__float_b48
pulsec_pulse_lang_Float_toString__float_b48:
    mov eax, dword ptr [rsp+160]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_48_54_0_done:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+504], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+504]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b43
pulsec_pulse_lang_Float_toString__float_b49:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+512], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+512]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_58_219
    mov eax, 0
    jmp Float_toString_ternary_done_58_219
Float_toString_ternary_then_58_219:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+520], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+520]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+528], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+528]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_58_219:
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b50
    jmp pulsec_pulse_lang_Float_toString__float_b51
pulsec_pulse_lang_Float_toString__float_b50:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+536], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+536]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b49
pulsec_pulse_lang_Float_toString__float_b51:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+544], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+544]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b52
    jmp pulsec_pulse_lang_Float_toString__float_b53
pulsec_pulse_lang_Float_toString__float_b52:
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_52_61_0_done:
    jmp pulsec_pulse_lang_Float_toString__float_b54
pulsec_pulse_lang_Float_toString__float_b53:
    mov eax, dword ptr [rsp+184]
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b55
pulsec_pulse_lang_Float_toString__float_b54:
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd66_249_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd66_249_done
Float_toString_vd66_249_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd66_249_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b55:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+552], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+552]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b56
    jmp pulsec_pulse_lang_Float_toString__float_b57
pulsec_pulse_lang_Float_toString__float_b56:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_56_64_0_done:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+560], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+560]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b55
pulsec_pulse_lang_Float_toString__float_b57:
    jmp pulsec_pulse_lang_Float_toString__float_b54
pulsec_pulse_lang_Float_toString__float_b58:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+576], eax
    mov eax, 0
    mov dword ptr [rsp+568], eax
    mov eax, dword ptr [rsp+184]
    mov edx, eax
    mov eax, dword ptr [rsp+568]
    sub eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+576]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b59
    jmp pulsec_pulse_lang_Float_toString__float_b60
pulsec_pulse_lang_Float_toString__float_b59:
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_59_71_0_done:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+584], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+584]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b58
pulsec_pulse_lang_Float_toString__float_b60:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b61
pulsec_pulse_lang_Float_toString__float_b61:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+592], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+592]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_74_286
    mov eax, 0
    jmp Float_toString_ternary_done_74_286
Float_toString_ternary_then_74_286:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+600], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+600]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+608], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+608]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_74_286:
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b62
    jmp pulsec_pulse_lang_Float_toString__float_b63
pulsec_pulse_lang_Float_toString__float_b62:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+616], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+616]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b61
pulsec_pulse_lang_Float_toString__float_b63:
    mov eax, 0
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b64
pulsec_pulse_lang_Float_toString__float_b64:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+624], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+624]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b65
    jmp pulsec_pulse_lang_Float_toString__float_b66
pulsec_pulse_lang_Float_toString__float_b65:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_65_78_0_done:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+632], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+632]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b64
pulsec_pulse_lang_Float_toString__float_b66:
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd80_309_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd80_309_done
Float_toString_vd80_309_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd80_309_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b67:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+640], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+640]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Float_toString_ternary_then_84_334
    mov eax, 0
    jmp Float_toString_ternary_done_84_334
Float_toString_ternary_then_84_334:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+744], rax
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+648], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+648]
    sub eax, edx
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+744]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+656], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+656]
    cmp eax, edx
    sete al
    movzx eax, al
Float_toString_ternary_done_84_334:
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b68
    jmp pulsec_pulse_lang_Float_toString__float_b69
pulsec_pulse_lang_Float_toString__float_b68:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+664], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+664]
    sub eax, edx
    mov dword ptr [rsp+192], eax
    jmp pulsec_pulse_lang_Float_toString__float_b67
pulsec_pulse_lang_Float_toString__float_b69:
    mov eax, dword ptr [rsp+192]
    mov dword ptr [rsp+672], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+672]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b70
    jmp pulsec_pulse_lang_Float_toString__float_b71
pulsec_pulse_lang_Float_toString__float_b70:
    mov eax, 48
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_70_87_0_done:
    jmp pulsec_pulse_lang_Float_toString__float_b72
pulsec_pulse_lang_Float_toString__float_b71:
    mov eax, 1
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b73
pulsec_pulse_lang_Float_toString__float_b72:
    mov eax, 69
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_92_0_done:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+696]
    mov rdx, rax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_72_93_1_done:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+696]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+744], rax
    mov rcx, qword ptr [rsp+744]
    test rcx, rcx
    je Float_toString_vd94_375_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Float_toString_vd94_375_done
Float_toString_vd94_375_null:
    call pulsec_rt_dispatchNullReceiverPanic
Float_toString_vd94_375_done:
    jmp pulsec_pulse_lang_Float_toString__float_epilogue
pulsec_pulse_lang_Float_toString__float_b73:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+680], eax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+680]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_toString__float_b74
    jmp pulsec_pulse_lang_Float_toString__float_b75
pulsec_pulse_lang_Float_toString__float_b74:
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+784], rax
    mov eax, dword ptr [rsp+152]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov rcx, qword ptr [rsp+784]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+736]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+696], rax
    mov eax, dword ptr [rsp+696]
    mov edx, eax
    mov qword ptr [rsp+752], rdx
    mov qword ptr [rsp+760], r8
    mov qword ptr [rsp+768], r9
    mov rax, qword ptr [rsp+696]
    mov qword ptr [rsp+792], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+792]
    mov qword ptr [rsp+696], rax
    mov rax, qword ptr [rsp+736]
    mov rcx, rax
    mov rdx, qword ptr [rsp+752]
    mov r8, qword ptr [rsp+760]
    mov r9, qword ptr [rsp+768]
    test rcx, rcx
    je pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done
pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Float_toString__float_vd_stmt_74_90_0_done:
    mov eax, dword ptr [rsp+152]
    mov dword ptr [rsp+688], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+688]
    add eax, edx
    mov dword ptr [rsp+152], eax
    jmp pulsec_pulse_lang_Float_toString__float_b73
pulsec_pulse_lang_Float_toString__float_b75:
    jmp pulsec_pulse_lang_Float_toString__float_b72
pulsec_pulse_lang_Float_toString__float_epilogue:
    mov qword ptr [rsp+736], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+736]
pulsec_pulse_lang_Float_toString__float_epilogue_post:
    mov qword ptr [rsp+736], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+736]
    add rsp, 904
    ret
pulsec_pulse_lang_Float_toString__float endp

pulsec_pulse_lang_Float_buildMinValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Float_buildMinValue_b0:
    mov eax, 1068719552
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Float_buildMinValue_b1
pulsec_pulse_lang_Float_buildMinValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_buildMinValue_b2
    jmp pulsec_pulse_lang_Float_buildMinValue_b3
pulsec_pulse_lang_Float_buildMinValue_b2:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov eax, 1092616192
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    divsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Float_buildMinValue_b1
pulsec_pulse_lang_Float_buildMinValue_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_buildMinValue_epilogue
pulsec_pulse_lang_Float_buildMinValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_Float_buildMinValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Float_buildMinValue endp

pulsec_pulse_lang_Float_buildMaxValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Float_buildMaxValue_b0:
    mov eax, 1079625692
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Float_buildMaxValue_b1
pulsec_pulse_lang_Float_buildMaxValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 38
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Float_buildMaxValue_b2
    jmp pulsec_pulse_lang_Float_buildMaxValue_b3
pulsec_pulse_lang_Float_buildMaxValue_b2:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov eax, 1092616192
    movd xmm0, eax
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    mulsd xmm0, xmm1
    cvtsd2ss xmm0, xmm0
    cvtss2sd xmm0, xmm0
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Float_buildMaxValue_b1
pulsec_pulse_lang_Float_buildMaxValue_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Float_buildMaxValue_epilogue
pulsec_pulse_lang_Float_buildMaxValue_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_Float_buildMaxValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Float_buildMaxValue endp

pulsec_fget_pulse_lang_Float_MIN_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Float_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_Float_MIN_VALUE endp

pulsec_fset_pulse_lang_Float_MIN_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Float_MIN_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Float_MIN_VALUE endp


pulsec_fget_pulse_lang_Float_MAX_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Float_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_Float_MAX_VALUE endp

pulsec_fset_pulse_lang_Float_MAX_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Float_MAX_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Float_MAX_VALUE endp


end
