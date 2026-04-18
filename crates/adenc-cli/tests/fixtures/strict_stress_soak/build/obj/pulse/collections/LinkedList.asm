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
extrn pulsec_pulse_collections_ArrayList_contains__Object:proc
extrn pulsec_pulse_collections_ArrayList_iterator:proc
extrn pulsec_pulse_collections_Collection_contains__Object:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_next:proc
extrn pulsec_pulse_collections_HashMapKeySetView_contains__Object:proc
extrn pulsec_pulse_collections_HashMapKeySetView_iterator:proc
extrn pulsec_pulse_collections_HashMapValueIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapValueIterator_next:proc
extrn pulsec_pulse_collections_HashMapValuesView_contains__Object:proc
extrn pulsec_pulse_collections_HashMapValuesView_iterator:proc
extrn pulsec_pulse_collections_HashSet_contains__Object:proc
extrn pulsec_pulse_collections_HashSet_iterator:proc
extrn pulsec_pulse_collections_LinkedListIterator_LinkedListIterator__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object:proc
extrn pulsec_pulse_collections_LinkedListNode_getIntValue:proc
extrn pulsec_pulse_collections_LinkedListNode_getNext:proc
extrn pulsec_pulse_collections_LinkedListNode_getPrevious:proc
extrn pulsec_pulse_collections_LinkedListNode_getValue:proc
extrn pulsec_pulse_collections_LinkedListNode_hasIntValue:proc
extrn pulsec_pulse_collections_LinkedListNode_setIntValue__int:proc
extrn pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListNode_setValue__Object:proc
extrn pulsec_pulse_collections_Set_contains__String:proc
extrn pulsec_pulse_lang_Integer_unboxBoxed__Integer:proc
extrn pulsec_pulse_lang_Iterable_iterator:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
extrn pulsec_pulse_lang_String_equals__Object:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_substring__int_int:proc
extrn pulsec_rt_panic:proc
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

public pulsec_fld_pulse_collections_LinkedList_first
public pulsec_fld_pulse_collections_LinkedList_first_heap_owned
public pulsec_fld_pulse_collections_LinkedList_last
public pulsec_fld_pulse_collections_LinkedList_last_heap_owned
public pulsec_fld_pulse_collections_LinkedList_count
public pulsec_fld_pulse_collections_LinkedList_count_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_LinkedList dd 0
pulsec_fcap_pulse_collections_LinkedList dd 63
pulsec_fld_pulse_collections_LinkedList_first_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_first dq pulsec_fld_pulse_collections_LinkedList_first_tbl
pulsec_fld_pulse_collections_LinkedList_first_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedList_last_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_last dq pulsec_fld_pulse_collections_LinkedList_last_tbl
pulsec_fld_pulse_collections_LinkedList_last_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedList_count_tbl dd 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_count dq pulsec_fld_pulse_collections_LinkedList_count_tbl
pulsec_fld_pulse_collections_LinkedList_count_heap_owned dd 0
trace_m0 db "pulse.collections.LinkedList.LinkedList"
trace_m0_len equ 39
trace_m1 db "pulse.collections.LinkedList.size"
trace_m1_len equ 33
trace_m2 db "pulse.collections.LinkedList.iterator"
trace_m2_len equ 37
trace_m3 db "pulse.collections.LinkedList.isEmpty"
trace_m3_len equ 36
trace_m4 db "pulse.collections.LinkedList.clear"
trace_m4_len equ 34
trace_m5 db "pulse.collections.LinkedList.valuesEqual"
trace_m5_len equ 40
trace_m6 db "pulse.collections.LinkedList.appendValue"
trace_m6_len equ 40
trace_m7 db "pulse.collections.LinkedList.appendIntValue"
trace_m7_len equ 43
trace_m8 db "pulse.collections.LinkedList.insertValue"
trace_m8_len equ 40
trace_m9 db "pulse.collections.LinkedList.insertIntValue"
trace_m9_len equ 43
trace_m10 db "pulse.collections.LinkedList.replaceValue"
trace_m10_len equ 41
trace_m11 db "pulse.collections.LinkedList.replaceIntValue"
trace_m11_len equ 44
trace_m12 db "pulse.collections.LinkedList.findIndex"
trace_m12_len equ 38
trace_m13 db "pulse.collections.LinkedList.findIntIndex"
trace_m13_len equ 41
trace_m14 db "pulse.collections.LinkedList.findLastIndex"
trace_m14_len equ 42
trace_m15 db "pulse.collections.LinkedList.findLastIntIndex"
trace_m15_len equ 45
trace_m16 db "pulse.collections.LinkedList.unlinkNode"
trace_m16_len equ 39
trace_m17 db "pulse.collections.LinkedList.prependValue"
trace_m17_len equ 41
trace_m18 db "pulse.collections.LinkedList.prependIntValue"
trace_m18_len equ 44
trace_m19 db "pulse.collections.LinkedList.copyStringValue"
trace_m19_len equ 44
trace_m20 db "pulse.collections.LinkedList.addCopiedValue"
trace_m20_len equ 43
trace_m21 db "pulse.collections.LinkedList.nodeAt"
trace_m21_len equ 35
trace_m22 db "pulse.collections.LinkedList.add"
trace_m22_len equ 32
trace_m23 db "pulse.collections.LinkedList.add"
trace_m23_len equ 32
trace_m24 db "pulse.collections.LinkedList.add"
trace_m24_len equ 32
trace_m25 db "pulse.collections.LinkedList.addAll"
trace_m25_len equ 35
trace_m26 db "pulse.collections.LinkedList.containsAll"
trace_m26_len equ 40
trace_m27 db "pulse.collections.LinkedList.removeAll"
trace_m27_len equ 38
trace_m28 db "pulse.collections.LinkedList.retainAll"
trace_m28_len equ 38
trace_m29 db "pulse.collections.LinkedList.add"
trace_m29_len equ 32
trace_m30 db "pulse.collections.LinkedList.add"
trace_m30_len equ 32
trace_m31 db "pulse.collections.LinkedList.add"
trace_m31_len equ 32
trace_m32 db "pulse.collections.LinkedList.get"
trace_m32_len equ 32
trace_m33 db "pulse.collections.LinkedList.getInt"
trace_m33_len equ 35
trace_m34 db "pulse.collections.LinkedList.getString"
trace_m34_len equ 38
trace_m35 db "pulse.collections.LinkedList.remove"
trace_m35_len equ 35
trace_m36 db "pulse.collections.LinkedList.remove"
trace_m36_len equ 35
trace_m37 db "pulse.collections.LinkedList.set"
trace_m37_len equ 32
trace_m38 db "pulse.collections.LinkedList.set"
trace_m38_len equ 32
trace_m39 db "pulse.collections.LinkedList.set"
trace_m39_len equ 32
trace_m40 db "pulse.collections.LinkedList.contains"
trace_m40_len equ 37
trace_m41 db "pulse.collections.LinkedList.contains"
trace_m41_len equ 37
trace_m42 db "pulse.collections.LinkedList.contains"
trace_m42_len equ 37
trace_m43 db "pulse.collections.LinkedList.indexOf"
trace_m43_len equ 36
trace_m44 db "pulse.collections.LinkedList.indexOf"
trace_m44_len equ 36
trace_m45 db "pulse.collections.LinkedList.indexOf"
trace_m45_len equ 36
trace_m46 db "pulse.collections.LinkedList.lastIndexOf"
trace_m46_len equ 40
trace_m47 db "pulse.collections.LinkedList.lastIndexOf"
trace_m47_len equ 40
trace_m48 db "pulse.collections.LinkedList.lastIndexOf"
trace_m48_len equ 40
trace_m49 db "pulse.collections.LinkedList.offer"
trace_m49_len equ 34
trace_m50 db "pulse.collections.LinkedList.offer"
trace_m50_len equ 34
trace_m51 db "pulse.collections.LinkedList.offer"
trace_m51_len equ 34
trace_m52 db "pulse.collections.LinkedList.poll"
trace_m52_len equ 33
trace_m53 db "pulse.collections.LinkedList.remove"
trace_m53_len equ 35
trace_m54 db "pulse.collections.LinkedList.peek"
trace_m54_len equ 33
trace_m55 db "pulse.collections.LinkedList.element"
trace_m55_len equ 36
trace_m56 db "pulse.collections.LinkedList.addFirst"
trace_m56_len equ 37
trace_m57 db "pulse.collections.LinkedList.offerFirst"
trace_m57_len equ 39
trace_m58 db "pulse.collections.LinkedList.addFirst"
trace_m58_len equ 37
trace_m59 db "pulse.collections.LinkedList.addFirst"
trace_m59_len equ 37
trace_m60 db "pulse.collections.LinkedList.offerFirst"
trace_m60_len equ 39
trace_m61 db "pulse.collections.LinkedList.offerFirst"
trace_m61_len equ 39
trace_m62 db "pulse.collections.LinkedList.addLast"
trace_m62_len equ 36
trace_m63 db "pulse.collections.LinkedList.offerLast"
trace_m63_len equ 38
trace_m64 db "pulse.collections.LinkedList.addLast"
trace_m64_len equ 36
trace_m65 db "pulse.collections.LinkedList.addLast"
trace_m65_len equ 36
trace_m66 db "pulse.collections.LinkedList.offerLast"
trace_m66_len equ 38
trace_m67 db "pulse.collections.LinkedList.offerLast"
trace_m67_len equ 38
trace_m68 db "pulse.collections.LinkedList.getFirst"
trace_m68_len equ 37
trace_m69 db "pulse.collections.LinkedList.removeFirst"
trace_m69_len equ 40
trace_m70 db "pulse.collections.LinkedList.peekFirst"
trace_m70_len equ 38
trace_m71 db "pulse.collections.LinkedList.pollFirst"
trace_m71_len equ 38
trace_m72 db "pulse.collections.LinkedList.removeLast"
trace_m72_len equ 39
trace_m73 db "pulse.collections.LinkedList.getLast"
trace_m73_len equ 36
trace_m74 db "pulse.collections.LinkedList.peekLast"
trace_m74_len equ 37
trace_m75 db "pulse.collections.LinkedList.pollLast"
trace_m75_len equ 37
trace_m76 db "pulse.collections.LinkedList.removeFirstOccurrence"
trace_m76_len equ 50
trace_m77 db "pulse.collections.LinkedList.removeLastOccurrence"
trace_m77_len equ 49
trace_m78 db "pulse.collections.LinkedList.push"
trace_m78_len equ 33
trace_m79 db "pulse.collections.LinkedList.push"
trace_m79_len equ 33
trace_m80 db "pulse.collections.LinkedList.push"
trace_m80_len equ 33
trace_m81 db "pulse.collections.LinkedList.pop"
trace_m81_len equ 32
cidset_5 dd 34
cidset_6 dd 27
msg0 db "Invalid cast"
msg0_len equ 12
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "LinkedList index out of bounds"
msg2_len equ 30
msg3 db "LinkedList index out of bounds"
msg3_len equ 30
msg4 db "LinkedList value is not an int"
msg4_len equ 30
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "Invalid cast"
msg6_len equ 12
msg7 db "LinkedList index out of bounds"
msg7_len equ 30
msg8 db "Invalid cast"
msg8_len equ 12
msg9 db "LinkedList value is not an int"
msg9_len equ 30
msg10 db "Invalid cast"
msg10_len equ 12
msg11 db "Invalid cast"
msg11_len equ 12
msg12 db "Queue is empty"
msg12_len equ 14
msg13 db "Queue is empty"
msg13_len equ 14
msg14 db "Deque is empty"
msg14_len equ 14
msg15 db "Deque is empty"
msg15_len equ 14
msg16 db "Deque is empty"
msg16_len equ 14
msg17 db "Deque is empty"
msg17_len equ 14

.code
pulsec_fcap_pulse_collections_LinkedList_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_LinkedList]
    jbe pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_LinkedList]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_fail
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
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_first_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_first], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_first_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_last_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_last], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_last_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_count_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_count], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_count_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_LinkedList], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail:
pulsec_fcap_pulse_collections_LinkedList_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedList_ensure endp

pulsec_fcap_pulse_collections_LinkedList_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_teardown endp
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges endp
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges endp
pulsec_pulse_collections_LinkedList_LinkedList proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_LinkedList_LinkedList_ctor_reuse
    mov ecx, 11
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_LinkedList_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_collections_LinkedList_LinkedList_ctor_ready
pulsec_pulse_collections_LinkedList_LinkedList_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_LinkedList_LinkedList_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_LinkedList_b0:
    xor eax, eax
    xor eax, eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_LinkedList_epilogue
pulsec_pulse_collections_LinkedList_LinkedList_epilogue:
pulsec_pulse_collections_LinkedList_LinkedList_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_LinkedList endp

pulsec_pulse_collections_LinkedList_size proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_collections_LinkedList_size_epilogue
pulsec_pulse_collections_LinkedList_size_epilogue:
pulsec_pulse_collections_LinkedList_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_size endp

pulsec_pulse_collections_LinkedList_iterator proc
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
pulsec_pulse_collections_LinkedList_iterator_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListIterator_LinkedListIterator__LinkedListNode
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_LinkedList_iterator_epilogue
pulsec_pulse_collections_LinkedList_iterator_epilogue:
pulsec_pulse_collections_LinkedList_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_iterator endp

pulsec_pulse_collections_LinkedList_isEmpty proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_isEmpty_epilogue
pulsec_pulse_collections_LinkedList_isEmpty_epilogue:
pulsec_pulse_collections_LinkedList_isEmpty_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_isEmpty endp

pulsec_pulse_collections_LinkedList_clear proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_clear_b0:
    xor eax, eax
    xor eax, eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_clear_epilogue
pulsec_pulse_collections_LinkedList_clear_epilogue:
pulsec_pulse_collections_LinkedList_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_clear endp

pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b1
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b2
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b1:
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b2:
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b3
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_valuesEqual_ternary_then_2_11
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp LinkedList_valuesEqual_ternary_done_2_11
LinkedList_valuesEqual_ternary_then_2_11:
    mov eax, 1
LinkedList_valuesEqual_ternary_done_2_11:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b4
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b5
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b5:
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b6
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b6:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je LinkedList_valuesEqual_instof_4_15_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_instof_4_15_false
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_instof_4_15_true
LinkedList_valuesEqual_instof_4_15_false:
    xor eax, eax
    jmp LinkedList_valuesEqual_instof_4_15_done
LinkedList_valuesEqual_instof_4_15_true:
    mov eax, 1
LinkedList_valuesEqual_instof_4_15_done:
    test rax, rax
    jne LinkedList_valuesEqual_ternary_then_4_18
    mov eax, 0
    jmp LinkedList_valuesEqual_ternary_done_4_18
LinkedList_valuesEqual_ternary_then_4_18:
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je LinkedList_valuesEqual_instof_4_17_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_instof_4_17_false
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_instof_4_17_true
LinkedList_valuesEqual_instof_4_17_false:
    xor eax, eax
    jmp LinkedList_valuesEqual_instof_4_17_done
LinkedList_valuesEqual_instof_4_17_true:
    mov eax, 1
LinkedList_valuesEqual_instof_4_17_done:
LinkedList_valuesEqual_ternary_done_4_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b7
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b8
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b7:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je LinkedList_valuesEqual_cast_5_20_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_cast_5_20_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_cast_5_20_ok
LinkedList_valuesEqual_cast_5_20_fail:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_5_20_done
LinkedList_valuesEqual_cast_5_20_null:
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_5_20_done
LinkedList_valuesEqual_cast_5_20_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_valuesEqual_cast_5_20_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je LinkedList_valuesEqual_cast_6_22_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_cast_6_22_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_cast_6_22_ok
LinkedList_valuesEqual_cast_6_22_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_6_22_done
LinkedList_valuesEqual_cast_6_22_null:
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_6_22_done
LinkedList_valuesEqual_cast_6_22_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_valuesEqual_cast_6_22_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_lang_String_equals__Object
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b8:
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b9
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b9:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue:
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object endp

pulsec_pulse_collections_LinkedList_appendValue__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_appendValue__Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_appendValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b2
pulsec_pulse_collections_LinkedList_appendValue__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b3
pulsec_pulse_collections_LinkedList_appendValue__Object_b2:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b3
pulsec_pulse_collections_LinkedList_appendValue__Object_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue
pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue:
pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_appendValue__Object endp

pulsec_pulse_collections_LinkedList_appendIntValue__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_appendIntValue__int_b0:
    xor eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_appendIntValue__int_b1
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b2
pulsec_pulse_collections_LinkedList_appendIntValue__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b3
pulsec_pulse_collections_LinkedList_appendIntValue__int_b2:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b3
pulsec_pulse_collections_LinkedList_appendIntValue__int_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue
pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue:
pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_appendIntValue__int endp

pulsec_pulse_collections_LinkedList_insertValue__int_Object proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], rcx
    mov dword ptr [rsp+96], edx
    mov qword ptr [rsp+104], r8
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b0:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_insertValue_ternary_then_0_8
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp LinkedList_insertValue_ternary_done_0_8
LinkedList_insertValue_ternary_then_0_8:
    mov eax, 1
LinkedList_insertValue_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b1
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b2
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b1:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b2:
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b3
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b3:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+128], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b4
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b5
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b4:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b5:
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b6
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b6:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b7
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b8
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue:
pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_insertValue__int_Object endp

pulsec_pulse_collections_LinkedList_insertIntValue__int_int proc
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
    mov qword ptr [rsp+88], rcx
    mov dword ptr [rsp+96], edx
    mov dword ptr [rsp+104], r8d
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b0:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_insertIntValue_ternary_then_0_8
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp LinkedList_insertIntValue_ternary_done_0_8
LinkedList_insertIntValue_ternary_then_0_8:
    mov eax, 1
LinkedList_insertIntValue_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b1
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b2
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b1:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b2:
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b3
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b3:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+128], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b4
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b5
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b4:
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b5:
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b6
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b6:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    xor eax, eax
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b7
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b8
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue:
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_insertIntValue__int_int endp

pulsec_pulse_collections_LinkedList_replaceValue__int_Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b0:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b1
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b2
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b2:
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b3
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
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
    call pulsec_pulse_collections_LinkedListNode_setValue__Object
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue:
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_replaceValue__int_Object endp

pulsec_pulse_collections_LinkedList_replaceIntValue__int_int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b0:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b1
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b2
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b2:
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b3
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b4
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b5
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b6
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b5:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b6:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
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
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue:
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int endp

pulsec_pulse_collections_LinkedList_findIndex__Object proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findIndex__Object_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b1
pulsec_pulse_collections_LinkedList_findIndex__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIndex__Object_b2
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b3
pulsec_pulse_collections_LinkedList_findIndex__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_findIndex_ternary_then_3_18
    mov eax, 0
    jmp LinkedList_findIndex_ternary_done_3_18
LinkedList_findIndex_ternary_then_3_18:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    mov r8, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
LinkedList_findIndex_ternary_done_3_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIndex__Object_b4
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b5
pulsec_pulse_collections_LinkedList_findIndex__Object_b3:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findIndex__Object_b4:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findIndex__Object_b5:
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b6
pulsec_pulse_collections_LinkedList_findIndex__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b1
pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue:
pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_findIndex__Object endp

pulsec_pulse_collections_LinkedList_findIntIndex__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findIntIndex__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findIntIndex__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIntIndex__int_b2
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b3
pulsec_pulse_collections_LinkedList_findIntIndex__int_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test rax, rax
    jne LinkedList_findIntIndex_ternary_then_3_15
    mov eax, 0
    jmp LinkedList_findIntIndex_ternary_done_3_15
LinkedList_findIntIndex_ternary_then_3_15:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
LinkedList_findIntIndex_ternary_done_3_15:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIntIndex__int_b4
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b5
pulsec_pulse_collections_LinkedList_findIntIndex__int_b3:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findIntIndex__int_b4:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findIntIndex__int_b5:
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b6
pulsec_pulse_collections_LinkedList_findIntIndex__int_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue:
pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_findIntIndex__int endp

pulsec_pulse_collections_LinkedList_findLastIndex__Object proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIndex__Object_b2
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b3
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_findLastIndex_ternary_then_3_21
    mov eax, 0
    jmp LinkedList_findLastIndex_ternary_done_3_21
LinkedList_findLastIndex_ternary_then_3_21:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    mov r8, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
LinkedList_findLastIndex_ternary_done_3_21:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIndex__Object_b4
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b5
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b3:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b4:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b5:
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b6
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1
pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue:
pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_collections_LinkedList_findLastIndex__Object endp

pulsec_pulse_collections_LinkedList_findLastIntIndex__int proc
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
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b2
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b3
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test rax, rax
    jne LinkedList_findLastIntIndex_ternary_then_3_18
    mov eax, 0
    jmp LinkedList_findLastIntIndex_ternary_done_3_18
LinkedList_findLastIntIndex_ternary_then_3_18:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
LinkedList_findLastIntIndex_ternary_done_3_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b4
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b5
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b3:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b4:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b5:
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b6
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue:
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_findLastIntIndex__int endp

pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b1
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b2
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b2:
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b3
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b4
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b5
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov qword ptr [rsp+184], rdx
    mov qword ptr [rsp+192], r8
    mov qword ptr [rsp+200], r9
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b7
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b8
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b7:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b8:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov qword ptr [rsp+184], rdx
    mov qword ptr [rsp+192], r8
    mov qword ptr [rsp+200], r9
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue:
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode endp

pulsec_pulse_collections_LinkedList_prependValue__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_prependValue__Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_prependValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b2
pulsec_pulse_collections_LinkedList_prependValue__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b3
pulsec_pulse_collections_LinkedList_prependValue__Object_b2:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b3
pulsec_pulse_collections_LinkedList_prependValue__Object_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue
pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue:
pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_prependValue__Object endp

pulsec_pulse_collections_LinkedList_prependIntValue__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_prependIntValue__int_b0:
    xor eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_prependIntValue__int_b1
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b2
pulsec_pulse_collections_LinkedList_prependIntValue__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b3
pulsec_pulse_collections_LinkedList_prependIntValue__int_b2:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b3
pulsec_pulse_collections_LinkedList_prependIntValue__int_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue
pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue:
pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_prependIntValue__int endp

pulsec_pulse_collections_LinkedList_copyStringValue__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_copyStringValue__String_b0:
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
    jmp pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue
pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue:
pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_copyStringValue__String endp

pulsec_pulse_collections_LinkedList_addCopiedValue__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b0:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_instof_0_1_true
LinkedList_addCopiedValue_instof_0_1_false:
    xor eax, eax
    jmp LinkedList_addCopiedValue_instof_0_1_done
LinkedList_addCopiedValue_instof_0_1_true:
    mov eax, 1
LinkedList_addCopiedValue_instof_0_1_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b2
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b1:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_cast_1_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_cast_1_7_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_cast_1_7_ok
LinkedList_addCopiedValue_cast_1_7_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_1_7_done
LinkedList_addCopiedValue_cast_1_7_null:
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_1_7_done
LinkedList_addCopiedValue_cast_1_7_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addCopiedValue_cast_1_7_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_copyStringValue__String
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
    je LinkedList_addCopiedValue_vd1_9_null
    call pulsec_pulse_collections_LinkedList_add__String
    jmp LinkedList_addCopiedValue_vd1_9_done
LinkedList_addCopiedValue_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd1_9_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b2:
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b3
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b3:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_instof_2_11_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_instof_2_11_false
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_instof_2_11_true
LinkedList_addCopiedValue_instof_2_11_false:
    xor eax, eax
    jmp LinkedList_addCopiedValue_instof_2_11_done
LinkedList_addCopiedValue_instof_2_11_true:
    mov eax, 1
LinkedList_addCopiedValue_instof_2_11_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b4
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b5
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b4:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_cast_3_17_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_cast_3_17_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_cast_3_17_ok
LinkedList_addCopiedValue_cast_3_17_fail:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_3_17_done
LinkedList_addCopiedValue_cast_3_17_null:
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_3_17_done
LinkedList_addCopiedValue_cast_3_17_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addCopiedValue_cast_3_17_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_unboxBoxed__Integer
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_addCopiedValue_vd3_19_null
    call pulsec_pulse_collections_LinkedList_add__int
    jmp LinkedList_addCopiedValue_vd3_19_done
LinkedList_addCopiedValue_vd3_19_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd3_19_done:
    mov eax, eax
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b5:
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b6
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b6:
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
    je LinkedList_addCopiedValue_vd4_23_null
    call pulsec_pulse_collections_LinkedList_add__Object
    jmp LinkedList_addCopiedValue_vd4_23_done
LinkedList_addCopiedValue_vd4_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd4_23_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue:
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_addCopiedValue__Object endp

pulsec_pulse_collections_LinkedList_nodeAt__int proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_nodeAt__int_b0:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_nodeAt_ternary_then_0_8
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+104], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp LinkedList_nodeAt_ternary_done_0_8
LinkedList_nodeAt_ternary_then_0_8:
    mov eax, 1
LinkedList_nodeAt_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b1
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b2
pulsec_pulse_collections_LinkedList_nodeAt__int_b1:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_b2:
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b3
pulsec_pulse_collections_LinkedList_nodeAt__int_b3:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+112], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov ecx, edx
    cdq
    idiv ecx
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b4
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b5
pulsec_pulse_collections_LinkedList_nodeAt__int_b4:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b7
pulsec_pulse_collections_LinkedList_nodeAt__int_b5:
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b6
pulsec_pulse_collections_LinkedList_nodeAt__int_b6:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b10
pulsec_pulse_collections_LinkedList_nodeAt__int_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b8
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b9
pulsec_pulse_collections_LinkedList_nodeAt__int_b8:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b7
pulsec_pulse_collections_LinkedList_nodeAt__int_b9:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_b10:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b11
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b12
pulsec_pulse_collections_LinkedList_nodeAt__int_b11:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+160], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b10
pulsec_pulse_collections_LinkedList_nodeAt__int_b12:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue:
pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue_post:
    mov qword ptr [rsp+208], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+208]
    add rsp, 328
    ret
pulsec_pulse_collections_LinkedList_nodeAt__int endp

pulsec_pulse_collections_LinkedList_add__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_add__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_add__Object_epilogue
pulsec_pulse_collections_LinkedList_add__Object_epilogue:
pulsec_pulse_collections_LinkedList_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__Object endp

pulsec_pulse_collections_LinkedList_add__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_add__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    mov eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_epilogue
pulsec_pulse_collections_LinkedList_add__int_epilogue:
pulsec_pulse_collections_LinkedList_add__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int endp

pulsec_pulse_collections_LinkedList_add__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_add__String_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_add__String_epilogue
pulsec_pulse_collections_LinkedList_add__String_epilogue:
pulsec_pulse_collections_LinkedList_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__String endp

pulsec_pulse_collections_LinkedList_addAll__Collection proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+104], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+96], 0
pulsec_pulse_collections_LinkedList_addAll__Collection_b0:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b2
pulsec_pulse_collections_LinkedList_addAll__Collection_b1:
    mov edx, dword ptr [rsp+112]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+64], eax
    mov edx, dword ptr [rsp+112]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, 0
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b4
pulsec_pulse_collections_LinkedList_addAll__Collection_b2:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b3
pulsec_pulse_collections_LinkedList_addAll__Collection_b3:
    mov eax, 0
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    test rcx, rcx
    je LinkedList_addAll_vd15_51_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd15_51_type
    cmp eax, 1
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 3
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 7
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 9
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 10
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 11
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 14
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 17
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 18
    je LinkedList_addAll_vd15_51_assign_ok
    jmp LinkedList_addAll_vd15_51_type
LinkedList_addAll_vd15_51_assign_ok:
    cmp eax, 1
    je LinkedList_addAll_vd15_51_ovr0
    cmp eax, 7
    je LinkedList_addAll_vd15_51_ovr1
    cmp eax, 9
    je LinkedList_addAll_vd15_51_ovr2
    cmp eax, 10
    je LinkedList_addAll_vd15_51_ovr3
    cmp eax, 11
    je LinkedList_addAll_vd15_51_ovr4
    jmp LinkedList_addAll_vd15_51_default
LinkedList_addAll_vd15_51_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd15_51_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b13
pulsec_pulse_collections_LinkedList_addAll__Collection_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b6
pulsec_pulse_collections_LinkedList_addAll__Collection_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b7
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b8
pulsec_pulse_collections_LinkedList_addAll__Collection_b6:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_addAll__Collection_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+248], rax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_null
    call pulsec_pulse_collections_LinkedList_add__int
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_done:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b9
pulsec_pulse_collections_LinkedList_addAll__Collection_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    test rax, rax
    je LinkedList_addAll_instof_8_24_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addAll_instof_8_24_false
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addAll_instof_8_24_true
LinkedList_addAll_instof_8_24_false:
    xor eax, eax
    jmp LinkedList_addAll_instof_8_24_done
LinkedList_addAll_instof_8_24_true:
    mov eax, 1
LinkedList_addAll_instof_8_24_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b10
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b11
pulsec_pulse_collections_LinkedList_addAll__Collection_b9:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b4
pulsec_pulse_collections_LinkedList_addAll__Collection_b10:
    mov rax, qword ptr [rsp+104]
    test rax, rax
    je LinkedList_addAll_cast_9_30_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addAll_cast_9_30_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addAll_cast_9_30_ok
LinkedList_addAll_cast_9_30_fail:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addAll_cast_9_30_done
LinkedList_addAll_cast_9_30_null:
    xor eax, eax
    jmp LinkedList_addAll_cast_9_30_done
LinkedList_addAll_cast_9_30_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addAll_cast_9_30_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_collections_LinkedList_copyStringValue__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_null
    call pulsec_pulse_collections_LinkedList_add__String
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b12
pulsec_pulse_collections_LinkedList_addAll__Collection_b11:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_null
    call pulsec_pulse_collections_LinkedList_add__Object
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b12
pulsec_pulse_collections_LinkedList_addAll__Collection_b12:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b9
pulsec_pulse_collections_LinkedList_addAll__Collection_b13:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    test rcx, rcx
    je LinkedList_addAll_vd16_54_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd16_54_type
    cmp eax, 6
    je LinkedList_addAll_vd16_54_assign_ok
    cmp eax, 8
    je LinkedList_addAll_vd16_54_assign_ok
    cmp eax, 12
    je LinkedList_addAll_vd16_54_assign_ok
    jmp LinkedList_addAll_vd16_54_type
LinkedList_addAll_vd16_54_assign_ok:
    cmp eax, 6
    je LinkedList_addAll_vd16_54_ovr0
    cmp eax, 8
    je LinkedList_addAll_vd16_54_ovr1
    cmp eax, 12
    je LinkedList_addAll_vd16_54_ovr2
    jmp LinkedList_addAll_vd16_54_default
LinkedList_addAll_vd16_54_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd16_54_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b14
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b15
pulsec_pulse_collections_LinkedList_addAll__Collection_b14:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+248], rax
    mov rcx, qword ptr [rsp+248]
    test rcx, rcx
    je LinkedList_addAll_vd17_59_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd17_59_type
    cmp eax, 6
    je LinkedList_addAll_vd17_59_assign_ok
    cmp eax, 8
    je LinkedList_addAll_vd17_59_assign_ok
    cmp eax, 12
    je LinkedList_addAll_vd17_59_assign_ok
    jmp LinkedList_addAll_vd17_59_type
LinkedList_addAll_vd17_59_assign_ok:
    cmp eax, 6
    je LinkedList_addAll_vd17_59_ovr0
    cmp eax, 8
    je LinkedList_addAll_vd17_59_ovr1
    cmp eax, 12
    je LinkedList_addAll_vd17_59_ovr2
    jmp LinkedList_addAll_vd17_59_default
LinkedList_addAll_vd17_59_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd17_59_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_collections_LinkedList_addCopiedValue__Object
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b16
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b17
pulsec_pulse_collections_LinkedList_addAll__Collection_b15:
    mov eax, dword ptr [rsp+88]
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_addAll__Collection_b16:
    mov eax, 1
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b18
pulsec_pulse_collections_LinkedList_addAll__Collection_b17:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b18
pulsec_pulse_collections_LinkedList_addAll__Collection_b18:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b13
pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue:
pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+200], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 360
    ret
pulsec_pulse_collections_LinkedList_addAll__Collection endp

pulsec_pulse_collections_LinkedList_containsAll__Collection proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_containsAll__Collection_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je LinkedList_containsAll_vd0_2_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd0_2_type
    cmp eax, 1
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 3
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 7
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 9
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 10
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 11
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 14
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 17
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 18
    je LinkedList_containsAll_vd0_2_assign_ok
    jmp LinkedList_containsAll_vd0_2_type
LinkedList_containsAll_vd0_2_assign_ok:
    cmp eax, 1
    je LinkedList_containsAll_vd0_2_ovr0
    cmp eax, 7
    je LinkedList_containsAll_vd0_2_ovr1
    cmp eax, 9
    je LinkedList_containsAll_vd0_2_ovr2
    cmp eax, 10
    je LinkedList_containsAll_vd0_2_ovr3
    cmp eax, 11
    je LinkedList_containsAll_vd0_2_ovr4
    jmp LinkedList_containsAll_vd0_2_default
LinkedList_containsAll_vd0_2_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd0_2_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b1
pulsec_pulse_collections_LinkedList_containsAll__Collection_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je LinkedList_containsAll_vd1_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd1_5_type
    cmp eax, 6
    je LinkedList_containsAll_vd1_5_assign_ok
    cmp eax, 8
    je LinkedList_containsAll_vd1_5_assign_ok
    cmp eax, 12
    je LinkedList_containsAll_vd1_5_assign_ok
    jmp LinkedList_containsAll_vd1_5_type
LinkedList_containsAll_vd1_5_assign_ok:
    cmp eax, 6
    je LinkedList_containsAll_vd1_5_ovr0
    cmp eax, 8
    je LinkedList_containsAll_vd1_5_ovr1
    cmp eax, 12
    je LinkedList_containsAll_vd1_5_ovr2
    jmp LinkedList_containsAll_vd1_5_default
LinkedList_containsAll_vd1_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd1_5_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_containsAll__Collection_b2
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b3
pulsec_pulse_collections_LinkedList_containsAll__Collection_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je LinkedList_containsAll_vd2_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd2_10_type
    cmp eax, 6
    je LinkedList_containsAll_vd2_10_assign_ok
    cmp eax, 8
    je LinkedList_containsAll_vd2_10_assign_ok
    cmp eax, 12
    je LinkedList_containsAll_vd2_10_assign_ok
    jmp LinkedList_containsAll_vd2_10_type
LinkedList_containsAll_vd2_10_assign_ok:
    cmp eax, 6
    je LinkedList_containsAll_vd2_10_ovr0
    cmp eax, 8
    je LinkedList_containsAll_vd2_10_ovr1
    cmp eax, 12
    je LinkedList_containsAll_vd2_10_ovr2
    jmp LinkedList_containsAll_vd2_10_default
LinkedList_containsAll_vd2_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je LinkedList_containsAll_vd2_11_null
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp LinkedList_containsAll_vd2_11_done
LinkedList_containsAll_vd2_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_containsAll_vd2_11_done:
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
    jne pulsec_pulse_collections_LinkedList_containsAll__Collection_b4
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b5
pulsec_pulse_collections_LinkedList_containsAll__Collection_b3:
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_containsAll__Collection_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_containsAll__Collection_b5:
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b6
pulsec_pulse_collections_LinkedList_containsAll__Collection_b6:
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b1
pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue:
pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_containsAll__Collection endp

pulsec_pulse_collections_LinkedList_removeAll__Collection proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_LinkedList_removeAll__Collection_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b2
pulsec_pulse_collections_LinkedList_removeAll__Collection_b1:
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je LinkedList_removeAll_vd1_5_null
    call pulsec_pulse_collections_LinkedList_isEmpty
    jmp LinkedList_removeAll_vd1_5_done
LinkedList_removeAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeAll_vd1_5_done:
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_null
    call pulsec_pulse_collections_LinkedList_clear
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_done
pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_done:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_removeAll__Collection_b2:
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b3
pulsec_pulse_collections_LinkedList_removeAll__Collection_b3:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd5_14_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd5_14_type
    cmp eax, 1
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 3
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 7
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 9
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 10
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 11
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 14
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 17
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 18
    je LinkedList_removeAll_vd5_14_assign_ok
    jmp LinkedList_removeAll_vd5_14_type
LinkedList_removeAll_vd5_14_assign_ok:
    cmp eax, 1
    je LinkedList_removeAll_vd5_14_ovr0
    cmp eax, 7
    je LinkedList_removeAll_vd5_14_ovr1
    cmp eax, 9
    je LinkedList_removeAll_vd5_14_ovr2
    cmp eax, 10
    je LinkedList_removeAll_vd5_14_ovr3
    cmp eax, 11
    je LinkedList_removeAll_vd5_14_ovr4
    jmp LinkedList_removeAll_vd5_14_default
LinkedList_removeAll_vd5_14_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd5_14_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b4
pulsec_pulse_collections_LinkedList_removeAll__Collection_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd6_17_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd6_17_type
    cmp eax, 6
    je LinkedList_removeAll_vd6_17_assign_ok
    cmp eax, 8
    je LinkedList_removeAll_vd6_17_assign_ok
    cmp eax, 12
    je LinkedList_removeAll_vd6_17_assign_ok
    jmp LinkedList_removeAll_vd6_17_type
LinkedList_removeAll_vd6_17_assign_ok:
    cmp eax, 6
    je LinkedList_removeAll_vd6_17_ovr0
    cmp eax, 8
    je LinkedList_removeAll_vd6_17_ovr1
    cmp eax, 12
    je LinkedList_removeAll_vd6_17_ovr2
    jmp LinkedList_removeAll_vd6_17_default
LinkedList_removeAll_vd6_17_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd6_17_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b6
pulsec_pulse_collections_LinkedList_removeAll__Collection_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd7_20_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd7_20_type
    cmp eax, 6
    je LinkedList_removeAll_vd7_20_assign_ok
    cmp eax, 8
    je LinkedList_removeAll_vd7_20_assign_ok
    cmp eax, 12
    je LinkedList_removeAll_vd7_20_assign_ok
    jmp LinkedList_removeAll_vd7_20_type
LinkedList_removeAll_vd7_20_assign_ok:
    cmp eax, 6
    je LinkedList_removeAll_vd7_20_ovr0
    cmp eax, 8
    je LinkedList_removeAll_vd7_20_ovr1
    cmp eax, 12
    je LinkedList_removeAll_vd7_20_ovr2
    jmp LinkedList_removeAll_vd7_20_default
LinkedList_removeAll_vd7_20_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd7_20_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b7
pulsec_pulse_collections_LinkedList_removeAll__Collection_b6:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_removeAll__Collection_b7:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je LinkedList_removeAll_vd8_24_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_removeAll_vd8_24_done
LinkedList_removeAll_vd8_24_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeAll_vd8_24_done:
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b8
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b9
pulsec_pulse_collections_LinkedList_removeAll__Collection_b8:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b7
pulsec_pulse_collections_LinkedList_removeAll__Collection_b9:
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b4
pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue:
pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_removeAll__Collection endp

pulsec_pulse_collections_LinkedList_retainAll__Collection proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_retainAll__Collection_b0:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b2
pulsec_pulse_collections_LinkedList_retainAll__Collection_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_retainAll__Collection_b2:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b3
pulsec_pulse_collections_LinkedList_retainAll__Collection_b3:
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_null
    call pulsec_pulse_collections_ArrayList_addAll__Collection
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_done
pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd5_12_null
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_retainAll_vd5_12_done
LinkedList_retainAll_vd5_12_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_retainAll_vd5_12_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b4
pulsec_pulse_collections_LinkedList_retainAll__Collection_b4:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd6_15_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd6_15_type
    cmp eax, 6
    je LinkedList_retainAll_vd6_15_assign_ok
    cmp eax, 8
    je LinkedList_retainAll_vd6_15_assign_ok
    cmp eax, 12
    je LinkedList_retainAll_vd6_15_assign_ok
    jmp LinkedList_retainAll_vd6_15_type
LinkedList_retainAll_vd6_15_assign_ok:
    cmp eax, 6
    je LinkedList_retainAll_vd6_15_ovr0
    cmp eax, 8
    je LinkedList_retainAll_vd6_15_ovr1
    cmp eax, 12
    je LinkedList_retainAll_vd6_15_ovr2
    jmp LinkedList_retainAll_vd6_15_default
LinkedList_retainAll_vd6_15_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd6_15_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b6
pulsec_pulse_collections_LinkedList_retainAll__Collection_b5:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd7_18_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd7_18_type
    cmp eax, 6
    je LinkedList_retainAll_vd7_18_assign_ok
    cmp eax, 8
    je LinkedList_retainAll_vd7_18_assign_ok
    cmp eax, 12
    je LinkedList_retainAll_vd7_18_assign_ok
    jmp LinkedList_retainAll_vd7_18_type
LinkedList_retainAll_vd7_18_assign_ok:
    cmp eax, 6
    je LinkedList_retainAll_vd7_18_ovr0
    cmp eax, 8
    je LinkedList_retainAll_vd7_18_ovr1
    cmp eax, 12
    je LinkedList_retainAll_vd7_18_ovr2
    jmp LinkedList_retainAll_vd7_18_default
LinkedList_retainAll_vd7_18_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd7_18_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd8_22_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd8_22_type
    cmp eax, 1
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 3
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 7
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 9
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 10
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 11
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 14
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 17
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 18
    je LinkedList_retainAll_vd8_22_assign_ok
    jmp LinkedList_retainAll_vd8_22_type
LinkedList_retainAll_vd8_22_assign_ok:
    cmp eax, 1
    je LinkedList_retainAll_vd8_22_ovr0
    cmp eax, 7
    je LinkedList_retainAll_vd8_22_ovr1
    cmp eax, 9
    je LinkedList_retainAll_vd8_22_ovr2
    cmp eax, 10
    je LinkedList_retainAll_vd8_22_ovr3
    cmp eax, 11
    je LinkedList_retainAll_vd8_22_ovr4
    cmp eax, 18
    je LinkedList_retainAll_vd8_22_ovr5
    jmp LinkedList_retainAll_vd8_22_default
LinkedList_retainAll_vd8_22_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeySetView_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValuesView_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashSet_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Set_contains__String
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd8_22_done:
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b7
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b8
pulsec_pulse_collections_LinkedList_retainAll__Collection_b6:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_retainAll__Collection_b7:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+96]
    test rcx, rcx
    je LinkedList_retainAll_vd9_27_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_retainAll_vd9_27_done
LinkedList_retainAll_vd9_27_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_retainAll_vd9_27_done:
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b10
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b11
pulsec_pulse_collections_LinkedList_retainAll__Collection_b8:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b9
pulsec_pulse_collections_LinkedList_retainAll__Collection_b9:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b4
pulsec_pulse_collections_LinkedList_retainAll__Collection_b10:
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b12
pulsec_pulse_collections_LinkedList_retainAll__Collection_b11:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b12
pulsec_pulse_collections_LinkedList_retainAll__Collection_b12:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b9
pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue:
pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_retainAll__Collection endp

pulsec_pulse_collections_LinkedList_add__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_add__int_Object_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_Object_epilogue
pulsec_pulse_collections_LinkedList_add__int_Object_epilogue:
pulsec_pulse_collections_LinkedList_add__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_Object endp

pulsec_pulse_collections_LinkedList_add__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_LinkedList_add__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertIntValue__int_int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_int_epilogue
pulsec_pulse_collections_LinkedList_add__int_int_epilogue:
pulsec_pulse_collections_LinkedList_add__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_int endp

pulsec_pulse_collections_LinkedList_add__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_add__int_String_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_String_epilogue
pulsec_pulse_collections_LinkedList_add__int_String_epilogue:
pulsec_pulse_collections_LinkedList_add__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_String endp

pulsec_pulse_collections_LinkedList_get__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_get__int_b0:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_get__int_b1
    jmp pulsec_pulse_collections_LinkedList_get__int_b2
pulsec_pulse_collections_LinkedList_get__int_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_get__int_epilogue
pulsec_pulse_collections_LinkedList_get__int_b2:
    jmp pulsec_pulse_collections_LinkedList_get__int_b3
pulsec_pulse_collections_LinkedList_get__int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_get__int_epilogue
pulsec_pulse_collections_LinkedList_get__int_epilogue:
pulsec_pulse_collections_LinkedList_get__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_get__int endp

pulsec_pulse_collections_LinkedList_getInt__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_getInt__int_b0:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getInt__int_b1
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b2
pulsec_pulse_collections_LinkedList_getInt__int_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_b2:
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b3
pulsec_pulse_collections_LinkedList_getInt__int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getInt__int_b4
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b5
pulsec_pulse_collections_LinkedList_getInt__int_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_b5:
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b6
pulsec_pulse_collections_LinkedList_getInt__int_b6:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_epilogue:
pulsec_pulse_collections_LinkedList_getInt__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_getInt__int endp

pulsec_pulse_collections_LinkedList_getString__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_getString__int_b0:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getString__int_b1
    jmp pulsec_pulse_collections_LinkedList_getString__int_b2
pulsec_pulse_collections_LinkedList_getString__int_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getString__int_epilogue
pulsec_pulse_collections_LinkedList_getString__int_b2:
    jmp pulsec_pulse_collections_LinkedList_getString__int_b3
pulsec_pulse_collections_LinkedList_getString__int_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getValue
    test rax, rax
    je LinkedList_getString_cast_3_11_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_getString_cast_3_11_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_getString_cast_3_11_ok
LinkedList_getString_cast_3_11_fail:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_getString_cast_3_11_done
LinkedList_getString_cast_3_11_null:
    xor eax, eax
    jmp LinkedList_getString_cast_3_11_done
LinkedList_getString_cast_3_11_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_getString_cast_3_11_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_getString__int_epilogue
pulsec_pulse_collections_LinkedList_getString__int_epilogue:
pulsec_pulse_collections_LinkedList_getString__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_getString__int endp

pulsec_pulse_collections_LinkedList_remove__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_remove__int_b0:
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_LinkedList_remove__int_epilogue
pulsec_pulse_collections_LinkedList_remove__int_epilogue:
pulsec_pulse_collections_LinkedList_remove__int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_remove__int endp

pulsec_pulse_collections_LinkedList_remove__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_remove__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
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
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b1
pulsec_pulse_collections_LinkedList_remove__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove__Object_b2
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b3
pulsec_pulse_collections_LinkedList_remove__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_remove_ternary_then_2_17
    mov eax, 0
    jmp LinkedList_remove_ternary_done_2_17
LinkedList_remove_ternary_then_2_17:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
LinkedList_remove_ternary_done_2_17:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove__Object_b4
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b5
pulsec_pulse_collections_LinkedList_remove__Object_b3:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_remove__Object_epilogue
pulsec_pulse_collections_LinkedList_remove__Object_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_remove__Object_epilogue
pulsec_pulse_collections_LinkedList_remove__Object_b5:
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b6
pulsec_pulse_collections_LinkedList_remove__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b1
pulsec_pulse_collections_LinkedList_remove__Object_epilogue:
pulsec_pulse_collections_LinkedList_remove__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_remove__Object endp

pulsec_pulse_collections_LinkedList_set__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_set__int_Object_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_LinkedList_set__int_Object_epilogue
pulsec_pulse_collections_LinkedList_set__int_Object_epilogue:
pulsec_pulse_collections_LinkedList_set__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_Object endp

pulsec_pulse_collections_LinkedList_set__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_LinkedList_set__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceIntValue__int_int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_set__int_int_epilogue
pulsec_pulse_collections_LinkedList_set__int_int_epilogue:
pulsec_pulse_collections_LinkedList_set__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_int endp

pulsec_pulse_collections_LinkedList_set__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_set__int_String_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test rax, rax
    je LinkedList_set_cast_0_5_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_set_cast_0_5_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_set_cast_0_5_ok
LinkedList_set_cast_0_5_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_set_cast_0_5_done
LinkedList_set_cast_0_5_null:
    xor eax, eax
    jmp LinkedList_set_cast_0_5_done
LinkedList_set_cast_0_5_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_set_cast_0_5_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_set__int_String_epilogue
pulsec_pulse_collections_LinkedList_set__int_String_epilogue:
pulsec_pulse_collections_LinkedList_set__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_String endp

pulsec_pulse_collections_LinkedList_contains__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_contains__Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+80], rax
    mov eax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__Object_epilogue
pulsec_pulse_collections_LinkedList_contains__Object_epilogue:
pulsec_pulse_collections_LinkedList_contains__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__Object endp

pulsec_pulse_collections_LinkedList_contains__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_contains__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIntIndex__int
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__int_epilogue
pulsec_pulse_collections_LinkedList_contains__int_epilogue:
pulsec_pulse_collections_LinkedList_contains__int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__int endp

pulsec_pulse_collections_LinkedList_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_contains__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+80], rax
    mov eax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__String_epilogue
pulsec_pulse_collections_LinkedList_contains__String_epilogue:
pulsec_pulse_collections_LinkedList_contains__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__String endp

pulsec_pulse_collections_LinkedList_indexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_indexOf__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue
pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue:
pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__Object endp

pulsec_pulse_collections_LinkedList_indexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_indexOf__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIntIndex__int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_indexOf__int_epilogue
pulsec_pulse_collections_LinkedList_indexOf__int_epilogue:
pulsec_pulse_collections_LinkedList_indexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__int endp

pulsec_pulse_collections_LinkedList_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_indexOf__String_b0:
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
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_indexOf__String_epilogue
pulsec_pulse_collections_LinkedList_indexOf__String_epilogue:
pulsec_pulse_collections_LinkedList_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__String endp

pulsec_pulse_collections_LinkedList_lastIndexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_findLastIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue:
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__Object endp

pulsec_pulse_collections_LinkedList_lastIndexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_lastIndexOf__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findLastIntIndex__int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue:
pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__int endp

pulsec_pulse_collections_LinkedList_lastIndexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_lastIndexOf__String_b0:
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
    call pulsec_pulse_collections_LinkedList_findLastIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue:
pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__String endp

pulsec_pulse_collections_LinkedList_offer__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offer__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offer__Object_epilogue
pulsec_pulse_collections_LinkedList_offer__Object_epilogue:
pulsec_pulse_collections_LinkedList_offer__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__Object endp

pulsec_pulse_collections_LinkedList_offer__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offer__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    mov eax, eax
    jmp pulsec_pulse_collections_LinkedList_offer__int_epilogue
pulsec_pulse_collections_LinkedList_offer__int_epilogue:
pulsec_pulse_collections_LinkedList_offer__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__int endp

pulsec_pulse_collections_LinkedList_offer__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offer__String_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offer__String_epilogue
pulsec_pulse_collections_LinkedList_offer__String_epilogue:
pulsec_pulse_collections_LinkedList_offer__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__String endp

pulsec_pulse_collections_LinkedList_poll proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_poll_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_poll_b1
    jmp pulsec_pulse_collections_LinkedList_poll_b2
pulsec_pulse_collections_LinkedList_poll_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_poll_epilogue
pulsec_pulse_collections_LinkedList_poll_b2:
    jmp pulsec_pulse_collections_LinkedList_poll_b3
pulsec_pulse_collections_LinkedList_poll_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_poll_epilogue
pulsec_pulse_collections_LinkedList_poll_epilogue:
pulsec_pulse_collections_LinkedList_poll_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_poll endp

pulsec_pulse_collections_LinkedList_remove proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_remove_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove_b1
    jmp pulsec_pulse_collections_LinkedList_remove_b2
pulsec_pulse_collections_LinkedList_remove_b1:
    lea rcx, msg12
    mov edx, msg12_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_remove_epilogue
pulsec_pulse_collections_LinkedList_remove_b2:
    jmp pulsec_pulse_collections_LinkedList_remove_b3
pulsec_pulse_collections_LinkedList_remove_b3:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_remove_vd3_11_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_remove_vd3_11_done
LinkedList_remove_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_remove_vd3_11_done:
    jmp pulsec_pulse_collections_LinkedList_remove_epilogue
pulsec_pulse_collections_LinkedList_remove_epilogue:
pulsec_pulse_collections_LinkedList_remove_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_remove endp

pulsec_pulse_collections_LinkedList_peek proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peek_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_peek_b1
    jmp pulsec_pulse_collections_LinkedList_peek_b2
pulsec_pulse_collections_LinkedList_peek_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_peek_epilogue
pulsec_pulse_collections_LinkedList_peek_b2:
    jmp pulsec_pulse_collections_LinkedList_peek_b3
pulsec_pulse_collections_LinkedList_peek_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_peek_epilogue
pulsec_pulse_collections_LinkedList_peek_epilogue:
pulsec_pulse_collections_LinkedList_peek_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_peek endp

pulsec_pulse_collections_LinkedList_element proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_element_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_element_b1
    jmp pulsec_pulse_collections_LinkedList_element_b2
pulsec_pulse_collections_LinkedList_element_b1:
    lea rcx, msg13
    mov edx, msg13_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_element_epilogue
pulsec_pulse_collections_LinkedList_element_b2:
    jmp pulsec_pulse_collections_LinkedList_element_b3
pulsec_pulse_collections_LinkedList_element_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_element_epilogue
pulsec_pulse_collections_LinkedList_element_epilogue:
pulsec_pulse_collections_LinkedList_element_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_element endp

pulsec_pulse_collections_LinkedList_addFirst__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addFirst__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue
pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue:
pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__Object endp

pulsec_pulse_collections_LinkedList_offerFirst__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerFirst__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue:
pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__Object endp

pulsec_pulse_collections_LinkedList_addFirst__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_addFirst__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__int_epilogue
pulsec_pulse_collections_LinkedList_addFirst__int_epilogue:
pulsec_pulse_collections_LinkedList_addFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__int endp

pulsec_pulse_collections_LinkedList_addFirst__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addFirst__String_b0:
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
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__String_epilogue
pulsec_pulse_collections_LinkedList_addFirst__String_epilogue:
pulsec_pulse_collections_LinkedList_addFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__String endp

pulsec_pulse_collections_LinkedList_offerFirst__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offerFirst__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependIntValue__int
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue:
pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__int endp

pulsec_pulse_collections_LinkedList_offerFirst__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerFirst__String_b0:
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
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue:
pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__String endp

pulsec_pulse_collections_LinkedList_addLast__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addLast__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__Object_epilogue
pulsec_pulse_collections_LinkedList_addLast__Object_epilogue:
pulsec_pulse_collections_LinkedList_addLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__Object endp

pulsec_pulse_collections_LinkedList_offerLast__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerLast__Object_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue
pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue:
pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__Object endp

pulsec_pulse_collections_LinkedList_addLast__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_addLast__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__int_epilogue
pulsec_pulse_collections_LinkedList_addLast__int_epilogue:
pulsec_pulse_collections_LinkedList_addLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__int endp

pulsec_pulse_collections_LinkedList_addLast__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m65
    mov edx, trace_m65_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addLast__String_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__String_epilogue
pulsec_pulse_collections_LinkedList_addLast__String_epilogue:
pulsec_pulse_collections_LinkedList_addLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__String endp

pulsec_pulse_collections_LinkedList_offerLast__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m66
    mov edx, trace_m66_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offerLast__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    mov eax, eax
    jmp pulsec_pulse_collections_LinkedList_offerLast__int_epilogue
pulsec_pulse_collections_LinkedList_offerLast__int_epilogue:
pulsec_pulse_collections_LinkedList_offerLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__int endp

pulsec_pulse_collections_LinkedList_offerLast__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m67
    mov edx, trace_m67_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerLast__String_b0:
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
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offerLast__String_epilogue
pulsec_pulse_collections_LinkedList_offerLast__String_epilogue:
pulsec_pulse_collections_LinkedList_offerLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__String endp

pulsec_pulse_collections_LinkedList_getFirst proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m68
    mov edx, trace_m68_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_getFirst_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getFirst_b1
    jmp pulsec_pulse_collections_LinkedList_getFirst_b2
pulsec_pulse_collections_LinkedList_getFirst_b1:
    lea rcx, msg14
    mov edx, msg14_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getFirst_epilogue
pulsec_pulse_collections_LinkedList_getFirst_b2:
    jmp pulsec_pulse_collections_LinkedList_getFirst_b3
pulsec_pulse_collections_LinkedList_getFirst_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_getFirst_epilogue
pulsec_pulse_collections_LinkedList_getFirst_epilogue:
pulsec_pulse_collections_LinkedList_getFirst_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_getFirst endp

pulsec_pulse_collections_LinkedList_removeFirst proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m69
    mov edx, trace_m69_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_removeFirst_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeFirst_b1
    jmp pulsec_pulse_collections_LinkedList_removeFirst_b2
pulsec_pulse_collections_LinkedList_removeFirst_b1:
    lea rcx, msg15
    mov edx, msg15_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_pulse_collections_LinkedList_removeFirst_b2:
    jmp pulsec_pulse_collections_LinkedList_removeFirst_b3
pulsec_pulse_collections_LinkedList_removeFirst_b3:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_removeFirst_vd3_11_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_removeFirst_vd3_11_done
LinkedList_removeFirst_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeFirst_vd3_11_done:
    jmp pulsec_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_pulse_collections_LinkedList_removeFirst_epilogue:
pulsec_pulse_collections_LinkedList_removeFirst_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeFirst endp

pulsec_pulse_collections_LinkedList_peekFirst proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peekFirst_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_peekFirst_vd0_2_null
    call pulsec_pulse_collections_LinkedList_peek
    jmp LinkedList_peekFirst_vd0_2_done
LinkedList_peekFirst_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_peekFirst_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_peekFirst_epilogue
pulsec_pulse_collections_LinkedList_peekFirst_epilogue:
pulsec_pulse_collections_LinkedList_peekFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_peekFirst endp

pulsec_pulse_collections_LinkedList_pollFirst proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pollFirst_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_pollFirst_vd0_2_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_pollFirst_vd0_2_done
LinkedList_pollFirst_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_pollFirst_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_pollFirst_epilogue
pulsec_pulse_collections_LinkedList_pollFirst_epilogue:
pulsec_pulse_collections_LinkedList_pollFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_pollFirst endp

pulsec_pulse_collections_LinkedList_removeLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_removeLast_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLast_b1
    jmp pulsec_pulse_collections_LinkedList_removeLast_b2
pulsec_pulse_collections_LinkedList_removeLast_b1:
    lea rcx, msg16
    mov edx, msg16_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_removeLast_epilogue
pulsec_pulse_collections_LinkedList_removeLast_b2:
    jmp pulsec_pulse_collections_LinkedList_removeLast_b3
pulsec_pulse_collections_LinkedList_removeLast_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_removeLast_epilogue
pulsec_pulse_collections_LinkedList_removeLast_epilogue:
pulsec_pulse_collections_LinkedList_removeLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeLast endp

pulsec_pulse_collections_LinkedList_getLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m73
    mov edx, trace_m73_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_getLast_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getLast_b1
    jmp pulsec_pulse_collections_LinkedList_getLast_b2
pulsec_pulse_collections_LinkedList_getLast_b1:
    lea rcx, msg17
    mov edx, msg17_len
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
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getLast_epilogue
pulsec_pulse_collections_LinkedList_getLast_b2:
    jmp pulsec_pulse_collections_LinkedList_getLast_b3
pulsec_pulse_collections_LinkedList_getLast_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_getLast_epilogue
pulsec_pulse_collections_LinkedList_getLast_epilogue:
pulsec_pulse_collections_LinkedList_getLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_getLast endp

pulsec_pulse_collections_LinkedList_peekLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m74
    mov edx, trace_m74_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peekLast_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_peekLast_b1
    jmp pulsec_pulse_collections_LinkedList_peekLast_b2
pulsec_pulse_collections_LinkedList_peekLast_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_peekLast_epilogue
pulsec_pulse_collections_LinkedList_peekLast_b2:
    jmp pulsec_pulse_collections_LinkedList_peekLast_b3
pulsec_pulse_collections_LinkedList_peekLast_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_peekLast_epilogue
pulsec_pulse_collections_LinkedList_peekLast_epilogue:
pulsec_pulse_collections_LinkedList_peekLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_peekLast endp

pulsec_pulse_collections_LinkedList_pollLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m75
    mov edx, trace_m75_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pollLast_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_pollLast_b1
    jmp pulsec_pulse_collections_LinkedList_pollLast_b2
pulsec_pulse_collections_LinkedList_pollLast_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_pollLast_epilogue
pulsec_pulse_collections_LinkedList_pollLast_b2:
    jmp pulsec_pulse_collections_LinkedList_pollLast_b3
pulsec_pulse_collections_LinkedList_pollLast_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_pollLast_epilogue
pulsec_pulse_collections_LinkedList_pollLast_epilogue:
pulsec_pulse_collections_LinkedList_pollLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_pollLast endp

pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_b0:
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
    je LinkedList_removeFirstOccurrence_vd0_3_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_removeFirstOccurrence_vd0_3_done
LinkedList_removeFirstOccurrence_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeFirstOccurrence_vd0_3_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue:
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object endp

pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m77
    mov edx, trace_m77_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
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
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b2
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b3
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_removeLastOccurrence_ternary_then_2_17
    mov eax, 0
    jmp LinkedList_removeLastOccurrence_ternary_done_2_17
LinkedList_removeLastOccurrence_ternary_then_2_17:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
LinkedList_removeLastOccurrence_ternary_done_2_17:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b4
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b5
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b3:
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b5:
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b6
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue:
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object endp

pulsec_pulse_collections_LinkedList_push__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m78
    mov edx, trace_m78_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_push__Object_b0:
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
    je pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_LinkedList_addFirst__Object
    jmp pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_done
pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__Object_epilogue
pulsec_pulse_collections_LinkedList_push__Object_epilogue:
pulsec_pulse_collections_LinkedList_push__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__Object endp

pulsec_pulse_collections_LinkedList_push__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m79
    mov edx, trace_m79_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_push__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_LinkedList_addFirst__int
    jmp pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_done
pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__int_epilogue
pulsec_pulse_collections_LinkedList_push__int_epilogue:
pulsec_pulse_collections_LinkedList_push__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__int endp

pulsec_pulse_collections_LinkedList_push__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m80
    mov edx, trace_m80_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_push__String_b0:
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
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__String_epilogue
pulsec_pulse_collections_LinkedList_push__String_epilogue:
pulsec_pulse_collections_LinkedList_push__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__String endp

pulsec_pulse_collections_LinkedList_pop proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m81
    mov edx, trace_m81_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pop_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_pop_vd0_2_null
    call pulsec_pulse_collections_LinkedList_removeFirst
    jmp LinkedList_pop_vd0_2_done
LinkedList_pop_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_pop_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_pop_epilogue
pulsec_pulse_collections_LinkedList_pop_epilogue:
pulsec_pulse_collections_LinkedList_pop_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_pop endp

end
