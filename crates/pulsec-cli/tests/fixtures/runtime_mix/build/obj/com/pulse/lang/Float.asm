option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_panic:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Float dd 0
trace_m0 db "com.pulse.lang.Float.valueOf"
trace_m0_len equ $ - trace_m0
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0 db "com.pulse.lang.Float.valueOf(Float.pulse:14)"
pulsec_com_pulse_lang_Float_valueOf__float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_valueOf__float_trace_s0
trace_m2 db "com.pulse.lang.Float.parse"
trace_m2_len equ $ - trace_m2
pulsec_com_pulse_lang_Float_parse__String_trace_s0 db "com.pulse.lang.Float.parse(Float.pulse:22)"
pulsec_com_pulse_lang_Float_parse__String_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_parse__String_trace_s0
pulsec_com_pulse_lang_Float_parse__String_trace_s1 db "com.pulse.lang.Float.parse(Float.pulse:23)"
pulsec_com_pulse_lang_Float_parse__String_trace_s1_len equ $ - pulsec_com_pulse_lang_Float_parse__String_trace_s1
trace_m5 db "com.pulse.lang.Float.floatValue"
trace_m5_len equ $ - trace_m5
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0 db "com.pulse.lang.Float.floatValue(Float.pulse:31)"
pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0
trace_m7 db "com.pulse.lang.Float.equals"
trace_m7_len equ $ - trace_m7
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0 db "com.pulse.lang.Float.equals(Float.pulse:39)"
pulsec_com_pulse_lang_Float_equals__float_float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_equals__float_float_trace_s0
trace_m9 db "com.pulse.lang.Float.compare"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0 db "com.pulse.lang.Float.compare(Float.pulse:47)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1 db "com.pulse.lang.Float.compare(Float.pulse:48)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s1_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s1
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2 db "com.pulse.lang.Float.compare(Float.pulse:50)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3 db "com.pulse.lang.Float.compare(Float.pulse:51)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s3_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s3
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4 db "com.pulse.lang.Float.compare(Float.pulse:53)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5 db "com.pulse.lang.Float.compare(Float.pulse:54)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s5_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s5
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6 db "com.pulse.lang.Float.compare(Float.pulse:56)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s6_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s6
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7 db "com.pulse.lang.Float.compare(Float.pulse:57)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s7_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s7
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8 db "com.pulse.lang.Float.compare(Float.pulse:58)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9 db "com.pulse.lang.Float.compare(Float.pulse:59)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s9_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s9
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10 db "com.pulse.lang.Float.compare(Float.pulse:61)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11 db "com.pulse.lang.Float.compare(Float.pulse:62)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s11_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s11
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12 db "com.pulse.lang.Float.compare(Float.pulse:64)"
pulsec_com_pulse_lang_Float_compare__float_float_trace_s12_len equ $ - pulsec_com_pulse_lang_Float_compare__float_float_trace_s12
msg0 db "Float.parse is not supported yet"
msg0_len equ $ - msg0

.code
pulsec_com_pulse_lang_Float_valueOf__float proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_valueOf__float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_valueOf__float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_valueOf__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_valueOf__float_epilogue
pulsec_com_pulse_lang_Float_valueOf__float_epilogue:
pulsec_com_pulse_lang_Float_valueOf__float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_valueOf__float endp

pulsec_com_pulse_lang_Float_parse__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_parse__String_b0:
    lea rcx, pulsec_com_pulse_lang_Float_parse__String_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+72], rax
    mov qword ptr [rsp+32], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, pulsec_com_pulse_lang_Float_parse__String_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 16
    call pulsec_rt_objectNew
    jmp pulsec_com_pulse_lang_Float_parse__String_epilogue
pulsec_com_pulse_lang_Float_parse__String_epilogue:
pulsec_com_pulse_lang_Float_parse__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_parse__String endp

pulsec_com_pulse_lang_Float_floatValue__Float proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_lang_Float_floatValue__Float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_floatValue__Float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    jmp pulsec_com_pulse_lang_Float_floatValue__Float_epilogue
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue:
pulsec_com_pulse_lang_Float_floatValue__Float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_lang_Float_floatValue__Float endp

pulsec_com_pulse_lang_Float_equals__float_float proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_lang_Float_equals__float_float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_equals__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_equals__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    jmp pulsec_com_pulse_lang_Float_equals__float_float_epilogue
pulsec_com_pulse_lang_Float_equals__float_float_epilogue:
pulsec_com_pulse_lang_Float_equals__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_lang_Float_equals__float_float endp

pulsec_com_pulse_lang_Float_compare__float_float proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_com_pulse_lang_Float_compare__float_float_b0:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b2
pulsec_com_pulse_lang_Float_compare__float_float_b1:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s1
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b2:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b3
pulsec_com_pulse_lang_Float_compare__float_float_b3:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b4
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b5
pulsec_com_pulse_lang_Float_compare__float_float_b4:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s3
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b5:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b6
pulsec_com_pulse_lang_Float_compare__float_float_b6:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    jne pulsec_com_pulse_lang_Float_compare__float_float_b7
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b8
pulsec_com_pulse_lang_Float_compare__float_float_b7:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s5
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b8:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b9
pulsec_com_pulse_lang_Float_compare__float_float_b9:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s6
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s6_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s7
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s7_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test rax, rax
    jne Float_compare_ternary_then_8_22
    mov eax, 0
    jmp Float_compare_ternary_done_8_22
Float_compare_ternary_then_8_22:
    mov eax, dword ptr [rsp+72]
Float_compare_ternary_done_8_22:
    test eax, eax
    jne pulsec_com_pulse_lang_Float_compare__float_float_b10
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b11
pulsec_com_pulse_lang_Float_compare__float_float_b10:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s9
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b11:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b12
pulsec_com_pulse_lang_Float_compare__float_float_b12:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_com_pulse_lang_Float_compare__float_float_b13
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b14
pulsec_com_pulse_lang_Float_compare__float_float_b13:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s11
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_b14:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s10_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_com_pulse_lang_Float_compare__float_float_b15
pulsec_com_pulse_lang_Float_compare__float_float_b15:
    lea rcx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s12
    mov edx, pulsec_com_pulse_lang_Float_compare__float_float_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_com_pulse_lang_Float_compare__float_float_epilogue
pulsec_com_pulse_lang_Float_compare__float_float_epilogue:
pulsec_com_pulse_lang_Float_compare__float_float_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_lang_Float_compare__float_float endp

end
