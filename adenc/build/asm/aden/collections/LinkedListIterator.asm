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
extrn adenc_aden_collections_LinkedListNode_getNext:proc
extrn adenc_aden_collections_LinkedListNode_getValue:proc
extrn adenc_rt_panic:proc
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

public adenc_fld_aden_collections_LinkedListIterator_current
public adenc_fld_aden_collections_LinkedListIterator_current_heap_owned

.data
written dq 0
adenc_objc_aden_collections_LinkedListIterator dd 0
adenc_fcap_aden_collections_LinkedListIterator dd 63
adenc_fld_aden_collections_LinkedListIterator_current_tbl dq 64 dup(0)
adenc_fld_aden_collections_LinkedListIterator_current dq adenc_fld_aden_collections_LinkedListIterator_current_tbl
adenc_fld_aden_collections_LinkedListIterator_current_heap_owned dd 0
trace_m0 db "aden.collections.LinkedListIterator.LinkedListIterator"
trace_m0_len equ 54
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115
    db 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110, 58, 49, 55, 41
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_trace_s0_len equ 82
trace_m2 db "aden.collections.LinkedListIterator.hasNext"
trace_m2_len equ 43
adenc_aden_collections_LinkedListIterator_hasNext_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 104, 97, 115, 78, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97
    db 100, 101, 110, 58, 50, 52, 41
adenc_aden_collections_LinkedListIterator_hasNext_trace_s0_len equ 71
trace_m4 db "aden.collections.LinkedListIterator.next"
trace_m4_len equ 40
adenc_aden_collections_LinkedListIterator_next_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 49, 41
adenc_aden_collections_LinkedListIterator_next_trace_s0_len equ 68
adenc_aden_collections_LinkedListIterator_next_trace_s1 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 50, 41
adenc_aden_collections_LinkedListIterator_next_trace_s1_len equ 68
adenc_aden_collections_LinkedListIterator_next_trace_s2 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 51, 41
adenc_aden_collections_LinkedListIterator_next_trace_s2_len equ 68
adenc_aden_collections_LinkedListIterator_next_trace_s3 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 53, 41
adenc_aden_collections_LinkedListIterator_next_trace_s3_len equ 68
adenc_aden_collections_LinkedListIterator_next_trace_s4 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 54, 41
adenc_aden_collections_LinkedListIterator_next_trace_s4_len equ 68
adenc_aden_collections_LinkedListIterator_next_trace_s5 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97
    db 116, 111, 114, 46, 110, 101, 120, 116, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 73, 116, 101, 114, 97, 116, 111, 114, 46, 97, 100, 101, 110
    db 58, 51, 55, 41
adenc_aden_collections_LinkedListIterator_next_trace_s5_len equ 68
msg0 db "Iterator is exhausted"
msg0_len equ 21

.code
adenc_fcap_aden_collections_LinkedListIterator_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_collections_LinkedListIterator]
    jbe adenc_fcap_aden_collections_LinkedListIterator_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_collections_LinkedListIterator]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListIterator_ensure_fail
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
    jz adenc_fcap_aden_collections_LinkedListIterator_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_copy_loop
adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListIterator_current_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListIterator_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListIterator_current], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListIterator_current_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_collections_LinkedListIterator], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_collections_LinkedListIterator_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_collections_LinkedListIterator_ensure_alloc_fail:
adenc_fcap_aden_collections_LinkedListIterator_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_collections_LinkedListIterator_ensure endp

adenc_fcap_aden_collections_LinkedListIterator_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListIterator_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListIterator_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_collections_LinkedListIterator_arc_teardown_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListIterator_arc_teardown_done:
    ret
adenc_fcap_aden_collections_LinkedListIterator_arc_teardown endp
adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges_done:
    ret
adenc_fcap_aden_collections_LinkedListIterator_arc_scan_edges endp
adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges_done:
    ret
adenc_fcap_aden_collections_LinkedListIterator_arc_invalidate_edges endp
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode proc
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
    jne adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_ctor_reuse
    mov ecx, 5
    call adenc_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_fcap_aden_collections_LinkedListIterator_ensure
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_ctor_ready
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_b0:
    lea rcx, adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_trace_s0
    mov edx, adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_trace_s0_len
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
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_epilogue
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListIterator_LinkedListIterator__LinkedListNode endp

adenc_aden_collections_LinkedListIterator_hasNext proc
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
adenc_aden_collections_LinkedListIterator_hasNext_b0:
    lea rcx, adenc_aden_collections_LinkedListIterator_hasNext_trace_s0
    mov edx, adenc_aden_collections_LinkedListIterator_hasNext_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    setne al
    movzx eax, al
    jmp adenc_aden_collections_LinkedListIterator_hasNext_epilogue
adenc_aden_collections_LinkedListIterator_hasNext_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListIterator_hasNext_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListIterator_hasNext endp

adenc_aden_collections_LinkedListIterator_next proc
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
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
adenc_aden_collections_LinkedListIterator_next_b0:
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s0
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_collections_LinkedListIterator_next_b1
    jmp adenc_aden_collections_LinkedListIterator_next_b2
adenc_aden_collections_LinkedListIterator_next_b1:
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s1
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
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
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s2
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s2_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    jmp adenc_aden_collections_LinkedListIterator_next_epilogue
adenc_aden_collections_LinkedListIterator_next_b2:
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s0
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_LinkedListIterator_next_b3
adenc_aden_collections_LinkedListIterator_next_b3:
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s3
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_collections_LinkedListNode_getValue
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s4
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_collections_LinkedListNode_getNext
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListIterator_current]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_collections_LinkedListIterator_next_trace_s5
    mov edx, adenc_aden_collections_LinkedListIterator_next_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_collections_LinkedListIterator_next_epilogue
adenc_aden_collections_LinkedListIterator_next_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_LinkedListIterator_next_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_LinkedListIterator_next endp

end
