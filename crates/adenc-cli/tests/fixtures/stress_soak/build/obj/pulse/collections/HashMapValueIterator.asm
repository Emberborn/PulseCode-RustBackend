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
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_next:proc
extrn pulsec_pulse_collections_HashMap_get__Object:proc
extrn pulsec_pulse_collections_HashMap_keyIterator:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
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

public pulsec_fld_pulse_collections_HashMapValueIterator_map
public pulsec_fld_pulse_collections_HashMapValueIterator_map_heap_owned
public pulsec_fld_pulse_collections_HashMapValueIterator_keys
public pulsec_fld_pulse_collections_HashMapValueIterator_keys_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_HashMapValueIterator dd 0
pulsec_fcap_pulse_collections_HashMapValueIterator dd 63
pulsec_fld_pulse_collections_HashMapValueIterator_map_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashMapValueIterator_map dq pulsec_fld_pulse_collections_HashMapValueIterator_map_tbl
pulsec_fld_pulse_collections_HashMapValueIterator_map_heap_owned dd 0
pulsec_fld_pulse_collections_HashMapValueIterator_keys_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashMapValueIterator_keys dq pulsec_fld_pulse_collections_HashMapValueIterator_keys_tbl
pulsec_fld_pulse_collections_HashMapValueIterator_keys_heap_owned dd 0
trace_m0 db "pulse.collections.HashMapValueIterator.HashMapValueIterator"
trace_m0_len equ 59
trace_m1 db "pulse.collections.HashMapValueIterator.hasNext"
trace_m1_len equ 46
trace_m2 db "pulse.collections.HashMapValueIterator.next"
trace_m2_len equ 43

.code
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_HashMapValueIterator]
    jbe pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_HashMapValueIterator]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_fail
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
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    xor esi, esi
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    xor esi, esi
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_HashMapValueIterator], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_alloc_fail:
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMapValueIterator_ensure endp

pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_teardown endp
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_scan_edges endp
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMapValueIterator_arc_invalidate_edges endp
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_ctor_reuse
    mov ecx, 11
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_HashMapValueIterator_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_ctor_ready
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je HashMapValueIterator_HashMapValueIterator_vd1_7_null
    call pulsec_pulse_collections_HashMap_keyIterator
    jmp HashMapValueIterator_HashMapValueIterator_vd1_7_done
HashMapValueIterator_HashMapValueIterator_vd1_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapValueIterator_HashMapValueIterator_vd1_7_done:
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_epilogue
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_epilogue:
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapValueIterator_HashMapValueIterator__HashMap endp

pulsec_pulse_collections_HashMapValueIterator_hasNext proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapValueIterator_hasNext_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashMapValueIterator_hasNext_vd0_3_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapValueIterator_hasNext_vd0_3_type
    cmp eax, 9
    je HashMapValueIterator_hasNext_vd0_3_assign_ok
    cmp eax, 11
    je HashMapValueIterator_hasNext_vd0_3_assign_ok
    cmp eax, 15
    je HashMapValueIterator_hasNext_vd0_3_assign_ok
    jmp HashMapValueIterator_hasNext_vd0_3_type
HashMapValueIterator_hasNext_vd0_3_assign_ok:
    cmp eax, 9
    je HashMapValueIterator_hasNext_vd0_3_ovr0
    cmp eax, 11
    je HashMapValueIterator_hasNext_vd0_3_ovr1
    cmp eax, 15
    je HashMapValueIterator_hasNext_vd0_3_ovr2
    jmp HashMapValueIterator_hasNext_vd0_3_default
HashMapValueIterator_hasNext_vd0_3_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMapValueIterator_hasNext_vd0_3_done
HashMapValueIterator_hasNext_vd0_3_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMapValueIterator_hasNext_vd0_3_done
HashMapValueIterator_hasNext_vd0_3_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMapValueIterator_hasNext_vd0_3_done
HashMapValueIterator_hasNext_vd0_3_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMapValueIterator_hasNext_vd0_3_done
HashMapValueIterator_hasNext_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapValueIterator_hasNext_vd0_3_done
HashMapValueIterator_hasNext_vd0_3_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapValueIterator_hasNext_vd0_3_done:
    mov eax, eax
    jmp pulsec_pulse_collections_HashMapValueIterator_hasNext_epilogue
pulsec_pulse_collections_HashMapValueIterator_hasNext_epilogue:
pulsec_pulse_collections_HashMapValueIterator_hasNext_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMapValueIterator_hasNext endp

pulsec_pulse_collections_HashMapValueIterator_next proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMapValueIterator_next_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_keys]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je HashMapValueIterator_next_vd0_3_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapValueIterator_next_vd0_3_type
    cmp eax, 9
    je HashMapValueIterator_next_vd0_3_assign_ok
    cmp eax, 11
    je HashMapValueIterator_next_vd0_3_assign_ok
    cmp eax, 15
    je HashMapValueIterator_next_vd0_3_assign_ok
    jmp HashMapValueIterator_next_vd0_3_type
HashMapValueIterator_next_vd0_3_assign_ok:
    cmp eax, 9
    je HashMapValueIterator_next_vd0_3_ovr0
    cmp eax, 11
    je HashMapValueIterator_next_vd0_3_ovr1
    cmp eax, 15
    je HashMapValueIterator_next_vd0_3_ovr2
    jmp HashMapValueIterator_next_vd0_3_default
HashMapValueIterator_next_vd0_3_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMapValueIterator_next_vd0_3_done
HashMapValueIterator_next_vd0_3_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMapValueIterator_next_vd0_3_done
HashMapValueIterator_next_vd0_3_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMapValueIterator_next_vd0_3_done
HashMapValueIterator_next_vd0_3_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMapValueIterator_next_vd0_3_done
HashMapValueIterator_next_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapValueIterator_next_vd0_3_done
HashMapValueIterator_next_vd0_3_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapValueIterator_next_vd0_3_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapValueIterator_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je HashMapValueIterator_next_vd1_8_null
    call pulsec_pulse_collections_HashMap_get__Object
    jmp HashMapValueIterator_next_vd1_8_done
HashMapValueIterator_next_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapValueIterator_next_vd1_8_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMapValueIterator_next_epilogue
pulsec_pulse_collections_HashMapValueIterator_next_epilogue:
pulsec_pulse_collections_HashMapValueIterator_next_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapValueIterator_next endp

end
