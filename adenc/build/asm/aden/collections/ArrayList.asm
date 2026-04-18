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
extrn adenc_rt_dispatchNullReceiverPanic:proc
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
extrn adenc_aden_collections_LinkedList_LinkedList:proc
extrn adenc_aden_collections_LinkedList_addAll__Collection:proc
extrn adenc_aden_collections_LinkedList_add__Object:proc
extrn adenc_aden_collections_LinkedList_add__String:proc
extrn adenc_aden_collections_LinkedList_add__int:proc
extrn adenc_aden_collections_LinkedList_add__int_Object:proc
extrn adenc_aden_collections_LinkedList_add__int_String:proc
extrn adenc_aden_collections_LinkedList_add__int_int:proc
extrn adenc_aden_collections_LinkedList_clear:proc
extrn adenc_aden_collections_LinkedList_containsAll__Collection:proc
extrn adenc_aden_collections_LinkedList_contains__Object:proc
extrn adenc_aden_collections_LinkedList_contains__String:proc
extrn adenc_aden_collections_LinkedList_contains__int:proc
extrn adenc_aden_collections_LinkedList_getFirst:proc
extrn adenc_aden_collections_LinkedList_getInt__int:proc
extrn adenc_aden_collections_LinkedList_getLast:proc
extrn adenc_aden_collections_LinkedList_getString__int:proc
extrn adenc_aden_collections_LinkedList_get__int:proc
extrn adenc_aden_collections_LinkedList_indexOf__Object:proc
extrn adenc_aden_collections_LinkedList_indexOf__String:proc
extrn adenc_aden_collections_LinkedList_indexOf__int:proc
extrn adenc_aden_collections_LinkedList_isEmpty:proc
extrn adenc_aden_collections_LinkedList_iterator:proc
extrn adenc_aden_collections_LinkedList_lastIndexOf__Object:proc
extrn adenc_aden_collections_LinkedList_lastIndexOf__String:proc
extrn adenc_aden_collections_LinkedList_lastIndexOf__int:proc
extrn adenc_aden_collections_LinkedList_removeAll__Collection:proc
extrn adenc_aden_collections_LinkedList_remove__Object:proc
extrn adenc_aden_collections_LinkedList_remove__int:proc
extrn adenc_aden_collections_LinkedList_retainAll__Collection:proc
extrn adenc_aden_collections_LinkedList_set__int_Object:proc
extrn adenc_aden_collections_LinkedList_set__int_String:proc
extrn adenc_aden_collections_LinkedList_set__int_int:proc
extrn adenc_aden_collections_LinkedList_size:proc
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

public adenc_fld_aden_collections_ArrayList_values
public adenc_fld_aden_collections_ArrayList_values_heap_owned

.data
written dq 0
adenc_objc_aden_collections_ArrayList dd 0
adenc_fcap_aden_collections_ArrayList dd 63
adenc_fld_aden_collections_ArrayList_values_tbl dq 64 dup(0)
adenc_fld_aden_collections_ArrayList_values dq adenc_fld_aden_collections_ArrayList_values_tbl
adenc_fld_aden_collections_ArrayList_values_heap_owned dd 0
trace_m0 db "aden.collections.ArrayList.requireElementIndex"
trace_m0_len equ 46
adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 65, 114, 114, 97, 121, 76, 105, 115, 116, 46, 114, 101, 113, 117, 105
    db 114, 101, 69, 108, 101, 109, 101, 110, 116, 73, 110, 100, 101, 120, 40, 65, 114, 114, 97, 121, 76, 105, 115, 116, 46, 97, 100, 101, 110, 58, 49, 55
    db 41
adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0_len equ 65
adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s1 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 65, 114, 114, 97, 121, 76, 105, 115, 116, 46, 114, 101, 113, 117, 105
    db 114, 101, 69, 108, 101, 109, 101, 110, 116, 73, 110, 100, 101, 120, 40, 65, 114, 114, 97, 121, 76, 105, 115, 116, 46, 97, 100, 101, 110, 58, 49, 56
    db 41
adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s1_len equ 65
trace_m3 db "aden.collections.ArrayList.requireInsertIndex"
trace_m3_len equ 45
adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0 db "aden.collections.ArrayList.requireInsertIndex(ArrayList.aden:26)"
adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0_len equ 64
adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s1 db "aden.collections.ArrayList.requireInsertIndex(ArrayList.aden:27)"
adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s1_len equ 64
trace_m6 db "aden.collections.ArrayList.ArrayList"
trace_m6_len equ 36
adenc_aden_collections_ArrayList_ArrayList_trace_s0 db "aden.collections.ArrayList.ArrayList(ArrayList.aden:35)"
adenc_aden_collections_ArrayList_ArrayList_trace_s0_len equ 55
trace_m8 db "aden.collections.ArrayList.size"
trace_m8_len equ 31
adenc_aden_collections_ArrayList_size_trace_s0 db "aden.collections.ArrayList.size(ArrayList.aden:42)"
adenc_aden_collections_ArrayList_size_trace_s0_len equ 50
trace_m10 db "aden.collections.ArrayList.iterator"
trace_m10_len equ 35
adenc_aden_collections_ArrayList_iterator_trace_s0 db "aden.collections.ArrayList.iterator(ArrayList.aden:49)"
adenc_aden_collections_ArrayList_iterator_trace_s0_len equ 54
trace_m12 db "aden.collections.ArrayList.isEmpty"
trace_m12_len equ 34
adenc_aden_collections_ArrayList_isEmpty_trace_s0 db "aden.collections.ArrayList.isEmpty(ArrayList.aden:56)"
adenc_aden_collections_ArrayList_isEmpty_trace_s0_len equ 53
trace_m14 db "aden.collections.ArrayList.clear"
trace_m14_len equ 32
adenc_aden_collections_ArrayList_clear_trace_s0 db "aden.collections.ArrayList.clear(ArrayList.aden:63)"
adenc_aden_collections_ArrayList_clear_trace_s0_len equ 51
trace_m16 db "aden.collections.ArrayList.add"
trace_m16_len equ 30
adenc_aden_collections_ArrayList_add__Object_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:70)"
adenc_aden_collections_ArrayList_add__Object_trace_s0_len equ 49
trace_m18 db "aden.collections.ArrayList.add"
trace_m18_len equ 30
adenc_aden_collections_ArrayList_add__int_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:77)"
adenc_aden_collections_ArrayList_add__int_trace_s0_len equ 49
trace_m20 db "aden.collections.ArrayList.add"
trace_m20_len equ 30
adenc_aden_collections_ArrayList_add__String_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:84)"
adenc_aden_collections_ArrayList_add__String_trace_s0_len equ 49
trace_m22 db "aden.collections.ArrayList.addAll"
trace_m22_len equ 33
adenc_aden_collections_ArrayList_addAll__Collection_trace_s0 db "aden.collections.ArrayList.addAll(ArrayList.aden:91)"
adenc_aden_collections_ArrayList_addAll__Collection_trace_s0_len equ 52
adenc_aden_collections_ArrayList_addAll__Collection_trace_s1 db "aden.collections.ArrayList.addAll(ArrayList.aden:92)"
adenc_aden_collections_ArrayList_addAll__Collection_trace_s1_len equ 52
adenc_aden_collections_ArrayList_addAll__Collection_trace_s2 db "aden.collections.ArrayList.addAll(ArrayList.aden:94)"
adenc_aden_collections_ArrayList_addAll__Collection_trace_s2_len equ 52
trace_m26 db "aden.collections.ArrayList.containsAll"
trace_m26_len equ 38
adenc_aden_collections_ArrayList_containsAll__Collection_trace_s0 db "aden.collections.ArrayList.containsAll(ArrayList.aden:101)"
adenc_aden_collections_ArrayList_containsAll__Collection_trace_s0_len equ 58
trace_m28 db "aden.collections.ArrayList.removeAll"
trace_m28_len equ 36
adenc_aden_collections_ArrayList_removeAll__Collection_trace_s0 db "aden.collections.ArrayList.removeAll(ArrayList.aden:108)"
adenc_aden_collections_ArrayList_removeAll__Collection_trace_s0_len equ 56
trace_m30 db "aden.collections.ArrayList.retainAll"
trace_m30_len equ 36
adenc_aden_collections_ArrayList_retainAll__Collection_trace_s0 db "aden.collections.ArrayList.retainAll(ArrayList.aden:115)"
adenc_aden_collections_ArrayList_retainAll__Collection_trace_s0_len equ 56
trace_m32 db "aden.collections.ArrayList.add"
trace_m32_len equ 30
adenc_aden_collections_ArrayList_add__int_Object_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:122)"
adenc_aden_collections_ArrayList_add__int_Object_trace_s0_len equ 50
adenc_aden_collections_ArrayList_add__int_Object_trace_s1 db "aden.collections.ArrayList.add(ArrayList.aden:123)"
adenc_aden_collections_ArrayList_add__int_Object_trace_s1_len equ 50
trace_m35 db "aden.collections.ArrayList.add"
trace_m35_len equ 30
adenc_aden_collections_ArrayList_add__int_int_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:130)"
adenc_aden_collections_ArrayList_add__int_int_trace_s0_len equ 50
adenc_aden_collections_ArrayList_add__int_int_trace_s1 db "aden.collections.ArrayList.add(ArrayList.aden:131)"
adenc_aden_collections_ArrayList_add__int_int_trace_s1_len equ 50
trace_m38 db "aden.collections.ArrayList.add"
trace_m38_len equ 30
adenc_aden_collections_ArrayList_add__int_String_trace_s0 db "aden.collections.ArrayList.add(ArrayList.aden:138)"
adenc_aden_collections_ArrayList_add__int_String_trace_s0_len equ 50
adenc_aden_collections_ArrayList_add__int_String_trace_s1 db "aden.collections.ArrayList.add(ArrayList.aden:139)"
adenc_aden_collections_ArrayList_add__int_String_trace_s1_len equ 50
trace_m41 db "aden.collections.ArrayList.get"
trace_m41_len equ 30
adenc_aden_collections_ArrayList_get__int_trace_s0 db "aden.collections.ArrayList.get(ArrayList.aden:146)"
adenc_aden_collections_ArrayList_get__int_trace_s0_len equ 50
adenc_aden_collections_ArrayList_get__int_trace_s1 db "aden.collections.ArrayList.get(ArrayList.aden:147)"
adenc_aden_collections_ArrayList_get__int_trace_s1_len equ 50
trace_m44 db "aden.collections.ArrayList.getFirst"
trace_m44_len equ 35
adenc_aden_collections_ArrayList_getFirst_trace_s0 db "aden.collections.ArrayList.getFirst(ArrayList.aden:154)"
adenc_aden_collections_ArrayList_getFirst_trace_s0_len equ 55
adenc_aden_collections_ArrayList_getFirst_trace_s1 db "aden.collections.ArrayList.getFirst(ArrayList.aden:155)"
adenc_aden_collections_ArrayList_getFirst_trace_s1_len equ 55
adenc_aden_collections_ArrayList_getFirst_trace_s2 db "aden.collections.ArrayList.getFirst(ArrayList.aden:157)"
adenc_aden_collections_ArrayList_getFirst_trace_s2_len equ 55
trace_m48 db "aden.collections.ArrayList.getLast"
trace_m48_len equ 34
adenc_aden_collections_ArrayList_getLast_trace_s0 db "aden.collections.ArrayList.getLast(ArrayList.aden:164)"
adenc_aden_collections_ArrayList_getLast_trace_s0_len equ 54
adenc_aden_collections_ArrayList_getLast_trace_s1 db "aden.collections.ArrayList.getLast(ArrayList.aden:165)"
adenc_aden_collections_ArrayList_getLast_trace_s1_len equ 54
adenc_aden_collections_ArrayList_getLast_trace_s2 db "aden.collections.ArrayList.getLast(ArrayList.aden:167)"
adenc_aden_collections_ArrayList_getLast_trace_s2_len equ 54
trace_m52 db "aden.collections.ArrayList.getInt"
trace_m52_len equ 33
adenc_aden_collections_ArrayList_getInt__int_trace_s0 db "aden.collections.ArrayList.getInt(ArrayList.aden:174)"
adenc_aden_collections_ArrayList_getInt__int_trace_s0_len equ 53
adenc_aden_collections_ArrayList_getInt__int_trace_s1 db "aden.collections.ArrayList.getInt(ArrayList.aden:175)"
adenc_aden_collections_ArrayList_getInt__int_trace_s1_len equ 53
trace_m55 db "aden.collections.ArrayList.getString"
trace_m55_len equ 36
adenc_aden_collections_ArrayList_getString__int_trace_s0 db "aden.collections.ArrayList.getString(ArrayList.aden:182)"
adenc_aden_collections_ArrayList_getString__int_trace_s0_len equ 56
adenc_aden_collections_ArrayList_getString__int_trace_s1 db "aden.collections.ArrayList.getString(ArrayList.aden:183)"
adenc_aden_collections_ArrayList_getString__int_trace_s1_len equ 56
trace_m58 db "aden.collections.ArrayList.remove"
trace_m58_len equ 33
adenc_aden_collections_ArrayList_remove__int_trace_s0 db "aden.collections.ArrayList.remove(ArrayList.aden:190)"
adenc_aden_collections_ArrayList_remove__int_trace_s0_len equ 53
adenc_aden_collections_ArrayList_remove__int_trace_s1 db "aden.collections.ArrayList.remove(ArrayList.aden:191)"
adenc_aden_collections_ArrayList_remove__int_trace_s1_len equ 53
trace_m61 db "aden.collections.ArrayList.remove"
trace_m61_len equ 33
adenc_aden_collections_ArrayList_remove__Object_trace_s0 db "aden.collections.ArrayList.remove(ArrayList.aden:198)"
adenc_aden_collections_ArrayList_remove__Object_trace_s0_len equ 53
trace_m63 db "aden.collections.ArrayList.set"
trace_m63_len equ 30
adenc_aden_collections_ArrayList_set__int_Object_trace_s0 db "aden.collections.ArrayList.set(ArrayList.aden:205)"
adenc_aden_collections_ArrayList_set__int_Object_trace_s0_len equ 50
adenc_aden_collections_ArrayList_set__int_Object_trace_s1 db "aden.collections.ArrayList.set(ArrayList.aden:206)"
adenc_aden_collections_ArrayList_set__int_Object_trace_s1_len equ 50
trace_m66 db "aden.collections.ArrayList.set"
trace_m66_len equ 30
adenc_aden_collections_ArrayList_set__int_int_trace_s0 db "aden.collections.ArrayList.set(ArrayList.aden:213)"
adenc_aden_collections_ArrayList_set__int_int_trace_s0_len equ 50
adenc_aden_collections_ArrayList_set__int_int_trace_s1 db "aden.collections.ArrayList.set(ArrayList.aden:214)"
adenc_aden_collections_ArrayList_set__int_int_trace_s1_len equ 50
trace_m69 db "aden.collections.ArrayList.set"
trace_m69_len equ 30
adenc_aden_collections_ArrayList_set__int_String_trace_s0 db "aden.collections.ArrayList.set(ArrayList.aden:221)"
adenc_aden_collections_ArrayList_set__int_String_trace_s0_len equ 50
adenc_aden_collections_ArrayList_set__int_String_trace_s1 db "aden.collections.ArrayList.set(ArrayList.aden:222)"
adenc_aden_collections_ArrayList_set__int_String_trace_s1_len equ 50
trace_m72 db "aden.collections.ArrayList.contains"
trace_m72_len equ 35
adenc_aden_collections_ArrayList_contains__Object_trace_s0 db "aden.collections.ArrayList.contains(ArrayList.aden:229)"
adenc_aden_collections_ArrayList_contains__Object_trace_s0_len equ 55
trace_m74 db "aden.collections.ArrayList.contains"
trace_m74_len equ 35
adenc_aden_collections_ArrayList_contains__int_trace_s0 db "aden.collections.ArrayList.contains(ArrayList.aden:236)"
adenc_aden_collections_ArrayList_contains__int_trace_s0_len equ 55
trace_m76 db "aden.collections.ArrayList.contains"
trace_m76_len equ 35
adenc_aden_collections_ArrayList_contains__String_trace_s0 db "aden.collections.ArrayList.contains(ArrayList.aden:243)"
adenc_aden_collections_ArrayList_contains__String_trace_s0_len equ 55
trace_m78 db "aden.collections.ArrayList.indexOf"
trace_m78_len equ 34
adenc_aden_collections_ArrayList_indexOf__Object_trace_s0 db "aden.collections.ArrayList.indexOf(ArrayList.aden:250)"
adenc_aden_collections_ArrayList_indexOf__Object_trace_s0_len equ 54
trace_m80 db "aden.collections.ArrayList.indexOf"
trace_m80_len equ 34
adenc_aden_collections_ArrayList_indexOf__int_trace_s0 db "aden.collections.ArrayList.indexOf(ArrayList.aden:257)"
adenc_aden_collections_ArrayList_indexOf__int_trace_s0_len equ 54
trace_m82 db "aden.collections.ArrayList.indexOf"
trace_m82_len equ 34
adenc_aden_collections_ArrayList_indexOf__String_trace_s0 db "aden.collections.ArrayList.indexOf(ArrayList.aden:264)"
adenc_aden_collections_ArrayList_indexOf__String_trace_s0_len equ 54
trace_m84 db "aden.collections.ArrayList.lastIndexOf"
trace_m84_len equ 38
adenc_aden_collections_ArrayList_lastIndexOf__Object_trace_s0 db "aden.collections.ArrayList.lastIndexOf(ArrayList.aden:271)"
adenc_aden_collections_ArrayList_lastIndexOf__Object_trace_s0_len equ 58
trace_m86 db "aden.collections.ArrayList.lastIndexOf"
trace_m86_len equ 38
adenc_aden_collections_ArrayList_lastIndexOf__int_trace_s0 db "aden.collections.ArrayList.lastIndexOf(ArrayList.aden:278)"
adenc_aden_collections_ArrayList_lastIndexOf__int_trace_s0_len equ 58
trace_m88 db "aden.collections.ArrayList.lastIndexOf"
trace_m88_len equ 38
adenc_aden_collections_ArrayList_lastIndexOf__String_trace_s0 db "aden.collections.ArrayList.lastIndexOf(ArrayList.aden:285)"
adenc_aden_collections_ArrayList_lastIndexOf__String_trace_s0_len equ 58
msg0 db "ArrayList index out of bounds"
msg0_len equ 29
msg1 db "ArrayList index out of bounds"
msg1_len equ 29
msg2 db "ArrayList is empty"
msg2_len equ 18
msg3 db "ArrayList is empty"
msg3_len equ 18

.code
adenc_fcap_aden_collections_ArrayList_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_collections_ArrayList]
    jbe adenc_fcap_aden_collections_ArrayList_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_collections_ArrayList]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_collections_ArrayList_ensure_fail
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
    jz adenc_fcap_aden_collections_ArrayList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    xor esi, esi
adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_ArrayList_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_copy_loop
adenc_fcap_aden_collections_ArrayList_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_collections_ArrayList_values_heap_owned], 0
    je adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_ArrayList_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_collections_ArrayList_values], r12
    mov dword ptr [adenc_fld_aden_collections_ArrayList_values_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_collections_ArrayList], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_collections_ArrayList_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_collections_ArrayList_ensure_alloc_fail:
adenc_fcap_aden_collections_ArrayList_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_collections_ArrayList_ensure endp

adenc_fcap_aden_collections_ArrayList_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_ArrayList_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_collections_ArrayList_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_collections_ArrayList_arc_teardown_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_ArrayList_arc_teardown_done:
    ret
adenc_fcap_aden_collections_ArrayList_arc_teardown endp
adenc_fcap_aden_collections_ArrayList_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_ArrayList_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_collections_ArrayList_arc_scan_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_ArrayList_arc_scan_edges_done:
    ret
adenc_fcap_aden_collections_ArrayList_arc_scan_edges endp
adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_field_0_skip:
    add rsp, 40
adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges_done:
    ret
adenc_fcap_aden_collections_ArrayList_arc_invalidate_edges endp
adenc_aden_collections_ArrayList_requireElementIndex__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_requireElementIndex__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne ArrayList_requireElementIndex_ternary_then_0_10
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je ArrayList_requireElementIndex_vd0_8_null
    call adenc_aden_collections_LinkedList_size
    jmp ArrayList_requireElementIndex_vd0_8_done
ArrayList_requireElementIndex_vd0_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_requireElementIndex_vd0_8_done:
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp ArrayList_requireElementIndex_ternary_done_0_10
ArrayList_requireElementIndex_ternary_then_0_10:
    mov eax, 1
ArrayList_requireElementIndex_ternary_done_0_10:
    test eax, eax
    jne adenc_aden_collections_ArrayList_requireElementIndex__int_b1
    jmp adenc_aden_collections_ArrayList_requireElementIndex__int_b2
adenc_aden_collections_ArrayList_requireElementIndex__int_b1:
    lea rcx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_requireElementIndex__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_ArrayList_requireElementIndex__int_b3
adenc_aden_collections_ArrayList_requireElementIndex__int_b2:
    jmp adenc_aden_collections_ArrayList_requireElementIndex__int_b3
adenc_aden_collections_ArrayList_requireElementIndex__int_b3:
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_requireElementIndex__int_epilogue
adenc_aden_collections_ArrayList_requireElementIndex__int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_collections_ArrayList_requireElementIndex__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_aden_collections_ArrayList_requireElementIndex__int endp

adenc_aden_collections_ArrayList_requireInsertIndex__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_requireInsertIndex__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne ArrayList_requireInsertIndex_ternary_then_0_10
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je ArrayList_requireInsertIndex_vd0_8_null
    call adenc_aden_collections_LinkedList_size
    jmp ArrayList_requireInsertIndex_vd0_8_done
ArrayList_requireInsertIndex_vd0_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_requireInsertIndex_vd0_8_done:
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp ArrayList_requireInsertIndex_ternary_done_0_10
ArrayList_requireInsertIndex_ternary_then_0_10:
    mov eax, 1
ArrayList_requireInsertIndex_ternary_done_0_10:
    test eax, eax
    jne adenc_aden_collections_ArrayList_requireInsertIndex__int_b1
    jmp adenc_aden_collections_ArrayList_requireInsertIndex__int_b2
adenc_aden_collections_ArrayList_requireInsertIndex__int_b1:
    lea rcx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_requireInsertIndex__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_ArrayList_requireInsertIndex__int_b3
adenc_aden_collections_ArrayList_requireInsertIndex__int_b2:
    jmp adenc_aden_collections_ArrayList_requireInsertIndex__int_b3
adenc_aden_collections_ArrayList_requireInsertIndex__int_b3:
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_requireInsertIndex__int_epilogue
adenc_aden_collections_ArrayList_requireInsertIndex__int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_collections_ArrayList_requireInsertIndex__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_aden_collections_ArrayList_requireInsertIndex__int endp

adenc_aden_collections_ArrayList_ArrayList proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_collections_ArrayList_ArrayList_ctor_reuse
    mov ecx, 1
    call adenc_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_fcap_aden_collections_ArrayList_ensure
    mov rax, qword ptr [rsp+104]
    jmp adenc_aden_collections_ArrayList_ArrayList_ctor_ready
adenc_aden_collections_ArrayList_ArrayList_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_collections_ArrayList_ArrayList_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_ArrayList_b0:
    lea rcx, adenc_aden_collections_ArrayList_ArrayList_trace_s0
    mov edx, adenc_aden_collections_ArrayList_ArrayList_trace_s0_len
    call adenc_rt_traceUpdateTop
    xor ecx, ecx
    call adenc_aden_collections_LinkedList_LinkedList
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_collections_ArrayList_ArrayList_epilogue
adenc_aden_collections_ArrayList_ArrayList_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_ArrayList_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_ArrayList endp

adenc_aden_collections_ArrayList_size proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_size_b0:
    lea rcx, adenc_aden_collections_ArrayList_size_trace_s0
    mov edx, adenc_aden_collections_ArrayList_size_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_size_vd0_3_null
    call adenc_aden_collections_LinkedList_size
    jmp ArrayList_size_vd0_3_done
ArrayList_size_vd0_3_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_size_vd0_3_done:
    movsxd rax, eax
    jmp adenc_aden_collections_ArrayList_size_epilogue
adenc_aden_collections_ArrayList_size_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_size endp

adenc_aden_collections_ArrayList_iterator proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_iterator_b0:
    lea rcx, adenc_aden_collections_ArrayList_iterator_trace_s0
    mov edx, adenc_aden_collections_ArrayList_iterator_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_iterator_vd0_3_null
    call adenc_aden_collections_LinkedList_iterator
    jmp ArrayList_iterator_vd0_3_done
ArrayList_iterator_vd0_3_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_iterator_vd0_3_done:
    jmp adenc_aden_collections_ArrayList_iterator_epilogue
adenc_aden_collections_ArrayList_iterator_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_iterator endp

adenc_aden_collections_ArrayList_isEmpty proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_isEmpty_b0:
    lea rcx, adenc_aden_collections_ArrayList_isEmpty_trace_s0
    mov edx, adenc_aden_collections_ArrayList_isEmpty_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_isEmpty_vd0_3_null
    call adenc_aden_collections_LinkedList_isEmpty
    jmp ArrayList_isEmpty_vd0_3_done
ArrayList_isEmpty_vd0_3_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_isEmpty_vd0_3_done:
    and rax, 0FFFFFFFFh
    jmp adenc_aden_collections_ArrayList_isEmpty_epilogue
adenc_aden_collections_ArrayList_isEmpty_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_isEmpty endp

adenc_aden_collections_ArrayList_clear proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_clear_b0:
    lea rcx, adenc_aden_collections_ArrayList_clear_trace_s0
    mov edx, adenc_aden_collections_ArrayList_clear_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    test rcx, rcx
    je adenc_aden_collections_ArrayList_clear_vd_stmt_0_0_0_null
    call adenc_aden_collections_LinkedList_clear
    jmp adenc_aden_collections_ArrayList_clear_vd_stmt_0_0_0_done
adenc_aden_collections_ArrayList_clear_vd_stmt_0_0_0_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_collections_ArrayList_clear_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_clear_epilogue
adenc_aden_collections_ArrayList_clear_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_clear endp

adenc_aden_collections_ArrayList_add__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_add__Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_add_vd0_4_null
    call adenc_aden_collections_LinkedList_add__Object
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_add__Object_epilogue
adenc_aden_collections_ArrayList_add__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__Object endp

adenc_aden_collections_ArrayList_add__int proc
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
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_add__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_add_vd0_4_null
    call adenc_aden_collections_LinkedList_add__int
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    and rax, 0FFFFFFFFh
    jmp adenc_aden_collections_ArrayList_add__int_epilogue
adenc_aden_collections_ArrayList_add__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_add__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__int endp

adenc_aden_collections_ArrayList_add__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_add__String_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_add_vd0_4_null
    call adenc_aden_collections_LinkedList_add__String
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_add__String_epilogue
adenc_aden_collections_ArrayList_add__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__String endp

adenc_aden_collections_ArrayList_addAll__Collection proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_addAll__Collection_b0:
    lea rcx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s0
    mov edx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_collections_ArrayList_addAll__Collection_b1
    jmp adenc_aden_collections_ArrayList_addAll__Collection_b2
adenc_aden_collections_ArrayList_addAll__Collection_b1:
    lea rcx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s1
    mov edx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_addAll_vd1_8_null
    call adenc_aden_collections_LinkedList_addAll__Collection
    jmp ArrayList_addAll_vd1_8_done
ArrayList_addAll_vd1_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_addAll_vd1_8_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_collections_ArrayList_addAll__Collection_epilogue
adenc_aden_collections_ArrayList_addAll__Collection_b2:
    lea rcx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s0
    mov edx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_ArrayList_addAll__Collection_b3
adenc_aden_collections_ArrayList_addAll__Collection_b3:
    lea rcx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s2
    mov edx, adenc_aden_collections_ArrayList_addAll__Collection_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_addAll_vd2_13_null
    call adenc_aden_collections_LinkedList_addAll__Collection
    jmp ArrayList_addAll_vd2_13_done
ArrayList_addAll_vd2_13_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_addAll_vd2_13_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_collections_ArrayList_addAll__Collection_epilogue
adenc_aden_collections_ArrayList_addAll__Collection_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_addAll__Collection endp

adenc_aden_collections_ArrayList_containsAll__Collection proc
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
adenc_aden_collections_ArrayList_containsAll__Collection_b0:
    lea rcx, adenc_aden_collections_ArrayList_containsAll__Collection_trace_s0
    mov edx, adenc_aden_collections_ArrayList_containsAll__Collection_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_containsAll_vd0_4_null
    call adenc_aden_collections_LinkedList_containsAll__Collection
    jmp ArrayList_containsAll_vd0_4_done
ArrayList_containsAll_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_containsAll_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_containsAll__Collection_epilogue
adenc_aden_collections_ArrayList_containsAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_containsAll__Collection endp

adenc_aden_collections_ArrayList_removeAll__Collection proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_removeAll__Collection_b0:
    lea rcx, adenc_aden_collections_ArrayList_removeAll__Collection_trace_s0
    mov edx, adenc_aden_collections_ArrayList_removeAll__Collection_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_removeAll_vd0_4_null
    call adenc_aden_collections_LinkedList_removeAll__Collection
    jmp ArrayList_removeAll_vd0_4_done
ArrayList_removeAll_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_removeAll_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_removeAll__Collection_epilogue
adenc_aden_collections_ArrayList_removeAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_removeAll__Collection endp

adenc_aden_collections_ArrayList_retainAll__Collection proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_retainAll__Collection_b0:
    lea rcx, adenc_aden_collections_ArrayList_retainAll__Collection_trace_s0
    mov edx, adenc_aden_collections_ArrayList_retainAll__Collection_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_retainAll_vd0_4_null
    call adenc_aden_collections_LinkedList_retainAll__Collection
    jmp ArrayList_retainAll_vd0_4_done
ArrayList_retainAll_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_retainAll_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_retainAll__Collection_epilogue
adenc_aden_collections_ArrayList_retainAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_retainAll__Collection endp

adenc_aden_collections_ArrayList_add__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
adenc_aden_collections_ArrayList_add__int_Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__int_Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__int_Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireInsertIndex__int
    lea rcx, adenc_aden_collections_ArrayList_add__int_Object_trace_s1
    mov edx, adenc_aden_collections_ArrayList_add__int_Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    test rcx, rcx
    je adenc_aden_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_null
    call adenc_aden_collections_LinkedList_add__int_Object
    jmp adenc_aden_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_done
adenc_aden_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_add__int_Object_epilogue
adenc_aden_collections_ArrayList_add__int_Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_add__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__int_Object endp

adenc_aden_collections_ArrayList_add__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
adenc_aden_collections_ArrayList_add__int_int_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__int_int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__int_int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireInsertIndex__int
    lea rcx, adenc_aden_collections_ArrayList_add__int_int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_add__int_int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
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
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    test rcx, rcx
    je adenc_aden_collections_ArrayList_add__int_int_vd_stmt_0_1_1_null
    call adenc_aden_collections_LinkedList_add__int_int
    jmp adenc_aden_collections_ArrayList_add__int_int_vd_stmt_0_1_1_done
adenc_aden_collections_ArrayList_add__int_int_vd_stmt_0_1_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_collections_ArrayList_add__int_int_vd_stmt_0_1_1_done:
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_add__int_int_epilogue
adenc_aden_collections_ArrayList_add__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_add__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__int_int endp

adenc_aden_collections_ArrayList_add__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
adenc_aden_collections_ArrayList_add__int_String_b0:
    lea rcx, adenc_aden_collections_ArrayList_add__int_String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_add__int_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireInsertIndex__int
    lea rcx, adenc_aden_collections_ArrayList_add__int_String_trace_s1
    mov edx, adenc_aden_collections_ArrayList_add__int_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov qword ptr [rsp+144], rdx
    mov qword ptr [rsp+152], r8
    mov qword ptr [rsp+160], r9
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rdx, qword ptr [rsp+144]
    mov r8, qword ptr [rsp+152]
    mov r9, qword ptr [rsp+160]
    test rcx, rcx
    je adenc_aden_collections_ArrayList_add__int_String_vd_stmt_0_1_1_null
    call adenc_aden_collections_LinkedList_add__int_String
    jmp adenc_aden_collections_ArrayList_add__int_String_vd_stmt_0_1_1_done
adenc_aden_collections_ArrayList_add__int_String_vd_stmt_0_1_1_null:
    call adenc_rt_dispatchNullReceiverPanic
adenc_aden_collections_ArrayList_add__int_String_vd_stmt_0_1_1_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp adenc_aden_collections_ArrayList_add__int_String_epilogue
adenc_aden_collections_ArrayList_add__int_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_add__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_add__int_String endp

adenc_aden_collections_ArrayList_get__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_get__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_get__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_get__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_get__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_get__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_get_vd1_8_null
    call adenc_aden_collections_LinkedList_get__int
    jmp ArrayList_get_vd1_8_done
ArrayList_get_vd1_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_get_vd1_8_done:
    jmp adenc_aden_collections_ArrayList_get__int_epilogue
adenc_aden_collections_ArrayList_get__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_get__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_get__int endp

adenc_aden_collections_ArrayList_getFirst proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_getFirst_b0:
    lea rcx, adenc_aden_collections_ArrayList_getFirst_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getFirst_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getFirst_vd0_3_null
    call adenc_aden_collections_LinkedList_isEmpty
    jmp ArrayList_getFirst_vd0_3_done
ArrayList_getFirst_vd0_3_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getFirst_vd0_3_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_collections_ArrayList_getFirst_b1
    jmp adenc_aden_collections_ArrayList_getFirst_b2
adenc_aden_collections_ArrayList_getFirst_b1:
    lea rcx, adenc_aden_collections_ArrayList_getFirst_trace_s1
    mov edx, adenc_aden_collections_ArrayList_getFirst_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, adenc_aden_collections_ArrayList_getFirst_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getFirst_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_ArrayList_getFirst_b3
adenc_aden_collections_ArrayList_getFirst_b2:
    jmp adenc_aden_collections_ArrayList_getFirst_b3
adenc_aden_collections_ArrayList_getFirst_b3:
    lea rcx, adenc_aden_collections_ArrayList_getFirst_trace_s2
    mov edx, adenc_aden_collections_ArrayList_getFirst_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getFirst_vd2_11_null
    call adenc_aden_collections_LinkedList_getFirst
    jmp ArrayList_getFirst_vd2_11_done
ArrayList_getFirst_vd2_11_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getFirst_vd2_11_done:
    jmp adenc_aden_collections_ArrayList_getFirst_epilogue
adenc_aden_collections_ArrayList_getFirst_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_getFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_getFirst endp

adenc_aden_collections_ArrayList_getLast proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_ArrayList_getLast_b0:
    lea rcx, adenc_aden_collections_ArrayList_getLast_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getLast_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getLast_vd0_3_null
    call adenc_aden_collections_LinkedList_isEmpty
    jmp ArrayList_getLast_vd0_3_done
ArrayList_getLast_vd0_3_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getLast_vd0_3_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne adenc_aden_collections_ArrayList_getLast_b1
    jmp adenc_aden_collections_ArrayList_getLast_b2
adenc_aden_collections_ArrayList_getLast_b1:
    lea rcx, adenc_aden_collections_ArrayList_getLast_trace_s1
    mov edx, adenc_aden_collections_ArrayList_getLast_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    lea rcx, adenc_aden_collections_ArrayList_getLast_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getLast_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_ArrayList_getLast_b3
adenc_aden_collections_ArrayList_getLast_b2:
    jmp adenc_aden_collections_ArrayList_getLast_b3
adenc_aden_collections_ArrayList_getLast_b3:
    lea rcx, adenc_aden_collections_ArrayList_getLast_trace_s2
    mov edx, adenc_aden_collections_ArrayList_getLast_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getLast_vd2_11_null
    call adenc_aden_collections_LinkedList_getLast
    jmp ArrayList_getLast_vd2_11_done
ArrayList_getLast_vd2_11_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getLast_vd2_11_done:
    jmp adenc_aden_collections_ArrayList_getLast_epilogue
adenc_aden_collections_ArrayList_getLast_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_ArrayList_getLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_ArrayList_getLast endp

adenc_aden_collections_ArrayList_getInt__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_getInt__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_getInt__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getInt__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_getInt__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_getInt__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_getInt_vd1_8_null
    call adenc_aden_collections_LinkedList_getInt__int
    jmp ArrayList_getInt_vd1_8_done
ArrayList_getInt_vd1_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getInt_vd1_8_done:
    movsxd rax, eax
    jmp adenc_aden_collections_ArrayList_getInt__int_epilogue
adenc_aden_collections_ArrayList_getInt__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_getInt__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_getInt__int endp

adenc_aden_collections_ArrayList_getString__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_getString__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_getString__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_getString__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_getString__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_getString__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_getString_vd1_8_null
    call adenc_aden_collections_LinkedList_getString__int
    jmp ArrayList_getString_vd1_8_done
ArrayList_getString_vd1_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_getString_vd1_8_done:
    jmp adenc_aden_collections_ArrayList_getString__int_epilogue
adenc_aden_collections_ArrayList_getString__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_getString__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_getString__int endp

adenc_aden_collections_ArrayList_remove__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_remove__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_remove__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_remove__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_remove__int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_remove__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_remove_vd1_8_null
    call adenc_aden_collections_LinkedList_remove__int
    jmp ArrayList_remove_vd1_8_done
ArrayList_remove_vd1_8_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_remove_vd1_8_done:
    jmp adenc_aden_collections_ArrayList_remove__int_epilogue
adenc_aden_collections_ArrayList_remove__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_remove__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_remove__int endp

adenc_aden_collections_ArrayList_remove__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_remove__Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_remove__Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_remove__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_remove_vd0_4_null
    call adenc_aden_collections_LinkedList_remove__Object
    jmp ArrayList_remove_vd0_4_done
ArrayList_remove_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_remove_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_remove__Object_epilogue
adenc_aden_collections_ArrayList_remove__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_remove__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_remove__Object endp

adenc_aden_collections_ArrayList_set__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
adenc_aden_collections_ArrayList_set__int_Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_set__int_Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_set__int_Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_set__int_Object_trace_s1
    mov edx, adenc_aden_collections_ArrayList_set__int_Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call adenc_aden_collections_LinkedList_set__int_Object
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_collections_ArrayList_set__int_Object_epilogue
adenc_aden_collections_ArrayList_set__int_Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_set__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_set__int_Object endp

adenc_aden_collections_ArrayList_set__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m66
    mov edx, trace_m66_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
adenc_aden_collections_ArrayList_set__int_int_b0:
    lea rcx, adenc_aden_collections_ArrayList_set__int_int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_set__int_int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_set__int_int_trace_s1
    mov edx, adenc_aden_collections_ArrayList_set__int_int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
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
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call adenc_aden_collections_LinkedList_set__int_int
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    movsxd rax, eax
    jmp adenc_aden_collections_ArrayList_set__int_int_epilogue
adenc_aden_collections_ArrayList_set__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_set__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_set__int_int endp

adenc_aden_collections_ArrayList_set__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m69
    mov edx, trace_m69_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
adenc_aden_collections_ArrayList_set__int_String_b0:
    lea rcx, adenc_aden_collections_ArrayList_set__int_String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_set__int_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call adenc_aden_collections_ArrayList_requireElementIndex__int
    lea rcx, adenc_aden_collections_ArrayList_set__int_String_trace_s1
    mov edx, adenc_aden_collections_ArrayList_set__int_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call adenc_aden_collections_LinkedList_set__int_String
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp adenc_aden_collections_ArrayList_set__int_String_epilogue
adenc_aden_collections_ArrayList_set__int_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_collections_ArrayList_set__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_set__int_String endp

adenc_aden_collections_ArrayList_contains__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_contains__Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_contains__Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_contains__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_contains_vd0_4_null
    call adenc_aden_collections_LinkedList_contains__Object
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_contains__Object_epilogue
adenc_aden_collections_ArrayList_contains__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_contains__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_contains__Object endp

adenc_aden_collections_ArrayList_contains__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m74
    mov edx, trace_m74_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_contains__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_contains__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_contains__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_contains_vd0_4_null
    call adenc_aden_collections_LinkedList_contains__int
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    and rax, 0FFFFFFFFh
    jmp adenc_aden_collections_ArrayList_contains__int_epilogue
adenc_aden_collections_ArrayList_contains__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_contains__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_contains__int endp

adenc_aden_collections_ArrayList_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_contains__String_b0:
    lea rcx, adenc_aden_collections_ArrayList_contains__String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_contains__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_contains_vd0_4_null
    call adenc_aden_collections_LinkedList_contains__String
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_contains__String_epilogue
adenc_aden_collections_ArrayList_contains__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_contains__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_contains__String endp

adenc_aden_collections_ArrayList_indexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m78
    mov edx, trace_m78_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_indexOf__Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_indexOf__Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_indexOf__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_indexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_indexOf__Object
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_indexOf__Object_epilogue
adenc_aden_collections_ArrayList_indexOf__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_indexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_indexOf__Object endp

adenc_aden_collections_ArrayList_indexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m80
    mov edx, trace_m80_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_indexOf__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_indexOf__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_indexOf__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_indexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_indexOf__int
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    jmp adenc_aden_collections_ArrayList_indexOf__int_epilogue
adenc_aden_collections_ArrayList_indexOf__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_indexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_indexOf__int endp

adenc_aden_collections_ArrayList_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m82
    mov edx, trace_m82_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_indexOf__String_b0:
    lea rcx, adenc_aden_collections_ArrayList_indexOf__String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_indexOf__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_indexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_indexOf__String
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_indexOf__String_epilogue
adenc_aden_collections_ArrayList_indexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_indexOf__String endp

adenc_aden_collections_ArrayList_lastIndexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_lastIndexOf__Object_b0:
    lea rcx, adenc_aden_collections_ArrayList_lastIndexOf__Object_trace_s0
    mov edx, adenc_aden_collections_ArrayList_lastIndexOf__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_lastIndexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_lastIndexOf__Object
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_lastIndexOf__Object_epilogue
adenc_aden_collections_ArrayList_lastIndexOf__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_lastIndexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_lastIndexOf__Object endp

adenc_aden_collections_ArrayList_lastIndexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m86
    mov edx, trace_m86_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_ArrayList_lastIndexOf__int_b0:
    lea rcx, adenc_aden_collections_ArrayList_lastIndexOf__int_trace_s0
    mov edx, adenc_aden_collections_ArrayList_lastIndexOf__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_lastIndexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_lastIndexOf__int
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    jmp adenc_aden_collections_ArrayList_lastIndexOf__int_epilogue
adenc_aden_collections_ArrayList_lastIndexOf__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_lastIndexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_lastIndexOf__int endp

adenc_aden_collections_ArrayList_lastIndexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m88
    mov edx, trace_m88_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_ArrayList_lastIndexOf__String_b0:
    lea rcx, adenc_aden_collections_ArrayList_lastIndexOf__String_trace_s0
    mov edx, adenc_aden_collections_ArrayList_lastIndexOf__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_lastIndexOf_vd0_4_null
    call adenc_aden_collections_LinkedList_lastIndexOf__String
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call adenc_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_aden_collections_ArrayList_lastIndexOf__String_epilogue
adenc_aden_collections_ArrayList_lastIndexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_ArrayList_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_collections_ArrayList_lastIndexOf__String endp

end
