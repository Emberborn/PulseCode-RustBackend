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

public pulsec_fld_pulse_collections_MapEntry_key
public pulsec_fld_pulse_collections_MapEntry_key_heap_owned
public pulsec_fld_pulse_collections_MapEntry_value
public pulsec_fld_pulse_collections_MapEntry_value_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_MapEntry dd 0
pulsec_fcap_pulse_collections_MapEntry dd 63
pulsec_fld_pulse_collections_MapEntry_key_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_MapEntry_key dq pulsec_fld_pulse_collections_MapEntry_key_tbl
pulsec_fld_pulse_collections_MapEntry_key_heap_owned dd 0
pulsec_fld_pulse_collections_MapEntry_value_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_MapEntry_value dq pulsec_fld_pulse_collections_MapEntry_value_tbl
pulsec_fld_pulse_collections_MapEntry_value_heap_owned dd 0
trace_m0 db "pulse.collections.MapEntry.MapEntry"
trace_m0_len equ 35
trace_m1 db "pulse.collections.MapEntry.getKey"
trace_m1_len equ 33
trace_m2 db "pulse.collections.MapEntry.getValue"
trace_m2_len equ 35

.code
pulsec_fcap_pulse_collections_MapEntry_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_MapEntry]
    jbe pulsec_fcap_pulse_collections_MapEntry_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_MapEntry]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_fail
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
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    xor esi, esi
pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_MapEntry_key_heap_owned], 0
    je pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_MapEntry_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_MapEntry_key], r12
    mov dword ptr [pulsec_fld_pulse_collections_MapEntry_key_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    xor esi, esi
pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_MapEntry_value_heap_owned], 0
    je pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_MapEntry_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_MapEntry_value], r12
    mov dword ptr [pulsec_fld_pulse_collections_MapEntry_value_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_MapEntry], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_MapEntry_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_MapEntry_ensure_alloc_fail:
pulsec_fcap_pulse_collections_MapEntry_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_MapEntry_ensure endp

pulsec_fcap_pulse_collections_MapEntry_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_MapEntry_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_MapEntry_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_MapEntry_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_MapEntry_arc_teardown_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_MapEntry_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_MapEntry_arc_teardown endp
pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_MapEntry_arc_scan_edges endp
pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_MapEntry_arc_invalidate_edges endp
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_ctor_reuse
    mov ecx, 19
    call pulsec_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_MapEntry_ensure
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_ctor_ready
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_epilogue
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_epilogue:
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_MapEntry_MapEntry__Object_Object endp

pulsec_pulse_collections_MapEntry_getKey proc
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
pulsec_pulse_collections_MapEntry_getKey_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_key]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_MapEntry_getKey_epilogue
pulsec_pulse_collections_MapEntry_getKey_epilogue:
pulsec_pulse_collections_MapEntry_getKey_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_MapEntry_getKey endp

pulsec_pulse_collections_MapEntry_getValue proc
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
pulsec_pulse_collections_MapEntry_getValue_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_MapEntry_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_MapEntry_getValue_epilogue
pulsec_pulse_collections_MapEntry_getValue_epilogue:
pulsec_pulse_collections_MapEntry_getValue_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_MapEntry_getValue endp

end
