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
extrn pulsec_pulse_collections_ArrayList_ArrayList:proc
extrn pulsec_pulse_collections_ArrayList_add__Object:proc
extrn pulsec_pulse_collections_ArrayList_contains__Object:proc
extrn pulsec_pulse_collections_ArrayList_iterator:proc
extrn pulsec_pulse_collections_Collection_contains__Object:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_next:proc
extrn pulsec_pulse_collections_HashMapValueIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapValueIterator_next:proc
extrn pulsec_pulse_collections_HashMapValuesView_contains__Object:proc
extrn pulsec_pulse_collections_HashMapValuesView_iterator:proc
extrn pulsec_pulse_collections_HashMap_clear:proc
extrn pulsec_pulse_collections_HashMap_containsKey__Object:proc
extrn pulsec_pulse_collections_HashMap_containsKey__String:proc
extrn pulsec_pulse_collections_HashMap_isEmpty:proc
extrn pulsec_pulse_collections_HashMap_keyIterator:proc
extrn pulsec_pulse_collections_HashMap_remove__Object:proc
extrn pulsec_pulse_collections_HashMap_size:proc
extrn pulsec_pulse_collections_HashSet_contains__Object:proc
extrn pulsec_pulse_collections_HashSet_iterator:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_collections_LinkedList_contains__Object:proc
extrn pulsec_pulse_collections_LinkedList_iterator:proc
extrn pulsec_pulse_collections_Set_contains__String:proc
extrn pulsec_pulse_lang_Iterable_iterator:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
extrn pulsec_pulse_lang_Throwable_panic:proc
extrn pulsec_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String:proc
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

public pulsec_fld_pulse_collections_HashMapKeySetView_map
public pulsec_fld_pulse_collections_HashMapKeySetView_map_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_HashMapKeySetView dd 0
pulsec_fcap_pulse_collections_HashMapKeySetView dd 63
pulsec_fld_pulse_collections_HashMapKeySetView_map_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashMapKeySetView_map dq pulsec_fld_pulse_collections_HashMapKeySetView_map_tbl
pulsec_fld_pulse_collections_HashMapKeySetView_map_heap_owned dd 0
trace_m0 db "pulse.collections.HashMapKeySetView.HashMapKeySetView"
trace_m0_len equ 53
trace_m1 db "pulse.collections.HashMapKeySetView.failUnsupportedAdd"
trace_m1_len equ 54
trace_m2 db "pulse.collections.HashMapKeySetView.size"
trace_m2_len equ 40
trace_m3 db "pulse.collections.HashMapKeySetView.isEmpty"
trace_m3_len equ 43
trace_m4 db "pulse.collections.HashMapKeySetView.clear"
trace_m4_len equ 41
trace_m5 db "pulse.collections.HashMapKeySetView.add"
trace_m5_len equ 39
trace_m6 db "pulse.collections.HashMapKeySetView.add"
trace_m6_len equ 39
trace_m7 db "pulse.collections.HashMapKeySetView.contains"
trace_m7_len equ 44
trace_m8 db "pulse.collections.HashMapKeySetView.contains"
trace_m8_len equ 44
trace_m9 db "pulse.collections.HashMapKeySetView.remove"
trace_m9_len equ 42
trace_m10 db "pulse.collections.HashMapKeySetView.remove"
trace_m10_len equ 42
trace_m11 db "pulse.collections.HashMapKeySetView.containsAll"
trace_m11_len equ 47
trace_m12 db "pulse.collections.HashMapKeySetView.addAll"
trace_m12_len equ 42
trace_m13 db "pulse.collections.HashMapKeySetView.removeAll"
trace_m13_len equ 45
trace_m14 db "pulse.collections.HashMapKeySetView.retainAll"
trace_m14_len equ 45
trace_m15 db "pulse.collections.HashMapKeySetView.iterator"
trace_m15_len equ 44
msg0 db "HashMap keySet view does not support add"
msg0_len equ 40

.code
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_HashMapKeySetView]
    jbe pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_HashMapKeySetView]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_fail
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
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    xor esi, esi
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_HashMapKeySetView], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_alloc_fail:
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMapKeySetView_ensure endp

pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_teardown endp
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_scan_edges endp
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMapKeySetView_arc_invalidate_edges endp
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap proc
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
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_ctor_reuse
    mov ecx, 7
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_HashMapKeySetView_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_ctor_ready
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_epilogue
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_epilogue:
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap endp

pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_lang_UnsupportedOperationException_UnsupportedOperationException__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+64], rax
    mov qword ptr [rsp+136], rdx
    mov qword ptr [rsp+144], r8
    mov qword ptr [rsp+152], r9
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rdx, qword ptr [rsp+136]
    mov r8, qword ptr [rsp+144]
    mov r9, qword ptr [rsp+152]
    test rcx, rcx
    je pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_vd_stmt_0_1_2_null
    call pulsec_pulse_lang_Throwable_panic
    jmp pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_vd_stmt_0_1_2_done
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_vd_stmt_0_1_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_vd_stmt_0_1_2_done:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_epilogue
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_epilogue:
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd endp

pulsec_pulse_collections_HashMapKeySetView_size proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapKeySetView_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashMapKeySetView_size_vd0_3_null
    call pulsec_pulse_collections_HashMap_size
    jmp HashMapKeySetView_size_vd0_3_done
HashMapKeySetView_size_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_size_vd0_3_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_HashMapKeySetView_size_epilogue
pulsec_pulse_collections_HashMapKeySetView_size_epilogue:
pulsec_pulse_collections_HashMapKeySetView_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMapKeySetView_size endp

pulsec_pulse_collections_HashMapKeySetView_isEmpty proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapKeySetView_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashMapKeySetView_isEmpty_vd0_3_null
    call pulsec_pulse_collections_HashMap_isEmpty
    jmp HashMapKeySetView_isEmpty_vd0_3_done
HashMapKeySetView_isEmpty_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_isEmpty_vd0_3_done:
    mov eax, eax
    jmp pulsec_pulse_collections_HashMapKeySetView_isEmpty_epilogue
pulsec_pulse_collections_HashMapKeySetView_isEmpty_epilogue:
pulsec_pulse_collections_HashMapKeySetView_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMapKeySetView_isEmpty endp

pulsec_pulse_collections_HashMapKeySetView_clear proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMapKeySetView_clear_b0:
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    test rcx, rcx
    je pulsec_pulse_collections_HashMapKeySetView_clear_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_HashMap_clear
    jmp pulsec_pulse_collections_HashMapKeySetView_clear_vd_stmt_0_0_0_done
pulsec_pulse_collections_HashMapKeySetView_clear_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMapKeySetView_clear_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMapKeySetView_clear_epilogue
pulsec_pulse_collections_HashMapKeySetView_clear_epilogue:
pulsec_pulse_collections_HashMapKeySetView_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMapKeySetView_clear endp

pulsec_pulse_collections_HashMapKeySetView_add__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMapKeySetView_add__Object_b0:
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd
    mov eax, 0
    jmp pulsec_pulse_collections_HashMapKeySetView_add__Object_epilogue
pulsec_pulse_collections_HashMapKeySetView_add__Object_epilogue:
pulsec_pulse_collections_HashMapKeySetView_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_add__Object endp

pulsec_pulse_collections_HashMapKeySetView_add__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMapKeySetView_add__String_b0:
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd
    mov eax, 0
    jmp pulsec_pulse_collections_HashMapKeySetView_add__String_epilogue
pulsec_pulse_collections_HashMapKeySetView_add__String_epilogue:
pulsec_pulse_collections_HashMapKeySetView_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_add__String endp

pulsec_pulse_collections_HashMapKeySetView_contains__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMapKeySetView_contains__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
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
    je HashMapKeySetView_contains_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashMapKeySetView_contains_vd0_4_done
HashMapKeySetView_contains_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_contains_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMapKeySetView_contains__Object_epilogue
pulsec_pulse_collections_HashMapKeySetView_contains__Object_epilogue:
pulsec_pulse_collections_HashMapKeySetView_contains__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_contains__Object endp

pulsec_pulse_collections_HashMapKeySetView_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMapKeySetView_contains__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
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
    je HashMapKeySetView_contains_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMapKeySetView_contains_vd0_4_done
HashMapKeySetView_contains_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_contains_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMapKeySetView_contains__String_epilogue
pulsec_pulse_collections_HashMapKeySetView_contains__String_epilogue:
pulsec_pulse_collections_HashMapKeySetView_contains__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_contains__String endp

pulsec_pulse_collections_HashMapKeySetView_remove__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
pulsec_pulse_collections_HashMapKeySetView_remove__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashMapKeySetView_remove_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashMapKeySetView_remove_vd0_4_done
HashMapKeySetView_remove_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_remove_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    test rcx, rcx
    je pulsec_pulse_collections_HashMapKeySetView_remove__Object_vd_stmt_0_1_2_null
    call pulsec_pulse_collections_HashMap_remove__Object
    jmp pulsec_pulse_collections_HashMapKeySetView_remove__Object_vd_stmt_0_1_2_done
pulsec_pulse_collections_HashMapKeySetView_remove__Object_vd_stmt_0_1_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMapKeySetView_remove__Object_vd_stmt_0_1_2_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMapKeySetView_remove__Object_epilogue
pulsec_pulse_collections_HashMapKeySetView_remove__Object_epilogue:
pulsec_pulse_collections_HashMapKeySetView_remove__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_remove__Object endp

pulsec_pulse_collections_HashMapKeySetView_remove__String proc
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
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
pulsec_pulse_collections_HashMapKeySetView_remove__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashMapKeySetView_remove_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMapKeySetView_remove_vd0_4_done
HashMapKeySetView_remove_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_remove_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    test rcx, rcx
    je pulsec_pulse_collections_HashMapKeySetView_remove__String_vd_stmt_0_1_2_null
    call pulsec_pulse_collections_HashMap_remove__Object
    jmp pulsec_pulse_collections_HashMapKeySetView_remove__String_vd_stmt_0_1_2_done
pulsec_pulse_collections_HashMapKeySetView_remove__String_vd_stmt_0_1_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMapKeySetView_remove__String_vd_stmt_0_1_2_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMapKeySetView_remove__String_epilogue
pulsec_pulse_collections_HashMapKeySetView_remove__String_epilogue:
pulsec_pulse_collections_HashMapKeySetView_remove__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_remove__String endp

pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashMapKeySetView_containsAll_vd0_2_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_containsAll_vd0_2_type
    cmp eax, 1
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 3
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 7
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 9
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 10
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 11
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 14
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 17
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    cmp eax, 18
    je HashMapKeySetView_containsAll_vd0_2_assign_ok
    jmp HashMapKeySetView_containsAll_vd0_2_type
HashMapKeySetView_containsAll_vd0_2_assign_ok:
    cmp eax, 1
    je HashMapKeySetView_containsAll_vd0_2_ovr0
    cmp eax, 7
    je HashMapKeySetView_containsAll_vd0_2_ovr1
    cmp eax, 9
    je HashMapKeySetView_containsAll_vd0_2_ovr2
    cmp eax, 10
    je HashMapKeySetView_containsAll_vd0_2_ovr3
    cmp eax, 11
    je HashMapKeySetView_containsAll_vd0_2_ovr4
    jmp HashMapKeySetView_containsAll_vd0_2_default
HashMapKeySetView_containsAll_vd0_2_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_containsAll_vd0_2_done
HashMapKeySetView_containsAll_vd0_2_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_containsAll_vd0_2_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashMapKeySetView_containsAll_vd1_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_containsAll_vd1_5_type
    cmp eax, 6
    je HashMapKeySetView_containsAll_vd1_5_assign_ok
    cmp eax, 8
    je HashMapKeySetView_containsAll_vd1_5_assign_ok
    cmp eax, 12
    je HashMapKeySetView_containsAll_vd1_5_assign_ok
    jmp HashMapKeySetView_containsAll_vd1_5_type
HashMapKeySetView_containsAll_vd1_5_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_containsAll_vd1_5_ovr0
    cmp eax, 8
    je HashMapKeySetView_containsAll_vd1_5_ovr1
    cmp eax, 12
    je HashMapKeySetView_containsAll_vd1_5_ovr2
    jmp HashMapKeySetView_containsAll_vd1_5_default
HashMapKeySetView_containsAll_vd1_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMapKeySetView_containsAll_vd1_5_done
HashMapKeySetView_containsAll_vd1_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMapKeySetView_containsAll_vd1_5_done
HashMapKeySetView_containsAll_vd1_5_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMapKeySetView_containsAll_vd1_5_done
HashMapKeySetView_containsAll_vd1_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMapKeySetView_containsAll_vd1_5_done
HashMapKeySetView_containsAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_containsAll_vd1_5_done
HashMapKeySetView_containsAll_vd1_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_containsAll_vd1_5_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b2
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b3
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je HashMapKeySetView_containsAll_vd2_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_containsAll_vd2_10_type
    cmp eax, 6
    je HashMapKeySetView_containsAll_vd2_10_assign_ok
    cmp eax, 8
    je HashMapKeySetView_containsAll_vd2_10_assign_ok
    cmp eax, 12
    je HashMapKeySetView_containsAll_vd2_10_assign_ok
    jmp HashMapKeySetView_containsAll_vd2_10_type
HashMapKeySetView_containsAll_vd2_10_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_containsAll_vd2_10_ovr0
    cmp eax, 8
    je HashMapKeySetView_containsAll_vd2_10_ovr1
    cmp eax, 12
    je HashMapKeySetView_containsAll_vd2_10_ovr2
    jmp HashMapKeySetView_containsAll_vd2_10_default
HashMapKeySetView_containsAll_vd2_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMapKeySetView_containsAll_vd2_10_done
HashMapKeySetView_containsAll_vd2_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMapKeySetView_containsAll_vd2_10_done
HashMapKeySetView_containsAll_vd2_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMapKeySetView_containsAll_vd2_10_done
HashMapKeySetView_containsAll_vd2_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMapKeySetView_containsAll_vd2_10_done
HashMapKeySetView_containsAll_vd2_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_containsAll_vd2_10_done
HashMapKeySetView_containsAll_vd2_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_containsAll_vd2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMapKeySetView_contains__Object
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b4
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b5
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b3:
    mov eax, 1
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_epilogue
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_epilogue
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b5:
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b6
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b6:
    jmp pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_epilogue:
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMapKeySetView_containsAll__Collection endp

pulsec_pulse_collections_HashMapKeySetView_addAll__Collection proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMapKeySetView_addAll__Collection_b0:
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashMapKeySetView_failUnsupportedAdd
    mov eax, 0
    jmp pulsec_pulse_collections_HashMapKeySetView_addAll__Collection_epilogue
pulsec_pulse_collections_HashMapKeySetView_addAll__Collection_epilogue:
pulsec_pulse_collections_HashMapKeySetView_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMapKeySetView_addAll__Collection endp

pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je HashMapKeySetView_removeAll_vd1_3_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_removeAll_vd1_3_type
    cmp eax, 1
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 3
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 7
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 9
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 10
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 11
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 14
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 17
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    cmp eax, 18
    je HashMapKeySetView_removeAll_vd1_3_assign_ok
    jmp HashMapKeySetView_removeAll_vd1_3_type
HashMapKeySetView_removeAll_vd1_3_assign_ok:
    cmp eax, 1
    je HashMapKeySetView_removeAll_vd1_3_ovr0
    cmp eax, 7
    je HashMapKeySetView_removeAll_vd1_3_ovr1
    cmp eax, 9
    je HashMapKeySetView_removeAll_vd1_3_ovr2
    cmp eax, 10
    je HashMapKeySetView_removeAll_vd1_3_ovr3
    cmp eax, 11
    je HashMapKeySetView_removeAll_vd1_3_ovr4
    jmp HashMapKeySetView_removeAll_vd1_3_default
HashMapKeySetView_removeAll_vd1_3_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_removeAll_vd1_3_done
HashMapKeySetView_removeAll_vd1_3_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_removeAll_vd1_3_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je HashMapKeySetView_removeAll_vd2_6_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_removeAll_vd2_6_type
    cmp eax, 6
    je HashMapKeySetView_removeAll_vd2_6_assign_ok
    cmp eax, 8
    je HashMapKeySetView_removeAll_vd2_6_assign_ok
    cmp eax, 12
    je HashMapKeySetView_removeAll_vd2_6_assign_ok
    jmp HashMapKeySetView_removeAll_vd2_6_type
HashMapKeySetView_removeAll_vd2_6_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_removeAll_vd2_6_ovr0
    cmp eax, 8
    je HashMapKeySetView_removeAll_vd2_6_ovr1
    cmp eax, 12
    je HashMapKeySetView_removeAll_vd2_6_ovr2
    jmp HashMapKeySetView_removeAll_vd2_6_default
HashMapKeySetView_removeAll_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMapKeySetView_removeAll_vd2_6_done
HashMapKeySetView_removeAll_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMapKeySetView_removeAll_vd2_6_done
HashMapKeySetView_removeAll_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMapKeySetView_removeAll_vd2_6_done
HashMapKeySetView_removeAll_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMapKeySetView_removeAll_vd2_6_done
HashMapKeySetView_removeAll_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_removeAll_vd2_6_done
HashMapKeySetView_removeAll_vd2_6_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_removeAll_vd2_6_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b2
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b3
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je HashMapKeySetView_removeAll_vd3_11_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_removeAll_vd3_11_type
    cmp eax, 6
    je HashMapKeySetView_removeAll_vd3_11_assign_ok
    cmp eax, 8
    je HashMapKeySetView_removeAll_vd3_11_assign_ok
    cmp eax, 12
    je HashMapKeySetView_removeAll_vd3_11_assign_ok
    jmp HashMapKeySetView_removeAll_vd3_11_type
HashMapKeySetView_removeAll_vd3_11_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_removeAll_vd3_11_ovr0
    cmp eax, 8
    je HashMapKeySetView_removeAll_vd3_11_ovr1
    cmp eax, 12
    je HashMapKeySetView_removeAll_vd3_11_ovr2
    jmp HashMapKeySetView_removeAll_vd3_11_default
HashMapKeySetView_removeAll_vd3_11_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMapKeySetView_removeAll_vd3_11_done
HashMapKeySetView_removeAll_vd3_11_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMapKeySetView_removeAll_vd3_11_done
HashMapKeySetView_removeAll_vd3_11_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMapKeySetView_removeAll_vd3_11_done
HashMapKeySetView_removeAll_vd3_11_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMapKeySetView_removeAll_vd3_11_done
HashMapKeySetView_removeAll_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_removeAll_vd3_11_done
HashMapKeySetView_removeAll_vd3_11_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_removeAll_vd3_11_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_HashMapKeySetView_remove__Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b4
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b5
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b3:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_epilogue
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b4:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b6
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b5:
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b6
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b6:
    jmp pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_epilogue:
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMapKeySetView_removeAll__Collection endp

pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b0:
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd2_6_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_retainAll_vd2_6_type
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd2_6_assign_ok
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd2_6_assign_ok
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd2_6_assign_ok
    jmp HashMapKeySetView_retainAll_vd2_6_type
HashMapKeySetView_retainAll_vd2_6_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd2_6_ovr0
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd2_6_ovr1
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd2_6_ovr2
    jmp HashMapKeySetView_retainAll_vd2_6_default
HashMapKeySetView_retainAll_vd2_6_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd2_6_done
HashMapKeySetView_retainAll_vd2_6_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd2_6_done
HashMapKeySetView_retainAll_vd2_6_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd2_6_done
HashMapKeySetView_retainAll_vd2_6_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMapKeySetView_retainAll_vd2_6_done
HashMapKeySetView_retainAll_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_retainAll_vd2_6_done
HashMapKeySetView_retainAll_vd2_6_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_retainAll_vd2_6_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b2
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b3
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd3_11_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_retainAll_vd3_11_type
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd3_11_assign_ok
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd3_11_assign_ok
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd3_11_assign_ok
    jmp HashMapKeySetView_retainAll_vd3_11_type
HashMapKeySetView_retainAll_vd3_11_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd3_11_ovr0
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd3_11_ovr1
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd3_11_ovr2
    jmp HashMapKeySetView_retainAll_vd3_11_default
HashMapKeySetView_retainAll_vd3_11_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMapKeySetView_retainAll_vd3_11_done
HashMapKeySetView_retainAll_vd3_11_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMapKeySetView_retainAll_vd3_11_done
HashMapKeySetView_retainAll_vd3_11_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMapKeySetView_retainAll_vd3_11_done
HashMapKeySetView_retainAll_vd3_11_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMapKeySetView_retainAll_vd3_11_done
HashMapKeySetView_retainAll_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_retainAll_vd3_11_done
HashMapKeySetView_retainAll_vd3_11_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_retainAll_vd3_11_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov qword ptr [rsp+168], rdx
    mov qword ptr [rsp+176], r8
    mov qword ptr [rsp+184], r9
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    mov rdx, qword ptr [rsp+168]
    mov r8, qword ptr [rsp+176]
    mov r9, qword ptr [rsp+184]
    test rcx, rcx
    je pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_vd_stmt_2_3_0_null
    call pulsec_pulse_collections_ArrayList_add__Object
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_vd_stmt_2_3_0_done
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_vd_stmt_2_3_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_vd_stmt_2_3_0_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b1
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b3:
    mov eax, 0
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd5_17_null
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashMapKeySetView_retainAll_vd5_17_done
HashMapKeySetView_retainAll_vd5_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_retainAll_vd5_17_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b4
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd6_20_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_retainAll_vd6_20_type
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd6_20_assign_ok
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd6_20_assign_ok
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd6_20_assign_ok
    jmp HashMapKeySetView_retainAll_vd6_20_type
HashMapKeySetView_retainAll_vd6_20_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd6_20_ovr0
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd6_20_ovr1
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd6_20_ovr2
    jmp HashMapKeySetView_retainAll_vd6_20_default
HashMapKeySetView_retainAll_vd6_20_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd6_20_done
HashMapKeySetView_retainAll_vd6_20_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd6_20_done
HashMapKeySetView_retainAll_vd6_20_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMapKeySetView_retainAll_vd6_20_done
HashMapKeySetView_retainAll_vd6_20_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMapKeySetView_retainAll_vd6_20_done
HashMapKeySetView_retainAll_vd6_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_retainAll_vd6_20_done
HashMapKeySetView_retainAll_vd6_20_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_retainAll_vd6_20_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b5
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b6
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd7_23_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_retainAll_vd7_23_type
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd7_23_assign_ok
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd7_23_assign_ok
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd7_23_assign_ok
    jmp HashMapKeySetView_retainAll_vd7_23_type
HashMapKeySetView_retainAll_vd7_23_assign_ok:
    cmp eax, 6
    je HashMapKeySetView_retainAll_vd7_23_ovr0
    cmp eax, 8
    je HashMapKeySetView_retainAll_vd7_23_ovr1
    cmp eax, 12
    je HashMapKeySetView_retainAll_vd7_23_ovr2
    jmp HashMapKeySetView_retainAll_vd7_23_default
HashMapKeySetView_retainAll_vd7_23_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMapKeySetView_retainAll_vd7_23_done
HashMapKeySetView_retainAll_vd7_23_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMapKeySetView_retainAll_vd7_23_done
HashMapKeySetView_retainAll_vd7_23_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMapKeySetView_retainAll_vd7_23_done
HashMapKeySetView_retainAll_vd7_23_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMapKeySetView_retainAll_vd7_23_done
HashMapKeySetView_retainAll_vd7_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_retainAll_vd7_23_done
HashMapKeySetView_retainAll_vd7_23_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_retainAll_vd7_23_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je HashMapKeySetView_retainAll_vd8_27_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMapKeySetView_retainAll_vd8_27_type
    cmp eax, 1
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 3
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 7
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 9
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 10
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 11
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 14
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 17
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    cmp eax, 18
    je HashMapKeySetView_retainAll_vd8_27_assign_ok
    jmp HashMapKeySetView_retainAll_vd8_27_type
HashMapKeySetView_retainAll_vd8_27_assign_ok:
    cmp eax, 1
    je HashMapKeySetView_retainAll_vd8_27_ovr0
    cmp eax, 7
    je HashMapKeySetView_retainAll_vd8_27_ovr1
    cmp eax, 9
    je HashMapKeySetView_retainAll_vd8_27_ovr2
    cmp eax, 10
    je HashMapKeySetView_retainAll_vd8_27_ovr3
    cmp eax, 11
    je HashMapKeySetView_retainAll_vd8_27_ovr4
    cmp eax, 18
    je HashMapKeySetView_retainAll_vd8_27_ovr5
    jmp HashMapKeySetView_retainAll_vd8_27_default
HashMapKeySetView_retainAll_vd8_27_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Set_contains__String
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_contains__Object
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMapKeySetView_retainAll_vd8_27_done
HashMapKeySetView_retainAll_vd8_27_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMapKeySetView_retainAll_vd8_27_done:
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b7
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b8
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b6:
    mov eax, dword ptr [rsp+80]
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_epilogue
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b7:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_collections_HashMapKeySetView_remove__Object
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    test eax, eax
    jne pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b10
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b11
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b8:
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b9
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b9:
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b4
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b10:
    mov eax, 1
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b12
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b11:
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b12
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b12:
    jmp pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_b9
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_epilogue:
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_collections_HashMapKeySetView_retainAll__Collection endp

pulsec_pulse_collections_HashMapKeySetView_iterator proc
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
pulsec_pulse_collections_HashMapKeySetView_iterator_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMapKeySetView_map]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashMapKeySetView_iterator_vd0_3_null
    call pulsec_pulse_collections_HashMap_keyIterator
    jmp HashMapKeySetView_iterator_vd0_3_done
HashMapKeySetView_iterator_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMapKeySetView_iterator_vd0_3_done:
    jmp pulsec_pulse_collections_HashMapKeySetView_iterator_epilogue
pulsec_pulse_collections_HashMapKeySetView_iterator_epilogue:
pulsec_pulse_collections_HashMapKeySetView_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMapKeySetView_iterator endp

end
