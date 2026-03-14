option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_obj_counter:dword
extrn pulsec_rt_obj_class_ids:qword
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_com_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_rt_listAddInt:proc
extrn pulsec_rt_listAddString:proc
extrn pulsec_rt_listClear:proc
extrn pulsec_rt_listGetInt:proc
extrn pulsec_rt_listGetString:proc
extrn pulsec_rt_listNew:proc
extrn pulsec_rt_listSize:proc
extrn pulsec_rt_mapGetInt:proc
extrn pulsec_rt_mapNew:proc
extrn pulsec_rt_mapPutInt:proc
extrn pulsec_rt_panic:proc

public pulsec_fld_com_pulse_collections_LinkedList_handle
public pulsec_fld_com_pulse_collections_LinkedList_handle_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_queueHandle
public pulsec_fld_com_pulse_collections_LinkedList_queueHandle_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_queueHead
public pulsec_fld_com_pulse_collections_LinkedList_queueHead_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_queueTail
public pulsec_fld_com_pulse_collections_LinkedList_queueTail_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_dequeHandle
public pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_dequeHead
public pulsec_fld_com_pulse_collections_LinkedList_dequeHead_heap_owned
public pulsec_fld_com_pulse_collections_LinkedList_dequeTail
public pulsec_fld_com_pulse_collections_LinkedList_dequeTail_heap_owned

.data
written dq 0
pulsec_objc_com_pulse_collections_LinkedList dd 0
pulsec_fcap_com_pulse_collections_LinkedList dd 63
pulsec_fld_com_pulse_collections_LinkedList_handle_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_handle dq pulsec_fld_com_pulse_collections_LinkedList_handle_tbl
pulsec_fld_com_pulse_collections_LinkedList_handle_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_queueHandle_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueHandle dq pulsec_fld_com_pulse_collections_LinkedList_queueHandle_tbl
pulsec_fld_com_pulse_collections_LinkedList_queueHandle_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_queueHead_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueHead dq pulsec_fld_com_pulse_collections_LinkedList_queueHead_tbl
pulsec_fld_com_pulse_collections_LinkedList_queueHead_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_queueTail_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_queueTail dq pulsec_fld_com_pulse_collections_LinkedList_queueTail_tbl
pulsec_fld_com_pulse_collections_LinkedList_queueTail_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeHandle dq pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_tbl
pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_dequeHead_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeHead dq pulsec_fld_com_pulse_collections_LinkedList_dequeHead_tbl
pulsec_fld_com_pulse_collections_LinkedList_dequeHead_heap_owned dd 0
pulsec_fld_com_pulse_collections_LinkedList_dequeTail_tbl dd 64 dup(0)
pulsec_fld_com_pulse_collections_LinkedList_dequeTail dq pulsec_fld_com_pulse_collections_LinkedList_dequeTail_tbl
pulsec_fld_com_pulse_collections_LinkedList_dequeTail_heap_owned dd 0
trace_m0 db "com.pulse.collections.LinkedList.LinkedList"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.collections.LinkedList.size"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.collections.LinkedList.clear"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.collections.LinkedList.add"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.collections.LinkedList.add"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.collections.LinkedList.getInt"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.collections.LinkedList.getString"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.collections.LinkedList.offer"
trace_m7_len equ $ - trace_m7
trace_m8 db "com.pulse.collections.LinkedList.poll"
trace_m8_len equ $ - trace_m8
trace_m9 db "com.pulse.collections.LinkedList.isEmpty"
trace_m9_len equ $ - trace_m9
trace_m10 db "com.pulse.collections.LinkedList.addFirst"
trace_m10_len equ $ - trace_m10
trace_m11 db "com.pulse.collections.LinkedList.addLast"
trace_m11_len equ $ - trace_m11
trace_m12 db "com.pulse.collections.LinkedList.removeFirst"
trace_m12_len equ $ - trace_m12
trace_m13 db "com.pulse.collections.LinkedList.removeLast"
trace_m13_len equ $ - trace_m13
msg0 db "LinkedList capacity exceeded"
msg0_len equ $ - msg0
msg1 db "LinkedList capacity exceeded"
msg1_len equ $ - msg1
msg2 db "LinkedList index out of bounds"
msg2_len equ $ - msg2
msg3 db "LinkedList index out of bounds"
msg3_len equ $ - msg3
msg4 db 0
msg4_len equ $ - msg4
msg5 db "Queue is empty"
msg5_len equ $ - msg5
msg6 db "Deque is empty"
msg6_len equ $ - msg6
msg7 db "Deque is empty"
msg7_len equ $ - msg7

.code
pulsec_fcap_com_pulse_collections_LinkedList_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_com_pulse_collections_LinkedList_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_com_pulse_collections_LinkedList]
    jbe pulsec_fcap_com_pulse_collections_LinkedList_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_com_pulse_collections_LinkedList]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_3_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_4_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_5_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    xor esi, esi
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_next:
    add esi, 1
    jmp pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_copy_loop
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done:
    cmp dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail_heap_owned], 0
    je pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_commit
    test rbx, rbx
    jz pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_com_pulse_collections_LinkedList_ensure_field_6_done_commit:
    mov qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail], r12
    mov dword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_com_pulse_collections_LinkedList], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_com_pulse_collections_LinkedList_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_com_pulse_collections_LinkedList_ensure_alloc_fail:
pulsec_fcap_com_pulse_collections_LinkedList_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_com_pulse_collections_LinkedList_ensure endp

pulsec_com_pulse_collections_LinkedList_LinkedList proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov ecx, 7
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov ecx, eax
    call pulsec_fcap_com_pulse_collections_LinkedList_ensure
    mov rax, qword ptr [rsp+104]
    mov ecx, eax
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_collections_LinkedList_LinkedList_b0:
    call pulsec_rt_listNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue
pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue:
pulsec_com_pulse_collections_LinkedList_LinkedList_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_LinkedList endp

pulsec_com_pulse_collections_LinkedList_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_collections_LinkedList_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listSize
    jmp pulsec_com_pulse_collections_LinkedList_size_epilogue
pulsec_com_pulse_collections_LinkedList_size_epilogue:
pulsec_com_pulse_collections_LinkedList_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_size endp

pulsec_com_pulse_collections_LinkedList_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_collections_LinkedList_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_listClear
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov dword ptr [r10+rdx*4], eax
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_clear_epilogue
pulsec_com_pulse_collections_LinkedList_clear_epilogue:
pulsec_com_pulse_collections_LinkedList_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_LinkedList_clear endp

pulsec_com_pulse_collections_LinkedList_add__int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_LinkedList_add__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_add__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b2
pulsec_com_pulse_collections_LinkedList_add__int_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b3
pulsec_com_pulse_collections_LinkedList_add__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_add__int_b3
pulsec_com_pulse_collections_LinkedList_add__int_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    call pulsec_rt_listAddInt
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_add__int_epilogue
pulsec_com_pulse_collections_LinkedList_add__int_epilogue:
pulsec_com_pulse_collections_LinkedList_add__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_add__int endp

pulsec_com_pulse_collections_LinkedList_add__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rdx
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_LinkedList_add__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+80], eax
    mov eax, 64
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_add__String_b1
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b2
pulsec_com_pulse_collections_LinkedList_add__String_b1:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b3
pulsec_com_pulse_collections_LinkedList_add__String_b2:
    jmp pulsec_com_pulse_collections_LinkedList_add__String_b3
pulsec_com_pulse_collections_LinkedList_add__String_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    call pulsec_rt_listAddString
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_add__String_epilogue
pulsec_com_pulse_collections_LinkedList_add__String_epilogue:
pulsec_com_pulse_collections_LinkedList_add__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_add__String endp

pulsec_com_pulse_collections_LinkedList_getInt__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_getInt__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_getInt__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_b2
pulsec_com_pulse_collections_LinkedList_getInt__int_b1:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
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
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_com_pulse_collections_LinkedList_getInt__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_b3
pulsec_com_pulse_collections_LinkedList_getInt__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetInt
    jmp pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue:
pulsec_com_pulse_collections_LinkedList_getInt__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_LinkedList_getInt__int endp

pulsec_com_pulse_collections_LinkedList_getString__int proc
    sub rsp, 168
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_getString__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_listSize
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    test eax, eax
    setne al
    test edx, edx
    setne dl
    or al, dl
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_getString__int_b1
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_b2
pulsec_com_pulse_collections_LinkedList_getString__int_b1:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
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
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_epilogue
pulsec_com_pulse_collections_LinkedList_getString__int_b2:
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_b3
pulsec_com_pulse_collections_LinkedList_getString__int_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_handle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    call pulsec_rt_listGetString
    jmp pulsec_com_pulse_collections_LinkedList_getString__int_epilogue
pulsec_com_pulse_collections_LinkedList_getString__int_epilogue:
pulsec_com_pulse_collections_LinkedList_getString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 168
    ret
pulsec_com_pulse_collections_LinkedList_getString__int endp

pulsec_com_pulse_collections_LinkedList_offer__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_offer__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_offer__int_epilogue
pulsec_com_pulse_collections_LinkedList_offer__int_epilogue:
pulsec_com_pulse_collections_LinkedList_offer__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_offer__int endp

pulsec_com_pulse_collections_LinkedList_poll proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_poll_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueTail]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_poll_b1
    jmp pulsec_com_pulse_collections_LinkedList_poll_b2
pulsec_com_pulse_collections_LinkedList_poll_b1:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_poll_epilogue
pulsec_com_pulse_collections_LinkedList_poll_b2:
    jmp pulsec_com_pulse_collections_LinkedList_poll_b3
pulsec_com_pulse_collections_LinkedList_poll_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_queueHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_collections_LinkedList_poll_epilogue
pulsec_com_pulse_collections_LinkedList_poll_epilogue:
pulsec_com_pulse_collections_LinkedList_poll_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_poll endp

pulsec_com_pulse_collections_LinkedList_isEmpty proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_collections_LinkedList_isEmpty_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue
pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue:
pulsec_com_pulse_collections_LinkedList_isEmpty_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_LinkedList_isEmpty endp

pulsec_com_pulse_collections_LinkedList_addFirst__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_addFirst__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov dword ptr [r10+rdx*4], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue
pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue:
pulsec_com_pulse_collections_LinkedList_addFirst__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_addFirst__int endp

pulsec_com_pulse_collections_LinkedList_addLast__int proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_addLast__int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue
pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue:
pulsec_com_pulse_collections_LinkedList_addLast__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_addLast__int endp

pulsec_com_pulse_collections_LinkedList_removeFirst proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+80], rcx
pulsec_com_pulse_collections_LinkedList_removeFirst_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_removeFirst_b1
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_b2
pulsec_com_pulse_collections_LinkedList_removeFirst_b1:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov eax, 0
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_com_pulse_collections_LinkedList_removeFirst_b2:
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_b3
pulsec_com_pulse_collections_LinkedList_removeFirst_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov dword ptr [rsp+72], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+72]
    jmp pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue:
pulsec_com_pulse_collections_LinkedList_removeFirst_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_removeFirst endp

pulsec_com_pulse_collections_LinkedList_removeLast proc
    sub rsp, 152
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+72], rcx
pulsec_com_pulse_collections_LinkedList_removeLast_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHead]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+80], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_com_pulse_collections_LinkedList_removeLast_b1
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_b2
pulsec_com_pulse_collections_LinkedList_removeLast_b1:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
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
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_epilogue
pulsec_com_pulse_collections_LinkedList_removeLast_b2:
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_b3
pulsec_com_pulse_collections_LinkedList_removeLast_b3:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov dword ptr [r10+rdx*4], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeTail]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_com_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_com_pulse_collections_LinkedList_dequeHandle]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_com_pulse_collections_LinkedList_removeLast_epilogue
pulsec_com_pulse_collections_LinkedList_removeLast_epilogue:
pulsec_com_pulse_collections_LinkedList_removeLast_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 152
    ret
pulsec_com_pulse_collections_LinkedList_removeLast endp

end
