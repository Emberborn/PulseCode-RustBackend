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
extrn adenc_rt_objectNew:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_lastIndexOf__char:proc
extrn adenc_aden_lang_String_substring__int:proc
extrn adenc_aden_lang_String_substring__int_int:proc
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

public adenc_fld_aden_lang_Class_name
public adenc_fld_aden_lang_Class_name_heap_owned

.data
written dq 0
adenc_objc_aden_lang_Class dd 0
adenc_fcap_aden_lang_Class dd 63
adenc_fld_aden_lang_Class_name_tbl dq 64 dup(0)
adenc_fld_aden_lang_Class_name dq adenc_fld_aden_lang_Class_name_tbl
adenc_fld_aden_lang_Class_name_heap_owned dd 0
trace_m0 db "aden.lang.Class.Class"
trace_m0_len equ 21
adenc_aden_lang_Class_Class__String_trace_s0 db "aden.lang.Class.Class(Class.aden:14)"
adenc_aden_lang_Class_Class__String_trace_s0_len equ 36
trace_m2 db "aden.lang.Class.getName"
trace_m2_len equ 23
adenc_aden_lang_Class_getName_trace_s0 db "aden.lang.Class.getName(Class.aden:22)"
adenc_aden_lang_Class_getName_trace_s0_len equ 38
trace_m4 db "aden.lang.Class.getSimpleName"
trace_m4_len equ 29
adenc_aden_lang_Class_getSimpleName_trace_s0 db "aden.lang.Class.getSimpleName(Class.aden:30)"
adenc_aden_lang_Class_getSimpleName_trace_s0_len equ 44
adenc_aden_lang_Class_getSimpleName_trace_s1 db "aden.lang.Class.getSimpleName(Class.aden:31)"
adenc_aden_lang_Class_getSimpleName_trace_s1_len equ 44
adenc_aden_lang_Class_getSimpleName_trace_s2 db "aden.lang.Class.getSimpleName(Class.aden:32)"
adenc_aden_lang_Class_getSimpleName_trace_s2_len equ 44
adenc_aden_lang_Class_getSimpleName_trace_s3 db "aden.lang.Class.getSimpleName(Class.aden:34)"
adenc_aden_lang_Class_getSimpleName_trace_s3_len equ 44
trace_m9 db "aden.lang.Class.getPackageName"
trace_m9_len equ 30
adenc_aden_lang_Class_getPackageName_trace_s0 db "aden.lang.Class.getPackageName(Class.aden:42)"
adenc_aden_lang_Class_getPackageName_trace_s0_len equ 45
adenc_aden_lang_Class_getPackageName_trace_s1 db "aden.lang.Class.getPackageName(Class.aden:43)"
adenc_aden_lang_Class_getPackageName_trace_s1_len equ 45
adenc_aden_lang_Class_getPackageName_trace_s2 db "aden.lang.Class.getPackageName(Class.aden:44)"
adenc_aden_lang_Class_getPackageName_trace_s2_len equ 45
adenc_aden_lang_Class_getPackageName_trace_s3 db "aden.lang.Class.getPackageName(Class.aden:46)"
adenc_aden_lang_Class_getPackageName_trace_s3_len equ 45
trace_m14 db "aden.lang.Class.toString"
trace_m14_len equ 24
adenc_aden_lang_Class_toString_trace_s0 db "aden.lang.Class.toString(Class.aden:54)"
adenc_aden_lang_Class_toString_trace_s0_len equ 39
msg0 db 0
msg0_len equ 0

.code
adenc_fcap_aden_lang_Class_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_lang_Class]
    jbe adenc_fcap_aden_lang_Class_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_lang_Class]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_lang_Class_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_lang_Class_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_lang_Class_name]
    xor esi, esi
adenc_fcap_aden_lang_Class_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_lang_Class_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_lang_Class_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_lang_Class_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_lang_Class_ensure_field_0_done_copy_loop
adenc_fcap_aden_lang_Class_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_lang_Class_name_heap_owned], 0
    je adenc_fcap_aden_lang_Class_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_lang_Class_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_lang_Class_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_lang_Class_name], r12
    mov dword ptr [adenc_fld_aden_lang_Class_name_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_lang_Class], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_lang_Class_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_lang_Class_ensure_alloc_fail:
adenc_fcap_aden_lang_Class_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_lang_Class_ensure endp

adenc_fcap_aden_lang_Class_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Class_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_lang_Class_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_lang_Class_arc_teardown_field_0_skip:
    add rsp, 40
adenc_fcap_aden_lang_Class_arc_teardown_done:
    ret
adenc_fcap_aden_lang_Class_arc_teardown endp
adenc_fcap_aden_lang_Class_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Class_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_lang_Class_arc_scan_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_lang_Class_arc_scan_edges_done:
    ret
adenc_fcap_aden_lang_Class_arc_scan_edges endp
adenc_fcap_aden_lang_Class_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Class_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_lang_Class_arc_invalidate_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_lang_Class_arc_invalidate_edges_done:
    ret
adenc_fcap_aden_lang_Class_arc_invalidate_edges endp
adenc_aden_lang_Class_Class__String proc
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
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_Class_Class__String_ctor_reuse
    mov ecx, 17
    call adenc_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_fcap_aden_lang_Class_ensure
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Class_Class__String_ctor_ready
adenc_aden_lang_Class_Class__String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_Class_Class__String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Class_Class__String_b0:
    lea rcx, adenc_aden_lang_Class_Class__String_trace_s0
    mov edx, adenc_aden_lang_Class_Class__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Class_Class__String_epilogue
adenc_aden_lang_Class_Class__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_lang_Class_Class__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_lang_Class_Class__String endp

adenc_aden_lang_Class_getName proc
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
adenc_aden_lang_Class_getName_b0:
    lea rcx, adenc_aden_lang_Class_getName_trace_s0
    mov edx, adenc_aden_lang_Class_getName_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Class_getName_epilogue
adenc_aden_lang_Class_getName_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Class_getName_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Class_getName endp

adenc_aden_lang_Class_getSimpleName proc
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
    mov qword ptr [rsp+72], rcx
adenc_aden_lang_Class_getSimpleName_b0:
    lea rcx, adenc_aden_lang_Class_getSimpleName_trace_s0
    mov edx, adenc_aden_lang_Class_getSimpleName_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov eax, 46
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_lastIndexOf__char
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Class_getSimpleName_trace_s1
    mov edx, adenc_aden_lang_Class_getSimpleName_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Class_getSimpleName_b1
    jmp adenc_aden_lang_Class_getSimpleName_b2
adenc_aden_lang_Class_getSimpleName_b1:
    lea rcx, adenc_aden_lang_Class_getSimpleName_trace_s2
    mov edx, adenc_aden_lang_Class_getSimpleName_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Class_getSimpleName_epilogue
adenc_aden_lang_Class_getSimpleName_b2:
    lea rcx, adenc_aden_lang_Class_getSimpleName_trace_s1
    mov edx, adenc_aden_lang_Class_getSimpleName_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Class_getSimpleName_b3
adenc_aden_lang_Class_getSimpleName_b3:
    lea rcx, adenc_aden_lang_Class_getSimpleName_trace_s3
    mov edx, adenc_aden_lang_Class_getSimpleName_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+144]
    call adenc_aden_lang_String_substring__int
    jmp adenc_aden_lang_Class_getSimpleName_epilogue
adenc_aden_lang_Class_getSimpleName_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_Class_getSimpleName_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_aden_lang_Class_getSimpleName endp

adenc_aden_lang_Class_getPackageName proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
adenc_aden_lang_Class_getPackageName_b0:
    lea rcx, adenc_aden_lang_Class_getPackageName_trace_s0
    mov edx, adenc_aden_lang_Class_getPackageName_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov eax, 46
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_lastIndexOf__char
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Class_getPackageName_trace_s1
    mov edx, adenc_aden_lang_Class_getPackageName_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Class_getPackageName_b1
    jmp adenc_aden_lang_Class_getPackageName_b2
adenc_aden_lang_Class_getPackageName_b1:
    lea rcx, adenc_aden_lang_Class_getPackageName_trace_s2
    mov edx, adenc_aden_lang_Class_getPackageName_trace_s2_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Class_getPackageName_epilogue
adenc_aden_lang_Class_getPackageName_b2:
    lea rcx, adenc_aden_lang_Class_getPackageName_trace_s1
    mov edx, adenc_aden_lang_Class_getPackageName_trace_s1_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Class_getPackageName_b3
adenc_aden_lang_Class_getPackageName_b3:
    lea rcx, adenc_aden_lang_Class_getPackageName_trace_s3
    mov edx, adenc_aden_lang_Class_getPackageName_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov eax, 0
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_substring__int_int
    jmp adenc_aden_lang_Class_getPackageName_epilogue
adenc_aden_lang_Class_getPackageName_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Class_getPackageName_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_lang_Class_getPackageName endp

adenc_aden_lang_Class_toString proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Class_toString_b0:
    lea rcx, adenc_aden_lang_Class_toString_trace_s0
    mov edx, adenc_aden_lang_Class_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Class_name]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Class_toString_epilogue
adenc_aden_lang_Class_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Class_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Class_toString endp

end
