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
extrn adenc_aden_lang_Object_toString:proc
extrn adenc_aden_lang_Throwable_toString:proc
extrn adenc_rt_dispatchNullReceiverPanic:proc
extrn adenc_rt_dispatchInvalidTypePanic:proc
extrn adenc_rt_objectClassId:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_Class_toString:proc
extrn adenc_aden_lang_Integer_equals__Object:proc
extrn adenc_aden_lang_Integer_hashCode:proc
extrn adenc_aden_lang_Integer_toString:proc
extrn adenc_aden_lang_Object_equals__Object:proc
extrn adenc_aden_lang_Object_hashCode:proc
extrn adenc_aden_lang_Object_toString:proc
extrn adenc_aden_lang_StringBuilder_toString:proc
extrn adenc_aden_lang_String_equals__Object:proc
extrn adenc_aden_lang_String_hashCode:proc
extrn adenc_aden_lang_Throwable_toString:proc
extrn adenc_adk_build_BuildConfig_equals__Object:proc
extrn adenc_adk_build_BuildConfig_hashCode:proc
extrn adenc_adk_build_BuildConfig_toString:proc
extrn adenc_adk_build_BuildLayout_equals__Object:proc
extrn adenc_adk_build_BuildLayout_hashCode:proc
extrn adenc_adk_build_BuildLayout_toString:proc
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
extrn adenc_fget_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MAX_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MAX_VALUE:proc


.data
written dq 0
adenc_objc_aden_util_Objects dd 0
trace_m0 db "aden.util.Objects.isNull"
trace_m0_len equ 24
adenc_aden_util_Objects_isNull__Object_trace_s0 db "aden.util.Objects.isNull(Objects.aden:15)"
adenc_aden_util_Objects_isNull__Object_trace_s0_len equ 41
trace_m2 db "aden.util.Objects.nonNull"
trace_m2_len equ 25
adenc_aden_util_Objects_nonNull__Object_trace_s0 db "aden.util.Objects.nonNull(Objects.aden:23)"
adenc_aden_util_Objects_nonNull__Object_trace_s0_len equ 42
trace_m4 db "aden.util.Objects.equals"
trace_m4_len equ 24
adenc_aden_util_Objects_equals__Object_Object_trace_s0 db "aden.util.Objects.equals(Objects.aden:31)"
adenc_aden_util_Objects_equals__Object_Object_trace_s0_len equ 41
adenc_aden_util_Objects_equals__Object_Object_trace_s1 db "aden.util.Objects.equals(Objects.aden:32)"
adenc_aden_util_Objects_equals__Object_Object_trace_s1_len equ 41
adenc_aden_util_Objects_equals__Object_Object_trace_s2 db "aden.util.Objects.equals(Objects.aden:34)"
adenc_aden_util_Objects_equals__Object_Object_trace_s2_len equ 41
adenc_aden_util_Objects_equals__Object_Object_trace_s3 db "aden.util.Objects.equals(Objects.aden:35)"
adenc_aden_util_Objects_equals__Object_Object_trace_s3_len equ 41
adenc_aden_util_Objects_equals__Object_Object_trace_s4 db "aden.util.Objects.equals(Objects.aden:37)"
adenc_aden_util_Objects_equals__Object_Object_trace_s4_len equ 41
trace_m10 db "aden.util.Objects.hashCode"
trace_m10_len equ 26
adenc_aden_util_Objects_hashCode__Object_trace_s0 db "aden.util.Objects.hashCode(Objects.aden:45)"
adenc_aden_util_Objects_hashCode__Object_trace_s0_len equ 43
adenc_aden_util_Objects_hashCode__Object_trace_s1 db "aden.util.Objects.hashCode(Objects.aden:46)"
adenc_aden_util_Objects_hashCode__Object_trace_s1_len equ 43
adenc_aden_util_Objects_hashCode__Object_trace_s2 db "aden.util.Objects.hashCode(Objects.aden:48)"
adenc_aden_util_Objects_hashCode__Object_trace_s2_len equ 43
trace_m14 db "aden.util.Objects.toString"
trace_m14_len equ 26
adenc_aden_util_Objects_toString__Object_trace_s0 db "aden.util.Objects.toString(Objects.aden:56)"
adenc_aden_util_Objects_toString__Object_trace_s0_len equ 43
adenc_aden_util_Objects_toString__Object_trace_s1 db "aden.util.Objects.toString(Objects.aden:57)"
adenc_aden_util_Objects_toString__Object_trace_s1_len equ 43
adenc_aden_util_Objects_toString__Object_trace_s2 db "aden.util.Objects.toString(Objects.aden:59)"
adenc_aden_util_Objects_toString__Object_trace_s2_len equ 43
trace_m18 db "aden.util.Objects.toString"
trace_m18_len equ 26
adenc_aden_util_Objects_toString__Object_String_trace_s0 db "aden.util.Objects.toString(Objects.aden:67)"
adenc_aden_util_Objects_toString__Object_String_trace_s0_len equ 43
adenc_aden_util_Objects_toString__Object_String_trace_s1 db "aden.util.Objects.toString(Objects.aden:68)"
adenc_aden_util_Objects_toString__Object_String_trace_s1_len equ 43
adenc_aden_util_Objects_toString__Object_String_trace_s2 db "aden.util.Objects.toString(Objects.aden:70)"
adenc_aden_util_Objects_toString__Object_String_trace_s2_len equ 43
trace_m22 db "aden.util.Objects.requireNonNull"
trace_m22_len equ 32
adenc_aden_util_Objects_requireNonNull__Object_trace_s0 db "aden.util.Objects.requireNonNull(Objects.aden:78)"
adenc_aden_util_Objects_requireNonNull__Object_trace_s0_len equ 49
adenc_aden_util_Objects_requireNonNull__Object_trace_s1 db "aden.util.Objects.requireNonNull(Objects.aden:79)"
adenc_aden_util_Objects_requireNonNull__Object_trace_s1_len equ 49
adenc_aden_util_Objects_requireNonNull__Object_trace_s2 db "aden.util.Objects.requireNonNull(Objects.aden:81)"
adenc_aden_util_Objects_requireNonNull__Object_trace_s2_len equ 49
trace_m26 db "aden.util.Objects.requireNonNull"
trace_m26_len equ 32
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0 db "aden.util.Objects.requireNonNull(Objects.aden:89)"
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0_len equ 49
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s1 db "aden.util.Objects.requireNonNull(Objects.aden:90)"
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s1_len equ 49
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s2 db "aden.util.Objects.requireNonNull(Objects.aden:92)"
adenc_aden_util_Objects_requireNonNull__Object_String_trace_s2_len equ 49
msg0 db "null"
msg0_len equ 4
msg1 db "Objects.requireNonNull received null"
msg1_len equ 36

.code
adenc_aden_util_Objects_isNull__Object proc
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
adenc_aden_util_Objects_isNull__Object_b0:
    lea rcx, adenc_aden_util_Objects_isNull__Object_trace_s0
    mov edx, adenc_aden_util_Objects_isNull__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp adenc_aden_util_Objects_isNull__Object_epilogue
adenc_aden_util_Objects_isNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_util_Objects_isNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_util_Objects_isNull__Object endp

adenc_aden_util_Objects_nonNull__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_util_Objects_nonNull__Object_b0:
    lea rcx, adenc_aden_util_Objects_nonNull__Object_trace_s0
    mov edx, adenc_aden_util_Objects_nonNull__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    setne al
    movzx eax, al
    jmp adenc_aden_util_Objects_nonNull__Object_epilogue
adenc_aden_util_Objects_nonNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_util_Objects_nonNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_util_Objects_nonNull__Object endp

adenc_aden_util_Objects_equals__Object_Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_util_Objects_equals__Object_Object_b0:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s0
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_equals__Object_Object_b1
    jmp adenc_aden_util_Objects_equals__Object_Object_b2
adenc_aden_util_Objects_equals__Object_Object_b1:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s1
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_util_Objects_equals__Object_Object_epilogue
adenc_aden_util_Objects_equals__Object_Object_b2:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s0
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_equals__Object_Object_b3
adenc_aden_util_Objects_equals__Object_Object_b3:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s2
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_util_Objects_equals__Object_Object_b4
    jmp adenc_aden_util_Objects_equals__Object_Object_b5
adenc_aden_util_Objects_equals__Object_Object_b4:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s3
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_util_Objects_equals__Object_Object_epilogue
adenc_aden_util_Objects_equals__Object_Object_b5:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s2
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_equals__Object_Object_b6
adenc_aden_util_Objects_equals__Object_Object_b6:
    lea rcx, adenc_aden_util_Objects_equals__Object_Object_trace_s4
    mov edx, adenc_aden_util_Objects_equals__Object_Object_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Objects_equals_vd4_16_type
    cmp eax, 1
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 4
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 5
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 6
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 14
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 17
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 19
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 20
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 21
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 22
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 23
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 26
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 27
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 28
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 29
    je Objects_equals_vd4_16_assign_ok
    cmp eax, 30
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
    cmp eax, 23
    je Objects_equals_vd4_16_ovr0
    cmp eax, 30
    je Objects_equals_vd4_16_ovr1
    cmp eax, 37
    je Objects_equals_vd4_16_ovr2
    cmp eax, 38
    je Objects_equals_vd4_16_ovr3
    jmp Objects_equals_vd4_16_default
Objects_equals_vd4_16_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Integer_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_String_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildConfig_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildLayout_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Object_equals__Object
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Objects_equals_vd4_16_done
Objects_equals_vd4_16_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Objects_equals_vd4_16_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp adenc_aden_util_Objects_equals__Object_Object_epilogue
adenc_aden_util_Objects_equals__Object_Object_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
adenc_aden_util_Objects_equals__Object_Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
adenc_aden_util_Objects_equals__Object_Object endp

adenc_aden_util_Objects_hashCode__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
adenc_aden_util_Objects_hashCode__Object_b0:
    lea rcx, adenc_aden_util_Objects_hashCode__Object_trace_s0
    mov edx, adenc_aden_util_Objects_hashCode__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_hashCode__Object_b1
    jmp adenc_aden_util_Objects_hashCode__Object_b2
adenc_aden_util_Objects_hashCode__Object_b1:
    lea rcx, adenc_aden_util_Objects_hashCode__Object_trace_s1
    mov edx, adenc_aden_util_Objects_hashCode__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_util_Objects_hashCode__Object_epilogue
adenc_aden_util_Objects_hashCode__Object_b2:
    lea rcx, adenc_aden_util_Objects_hashCode__Object_trace_s0
    mov edx, adenc_aden_util_Objects_hashCode__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_hashCode__Object_b3
adenc_aden_util_Objects_hashCode__Object_b3:
    lea rcx, adenc_aden_util_Objects_hashCode__Object_trace_s2
    mov edx, adenc_aden_util_Objects_hashCode__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Objects_hashCode_vd2_6_type
    cmp eax, 1
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 4
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 5
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 6
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 14
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 17
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 19
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 20
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 21
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 22
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 23
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 26
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 27
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 28
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 29
    je Objects_hashCode_vd2_6_assign_ok
    cmp eax, 30
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
    cmp eax, 23
    je Objects_hashCode_vd2_6_ovr0
    cmp eax, 30
    je Objects_hashCode_vd2_6_ovr1
    cmp eax, 37
    je Objects_hashCode_vd2_6_ovr2
    cmp eax, 38
    je Objects_hashCode_vd2_6_ovr3
    jmp Objects_hashCode_vd2_6_default
Objects_hashCode_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Integer_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_String_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildConfig_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildLayout_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Object_hashCode
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Objects_hashCode_vd2_6_done
Objects_hashCode_vd2_6_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Objects_hashCode_vd2_6_done:
    movsxd rax, eax
    jmp adenc_aden_util_Objects_hashCode__Object_epilogue
adenc_aden_util_Objects_hashCode__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_util_Objects_hashCode__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_util_Objects_hashCode__Object endp

adenc_aden_util_Objects_toString__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
adenc_aden_util_Objects_toString__Object_b0:
    lea rcx, adenc_aden_util_Objects_toString__Object_trace_s0
    mov edx, adenc_aden_util_Objects_toString__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_toString__Object_b1
    jmp adenc_aden_util_Objects_toString__Object_b2
adenc_aden_util_Objects_toString__Object_b1:
    lea rcx, adenc_aden_util_Objects_toString__Object_trace_s1
    mov edx, adenc_aden_util_Objects_toString__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_util_Objects_toString__Object_epilogue
adenc_aden_util_Objects_toString__Object_b2:
    lea rcx, adenc_aden_util_Objects_toString__Object_trace_s0
    mov edx, adenc_aden_util_Objects_toString__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_toString__Object_b3
adenc_aden_util_Objects_toString__Object_b3:
    lea rcx, adenc_aden_util_Objects_toString__Object_trace_s2
    mov edx, adenc_aden_util_Objects_toString__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Objects_toString_vd2_6_type
    cmp eax, 1
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 4
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 5
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 6
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 14
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 17
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 19
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 20
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 21
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 22
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 23
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 26
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 27
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 28
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 29
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 30
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
    cmp eax, 17
    je Objects_toString_vd2_6_ovr0
    cmp eax, 20
    je Objects_toString_vd2_6_ovr1
    cmp eax, 23
    je Objects_toString_vd2_6_ovr2
    cmp eax, 27
    je Objects_toString_vd2_6_ovr3
    cmp eax, 29
    je Objects_toString_vd2_6_ovr4
    cmp eax, 31
    je Objects_toString_vd2_6_ovr5
    cmp eax, 32
    je Objects_toString_vd2_6_ovr6
    cmp eax, 37
    je Objects_toString_vd2_6_ovr7
    cmp eax, 38
    je Objects_toString_vd2_6_ovr8
    jmp Objects_toString_vd2_6_default
Objects_toString_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Class_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Integer_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_StringBuilder_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr7:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildConfig_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr8:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildLayout_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Object_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Objects_toString_vd2_6_done:
    jmp adenc_aden_util_Objects_toString__Object_epilogue
adenc_aden_util_Objects_toString__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_util_Objects_toString__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_util_Objects_toString__Object endp

adenc_aden_util_Objects_toString__Object_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_util_Objects_toString__Object_String_b0:
    lea rcx, adenc_aden_util_Objects_toString__Object_String_trace_s0
    mov edx, adenc_aden_util_Objects_toString__Object_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_toString__Object_String_b1
    jmp adenc_aden_util_Objects_toString__Object_String_b2
adenc_aden_util_Objects_toString__Object_String_b1:
    lea rcx, adenc_aden_util_Objects_toString__Object_String_trace_s1
    mov edx, adenc_aden_util_Objects_toString__Object_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_util_Objects_toString__Object_String_epilogue
adenc_aden_util_Objects_toString__Object_String_b2:
    lea rcx, adenc_aden_util_Objects_toString__Object_String_trace_s0
    mov edx, adenc_aden_util_Objects_toString__Object_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_toString__Object_String_b3
adenc_aden_util_Objects_toString__Object_String_b3:
    lea rcx, adenc_aden_util_Objects_toString__Object_String_trace_s2
    mov edx, adenc_aden_util_Objects_toString__Object_String_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    call adenc_rt_objectClassId
    test eax, eax
    jz Objects_toString_vd2_6_type
    cmp eax, 1
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 4
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 5
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 6
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 14
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 17
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 19
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 20
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 21
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 22
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 23
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 26
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 27
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 28
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 29
    je Objects_toString_vd2_6_assign_ok
    cmp eax, 30
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
    cmp eax, 17
    je Objects_toString_vd2_6_ovr0
    cmp eax, 20
    je Objects_toString_vd2_6_ovr1
    cmp eax, 23
    je Objects_toString_vd2_6_ovr2
    cmp eax, 27
    je Objects_toString_vd2_6_ovr3
    cmp eax, 29
    je Objects_toString_vd2_6_ovr4
    cmp eax, 31
    je Objects_toString_vd2_6_ovr5
    cmp eax, 32
    je Objects_toString_vd2_6_ovr6
    cmp eax, 37
    je Objects_toString_vd2_6_ovr7
    cmp eax, 38
    je Objects_toString_vd2_6_ovr8
    jmp Objects_toString_vd2_6_default
Objects_toString_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Class_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Integer_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_StringBuilder_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Throwable_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr7:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildConfig_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_ovr8:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildLayout_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Object_toString
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Objects_toString_vd2_6_done
Objects_toString_vd2_6_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Objects_toString_vd2_6_done:
    jmp adenc_aden_util_Objects_toString__Object_String_epilogue
adenc_aden_util_Objects_toString__Object_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_util_Objects_toString__Object_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_util_Objects_toString__Object_String endp

adenc_aden_util_Objects_requireNonNull__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
adenc_aden_util_Objects_requireNonNull__Object_b0:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_trace_s0
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_requireNonNull__Object_b1
    jmp adenc_aden_util_Objects_requireNonNull__Object_b2
adenc_aden_util_Objects_requireNonNull__Object_b1:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_trace_s1
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_trace_s0
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_requireNonNull__Object_b3
adenc_aden_util_Objects_requireNonNull__Object_b2:
    jmp adenc_aden_util_Objects_requireNonNull__Object_b3
adenc_aden_util_Objects_requireNonNull__Object_b3:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_trace_s2
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_util_Objects_requireNonNull__Object_epilogue
adenc_aden_util_Objects_requireNonNull__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_util_Objects_requireNonNull__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_util_Objects_requireNonNull__Object endp

adenc_aden_util_Objects_requireNonNull__Object_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_util_Objects_requireNonNull__Object_String_b0:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_util_Objects_requireNonNull__Object_String_b1
    jmp adenc_aden_util_Objects_requireNonNull__Object_String_b2
adenc_aden_util_Objects_requireNonNull__Object_String_b1:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s1
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_util_Objects_requireNonNull__Object_String_b3
adenc_aden_util_Objects_requireNonNull__Object_String_b2:
    jmp adenc_aden_util_Objects_requireNonNull__Object_String_b3
adenc_aden_util_Objects_requireNonNull__Object_String_b3:
    lea rcx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s2
    mov edx, adenc_aden_util_Objects_requireNonNull__Object_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_util_Objects_requireNonNull__Object_String_epilogue
adenc_aden_util_Objects_requireNonNull__Object_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_util_Objects_requireNonNull__Object_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_util_Objects_requireNonNull__Object_String endp

end
