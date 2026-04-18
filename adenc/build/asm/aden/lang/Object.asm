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
extrn adenc_rt_dispatchNullReceiverPanic:proc
extrn adenc_rt_dispatchInvalidTypePanic:proc
extrn adenc_rt_objectClassId:proc
extrn adenc_rt_objectClassName:proc
extrn adenc_rt_objectHashCode:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_Class_Class__String:proc
extrn adenc_aden_lang_Integer_hashCode:proc
extrn adenc_aden_lang_Integer_toHexString__int:proc
extrn adenc_aden_lang_String_hashCode:proc
extrn adenc_adk_build_BuildConfig_hashCode:proc
extrn adenc_adk_build_BuildLayout_hashCode:proc
extrn adenc_rt_objectClassName:proc
extrn adenc_rt_objectHashCode:proc
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


extrn adenc_aden_lang_Class_getName:proc
extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_aden_lang_Object dd 0
trace_m0 db "aden.lang.Object.hashCode"
trace_m0_len equ 25
adenc_aden_lang_Object_hashCode_trace_s0 db "aden.lang.Object.hashCode(Object.aden:14)"
adenc_aden_lang_Object_hashCode_trace_s0_len equ 41
trace_m2 db "aden.lang.Object.toString"
trace_m2_len equ 25
adenc_aden_lang_Object_toString_trace_s0 db "aden.lang.Object.toString(Object.aden:22)"
adenc_aden_lang_Object_toString_trace_s0_len equ 41
trace_m4 db "aden.lang.Object.equals"
trace_m4_len equ 23
adenc_aden_lang_Object_equals__Object_trace_s0 db "aden.lang.Object.equals(Object.aden:30)"
adenc_aden_lang_Object_equals__Object_trace_s0_len equ 39
trace_m6 db "aden.lang.Object.getClass"
trace_m6_len equ 25
adenc_aden_lang_Object_getClass_trace_s0 db "aden.lang.Object.getClass(Object.aden:38)"
adenc_aden_lang_Object_getClass_trace_s0_len equ 41
msg0 db "@"
msg0_len equ 1

.code
adenc_aden_lang_Object_hashCode proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Object_hashCode_b0:
    lea rcx, adenc_aden_lang_Object_hashCode_trace_s0
    mov edx, adenc_aden_lang_Object_hashCode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_objectHashCode
    movsxd rax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Object_hashCode_epilogue
adenc_aden_lang_Object_hashCode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Object_hashCode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_Object_hashCode endp

adenc_aden_lang_Object_toString proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Object_toString_b0:
    lea rcx, adenc_aden_lang_Object_toString_trace_s0
    mov edx, adenc_aden_lang_Object_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Object_toString_vd0_2_null
    call adenc_aden_lang_Object_getClass
    jmp Object_toString_vd0_2_done
Object_toString_vd0_2_null:
    call adenc_rt_dispatchNullReceiverPanic
Object_toString_vd0_2_done:
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call adenc_aden_lang_Class_getName
    mov qword ptr [rsp+160], rax
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je Object_toString_vd0_13_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call adenc_rt_objectClassId
    test eax, eax
    jz Object_toString_vd0_13_type
    cmp eax, 1
    je Object_toString_vd0_13_assign_ok
    cmp eax, 4
    je Object_toString_vd0_13_assign_ok
    cmp eax, 5
    je Object_toString_vd0_13_assign_ok
    cmp eax, 6
    je Object_toString_vd0_13_assign_ok
    cmp eax, 14
    je Object_toString_vd0_13_assign_ok
    cmp eax, 17
    je Object_toString_vd0_13_assign_ok
    cmp eax, 19
    je Object_toString_vd0_13_assign_ok
    cmp eax, 20
    je Object_toString_vd0_13_assign_ok
    cmp eax, 21
    je Object_toString_vd0_13_assign_ok
    cmp eax, 22
    je Object_toString_vd0_13_assign_ok
    cmp eax, 23
    je Object_toString_vd0_13_assign_ok
    cmp eax, 26
    je Object_toString_vd0_13_assign_ok
    cmp eax, 27
    je Object_toString_vd0_13_assign_ok
    cmp eax, 28
    je Object_toString_vd0_13_assign_ok
    cmp eax, 29
    je Object_toString_vd0_13_assign_ok
    cmp eax, 30
    je Object_toString_vd0_13_assign_ok
    cmp eax, 31
    je Object_toString_vd0_13_assign_ok
    cmp eax, 32
    je Object_toString_vd0_13_assign_ok
    cmp eax, 33
    je Object_toString_vd0_13_assign_ok
    cmp eax, 34
    je Object_toString_vd0_13_assign_ok
    cmp eax, 35
    je Object_toString_vd0_13_assign_ok
    cmp eax, 36
    je Object_toString_vd0_13_assign_ok
    cmp eax, 37
    je Object_toString_vd0_13_assign_ok
    cmp eax, 38
    je Object_toString_vd0_13_assign_ok
    cmp eax, 39
    je Object_toString_vd0_13_assign_ok
    cmp eax, 40
    je Object_toString_vd0_13_assign_ok
    cmp eax, 41
    je Object_toString_vd0_13_assign_ok
    jmp Object_toString_vd0_13_type
Object_toString_vd0_13_assign_ok:
    cmp eax, 23
    je Object_toString_vd0_13_ovr0
    cmp eax, 30
    je Object_toString_vd0_13_ovr1
    cmp eax, 37
    je Object_toString_vd0_13_ovr2
    cmp eax, 38
    je Object_toString_vd0_13_ovr3
    jmp Object_toString_vd0_13_default
Object_toString_vd0_13_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Integer_hashCode
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_String_hashCode
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildConfig_hashCode
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_adk_build_BuildLayout_hashCode
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call adenc_aden_lang_Object_hashCode
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_null:
    call adenc_rt_dispatchNullReceiverPanic
    jmp Object_toString_vd0_13_done
Object_toString_vd0_13_type:
    add rsp, 80
    call adenc_rt_dispatchInvalidTypePanic
Object_toString_vd0_13_done:
    movsxd rax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call adenc_aden_lang_Integer_toHexString__int
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+120]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Object_toString_epilogue
adenc_aden_lang_Object_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Object_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 360
    ret
adenc_aden_lang_Object_toString endp

adenc_aden_lang_Object_equals__Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Object_equals__Object_b0:
    lea rcx, adenc_aden_lang_Object_equals__Object_trace_s0
    mov edx, adenc_aden_lang_Object_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp adenc_aden_lang_Object_equals__Object_epilogue
adenc_aden_lang_Object_equals__Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Object_equals__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Object_equals__Object endp

adenc_aden_lang_Object_getClass proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Object_getClass_b0:
    lea rcx, adenc_aden_lang_Object_getClass_trace_s0
    mov edx, adenc_aden_lang_Object_getClass_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_objectClassName
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call adenc_aden_lang_Class_Class__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Object_getClass_epilogue
adenc_aden_lang_Object_getClass_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Object_getClass_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
adenc_aden_lang_Object_getClass endp

end
