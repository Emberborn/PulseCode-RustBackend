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
extrn adenc_rt_objectNew:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable:proc
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
adenc_objc_aden_lang_RuntimeException dd 0
trace_m0 db "aden.lang.RuntimeException.RuntimeException"
trace_m0_len equ 43
adenc_aden_lang_RuntimeException_RuntimeException_trace_s0 db 97, 100, 101, 110, 46, 108, 97, 110, 103, 46, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 82, 117, 110, 116, 105
    db 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 40, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 97, 100, 101
    db 110, 58, 49, 50, 41
adenc_aden_lang_RuntimeException_RuntimeException_trace_s0_len equ 69
trace_m2 db "aden.lang.RuntimeException.RuntimeException"
trace_m2_len equ 43
adenc_aden_lang_RuntimeException_RuntimeException__String_trace_s0 db 97, 100, 101, 110, 46, 108, 97, 110, 103, 46, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 82, 117, 110, 116, 105
    db 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 40, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 97, 100, 101
    db 110, 58, 50, 48, 41
adenc_aden_lang_RuntimeException_RuntimeException__String_trace_s0_len equ 69
trace_m4 db "aden.lang.RuntimeException.RuntimeException"
trace_m4_len equ 43
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0 db 97, 100, 101, 110, 46, 108, 97, 110, 103, 46, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 82, 117, 110, 116, 105
    db 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 40, 82, 117, 110, 116, 105, 109, 101, 69, 120, 99, 101, 112, 116, 105, 111, 110, 46, 97, 100, 101
    db 110, 58, 50, 56, 41
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0_len equ 69
msg0 db "RuntimeException"
msg0_len equ 16
msg1 db "RuntimeException"
msg1_len equ 16
msg2 db "RuntimeException"
msg2_len equ 16

.code
adenc_aden_lang_RuntimeException_RuntimeException proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_RuntimeException_RuntimeException_ctor_reuse
    mov ecx, 29
    call adenc_rt_objectNew
    jmp adenc_aden_lang_RuntimeException_RuntimeException_ctor_ready
adenc_aden_lang_RuntimeException_RuntimeException_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_RuntimeException_RuntimeException_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_RuntimeException_RuntimeException_b0:
    lea rcx, adenc_aden_lang_RuntimeException_RuntimeException_trace_s0
    mov edx, adenc_aden_lang_RuntimeException_RuntimeException_trace_s0_len
    call adenc_rt_traceUpdateTop
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
    mov qword ptr [rsp+168], rax
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    mov r8, rax
    mov rax, qword ptr [rsp+88]
    mov r9, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je adenc_aden_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_null
    call adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable
    jmp adenc_aden_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_done
adenc_aden_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_RuntimeException_RuntimeException_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_RuntimeException_RuntimeException_epilogue
adenc_aden_lang_RuntimeException_RuntimeException_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_RuntimeException_RuntimeException_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_RuntimeException_RuntimeException endp

adenc_aden_lang_RuntimeException_RuntimeException__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_RuntimeException_RuntimeException__String_ctor_reuse
    mov ecx, 29
    call adenc_rt_objectNew
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_ctor_ready
adenc_aden_lang_RuntimeException_RuntimeException__String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_RuntimeException_RuntimeException__String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_RuntimeException_RuntimeException__String_b0:
    lea rcx, adenc_aden_lang_RuntimeException_RuntimeException__String_trace_s0
    mov edx, adenc_aden_lang_RuntimeException_RuntimeException__String_trace_s0_len
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
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    xor eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov rax, qword ptr [rsp+96]
    mov r9, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je adenc_aden_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_null
    call adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_done
adenc_aden_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_RuntimeException_RuntimeException__String_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_epilogue
adenc_aden_lang_RuntimeException_RuntimeException__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_lang_RuntimeException_RuntimeException__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_lang_RuntimeException_RuntimeException__String endp

adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_ctor_reuse
    mov ecx, 29
    call adenc_rt_objectNew
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_ctor_ready
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_b0:
    lea rcx, adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0
    mov edx, adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rax, qword ptr [rsp+104]
    mov r9, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_null
    call adenc_aden_lang_Throwable_initThrowableState__String_String_Throwable
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_done
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_epilogue
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_lang_RuntimeException_RuntimeException__String_Throwable endp

end
