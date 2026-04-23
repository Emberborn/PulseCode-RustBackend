option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn Sleep:proc
extrn SwitchToThread:proc
extrn GetCurrentThreadId:proc
extrn CreateThread:proc
extrn CreateMutexA:proc
extrn ReleaseMutex:proc
extrn CreateEventA:proc
extrn SetEvent:proc
extrn ResetEvent:proc
extrn CloseHandle:proc
extrn CreateSemaphoreA:proc
extrn ReleaseSemaphore:proc
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
extrn pulsec_pulse_lang_CharSequence_charAt__int:proc
extrn pulsec_pulse_lang_CharSequence_length:proc
extrn pulsec_pulse_lang_CharSequence_subSequence__int_int:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_indexOf__String:proc
extrn pulsec_pulse_lang_String_indexOf__String_int:proc
extrn pulsec_pulse_lang_String_lastIndexOf__String:proc
extrn pulsec_pulse_lang_String_lastIndexOf__String_int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_subSequence__int_int:proc
extrn pulsec_pulse_lang_String_substring__int:proc
extrn pulsec_pulse_lang_String_substring__int_int:proc
extrn pulsec_pulse_lang_String_valueOf__Object:proc
extrn pulsec_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_pulse_lang_String_valueOf__byte:proc
extrn pulsec_pulse_lang_String_valueOf__char:proc
extrn pulsec_pulse_lang_String_valueOf__charArr:proc
extrn pulsec_pulse_lang_String_valueOf__charArr_int_int:proc
extrn pulsec_pulse_lang_String_valueOf__double:proc
extrn pulsec_pulse_lang_String_valueOf__float:proc
extrn pulsec_pulse_lang_String_valueOf__int:proc
extrn pulsec_pulse_lang_String_valueOf__long:proc
extrn pulsec_pulse_lang_String_valueOf__short:proc
extrn pulsec_pulse_lang_String_valueOf__ubyte:proc
extrn pulsec_pulse_lang_String_valueOf__uint:proc
extrn pulsec_pulse_lang_String_valueOf__ulong:proc
extrn pulsec_pulse_lang_String_valueOf__ushort:proc
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

public pulsec_fld_pulse_lang_StringBuilder_value
public pulsec_fld_pulse_lang_StringBuilder_value_heap_owned

.data
written dq 0
pulsec_objc_pulse_lang_StringBuilder dd 0
pulsec_fcap_pulse_lang_StringBuilder dd 63
pulsec_fld_pulse_lang_StringBuilder_value_tbl dq 64 dup(0)
pulsec_fld_pulse_lang_StringBuilder_value dq pulsec_fld_pulse_lang_StringBuilder_value_tbl
pulsec_fld_pulse_lang_StringBuilder_value_heap_owned dd 0
trace_m0 db "pulse.lang.StringBuilder.StringBuilder"
trace_m0_len equ 38
trace_m1 db "pulse.lang.StringBuilder.StringBuilder"
trace_m1_len equ 38
trace_m2 db "pulse.lang.StringBuilder.append"
trace_m2_len equ 31
trace_m3 db "pulse.lang.StringBuilder.append"
trace_m3_len equ 31
trace_m4 db "pulse.lang.StringBuilder.append"
trace_m4_len equ 31
trace_m5 db "pulse.lang.StringBuilder.append"
trace_m5_len equ 31
trace_m6 db "pulse.lang.StringBuilder.append"
trace_m6_len equ 31
trace_m7 db "pulse.lang.StringBuilder.append"
trace_m7_len equ 31
trace_m8 db "pulse.lang.StringBuilder.append"
trace_m8_len equ 31
trace_m9 db "pulse.lang.StringBuilder.append"
trace_m9_len equ 31
trace_m10 db "pulse.lang.StringBuilder.append"
trace_m10_len equ 31
trace_m11 db "pulse.lang.StringBuilder.append"
trace_m11_len equ 31
trace_m12 db "pulse.lang.StringBuilder.append"
trace_m12_len equ 31
trace_m13 db "pulse.lang.StringBuilder.append"
trace_m13_len equ 31
trace_m14 db "pulse.lang.StringBuilder.append"
trace_m14_len equ 31
trace_m15 db "pulse.lang.StringBuilder.append"
trace_m15_len equ 31
trace_m16 db "pulse.lang.StringBuilder.append"
trace_m16_len equ 31
trace_m17 db "pulse.lang.StringBuilder.append"
trace_m17_len equ 31
trace_m18 db "pulse.lang.StringBuilder.append"
trace_m18_len equ 31
trace_m19 db "pulse.lang.StringBuilder.appendLine"
trace_m19_len equ 35
trace_m20 db "pulse.lang.StringBuilder.appendLine"
trace_m20_len equ 35
trace_m21 db "pulse.lang.StringBuilder.appendLine"
trace_m21_len equ 35
trace_m22 db "pulse.lang.StringBuilder.appendLine"
trace_m22_len equ 35
trace_m23 db "pulse.lang.StringBuilder.appendLine"
trace_m23_len equ 35
trace_m24 db "pulse.lang.StringBuilder.appendLine"
trace_m24_len equ 35
trace_m25 db "pulse.lang.StringBuilder.appendLine"
trace_m25_len equ 35
trace_m26 db "pulse.lang.StringBuilder.appendLine"
trace_m26_len equ 35
trace_m27 db "pulse.lang.StringBuilder.appendLine"
trace_m27_len equ 35
trace_m28 db "pulse.lang.StringBuilder.appendLine"
trace_m28_len equ 35
trace_m29 db "pulse.lang.StringBuilder.appendLine"
trace_m29_len equ 35
trace_m30 db "pulse.lang.StringBuilder.appendLine"
trace_m30_len equ 35
trace_m31 db "pulse.lang.StringBuilder.appendLine"
trace_m31_len equ 35
trace_m32 db "pulse.lang.StringBuilder.appendLine"
trace_m32_len equ 35
trace_m33 db "pulse.lang.StringBuilder.appendLine"
trace_m33_len equ 35
trace_m34 db "pulse.lang.StringBuilder.appendLine"
trace_m34_len equ 35
trace_m35 db "pulse.lang.StringBuilder.append"
trace_m35_len equ 31
trace_m36 db "pulse.lang.StringBuilder.length"
trace_m36_len equ 31
trace_m37 db "pulse.lang.StringBuilder.isEmpty"
trace_m37_len equ 32
trace_m38 db "pulse.lang.StringBuilder.charAt"
trace_m38_len equ 31
trace_m39 db "pulse.lang.StringBuilder.subSequence"
trace_m39_len equ 36
trace_m40 db "pulse.lang.StringBuilder.contentEquals"
trace_m40_len equ 38
trace_m41 db "pulse.lang.StringBuilder.compareTo"
trace_m41_len equ 34
trace_m42 db "pulse.lang.StringBuilder.clear"
trace_m42_len equ 30
trace_m43 db "pulse.lang.StringBuilder.insert"
trace_m43_len equ 31
trace_m44 db "pulse.lang.StringBuilder.insert"
trace_m44_len equ 31
trace_m45 db "pulse.lang.StringBuilder.insert"
trace_m45_len equ 31
trace_m46 db "pulse.lang.StringBuilder.insert"
trace_m46_len equ 31
trace_m47 db "pulse.lang.StringBuilder.insert"
trace_m47_len equ 31
trace_m48 db "pulse.lang.StringBuilder.insert"
trace_m48_len equ 31
trace_m49 db "pulse.lang.StringBuilder.insert"
trace_m49_len equ 31
trace_m50 db "pulse.lang.StringBuilder.insert"
trace_m50_len equ 31
trace_m51 db "pulse.lang.StringBuilder.insert"
trace_m51_len equ 31
trace_m52 db "pulse.lang.StringBuilder.insert"
trace_m52_len equ 31
trace_m53 db "pulse.lang.StringBuilder.insert"
trace_m53_len equ 31
trace_m54 db "pulse.lang.StringBuilder.insert"
trace_m54_len equ 31
trace_m55 db "pulse.lang.StringBuilder.insert"
trace_m55_len equ 31
trace_m56 db "pulse.lang.StringBuilder.insert"
trace_m56_len equ 31
trace_m57 db "pulse.lang.StringBuilder.insert"
trace_m57_len equ 31
trace_m58 db "pulse.lang.StringBuilder.insert"
trace_m58_len equ 31
trace_m59 db "pulse.lang.StringBuilder.insert"
trace_m59_len equ 31
trace_m60 db "pulse.lang.StringBuilder.insert"
trace_m60_len equ 31
trace_m61 db "pulse.lang.StringBuilder.delete"
trace_m61_len equ 31
trace_m62 db "pulse.lang.StringBuilder.deleteCharAt"
trace_m62_len equ 37
trace_m63 db "pulse.lang.StringBuilder.replace"
trace_m63_len equ 32
trace_m64 db "pulse.lang.StringBuilder.setCharAt"
trace_m64_len equ 34
trace_m65 db "pulse.lang.StringBuilder.setLength"
trace_m65_len equ 34
trace_m66 db "pulse.lang.StringBuilder.substring"
trace_m66_len equ 34
trace_m67 db "pulse.lang.StringBuilder.substring"
trace_m67_len equ 34
trace_m68 db "pulse.lang.StringBuilder.indexOf"
trace_m68_len equ 32
trace_m69 db "pulse.lang.StringBuilder.indexOf"
trace_m69_len equ 32
trace_m70 db "pulse.lang.StringBuilder.lastIndexOf"
trace_m70_len equ 36
trace_m71 db "pulse.lang.StringBuilder.lastIndexOf"
trace_m71_len equ 36
trace_m72 db "pulse.lang.StringBuilder.reverse"
trace_m72_len equ 32
trace_m73 db "pulse.lang.StringBuilder.toString"
trace_m73_len equ 33
msg0 db 0
msg0_len equ 0
msg1 db "null"
msg1_len equ 4
msg2 db "null"
msg2_len equ 4
msg3 db "null"
msg3_len equ 4
msg4 db "null"
msg4_len equ 4
msg5 db "null"
msg5_len equ 4
msg6 db 0
msg6_len equ 0
msg7 db "null"
msg7_len equ 4
msg8 db "null"
msg8_len equ 4
msg9 db "null"
msg9_len equ 4
msg10 db "null"
msg10_len equ 4
msg11 db "null"
msg11_len equ 4
msg12 db 0
msg12_len equ 0

.code
pulsec_fcap_pulse_lang_StringBuilder_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_lang_StringBuilder]
    jbe pulsec_fcap_pulse_lang_StringBuilder_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_lang_StringBuilder]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_lang_StringBuilder_ensure_fail
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
    jz pulsec_fcap_pulse_lang_StringBuilder_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    xor esi, esi
pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_lang_StringBuilder_value_heap_owned], 0
    je pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_lang_StringBuilder_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_lang_StringBuilder_value], r12
    mov dword ptr [pulsec_fld_pulse_lang_StringBuilder_value_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_lang_StringBuilder], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_lang_StringBuilder_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_StringBuilder_ensure_alloc_fail:
pulsec_fcap_pulse_lang_StringBuilder_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_StringBuilder_ensure endp

pulsec_fcap_pulse_lang_StringBuilder_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_StringBuilder_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_lang_StringBuilder_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_lang_StringBuilder_arc_teardown_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_StringBuilder_arc_teardown_done:
    ret
pulsec_fcap_pulse_lang_StringBuilder_arc_teardown endp
pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_lang_StringBuilder_arc_scan_edges endp
pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_field_0_skip:
    add rsp, 40
pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_lang_StringBuilder_arc_invalidate_edges endp
pulsec_pulse_lang_StringBuilder_StringBuilder proc
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
    jne pulsec_pulse_lang_StringBuilder_StringBuilder_ctor_reuse
    mov ecx, 21
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_lang_StringBuilder_StringBuilder_ctor_ready
pulsec_pulse_lang_StringBuilder_StringBuilder_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_StringBuilder_StringBuilder_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_StringBuilder_StringBuilder_b0:
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
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_StringBuilder_StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_StringBuilder_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_StringBuilder_StringBuilder_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_StringBuilder_StringBuilder endp

pulsec_pulse_lang_StringBuilder_StringBuilder__String proc
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
    mov qword ptr [rsp+72], rdx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_lang_StringBuilder_StringBuilder__String_ctor_reuse
    mov ecx, 21
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_StringBuilder_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_StringBuilder_StringBuilder__String_ctor_ready
pulsec_pulse_lang_StringBuilder_StringBuilder__String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_StringBuilder_StringBuilder__String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_StringBuilder_StringBuilder__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_StringBuilder_StringBuilder__String_epilogue
pulsec_pulse_lang_StringBuilder_StringBuilder__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_StringBuilder__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_StringBuilder_StringBuilder__String endp

pulsec_pulse_lang_StringBuilder_append__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_append__String_b1
    jmp pulsec_pulse_lang_StringBuilder_append__String_b2
pulsec_pulse_lang_StringBuilder_append__String_b1:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__String_epilogue
pulsec_pulse_lang_StringBuilder_append__String_b2:
    jmp pulsec_pulse_lang_StringBuilder_append__String_b3
pulsec_pulse_lang_StringBuilder_append__String_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__String_epilogue
pulsec_pulse_lang_StringBuilder_append__String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_append__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_append__String endp

pulsec_pulse_lang_StringBuilder_append__CharSequence proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__CharSequence_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_append__CharSequence_b1
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_b2
pulsec_pulse_lang_StringBuilder_append__CharSequence_b1:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_append__CharSequence_b2:
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_b3
pulsec_pulse_lang_StringBuilder_append__CharSequence_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov eax, 0
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    test rcx, rcx
    je StringBuilder_append_vd3_21_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_append_vd3_21_type
    cmp eax, 20
    je StringBuilder_append_vd3_21_assign_ok
    cmp eax, 21
    je StringBuilder_append_vd3_21_assign_ok
    jmp StringBuilder_append_vd3_21_type
StringBuilder_append_vd3_21_assign_ok:
    cmp eax, 20
    je StringBuilder_append_vd3_21_ovr0
    cmp eax, 21
    je StringBuilder_append_vd3_21_ovr1
    jmp StringBuilder_append_vd3_21_default
StringBuilder_append_vd3_21_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_length
    jmp StringBuilder_append_vd3_21_done
StringBuilder_append_vd3_21_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_append_vd3_21_done
StringBuilder_append_vd3_21_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_length
    jmp StringBuilder_append_vd3_21_done
StringBuilder_append_vd3_21_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_append_vd3_21_done
StringBuilder_append_vd3_21_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_append_vd3_21_done:
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je StringBuilder_append_vd3_22_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_append_vd3_22_type
    cmp eax, 20
    je StringBuilder_append_vd3_22_assign_ok
    cmp eax, 21
    je StringBuilder_append_vd3_22_assign_ok
    jmp StringBuilder_append_vd3_22_type
StringBuilder_append_vd3_22_assign_ok:
    cmp eax, 20
    je StringBuilder_append_vd3_22_ovr0
    cmp eax, 21
    je StringBuilder_append_vd3_22_ovr1
    jmp StringBuilder_append_vd3_22_default
StringBuilder_append_vd3_22_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_subSequence__int_int
    jmp StringBuilder_append_vd3_22_done
StringBuilder_append_vd3_22_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_subSequence__int_int
    jmp StringBuilder_append_vd3_22_done
StringBuilder_append_vd3_22_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_subSequence__int_int
    jmp StringBuilder_append_vd3_22_done
StringBuilder_append_vd3_22_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_append_vd3_22_done
StringBuilder_append_vd3_22_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_append_vd3_22_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_append__CharSequence_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_append__CharSequence_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 328
    ret
pulsec_pulse_lang_StringBuilder_append__CharSequence endp

pulsec_pulse_lang_StringBuilder_append__charArr proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__charArr_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_append__charArr_b1
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_b2
pulsec_pulse_lang_StringBuilder_append__charArr_b1:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_epilogue
pulsec_pulse_lang_StringBuilder_append__charArr_b2:
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_b3
pulsec_pulse_lang_StringBuilder_append__charArr_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__charArr
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_epilogue
pulsec_pulse_lang_StringBuilder_append__charArr_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_append__charArr_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_append__charArr endp

pulsec_pulse_lang_StringBuilder_append__charArr_int_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
    mov dword ptr [rsp+88], r9d
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b1
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b2
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b1:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_append_vd1_12_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp StringBuilder_append_vd1_12_done
StringBuilder_append_vd1_12_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_append_vd1_12_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_int_int_epilogue
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b2:
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b3
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    mov r8d, eax
    call pulsec_pulse_lang_String_valueOf__charArr_int_int
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__charArr_int_int_epilogue
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_append__charArr_int_int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_lang_StringBuilder_append__charArr_int_int endp

pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
    mov dword ptr [rsp+88], r9d
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b1
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b2
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b1:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_append_vd1_10_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp StringBuilder_append_vd1_10_done
StringBuilder_append_vd1_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_append_vd1_10_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_epilogue
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b2:
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b3
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rcx, qword ptr [rsp+192]
    test rcx, rcx
    je StringBuilder_append_vd2_20_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_append_vd2_20_type
    cmp eax, 20
    je StringBuilder_append_vd2_20_assign_ok
    cmp eax, 21
    je StringBuilder_append_vd2_20_assign_ok
    jmp StringBuilder_append_vd2_20_type
StringBuilder_append_vd2_20_assign_ok:
    cmp eax, 20
    je StringBuilder_append_vd2_20_ovr0
    cmp eax, 21
    je StringBuilder_append_vd2_20_ovr1
    jmp StringBuilder_append_vd2_20_default
StringBuilder_append_vd2_20_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_subSequence__int_int
    jmp StringBuilder_append_vd2_20_done
StringBuilder_append_vd2_20_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_subSequence__int_int
    jmp StringBuilder_append_vd2_20_done
StringBuilder_append_vd2_20_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_subSequence__int_int
    jmp StringBuilder_append_vd2_20_done
StringBuilder_append_vd2_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_append_vd2_20_done
StringBuilder_append_vd2_20_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_append_vd2_20_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_epilogue
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_lang_StringBuilder_append__CharSequence_int_int endp

pulsec_pulse_lang_StringBuilder_append__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__int_epilogue
pulsec_pulse_lang_StringBuilder_append__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__int endp

pulsec_pulse_lang_StringBuilder_append__byte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__byte_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__byte
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__byte_epilogue
pulsec_pulse_lang_StringBuilder_append__byte_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__byte_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__byte endp

pulsec_pulse_lang_StringBuilder_append__short proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__short_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__short
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__short_epilogue
pulsec_pulse_lang_StringBuilder_append__short_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__short_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__short endp

pulsec_pulse_lang_StringBuilder_append__boolean proc
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__boolean_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__boolean_epilogue
pulsec_pulse_lang_StringBuilder_append__boolean_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__boolean_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__boolean endp

pulsec_pulse_lang_StringBuilder_append__char proc
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__char_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__char_epilogue
pulsec_pulse_lang_StringBuilder_append__char_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__char_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__char endp

pulsec_pulse_lang_StringBuilder_append__float proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__float_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__float
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__float_epilogue
pulsec_pulse_lang_StringBuilder_append__float_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__float_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__float endp

pulsec_pulse_lang_StringBuilder_append__double proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__double_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__double
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__double_epilogue
pulsec_pulse_lang_StringBuilder_append__double_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__double_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__double endp

pulsec_pulse_lang_StringBuilder_append__long proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__long_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__long_epilogue
pulsec_pulse_lang_StringBuilder_append__long_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__long endp

pulsec_pulse_lang_StringBuilder_append__ubyte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__ubyte_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ubyte
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__ubyte_epilogue
pulsec_pulse_lang_StringBuilder_append__ubyte_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__ubyte_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__ubyte endp

pulsec_pulse_lang_StringBuilder_append__ushort proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__ushort_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ushort
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__ushort_epilogue
pulsec_pulse_lang_StringBuilder_append__ushort_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__ushort_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__ushort endp

pulsec_pulse_lang_StringBuilder_append__uint proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_append__uint_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__uint
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__uint_epilogue
pulsec_pulse_lang_StringBuilder_append__uint_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__uint_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__uint endp

pulsec_pulse_lang_StringBuilder_append__ulong proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__ulong_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__ulong
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__ulong_epilogue
pulsec_pulse_lang_StringBuilder_append__ulong_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__ulong_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__ulong endp

pulsec_pulse_lang_StringBuilder_appendLine__String proc
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
pulsec_pulse_lang_StringBuilder_appendLine__String_b0:
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
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__String
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__String_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__String endp

pulsec_pulse_lang_StringBuilder_appendLine__CharSequence proc
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
pulsec_pulse_lang_StringBuilder_appendLine__CharSequence_b0:
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
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__CharSequence
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__CharSequence_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__CharSequence_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__CharSequence endp

pulsec_pulse_lang_StringBuilder_appendLine__charArr proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__charArr_b0:
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
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__charArr
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__charArr_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__charArr_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__charArr_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__charArr endp

pulsec_pulse_lang_StringBuilder_appendLine__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__int
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__int_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__int endp

pulsec_pulse_lang_StringBuilder_appendLine__byte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__byte_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__byte
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__byte_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__byte_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__byte_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__byte endp

pulsec_pulse_lang_StringBuilder_appendLine__short proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__short_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__short
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__short_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__short_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__short_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__short endp

pulsec_pulse_lang_StringBuilder_appendLine__boolean proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__boolean_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__boolean
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__boolean_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__boolean_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__boolean_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__boolean endp

pulsec_pulse_lang_StringBuilder_appendLine__char proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__char_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__char_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__char_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__char endp

pulsec_pulse_lang_StringBuilder_appendLine__float proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__float_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__float
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__float_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__float_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__float_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__float endp

pulsec_pulse_lang_StringBuilder_appendLine__double proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__double_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__double
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__double_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__double_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__double_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__double endp

pulsec_pulse_lang_StringBuilder_appendLine__long proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__long_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__long
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__long_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__long_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__long endp

pulsec_pulse_lang_StringBuilder_appendLine__ubyte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__ubyte_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__ubyte
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__ubyte_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__ubyte_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__ubyte_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__ubyte endp

pulsec_pulse_lang_StringBuilder_appendLine__ushort proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__ushort_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__ushort
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__ushort_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__ushort_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__ushort_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__ushort endp

pulsec_pulse_lang_StringBuilder_appendLine__uint proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_appendLine__uint_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__uint
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__uint_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__uint_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__uint_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__uint endp

pulsec_pulse_lang_StringBuilder_appendLine__ulong proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__ulong_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__ulong
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__ulong_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__ulong_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__ulong_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__ulong endp

pulsec_pulse_lang_StringBuilder_appendLine__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_appendLine__Object_b0:
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
    je StringBuilder_appendLine_vd0_3_null
    call pulsec_pulse_lang_StringBuilder_append__Object
    jmp StringBuilder_appendLine_vd0_3_done
StringBuilder_appendLine_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_3_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov eax, 10
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je StringBuilder_appendLine_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_append__char
    jmp StringBuilder_appendLine_vd0_6_done
StringBuilder_appendLine_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_appendLine_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_appendLine__Object_epilogue
pulsec_pulse_lang_StringBuilder_appendLine__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_appendLine__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_appendLine__Object endp

pulsec_pulse_lang_StringBuilder_append__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_append__Object_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__Object
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
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_append__Object_epilogue
pulsec_pulse_lang_StringBuilder_append__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_append__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_append__Object endp

pulsec_pulse_lang_StringBuilder_length proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_StringBuilder_length_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    jmp pulsec_pulse_lang_StringBuilder_length_epilogue
pulsec_pulse_lang_StringBuilder_length_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_StringBuilder_length_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_StringBuilder_length endp

pulsec_pulse_lang_StringBuilder_isEmpty proc
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
pulsec_pulse_lang_StringBuilder_isEmpty_b0:
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_isEmpty_vd0_2_null
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_isEmpty_vd0_2_done
StringBuilder_isEmpty_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_isEmpty_vd0_2_done:
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_StringBuilder_isEmpty_epilogue
pulsec_pulse_lang_StringBuilder_isEmpty_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_isEmpty_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_isEmpty endp

pulsec_pulse_lang_StringBuilder_charAt__int proc
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
pulsec_pulse_lang_StringBuilder_charAt__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    jmp pulsec_pulse_lang_StringBuilder_charAt__int_epilogue
pulsec_pulse_lang_StringBuilder_charAt__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_charAt__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_charAt__int endp

pulsec_pulse_lang_StringBuilder_subSequence__int_int proc
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
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_subSequence__int_int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_StringBuilder_subSequence__int_int_epilogue
pulsec_pulse_lang_StringBuilder_subSequence__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_subSequence__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_subSequence__int_int endp

pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b1
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b2
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b2:
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b3
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b3:
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je StringBuilder_contentEquals_vd2_6_null
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_contentEquals_vd2_6_done
StringBuilder_contentEquals_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_contentEquals_vd2_6_done:
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je StringBuilder_contentEquals_vd3_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_contentEquals_vd3_10_type
    cmp eax, 20
    je StringBuilder_contentEquals_vd3_10_assign_ok
    cmp eax, 21
    je StringBuilder_contentEquals_vd3_10_assign_ok
    jmp StringBuilder_contentEquals_vd3_10_type
StringBuilder_contentEquals_vd3_10_assign_ok:
    cmp eax, 20
    je StringBuilder_contentEquals_vd3_10_ovr0
    cmp eax, 21
    je StringBuilder_contentEquals_vd3_10_ovr1
    jmp StringBuilder_contentEquals_vd3_10_default
StringBuilder_contentEquals_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_length
    jmp StringBuilder_contentEquals_vd3_10_done
StringBuilder_contentEquals_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_contentEquals_vd3_10_done
StringBuilder_contentEquals_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_length
    jmp StringBuilder_contentEquals_vd3_10_done
StringBuilder_contentEquals_vd3_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_contentEquals_vd3_10_done
StringBuilder_contentEquals_vd3_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_contentEquals_vd3_10_done:
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b4
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b5
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b5:
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b6
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b7
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b8
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b9
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b8:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    test rcx, rcx
    je StringBuilder_contentEquals_vd7_20_null
    call pulsec_pulse_lang_StringBuilder_charAt__int
    jmp StringBuilder_contentEquals_vd7_20_done
StringBuilder_contentEquals_vd7_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_contentEquals_vd7_20_done:
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je StringBuilder_contentEquals_vd7_24_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_contentEquals_vd7_24_type
    cmp eax, 20
    je StringBuilder_contentEquals_vd7_24_assign_ok
    cmp eax, 21
    je StringBuilder_contentEquals_vd7_24_assign_ok
    jmp StringBuilder_contentEquals_vd7_24_type
StringBuilder_contentEquals_vd7_24_assign_ok:
    cmp eax, 20
    je StringBuilder_contentEquals_vd7_24_ovr0
    cmp eax, 21
    je StringBuilder_contentEquals_vd7_24_ovr1
    jmp StringBuilder_contentEquals_vd7_24_default
StringBuilder_contentEquals_vd7_24_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_charAt__int
    jmp StringBuilder_contentEquals_vd7_24_done
StringBuilder_contentEquals_vd7_24_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_charAt__int
    jmp StringBuilder_contentEquals_vd7_24_done
StringBuilder_contentEquals_vd7_24_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_charAt__int
    jmp StringBuilder_contentEquals_vd7_24_done
StringBuilder_contentEquals_vd7_24_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_contentEquals_vd7_24_done
StringBuilder_contentEquals_vd7_24_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_contentEquals_vd7_24_done:
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b10
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b11
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b9:
    mov eax, 1
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b11:
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b12
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b12:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_b7
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_contentEquals__CharSequence endp

pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b0:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b1
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b2
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b1:
    mov eax, 1
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b2:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b3
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b3:
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je StringBuilder_compareTo_vd2_6_null
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_compareTo_vd2_6_done
StringBuilder_compareTo_vd2_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_compareTo_vd2_6_done:
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+240], rax
    mov rcx, qword ptr [rsp+240]
    test rcx, rcx
    je StringBuilder_compareTo_vd3_9_null
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_compareTo_vd3_9_done
StringBuilder_compareTo_vd3_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_compareTo_vd3_9_done:
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b4
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b5
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b4:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b6
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b5:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b6
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b6:
    mov eax, 0
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b7
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b7:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b8
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b9
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b8:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je StringBuilder_compareTo_vd9_23_null
    call pulsec_pulse_lang_StringBuilder_charAt__int
    jmp StringBuilder_compareTo_vd9_23_done
StringBuilder_compareTo_vd9_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_compareTo_vd9_23_done:
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+240]
    test rcx, rcx
    je StringBuilder_compareTo_vd10_27_null
    call pulsec_pulse_lang_StringBuilder_charAt__int
    jmp StringBuilder_compareTo_vd10_27_done
StringBuilder_compareTo_vd10_27_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_compareTo_vd10_27_done:
    movzx eax, ax
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b10
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b11
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b16
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b17
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b10:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b11:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b12
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b12:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b13
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b14
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b13:
    mov eax, 1
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b14:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b15
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b15:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+168], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b7
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b16:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b17:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b18
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b18:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b19
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b20
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b19:
    mov eax, 1
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b20:
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b21
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_b21:
    mov eax, 0
    jmp pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue:
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder_epilogue_post:
    mov qword ptr [rsp+232], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+232]
    add rsp, 360
    ret
pulsec_pulse_lang_StringBuilder_compareTo__StringBuilder endp

pulsec_pulse_lang_StringBuilder_clear proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_StringBuilder_clear_b0:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_pulse_lang_StringBuilder_clear_epilogue
pulsec_pulse_lang_StringBuilder_clear_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_StringBuilder_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_StringBuilder_clear endp

pulsec_pulse_lang_StringBuilder_insert__int_String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_StringBuilder_insert__int_String_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_insert__int_String_b1
    jmp pulsec_pulse_lang_StringBuilder_insert__int_String_b2
pulsec_pulse_lang_StringBuilder_insert__int_String_b1:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+96], rax
    jmp pulsec_pulse_lang_StringBuilder_insert__int_String_b3
pulsec_pulse_lang_StringBuilder_insert__int_String_b2:
    jmp pulsec_pulse_lang_StringBuilder_insert__int_String_b3
pulsec_pulse_lang_StringBuilder_insert__int_String_b3:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, 0
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_insert__int_String_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_insert__int_String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_insert__int_String endp

pulsec_pulse_lang_StringBuilder_insert__int_CharSequence proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b1
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b2
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd1_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd1_7_done
StringBuilder_insert_vd1_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd1_7_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b2:
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b3
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_b3:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov eax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rcx, qword ptr [rsp+224]
    test rcx, rcx
    je StringBuilder_insert_vd2_16_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_insert_vd2_16_type
    cmp eax, 20
    je StringBuilder_insert_vd2_16_assign_ok
    cmp eax, 21
    je StringBuilder_insert_vd2_16_assign_ok
    jmp StringBuilder_insert_vd2_16_type
StringBuilder_insert_vd2_16_assign_ok:
    cmp eax, 20
    je StringBuilder_insert_vd2_16_ovr0
    cmp eax, 21
    je StringBuilder_insert_vd2_16_ovr1
    jmp StringBuilder_insert_vd2_16_default
StringBuilder_insert_vd2_16_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_length
    jmp StringBuilder_insert_vd2_16_done
StringBuilder_insert_vd2_16_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_length
    jmp StringBuilder_insert_vd2_16_done
StringBuilder_insert_vd2_16_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_length
    jmp StringBuilder_insert_vd2_16_done
StringBuilder_insert_vd2_16_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_insert_vd2_16_done
StringBuilder_insert_vd2_16_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_insert_vd2_16_done:
    movsxd rax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je StringBuilder_insert_vd2_17_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_insert_vd2_17_type
    cmp eax, 20
    je StringBuilder_insert_vd2_17_assign_ok
    cmp eax, 21
    je StringBuilder_insert_vd2_17_assign_ok
    jmp StringBuilder_insert_vd2_17_type
StringBuilder_insert_vd2_17_assign_ok:
    cmp eax, 20
    je StringBuilder_insert_vd2_17_ovr0
    cmp eax, 21
    je StringBuilder_insert_vd2_17_ovr1
    jmp StringBuilder_insert_vd2_17_default
StringBuilder_insert_vd2_17_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_subSequence__int_int
    jmp StringBuilder_insert_vd2_17_done
StringBuilder_insert_vd2_17_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_subSequence__int_int
    jmp StringBuilder_insert_vd2_17_done
StringBuilder_insert_vd2_17_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_subSequence__int_int
    jmp StringBuilder_insert_vd2_17_done
StringBuilder_insert_vd2_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_insert_vd2_17_done
StringBuilder_insert_vd2_17_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_insert_vd2_17_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd2_18_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd2_18_done
StringBuilder_insert_vd2_18_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd2_18_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 344
    ret
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence endp

pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
    mov dword ptr [rsp+88], r9d
    mov eax, dword ptr [rsp+352]
    mov dword ptr [rsp+96], eax
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b1
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b2
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rax, qword ptr [rsp+120]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd1_11_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd1_11_done
StringBuilder_insert_vd1_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd1_11_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b2:
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b3
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_b3:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+248], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+200]
    test rcx, rcx
    je StringBuilder_insert_vd2_19_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz StringBuilder_insert_vd2_19_type
    cmp eax, 20
    je StringBuilder_insert_vd2_19_assign_ok
    cmp eax, 21
    je StringBuilder_insert_vd2_19_assign_ok
    jmp StringBuilder_insert_vd2_19_type
StringBuilder_insert_vd2_19_assign_ok:
    cmp eax, 20
    je StringBuilder_insert_vd2_19_ovr0
    cmp eax, 21
    je StringBuilder_insert_vd2_19_ovr1
    jmp StringBuilder_insert_vd2_19_default
StringBuilder_insert_vd2_19_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_subSequence__int_int
    jmp StringBuilder_insert_vd2_19_done
StringBuilder_insert_vd2_19_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_subSequence__int_int
    jmp StringBuilder_insert_vd2_19_done
StringBuilder_insert_vd2_19_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_subSequence__int_int
    jmp StringBuilder_insert_vd2_19_done
StringBuilder_insert_vd2_19_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp StringBuilder_insert_vd2_19_done
StringBuilder_insert_vd2_19_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
StringBuilder_insert_vd2_19_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rax, qword ptr [rsp+120]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd2_20_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd2_20_done
StringBuilder_insert_vd2_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd2_20_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_lang_StringBuilder_insert__int_CharSequence_int_int endp

pulsec_pulse_lang_StringBuilder_insert__int_charArr proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_charArr_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_insert__int_charArr_b1
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_b2
pulsec_pulse_lang_StringBuilder_insert__int_charArr_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd1_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd1_7_done
StringBuilder_insert_vd1_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd1_7_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_charArr_b2:
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_b3
pulsec_pulse_lang_StringBuilder_insert__int_charArr_b3:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__charArr
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd2_15_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd2_15_done
StringBuilder_insert_vd2_15_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd2_15_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_charArr_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_StringBuilder_insert__int_charArr_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_charArr endp

pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
    mov dword ptr [rsp+88], r9d
    mov eax, dword ptr [rsp+368]
    mov dword ptr [rsp+96], eax
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b1
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b2
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b1:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    mov r8d, eax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov rax, qword ptr [rsp+128]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd1_13_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd1_13_done
StringBuilder_insert_vd1_13_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd1_13_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b2:
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b3
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_b3:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+264], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+160]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    mov r8d, eax
    call pulsec_pulse_lang_String_valueOf__charArr_int_int
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov rax, qword ptr [rsp+128]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd2_23_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd2_23_done
StringBuilder_insert_vd2_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd2_23_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_lang_StringBuilder_insert__int_charArr_int_int endp

pulsec_pulse_lang_StringBuilder_insert__int_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_Object_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_Object_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_Object endp

pulsec_pulse_lang_StringBuilder_insert__int_boolean proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_boolean_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__boolean
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_boolean_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_boolean_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_boolean_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_boolean endp

pulsec_pulse_lang_StringBuilder_insert__int_char proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_char_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_char_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_char_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_char endp

pulsec_pulse_lang_StringBuilder_insert__int_int proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_int_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_int endp

pulsec_pulse_lang_StringBuilder_insert__int_byte proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_byte_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__byte
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_byte_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_byte_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_byte_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_byte endp

pulsec_pulse_lang_StringBuilder_insert__int_short proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_short_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__short
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_short_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_short_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_short_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_short endp

pulsec_pulse_lang_StringBuilder_insert__int_long proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_long_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_long_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_long_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_long endp

pulsec_pulse_lang_StringBuilder_insert__int_ubyte proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_ubyte_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ubyte
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_ubyte_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_ubyte_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_ubyte_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_ubyte endp

pulsec_pulse_lang_StringBuilder_insert__int_ushort proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_ushort_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ushort
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_ushort_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_ushort_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_ushort_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_ushort endp

pulsec_pulse_lang_StringBuilder_insert__int_uint proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_insert__int_uint_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__uint
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_uint_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_uint_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_uint_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_uint endp

pulsec_pulse_lang_StringBuilder_insert__int_ulong proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_ulong_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__ulong
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_ulong_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_ulong_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_ulong_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_ulong endp

pulsec_pulse_lang_StringBuilder_insert__int_float proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_float_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__float
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_float_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_float_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_float_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_float endp

pulsec_pulse_lang_StringBuilder_insert__int_double proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_lang_StringBuilder_insert__int_double_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__double
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_insert_vd0_7_null
    call pulsec_pulse_lang_StringBuilder_insert__int_String
    jmp StringBuilder_insert_vd0_7_done
StringBuilder_insert_vd0_7_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_insert_vd0_7_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_insert__int_double_epilogue
pulsec_pulse_lang_StringBuilder_insert__int_double_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_insert__int_double_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_insert__int_double endp

pulsec_pulse_lang_StringBuilder_delete__int_int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_StringBuilder_delete__int_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_delete__int_int_epilogue
pulsec_pulse_lang_StringBuilder_delete__int_int_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_lang_StringBuilder_delete__int_int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_lang_StringBuilder_delete__int_int endp

pulsec_pulse_lang_StringBuilder_deleteCharAt__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_StringBuilder_deleteCharAt__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    add eax, edx
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
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je StringBuilder_deleteCharAt_vd0_6_null
    call pulsec_pulse_lang_StringBuilder_delete__int_int
    jmp StringBuilder_deleteCharAt_vd0_6_done
StringBuilder_deleteCharAt_vd0_6_null:
    call pulsec_rt_dispatchNullReceiverPanic
StringBuilder_deleteCharAt_vd0_6_done:
    jmp pulsec_pulse_lang_StringBuilder_deleteCharAt__int_epilogue
pulsec_pulse_lang_StringBuilder_deleteCharAt__int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_deleteCharAt__int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_deleteCharAt__int endp

pulsec_pulse_lang_StringBuilder_replace__int_int_String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+104], r9
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_StringBuilder_replace__int_int_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, 0
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_replace__int_int_String_epilogue
pulsec_pulse_lang_StringBuilder_replace__int_int_String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_replace__int_int_String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_lang_StringBuilder_replace__int_int_String endp

pulsec_pulse_lang_StringBuilder_setCharAt__int_char proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_setCharAt__int_char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    mov rax, qword ptr [rsp+112]
    mov r9, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je pulsec_pulse_lang_StringBuilder_setCharAt__int_char_vd_stmt_0_0_0_null
    call pulsec_pulse_lang_StringBuilder_replace__int_int_String
    jmp pulsec_pulse_lang_StringBuilder_setCharAt__int_char_vd_stmt_0_0_0_done
pulsec_pulse_lang_StringBuilder_setCharAt__int_char_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_lang_StringBuilder_setCharAt__int_char_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    xor eax, eax
    jmp pulsec_pulse_lang_StringBuilder_setCharAt__int_char_epilogue
pulsec_pulse_lang_StringBuilder_setCharAt__int_char_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_StringBuilder_setCharAt__int_char_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_lang_StringBuilder_setCharAt__int_char endp

pulsec_pulse_lang_StringBuilder_setLength__int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m65
    mov edx, trace_m65_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
pulsec_pulse_lang_StringBuilder_setLength__int_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_setLength__int_b1
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_b2
pulsec_pulse_lang_StringBuilder_setLength__int_b1:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, 0
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    mov r8d, eax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    xor eax, eax
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_epilogue
pulsec_pulse_lang_StringBuilder_setLength__int_b2:
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_b3
pulsec_pulse_lang_StringBuilder_setLength__int_b3:
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_b4
pulsec_pulse_lang_StringBuilder_setLength__int_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_setLength__int_b5
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_b6
pulsec_pulse_lang_StringBuilder_setLength__int_b5:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov eax, 0
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_b4
pulsec_pulse_lang_StringBuilder_setLength__int_b6:
    xor eax, eax
    jmp pulsec_pulse_lang_StringBuilder_setLength__int_epilogue
pulsec_pulse_lang_StringBuilder_setLength__int_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_setLength__int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_lang_StringBuilder_setLength__int endp

pulsec_pulse_lang_StringBuilder_substring__int proc
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
pulsec_pulse_lang_StringBuilder_substring__int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_lang_StringBuilder_substring__int_epilogue
pulsec_pulse_lang_StringBuilder_substring__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_substring__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_substring__int endp

pulsec_pulse_lang_StringBuilder_substring__int_int proc
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
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_substring__int_int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_StringBuilder_substring__int_int_epilogue
pulsec_pulse_lang_StringBuilder_substring__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_substring__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_substring__int_int endp

pulsec_pulse_lang_StringBuilder_indexOf__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_indexOf__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_indexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_StringBuilder_indexOf__String_epilogue
pulsec_pulse_lang_StringBuilder_indexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_indexOf__String endp

pulsec_pulse_lang_StringBuilder_indexOf__String_int proc
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
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_indexOf__String_int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_indexOf__String_int_epilogue
pulsec_pulse_lang_StringBuilder_indexOf__String_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_indexOf__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_indexOf__String_int endp

pulsec_pulse_lang_StringBuilder_lastIndexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    call pulsec_pulse_lang_String_lastIndexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_StringBuilder_lastIndexOf__String_epilogue
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_lastIndexOf__String endp

pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
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
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+136]
    call pulsec_pulse_lang_String_lastIndexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_StringBuilder_lastIndexOf__String_int endp

pulsec_pulse_lang_StringBuilder_reverse proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_StringBuilder_reverse_b0:
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_StringBuilder_reverse_b1
pulsec_pulse_lang_StringBuilder_reverse_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_StringBuilder_reverse_b2
    jmp pulsec_pulse_lang_StringBuilder_reverse_b3
pulsec_pulse_lang_StringBuilder_reverse_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
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
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_StringBuilder_reverse_b1
pulsec_pulse_lang_StringBuilder_reverse_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_reverse_epilogue
pulsec_pulse_lang_StringBuilder_reverse_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_lang_StringBuilder_reverse_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 360
    ret
pulsec_pulse_lang_StringBuilder_reverse endp

pulsec_pulse_lang_StringBuilder_toString proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m73
    mov edx, trace_m73_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_StringBuilder_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_StringBuilder_value]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_StringBuilder_toString_epilogue
pulsec_pulse_lang_StringBuilder_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_StringBuilder_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_StringBuilder_toString endp

end
