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
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_Integer_boxObject__int:proc
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

public pulsec_fld_pulse_collections_LinkedListNode_value
public pulsec_fld_pulse_collections_LinkedListNode_value_heap_owned
public pulsec_fld_pulse_collections_LinkedListNode_intValue
public pulsec_fld_pulse_collections_LinkedListNode_intValue_heap_owned
public pulsec_fld_pulse_collections_LinkedListNode_intValueActive
public pulsec_fld_pulse_collections_LinkedListNode_intValueActive_heap_owned
public pulsec_fld_pulse_collections_LinkedListNode_previous
public pulsec_fld_pulse_collections_LinkedListNode_previous_heap_owned
public pulsec_fld_pulse_collections_LinkedListNode_next
public pulsec_fld_pulse_collections_LinkedListNode_next_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_LinkedListNode dd 0
pulsec_fcap_pulse_collections_LinkedListNode dd 63
pulsec_fld_pulse_collections_LinkedListNode_value_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedListNode_value dq pulsec_fld_pulse_collections_LinkedListNode_value_tbl
pulsec_fld_pulse_collections_LinkedListNode_value_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedListNode_intValue_tbl dd 64 dup(0)
pulsec_fld_pulse_collections_LinkedListNode_intValue dq pulsec_fld_pulse_collections_LinkedListNode_intValue_tbl
pulsec_fld_pulse_collections_LinkedListNode_intValue_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedListNode_intValueActive_tbl dd 64 dup(0)
pulsec_fld_pulse_collections_LinkedListNode_intValueActive dq pulsec_fld_pulse_collections_LinkedListNode_intValueActive_tbl
pulsec_fld_pulse_collections_LinkedListNode_intValueActive_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedListNode_previous_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedListNode_previous dq pulsec_fld_pulse_collections_LinkedListNode_previous_tbl
pulsec_fld_pulse_collections_LinkedListNode_previous_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedListNode_next_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedListNode_next dq pulsec_fld_pulse_collections_LinkedListNode_next_tbl
pulsec_fld_pulse_collections_LinkedListNode_next_heap_owned dd 0
trace_m0 db "pulse.collections.LinkedListNode.LinkedListNode"
trace_m0_len equ 47
trace_m1 db "pulse.collections.LinkedListNode.getValue"
trace_m1_len equ 41
trace_m2 db "pulse.collections.LinkedListNode.setValue"
trace_m2_len equ 41
trace_m3 db "pulse.collections.LinkedListNode.hasIntValue"
trace_m3_len equ 44
trace_m4 db "pulse.collections.LinkedListNode.getIntValue"
trace_m4_len equ 44
trace_m5 db "pulse.collections.LinkedListNode.setIntValue"
trace_m5_len equ 44
trace_m6 db "pulse.collections.LinkedListNode.getPrevious"
trace_m6_len equ 44
trace_m7 db "pulse.collections.LinkedListNode.setPrevious"
trace_m7_len equ 44
trace_m8 db "pulse.collections.LinkedListNode.getNext"
trace_m8_len equ 40
trace_m9 db "pulse.collections.LinkedListNode.setNext"
trace_m9_len equ 40

.code
pulsec_fcap_pulse_collections_LinkedListNode_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_LinkedListNode]
    jbe pulsec_fcap_pulse_collections_LinkedListNode_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_LinkedListNode]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_fail
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
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedListNode_value_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedListNode_value_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_copy_loop
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_copy_loop
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_3_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_copy_loop
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedListNode_next_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedListNode_ensure_field_4_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedListNode_next_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_LinkedListNode], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_LinkedListNode_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedListNode_ensure_alloc_fail:
pulsec_fcap_pulse_collections_LinkedListNode_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedListNode_ensure endp

pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_2_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_LinkedListNode_arc_teardown endp
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedListNode_arc_scan_edges endp
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_field_2_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedListNode_arc_invalidate_edges endp
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object proc
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
    jne pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_ctor_reuse
    mov ecx, 16
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_LinkedListNode_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_ctor_ready
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_epilogue
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_epilogue:
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object endp

pulsec_pulse_collections_LinkedListNode_getValue proc
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
pulsec_pulse_collections_LinkedListNode_getValue_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    mov eax, dword ptr [r10+rdx*4]
    test eax, eax
    jne pulsec_pulse_collections_LinkedListNode_getValue_b1
    jmp pulsec_pulse_collections_LinkedListNode_getValue_b2
pulsec_pulse_collections_LinkedListNode_getValue_b1:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_boxObject__int
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedListNode_getValue_epilogue
pulsec_pulse_collections_LinkedListNode_getValue_b2:
    jmp pulsec_pulse_collections_LinkedListNode_getValue_b3
pulsec_pulse_collections_LinkedListNode_getValue_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedListNode_getValue_epilogue
pulsec_pulse_collections_LinkedListNode_getValue_epilogue:
pulsec_pulse_collections_LinkedListNode_getValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedListNode_getValue endp

pulsec_pulse_collections_LinkedListNode_setValue__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedListNode_setValue__Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedListNode_setValue__Object_epilogue
pulsec_pulse_collections_LinkedListNode_setValue__Object_epilogue:
pulsec_pulse_collections_LinkedListNode_setValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_setValue__Object endp

pulsec_pulse_collections_LinkedListNode_hasIntValue proc
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
pulsec_pulse_collections_LinkedListNode_hasIntValue_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_collections_LinkedListNode_hasIntValue_epilogue
pulsec_pulse_collections_LinkedListNode_hasIntValue_epilogue:
pulsec_pulse_collections_LinkedListNode_hasIntValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_hasIntValue endp

pulsec_pulse_collections_LinkedListNode_getIntValue proc
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
pulsec_pulse_collections_LinkedListNode_getIntValue_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_collections_LinkedListNode_getIntValue_epilogue
pulsec_pulse_collections_LinkedListNode_getIntValue_epilogue:
pulsec_pulse_collections_LinkedListNode_getIntValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_getIntValue endp

pulsec_pulse_collections_LinkedListNode_setIntValue__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedListNode_setIntValue__int_b0:
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 1
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedListNode_setIntValue__int_epilogue
pulsec_pulse_collections_LinkedListNode_setIntValue__int_epilogue:
pulsec_pulse_collections_LinkedListNode_setIntValue__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_setIntValue__int endp

pulsec_pulse_collections_LinkedListNode_getPrevious proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedListNode_getPrevious_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedListNode_getPrevious_epilogue
pulsec_pulse_collections_LinkedListNode_getPrevious_epilogue:
pulsec_pulse_collections_LinkedListNode_getPrevious_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_getPrevious endp

pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_previous]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue:
pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode endp

pulsec_pulse_collections_LinkedListNode_getNext proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedListNode_getNext_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedListNode_getNext_epilogue
pulsec_pulse_collections_LinkedListNode_getNext_epilogue:
pulsec_pulse_collections_LinkedListNode_getNext_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_getNext endp

pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedListNode_next]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode_epilogue:
pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode endp

end
