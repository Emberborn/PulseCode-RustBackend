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
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_ArrayList_ArrayList:proc
extrn pulsec_pulse_collections_ArrayList_addAll__Collection:proc
extrn pulsec_pulse_collections_ArrayList_iterator:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_next:proc
extrn pulsec_pulse_collections_HashMapKeySetView_iterator:proc
extrn pulsec_pulse_collections_HashMapValueIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapValueIterator_next:proc
extrn pulsec_pulse_collections_HashMapValuesView_iterator:proc
extrn pulsec_pulse_collections_HashMap_HashMap:proc
extrn pulsec_pulse_collections_HashMap_clear:proc
extrn pulsec_pulse_collections_HashMap_containsKey__Object:proc
extrn pulsec_pulse_collections_HashMap_isEmpty:proc
extrn pulsec_pulse_collections_HashMap_keyIterator:proc
extrn pulsec_pulse_collections_HashMap_put__Object_Object:proc
extrn pulsec_pulse_collections_HashMap_remove__Object:proc
extrn pulsec_pulse_collections_HashMap_size:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_collections_LinkedList_iterator:proc
extrn pulsec_pulse_lang_Iterable_iterator:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_substring__int_int:proc
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

public pulsec_fld_pulse_collections_HashSet_entries
public pulsec_fld_pulse_collections_HashSet_entries_heap_owned
public pulsec_fld_pulse_collections_HashSet_present
public pulsec_fld_pulse_collections_HashSet_present_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_HashSet dd 0
pulsec_fcap_pulse_collections_HashSet dd 63
pulsec_fld_pulse_collections_HashSet_entries_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashSet_entries dq pulsec_fld_pulse_collections_HashSet_entries_tbl
pulsec_fld_pulse_collections_HashSet_entries_heap_owned dd 0
pulsec_fld_pulse_collections_HashSet_present_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashSet_present dq pulsec_fld_pulse_collections_HashSet_present_tbl
pulsec_fld_pulse_collections_HashSet_present_heap_owned dd 0
trace_m0 db "pulse.collections.HashSet.HashSet"
trace_m0_len equ 33
trace_m1 db "pulse.collections.HashSet.size"
trace_m1_len equ 30
trace_m2 db "pulse.collections.HashSet.isEmpty"
trace_m2_len equ 33
trace_m3 db "pulse.collections.HashSet.clear"
trace_m3_len equ 31
trace_m4 db "pulse.collections.HashSet.addValue"
trace_m4_len equ 34
trace_m5 db "pulse.collections.HashSet.copyStringValue"
trace_m5_len equ 41
trace_m6 db "pulse.collections.HashSet.addCopiedValue"
trace_m6_len equ 40
trace_m7 db "pulse.collections.HashSet.containsValue"
trace_m7_len equ 39
trace_m8 db "pulse.collections.HashSet.add"
trace_m8_len equ 29
trace_m9 db "pulse.collections.HashSet.addAll"
trace_m9_len equ 32
trace_m10 db "pulse.collections.HashSet.add"
trace_m10_len equ 29
trace_m11 db "pulse.collections.HashSet.remove"
trace_m11_len equ 32
trace_m12 db "pulse.collections.HashSet.remove"
trace_m12_len equ 32
trace_m13 db "pulse.collections.HashSet.containsAll"
trace_m13_len equ 37
trace_m14 db "pulse.collections.HashSet.removeAll"
trace_m14_len equ 35
trace_m15 db "pulse.collections.HashSet.retainAll"
trace_m15_len equ 35
trace_m16 db "pulse.collections.HashSet.contains"
trace_m16_len equ 34
trace_m17 db "pulse.collections.HashSet.contains"
trace_m17_len equ 34
trace_m18 db "pulse.collections.HashSet.iterator"
trace_m18_len equ 34
cidset_4 dd 37
msg0 db "present"
msg0_len equ 7
msg1 db "Invalid cast"
msg1_len equ 12

.code
pulsec_fcap_pulse_collections_HashSet_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_HashSet]
    jbe pulsec_fcap_pulse_collections_HashSet_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_HashSet]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashSet_ensure_fail
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
    jz pulsec_fcap_pulse_collections_HashSet_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    xor esi, esi
pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashSet_entries_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashSet_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashSet_entries], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashSet_entries_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashSet_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    xor esi, esi
pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashSet_present_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashSet_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashSet_present], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashSet_present_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_HashSet], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_HashSet_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashSet_ensure_alloc_fail:
pulsec_fcap_pulse_collections_HashSet_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashSet_ensure endp

pulsec_fcap_pulse_collections_HashSet_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashSet_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashSet_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashSet_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashSet_arc_teardown_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashSet_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_HashSet_arc_teardown endp
pulsec_fcap_pulse_collections_HashSet_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashSet_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_HashSet_arc_scan_edges endp
pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_HashSet_arc_invalidate_edges endp
pulsec_pulse_collections_HashSet_HashSet proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_HashSet_HashSet_ctor_reuse
    mov ecx, 13
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_HashSet_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_collections_HashSet_HashSet_ctor_ready
pulsec_pulse_collections_HashSet_HashSet_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_HashSet_HashSet_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashSet_HashSet_b0:
    xor ecx, ecx
    call pulsec_pulse_collections_HashMap_HashMap
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashSet_HashSet_epilogue
pulsec_pulse_collections_HashSet_HashSet_epilogue:
pulsec_pulse_collections_HashSet_HashSet_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashSet_HashSet endp

pulsec_pulse_collections_HashSet_size proc
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
pulsec_pulse_collections_HashSet_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashSet_size_vd0_3_null
    call pulsec_pulse_collections_HashMap_size
    jmp HashSet_size_vd0_3_done
HashSet_size_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_size_vd0_3_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_HashSet_size_epilogue
pulsec_pulse_collections_HashSet_size_epilogue:
pulsec_pulse_collections_HashSet_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashSet_size endp

pulsec_pulse_collections_HashSet_isEmpty proc
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
pulsec_pulse_collections_HashSet_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashSet_isEmpty_vd0_3_null
    call pulsec_pulse_collections_HashMap_isEmpty
    jmp HashSet_isEmpty_vd0_3_done
HashSet_isEmpty_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_isEmpty_vd0_3_done:
    mov eax, eax
    jmp pulsec_pulse_collections_HashSet_isEmpty_epilogue
pulsec_pulse_collections_HashSet_isEmpty_epilogue:
pulsec_pulse_collections_HashSet_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashSet_isEmpty endp

pulsec_pulse_collections_HashSet_clear proc
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
pulsec_pulse_collections_HashSet_clear_b0:
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_clear_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_HashMap_clear
    jmp pulsec_pulse_collections_HashSet_clear_vd_stmt_0_0_0_done
pulsec_pulse_collections_HashSet_clear_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_clear_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp pulsec_pulse_collections_HashSet_clear_epilogue
pulsec_pulse_collections_HashSet_clear_epilogue:
pulsec_pulse_collections_HashSet_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashSet_clear endp

pulsec_pulse_collections_HashSet_addValue__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_addValue__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
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
    je HashSet_addValue_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashSet_addValue_vd0_4_done
HashSet_addValue_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_addValue_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    test eax, eax
    jne pulsec_pulse_collections_HashSet_addValue__Object_b1
    jmp pulsec_pulse_collections_HashSet_addValue__Object_b2
pulsec_pulse_collections_HashSet_addValue__Object_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashSet_addValue__Object_epilogue
pulsec_pulse_collections_HashSet_addValue__Object_b2:
    jmp pulsec_pulse_collections_HashSet_addValue__Object_b3
pulsec_pulse_collections_HashSet_addValue__Object_b3:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_present]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov qword ptr [rsp+136], rdx
    mov qword ptr [rsp+144], r8
    mov qword ptr [rsp+152], r9
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov rdx, qword ptr [rsp+136]
    mov r8, qword ptr [rsp+144]
    mov r9, qword ptr [rsp+152]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_addValue__Object_vd_stmt_3_2_0_null
    call pulsec_pulse_collections_HashMap_put__Object_Object
    jmp pulsec_pulse_collections_HashSet_addValue__Object_vd_stmt_3_2_0_done
pulsec_pulse_collections_HashSet_addValue__Object_vd_stmt_3_2_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_addValue__Object_vd_stmt_3_2_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, 1
    jmp pulsec_pulse_collections_HashSet_addValue__Object_epilogue
pulsec_pulse_collections_HashSet_addValue__Object_epilogue:
pulsec_pulse_collections_HashSet_addValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_addValue__Object endp

pulsec_pulse_collections_HashSet_copyStringValue__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_copyStringValue__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov eax, 0
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_collections_HashSet_copyStringValue__String_epilogue
pulsec_pulse_collections_HashSet_copyStringValue__String_epilogue:
pulsec_pulse_collections_HashSet_copyStringValue__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_HashSet_copyStringValue__String endp

pulsec_pulse_collections_HashSet_addCopiedValue__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_addCopiedValue__Object_b0:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je HashSet_addCopiedValue_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashSet_addCopiedValue_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashSet_addCopiedValue_instof_0_1_true
HashSet_addCopiedValue_instof_0_1_false:
    xor eax, eax
    jmp HashSet_addCopiedValue_instof_0_1_done
HashSet_addCopiedValue_instof_0_1_true:
    mov eax, 1
HashSet_addCopiedValue_instof_0_1_done:
    test eax, eax
    jne pulsec_pulse_collections_HashSet_addCopiedValue__Object_b1
    jmp pulsec_pulse_collections_HashSet_addCopiedValue__Object_b2
pulsec_pulse_collections_HashSet_addCopiedValue__Object_b1:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je HashSet_addCopiedValue_cast_1_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashSet_addCopiedValue_cast_1_7_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashSet_addCopiedValue_cast_1_7_ok
HashSet_addCopiedValue_cast_1_7_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashSet_addCopiedValue_cast_1_7_done
HashSet_addCopiedValue_cast_1_7_null:
    xor eax, eax
    jmp HashSet_addCopiedValue_cast_1_7_done
HashSet_addCopiedValue_cast_1_7_ok:
    mov rax, qword ptr [rsp+40]
HashSet_addCopiedValue_cast_1_7_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashSet_copyStringValue__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je HashSet_addCopiedValue_vd1_9_null
    call pulsec_pulse_collections_HashSet_add__String
    jmp HashSet_addCopiedValue_vd1_9_done
HashSet_addCopiedValue_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_addCopiedValue_vd1_9_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_addCopiedValue__Object_epilogue
pulsec_pulse_collections_HashSet_addCopiedValue__Object_b2:
    jmp pulsec_pulse_collections_HashSet_addCopiedValue__Object_b3
pulsec_pulse_collections_HashSet_addCopiedValue__Object_b3:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je HashSet_addCopiedValue_vd2_13_null
    call pulsec_pulse_collections_HashSet_add__Object
    jmp HashSet_addCopiedValue_vd2_13_done
HashSet_addCopiedValue_vd2_13_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_addCopiedValue_vd2_13_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_addCopiedValue__Object_epilogue
pulsec_pulse_collections_HashSet_addCopiedValue__Object_epilogue:
pulsec_pulse_collections_HashSet_addCopiedValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_HashSet_addCopiedValue__Object endp

pulsec_pulse_collections_HashSet_containsValue__Object proc
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
pulsec_pulse_collections_HashSet_containsValue__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
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
    je HashSet_containsValue_vd0_4_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashSet_containsValue_vd0_4_done
HashSet_containsValue_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_containsValue_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_containsValue__Object_epilogue
pulsec_pulse_collections_HashSet_containsValue__Object_epilogue:
pulsec_pulse_collections_HashSet_containsValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_containsValue__Object endp

pulsec_pulse_collections_HashSet_add__Object proc
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
pulsec_pulse_collections_HashSet_add__Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashSet_addValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_add__Object_epilogue
pulsec_pulse_collections_HashSet_add__Object_epilogue:
pulsec_pulse_collections_HashSet_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_add__Object endp

pulsec_pulse_collections_HashSet_addAll__Collection proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashSet_addAll__Collection_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashSet_addAll__Collection_b1
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b2
pulsec_pulse_collections_HashSet_addAll__Collection_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_epilogue
pulsec_pulse_collections_HashSet_addAll__Collection_b2:
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b3
pulsec_pulse_collections_HashSet_addAll__Collection_b3:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je HashSet_addAll_vd3_7_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_addAll_vd3_7_type
    cmp eax, 4
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 6
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 10
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 12
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 13
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 14
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 17
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 20
    je HashSet_addAll_vd3_7_assign_ok
    cmp eax, 21
    je HashSet_addAll_vd3_7_assign_ok
    jmp HashSet_addAll_vd3_7_type
HashSet_addAll_vd3_7_assign_ok:
    cmp eax, 4
    je HashSet_addAll_vd3_7_ovr0
    cmp eax, 10
    je HashSet_addAll_vd3_7_ovr1
    cmp eax, 12
    je HashSet_addAll_vd3_7_ovr2
    cmp eax, 13
    je HashSet_addAll_vd3_7_ovr3
    cmp eax, 14
    je HashSet_addAll_vd3_7_ovr4
    jmp HashSet_addAll_vd3_7_default
HashSet_addAll_vd3_7_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_addAll_vd3_7_done
HashSet_addAll_vd3_7_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_addAll_vd3_7_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b4
pulsec_pulse_collections_HashSet_addAll__Collection_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je HashSet_addAll_vd4_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_addAll_vd4_10_type
    cmp eax, 9
    je HashSet_addAll_vd4_10_assign_ok
    cmp eax, 11
    je HashSet_addAll_vd4_10_assign_ok
    cmp eax, 15
    je HashSet_addAll_vd4_10_assign_ok
    jmp HashSet_addAll_vd4_10_type
HashSet_addAll_vd4_10_assign_ok:
    cmp eax, 9
    je HashSet_addAll_vd4_10_ovr0
    cmp eax, 11
    je HashSet_addAll_vd4_10_ovr1
    cmp eax, 15
    je HashSet_addAll_vd4_10_ovr2
    jmp HashSet_addAll_vd4_10_default
HashSet_addAll_vd4_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashSet_addAll_vd4_10_done
HashSet_addAll_vd4_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashSet_addAll_vd4_10_done
HashSet_addAll_vd4_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashSet_addAll_vd4_10_done
HashSet_addAll_vd4_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashSet_addAll_vd4_10_done
HashSet_addAll_vd4_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_addAll_vd4_10_done
HashSet_addAll_vd4_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_addAll_vd4_10_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashSet_addAll__Collection_b5
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b6
pulsec_pulse_collections_HashSet_addAll__Collection_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    test rcx, rcx
    je HashSet_addAll_vd5_15_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_addAll_vd5_15_type
    cmp eax, 9
    je HashSet_addAll_vd5_15_assign_ok
    cmp eax, 11
    je HashSet_addAll_vd5_15_assign_ok
    cmp eax, 15
    je HashSet_addAll_vd5_15_assign_ok
    jmp HashSet_addAll_vd5_15_type
HashSet_addAll_vd5_15_assign_ok:
    cmp eax, 9
    je HashSet_addAll_vd5_15_ovr0
    cmp eax, 11
    je HashSet_addAll_vd5_15_ovr1
    cmp eax, 15
    je HashSet_addAll_vd5_15_ovr2
    jmp HashSet_addAll_vd5_15_default
HashSet_addAll_vd5_15_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashSet_addAll_vd5_15_done
HashSet_addAll_vd5_15_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashSet_addAll_vd5_15_done
HashSet_addAll_vd5_15_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashSet_addAll_vd5_15_done
HashSet_addAll_vd5_15_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashSet_addAll_vd5_15_done
HashSet_addAll_vd5_15_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_addAll_vd5_15_done
HashSet_addAll_vd5_15_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_addAll_vd5_15_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_HashSet_addCopiedValue__Object
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne pulsec_pulse_collections_HashSet_addAll__Collection_b7
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b8
pulsec_pulse_collections_HashSet_addAll__Collection_b6:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_epilogue
pulsec_pulse_collections_HashSet_addAll__Collection_b7:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b9
pulsec_pulse_collections_HashSet_addAll__Collection_b8:
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b9
pulsec_pulse_collections_HashSet_addAll__Collection_b9:
    jmp pulsec_pulse_collections_HashSet_addAll__Collection_b4
pulsec_pulse_collections_HashSet_addAll__Collection_epilogue:
pulsec_pulse_collections_HashSet_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_collections_HashSet_addAll__Collection endp

pulsec_pulse_collections_HashSet_add__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_add__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashSet_addValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_add__String_epilogue
pulsec_pulse_collections_HashSet_add__String_epilogue:
pulsec_pulse_collections_HashSet_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_add__String endp

pulsec_pulse_collections_HashSet_remove__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_remove__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
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
    je HashSet_remove_vd0_4_null
    call pulsec_pulse_collections_HashMap_remove__Object
    jmp HashSet_remove_vd0_4_done
HashSet_remove_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_remove_vd0_4_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setne al
    movzx eax, al
    jmp pulsec_pulse_collections_HashSet_remove__Object_epilogue
pulsec_pulse_collections_HashSet_remove__Object_epilogue:
pulsec_pulse_collections_HashSet_remove__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_remove__Object endp

pulsec_pulse_collections_HashSet_remove__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashSet_remove__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je HashSet_remove_vd1_5_null
    call pulsec_pulse_collections_HashMap_remove__Object
    jmp HashSet_remove_vd1_5_done
HashSet_remove_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_remove_vd1_5_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    jmp pulsec_pulse_collections_HashSet_remove__String_epilogue
pulsec_pulse_collections_HashSet_remove__String_epilogue:
pulsec_pulse_collections_HashSet_remove__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashSet_remove__String endp

pulsec_pulse_collections_HashSet_containsAll__Collection proc
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
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashSet_containsAll__Collection_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashSet_containsAll_vd0_2_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_containsAll_vd0_2_type
    cmp eax, 4
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 6
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 10
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 12
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 13
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 14
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 17
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 20
    je HashSet_containsAll_vd0_2_assign_ok
    cmp eax, 21
    je HashSet_containsAll_vd0_2_assign_ok
    jmp HashSet_containsAll_vd0_2_type
HashSet_containsAll_vd0_2_assign_ok:
    cmp eax, 4
    je HashSet_containsAll_vd0_2_ovr0
    cmp eax, 10
    je HashSet_containsAll_vd0_2_ovr1
    cmp eax, 12
    je HashSet_containsAll_vd0_2_ovr2
    cmp eax, 13
    je HashSet_containsAll_vd0_2_ovr3
    cmp eax, 14
    je HashSet_containsAll_vd0_2_ovr4
    jmp HashSet_containsAll_vd0_2_default
HashSet_containsAll_vd0_2_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_containsAll_vd0_2_done
HashSet_containsAll_vd0_2_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_containsAll_vd0_2_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_b1
pulsec_pulse_collections_HashSet_containsAll__Collection_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je HashSet_containsAll_vd1_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_containsAll_vd1_5_type
    cmp eax, 9
    je HashSet_containsAll_vd1_5_assign_ok
    cmp eax, 11
    je HashSet_containsAll_vd1_5_assign_ok
    cmp eax, 15
    je HashSet_containsAll_vd1_5_assign_ok
    jmp HashSet_containsAll_vd1_5_type
HashSet_containsAll_vd1_5_assign_ok:
    cmp eax, 9
    je HashSet_containsAll_vd1_5_ovr0
    cmp eax, 11
    je HashSet_containsAll_vd1_5_ovr1
    cmp eax, 15
    je HashSet_containsAll_vd1_5_ovr2
    jmp HashSet_containsAll_vd1_5_default
HashSet_containsAll_vd1_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashSet_containsAll_vd1_5_done
HashSet_containsAll_vd1_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashSet_containsAll_vd1_5_done
HashSet_containsAll_vd1_5_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashSet_containsAll_vd1_5_done
HashSet_containsAll_vd1_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashSet_containsAll_vd1_5_done
HashSet_containsAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_containsAll_vd1_5_done
HashSet_containsAll_vd1_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_containsAll_vd1_5_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashSet_containsAll__Collection_b2
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_b3
pulsec_pulse_collections_HashSet_containsAll__Collection_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je HashSet_containsAll_vd2_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_containsAll_vd2_10_type
    cmp eax, 9
    je HashSet_containsAll_vd2_10_assign_ok
    cmp eax, 11
    je HashSet_containsAll_vd2_10_assign_ok
    cmp eax, 15
    je HashSet_containsAll_vd2_10_assign_ok
    jmp HashSet_containsAll_vd2_10_type
HashSet_containsAll_vd2_10_assign_ok:
    cmp eax, 9
    je HashSet_containsAll_vd2_10_ovr0
    cmp eax, 11
    je HashSet_containsAll_vd2_10_ovr1
    cmp eax, 15
    je HashSet_containsAll_vd2_10_ovr2
    jmp HashSet_containsAll_vd2_10_default
HashSet_containsAll_vd2_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashSet_containsAll_vd2_10_done
HashSet_containsAll_vd2_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashSet_containsAll_vd2_10_done
HashSet_containsAll_vd2_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashSet_containsAll_vd2_10_done
HashSet_containsAll_vd2_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashSet_containsAll_vd2_10_done
HashSet_containsAll_vd2_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_containsAll_vd2_10_done
HashSet_containsAll_vd2_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_containsAll_vd2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashSet_containsAll_vd2_11_null
    call pulsec_pulse_collections_HashSet_contains__Object
    jmp HashSet_containsAll_vd2_11_done
HashSet_containsAll_vd2_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_containsAll_vd2_11_done:
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
    jne pulsec_pulse_collections_HashSet_containsAll__Collection_b4
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_b5
pulsec_pulse_collections_HashSet_containsAll__Collection_b3:
    mov eax, 1
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_epilogue
pulsec_pulse_collections_HashSet_containsAll__Collection_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_epilogue
pulsec_pulse_collections_HashSet_containsAll__Collection_b5:
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_b6
pulsec_pulse_collections_HashSet_containsAll__Collection_b6:
    jmp pulsec_pulse_collections_HashSet_containsAll__Collection_b1
pulsec_pulse_collections_HashSet_containsAll__Collection_epilogue:
pulsec_pulse_collections_HashSet_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_collections_HashSet_containsAll__Collection endp

pulsec_pulse_collections_HashSet_removeAll__Collection proc
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
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashSet_removeAll__Collection_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashSet_removeAll__Collection_b1
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b2
pulsec_pulse_collections_HashSet_removeAll__Collection_b1:
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je HashSet_removeAll_vd1_5_null
    call pulsec_pulse_collections_HashSet_isEmpty
    jmp HashSet_removeAll_vd1_5_done
HashSet_removeAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_removeAll_vd1_5_done:
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_removeAll__Collection_vd_stmt_1_2_2_null
    call pulsec_pulse_collections_HashSet_clear
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_vd_stmt_1_2_2_done
pulsec_pulse_collections_HashSet_removeAll__Collection_vd_stmt_1_2_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_removeAll__Collection_vd_stmt_1_2_2_done:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_epilogue
pulsec_pulse_collections_HashSet_removeAll__Collection_b2:
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b3
pulsec_pulse_collections_HashSet_removeAll__Collection_b3:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je HashSet_removeAll_vd5_14_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_removeAll_vd5_14_type
    cmp eax, 4
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 6
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 10
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 12
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 13
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 14
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 17
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 20
    je HashSet_removeAll_vd5_14_assign_ok
    cmp eax, 21
    je HashSet_removeAll_vd5_14_assign_ok
    jmp HashSet_removeAll_vd5_14_type
HashSet_removeAll_vd5_14_assign_ok:
    cmp eax, 4
    je HashSet_removeAll_vd5_14_ovr0
    cmp eax, 10
    je HashSet_removeAll_vd5_14_ovr1
    cmp eax, 12
    je HashSet_removeAll_vd5_14_ovr2
    cmp eax, 13
    je HashSet_removeAll_vd5_14_ovr3
    cmp eax, 14
    je HashSet_removeAll_vd5_14_ovr4
    jmp HashSet_removeAll_vd5_14_default
HashSet_removeAll_vd5_14_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_removeAll_vd5_14_done
HashSet_removeAll_vd5_14_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_removeAll_vd5_14_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b4
pulsec_pulse_collections_HashSet_removeAll__Collection_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    test rcx, rcx
    je HashSet_removeAll_vd6_17_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_removeAll_vd6_17_type
    cmp eax, 9
    je HashSet_removeAll_vd6_17_assign_ok
    cmp eax, 11
    je HashSet_removeAll_vd6_17_assign_ok
    cmp eax, 15
    je HashSet_removeAll_vd6_17_assign_ok
    jmp HashSet_removeAll_vd6_17_type
HashSet_removeAll_vd6_17_assign_ok:
    cmp eax, 9
    je HashSet_removeAll_vd6_17_ovr0
    cmp eax, 11
    je HashSet_removeAll_vd6_17_ovr1
    cmp eax, 15
    je HashSet_removeAll_vd6_17_ovr2
    jmp HashSet_removeAll_vd6_17_default
HashSet_removeAll_vd6_17_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashSet_removeAll_vd6_17_done
HashSet_removeAll_vd6_17_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashSet_removeAll_vd6_17_done
HashSet_removeAll_vd6_17_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashSet_removeAll_vd6_17_done
HashSet_removeAll_vd6_17_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashSet_removeAll_vd6_17_done
HashSet_removeAll_vd6_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_removeAll_vd6_17_done
HashSet_removeAll_vd6_17_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_removeAll_vd6_17_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashSet_removeAll__Collection_b5
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b6
pulsec_pulse_collections_HashSet_removeAll__Collection_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    test rcx, rcx
    je HashSet_removeAll_vd7_22_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_removeAll_vd7_22_type
    cmp eax, 9
    je HashSet_removeAll_vd7_22_assign_ok
    cmp eax, 11
    je HashSet_removeAll_vd7_22_assign_ok
    cmp eax, 15
    je HashSet_removeAll_vd7_22_assign_ok
    jmp HashSet_removeAll_vd7_22_type
HashSet_removeAll_vd7_22_assign_ok:
    cmp eax, 9
    je HashSet_removeAll_vd7_22_ovr0
    cmp eax, 11
    je HashSet_removeAll_vd7_22_ovr1
    cmp eax, 15
    je HashSet_removeAll_vd7_22_ovr2
    jmp HashSet_removeAll_vd7_22_default
HashSet_removeAll_vd7_22_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashSet_removeAll_vd7_22_done
HashSet_removeAll_vd7_22_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashSet_removeAll_vd7_22_done
HashSet_removeAll_vd7_22_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashSet_removeAll_vd7_22_done
HashSet_removeAll_vd7_22_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashSet_removeAll_vd7_22_done
HashSet_removeAll_vd7_22_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_removeAll_vd7_22_done
HashSet_removeAll_vd7_22_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_removeAll_vd7_22_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je HashSet_removeAll_vd7_23_null
    call pulsec_pulse_collections_HashSet_remove__Object
    jmp HashSet_removeAll_vd7_23_done
HashSet_removeAll_vd7_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_removeAll_vd7_23_done:
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test eax, eax
    jne pulsec_pulse_collections_HashSet_removeAll__Collection_b7
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b8
pulsec_pulse_collections_HashSet_removeAll__Collection_b6:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_epilogue
pulsec_pulse_collections_HashSet_removeAll__Collection_b7:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b9
pulsec_pulse_collections_HashSet_removeAll__Collection_b8:
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b9
pulsec_pulse_collections_HashSet_removeAll__Collection_b9:
    jmp pulsec_pulse_collections_HashSet_removeAll__Collection_b4
pulsec_pulse_collections_HashSet_removeAll__Collection_epilogue:
pulsec_pulse_collections_HashSet_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_collections_HashSet_removeAll__Collection endp

pulsec_pulse_collections_HashSet_retainAll__Collection proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+104], rcx
    mov qword ptr [rsp+112], rdx
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_HashSet_retainAll__Collection_b0:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashSet_retainAll__Collection_b1
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b2
pulsec_pulse_collections_HashSet_retainAll__Collection_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_epilogue
pulsec_pulse_collections_HashSet_retainAll__Collection_b2:
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b3
pulsec_pulse_collections_HashSet_retainAll__Collection_b3:
    mov rcx, qword ptr [rsp+104]
    test rcx, rcx
    je HashSet_retainAll_vd2_6_null
    call pulsec_pulse_collections_HashSet_size
    jmp HashSet_retainAll_vd2_6_done
HashSet_retainAll_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_retainAll_vd2_6_done:
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    xor ecx, ecx
    call pulsec_pulse_collections_HashSet_HashSet
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_4_4_null
    call pulsec_pulse_collections_HashSet_addAll__Collection
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_4_4_done
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_4_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_4_4_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_6_7_null
    call pulsec_pulse_collections_ArrayList_addAll__Collection
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_6_7_done
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_6_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_3_6_7_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je HashSet_retainAll_vd7_19_null
    call pulsec_pulse_collections_ArrayList_iterator
    jmp HashSet_retainAll_vd7_19_done
HashSet_retainAll_vd7_19_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_retainAll_vd7_19_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+88], rax
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b4
pulsec_pulse_collections_HashSet_retainAll__Collection_b4:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je HashSet_retainAll_vd8_22_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_retainAll_vd8_22_type
    cmp eax, 9
    je HashSet_retainAll_vd8_22_assign_ok
    cmp eax, 11
    je HashSet_retainAll_vd8_22_assign_ok
    cmp eax, 15
    je HashSet_retainAll_vd8_22_assign_ok
    jmp HashSet_retainAll_vd8_22_type
HashSet_retainAll_vd8_22_assign_ok:
    cmp eax, 9
    je HashSet_retainAll_vd8_22_ovr0
    cmp eax, 11
    je HashSet_retainAll_vd8_22_ovr1
    cmp eax, 15
    je HashSet_retainAll_vd8_22_ovr2
    jmp HashSet_retainAll_vd8_22_default
HashSet_retainAll_vd8_22_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashSet_retainAll_vd8_22_done
HashSet_retainAll_vd8_22_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashSet_retainAll_vd8_22_done
HashSet_retainAll_vd8_22_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashSet_retainAll_vd8_22_done
HashSet_retainAll_vd8_22_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashSet_retainAll_vd8_22_done
HashSet_retainAll_vd8_22_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_retainAll_vd8_22_done
HashSet_retainAll_vd8_22_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_retainAll_vd8_22_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashSet_retainAll__Collection_b5
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b6
pulsec_pulse_collections_HashSet_retainAll__Collection_b5:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je HashSet_retainAll_vd9_25_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashSet_retainAll_vd9_25_type
    cmp eax, 9
    je HashSet_retainAll_vd9_25_assign_ok
    cmp eax, 11
    je HashSet_retainAll_vd9_25_assign_ok
    cmp eax, 15
    je HashSet_retainAll_vd9_25_assign_ok
    jmp HashSet_retainAll_vd9_25_type
HashSet_retainAll_vd9_25_assign_ok:
    cmp eax, 9
    je HashSet_retainAll_vd9_25_ovr0
    cmp eax, 11
    je HashSet_retainAll_vd9_25_ovr1
    cmp eax, 15
    je HashSet_retainAll_vd9_25_ovr2
    jmp HashSet_retainAll_vd9_25_default
HashSet_retainAll_vd9_25_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashSet_retainAll_vd9_25_done
HashSet_retainAll_vd9_25_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashSet_retainAll_vd9_25_done
HashSet_retainAll_vd9_25_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashSet_retainAll_vd9_25_done
HashSet_retainAll_vd9_25_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashSet_retainAll_vd9_25_done
HashSet_retainAll_vd9_25_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashSet_retainAll_vd9_25_done
HashSet_retainAll_vd9_25_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashSet_retainAll_vd9_25_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je HashSet_retainAll_vd10_29_null
    call pulsec_pulse_collections_HashSet_contains__Object
    jmp HashSet_retainAll_vd10_29_done
HashSet_retainAll_vd10_29_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_retainAll_vd10_29_done:
    mov eax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashSet_retainAll__Collection_b7
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b8
pulsec_pulse_collections_HashSet_retainAll__Collection_b6:
    mov rcx, qword ptr [rsp+104]
    test rcx, rcx
    je HashSet_retainAll_vd12_37_null
    call pulsec_pulse_collections_HashSet_size
    jmp HashSet_retainAll_vd12_37_done
HashSet_retainAll_vd12_37_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_retainAll_vd12_37_done:
    movsxd rax, eax
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setne al
    movzx eax, al
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_epilogue
pulsec_pulse_collections_HashSet_retainAll__Collection_b7:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+104]
    test rcx, rcx
    je pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_7_11_0_null
    call pulsec_pulse_collections_HashSet_remove__Object
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_7_11_0_done
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_7_11_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashSet_retainAll__Collection_vd_stmt_7_11_0_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b9
pulsec_pulse_collections_HashSet_retainAll__Collection_b8:
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b9
pulsec_pulse_collections_HashSet_retainAll__Collection_b9:
    jmp pulsec_pulse_collections_HashSet_retainAll__Collection_b4
pulsec_pulse_collections_HashSet_retainAll__Collection_epilogue:
pulsec_pulse_collections_HashSet_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_collections_HashSet_retainAll__Collection endp

pulsec_pulse_collections_HashSet_contains__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_contains__Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashSet_containsValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_contains__Object_epilogue
pulsec_pulse_collections_HashSet_contains__Object_epilogue:
pulsec_pulse_collections_HashSet_contains__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_contains__Object endp

pulsec_pulse_collections_HashSet_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashSet_contains__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashSet_containsValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashSet_contains__String_epilogue
pulsec_pulse_collections_HashSet_contains__String_epilogue:
pulsec_pulse_collections_HashSet_contains__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashSet_contains__String endp

pulsec_pulse_collections_HashSet_iterator proc
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
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashSet_iterator_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashSet_entries]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je HashSet_iterator_vd0_3_null
    call pulsec_pulse_collections_HashMap_keyIterator
    jmp HashSet_iterator_vd0_3_done
HashSet_iterator_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashSet_iterator_vd0_3_done:
    jmp pulsec_pulse_collections_HashSet_iterator_epilogue
pulsec_pulse_collections_HashSet_iterator_epilogue:
pulsec_pulse_collections_HashSet_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashSet_iterator endp

end
