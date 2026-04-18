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
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_LinkedList_LinkedList:proc
extrn pulsec_pulse_collections_LinkedList_addAll__Collection:proc
extrn pulsec_pulse_collections_LinkedList_add__Object:proc
extrn pulsec_pulse_collections_LinkedList_add__String:proc
extrn pulsec_pulse_collections_LinkedList_add__int:proc
extrn pulsec_pulse_collections_LinkedList_add__int_Object:proc
extrn pulsec_pulse_collections_LinkedList_add__int_String:proc
extrn pulsec_pulse_collections_LinkedList_add__int_int:proc
extrn pulsec_pulse_collections_LinkedList_clear:proc
extrn pulsec_pulse_collections_LinkedList_containsAll__Collection:proc
extrn pulsec_pulse_collections_LinkedList_contains__Object:proc
extrn pulsec_pulse_collections_LinkedList_contains__String:proc
extrn pulsec_pulse_collections_LinkedList_contains__int:proc
extrn pulsec_pulse_collections_LinkedList_getFirst:proc
extrn pulsec_pulse_collections_LinkedList_getInt__int:proc
extrn pulsec_pulse_collections_LinkedList_getLast:proc
extrn pulsec_pulse_collections_LinkedList_getString__int:proc
extrn pulsec_pulse_collections_LinkedList_get__int:proc
extrn pulsec_pulse_collections_LinkedList_indexOf__Object:proc
extrn pulsec_pulse_collections_LinkedList_indexOf__String:proc
extrn pulsec_pulse_collections_LinkedList_indexOf__int:proc
extrn pulsec_pulse_collections_LinkedList_isEmpty:proc
extrn pulsec_pulse_collections_LinkedList_iterator:proc
extrn pulsec_pulse_collections_LinkedList_lastIndexOf__Object:proc
extrn pulsec_pulse_collections_LinkedList_lastIndexOf__String:proc
extrn pulsec_pulse_collections_LinkedList_lastIndexOf__int:proc
extrn pulsec_pulse_collections_LinkedList_removeAll__Collection:proc
extrn pulsec_pulse_collections_LinkedList_remove__Object:proc
extrn pulsec_pulse_collections_LinkedList_remove__int:proc
extrn pulsec_pulse_collections_LinkedList_retainAll__Collection:proc
extrn pulsec_pulse_collections_LinkedList_set__int_Object:proc
extrn pulsec_pulse_collections_LinkedList_set__int_String:proc
extrn pulsec_pulse_collections_LinkedList_set__int_int:proc
extrn pulsec_pulse_collections_LinkedList_size:proc
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

public pulsec_fld_pulse_collections_ArrayList_values
public pulsec_fld_pulse_collections_ArrayList_values_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_ArrayList dd 0
pulsec_fcap_pulse_collections_ArrayList dd 63
pulsec_fld_pulse_collections_ArrayList_values_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_ArrayList_values dq pulsec_fld_pulse_collections_ArrayList_values_tbl
pulsec_fld_pulse_collections_ArrayList_values_heap_owned dd 0
trace_m0 db "pulse.collections.ArrayList.requireElementIndex"
trace_m0_len equ 47
trace_m1 db "pulse.collections.ArrayList.requireInsertIndex"
trace_m1_len equ 46
trace_m2 db "pulse.collections.ArrayList.ArrayList"
trace_m2_len equ 37
trace_m3 db "pulse.collections.ArrayList.size"
trace_m3_len equ 32
trace_m4 db "pulse.collections.ArrayList.iterator"
trace_m4_len equ 36
trace_m5 db "pulse.collections.ArrayList.isEmpty"
trace_m5_len equ 35
trace_m6 db "pulse.collections.ArrayList.clear"
trace_m6_len equ 33
trace_m7 db "pulse.collections.ArrayList.add"
trace_m7_len equ 31
trace_m8 db "pulse.collections.ArrayList.add"
trace_m8_len equ 31
trace_m9 db "pulse.collections.ArrayList.add"
trace_m9_len equ 31
trace_m10 db "pulse.collections.ArrayList.addAll"
trace_m10_len equ 34
trace_m11 db "pulse.collections.ArrayList.containsAll"
trace_m11_len equ 39
trace_m12 db "pulse.collections.ArrayList.removeAll"
trace_m12_len equ 37
trace_m13 db "pulse.collections.ArrayList.retainAll"
trace_m13_len equ 37
trace_m14 db "pulse.collections.ArrayList.add"
trace_m14_len equ 31
trace_m15 db "pulse.collections.ArrayList.add"
trace_m15_len equ 31
trace_m16 db "pulse.collections.ArrayList.add"
trace_m16_len equ 31
trace_m17 db "pulse.collections.ArrayList.get"
trace_m17_len equ 31
trace_m18 db "pulse.collections.ArrayList.getFirst"
trace_m18_len equ 36
trace_m19 db "pulse.collections.ArrayList.getLast"
trace_m19_len equ 35
trace_m20 db "pulse.collections.ArrayList.getInt"
trace_m20_len equ 34
trace_m21 db "pulse.collections.ArrayList.getString"
trace_m21_len equ 37
trace_m22 db "pulse.collections.ArrayList.remove"
trace_m22_len equ 34
trace_m23 db "pulse.collections.ArrayList.remove"
trace_m23_len equ 34
trace_m24 db "pulse.collections.ArrayList.set"
trace_m24_len equ 31
trace_m25 db "pulse.collections.ArrayList.set"
trace_m25_len equ 31
trace_m26 db "pulse.collections.ArrayList.set"
trace_m26_len equ 31
trace_m27 db "pulse.collections.ArrayList.contains"
trace_m27_len equ 36
trace_m28 db "pulse.collections.ArrayList.contains"
trace_m28_len equ 36
trace_m29 db "pulse.collections.ArrayList.contains"
trace_m29_len equ 36
trace_m30 db "pulse.collections.ArrayList.indexOf"
trace_m30_len equ 35
trace_m31 db "pulse.collections.ArrayList.indexOf"
trace_m31_len equ 35
trace_m32 db "pulse.collections.ArrayList.indexOf"
trace_m32_len equ 35
trace_m33 db "pulse.collections.ArrayList.lastIndexOf"
trace_m33_len equ 39
trace_m34 db "pulse.collections.ArrayList.lastIndexOf"
trace_m34_len equ 39
trace_m35 db "pulse.collections.ArrayList.lastIndexOf"
trace_m35_len equ 39
msg0 db "ArrayList index out of bounds"
msg0_len equ 29
msg1 db "ArrayList index out of bounds"
msg1_len equ 29
msg2 db "ArrayList is empty"
msg2_len equ 18
msg3 db "ArrayList is empty"
msg3_len equ 18

.code
pulsec_fcap_pulse_collections_ArrayList_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_ArrayList]
    jbe pulsec_fcap_pulse_collections_ArrayList_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_ArrayList]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_ArrayList_ensure_fail
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
    jz pulsec_fcap_pulse_collections_ArrayList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    xor esi, esi
pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_ArrayList_values_heap_owned], 0
    je pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_ArrayList_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_ArrayList_values], r12
    mov dword ptr [pulsec_fld_pulse_collections_ArrayList_values_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_ArrayList], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_ArrayList_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_ArrayList_ensure_alloc_fail:
pulsec_fcap_pulse_collections_ArrayList_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_ArrayList_ensure endp

pulsec_fcap_pulse_collections_ArrayList_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_ArrayList_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_ArrayList_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_ArrayList_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_ArrayList_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_ArrayList_arc_teardown endp
pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_ArrayList_arc_scan_edges endp
pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_ArrayList_arc_invalidate_edges endp
pulsec_pulse_collections_ArrayList_requireElementIndex__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_requireElementIndex__int_b0:
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je ArrayList_requireElementIndex_vd0_8_null
    call pulsec_pulse_collections_LinkedList_size
    jmp ArrayList_requireElementIndex_vd0_8_done
ArrayList_requireElementIndex_vd0_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
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
    jne pulsec_pulse_collections_ArrayList_requireElementIndex__int_b1
    jmp pulsec_pulse_collections_ArrayList_requireElementIndex__int_b2
pulsec_pulse_collections_ArrayList_requireElementIndex__int_b1:
    lea rcx, msg0
    mov edx, msg0_len
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
    jmp pulsec_pulse_collections_ArrayList_requireElementIndex__int_b3
pulsec_pulse_collections_ArrayList_requireElementIndex__int_b2:
    jmp pulsec_pulse_collections_ArrayList_requireElementIndex__int_b3
pulsec_pulse_collections_ArrayList_requireElementIndex__int_b3:
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_requireElementIndex__int_epilogue
pulsec_pulse_collections_ArrayList_requireElementIndex__int_epilogue:
pulsec_pulse_collections_ArrayList_requireElementIndex__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_ArrayList_requireElementIndex__int endp

pulsec_pulse_collections_ArrayList_requireInsertIndex__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b0:
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    test rcx, rcx
    je ArrayList_requireInsertIndex_vd0_8_null
    call pulsec_pulse_collections_LinkedList_size
    jmp ArrayList_requireInsertIndex_vd0_8_done
ArrayList_requireInsertIndex_vd0_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
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
    jne pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b1
    jmp pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b2
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b1:
    lea rcx, msg1
    mov edx, msg1_len
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
    jmp pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b3
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b2:
    jmp pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b3
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_b3:
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_requireInsertIndex__int_epilogue
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_epilogue:
pulsec_pulse_collections_ArrayList_requireInsertIndex__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_ArrayList_requireInsertIndex__int endp

pulsec_pulse_collections_ArrayList_ArrayList proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_ArrayList_ArrayList_ctor_reuse
    mov ecx, 4
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_ArrayList_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_collections_ArrayList_ArrayList_ctor_ready
pulsec_pulse_collections_ArrayList_ArrayList_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_ArrayList_ArrayList_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_ArrayList_ArrayList_b0:
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedList_LinkedList
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_ArrayList_ArrayList_epilogue
pulsec_pulse_collections_ArrayList_ArrayList_epilogue:
pulsec_pulse_collections_ArrayList_ArrayList_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_ArrayList endp

pulsec_pulse_collections_ArrayList_size proc
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
pulsec_pulse_collections_ArrayList_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_size_vd0_3_null
    call pulsec_pulse_collections_LinkedList_size
    jmp ArrayList_size_vd0_3_done
ArrayList_size_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_size_vd0_3_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_ArrayList_size_epilogue
pulsec_pulse_collections_ArrayList_size_epilogue:
pulsec_pulse_collections_ArrayList_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_size endp

pulsec_pulse_collections_ArrayList_iterator proc
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
pulsec_pulse_collections_ArrayList_iterator_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_iterator_vd0_3_null
    call pulsec_pulse_collections_LinkedList_iterator
    jmp ArrayList_iterator_vd0_3_done
ArrayList_iterator_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_iterator_vd0_3_done:
    jmp pulsec_pulse_collections_ArrayList_iterator_epilogue
pulsec_pulse_collections_ArrayList_iterator_epilogue:
pulsec_pulse_collections_ArrayList_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_iterator endp

pulsec_pulse_collections_ArrayList_isEmpty proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_ArrayList_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_isEmpty_vd0_3_null
    call pulsec_pulse_collections_LinkedList_isEmpty
    jmp ArrayList_isEmpty_vd0_3_done
ArrayList_isEmpty_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_isEmpty_vd0_3_done:
    mov eax, eax
    jmp pulsec_pulse_collections_ArrayList_isEmpty_epilogue
pulsec_pulse_collections_ArrayList_isEmpty_epilogue:
pulsec_pulse_collections_ArrayList_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_isEmpty endp

pulsec_pulse_collections_ArrayList_clear proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_ArrayList_clear_b0:
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+136], r8
    mov qword ptr [rsp+144], r9
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov rdx, qword ptr [rsp+128]
    mov r8, qword ptr [rsp+136]
    mov r9, qword ptr [rsp+144]
    test rcx, rcx
    je pulsec_pulse_collections_ArrayList_clear_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_LinkedList_clear
    jmp pulsec_pulse_collections_ArrayList_clear_vd_stmt_0_0_0_done
pulsec_pulse_collections_ArrayList_clear_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_ArrayList_clear_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_clear_epilogue
pulsec_pulse_collections_ArrayList_clear_epilogue:
pulsec_pulse_collections_ArrayList_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_clear endp

pulsec_pulse_collections_ArrayList_add__Object proc
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
pulsec_pulse_collections_ArrayList_add__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_add_vd0_4_null
    call pulsec_pulse_collections_LinkedList_add__Object
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_add__Object_epilogue
pulsec_pulse_collections_ArrayList_add__Object_epilogue:
pulsec_pulse_collections_ArrayList_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__Object endp

pulsec_pulse_collections_ArrayList_add__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_add__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_add_vd0_4_null
    call pulsec_pulse_collections_LinkedList_add__int
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    mov eax, eax
    jmp pulsec_pulse_collections_ArrayList_add__int_epilogue
pulsec_pulse_collections_ArrayList_add__int_epilogue:
pulsec_pulse_collections_ArrayList_add__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__int endp

pulsec_pulse_collections_ArrayList_add__String proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_add__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_add_vd0_4_null
    call pulsec_pulse_collections_LinkedList_add__String
    jmp ArrayList_add_vd0_4_done
ArrayList_add_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_add_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_add__String_epilogue
pulsec_pulse_collections_ArrayList_add__String_epilogue:
pulsec_pulse_collections_ArrayList_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__String endp

pulsec_pulse_collections_ArrayList_addAll__Collection proc
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
pulsec_pulse_collections_ArrayList_addAll__Collection_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_ArrayList_addAll__Collection_b1
    jmp pulsec_pulse_collections_ArrayList_addAll__Collection_b2
pulsec_pulse_collections_ArrayList_addAll__Collection_b1:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
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
    je ArrayList_addAll_vd1_8_null
    call pulsec_pulse_collections_LinkedList_addAll__Collection
    jmp ArrayList_addAll_vd1_8_done
ArrayList_addAll_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_addAll_vd1_8_done:
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_ArrayList_addAll__Collection_epilogue
pulsec_pulse_collections_ArrayList_addAll__Collection_b2:
    jmp pulsec_pulse_collections_ArrayList_addAll__Collection_b3
pulsec_pulse_collections_ArrayList_addAll__Collection_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_addAll_vd2_13_null
    call pulsec_pulse_collections_LinkedList_addAll__Collection
    jmp ArrayList_addAll_vd2_13_done
ArrayList_addAll_vd2_13_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_addAll_vd2_13_done:
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_ArrayList_addAll__Collection_epilogue
pulsec_pulse_collections_ArrayList_addAll__Collection_epilogue:
pulsec_pulse_collections_ArrayList_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_addAll__Collection endp

pulsec_pulse_collections_ArrayList_containsAll__Collection proc
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
pulsec_pulse_collections_ArrayList_containsAll__Collection_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_containsAll_vd0_4_null
    call pulsec_pulse_collections_LinkedList_containsAll__Collection
    jmp ArrayList_containsAll_vd0_4_done
ArrayList_containsAll_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_containsAll_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_containsAll__Collection_epilogue
pulsec_pulse_collections_ArrayList_containsAll__Collection_epilogue:
pulsec_pulse_collections_ArrayList_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_containsAll__Collection endp

pulsec_pulse_collections_ArrayList_removeAll__Collection proc
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
pulsec_pulse_collections_ArrayList_removeAll__Collection_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_removeAll_vd0_4_null
    call pulsec_pulse_collections_LinkedList_removeAll__Collection
    jmp ArrayList_removeAll_vd0_4_done
ArrayList_removeAll_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_removeAll_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_removeAll__Collection_epilogue
pulsec_pulse_collections_ArrayList_removeAll__Collection_epilogue:
pulsec_pulse_collections_ArrayList_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_removeAll__Collection endp

pulsec_pulse_collections_ArrayList_retainAll__Collection proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_retainAll__Collection_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_retainAll_vd0_4_null
    call pulsec_pulse_collections_LinkedList_retainAll__Collection
    jmp ArrayList_retainAll_vd0_4_done
ArrayList_retainAll_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_retainAll_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_retainAll__Collection_epilogue
pulsec_pulse_collections_ArrayList_retainAll__Collection_epilogue:
pulsec_pulse_collections_ArrayList_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_retainAll__Collection endp

pulsec_pulse_collections_ArrayList_add__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_ArrayList_add__int_Object_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireInsertIndex__int
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je pulsec_pulse_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_null
    call pulsec_pulse_collections_LinkedList_add__int_Object
    jmp pulsec_pulse_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_done
pulsec_pulse_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_ArrayList_add__int_Object_vd_stmt_0_1_1_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_add__int_Object_epilogue
pulsec_pulse_collections_ArrayList_add__int_Object_epilogue:
pulsec_pulse_collections_ArrayList_add__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__int_Object endp

pulsec_pulse_collections_ArrayList_add__int_int proc
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
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_ArrayList_add__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireInsertIndex__int
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je pulsec_pulse_collections_ArrayList_add__int_int_vd_stmt_0_1_1_null
    call pulsec_pulse_collections_LinkedList_add__int_int
    jmp pulsec_pulse_collections_ArrayList_add__int_int_vd_stmt_0_1_1_done
pulsec_pulse_collections_ArrayList_add__int_int_vd_stmt_0_1_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_ArrayList_add__int_int_vd_stmt_0_1_1_done:
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_add__int_int_epilogue
pulsec_pulse_collections_ArrayList_add__int_int_epilogue:
pulsec_pulse_collections_ArrayList_add__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__int_int endp

pulsec_pulse_collections_ArrayList_add__int_String proc
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
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_ArrayList_add__int_String_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireInsertIndex__int
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
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je pulsec_pulse_collections_ArrayList_add__int_String_vd_stmt_0_1_1_null
    call pulsec_pulse_collections_LinkedList_add__int_String
    jmp pulsec_pulse_collections_ArrayList_add__int_String_vd_stmt_0_1_1_done
pulsec_pulse_collections_ArrayList_add__int_String_vd_stmt_0_1_1_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_ArrayList_add__int_String_vd_stmt_0_1_1_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_ArrayList_add__int_String_epilogue
pulsec_pulse_collections_ArrayList_add__int_String_epilogue:
pulsec_pulse_collections_ArrayList_add__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_add__int_String endp

pulsec_pulse_collections_ArrayList_get__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_get__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_get_vd1_8_null
    call pulsec_pulse_collections_LinkedList_get__int
    jmp ArrayList_get_vd1_8_done
ArrayList_get_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_get_vd1_8_done:
    jmp pulsec_pulse_collections_ArrayList_get__int_epilogue
pulsec_pulse_collections_ArrayList_get__int_epilogue:
pulsec_pulse_collections_ArrayList_get__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_get__int endp

pulsec_pulse_collections_ArrayList_getFirst proc
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
pulsec_pulse_collections_ArrayList_getFirst_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getFirst_vd0_3_null
    call pulsec_pulse_collections_LinkedList_isEmpty
    jmp ArrayList_getFirst_vd0_3_done
ArrayList_getFirst_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getFirst_vd0_3_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_ArrayList_getFirst_b1
    jmp pulsec_pulse_collections_ArrayList_getFirst_b2
pulsec_pulse_collections_ArrayList_getFirst_b1:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_ArrayList_getFirst_b3
pulsec_pulse_collections_ArrayList_getFirst_b2:
    jmp pulsec_pulse_collections_ArrayList_getFirst_b3
pulsec_pulse_collections_ArrayList_getFirst_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getFirst_vd2_11_null
    call pulsec_pulse_collections_LinkedList_getFirst
    jmp ArrayList_getFirst_vd2_11_done
ArrayList_getFirst_vd2_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getFirst_vd2_11_done:
    jmp pulsec_pulse_collections_ArrayList_getFirst_epilogue
pulsec_pulse_collections_ArrayList_getFirst_epilogue:
pulsec_pulse_collections_ArrayList_getFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_getFirst endp

pulsec_pulse_collections_ArrayList_getLast proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_ArrayList_getLast_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getLast_vd0_3_null
    call pulsec_pulse_collections_LinkedList_isEmpty
    jmp ArrayList_getLast_vd0_3_done
ArrayList_getLast_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getLast_vd0_3_done:
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_collections_ArrayList_getLast_b1
    jmp pulsec_pulse_collections_ArrayList_getLast_b2
pulsec_pulse_collections_ArrayList_getLast_b1:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_ArrayList_getLast_b3
pulsec_pulse_collections_ArrayList_getLast_b2:
    jmp pulsec_pulse_collections_ArrayList_getLast_b3
pulsec_pulse_collections_ArrayList_getLast_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    test rcx, rcx
    je ArrayList_getLast_vd2_11_null
    call pulsec_pulse_collections_LinkedList_getLast
    jmp ArrayList_getLast_vd2_11_done
ArrayList_getLast_vd2_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getLast_vd2_11_done:
    jmp pulsec_pulse_collections_ArrayList_getLast_epilogue
pulsec_pulse_collections_ArrayList_getLast_epilogue:
pulsec_pulse_collections_ArrayList_getLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_ArrayList_getLast endp

pulsec_pulse_collections_ArrayList_getInt__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_getInt__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_getInt_vd1_8_null
    call pulsec_pulse_collections_LinkedList_getInt__int
    jmp ArrayList_getInt_vd1_8_done
ArrayList_getInt_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getInt_vd1_8_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_ArrayList_getInt__int_epilogue
pulsec_pulse_collections_ArrayList_getInt__int_epilogue:
pulsec_pulse_collections_ArrayList_getInt__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_getInt__int endp

pulsec_pulse_collections_ArrayList_getString__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_getString__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_getString_vd1_8_null
    call pulsec_pulse_collections_LinkedList_getString__int
    jmp ArrayList_getString_vd1_8_done
ArrayList_getString_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_getString_vd1_8_done:
    jmp pulsec_pulse_collections_ArrayList_getString__int_epilogue
pulsec_pulse_collections_ArrayList_getString__int_epilogue:
pulsec_pulse_collections_ArrayList_getString__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_getString__int endp

pulsec_pulse_collections_ArrayList_remove__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_remove__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_remove_vd1_8_null
    call pulsec_pulse_collections_LinkedList_remove__int
    jmp ArrayList_remove_vd1_8_done
ArrayList_remove_vd1_8_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_remove_vd1_8_done:
    jmp pulsec_pulse_collections_ArrayList_remove__int_epilogue
pulsec_pulse_collections_ArrayList_remove__int_epilogue:
pulsec_pulse_collections_ArrayList_remove__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_remove__int endp

pulsec_pulse_collections_ArrayList_remove__Object proc
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
pulsec_pulse_collections_ArrayList_remove__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_remove_vd0_4_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp ArrayList_remove_vd0_4_done
ArrayList_remove_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_remove_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_remove__Object_epilogue
pulsec_pulse_collections_ArrayList_remove__Object_epilogue:
pulsec_pulse_collections_ArrayList_remove__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_remove__Object endp

pulsec_pulse_collections_ArrayList_set__int_Object proc
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
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_ArrayList_set__int_Object_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
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
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call pulsec_pulse_collections_LinkedList_set__int_Object
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_ArrayList_set__int_Object_epilogue
pulsec_pulse_collections_ArrayList_set__int_Object_epilogue:
pulsec_pulse_collections_ArrayList_set__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_set__int_Object endp

pulsec_pulse_collections_ArrayList_set__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_ArrayList_set__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
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
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call pulsec_pulse_collections_LinkedList_set__int_int
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_ArrayList_set__int_int_epilogue
pulsec_pulse_collections_ArrayList_set__int_int_epilogue:
pulsec_pulse_collections_ArrayList_set__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_set__int_int endp

pulsec_pulse_collections_ArrayList_set__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_ArrayList_set__int_String_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_ArrayList_requireElementIndex__int
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
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
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je ArrayList_set_vd1_9_null
    call pulsec_pulse_collections_LinkedList_set__int_String
    jmp ArrayList_set_vd1_9_done
ArrayList_set_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_set_vd1_9_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_ArrayList_set__int_String_epilogue
pulsec_pulse_collections_ArrayList_set__int_String_epilogue:
pulsec_pulse_collections_ArrayList_set__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_set__int_String endp

pulsec_pulse_collections_ArrayList_contains__Object proc
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
pulsec_pulse_collections_ArrayList_contains__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_contains_vd0_4_null
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_contains__Object_epilogue
pulsec_pulse_collections_ArrayList_contains__Object_epilogue:
pulsec_pulse_collections_ArrayList_contains__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_contains__Object endp

pulsec_pulse_collections_ArrayList_contains__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_contains__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_contains_vd0_4_null
    call pulsec_pulse_collections_LinkedList_contains__int
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    mov eax, eax
    jmp pulsec_pulse_collections_ArrayList_contains__int_epilogue
pulsec_pulse_collections_ArrayList_contains__int_epilogue:
pulsec_pulse_collections_ArrayList_contains__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_contains__int endp

pulsec_pulse_collections_ArrayList_contains__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_contains__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_contains_vd0_4_null
    call pulsec_pulse_collections_LinkedList_contains__String
    jmp ArrayList_contains_vd0_4_done
ArrayList_contains_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_contains_vd0_4_done:
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_contains__String_epilogue
pulsec_pulse_collections_ArrayList_contains__String_epilogue:
pulsec_pulse_collections_ArrayList_contains__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_contains__String endp

pulsec_pulse_collections_ArrayList_indexOf__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_indexOf__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_indexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_indexOf__Object
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_indexOf__Object_epilogue
pulsec_pulse_collections_ArrayList_indexOf__Object_epilogue:
pulsec_pulse_collections_ArrayList_indexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_indexOf__Object endp

pulsec_pulse_collections_ArrayList_indexOf__int proc
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
pulsec_pulse_collections_ArrayList_indexOf__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_indexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_indexOf__int
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_ArrayList_indexOf__int_epilogue
pulsec_pulse_collections_ArrayList_indexOf__int_epilogue:
pulsec_pulse_collections_ArrayList_indexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_indexOf__int endp

pulsec_pulse_collections_ArrayList_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_indexOf__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_indexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_indexOf__String
    jmp ArrayList_indexOf_vd0_4_done
ArrayList_indexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_indexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_indexOf__String_epilogue
pulsec_pulse_collections_ArrayList_indexOf__String_epilogue:
pulsec_pulse_collections_ArrayList_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_indexOf__String endp

pulsec_pulse_collections_ArrayList_lastIndexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_lastIndexOf__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_lastIndexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_lastIndexOf__Object
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_lastIndexOf__Object_epilogue
pulsec_pulse_collections_ArrayList_lastIndexOf__Object_epilogue:
pulsec_pulse_collections_ArrayList_lastIndexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_lastIndexOf__Object endp

pulsec_pulse_collections_ArrayList_lastIndexOf__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_ArrayList_lastIndexOf__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je ArrayList_lastIndexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_lastIndexOf__int
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    jmp pulsec_pulse_collections_ArrayList_lastIndexOf__int_epilogue
pulsec_pulse_collections_ArrayList_lastIndexOf__int_epilogue:
pulsec_pulse_collections_ArrayList_lastIndexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_lastIndexOf__int endp

pulsec_pulse_collections_ArrayList_lastIndexOf__String proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_ArrayList_lastIndexOf__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_ArrayList_values]
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
    je ArrayList_lastIndexOf_vd0_4_null
    call pulsec_pulse_collections_LinkedList_lastIndexOf__String
    jmp ArrayList_lastIndexOf_vd0_4_done
ArrayList_lastIndexOf_vd0_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
ArrayList_lastIndexOf_vd0_4_done:
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_ArrayList_lastIndexOf__String_epilogue
pulsec_pulse_collections_ArrayList_lastIndexOf__String_epilogue:
pulsec_pulse_collections_ArrayList_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_ArrayList_lastIndexOf__String endp

end
