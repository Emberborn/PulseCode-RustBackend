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
extrn pulsec_pulse_lang_Object_toString:proc
extrn pulsec_pulse_lang_Throwable_toString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_author_build_BuildConfig_equals__Object:proc
extrn pulsec_author_build_BuildConfig_hashCode:proc
extrn pulsec_author_build_BuildConfig_toString:proc
extrn pulsec_author_build_BuildLayout_equals__Object:proc
extrn pulsec_author_build_BuildLayout_hashCode:proc
extrn pulsec_author_build_BuildLayout_toString:proc
extrn pulsec_pulse_lang_Class_toString:proc
extrn pulsec_pulse_lang_Integer_equals__Object:proc
extrn pulsec_pulse_lang_Integer_hashCode:proc
extrn pulsec_pulse_lang_Integer_toString:proc
extrn pulsec_pulse_lang_Object_equals__Object:proc
extrn pulsec_pulse_lang_Object_hashCode:proc
extrn pulsec_pulse_lang_Object_toString:proc
extrn pulsec_pulse_lang_StringBuilder_toString:proc
extrn pulsec_pulse_lang_String_equals__Object:proc
extrn pulsec_pulse_lang_String_hashCode:proc
extrn pulsec_pulse_lang_Throwable_toString:proc
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
extrn pulsec_fget_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_ULong_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_ULong_MAX_VALUE:proc


.data
written dq 0
pulsec_objc_pulse_util_Objects dd 0
trace_m0 db "pulse.util.Objects.isNull"
trace_m0_len equ 25
pulsec_pulse_util_Objects_isNull__Object_trace_s0 db "pulse.util.Objects.isNull(Objects.pulse:15)"
pulsec_pulse_util_Objects_isNull__Object_trace_s0_len equ 43
trace_m2 db "pulse.util.Objects.nonNull"
trace_m2_len equ 26
pulsec_pulse_util_Objects_nonNull__Object_trace_s0 db "pulse.util.Objects.nonNull(Objects.pulse:23)"
pulsec_pulse_util_Objects_nonNull__Object_trace_s0_len equ 44
trace_m4 db "pulse.util.Objects.equals"
trace_m4_len equ 25
pulsec_pulse_util_Objects_equals__Object_Object_trace_s0 db "pulse.util.Objects.equals(Objects.pulse:31)"
pulsec_pulse_util_Objects_equals__Object_Object_trace_s0_len equ 43
pulsec_pulse_util_Objects_equals__Object_Object_trace_s1 db "pulse.util.Objects.equals(Objects.pulse:32)"
pulsec_pulse_util_Objects_equals__Object_Object_trace_s1_len equ 43
pulsec_pulse_util_Objects_equals__Object_Object_trace_s2 db "pulse.util.Objects.equals(Objects.pulse:34)"
pulsec_pulse_util_Objects_equals__Object_Object_trace_s2_len equ 43
pulsec_pulse_util_Objects_equals__Object_Object_trace_s3 db "pulse.util.Objects.equals(Objects.pulse:35)"
pulsec_pulse_util_Objects_equals__Object_Object_trace_s3_len equ 43
pulsec_pulse_util_Objects_equals__Object_Object_trace_s4 db "pulse.util.Objects.equals(Objects.pulse:37)"
pulsec_pulse_util_Objects_equals__Object_Object_trace_s4_len equ 43
trace_m10 db "pulse.util.Objects.hashCode"
trace_m10_len equ 27
pulsec_pulse_util_Objects_hashCode__Object_trace_s0 db "pulse.util.Objects.hashCode(Objects.pulse:45)"
pulsec_pulse_util_Objects_hashCode__Object_trace_s0_len equ 45
pulsec_pulse_util_Objects_hashCode__Object_trace_s1 db "pulse.util.Objects.hashCode(Objects.pulse:46)"
pulsec_pulse_util_Objects_hashCode__Object_trace_s1_len equ 45
pulsec_pulse_util_Objects_hashCode__Object_trace_s2 db "pulse.util.Objects.hashCode(Objects.pulse:48)"
pulsec_pulse_util_Objects_hashCode__Object_trace_s2_len equ 45
trace_m14 db "pulse.util.Objects.toString"
trace_m14_len equ 27
pulsec_pulse_util_Objects_toString__Object_trace_s0 db "pulse.util.Objects.toString(Objects.pulse:56)"
pulsec_pulse_util_Objects_toString__Object_trace_s0_len equ 45
pulsec_pulse_util_Objects_toString__Object_trace_s1 db "pulse.util.Objects.toString(Objects.pulse:57)"
pulsec_pulse_util_Objects_toString__Object_trace_s1_len equ 45
pulsec_pulse_util_Objects_toString__Object_trace_s2 db "pulse.util.Objects.toString(Objects.pulse:59)"
pulsec_pulse_util_Objects_toString__Object_trace_s2_len equ 45
trace_m18 db "pulse.util.Objects.toString"
trace_m18_len equ 27
pulsec_pulse_util_Objects_toString__Object_String_trace_s0 db "pulse.util.Objects.toString(Objects.pulse:67)"
pulsec_pulse_util_Objects_toString__Object_String_trace_s0_len equ 45
pulsec_pulse_util_Objects_toString__Object_String_trace_s1 db "pulse.util.Objects.toString(Objects.pulse:68)"
pulsec_pulse_util_Objects_toString__Object_String_trace_s1_len equ 45
pulsec_pulse_util_Objects_toString__Object_String_trace_s2 db "pulse.util.Objects.toString(Objects.pulse:70)"
pulsec_pulse_util_Objects_toString__Object_String_trace_s2_len equ 45
trace_m22 db "pulse.util.Objects.requireNonNull"
trace_m22_len equ 33
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0 db "pulse.util.Objects.requireNonNull(Objects.pulse:78)"
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0_len equ 51
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s1 db "pulse.util.Objects.requireNonNull(Objects.pulse:79)"
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s1_len equ 51
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s2 db "pulse.util.Objects.requireNonNull(Objects.pulse:81)"
pulsec_pulse_util_Objects_requireNonNull__Object_trace_s2_len equ 51
trace_m26 db "pulse.util.Objects.requireNonNull"
trace_m26_len equ 33
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0 db "pulse.util.Objects.requireNonNull(Objects.pulse:89)"
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0_len equ 51
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s1 db "pulse.util.Objects.requireNonNull(Objects.pulse:90)"
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s1_len equ 51
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s2 db "pulse.util.Objects.requireNonNull(Objects.pulse:92)"
pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s2_len equ 51
msg0 db "null"
msg0_len equ 4
msg1 db "Objects.requireNonNull received null"
msg1_len equ 36

.code
pulsec_pulse_util_Objects_isNull__Object proc
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
pulsec_pulse_util_Objects_isNull__Object_b0:
    lea rcx, pulsec_pulse_util_Objects_isNull__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_isNull__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_pulse_util_Objects_isNull__Object_epilogue
pulsec_pulse_util_Objects_isNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_util_Objects_isNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_util_Objects_isNull__Object endp

pulsec_pulse_util_Objects_nonNull__Object proc
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
pulsec_pulse_util_Objects_nonNull__Object_b0:
    lea rcx, pulsec_pulse_util_Objects_nonNull__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_nonNull__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    setne al
    movzx eax, al
    jmp pulsec_pulse_util_Objects_nonNull__Object_epilogue
pulsec_pulse_util_Objects_nonNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_util_Objects_nonNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_util_Objects_nonNull__Object endp

pulsec_pulse_util_Objects_equals__Object_Object proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_util_Objects_equals__Object_Object_b0:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_equals__Object_Object_b1
    jmp pulsec_pulse_util_Objects_equals__Object_Object_b2
pulsec_pulse_util_Objects_equals__Object_Object_b1:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s1
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_util_Objects_equals__Object_Object_epilogue
pulsec_pulse_util_Objects_equals__Object_Object_b2:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_equals__Object_Object_b3
pulsec_pulse_util_Objects_equals__Object_Object_b3:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s2
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne Objects_equals_ternary_then_2_11
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp Objects_equals_ternary_done_2_11
Objects_equals_ternary_then_2_11:
    mov eax, 1
Objects_equals_ternary_done_2_11:
    test eax, eax
    jne pulsec_pulse_util_Objects_equals__Object_Object_b4
    jmp pulsec_pulse_util_Objects_equals__Object_Object_b5
pulsec_pulse_util_Objects_equals__Object_Object_b4:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s3
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_util_Objects_equals__Object_Object_epilogue
pulsec_pulse_util_Objects_equals__Object_Object_b5:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s2
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_equals__Object_Object_b6
pulsec_pulse_util_Objects_equals__Object_Object_b6:
    lea rcx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s4
    mov edx, pulsec_pulse_util_Objects_equals__Object_Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je Objects_equals_vd4_16_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Objects_equals_vd4_16_type
    cmp eax, 1
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 2
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 3
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 4
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 5
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 6
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 9
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 10
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 11
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 19
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 22
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 24
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 25
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 26
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 27
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 28
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 31
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 32
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 33
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 34
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 35
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 36
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 37
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 38
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 39
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 40
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 41
    je Objects_equals_vd4_16_assign_ok
    jmp Objects_equals_vd4_16_type
Objects_equals_vd4_16_assign_ok:
    cmp eax, 1
    je Objects_equals_vd4_16_ovr0
    cmp eax, 2
    je Objects_equals_vd4_16_ovr1
    cmp eax, 28
    je Objects_equals_vd4_16_ovr2
    cmp eax, 35
    je Objects_equals_vd4_16_ovr3
    jmp Objects_equals_vd4_16_default
Objects_equals_vd4_16_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildConfig_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildLayout_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Integer_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Object_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Objects_equals_vd4_16_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp pulsec_pulse_util_Objects_equals__Object_Object_epilogue
pulsec_pulse_util_Objects_equals__Object_Object_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_util_Objects_equals__Object_Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_util_Objects_equals__Object_Object endp

pulsec_pulse_util_Objects_hashCode__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_util_Objects_hashCode__Object_b0:
    lea rcx, pulsec_pulse_util_Objects_hashCode__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_hashCode__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_hashCode__Object_b1
    jmp pulsec_pulse_util_Objects_hashCode__Object_b2
pulsec_pulse_util_Objects_hashCode__Object_b1:
    lea rcx, pulsec_pulse_util_Objects_hashCode__Object_trace_s1
    mov edx, pulsec_pulse_util_Objects_hashCode__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_util_Objects_hashCode__Object_epilogue
pulsec_pulse_util_Objects_hashCode__Object_b2:
    lea rcx, pulsec_pulse_util_Objects_hashCode__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_hashCode__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_hashCode__Object_b3
pulsec_pulse_util_Objects_hashCode__Object_b3:
    lea rcx, pulsec_pulse_util_Objects_hashCode__Object_trace_s2
    mov edx, pulsec_pulse_util_Objects_hashCode__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je Objects_hashCode_vd2_6_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Objects_hashCode_vd2_6_type
    cmp eax, 1
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 2
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 3
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 4
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 5
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 6
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 9
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 10
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 11
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 19
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 22
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 24
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 25
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 26
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 27
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 28
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 31
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 32
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 33
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 34
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 35
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 36
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 37
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 38
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 39
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 40
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 41
    je Objects_hashCode_vd2_6_assign_ok
    jmp Objects_hashCode_vd2_6_type
Objects_hashCode_vd2_6_assign_ok:
    cmp eax, 1
    je Objects_hashCode_vd2_6_ovr0
    cmp eax, 2
    je Objects_hashCode_vd2_6_ovr1
    cmp eax, 28
    je Objects_hashCode_vd2_6_ovr2
    cmp eax, 35
    je Objects_hashCode_vd2_6_ovr3
    jmp Objects_hashCode_vd2_6_default
Objects_hashCode_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildConfig_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildLayout_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Integer_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Object_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Objects_hashCode_vd2_6_done:
    movsxd rax, eax
    jmp pulsec_pulse_util_Objects_hashCode__Object_epilogue
pulsec_pulse_util_Objects_hashCode__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_util_Objects_hashCode__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_util_Objects_hashCode__Object endp

pulsec_pulse_util_Objects_toString__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_util_Objects_toString__Object_b0:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_toString__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_toString__Object_b1
    jmp pulsec_pulse_util_Objects_toString__Object_b2
pulsec_pulse_util_Objects_toString__Object_b1:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_trace_s1
    mov edx, pulsec_pulse_util_Objects_toString__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_util_Objects_toString__Object_epilogue
pulsec_pulse_util_Objects_toString__Object_b2:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_toString__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_toString__Object_b3
pulsec_pulse_util_Objects_toString__Object_b3:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_trace_s2
    mov edx, pulsec_pulse_util_Objects_toString__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je Objects_toString_vd2_6_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Objects_toString_vd2_6_type
    cmp eax, 1
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 2
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 3
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 4
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 5
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 6
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 9
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 10
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 11
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 19
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 22
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 24
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 25
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 26
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 27
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 28
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 31
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 32
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 33
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 34
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 35
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 36
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 37
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 38
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 39
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 40
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 41
    je Objects_toString_vd2_6_assign_ok
    jmp Objects_toString_vd2_6_type
Objects_toString_vd2_6_assign_ok:
    cmp eax, 1
    je Objects_toString_vd2_6_ovr0
    cmp eax, 2
    je Objects_toString_vd2_6_ovr1
    cmp eax, 22
    je Objects_toString_vd2_6_ovr2
    cmp eax, 25
    je Objects_toString_vd2_6_ovr3
    cmp eax, 28
    je Objects_toString_vd2_6_ovr4
    cmp eax, 32
    je Objects_toString_vd2_6_ovr5
    cmp eax, 34
    je Objects_toString_vd2_6_ovr6
    cmp eax, 36
    je Objects_toString_vd2_6_ovr7
    cmp eax, 37
    je Objects_toString_vd2_6_ovr8
    jmp Objects_toString_vd2_6_default
Objects_toString_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildConfig_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildLayout_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Class_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Integer_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr7:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr8:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Object_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Objects_toString_vd2_6_done:
    jmp pulsec_pulse_util_Objects_toString__Object_epilogue
pulsec_pulse_util_Objects_toString__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_util_Objects_toString__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_util_Objects_toString__Object endp

pulsec_pulse_util_Objects_toString__Object_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_util_Objects_toString__Object_String_b0:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_String_trace_s0
    mov edx, pulsec_pulse_util_Objects_toString__Object_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_toString__Object_String_b1
    jmp pulsec_pulse_util_Objects_toString__Object_String_b2
pulsec_pulse_util_Objects_toString__Object_String_b1:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_String_trace_s1
    mov edx, pulsec_pulse_util_Objects_toString__Object_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_util_Objects_toString__Object_String_epilogue
pulsec_pulse_util_Objects_toString__Object_String_b2:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_String_trace_s0
    mov edx, pulsec_pulse_util_Objects_toString__Object_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_toString__Object_String_b3
pulsec_pulse_util_Objects_toString__Object_String_b3:
    lea rcx, pulsec_pulse_util_Objects_toString__Object_String_trace_s2
    mov edx, pulsec_pulse_util_Objects_toString__Object_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je Objects_toString_vd2_6_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz Objects_toString_vd2_6_type
    cmp eax, 1
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 2
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 3
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 4
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 5
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 6
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 9
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 10
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 11
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 19
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 22
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 24
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 25
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 26
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 27
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 28
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 31
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 32
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 33
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 34
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 35
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 36
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 37
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 38
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 39
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 40
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 41
    je Objects_toString_vd2_6_assign_ok
    jmp Objects_toString_vd2_6_type
Objects_toString_vd2_6_assign_ok:
    cmp eax, 1
    je Objects_toString_vd2_6_ovr0
    cmp eax, 2
    je Objects_toString_vd2_6_ovr1
    cmp eax, 22
    je Objects_toString_vd2_6_ovr2
    cmp eax, 25
    je Objects_toString_vd2_6_ovr3
    cmp eax, 28
    je Objects_toString_vd2_6_ovr4
    cmp eax, 32
    je Objects_toString_vd2_6_ovr5
    cmp eax, 34
    je Objects_toString_vd2_6_ovr6
    cmp eax, 36
    je Objects_toString_vd2_6_ovr7
    cmp eax, 37
    je Objects_toString_vd2_6_ovr8
    jmp Objects_toString_vd2_6_default
Objects_toString_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildConfig_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_author_build_BuildLayout_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Class_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Integer_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr7:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr8:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Object_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
Objects_toString_vd2_6_done:
    jmp pulsec_pulse_util_Objects_toString__Object_String_epilogue
pulsec_pulse_util_Objects_toString__Object_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_util_Objects_toString__Object_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_util_Objects_toString__Object_String endp

pulsec_pulse_util_Objects_requireNonNull__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_util_Objects_requireNonNull__Object_b0:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_requireNonNull__Object_b1
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_b2
pulsec_pulse_util_Objects_requireNonNull__Object_b1:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s1
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_b3
pulsec_pulse_util_Objects_requireNonNull__Object_b2:
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_b3
pulsec_pulse_util_Objects_requireNonNull__Object_b3:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s2
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_epilogue
pulsec_pulse_util_Objects_requireNonNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_util_Objects_requireNonNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_util_Objects_requireNonNull__Object endp

pulsec_pulse_util_Objects_requireNonNull__Object_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_util_Objects_requireNonNull__Object_String_b0:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_util_Objects_requireNonNull__Object_String_b1
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_String_b2
pulsec_pulse_util_Objects_requireNonNull__Object_String_b1:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s1
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_String_b3
pulsec_pulse_util_Objects_requireNonNull__Object_String_b2:
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_String_b3
pulsec_pulse_util_Objects_requireNonNull__Object_String_b3:
    lea rcx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s2
    mov edx, pulsec_pulse_util_Objects_requireNonNull__Object_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_util_Objects_requireNonNull__Object_String_epilogue
pulsec_pulse_util_Objects_requireNonNull__Object_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_util_Objects_requireNonNull__Object_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_util_Objects_requireNonNull__Object_String endp

end
