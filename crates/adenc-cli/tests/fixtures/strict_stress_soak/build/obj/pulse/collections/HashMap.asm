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
extrn pulsec_pulse_collections_HashMapEntry_HashMapEntry__Object_Object:proc
extrn pulsec_pulse_collections_HashMapEntry_getIntValue:proc
extrn pulsec_pulse_collections_HashMapEntry_getKey:proc
extrn pulsec_pulse_collections_HashMapEntry_getNext:proc
extrn pulsec_pulse_collections_HashMapEntry_getValue:proc
extrn pulsec_pulse_collections_HashMapEntry_hasIntValue:proc
extrn pulsec_pulse_collections_HashMapEntry_setIntValue__int:proc
extrn pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry:proc
extrn pulsec_pulse_collections_HashMapEntry_setValue__Object:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_HashMapKeyIterator__HashMapEntry:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapKeyIterator_next:proc
extrn pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap:proc
extrn pulsec_pulse_collections_HashMapValueIterator_hasNext:proc
extrn pulsec_pulse_collections_HashMapValueIterator_next:proc
extrn pulsec_pulse_collections_HashMapValuesView_HashMapValuesView__HashMap:proc
extrn pulsec_pulse_collections_HashSet_HashSet:proc
extrn pulsec_pulse_collections_HashSet_add__Object:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_collections_MapEntry_MapEntry__Object_Object:proc
extrn pulsec_pulse_collections_Map_get__Object:proc
extrn pulsec_pulse_collections_Map_keyIterator:proc
extrn pulsec_pulse_lang_Integer_boxObject__int:proc
extrn pulsec_pulse_lang_Integer_unboxBoxed__Integer:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
extrn pulsec_pulse_lang_String_equals__Object:proc
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

public pulsec_fld_pulse_collections_HashMap_first
public pulsec_fld_pulse_collections_HashMap_first_heap_owned
public pulsec_fld_pulse_collections_HashMap_count
public pulsec_fld_pulse_collections_HashMap_count_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_HashMap dd 0
pulsec_fcap_pulse_collections_HashMap dd 63
pulsec_fld_pulse_collections_HashMap_first_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_HashMap_first dq pulsec_fld_pulse_collections_HashMap_first_tbl
pulsec_fld_pulse_collections_HashMap_first_heap_owned dd 0
pulsec_fld_pulse_collections_HashMap_count_tbl dd 64 dup(0)
pulsec_fld_pulse_collections_HashMap_count dq pulsec_fld_pulse_collections_HashMap_count_tbl
pulsec_fld_pulse_collections_HashMap_count_heap_owned dd 0
trace_m0 db "pulse.collections.HashMap.HashMap"
trace_m0_len equ 33
trace_m1 db "pulse.collections.HashMap.size"
trace_m1_len equ 30
trace_m2 db "pulse.collections.HashMap.isEmpty"
trace_m2_len equ 33
trace_m3 db "pulse.collections.HashMap.clear"
trace_m3_len equ 31
trace_m4 db "pulse.collections.HashMap.keysEqual"
trace_m4_len equ 35
trace_m5 db "pulse.collections.HashMap.valuesEqual"
trace_m5_len equ 37
trace_m6 db "pulse.collections.HashMap.entryFor"
trace_m6_len equ 34
trace_m7 db "pulse.collections.HashMap.containsObjectKey"
trace_m7_len equ 43
trace_m8 db "pulse.collections.HashMap.containsObjectValue"
trace_m8_len equ 45
trace_m9 db "pulse.collections.HashMap.putObjectValue"
trace_m9_len equ 40
trace_m10 db "pulse.collections.HashMap.putIntValue"
trace_m10_len equ 37
trace_m11 db "pulse.collections.HashMap.hasIntValueForKey"
trace_m11_len equ 43
trace_m12 db "pulse.collections.HashMap.getIntValueForKey"
trace_m12_len equ 43
trace_m13 db "pulse.collections.HashMap.getObjectValue"
trace_m13_len equ 40
trace_m14 db "pulse.collections.HashMap.removeObjectValue"
trace_m14_len equ 43
trace_m15 db "pulse.collections.HashMap.readEntryValue"
trace_m15_len equ 40
trace_m16 db "pulse.collections.HashMap.containsKey"
trace_m16_len equ 37
trace_m17 db "pulse.collections.HashMap.containsKey"
trace_m17_len equ 37
trace_m18 db "pulse.collections.HashMap.containsValue"
trace_m18_len equ 39
trace_m19 db "pulse.collections.HashMap.containsValue"
trace_m19_len equ 39
trace_m20 db "pulse.collections.HashMap.containsValue"
trace_m20_len equ 39
trace_m21 db "pulse.collections.HashMap.removeValue"
trace_m21_len equ 37
trace_m22 db "pulse.collections.HashMap.put"
trace_m22_len equ 29
trace_m23 db "pulse.collections.HashMap.putInt"
trace_m23_len equ 32
trace_m24 db "pulse.collections.HashMap.putAll"
trace_m24_len equ 32
trace_m25 db "pulse.collections.HashMap.putIfAbsent"
trace_m25_len equ 37
trace_m26 db "pulse.collections.HashMap.putIfAbsent"
trace_m26_len equ 37
trace_m27 db "pulse.collections.HashMap.replace"
trace_m27_len equ 33
trace_m28 db "pulse.collections.HashMap.replace"
trace_m28_len equ 33
trace_m29 db "pulse.collections.HashMap.remove"
trace_m29_len equ 32
trace_m30 db "pulse.collections.HashMap.get"
trace_m30_len equ 29
trace_m31 db "pulse.collections.HashMap.getInt"
trace_m31_len equ 32
trace_m32 db "pulse.collections.HashMap.getOrDefault"
trace_m32_len equ 38
trace_m33 db "pulse.collections.HashMap.getOrDefault"
trace_m33_len equ 38
trace_m34 db "pulse.collections.HashMap.getIntOrDefault"
trace_m34_len equ 41
trace_m35 db "pulse.collections.HashMap.keyIterator"
trace_m35_len equ 37
trace_m36 db "pulse.collections.HashMap.entrySet"
trace_m36_len equ 34
trace_m37 db "pulse.collections.HashMap.keySet"
trace_m37_len equ 32
trace_m38 db "pulse.collections.HashMap.values"
trace_m38_len equ 32
cidset_1 dd 34
cidset_2 dd 27
cidset_3 dd 4
msg0 db "Invalid cast"
msg0_len equ 12
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "Invalid cast"
msg2_len equ 12
msg3 db "Invalid cast"
msg3_len equ 12
msg4 db "Invalid cast"
msg4_len equ 12
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "Invalid cast"
msg6_len equ 12
msg7 db "Invalid cast"
msg7_len equ 12
msg8 db "Invalid cast"
msg8_len equ 12
msg9 db "Invalid cast"
msg9_len equ 12
msg10 db "Invalid cast"
msg10_len equ 12
msg11 db "Invalid cast"
msg11_len equ 12

.code
pulsec_fcap_pulse_collections_HashMap_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_HashMap]
    jbe pulsec_fcap_pulse_collections_HashMap_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_HashMap]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMap_ensure_fail
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
    jz pulsec_fcap_pulse_collections_HashMap_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    xor esi, esi
pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashMap_first_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashMap_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashMap_first], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashMap_first_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMap_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    xor esi, esi
pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_HashMap_count_heap_owned], 0
    je pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_HashMap_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_HashMap_count], r12
    mov dword ptr [pulsec_fld_pulse_collections_HashMap_count_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_HashMap], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_HashMap_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMap_ensure_alloc_fail:
pulsec_fcap_pulse_collections_HashMap_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_HashMap_ensure endp

pulsec_fcap_pulse_collections_HashMap_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMap_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_HashMap_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_HashMap_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMap_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_HashMap_arc_teardown endp
pulsec_fcap_pulse_collections_HashMap_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMap_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMap_arc_scan_edges endp
pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_HashMap_arc_invalidate_edges endp
pulsec_pulse_collections_HashMap_HashMap proc
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
    jne pulsec_pulse_collections_HashMap_HashMap_ctor_reuse
    mov ecx, 4
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_HashMap_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_collections_HashMap_HashMap_ctor_ready
pulsec_pulse_collections_HashMap_HashMap_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_HashMap_HashMap_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMap_HashMap_b0:
    xor eax, eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_HashMap_epilogue
pulsec_pulse_collections_HashMap_HashMap_epilogue:
pulsec_pulse_collections_HashMap_HashMap_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_HashMap_HashMap endp

pulsec_pulse_collections_HashMap_size proc
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
pulsec_pulse_collections_HashMap_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_collections_HashMap_size_epilogue
pulsec_pulse_collections_HashMap_size_epilogue:
pulsec_pulse_collections_HashMap_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_HashMap_size endp

pulsec_pulse_collections_HashMap_isEmpty proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMap_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_collections_HashMap_isEmpty_epilogue
pulsec_pulse_collections_HashMap_isEmpty_epilogue:
pulsec_pulse_collections_HashMap_isEmpty_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_HashMap_isEmpty endp

pulsec_pulse_collections_HashMap_clear proc
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
pulsec_pulse_collections_HashMap_clear_b0:
    xor eax, eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_clear_epilogue
pulsec_pulse_collections_HashMap_clear_epilogue:
pulsec_pulse_collections_HashMap_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_HashMap_clear endp

pulsec_pulse_collections_HashMap_keysEqual__Object_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b2
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b1:
    mov eax, 1
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b3
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne HashMap_keysEqual_ternary_then_2_11
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp HashMap_keysEqual_ternary_done_2_11
HashMap_keysEqual_ternary_then_2_11:
    mov eax, 1
HashMap_keysEqual_ternary_done_2_11:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b4
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b5
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b5:
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b6
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b6:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_keysEqual_instof_4_15_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_keysEqual_instof_4_15_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_keysEqual_instof_4_15_true
HashMap_keysEqual_instof_4_15_false:
    xor eax, eax
    jmp HashMap_keysEqual_instof_4_15_done
HashMap_keysEqual_instof_4_15_true:
    mov eax, 1
HashMap_keysEqual_instof_4_15_done:
    test rax, rax
    jne HashMap_keysEqual_ternary_then_4_18
    mov eax, 0
    jmp HashMap_keysEqual_ternary_done_4_18
HashMap_keysEqual_ternary_then_4_18:
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je HashMap_keysEqual_instof_4_17_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_keysEqual_instof_4_17_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_keysEqual_instof_4_17_true
HashMap_keysEqual_instof_4_17_false:
    xor eax, eax
    jmp HashMap_keysEqual_instof_4_17_done
HashMap_keysEqual_instof_4_17_true:
    mov eax, 1
HashMap_keysEqual_instof_4_17_done:
HashMap_keysEqual_ternary_done_4_18:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b7
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b8
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b7:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_keysEqual_cast_5_20_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_keysEqual_cast_5_20_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_keysEqual_cast_5_20_ok
HashMap_keysEqual_cast_5_20_fail:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_keysEqual_cast_5_20_done
HashMap_keysEqual_cast_5_20_null:
    xor eax, eax
    jmp HashMap_keysEqual_cast_5_20_done
HashMap_keysEqual_cast_5_20_ok:
    mov rax, qword ptr [rsp+40]
HashMap_keysEqual_cast_5_20_done:
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
    je HashMap_keysEqual_cast_6_22_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_keysEqual_cast_6_22_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_keysEqual_cast_6_22_ok
HashMap_keysEqual_cast_6_22_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_keysEqual_cast_6_22_done
HashMap_keysEqual_cast_6_22_null:
    xor eax, eax
    jmp HashMap_keysEqual_cast_6_22_done
HashMap_keysEqual_cast_6_22_ok:
    mov rax, qword ptr [rsp+40]
HashMap_keysEqual_cast_6_22_done:
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
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b8:
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b9
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_b9:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_keysEqual__Object_Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_keysEqual__Object_Object endp

pulsec_pulse_collections_HashMap_valuesEqual__Object_Object proc
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
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b2
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b1:
    mov eax, 1
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b3
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne HashMap_valuesEqual_ternary_then_2_11
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp HashMap_valuesEqual_ternary_done_2_11
HashMap_valuesEqual_ternary_then_2_11:
    mov eax, 1
HashMap_valuesEqual_ternary_done_2_11:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b4
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b5
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b4:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b5:
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b6
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b6:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_valuesEqual_instof_4_15_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_instof_4_15_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_instof_4_15_true
HashMap_valuesEqual_instof_4_15_false:
    xor eax, eax
    jmp HashMap_valuesEqual_instof_4_15_done
HashMap_valuesEqual_instof_4_15_true:
    mov eax, 1
HashMap_valuesEqual_instof_4_15_done:
    test rax, rax
    jne HashMap_valuesEqual_ternary_then_4_18
    mov eax, 0
    jmp HashMap_valuesEqual_ternary_done_4_18
HashMap_valuesEqual_ternary_then_4_18:
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je HashMap_valuesEqual_instof_4_17_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_instof_4_17_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_instof_4_17_true
HashMap_valuesEqual_instof_4_17_false:
    xor eax, eax
    jmp HashMap_valuesEqual_instof_4_17_done
HashMap_valuesEqual_instof_4_17_true:
    mov eax, 1
HashMap_valuesEqual_instof_4_17_done:
HashMap_valuesEqual_ternary_done_4_18:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b7
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b8
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b7:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_valuesEqual_cast_5_20_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_cast_5_20_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_cast_5_20_ok
HashMap_valuesEqual_cast_5_20_fail:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_valuesEqual_cast_5_20_done
HashMap_valuesEqual_cast_5_20_null:
    xor eax, eax
    jmp HashMap_valuesEqual_cast_5_20_done
HashMap_valuesEqual_cast_5_20_ok:
    mov rax, qword ptr [rsp+40]
HashMap_valuesEqual_cast_5_20_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je HashMap_valuesEqual_cast_6_22_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_cast_6_22_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_cast_6_22_ok
HashMap_valuesEqual_cast_6_22_fail:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_valuesEqual_cast_6_22_done
HashMap_valuesEqual_cast_6_22_null:
    xor eax, eax
    jmp HashMap_valuesEqual_cast_6_22_done
HashMap_valuesEqual_cast_6_22_ok:
    mov rax, qword ptr [rsp+40]
HashMap_valuesEqual_cast_6_22_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_equals__Object
    mov eax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b8:
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b9
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b9:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_valuesEqual_instof_8_29_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_instof_8_29_false
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_instof_8_29_true
HashMap_valuesEqual_instof_8_29_false:
    xor eax, eax
    jmp HashMap_valuesEqual_instof_8_29_done
HashMap_valuesEqual_instof_8_29_true:
    mov eax, 1
HashMap_valuesEqual_instof_8_29_done:
    test rax, rax
    jne HashMap_valuesEqual_ternary_then_8_32
    mov eax, 0
    jmp HashMap_valuesEqual_ternary_done_8_32
HashMap_valuesEqual_ternary_then_8_32:
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je HashMap_valuesEqual_instof_8_31_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_instof_8_31_false
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_instof_8_31_true
HashMap_valuesEqual_instof_8_31_false:
    xor eax, eax
    jmp HashMap_valuesEqual_instof_8_31_done
HashMap_valuesEqual_instof_8_31_true:
    mov eax, 1
HashMap_valuesEqual_instof_8_31_done:
HashMap_valuesEqual_ternary_done_8_32:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b10
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b11
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b10:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je HashMap_valuesEqual_cast_9_36_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_cast_9_36_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_cast_9_36_ok
HashMap_valuesEqual_cast_9_36_fail:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_valuesEqual_cast_9_36_done
HashMap_valuesEqual_cast_9_36_null:
    xor eax, eax
    jmp HashMap_valuesEqual_cast_9_36_done
HashMap_valuesEqual_cast_9_36_ok:
    mov rax, qword ptr [rsp+40]
HashMap_valuesEqual_cast_9_36_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_unboxBoxed__Integer
    movsxd rax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov dword ptr [rsp+128], eax
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je HashMap_valuesEqual_cast_9_41_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_valuesEqual_cast_9_41_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_valuesEqual_cast_9_41_ok
HashMap_valuesEqual_cast_9_41_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_valuesEqual_cast_9_41_done
HashMap_valuesEqual_cast_9_41_null:
    xor eax, eax
    jmp HashMap_valuesEqual_cast_9_41_done
HashMap_valuesEqual_cast_9_41_ok:
    mov rax, qword ptr [rsp+40]
HashMap_valuesEqual_cast_9_41_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_unboxBoxed__Integer
    movsxd rax, eax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b11:
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b12
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_b12:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_valuesEqual__Object_Object endp

pulsec_pulse_collections_HashMap_entryFor__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_entryFor__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
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
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_b1
pulsec_pulse_collections_HashMap_entryFor__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_entryFor__Object_b2
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_b3
pulsec_pulse_collections_HashMap_entryFor__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_HashMapEntry_getKey
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
    call pulsec_pulse_collections_HashMap_keysEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_entryFor__Object_b4
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_b5
pulsec_pulse_collections_HashMap_entryFor__Object_b3:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_epilogue
pulsec_pulse_collections_HashMap_entryFor__Object_b4:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_epilogue
pulsec_pulse_collections_HashMap_entryFor__Object_b5:
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_b6
pulsec_pulse_collections_HashMap_entryFor__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashMap_entryFor__Object_b1
pulsec_pulse_collections_HashMap_entryFor__Object_epilogue:
pulsec_pulse_collections_HashMap_entryFor__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_entryFor__Object endp

pulsec_pulse_collections_HashMap_containsObjectKey__Object proc
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
pulsec_pulse_collections_HashMap_containsObjectKey__Object_b0:
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
    call pulsec_pulse_collections_HashMap_entryFor__Object
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
    jmp pulsec_pulse_collections_HashMap_containsObjectKey__Object_epilogue
pulsec_pulse_collections_HashMap_containsObjectKey__Object_epilogue:
pulsec_pulse_collections_HashMap_containsObjectKey__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_containsObjectKey__Object endp

pulsec_pulse_collections_HashMap_containsObjectValue__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
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
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_b1
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_containsObjectValue__Object_b2
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_b3
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_HashMapEntry_getValue
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
    call pulsec_pulse_collections_HashMap_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_containsObjectValue__Object_b4
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_b5
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b3:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b4:
    mov eax, 1
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b5:
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_b6
pulsec_pulse_collections_HashMap_containsObjectValue__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashMap_containsObjectValue__Object_b1
pulsec_pulse_collections_HashMap_containsObjectValue__Object_epilogue:
pulsec_pulse_collections_HashMap_containsObjectValue__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_containsObjectValue__Object endp

pulsec_pulse_collections_HashMap_putObjectValue__Object_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+104], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b2
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+104]
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
    call pulsec_pulse_collections_HashMapEntry_setValue__Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_epilogue
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b3
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_b3:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov r8, rax
    xor ecx, ecx
    call pulsec_pulse_collections_HashMapEntry_HashMapEntry__Object_Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
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
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_epilogue
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_putObjectValue__Object_Object endp

pulsec_pulse_collections_HashMap_putIntValue__String_int proc
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
    mov qword ptr [rsp+88], rdx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashMap_putIntValue__String_int_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putIntValue__String_int_b1
    jmp pulsec_pulse_collections_HashMap_putIntValue__String_int_b2
pulsec_pulse_collections_HashMap_putIntValue__String_int_b1:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
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
    call pulsec_pulse_collections_HashMapEntry_setIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putIntValue__String_int_epilogue
pulsec_pulse_collections_HashMap_putIntValue__String_int_b2:
    jmp pulsec_pulse_collections_HashMap_putIntValue__String_int_b3
pulsec_pulse_collections_HashMap_putIntValue__String_int_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    xor eax, eax
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
    xor ecx, ecx
    call pulsec_pulse_collections_HashMapEntry_HashMapEntry__Object_Object
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    call pulsec_pulse_collections_HashMapEntry_setIntValue__int
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
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
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putIntValue__String_int_epilogue
pulsec_pulse_collections_HashMap_putIntValue__String_int_epilogue:
pulsec_pulse_collections_HashMap_putIntValue__String_int_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_collections_HashMap_putIntValue__String_int endp

pulsec_pulse_collections_HashMap_hasIntValueForKey__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b1
    jmp pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b2
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_hasIntValueForKey__String_epilogue
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b2:
    jmp pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b3
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_hasIntValue
    mov eax, eax
    jmp pulsec_pulse_collections_HashMap_hasIntValueForKey__String_epilogue
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_epilogue:
pulsec_pulse_collections_HashMap_hasIntValueForKey__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_hasIntValueForKey__String endp

pulsec_pulse_collections_HashMap_getIntValueForKey__String proc
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
pulsec_pulse_collections_HashMap_getIntValueForKey__String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getIntValueForKey__String_b1
    jmp pulsec_pulse_collections_HashMap_getIntValueForKey__String_b2
pulsec_pulse_collections_HashMap_getIntValueForKey__String_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_getIntValueForKey__String_epilogue
pulsec_pulse_collections_HashMap_getIntValueForKey__String_b2:
    jmp pulsec_pulse_collections_HashMap_getIntValueForKey__String_b3
pulsec_pulse_collections_HashMap_getIntValueForKey__String_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getIntValue
    movsxd rax, eax
    jmp pulsec_pulse_collections_HashMap_getIntValueForKey__String_epilogue
pulsec_pulse_collections_HashMap_getIntValueForKey__String_epilogue:
pulsec_pulse_collections_HashMap_getIntValueForKey__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_getIntValueForKey__String endp

pulsec_pulse_collections_HashMap_getObjectValue__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_getObjectValue__Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getObjectValue__Object_b1
    jmp pulsec_pulse_collections_HashMap_getObjectValue__Object_b2
pulsec_pulse_collections_HashMap_getObjectValue__Object_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_getObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_getObjectValue__Object_b2:
    jmp pulsec_pulse_collections_HashMap_getObjectValue__Object_b3
pulsec_pulse_collections_HashMap_getObjectValue__Object_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getValue
    jmp pulsec_pulse_collections_HashMap_getObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_getObjectValue__Object_epilogue:
pulsec_pulse_collections_HashMap_getObjectValue__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_getObjectValue__Object endp

pulsec_pulse_collections_HashMap_removeObjectValue__Object proc
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
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b0:
    xor eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b1
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeObjectValue__Object_b2
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b3
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_HashMapEntry_getKey
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov r8, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_keysEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeObjectValue__Object_b4
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b5
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b3:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeObjectValue__Object_b7
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b8
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b5:
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b6
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b1
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b9
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
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
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_b9
pulsec_pulse_collections_HashMap_removeObjectValue__Object_b9:
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+80]
    jmp pulsec_pulse_collections_HashMap_removeObjectValue__Object_epilogue
pulsec_pulse_collections_HashMap_removeObjectValue__Object_epilogue:
pulsec_pulse_collections_HashMap_removeObjectValue__Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 328
    ret
pulsec_pulse_collections_HashMap_removeObjectValue__Object endp

pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_HashMapEntry_getValue
    jmp pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry_epilogue
pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry_epilogue:
pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry endp

pulsec_pulse_collections_HashMap_containsKey__Object proc
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
pulsec_pulse_collections_HashMap_containsKey__Object_b0:
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
    call pulsec_pulse_collections_HashMap_entryFor__Object
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
    jmp pulsec_pulse_collections_HashMap_containsKey__Object_epilogue
pulsec_pulse_collections_HashMap_containsKey__Object_epilogue:
pulsec_pulse_collections_HashMap_containsKey__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_containsKey__Object endp

pulsec_pulse_collections_HashMap_containsKey__String proc
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
pulsec_pulse_collections_HashMap_containsKey__String_b0:
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
    call pulsec_pulse_collections_HashMap_containsObjectKey__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMap_containsKey__String_epilogue
pulsec_pulse_collections_HashMap_containsKey__String_epilogue:
pulsec_pulse_collections_HashMap_containsKey__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_containsKey__String endp

pulsec_pulse_collections_HashMap_containsValue__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_containsValue__Object_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
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
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_b1
pulsec_pulse_collections_HashMap_containsValue__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_containsValue__Object_b2
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_b3
pulsec_pulse_collections_HashMap_containsValue__Object_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_HashMapEntry_getValue
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
    call pulsec_pulse_collections_HashMap_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_containsValue__Object_b4
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_b5
pulsec_pulse_collections_HashMap_containsValue__Object_b3:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_epilogue
pulsec_pulse_collections_HashMap_containsValue__Object_b4:
    mov eax, 1
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_epilogue
pulsec_pulse_collections_HashMap_containsValue__Object_b5:
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_b6
pulsec_pulse_collections_HashMap_containsValue__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashMap_containsValue__Object_b1
pulsec_pulse_collections_HashMap_containsValue__Object_epilogue:
pulsec_pulse_collections_HashMap_containsValue__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_containsValue__Object endp

pulsec_pulse_collections_HashMap_containsValue__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_HashMap_containsValue__String_b0:
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
    call pulsec_pulse_collections_HashMap_containsObjectValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMap_containsValue__String_epilogue
pulsec_pulse_collections_HashMap_containsValue__String_epilogue:
pulsec_pulse_collections_HashMap_containsValue__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_containsValue__String endp

pulsec_pulse_collections_HashMap_containsValue__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_HashMap_containsValue__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_boxObject__int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashMap_containsObjectValue__Object
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_HashMap_containsValue__int_epilogue
pulsec_pulse_collections_HashMap_containsValue__int_epilogue:
pulsec_pulse_collections_HashMap_containsValue__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_HashMap_containsValue__int endp

pulsec_pulse_collections_HashMap_removeValue__Object proc
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
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_removeValue__Object_b0:
    xor eax, eax
    mov qword ptr [rsp+152], rax
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b1
pulsec_pulse_collections_HashMap_removeValue__Object_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeValue__Object_b2
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b3
pulsec_pulse_collections_HashMap_removeValue__Object_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_HashMapEntry_getValue
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
    call pulsec_pulse_collections_HashMap_valuesEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeValue__Object_b4
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b5
pulsec_pulse_collections_HashMap_removeValue__Object_b3:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_epilogue
pulsec_pulse_collections_HashMap_removeValue__Object_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_removeValue__Object_b7
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b8
pulsec_pulse_collections_HashMap_removeValue__Object_b5:
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b6
pulsec_pulse_collections_HashMap_removeValue__Object_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b1
pulsec_pulse_collections_HashMap_removeValue__Object_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b9
pulsec_pulse_collections_HashMap_removeValue__Object_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
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
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_b9
pulsec_pulse_collections_HashMap_removeValue__Object_b9:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 1
    jmp pulsec_pulse_collections_HashMap_removeValue__Object_epilogue
pulsec_pulse_collections_HashMap_removeValue__Object_epilogue:
pulsec_pulse_collections_HashMap_removeValue__Object_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_collections_HashMap_removeValue__Object endp

pulsec_pulse_collections_HashMap_put__Object_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+104], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_HashMap_put__Object_Object_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_put__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_put__Object_Object_b2
pulsec_pulse_collections_HashMap_put__Object_Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMapEntry_getValue
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+104]
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
    call pulsec_pulse_collections_HashMapEntry_setValue__Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_collections_HashMap_put__Object_Object_epilogue
pulsec_pulse_collections_HashMap_put__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_put__Object_Object_b3
pulsec_pulse_collections_HashMap_put__Object_Object_b3:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov r8, rax
    xor ecx, ecx
    call pulsec_pulse_collections_HashMapEntry_HashMapEntry__Object_Object
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
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
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_put__Object_Object_epilogue
pulsec_pulse_collections_HashMap_put__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_put__Object_Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_HashMap_put__Object_Object endp

pulsec_pulse_collections_HashMap_putInt__String_int proc
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
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_HashMap_putInt__String_int_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_HashMap_putIntValue__String_int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putInt__String_int_epilogue
pulsec_pulse_collections_HashMap_putInt__String_int_epilogue:
pulsec_pulse_collections_HashMap_putInt__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_putInt__String_int endp

pulsec_pulse_collections_HashMap_putAll__Map proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+104], rcx
    mov qword ptr [rsp+112], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+96], 0
pulsec_pulse_collections_HashMap_putAll__Map_b0:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putAll__Map_b1
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b2
pulsec_pulse_collections_HashMap_putAll__Map_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putAll__Map_epilogue
pulsec_pulse_collections_HashMap_putAll__Map_b2:
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b3
pulsec_pulse_collections_HashMap_putAll__Map_b3:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je HashMap_putAll_vd2_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMap_putAll_vd2_5_type
    cmp eax, 4
    je HashMap_putAll_vd2_5_assign_ok
    jmp HashMap_putAll_vd2_5_type
HashMap_putAll_vd2_5_assign_ok:
    cmp eax, 4
    je HashMap_putAll_vd2_5_ovr0
    jmp HashMap_putAll_vd2_5_default
HashMap_putAll_vd2_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMap_keyIterator
    jmp HashMap_putAll_vd2_5_done
HashMap_putAll_vd2_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Map_keyIterator
    jmp HashMap_putAll_vd2_5_done
HashMap_putAll_vd2_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMap_putAll_vd2_5_done
HashMap_putAll_vd2_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMap_putAll_vd2_5_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b4
pulsec_pulse_collections_HashMap_putAll__Map_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je HashMap_putAll_vd3_8_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMap_putAll_vd3_8_type
    cmp eax, 6
    je HashMap_putAll_vd3_8_assign_ok
    cmp eax, 8
    je HashMap_putAll_vd3_8_assign_ok
    cmp eax, 12
    je HashMap_putAll_vd3_8_assign_ok
    jmp HashMap_putAll_vd3_8_type
HashMap_putAll_vd3_8_assign_ok:
    cmp eax, 6
    je HashMap_putAll_vd3_8_ovr0
    cmp eax, 8
    je HashMap_putAll_vd3_8_ovr1
    cmp eax, 12
    je HashMap_putAll_vd3_8_ovr2
    jmp HashMap_putAll_vd3_8_default
HashMap_putAll_vd3_8_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_hasNext
    jmp HashMap_putAll_vd3_8_done
HashMap_putAll_vd3_8_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_hasNext
    jmp HashMap_putAll_vd3_8_done
HashMap_putAll_vd3_8_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp HashMap_putAll_vd3_8_done
HashMap_putAll_vd3_8_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp HashMap_putAll_vd3_8_done
HashMap_putAll_vd3_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMap_putAll_vd3_8_done
HashMap_putAll_vd3_8_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMap_putAll_vd3_8_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putAll__Map_b5
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b6
pulsec_pulse_collections_HashMap_putAll__Map_b5:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je HashMap_putAll_vd4_11_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMap_putAll_vd4_11_type
    cmp eax, 6
    je HashMap_putAll_vd4_11_assign_ok
    cmp eax, 8
    je HashMap_putAll_vd4_11_assign_ok
    cmp eax, 12
    je HashMap_putAll_vd4_11_assign_ok
    jmp HashMap_putAll_vd4_11_type
HashMap_putAll_vd4_11_assign_ok:
    cmp eax, 6
    je HashMap_putAll_vd4_11_ovr0
    cmp eax, 8
    je HashMap_putAll_vd4_11_ovr1
    cmp eax, 12
    je HashMap_putAll_vd4_11_ovr2
    jmp HashMap_putAll_vd4_11_default
HashMap_putAll_vd4_11_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapKeyIterator_next
    jmp HashMap_putAll_vd4_11_done
HashMap_putAll_vd4_11_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMapValueIterator_next
    jmp HashMap_putAll_vd4_11_done
HashMap_putAll_vd4_11_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp HashMap_putAll_vd4_11_done
HashMap_putAll_vd4_11_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp HashMap_putAll_vd4_11_done
HashMap_putAll_vd4_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMap_putAll_vd4_11_done
HashMap_putAll_vd4_11_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMap_putAll_vd4_11_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+112]
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
    test rcx, rcx
    je HashMap_putAll_vd5_15_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz HashMap_putAll_vd5_15_type
    cmp eax, 4
    je HashMap_putAll_vd5_15_assign_ok
    jmp HashMap_putAll_vd5_15_type
HashMap_putAll_vd5_15_assign_ok:
    cmp eax, 4
    je HashMap_putAll_vd5_15_ovr0
    jmp HashMap_putAll_vd5_15_default
HashMap_putAll_vd5_15_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_HashMap_get__Object
    jmp HashMap_putAll_vd5_15_done
HashMap_putAll_vd5_15_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Map_get__Object
    jmp HashMap_putAll_vd5_15_done
HashMap_putAll_vd5_15_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp HashMap_putAll_vd5_15_done
HashMap_putAll_vd5_15_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
HashMap_putAll_vd5_15_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+112]
    test rax, rax
    je HashMap_putAll_instof_6_18_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_putAll_instof_6_18_false
    mov ecx, edx
    lea rdx, cidset_3
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_putAll_instof_6_18_true
HashMap_putAll_instof_6_18_false:
    xor eax, eax
    jmp HashMap_putAll_instof_6_18_done
HashMap_putAll_instof_6_18_true:
    mov eax, 1
HashMap_putAll_instof_6_18_done:
    test rax, rax
    jne HashMap_putAll_ternary_then_6_21
    mov eax, 0
    jmp HashMap_putAll_ternary_done_6_21
HashMap_putAll_ternary_then_6_21:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je HashMap_putAll_instof_6_20_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_putAll_instof_6_20_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_putAll_instof_6_20_true
HashMap_putAll_instof_6_20_false:
    xor eax, eax
    jmp HashMap_putAll_instof_6_20_done
HashMap_putAll_instof_6_20_true:
    mov eax, 1
HashMap_putAll_instof_6_20_done:
HashMap_putAll_ternary_done_6_21:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putAll__Map_b7
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b8
pulsec_pulse_collections_HashMap_putAll__Map_b6:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putAll__Map_epilogue
pulsec_pulse_collections_HashMap_putAll__Map_b7:
    mov rax, qword ptr [rsp+112]
    test rax, rax
    je HashMap_putAll_cast_7_23_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_putAll_cast_7_23_fail
    mov ecx, edx
    lea rdx, cidset_3
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_putAll_cast_7_23_ok
HashMap_putAll_cast_7_23_fail:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_putAll_cast_7_23_done
HashMap_putAll_cast_7_23_null:
    xor eax, eax
    jmp HashMap_putAll_cast_7_23_done
HashMap_putAll_cast_7_23_ok:
    mov rax, qword ptr [rsp+40]
HashMap_putAll_cast_7_23_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je HashMap_putAll_cast_8_25_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_putAll_cast_8_25_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_putAll_cast_8_25_ok
HashMap_putAll_cast_8_25_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_putAll_cast_8_25_done
HashMap_putAll_cast_8_25_null:
    xor eax, eax
    jmp HashMap_putAll_cast_8_25_done
HashMap_putAll_cast_8_25_ok:
    mov rax, qword ptr [rsp+40]
HashMap_putAll_cast_8_25_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMap_hasIntValueForKey__String
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putAll__Map_b10
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b11
pulsec_pulse_collections_HashMap_putAll__Map_b8:
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b9
pulsec_pulse_collections_HashMap_putAll__Map_b9:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov r8, rax
    mov rcx, qword ptr [rsp+104]
    test rcx, rcx
    je pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_9_12_0_null
    call pulsec_pulse_collections_HashMap_put__Object_Object
    jmp pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_9_12_0_done
pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_9_12_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_9_12_0_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b4
pulsec_pulse_collections_HashMap_putAll__Map_b10:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_HashMap_getIntValueForKey__String
    movsxd rax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov eax, dword ptr [rsp+136]
    mov r8d, eax
    mov rcx, qword ptr [rsp+104]
    test rcx, rcx
    je pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_10_10_0_null
    call pulsec_pulse_collections_HashMap_putInt__String_int
    jmp pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_10_10_0_done
pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_10_10_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMap_putAll__Map_vd_stmt_10_10_0_done:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b4
pulsec_pulse_collections_HashMap_putAll__Map_b11:
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b12
pulsec_pulse_collections_HashMap_putAll__Map_b12:
    jmp pulsec_pulse_collections_HashMap_putAll__Map_b9
pulsec_pulse_collections_HashMap_putAll__Map_epilogue:
pulsec_pulse_collections_HashMap_putAll__Map_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 328
    ret
pulsec_pulse_collections_HashMap_putAll__Map endp

pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_putIfAbsent_vd0_3_null
    call pulsec_pulse_collections_HashMap_get__Object
    jmp HashMap_putIfAbsent_vd0_3_done
HashMap_putIfAbsent_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_putIfAbsent_vd0_3_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne HashMap_putIfAbsent_ternary_then_1_12
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_putIfAbsent_vd1_11_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashMap_putIfAbsent_vd1_11_done
HashMap_putIfAbsent_vd1_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_putIfAbsent_vd1_11_done:
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp HashMap_putIfAbsent_ternary_done_1_12
HashMap_putIfAbsent_ternary_then_1_12:
    mov eax, 1
HashMap_putIfAbsent_ternary_done_1_12:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b2
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b1:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_epilogue
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b3
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_b3:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_vd_stmt_3_3_0_null
    call pulsec_pulse_collections_HashMap_put__Object_Object
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_vd_stmt_3_3_0_done
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_vd_stmt_3_3_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_vd_stmt_3_3_0_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_epilogue
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_putIfAbsent__Object_Object endp

pulsec_pulse_collections_HashMap_putIfAbsent__String_String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_getObjectValue__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test rax, rax
    je HashMap_putIfAbsent_cast_0_4_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_putIfAbsent_cast_0_4_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_putIfAbsent_cast_0_4_ok
HashMap_putIfAbsent_cast_0_4_fail:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_putIfAbsent_cast_0_4_done
HashMap_putIfAbsent_cast_0_4_null:
    xor eax, eax
    jmp HashMap_putIfAbsent_cast_0_4_done
HashMap_putIfAbsent_cast_0_4_ok:
    mov rax, qword ptr [rsp+40]
HashMap_putIfAbsent_cast_0_4_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne HashMap_putIfAbsent_ternary_then_1_13
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_putIfAbsent_vd1_12_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMap_putIfAbsent_vd1_12_done
HashMap_putIfAbsent_vd1_12_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_putIfAbsent_vd1_12_done:
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp HashMap_putIfAbsent_ternary_done_1_13
HashMap_putIfAbsent_ternary_then_1_13:
    mov eax, 1
HashMap_putIfAbsent_ternary_done_1_13:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b1
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b2
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b1:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__String_String_epilogue
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b2:
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b3
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_b3:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_putObjectValue__Object_Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_putIfAbsent__String_String_epilogue
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_epilogue:
pulsec_pulse_collections_HashMap_putIfAbsent__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_putIfAbsent__String_String endp

pulsec_pulse_collections_HashMap_replace__Object_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_HashMap_replace__Object_Object_b0:
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
    test rcx, rcx
    je HashMap_replace_vd0_3_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashMap_replace_vd0_3_done
HashMap_replace_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_replace_vd0_3_done:
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
    jne pulsec_pulse_collections_HashMap_replace__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_replace__Object_Object_b2
pulsec_pulse_collections_HashMap_replace__Object_Object_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_replace__Object_Object_epilogue
pulsec_pulse_collections_HashMap_replace__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_replace__Object_Object_b3
pulsec_pulse_collections_HashMap_replace__Object_Object_b3:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
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
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je HashMap_replace_vd2_10_null
    call pulsec_pulse_collections_HashMap_put__Object_Object
    jmp HashMap_replace_vd2_10_done
HashMap_replace_vd2_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_replace_vd2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_HashMap_replace__Object_Object_epilogue
pulsec_pulse_collections_HashMap_replace__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_replace__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_replace__Object_Object endp

pulsec_pulse_collections_HashMap_replace__String_String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_replace__String_String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_replace_vd0_3_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMap_replace_vd0_3_done
HashMap_replace_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_replace_vd0_3_done:
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_replace__String_String_b1
    jmp pulsec_pulse_collections_HashMap_replace__String_String_b2
pulsec_pulse_collections_HashMap_replace__String_String_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_replace__String_String_epilogue
pulsec_pulse_collections_HashMap_replace__String_String_b2:
    jmp pulsec_pulse_collections_HashMap_replace__String_String_b3
pulsec_pulse_collections_HashMap_replace__String_String_b3:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_getObjectValue__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test rax, rax
    je HashMap_replace_cast_2_10_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_replace_cast_2_10_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_replace_cast_2_10_ok
HashMap_replace_cast_2_10_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_replace_cast_2_10_done
HashMap_replace_cast_2_10_null:
    xor eax, eax
    jmp HashMap_replace_cast_2_10_done
HashMap_replace_cast_2_10_ok:
    mov rax, qword ptr [rsp+40]
HashMap_replace_cast_2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+88]
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
    call pulsec_pulse_collections_HashMap_putObjectValue__Object_Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_replace__String_String_epilogue
pulsec_pulse_collections_HashMap_replace__String_String_epilogue:
pulsec_pulse_collections_HashMap_replace__String_String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_replace__String_String endp

pulsec_pulse_collections_HashMap_remove__Object proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+80], 0
pulsec_pulse_collections_HashMap_remove__Object_b0:
    xor eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_remove__Object_b1
pulsec_pulse_collections_HashMap_remove__Object_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_remove__Object_b2
    jmp pulsec_pulse_collections_HashMap_remove__Object_b3
pulsec_pulse_collections_HashMap_remove__Object_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_HashMapEntry_getKey
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    mov r8, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_keysEqual__Object_Object
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test eax, eax
    jne pulsec_pulse_collections_HashMap_remove__Object_b4
    jmp pulsec_pulse_collections_HashMap_remove__Object_b5
pulsec_pulse_collections_HashMap_remove__Object_b3:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_remove__Object_epilogue
pulsec_pulse_collections_HashMap_remove__Object_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_remove__Object_b7
    jmp pulsec_pulse_collections_HashMap_remove__Object_b8
pulsec_pulse_collections_HashMap_remove__Object_b5:
    jmp pulsec_pulse_collections_HashMap_remove__Object_b6
pulsec_pulse_collections_HashMap_remove__Object_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_remove__Object_b1
pulsec_pulse_collections_HashMap_remove__Object_b7:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov qword ptr [r10+rdx*8], rax
    jmp pulsec_pulse_collections_HashMap_remove__Object_b9
pulsec_pulse_collections_HashMap_remove__Object_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
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
    call pulsec_pulse_collections_HashMapEntry_setNext__HashMapEntry
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_HashMap_remove__Object_b9
pulsec_pulse_collections_HashMap_remove__Object_b9:
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+80]
    jmp pulsec_pulse_collections_HashMap_remove__Object_epilogue
pulsec_pulse_collections_HashMap_remove__Object_epilogue:
pulsec_pulse_collections_HashMap_remove__Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 328
    ret
pulsec_pulse_collections_HashMap_remove__Object endp

pulsec_pulse_collections_HashMap_get__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_get__Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_get__Object_b1
    jmp pulsec_pulse_collections_HashMap_get__Object_b2
pulsec_pulse_collections_HashMap_get__Object_b1:
    xor eax, eax
    jmp pulsec_pulse_collections_HashMap_get__Object_epilogue
pulsec_pulse_collections_HashMap_get__Object_b2:
    jmp pulsec_pulse_collections_HashMap_get__Object_b3
pulsec_pulse_collections_HashMap_get__Object_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getValue
    jmp pulsec_pulse_collections_HashMap_get__Object_epilogue
pulsec_pulse_collections_HashMap_get__Object_epilogue:
pulsec_pulse_collections_HashMap_get__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_get__Object endp

pulsec_pulse_collections_HashMap_getInt__String proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_getInt__String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_entryFor__Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
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
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getInt__String_b1
    jmp pulsec_pulse_collections_HashMap_getInt__String_b2
pulsec_pulse_collections_HashMap_getInt__String_b1:
    mov eax, 0
    jmp pulsec_pulse_collections_HashMap_getInt__String_epilogue
pulsec_pulse_collections_HashMap_getInt__String_b2:
    jmp pulsec_pulse_collections_HashMap_getInt__String_b3
pulsec_pulse_collections_HashMap_getInt__String_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_hasIntValue
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getInt__String_b4
    jmp pulsec_pulse_collections_HashMap_getInt__String_b5
pulsec_pulse_collections_HashMap_getInt__String_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getIntValue
    movsxd rax, eax
    jmp pulsec_pulse_collections_HashMap_getInt__String_epilogue
pulsec_pulse_collections_HashMap_getInt__String_b5:
    jmp pulsec_pulse_collections_HashMap_getInt__String_b6
pulsec_pulse_collections_HashMap_getInt__String_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getValue
    test rax, rax
    je HashMap_getInt_cast_5_17_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_getInt_cast_5_17_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_getInt_cast_5_17_ok
HashMap_getInt_cast_5_17_fail:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_getInt_cast_5_17_done
HashMap_getInt_cast_5_17_null:
    xor eax, eax
    jmp HashMap_getInt_cast_5_17_done
HashMap_getInt_cast_5_17_ok:
    mov rax, qword ptr [rsp+40]
HashMap_getInt_cast_5_17_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_HashMap_getInt__String_epilogue
pulsec_pulse_collections_HashMap_getInt__String_epilogue:
pulsec_pulse_collections_HashMap_getInt__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_getInt__String endp

pulsec_pulse_collections_HashMap_getOrDefault__Object_Object proc
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
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_getOrDefault_vd0_3_null
    call pulsec_pulse_collections_HashMap_get__Object
    jmp HashMap_getOrDefault_vd0_3_done
HashMap_getOrDefault_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_getOrDefault_vd0_3_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne HashMap_getOrDefault_ternary_then_1_12
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_getOrDefault_vd1_11_null
    call pulsec_pulse_collections_HashMap_containsKey__Object
    jmp HashMap_getOrDefault_vd1_11_done
HashMap_getOrDefault_vd1_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_getOrDefault_vd1_11_done:
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp HashMap_getOrDefault_ternary_done_1_12
HashMap_getOrDefault_ternary_then_1_12:
    mov eax, 1
HashMap_getOrDefault_ternary_done_1_12:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b1
    jmp pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b2
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b1:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_epilogue
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b2:
    jmp pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b3
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_b3:
    mov rax, qword ptr [rsp+88]
    jmp pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_epilogue
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_epilogue:
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_getOrDefault__Object_Object endp

pulsec_pulse_collections_HashMap_getOrDefault__String_String proc
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
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+88], r8
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_getOrDefault__String_String_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_HashMap_getObjectValue__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    test rax, rax
    je HashMap_getOrDefault_cast_0_4_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz HashMap_getOrDefault_cast_0_4_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz HashMap_getOrDefault_cast_0_4_ok
HashMap_getOrDefault_cast_0_4_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp HashMap_getOrDefault_cast_0_4_done
HashMap_getOrDefault_cast_0_4_null:
    xor eax, eax
    jmp HashMap_getOrDefault_cast_0_4_done
HashMap_getOrDefault_cast_0_4_ok:
    mov rax, qword ptr [rsp+40]
HashMap_getOrDefault_cast_0_4_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test rax, rax
    jne HashMap_getOrDefault_ternary_then_1_13
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je HashMap_getOrDefault_vd1_12_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMap_getOrDefault_vd1_12_done
HashMap_getOrDefault_vd1_12_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_getOrDefault_vd1_12_done:
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp HashMap_getOrDefault_ternary_done_1_13
HashMap_getOrDefault_ternary_then_1_13:
    mov eax, 1
HashMap_getOrDefault_ternary_done_1_13:
    test eax, eax
    jne pulsec_pulse_collections_HashMap_getOrDefault__String_String_b1
    jmp pulsec_pulse_collections_HashMap_getOrDefault__String_String_b2
pulsec_pulse_collections_HashMap_getOrDefault__String_String_b1:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_HashMap_getOrDefault__String_String_epilogue
pulsec_pulse_collections_HashMap_getOrDefault__String_String_b2:
    jmp pulsec_pulse_collections_HashMap_getOrDefault__String_String_b3
pulsec_pulse_collections_HashMap_getOrDefault__String_String_b3:
    mov rax, qword ptr [rsp+88]
    jmp pulsec_pulse_collections_HashMap_getOrDefault__String_String_epilogue
pulsec_pulse_collections_HashMap_getOrDefault__String_String_epilogue:
pulsec_pulse_collections_HashMap_getOrDefault__String_String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_HashMap_getOrDefault__String_String endp

pulsec_pulse_collections_HashMap_getIntOrDefault__String_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b0:
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
    test rcx, rcx
    je HashMap_getIntOrDefault_vd0_3_null
    call pulsec_pulse_collections_HashMap_containsKey__String
    jmp HashMap_getIntOrDefault_vd0_3_done
HashMap_getIntOrDefault_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_getIntOrDefault_vd0_3_done:
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
    jne pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b1
    jmp pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b2
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b1:
    mov eax, dword ptr [rsp+80]
    jmp pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_epilogue
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b2:
    jmp pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b3
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_b3:
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
    test rcx, rcx
    je HashMap_getIntOrDefault_vd2_9_null
    call pulsec_pulse_collections_HashMap_getInt__String
    jmp HashMap_getIntOrDefault_vd2_9_done
HashMap_getIntOrDefault_vd2_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
HashMap_getIntOrDefault_vd2_9_done:
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_epilogue
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_epilogue:
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_HashMap_getIntOrDefault__String_int endp

pulsec_pulse_collections_HashMap_keyIterator proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMap_keyIterator_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
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
    call pulsec_pulse_collections_HashMapKeyIterator_HashMapKeyIterator__HashMapEntry
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_HashMap_keyIterator_epilogue
pulsec_pulse_collections_HashMap_keyIterator_epilogue:
pulsec_pulse_collections_HashMap_keyIterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMap_keyIterator endp

pulsec_pulse_collections_HashMap_entrySet proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_HashMap_entrySet_b0:
    xor ecx, ecx
    call pulsec_pulse_collections_HashSet_HashSet
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_HashMap_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_entrySet_b1
pulsec_pulse_collections_HashMap_entrySet_b1:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_HashMap_entrySet_b2
    jmp pulsec_pulse_collections_HashMap_entrySet_b3
pulsec_pulse_collections_HashMap_entrySet_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+224], rax
    mov rcx, qword ptr [rsp+224]
    call pulsec_pulse_collections_HashMapEntry_getKey
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_HashMap_readEntryValue__HashMapEntry
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    xor ecx, ecx
    call pulsec_pulse_collections_MapEntry_MapEntry__Object_Object
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov qword ptr [rsp+152], rdx
    mov qword ptr [rsp+160], r8
    mov qword ptr [rsp+168], r9
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rdx, qword ptr [rsp+152]
    mov r8, qword ptr [rsp+160]
    mov r9, qword ptr [rsp+168]
    test rcx, rcx
    je pulsec_pulse_collections_HashMap_entrySet_vd_stmt_2_3_0_null
    call pulsec_pulse_collections_HashSet_add__Object
    jmp pulsec_pulse_collections_HashMap_entrySet_vd_stmt_2_3_0_done
pulsec_pulse_collections_HashMap_entrySet_vd_stmt_2_3_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_HashMap_entrySet_vd_stmt_2_3_0_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_HashMapEntry_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_collections_HashMap_entrySet_b1
pulsec_pulse_collections_HashMap_entrySet_b3:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_HashMap_entrySet_epilogue
pulsec_pulse_collections_HashMap_entrySet_epilogue:
pulsec_pulse_collections_HashMap_entrySet_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 344
    ret
pulsec_pulse_collections_HashMap_entrySet endp

pulsec_pulse_collections_HashMap_keySet proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMap_keySet_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_HashMapKeySetView_HashMapKeySetView__HashMap
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_HashMap_keySet_epilogue
pulsec_pulse_collections_HashMap_keySet_epilogue:
pulsec_pulse_collections_HashMap_keySet_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMap_keySet endp

pulsec_pulse_collections_HashMap_values proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_HashMap_values_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_HashMapValuesView_HashMapValuesView__HashMap
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_HashMap_values_epilogue
pulsec_pulse_collections_HashMap_values_epilogue:
pulsec_pulse_collections_HashMap_values_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_HashMap_values endp

end
