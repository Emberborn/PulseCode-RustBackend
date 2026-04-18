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
extrn pulsec_rt_fpToInt:proc
extrn pulsec_rt_fpToLong:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_Integer_toString__int:proc
extrn pulsec_pulse_lang_Long_toString__long:proc
extrn pulsec_pulse_lang_NumberFormatException_NumberFormatException__String:proc
extrn pulsec_pulse_lang_StringBuilder_StringBuilder:proc
extrn pulsec_pulse_lang_StringBuilder_append__String:proc
extrn pulsec_pulse_lang_StringBuilder_append__char:proc
extrn pulsec_pulse_lang_StringBuilder_toString:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_Throwable_panic:proc
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

public pulsec_fld_pulse_lang_Double_MIN_VALUE
public pulsec_fget_pulse_lang_Double_MIN_VALUE
public pulsec_fset_pulse_lang_Double_MIN_VALUE
public pulsec_fld_pulse_lang_Double_MAX_VALUE
public pulsec_fget_pulse_lang_Double_MAX_VALUE
public pulsec_fset_pulse_lang_Double_MAX_VALUE

.data
written dq 0
pulsec_objc_pulse_lang_Double dd 0
pulsec_fld_pulse_lang_Double_MIN_VALUE dq 0
pulsec_fld_pulse_lang_Double_MAX_VALUE dq 0
trace_m0 db "pulse.lang.Double.valueOf"
trace_m0_len equ 25
trace_m1 db "pulse.lang.Double.parse"
trace_m1_len equ 23
trace_m2 db "pulse.lang.Double.doubleValue"
trace_m2_len equ 29
trace_m3 db "pulse.lang.Double.equals"
trace_m3_len equ 24
trace_m4 db "pulse.lang.Double.compare"
trace_m4_len equ 25
trace_m5 db "pulse.lang.Double.toString"
trace_m5_len equ 26
trace_m6 db "pulse.lang.Double.parsePrimitive"
trace_m6_len equ 32
trace_m7 db "pulse.lang.Double.formatFiniteWithSign"
trace_m7_len equ 38
trace_m8 db "pulse.lang.Double.formatFixedDigits"
trace_m8_len equ 35
trace_m9 db "pulse.lang.Double.formatScientificDigits"
trace_m9_len equ 40
trace_m10 db "pulse.lang.Double.lastNonZeroIndex"
trace_m10_len equ 34
trace_m11 db "pulse.lang.Double.matchesNaN"
trace_m11_len equ 28
trace_m12 db "pulse.lang.Double.matchesInfinity"
trace_m12_len equ 33
trace_m13 db "pulse.lang.Double.isDigit"
trace_m13_len equ 25
trace_m14 db "pulse.lang.Double.isNaN"
trace_m14_len equ 23
trace_m15 db "pulse.lang.Double.isInfinite"
trace_m15_len equ 28
trace_m16 db "pulse.lang.Double.isNegativeZero"
trace_m16_len equ 32
trace_m17 db "pulse.lang.Double.buildMinValue"
trace_m17_len equ 31
trace_m18 db "pulse.lang.Double.buildMaxValue"
trace_m18_len equ 31
trace_m19 db "pulse.lang.Double.invalidLiteral"
trace_m19_len equ 32
msg0 db "NaN"
msg0_len equ 3
msg1 db "-Infinity"
msg1_len equ 9
msg2 db "Infinity"
msg2_len equ 8
msg3 db "-0.0"
msg3_len equ 4
msg4 db "0.0"
msg4_len equ 3
msg5 db "-"
msg5_len equ 1
msg6 db ".0"
msg6_len equ 2
msg7 db ".0"
msg7_len equ 2
msg8 db "Invalid floating literal"
msg8_len equ 24

.code
pulsec_pulse_lang_Double_valueOf__double proc
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
pulsec_pulse_lang_Double_valueOf__double_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Double_valueOf__double_epilogue
pulsec_pulse_lang_Double_valueOf__double_epilogue:
pulsec_pulse_lang_Double_valueOf__double_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Double_valueOf__double endp

pulsec_pulse_lang_Double_parse__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Double_parse__String_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Double_parsePrimitive__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Double_valueOf__double
    jmp pulsec_pulse_lang_Double_parse__String_epilogue
pulsec_pulse_lang_Double_parse__String_epilogue:
pulsec_pulse_lang_Double_parse__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_Double_parse__String endp

pulsec_pulse_lang_Double_doubleValue__Double proc
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
pulsec_pulse_lang_Double_doubleValue__Double_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Double_doubleValue__Double_epilogue
pulsec_pulse_lang_Double_doubleValue__Double_epilogue:
pulsec_pulse_lang_Double_doubleValue__Double_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Double_doubleValue__Double endp

pulsec_pulse_lang_Double_equals__double_double proc
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
pulsec_pulse_lang_Double_equals__double_double_b0:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    ucomisd xmm0, xmm1
    jp Double_equals_fp_cmp_0_2_unordered
    sete al
    jmp Double_equals_fp_cmp_0_2_done
Double_equals_fp_cmp_0_2_unordered:
    xor eax, eax
Double_equals_fp_cmp_0_2_done:
    movzx eax, al
    jmp pulsec_pulse_lang_Double_equals__double_double_epilogue
pulsec_pulse_lang_Double_equals__double_double_epilogue:
pulsec_pulse_lang_Double_equals__double_double_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Double_equals__double_double endp

pulsec_pulse_lang_Double_compare__double_double proc
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
pulsec_pulse_lang_Double_compare__double_double_b0:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+96], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+96]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_0_2_unordered
    setb al
    jmp Double_compare_fp_cmp_0_2_done
Double_compare_fp_cmp_0_2_unordered:
    xor eax, eax
Double_compare_fp_cmp_0_2_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_compare__double_double_b1
    jmp pulsec_pulse_lang_Double_compare__double_double_b2
pulsec_pulse_lang_Double_compare__double_double_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_b2:
    jmp pulsec_pulse_lang_Double_compare__double_double_b3
pulsec_pulse_lang_Double_compare__double_double_b3:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+104], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+104]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_2_7_unordered
    seta al
    jmp Double_compare_fp_cmp_2_7_done
Double_compare_fp_cmp_2_7_unordered:
    xor eax, eax
Double_compare_fp_cmp_2_7_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_compare__double_double_b4
    jmp pulsec_pulse_lang_Double_compare__double_double_b5
pulsec_pulse_lang_Double_compare__double_double_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_b5:
    jmp pulsec_pulse_lang_Double_compare__double_double_b6
pulsec_pulse_lang_Double_compare__double_double_b6:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+112], xmm0
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+112]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_4_11_unordered
    sete al
    jmp Double_compare_fp_cmp_4_11_done
Double_compare_fp_cmp_4_11_unordered:
    xor eax, eax
Double_compare_fp_cmp_4_11_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_compare__double_double_b7
    jmp pulsec_pulse_lang_Double_compare__double_double_b8
pulsec_pulse_lang_Double_compare__double_double_b7:
    mov eax, 0
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_b8:
    jmp pulsec_pulse_lang_Double_compare__double_double_b9
pulsec_pulse_lang_Double_compare__double_double_b9:
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movq qword ptr [rsp+120], xmm0
    mov rax, qword ptr [rsp+80]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+120]
    ucomisd xmm0, xmm1
    jp Double_compare_fp_cmp_6_15_unordered
    setne al
    jmp Double_compare_fp_cmp_6_15_done
Double_compare_fp_cmp_6_15_unordered:
    mov al, 1
Double_compare_fp_cmp_6_15_done:
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
    jp Double_compare_fp_cmp_7_18_unordered
    setne al
    jmp Double_compare_fp_cmp_7_18_done
Double_compare_fp_cmp_7_18_unordered:
    mov al, 1
Double_compare_fp_cmp_7_18_done:
    movzx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Double_compare_ternary_then_8_22
    mov eax, 0
    jmp Double_compare_ternary_done_8_22
Double_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Double_compare_ternary_done_8_22:
    test eax, eax
    jne pulsec_pulse_lang_Double_compare__double_double_b10
    jmp pulsec_pulse_lang_Double_compare__double_double_b11
pulsec_pulse_lang_Double_compare__double_double_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_b11:
    jmp pulsec_pulse_lang_Double_compare__double_double_b12
pulsec_pulse_lang_Double_compare__double_double_b12:
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Double_compare__double_double_b13
    jmp pulsec_pulse_lang_Double_compare__double_double_b14
pulsec_pulse_lang_Double_compare__double_double_b13:
    mov eax, 1
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_b14:
    jmp pulsec_pulse_lang_Double_compare__double_double_b15
pulsec_pulse_lang_Double_compare__double_double_b15:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Double_compare__double_double_epilogue
pulsec_pulse_lang_Double_compare__double_double_epilogue:
pulsec_pulse_lang_Double_compare__double_double_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 264
    ret
pulsec_pulse_lang_Double_compare__double_double endp

pulsec_pulse_lang_Double_toString__double proc
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
    mov qword ptr [rsp+128], rcx
    mov qword ptr [rsp+120], 0
    mov qword ptr [rsp+112], 0
    mov qword ptr [rsp+104], 0
pulsec_pulse_lang_Double_toString__double_b0:
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_pulse_lang_Double_isNaN__double
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b1
    jmp pulsec_pulse_lang_Double_toString__double_b2
pulsec_pulse_lang_Double_toString__double_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b2:
    jmp pulsec_pulse_lang_Double_toString__double_b3
pulsec_pulse_lang_Double_toString__double_b3:
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_pulse_lang_Double_isInfinite__double
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b4
    jmp pulsec_pulse_lang_Double_toString__double_b5
pulsec_pulse_lang_Double_toString__double_b4:
    mov rax, qword ptr [rsp+128]
    movq xmm0, rax
    movq qword ptr [rsp+136], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+136]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_3_11_unordered
    setb al
    jmp Double_toString_fp_cmp_3_11_done
Double_toString_fp_cmp_3_11_unordered:
    xor eax, eax
Double_toString_fp_cmp_3_11_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b7
    jmp pulsec_pulse_lang_Double_toString__double_b8
pulsec_pulse_lang_Double_toString__double_b5:
    jmp pulsec_pulse_lang_Double_toString__double_b6
pulsec_pulse_lang_Double_toString__double_b6:
    mov rax, qword ptr [rsp+128]
    movq xmm0, rax
    movq qword ptr [rsp+144], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+144]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_6_16_unordered
    sete al
    jmp Double_toString_fp_cmp_6_16_done
Double_toString_fp_cmp_6_16_unordered:
    xor eax, eax
Double_toString_fp_cmp_6_16_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b10
    jmp pulsec_pulse_lang_Double_toString__double_b11
pulsec_pulse_lang_Double_toString__double_b7:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b8:
    jmp pulsec_pulse_lang_Double_toString__double_b9
pulsec_pulse_lang_Double_toString__double_b9:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b10:
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_pulse_lang_Double_isNegativeZero__double
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b13
    jmp pulsec_pulse_lang_Double_toString__double_b14
pulsec_pulse_lang_Double_toString__double_b11:
    jmp pulsec_pulse_lang_Double_toString__double_b12
pulsec_pulse_lang_Double_toString__double_b12:
    mov rax, qword ptr [rsp+128]
    movq xmm0, rax
    movq qword ptr [rsp+152], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+152]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_10_25_unordered
    setb al
    jmp Double_toString_fp_cmp_10_25_done
Double_toString_fp_cmp_10_25_unordered:
    xor eax, eax
Double_toString_fp_cmp_10_25_done:
    movzx eax, al
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b16
    jmp pulsec_pulse_lang_Double_toString__double_b17
pulsec_pulse_lang_Double_toString__double_b13:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b14:
    jmp pulsec_pulse_lang_Double_toString__double_b15
pulsec_pulse_lang_Double_toString__double_b15:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b16:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+160], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+160]
    subsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_Double_toString__double_b18
pulsec_pulse_lang_Double_toString__double_b17:
    jmp pulsec_pulse_lang_Double_toString__double_b18
pulsec_pulse_lang_Double_toString__double_b18:
    mov eax, 0
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+88], rax
    jmp pulsec_pulse_lang_Double_toString__double_b19
pulsec_pulse_lang_Double_toString__double_b19:
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+168], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+168]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_16_36_unordered
    setae al
    jmp Double_toString_fp_cmp_16_36_done
Double_toString_fp_cmp_16_36_unordered:
    xor eax, eax
Double_toString_fp_cmp_16_36_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b20
    jmp pulsec_pulse_lang_Double_toString__double_b21
pulsec_pulse_lang_Double_toString__double_b20:
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+176], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+176]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Double_toString__double_b19
pulsec_pulse_lang_Double_toString__double_b21:
    jmp pulsec_pulse_lang_Double_toString__double_b22
pulsec_pulse_lang_Double_toString__double_b22:
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+192], xmm0
    mov rax, 4607182418800017408
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+192]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_19_47_unordered
    setb al
    jmp Double_toString_fp_cmp_19_47_done
Double_toString_fp_cmp_19_47_unordered:
    xor eax, eax
Double_toString_fp_cmp_19_47_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b23
    jmp pulsec_pulse_lang_Double_toString__double_b24
pulsec_pulse_lang_Double_toString__double_b23:
    mov rax, qword ptr [rsp+88]
    movq xmm0, rax
    movq qword ptr [rsp+200], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+200]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+208], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Double_toString__double_b22
pulsec_pulse_lang_Double_toString__double_b24:
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_fpToLong
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+216], xmm0
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+216]
    ucomisd xmm0, xmm1
    jp Double_toString_fp_cmp_23_62_unordered
    sete al
    jmp Double_toString_fp_cmp_23_62_done
Double_toString_fp_cmp_23_62_unordered:
    xor eax, eax
Double_toString_fp_cmp_23_62_done:
    movzx eax, al
    test rax, rax
    jne Double_toString_ternary_then_23_67
    mov eax, 0
    jmp Double_toString_ternary_done_23_67
Double_toString_ternary_then_23_67:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+224], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    cmp eax, edx
    setge al
    movzx eax, al
Double_toString_ternary_done_23_67:
    test rax, rax
    jne Double_toString_ternary_then_23_71
    mov eax, 0
    jmp Double_toString_ternary_done_23_71
Double_toString_ternary_then_23_71:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+232], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setl al
    movzx eax, al
Double_toString_ternary_done_23_71:
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b25
    jmp pulsec_pulse_lang_Double_toString__double_b26
pulsec_pulse_lang_Double_toString__double_b25:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_pulse_lang_Long_toString__long
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_Double_toString__double_b28
    jmp pulsec_pulse_lang_Double_toString__double_b29
pulsec_pulse_lang_Double_toString__double_b26:
    jmp pulsec_pulse_lang_Double_toString__double_b27
pulsec_pulse_lang_Double_toString__double_b27:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+344], rax
    mov eax, 16
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+240]
    mov ecx, eax
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov eax, dword ptr [rsp+256]
    mov r8d, eax
    call pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b28:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+240]
    mov rax, qword ptr [rsp+240]
    mov rdx, rax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+288], rax
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+240]
    mov rax, qword ptr [rsp+240]
    mov rdx, rax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+280]
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_b29:
    jmp pulsec_pulse_lang_Double_toString__double_b30
pulsec_pulse_lang_Double_toString__double_b30:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+288], rax
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+240], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+240]
    mov rax, qword ptr [rsp+240]
    mov rdx, rax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+240]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+280]
    jmp pulsec_pulse_lang_Double_toString__double_epilogue
pulsec_pulse_lang_Double_toString__double_epilogue:
pulsec_pulse_lang_Double_toString__double_epilogue_post:
    mov qword ptr [rsp+280], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+280]
    add rsp, 408
    ret
pulsec_pulse_lang_Double_toString__double endp

pulsec_pulse_lang_Double_parsePrimitive__String proc
    sub rsp, 792
    mov qword ptr [rsp+760], rcx
    mov qword ptr [rsp+768], rdx
    mov qword ptr [rsp+776], r8
    mov qword ptr [rsp+784], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+760]
    mov rdx, qword ptr [rsp+768]
    mov r8, qword ptr [rsp+776]
    mov r9, qword ptr [rsp+784]
    mov qword ptr [rsp+152], rcx
pulsec_pulse_lang_Double_parsePrimitive__String_b0:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+160], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+160]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b1
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b2
pulsec_pulse_lang_Double_parsePrimitive__String_b1:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b3
pulsec_pulse_lang_Double_parsePrimitive__String_b2:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b3
pulsec_pulse_lang_Double_parsePrimitive__String_b3:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b4
pulsec_pulse_lang_Double_parsePrimitive__String_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b5
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b6
pulsec_pulse_lang_Double_parsePrimitive__String_b5:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+176], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_6_24
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_6_24
Double_parsePrimitive_ternary_then_6_24:
    mov eax, 1
Double_parsePrimitive_ternary_done_6_24:
    test rax, rax
    jne Double_parsePrimitive_ternary_then_6_28
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+192], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_6_28
Double_parsePrimitive_ternary_then_6_28:
    mov eax, 1
Double_parsePrimitive_ternary_done_6_28:
    test rax, rax
    jne Double_parsePrimitive_ternary_then_6_32
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+200], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_6_32
Double_parsePrimitive_ternary_then_6_32:
    mov eax, 1
Double_parsePrimitive_ternary_done_6_32:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b7
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b8
pulsec_pulse_lang_Double_parsePrimitive__String_b6:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b10
pulsec_pulse_lang_Double_parsePrimitive__String_b7:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+208], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b9
pulsec_pulse_lang_Double_parsePrimitive__String_b8:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b6
pulsec_pulse_lang_Double_parsePrimitive__String_b9:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b4
pulsec_pulse_lang_Double_parsePrimitive__String_b10:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+216], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b11
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b12
pulsec_pulse_lang_Double_parsePrimitive__String_b11:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+232], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_11_53
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+240], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_11_53
Double_parsePrimitive_ternary_then_11_53:
    mov eax, 1
Double_parsePrimitive_ternary_done_11_53:
    test rax, rax
    jne Double_parsePrimitive_ternary_then_11_57
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+248], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_11_57
Double_parsePrimitive_ternary_then_11_57:
    mov eax, 1
Double_parsePrimitive_ternary_done_11_57:
    test rax, rax
    jne Double_parsePrimitive_ternary_then_11_61
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+256], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_11_61
Double_parsePrimitive_ternary_then_11_61:
    mov eax, 1
Double_parsePrimitive_ternary_done_11_61:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b13
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b14
pulsec_pulse_lang_Double_parsePrimitive__String_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+272], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b16
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b17
pulsec_pulse_lang_Double_parsePrimitive__String_b13:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+264], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b15
pulsec_pulse_lang_Double_parsePrimitive__String_b14:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b12
pulsec_pulse_lang_Double_parsePrimitive__String_b15:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b10
pulsec_pulse_lang_Double_parsePrimitive__String_b16:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b18
pulsec_pulse_lang_Double_parsePrimitive__String_b17:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b18
pulsec_pulse_lang_Double_parsePrimitive__String_b18:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov qword ptr [rsp+624], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+624]
    mov rax, qword ptr [rsp+624]
    mov qword ptr [rsp+720], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+720]
    mov qword ptr [rsp+624], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+632], rax
    mov rax, qword ptr [rsp+624]
    mov qword ptr [rsp+720], rax
    mov rax, qword ptr [rsp+632]
    mov qword ptr [rsp+728], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+720]
    mov qword ptr [rsp+624], rax
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+632], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+640], rax
    mov rax, qword ptr [rsp+624]
    mov rcx, rax
    mov eax, dword ptr [rsp+632]
    mov edx, eax
    mov eax, dword ptr [rsp+640]
    mov r8d, eax
    call pulsec_pulse_lang_Double_matchesNaN__String_int_int
    mov eax, eax
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+624]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+664]
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b19
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b20
pulsec_pulse_lang_Double_parsePrimitive__String_b19:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+280], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+280]
    divsd xmm0, xmm1
    movq rax, xmm0
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_epilogue
pulsec_pulse_lang_Double_parsePrimitive__String_b20:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b21
pulsec_pulse_lang_Double_parsePrimitive__String_b21:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+288], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+288]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_21_94
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+296], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+296]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_21_94
Double_parsePrimitive_ternary_then_21_94:
    mov eax, 1
Double_parsePrimitive_ternary_done_21_94:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b22
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b23
pulsec_pulse_lang_Double_parsePrimitive__String_b22:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+304], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+304]
    cmp eax, edx
    sete al
    movzx eax, al
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+312], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+312]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+320], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+320]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b25
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b26
pulsec_pulse_lang_Double_parsePrimitive__String_b23:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b24
pulsec_pulse_lang_Double_parsePrimitive__String_b24:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov qword ptr [rsp+624], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+624]
    mov rax, qword ptr [rsp+624]
    mov qword ptr [rsp+720], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+720]
    mov qword ptr [rsp+624], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+632], rax
    mov rax, qword ptr [rsp+624]
    mov qword ptr [rsp+720], rax
    mov rax, qword ptr [rsp+632]
    mov qword ptr [rsp+728], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+720]
    mov qword ptr [rsp+624], rax
    mov rax, qword ptr [rsp+728]
    mov qword ptr [rsp+632], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+640], rax
    mov rax, qword ptr [rsp+624]
    mov rcx, rax
    mov eax, dword ptr [rsp+632]
    mov edx, eax
    mov eax, dword ptr [rsp+640]
    mov r8d, eax
    call pulsec_pulse_lang_Double_matchesInfinity__String_int_int
    mov eax, eax
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+624]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+664]
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b28
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b29
pulsec_pulse_lang_Double_parsePrimitive__String_b25:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b27
pulsec_pulse_lang_Double_parsePrimitive__String_b26:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b27
pulsec_pulse_lang_Double_parsePrimitive__String_b27:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b24
pulsec_pulse_lang_Double_parsePrimitive__String_b28:
    mov eax, dword ptr [rsp+96]
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b31
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b32
pulsec_pulse_lang_Double_parsePrimitive__String_b29:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b30
pulsec_pulse_lang_Double_parsePrimitive__String_b30:
    mov rax, 0
    mov qword ptr [rsp+104], rax
    mov eax, 0
    mov dword ptr [rsp+112], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b34
pulsec_pulse_lang_Double_parsePrimitive__String_b31:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+336], xmm0
    mov rax, 4607182418800017408
    movq xmm0, rax
    movq qword ptr [rsp+328], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+328]
    divsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+336]
    subsd xmm0, xmm1
    movq rax, xmm0
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_epilogue
pulsec_pulse_lang_Double_parsePrimitive__String_b32:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b33
pulsec_pulse_lang_Double_parsePrimitive__String_b33:
    mov rax, 4607182418800017408
    movq xmm0, rax
    movq qword ptr [rsp+344], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+344]
    divsd xmm0, xmm1
    movq rax, xmm0
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_epilogue
pulsec_pulse_lang_Double_parsePrimitive__String_b34:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+352]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b35
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b36
pulsec_pulse_lang_Double_parsePrimitive__String_b35:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov ecx, eax
    call pulsec_pulse_lang_Double_isDigit__char
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b37
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b38
pulsec_pulse_lang_Double_parsePrimitive__String_b36:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+392], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+392]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_39_166
    mov eax, 0
    jmp Double_parsePrimitive_ternary_done_39_166
Double_parsePrimitive_ternary_then_39_166:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+400], eax
    mov eax, 46
    mov edx, eax
    mov eax, dword ptr [rsp+400]
    cmp eax, edx
    sete al
    movzx eax, al
Double_parsePrimitive_ternary_done_39_166:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b40
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b41
pulsec_pulse_lang_Double_parsePrimitive__String_b37:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b36
pulsec_pulse_lang_Double_parsePrimitive__String_b38:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b39
pulsec_pulse_lang_Double_parsePrimitive__String_b39:
    mov rax, qword ptr [rsp+104]
    movq xmm0, rax
    movq qword ptr [rsp+360], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+360]
    mulsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+376], xmm0
    mov eax, dword ptr [rsp+80]
    movzx eax, ax
    mov dword ptr [rsp+368], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+368]
    sub eax, edx
    movsxd rax, eax
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+376]
    addsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+384], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+384]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov dword ptr [rsp+112], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b34
pulsec_pulse_lang_Double_parsePrimitive__String_b40:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+408], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+408]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov rax, 4591870180066957722
    mov qword ptr [rsp+120], rax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b43
pulsec_pulse_lang_Double_parsePrimitive__String_b41:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b42
pulsec_pulse_lang_Double_parsePrimitive__String_b42:
    mov eax, dword ptr [rsp+112]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b49
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b50
pulsec_pulse_lang_Double_parsePrimitive__String_b43:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+416], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+416]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b44
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b45
pulsec_pulse_lang_Double_parsePrimitive__String_b44:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov ecx, eax
    call pulsec_pulse_lang_Double_isDigit__char
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b46
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b47
pulsec_pulse_lang_Double_parsePrimitive__String_b45:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b42
pulsec_pulse_lang_Double_parsePrimitive__String_b46:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b45
pulsec_pulse_lang_Double_parsePrimitive__String_b47:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b48
pulsec_pulse_lang_Double_parsePrimitive__String_b48:
    mov rax, qword ptr [rsp+104]
    movq xmm0, rax
    movq qword ptr [rsp+440], xmm0
    mov eax, dword ptr [rsp+80]
    movzx eax, ax
    mov dword ptr [rsp+424], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+424]
    sub eax, edx
    movsxd rax, eax
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+432], xmm0
    mov rax, qword ptr [rsp+120]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+432]
    mulsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+440]
    addsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+120]
    movq xmm0, rax
    movq qword ptr [rsp+448], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+448]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+456], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+456]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov dword ptr [rsp+112], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b43
pulsec_pulse_lang_Double_parsePrimitive__String_b49:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b51
pulsec_pulse_lang_Double_parsePrimitive__String_b50:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b51
pulsec_pulse_lang_Double_parsePrimitive__String_b51:
    mov eax, 0
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+464], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+464]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b52
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b53
pulsec_pulse_lang_Double_parsePrimitive__String_b52:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+472], eax
    mov eax, 101
    mov edx, eax
    mov eax, dword ptr [rsp+472]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_56_228
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+480], eax
    mov eax, 69
    mov edx, eax
    mov eax, dword ptr [rsp+480]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_56_228
Double_parsePrimitive_ternary_then_56_228:
    mov eax, 1
Double_parsePrimitive_ternary_done_56_228:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b55
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b56
pulsec_pulse_lang_Double_parsePrimitive__String_b53:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b54
pulsec_pulse_lang_Double_parsePrimitive__String_b54:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+576], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+576]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b73
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b74
pulsec_pulse_lang_Double_parsePrimitive__String_b55:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+488], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+488]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+496], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+496]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b58
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b59
pulsec_pulse_lang_Double_parsePrimitive__String_b56:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b57
pulsec_pulse_lang_Double_parsePrimitive__String_b57:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b54
pulsec_pulse_lang_Double_parsePrimitive__String_b58:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b60
pulsec_pulse_lang_Double_parsePrimitive__String_b59:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b60
pulsec_pulse_lang_Double_parsePrimitive__String_b60:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+504], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+504]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_parsePrimitive_ternary_then_61_251
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+512], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+512]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp Double_parsePrimitive_ternary_done_61_251
Double_parsePrimitive_ternary_then_61_251:
    mov eax, 1
Double_parsePrimitive_ternary_done_61_251:
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b61
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b62
pulsec_pulse_lang_Double_parsePrimitive__String_b61:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+520], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+520]
    cmp eax, edx
    sete al
    movzx eax, al
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+528], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+528]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b63
pulsec_pulse_lang_Double_parsePrimitive__String_b62:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b63
pulsec_pulse_lang_Double_parsePrimitive__String_b63:
    mov eax, 0
    mov dword ptr [rsp+144], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b64
pulsec_pulse_lang_Double_parsePrimitive__String_b64:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+536], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+536]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b65
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b66
pulsec_pulse_lang_Double_parsePrimitive__String_b65:
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+672], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov edx, eax
    mov rcx, qword ptr [rsp+672]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+664], rax
    mov rax, qword ptr [rsp+664]
    mov eax, eax
    mov qword ptr [rsp+624], rax
    mov eax, dword ptr [rsp+624]
    mov ecx, eax
    call pulsec_pulse_lang_Double_isDigit__char
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b67
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b68
pulsec_pulse_lang_Double_parsePrimitive__String_b66:
    mov eax, dword ptr [rsp+144]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b70
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b71
pulsec_pulse_lang_Double_parsePrimitive__String_b67:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b66
pulsec_pulse_lang_Double_parsePrimitive__String_b68:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b69
pulsec_pulse_lang_Double_parsePrimitive__String_b69:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+544], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+544]
    imul eax, edx
    mov dword ptr [rsp+560], eax
    mov eax, dword ptr [rsp+80]
    movzx eax, ax
    mov dword ptr [rsp+552], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+552]
    sub eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+560]
    add eax, edx
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+568], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+568]
    add eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov dword ptr [rsp+144], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b64
pulsec_pulse_lang_Double_parsePrimitive__String_b70:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b72
pulsec_pulse_lang_Double_parsePrimitive__String_b71:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b72
pulsec_pulse_lang_Double_parsePrimitive__String_b72:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b57
pulsec_pulse_lang_Double_parsePrimitive__String_b73:
    call pulsec_pulse_lang_Double_invalidLiteral
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b75
pulsec_pulse_lang_Double_parsePrimitive__String_b74:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b75
pulsec_pulse_lang_Double_parsePrimitive__String_b75:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b76
pulsec_pulse_lang_Double_parsePrimitive__String_b76:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+584], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+584]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b77
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b78
pulsec_pulse_lang_Double_parsePrimitive__String_b77:
    mov eax, dword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b79
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b80
pulsec_pulse_lang_Double_parsePrimitive__String_b78:
    mov eax, dword ptr [rsp+96]
    test eax, eax
    jne pulsec_pulse_lang_Double_parsePrimitive__String_b82
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b83
pulsec_pulse_lang_Double_parsePrimitive__String_b79:
    mov rax, qword ptr [rsp+104]
    movq xmm0, rax
    movq qword ptr [rsp+592], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+592]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+104], rax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b81
pulsec_pulse_lang_Double_parsePrimitive__String_b80:
    mov rax, qword ptr [rsp+104]
    movq xmm0, rax
    movq qword ptr [rsp+600], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+600]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+104], rax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b81
pulsec_pulse_lang_Double_parsePrimitive__String_b81:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+608], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+608]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b76
pulsec_pulse_lang_Double_parsePrimitive__String_b82:
    mov rax, 0
    movq xmm0, rax
    movq qword ptr [rsp+616], xmm0
    mov rax, qword ptr [rsp+104]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+616]
    subsd xmm0, xmm1
    movq rax, xmm0
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_epilogue
pulsec_pulse_lang_Double_parsePrimitive__String_b83:
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_b84
pulsec_pulse_lang_Double_parsePrimitive__String_b84:
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_lang_Double_parsePrimitive__String_epilogue
pulsec_pulse_lang_Double_parsePrimitive__String_epilogue:
pulsec_pulse_lang_Double_parsePrimitive__String_epilogue_post:
    mov qword ptr [rsp+664], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+664]
    add rsp, 792
    ret
pulsec_pulse_lang_Double_parsePrimitive__String endp

pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+112], ecx
    mov qword ptr [rsp+120], rdx
    mov dword ptr [rsp+128], r8d
    mov qword ptr [rsp+104], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b1
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b1:
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movq qword ptr [rsp+136], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+136]
    ucomisd xmm0, xmm1
    jp Double_formatFiniteWithSign_fp_cmp_2_4_unordered
    setae al
    jmp Double_formatFiniteWithSign_fp_cmp_2_4_done
Double_formatFiniteWithSign_fp_cmp_2_4_unordered:
    xor eax, eax
Double_formatFiniteWithSign_fp_cmp_2_4_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b2
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b3
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b2:
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movq qword ptr [rsp+144], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+144]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b1
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b3:
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b4
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b4:
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movq qword ptr [rsp+160], xmm0
    mov rax, 4607182418800017408
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+160]
    ucomisd xmm0, xmm1
    jp Double_formatFiniteWithSign_fp_cmp_5_15_unordered
    setb al
    jmp Double_formatFiniteWithSign_fp_cmp_5_15_done
Double_formatFiniteWithSign_fp_cmp_5_15_unordered:
    xor eax, eax
Double_formatFiniteWithSign_fp_cmp_5_15_done:
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b5
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b6
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b5:
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movq qword ptr [rsp+168], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+168]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+176], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b4
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b6:
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rax
    mov eax, 0
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b7
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b7:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b8
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b9
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b8:
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_fpToInt
    mov dword ptr [rsp+96], eax
    mov eax, 48
    movzx eax, ax
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    movzx eax, ax
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+240]
    mov edx, eax
    mov qword ptr [rsp+296], rdx
    mov qword ptr [rsp+304], r8
    mov qword ptr [rsp+312], r9
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+280]
    mov rcx, rax
    mov rdx, qword ptr [rsp+296]
    mov r8, qword ptr [rsp+304]
    mov r9, qword ptr [rsp+312]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_vd_stmt_8_12_2_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_vd_stmt_8_12_2_done
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_vd_stmt_8_12_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_vd_stmt_8_12_2_done:
    mov rax, qword ptr [rsp+72]
    movq xmm0, rax
    movq qword ptr [rsp+200], xmm0
    mov eax, dword ptr [rsp+96]
    movsxd rax, eax
    cvtsi2sd xmm0, rax
    movq rax, xmm0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+200]
    subsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+208], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+208]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+216], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b7
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b9:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    mov rcx, qword ptr [rsp+288]
    test rcx, rcx
    je Double_formatFiniteWithSign_vd15_52_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Double_formatFiniteWithSign_vd15_52_done
Double_formatFiniteWithSign_vd15_52_null:
    call pulsec_rt_dispatchNullReceiverPanic
Double_formatFiniteWithSign_vd15_52_done:
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+224], eax
    mov eax, 3
    neg eax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Double_formatFiniteWithSign_ternary_then_16_61
    mov eax, 0
    jmp Double_formatFiniteWithSign_ternary_done_16_61
Double_formatFiniteWithSign_ternary_then_16_61:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+232], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setl al
    movzx eax, al
Double_formatFiniteWithSign_ternary_done_16_61:
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b10
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b11
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b10:
    mov eax, dword ptr [rsp+112]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+248], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+248]
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+240]
    mov ecx, eax
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov eax, dword ptr [rsp+256]
    mov r8d, eax
    call pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+248]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+280]
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_epilogue
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b11:
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b12
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_b12:
    mov eax, dword ptr [rsp+112]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+248], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+248]
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+240]
    mov ecx, eax
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov eax, dword ptr [rsp+256]
    mov r8d, eax
    call pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+248]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+280]
    jmp pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_epilogue
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_epilogue:
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int_epilogue_post:
    mov qword ptr [rsp+280], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+280]
    add rsp, 408
    ret
pulsec_pulse_lang_Double_formatFiniteWithSign__boolean_double_int endp

pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int proc
    sub rsp, 456
    mov qword ptr [rsp+424], rcx
    mov qword ptr [rsp+432], rdx
    mov qword ptr [rsp+440], r8
    mov qword ptr [rsp+448], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov dword ptr [rsp+112], ecx
    mov qword ptr [rsp+120], rdx
    mov dword ptr [rsp+128], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b0:
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+112]
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b1
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b2
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b1:
    mov eax, 45
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_1_2_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_1_2_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_1_2_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_1_2_0_done:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b3
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b2:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b3
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b3:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b4
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b5
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b4:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b7
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b5:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b6
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b6:
    mov eax, 48
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_24_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_24_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_24_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_24_0_done:
    mov eax, 46
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_25_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_25_1_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_25_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_6_25_1_done:
    mov eax, 0
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b22
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b7:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b8
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b9
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b8:
    mov eax, 48
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b10
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b11
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b9:
    mov eax, 46
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_9_13_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_9_13_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_9_13_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_9_13_0_done:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_lang_Double_lastNonZeroIndex__String
    movsxd rax, eax
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b13
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b14
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b10:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b12
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b11:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b12
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b12:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_12_11_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_12_11_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_12_11_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_12_11_0_done:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+168], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b7
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b13:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b15
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b14:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b15
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b15:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b16
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b17
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b16:
    mov eax, 48
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_16_18_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_16_18_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_16_18_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_16_18_0_done:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b18
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b17:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b19
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b18:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Double_formatFixedDigits_vd23_74_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Double_formatFixedDigits_vd23_74_done
Double_formatFixedDigits_vd23_74_null:
    call pulsec_rt_dispatchNullReceiverPanic
Double_formatFixedDigits_vd23_74_done:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_epilogue
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b19:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b20
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b21
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b20:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+344]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_20_21_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_20_21_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_20_21_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_20_21_0_done:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+200], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b19
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b21:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b18
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b22:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+216], eax
    mov eax, 0
    mov dword ptr [rsp+208], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    sub eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b23
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b24
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b23:
    mov eax, 48
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_23_28_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_23_28_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_23_28_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_23_28_0_done:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b22
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b24:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+256], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+256]
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_pulse_lang_Double_lastNonZeroIndex__String
    movsxd rax, eax
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+256]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+296]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+232], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b25
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b26
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b25:
    mov eax, 48
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_25_32_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_25_32_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_25_32_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_25_32_0_done:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Double_formatFixedDigits_vd33_111_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Double_formatFixedDigits_vd33_111_done
Double_formatFixedDigits_vd33_111_null:
    call pulsec_rt_dispatchNullReceiverPanic
Double_formatFixedDigits_vd33_111_done:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_epilogue
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b26:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b27
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b27:
    mov eax, 0
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b28
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b28:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+240], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b29
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b30
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b29:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+344]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov qword ptr [rsp+312], rdx
    mov qword ptr [rsp+320], r8
    mov qword ptr [rsp+328], r9
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+296]
    mov rcx, rax
    mov rdx, qword ptr [rsp+312]
    mov r8, qword ptr [rsp+320]
    mov r9, qword ptr [rsp+328]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_29_36_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_29_36_0_done
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_29_36_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_vd_stmt_29_36_0_done:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+248], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b28
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_b30:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    test rcx, rcx
    je Double_formatFixedDigits_vd38_130_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Double_formatFixedDigits_vd38_130_done
Double_formatFixedDigits_vd38_130_null:
    call pulsec_rt_dispatchNullReceiverPanic
Double_formatFixedDigits_vd38_130_done:
    jmp pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_epilogue
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_epilogue:
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int_epilogue_post:
    mov qword ptr [rsp+296], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+296]
    add rsp, 456
    ret
pulsec_pulse_lang_Double_formatFixedDigits__boolean_String_int endp

pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov dword ptr [rsp+88], ecx
    mov qword ptr [rsp+96], rdx
    mov dword ptr [rsp+104], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b0:
    xor ecx, ecx
    call pulsec_pulse_lang_StringBuilder_StringBuilder
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+88]
    test eax, eax
    jne pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b1
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b2
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b1:
    mov eax, 45
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_1_2_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_1_2_0_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_1_2_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_1_2_0_done:
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b3
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b2:
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b3
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b3:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+224], rax
    mov eax, 0
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_3_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_3_0_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_3_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_3_0_done:
    mov eax, 46
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_4_1_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_4_1_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_4_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_3_4_1_done:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_lang_Double_lastNonZeroIndex__String
    movsxd rax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b4
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b5
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b4:
    mov eax, 48
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_4_7_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_4_7_0_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_4_7_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_4_7_0_done:
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b6
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b5:
    mov eax, 1
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b7
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b6:
    mov eax, 69
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_12_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_12_0_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_12_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_12_0_done:
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_13_1_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_13_1_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_13_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_6_13_1_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je Double_formatScientificDigits_vd14_56_null
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Double_formatScientificDigits_vd14_56_done
Double_formatScientificDigits_vd14_56_null:
    call pulsec_rt_dispatchNullReceiverPanic
Double_formatScientificDigits_vd14_56_done:
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_epilogue
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b7:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b8
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b9
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b8:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_8_10_0_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_8_10_0_done
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_8_10_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_vd_stmt_8_10_0_done:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b7
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b9:
    jmp pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_b6
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_epilogue:
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_lang_Double_formatScientificDigits__boolean_String_int endp

pulsec_pulse_lang_Double_lastNonZeroIndex__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+72], rcx
pulsec_pulse_lang_Double_lastNonZeroIndex__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_Double_lastNonZeroIndex__String_b1
pulsec_pulse_lang_Double_lastNonZeroIndex__String_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne Double_lastNonZeroIndex_ternary_then_1_15
    mov eax, 0
    jmp Double_lastNonZeroIndex_ternary_done_1_15
Double_lastNonZeroIndex_ternary_then_1_15:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
Double_lastNonZeroIndex_ternary_done_1_15:
    test eax, eax
    jne pulsec_pulse_lang_Double_lastNonZeroIndex__String_b2
    jmp pulsec_pulse_lang_Double_lastNonZeroIndex__String_b3
pulsec_pulse_lang_Double_lastNonZeroIndex__String_b2:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_Double_lastNonZeroIndex__String_b1
pulsec_pulse_lang_Double_lastNonZeroIndex__String_b3:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_Double_lastNonZeroIndex__String_epilogue
pulsec_pulse_lang_Double_lastNonZeroIndex__String_epilogue:
pulsec_pulse_lang_Double_lastNonZeroIndex__String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_lang_Double_lastNonZeroIndex__String endp

pulsec_pulse_lang_Double_matchesNaN__String_int_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_Double_matchesNaN__String_int_int_b0:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov dword ptr [rsp+96], eax
    mov eax, 3
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_matchesNaN__String_int_int_b1
    jmp pulsec_pulse_lang_Double_matchesNaN__String_int_int_b2
pulsec_pulse_lang_Double_matchesNaN__String_int_int_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_Double_matchesNaN__String_int_int_epilogue
pulsec_pulse_lang_Double_matchesNaN__String_int_int_b2:
    jmp pulsec_pulse_lang_Double_matchesNaN__String_int_int_b3
pulsec_pulse_lang_Double_matchesNaN__String_int_int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+104], eax
    mov eax, 78
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_matchesNaN_ternary_then_2_21
    mov eax, 0
    jmp Double_matchesNaN_ternary_done_2_21
Double_matchesNaN_ternary_then_2_21:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, 97
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesNaN_ternary_done_2_21:
    test rax, rax
    jne Double_matchesNaN_ternary_then_2_30
    mov eax, 0
    jmp Double_matchesNaN_ternary_done_2_30
Double_matchesNaN_ternary_then_2_30:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+136], eax
    mov eax, 78
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesNaN_ternary_done_2_30:
    jmp pulsec_pulse_lang_Double_matchesNaN__String_int_int_epilogue
pulsec_pulse_lang_Double_matchesNaN__String_int_int_epilogue:
pulsec_pulse_lang_Double_matchesNaN__String_int_int_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 312
    ret
pulsec_pulse_lang_Double_matchesNaN__String_int_int endp

pulsec_pulse_lang_Double_matchesInfinity__String_int_int proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b0:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov dword ptr [rsp+96], eax
    mov eax, 8
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b1
    jmp pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b2
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_Double_matchesInfinity__String_int_int_epilogue
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b2:
    jmp pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b3
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+104], eax
    mov eax, 73
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_21
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_21
Double_matchesInfinity_ternary_then_2_21:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, 110
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_21:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_30
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_30
Double_matchesInfinity_ternary_then_2_30:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+136], eax
    mov eax, 102
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_30:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_39
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_39
Double_matchesInfinity_ternary_then_2_39:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, 3
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+152], eax
    mov eax, 105
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_39:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_48
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_48
Double_matchesInfinity_ternary_then_2_48:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+160], eax
    mov eax, 4
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+168], eax
    mov eax, 110
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_48:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_57
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_57
Double_matchesInfinity_ternary_then_2_57:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, 5
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+184], eax
    mov eax, 105
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_57:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_66
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_66
Double_matchesInfinity_ternary_then_2_66:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+192], eax
    mov eax, 6
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+200], eax
    mov eax, 116
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_66:
    test rax, rax
    jne Double_matchesInfinity_ternary_then_2_75
    mov eax, 0
    jmp Double_matchesInfinity_ternary_done_2_75
Double_matchesInfinity_ternary_then_2_75:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+272], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+208], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    add eax, edx
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+264]
    mov eax, eax
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+224]
    mov edx, eax
    mov rcx, qword ptr [rsp+272]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+216], eax
    mov eax, 121
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    sete al
    movzx eax, al
Double_matchesInfinity_ternary_done_2_75:
    jmp pulsec_pulse_lang_Double_matchesInfinity__String_int_int_epilogue
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_epilogue:
pulsec_pulse_lang_Double_matchesInfinity__String_int_int_epilogue_post:
    mov qword ptr [rsp+264], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+264]
    add rsp, 392
    ret
pulsec_pulse_lang_Double_matchesInfinity__String_int_int endp

pulsec_pulse_lang_Double_isDigit__char proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Double_isDigit__char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    setge al
    movzx eax, al
    test rax, rax
    jne Double_isDigit_ternary_then_0_7
    mov eax, 0
    jmp Double_isDigit_ternary_done_0_7
Double_isDigit_ternary_then_0_7:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 57
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setle al
    movzx eax, al
Double_isDigit_ternary_done_0_7:
    jmp pulsec_pulse_lang_Double_isDigit__char_epilogue
pulsec_pulse_lang_Double_isDigit__char_epilogue:
pulsec_pulse_lang_Double_isDigit__char_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Double_isDigit__char endp

pulsec_pulse_lang_Double_isNaN__double proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Double_isNaN__double_b0:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+72], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+72]
    ucomisd xmm0, xmm1
    jp Double_isNaN_fp_cmp_0_2_unordered
    setne al
    jmp Double_isNaN_fp_cmp_0_2_done
Double_isNaN_fp_cmp_0_2_unordered:
    mov al, 1
Double_isNaN_fp_cmp_0_2_done:
    movzx eax, al
    jmp pulsec_pulse_lang_Double_isNaN__double_epilogue
pulsec_pulse_lang_Double_isNaN__double_epilogue:
pulsec_pulse_lang_Double_isNaN__double_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_Double_isNaN__double endp

pulsec_pulse_lang_Double_isInfinite__double proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Double_isInfinite__double_b0:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+72], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+72]
    ucomisd xmm0, xmm1
    jp Double_isInfinite_fp_cmp_0_3_unordered
    sete al
    jmp Double_isInfinite_fp_cmp_0_3_done
Double_isInfinite_fp_cmp_0_3_unordered:
    xor eax, eax
Double_isInfinite_fp_cmp_0_3_done:
    movzx eax, al
    test rax, rax
    jne Double_isInfinite_ternary_then_0_7
    mov eax, 0
    jmp Double_isInfinite_ternary_done_0_7
Double_isInfinite_ternary_then_0_7:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    ucomisd xmm0, xmm1
    jp Double_isInfinite_fp_cmp_0_6_unordered
    setne al
    jmp Double_isInfinite_fp_cmp_0_6_done
Double_isInfinite_fp_cmp_0_6_unordered:
    mov al, 1
Double_isInfinite_fp_cmp_0_6_done:
    movzx eax, al
Double_isInfinite_ternary_done_0_7:
    test rax, rax
    jne Double_isInfinite_ternary_then_0_13
    mov eax, 0
    jmp Double_isInfinite_ternary_done_0_13
Double_isInfinite_ternary_then_0_13:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 4602678819172646912
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    mulsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+96], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+96]
    ucomisd xmm0, xmm1
    jp Double_isInfinite_fp_cmp_0_12_unordered
    sete al
    jmp Double_isInfinite_fp_cmp_0_12_done
Double_isInfinite_fp_cmp_0_12_unordered:
    xor eax, eax
Double_isInfinite_fp_cmp_0_12_done:
    movzx eax, al
Double_isInfinite_ternary_done_0_13:
    jmp pulsec_pulse_lang_Double_isInfinite__double_epilogue
pulsec_pulse_lang_Double_isInfinite__double_epilogue:
pulsec_pulse_lang_Double_isInfinite__double_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Double_isInfinite__double endp

pulsec_pulse_lang_Double_isNegativeZero__double proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Double_isNegativeZero__double_b0:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+72], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+72]
    ucomisd xmm0, xmm1
    jp Double_isNegativeZero_fp_cmp_0_3_unordered
    sete al
    jmp Double_isNegativeZero_fp_cmp_0_3_done
Double_isNegativeZero_fp_cmp_0_3_unordered:
    xor eax, eax
Double_isNegativeZero_fp_cmp_0_3_done:
    movzx eax, al
    test rax, rax
    jne Double_isNegativeZero_ternary_then_0_9
    mov eax, 0
    jmp Double_isNegativeZero_ternary_done_0_9
Double_isNegativeZero_ternary_then_0_9:
    mov rax, 4607182418800017408
    movq xmm0, rax
    movq qword ptr [rsp+80], xmm0
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+80]
    divsd xmm0, xmm1
    movq rax, xmm0
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 0
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    ucomisd xmm0, xmm1
    jp Double_isNegativeZero_fp_cmp_0_8_unordered
    setb al
    jmp Double_isNegativeZero_fp_cmp_0_8_done
Double_isNegativeZero_fp_cmp_0_8_unordered:
    xor eax, eax
Double_isNegativeZero_fp_cmp_0_8_done:
    movzx eax, al
Double_isNegativeZero_ternary_done_0_9:
    jmp pulsec_pulse_lang_Double_isNegativeZero__double_epilogue
pulsec_pulse_lang_Double_isNegativeZero__double_epilogue:
pulsec_pulse_lang_Double_isNegativeZero__double_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_Double_isNegativeZero__double endp

pulsec_pulse_lang_Double_buildMinValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Double_buildMinValue_b0:
    mov rax, 4617248703073655907
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_buildMinValue_b1
pulsec_pulse_lang_Double_buildMinValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 324
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_buildMinValue_b2
    jmp pulsec_pulse_lang_Double_buildMinValue_b3
pulsec_pulse_lang_Double_buildMinValue_b2:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    divsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_buildMinValue_b1
pulsec_pulse_lang_Double_buildMinValue_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Double_buildMinValue_epilogue
pulsec_pulse_lang_Double_buildMinValue_epilogue:
pulsec_pulse_lang_Double_buildMinValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Double_buildMinValue endp

pulsec_pulse_lang_Double_buildMaxValue proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
pulsec_pulse_lang_Double_buildMaxValue_b0:
    mov rax, 4610774909304939336
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_buildMaxValue_b1
pulsec_pulse_lang_Double_buildMaxValue_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 308
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Double_buildMaxValue_b2
    jmp pulsec_pulse_lang_Double_buildMaxValue_b3
pulsec_pulse_lang_Double_buildMaxValue_b2:
    mov rax, qword ptr [rsp+64]
    movq xmm0, rax
    movq qword ptr [rsp+88], xmm0
    mov rax, 4621819117588971520
    movq xmm0, rax
    movapd xmm1, xmm0
    movq xmm0, qword ptr [rsp+88]
    mulsd xmm0, xmm1
    movq rax, xmm0
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Double_buildMaxValue_b1
pulsec_pulse_lang_Double_buildMaxValue_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Double_buildMaxValue_epilogue
pulsec_pulse_lang_Double_buildMaxValue_epilogue:
pulsec_pulse_lang_Double_buildMaxValue_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_Double_buildMaxValue endp

pulsec_pulse_lang_Double_invalidLiteral proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_Double_invalidLiteral_b0:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_lang_NumberFormatException_NumberFormatException__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    test rcx, rcx
    je pulsec_pulse_lang_Double_invalidLiteral_vd_stmt_0_1_2_null
    call pulsec_pulse_lang_Throwable_panic
    jmp pulsec_pulse_lang_Double_invalidLiteral_vd_stmt_0_1_2_done
pulsec_pulse_lang_Double_invalidLiteral_vd_stmt_0_1_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_Double_invalidLiteral_vd_stmt_0_1_2_done:
    xor eax, eax
    jmp pulsec_pulse_lang_Double_invalidLiteral_epilogue
pulsec_pulse_lang_Double_invalidLiteral_epilogue:
pulsec_pulse_lang_Double_invalidLiteral_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_Double_invalidLiteral endp

pulsec_fget_pulse_lang_Double_MIN_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Double_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_Double_MIN_VALUE endp

pulsec_fset_pulse_lang_Double_MIN_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Double_MIN_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Double_MIN_VALUE endp


pulsec_fget_pulse_lang_Double_MAX_VALUE proc
    mov rax, qword ptr [pulsec_fld_pulse_lang_Double_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_Double_MAX_VALUE endp

pulsec_fset_pulse_lang_Double_MAX_VALUE proc
    mov qword ptr [pulsec_fld_pulse_lang_Double_MAX_VALUE], rcx
    ret
pulsec_fset_pulse_lang_Double_MAX_VALUE endp


end
