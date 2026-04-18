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
extrn adenc_aden_lang_Integer_boxObject__int:proc
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

public adenc_fld_aden_collections_LinkedListNode_value
public adenc_fld_aden_collections_LinkedListNode_value_heap_owned
public adenc_fld_aden_collections_LinkedListNode_intValue
public adenc_fld_aden_collections_LinkedListNode_intValue_heap_owned
public adenc_fld_aden_collections_LinkedListNode_intValueActive
public adenc_fld_aden_collections_LinkedListNode_intValueActive_heap_owned
public adenc_fld_aden_collections_LinkedListNode_previous
public adenc_fld_aden_collections_LinkedListNode_previous_heap_owned
public adenc_fld_aden_collections_LinkedListNode_next
public adenc_fld_aden_collections_LinkedListNode_next_heap_owned

.data
written dq 0
adenc_objc_aden_collections_LinkedListNode dd 0
adenc_fcap_aden_collections_LinkedListNode dd 63
adenc_fld_aden_collections_LinkedListNode_value_tbl dq 64 dup(0)
adenc_fld_aden_collections_LinkedListNode_value dq adenc_fld_aden_collections_LinkedListNode_value_tbl
adenc_fld_aden_collections_LinkedListNode_value_heap_owned dd 0
adenc_fld_aden_collections_LinkedListNode_intValue_tbl dd 64 dup(0)
adenc_fld_aden_collections_LinkedListNode_intValue dq adenc_fld_aden_collections_LinkedListNode_intValue_tbl
adenc_fld_aden_collections_LinkedListNode_intValue_heap_owned dd 0
adenc_fld_aden_collections_LinkedListNode_intValueActive_tbl dd 64 dup(0)
adenc_fld_aden_collections_LinkedListNode_intValueActive dq adenc_fld_aden_collections_LinkedListNode_intValueActive_tbl
adenc_fld_aden_collections_LinkedListNode_intValueActive_heap_owned dd 0
adenc_fld_aden_collections_LinkedListNode_previous_tbl dq 64 dup(0)
adenc_fld_aden_collections_LinkedListNode_previous dq adenc_fld_aden_collections_LinkedListNode_previous_tbl
adenc_fld_aden_collections_LinkedListNode_previous_heap_owned dd 0
adenc_fld_aden_collections_LinkedListNode_next_tbl dq 64 dup(0)
adenc_fld_aden_collections_LinkedListNode_next dq adenc_fld_aden_collections_LinkedListNode_next_tbl
adenc_fld_aden_collections_LinkedListNode_next_heap_owned dd 0
trace_m0 db "aden.collections.LinkedListNode.LinkedListNode"
trace_m0_len equ 46
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100
    db 101, 110, 58, 50, 48, 41
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s0_len equ 70
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s1 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100
    db 101, 110, 58, 50, 49, 41
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s1_len equ 70
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s2 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100
    db 101, 110, 58, 50, 50, 41
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s2_len equ 70
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s3 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100
    db 101, 110, 58, 50, 51, 41
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s3_len equ 70
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s4 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100
    db 101, 110, 58, 50, 52, 41
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s4_len equ 70
trace_m6 db "aden.collections.LinkedListNode.getValue"
trace_m6_len equ 40
adenc_aden_collections_LinkedListNode_getValue_trace_s0 db "aden.collections.LinkedListNode.getValue(LinkedListNode.aden:31)"
adenc_aden_collections_LinkedListNode_getValue_trace_s0_len equ 64
adenc_aden_collections_LinkedListNode_getValue_trace_s1 db "aden.collections.LinkedListNode.getValue(LinkedListNode.aden:32)"
adenc_aden_collections_LinkedListNode_getValue_trace_s1_len equ 64
adenc_aden_collections_LinkedListNode_getValue_trace_s2 db "aden.collections.LinkedListNode.getValue(LinkedListNode.aden:34)"
adenc_aden_collections_LinkedListNode_getValue_trace_s2_len equ 64
trace_m10 db "aden.collections.LinkedListNode.setValue"
trace_m10_len equ 40
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s0 db "aden.collections.LinkedListNode.setValue(LinkedListNode.aden:41)"
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s0_len equ 64
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s1 db "aden.collections.LinkedListNode.setValue(LinkedListNode.aden:42)"
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s1_len equ 64
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s2 db "aden.collections.LinkedListNode.setValue(LinkedListNode.aden:43)"
adenc_aden_collections_LinkedListNode_setValue__Object_trace_s2_len equ 64
trace_m14 db "aden.collections.LinkedListNode.hasIntValue"
trace_m14_len equ 43
adenc_aden_collections_LinkedListNode_hasIntValue_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 104, 97, 115, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 53, 48, 41
adenc_aden_collections_LinkedListNode_hasIntValue_trace_s0_len equ 67
trace_m16 db "aden.collections.LinkedListNode.getIntValue"
trace_m16_len equ 43
adenc_aden_collections_LinkedListNode_getIntValue_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 103, 101, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 53, 55, 41
adenc_aden_collections_LinkedListNode_getIntValue_trace_s0_len equ 67
trace_m18 db "aden.collections.LinkedListNode.setIntValue"
trace_m18_len equ 43
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 115, 101, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 54, 52, 41
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s0_len equ 67
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s1 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 115, 101, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 54, 53, 41
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s1_len equ 67
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s2 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 115, 101, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 54, 54, 41
adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s2_len equ 67
trace_m22 db "aden.collections.LinkedListNode.getPrevious"
trace_m22_len equ 43
adenc_aden_collections_LinkedListNode_getPrevious_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 103, 101, 116, 80, 114, 101, 118, 105, 111, 117, 115, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 55, 51, 41
adenc_aden_collections_LinkedListNode_getPrevious_trace_s0_len equ 67
trace_m24 db "aden.collections.LinkedListNode.setPrevious"
trace_m24_len equ 43
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_trace_s0 db 97, 100, 101, 110, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46
    db 115, 101, 116, 80, 114, 101, 118, 105, 111, 117, 115, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 78, 111, 100, 101, 46, 97, 100, 101, 110, 58
    db 56, 48, 41
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_trace_s0_len equ 67
trace_m26 db "aden.collections.LinkedListNode.getNext"
trace_m26_len equ 39
adenc_aden_collections_LinkedListNode_getNext_trace_s0 db "aden.collections.LinkedListNode.getNext(LinkedListNode.aden:87)"
adenc_aden_collections_LinkedListNode_getNext_trace_s0_len equ 63
trace_m28 db "aden.collections.LinkedListNode.setNext"
trace_m28_len equ 39
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_trace_s0 db "aden.collections.LinkedListNode.setNext(LinkedListNode.aden:94)"
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_trace_s0_len equ 63

.code
adenc_fcap_aden_collections_LinkedListNode_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_collections_LinkedListNode]
    jbe adenc_fcap_aden_collections_LinkedListNode_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_collections_LinkedListNode]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_fail
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
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_copy_loop
adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListNode_value_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListNode_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListNode_value], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListNode_value_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_copy_loop
adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListNode_intValue_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListNode_ensure_field_1_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListNode_intValue_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_copy_loop
adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListNode_ensure_field_2_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_copy_loop
adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListNode_previous_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListNode_ensure_field_3_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListNode_previous], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListNode_previous_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    xor esi, esi
adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_next:
    add esi, 1
    jmp adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_copy_loop
adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done:
    cmp dword ptr [adenc_fld_aden_collections_LinkedListNode_next_heap_owned], 0
    je adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_collections_LinkedListNode_ensure_field_4_done_commit:
    mov qword ptr [adenc_fld_aden_collections_LinkedListNode_next], r12
    mov dword ptr [adenc_fld_aden_collections_LinkedListNode_next_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_collections_LinkedListNode], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_collections_LinkedListNode_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_collections_LinkedListNode_ensure_alloc_fail:
adenc_fcap_aden_collections_LinkedListNode_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_collections_LinkedListNode_ensure endp

adenc_fcap_aden_collections_LinkedListNode_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_1_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_2_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_aden_collections_LinkedListNode_arc_teardown_field_2_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListNode_arc_teardown_done:
    ret
adenc_fcap_aden_collections_LinkedListNode_arc_teardown endp
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_field_2_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges_done:
    ret
adenc_fcap_aden_collections_LinkedListNode_arc_scan_edges endp
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_field_2_skip:
    add rsp, 40
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges_done:
    ret
adenc_fcap_aden_collections_LinkedListNode_arc_invalidate_edges endp
adenc_aden_collections_LinkedListNode_LinkedListNode__Object proc
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
    jne adenc_aden_collections_LinkedListNode_LinkedListNode__Object_ctor_reuse
    mov ecx, 6
    call adenc_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_fcap_aden_collections_LinkedListNode_ensure
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_collections_LinkedListNode_LinkedListNode__Object_ctor_ready
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s0_len
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
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s1
    mov edx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s2
    mov edx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s3
    mov edx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s3_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    lea rcx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s4
    mov edx, adenc_aden_collections_LinkedListNode_LinkedListNode__Object_trace_s4_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_collections_LinkedListNode_LinkedListNode__Object_epilogue
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListNode_LinkedListNode__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_LinkedListNode__Object endp

adenc_aden_collections_LinkedListNode_getValue proc
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
adenc_aden_collections_LinkedListNode_getValue_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_getValue_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_getValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    mov eax, dword ptr [r10+rdx*4]
    test eax, eax
    jne adenc_aden_collections_LinkedListNode_getValue_b1
    jmp adenc_aden_collections_LinkedListNode_getValue_b2
adenc_aden_collections_LinkedListNode_getValue_b1:
    lea rcx, adenc_aden_collections_LinkedListNode_getValue_trace_s1
    mov edx, adenc_aden_collections_LinkedListNode_getValue_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call adenc_aden_lang_Integer_boxObject__int
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_collections_LinkedListNode_getValue_epilogue
adenc_aden_collections_LinkedListNode_getValue_b2:
    lea rcx, adenc_aden_collections_LinkedListNode_getValue_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_getValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_collections_LinkedListNode_getValue_b3
adenc_aden_collections_LinkedListNode_getValue_b3:
    lea rcx, adenc_aden_collections_LinkedListNode_getValue_trace_s2
    mov edx, adenc_aden_collections_LinkedListNode_getValue_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_collections_LinkedListNode_getValue_epilogue
adenc_aden_collections_LinkedListNode_getValue_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_LinkedListNode_getValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_collections_LinkedListNode_getValue endp

adenc_aden_collections_LinkedListNode_setValue__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_LinkedListNode_setValue__Object_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s0_len
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
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s1
    mov edx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s2
    mov edx, adenc_aden_collections_LinkedListNode_setValue__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp adenc_aden_collections_LinkedListNode_setValue__Object_epilogue
adenc_aden_collections_LinkedListNode_setValue__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListNode_setValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_setValue__Object endp

adenc_aden_collections_LinkedListNode_hasIntValue proc
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
adenc_aden_collections_LinkedListNode_hasIntValue_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_hasIntValue_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_hasIntValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_aden_collections_LinkedListNode_hasIntValue_epilogue
adenc_aden_collections_LinkedListNode_hasIntValue_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_LinkedListNode_hasIntValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_hasIntValue endp

adenc_aden_collections_LinkedListNode_getIntValue proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_LinkedListNode_getIntValue_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_getIntValue_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_getIntValue_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_aden_collections_LinkedListNode_getIntValue_epilogue
adenc_aden_collections_LinkedListNode_getIntValue_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_LinkedListNode_getIntValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_getIntValue endp

adenc_aden_collections_LinkedListNode_setIntValue__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_LinkedListNode_setIntValue__int_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    xor eax, eax
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_value]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s1
    mov edx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValue]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s2
    mov edx, adenc_aden_collections_LinkedListNode_setIntValue__int_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_intValueActive]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp adenc_aden_collections_LinkedListNode_setIntValue__int_epilogue
adenc_aden_collections_LinkedListNode_setIntValue__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListNode_setIntValue__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_setIntValue__int endp

adenc_aden_collections_LinkedListNode_getPrevious proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_LinkedListNode_getPrevious_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_getPrevious_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_getPrevious_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_collections_LinkedListNode_getPrevious_epilogue
adenc_aden_collections_LinkedListNode_getPrevious_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_LinkedListNode_getPrevious_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_getPrevious endp

adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_trace_s0_len
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
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_previous]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_setPrevious__LinkedListNode endp

adenc_aden_collections_LinkedListNode_getNext proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_collections_LinkedListNode_getNext_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_getNext_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_getNext_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_collections_LinkedListNode_getNext_epilogue
adenc_aden_collections_LinkedListNode_getNext_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_LinkedListNode_getNext_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_getNext endp

adenc_aden_collections_LinkedListNode_setNext__LinkedListNode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_b0:
    lea rcx, adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_trace_s0
    mov edx, adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_trace_s0_len
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
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_collections_LinkedListNode_next]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_epilogue
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_LinkedListNode_setNext__LinkedListNode endp

end
