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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_charAt__int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_valueOf__char:proc
extrn pulsec_pulse_lang_String_valueOf__int:proc
extrn pulsec_rt_panic:proc
extrn pulsec_fget_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Double_MAX_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MIN_VALUE:proc
extrn pulsec_fget_pulse_lang_Float_MAX_VALUE:proc
extrn pulsec_fset_pulse_lang_Float_MAX_VALUE:proc
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

public pulsec_fld_pulse_lang_Integer_boxedValue
public pulsec_fld_pulse_lang_Integer_boxedValue_heap_owned
public pulsec_fld_pulse_lang_Integer_MIN_VALUE
public pulsec_fget_pulse_lang_Integer_MIN_VALUE
public pulsec_fset_pulse_lang_Integer_MIN_VALUE
public pulsec_fld_pulse_lang_Integer_MAX_VALUE
public pulsec_fget_pulse_lang_Integer_MAX_VALUE
public pulsec_fset_pulse_lang_Integer_MAX_VALUE

extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_pulse_lang_Integer dd 0
pulsec_fcap_pulse_lang_Integer dd 63
pulsec_fld_pulse_lang_Integer_boxedValue_tbl dd 64 dup(0)
pulsec_fld_pulse_lang_Integer_boxedValue dq pulsec_fld_pulse_lang_Integer_boxedValue_tbl
pulsec_fld_pulse_lang_Integer_boxedValue_heap_owned dd 0
pulsec_fld_pulse_lang_Integer_MIN_VALUE dd -2147483648
pulsec_fld_pulse_lang_Integer_MAX_VALUE dd 2147483647
trace_m0 db "pulse.lang.Integer.Integer"
trace_m0_len equ 26
trace_m1 db "pulse.lang.Integer.valueOf"
trace_m1_len equ 26
trace_m2 db "pulse.lang.Integer.boxObject"
trace_m2_len equ 28
trace_m3 db "pulse.lang.Integer.unboxBoxed"
trace_m3_len equ 29
trace_m4 db "pulse.lang.Integer.parse"
trace_m4_len equ 24
trace_m5 db "pulse.lang.Integer.intValue"
trace_m5_len equ 27
trace_m6 db "pulse.lang.Integer.equals"
trace_m6_len equ 25
trace_m7 db "pulse.lang.Integer.compare"
trace_m7_len equ 26
trace_m8 db "pulse.lang.Integer.toString"
trace_m8_len equ 27
trace_m9 db "pulse.lang.Integer.toHexString"
trace_m9_len equ 30
trace_m10 db "pulse.lang.Integer.hashCode"
trace_m10_len equ 27
trace_m11 db "pulse.lang.Integer.equals"
trace_m11_len equ 25
trace_m12 db "pulse.lang.Integer.toString"
trace_m12_len equ 27
cidset_0 dd 15
msg0 db "Invalid cast"
msg0_len equ 12
msg1 db "Invalid integer literal"
msg1_len equ 23
msg2 db "Invalid integer literal"
msg2_len equ 23
msg3 db "Invalid integer literal"
msg3_len equ 23
msg4 db "Invalid integer literal"
msg4_len equ 23
msg5 db "Invalid integer literal"
msg5_len equ 23
msg6 db "Invalid integer literal"
msg6_len equ 23
msg7 db "0"
msg7_len equ 1
msg8 db "0123456789abcdef"
msg8_len equ 16
msg9 db 0
msg9_len equ 0
msg10 db "Invalid cast"
msg10_len equ 12

.code
pulsec_fcap_pulse_lang_Integer_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_lang_Integer_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_lang_Integer]
    jbe pulsec_fcap_pulse_lang_Integer_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_lang_Integer]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_lang_Integer_ensure_fail
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
    jz pulsec_fcap_pulse_lang_Integer_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    xor esi, esi
pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_lang_Integer_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_lang_Integer_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_lang_Integer_boxedValue_heap_owned], 0
    je pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_lang_Integer_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue], r12
    mov dword ptr [pulsec_fld_pulse_lang_Integer_boxedValue_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_lang_Integer], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_lang_Integer_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_Integer_ensure_alloc_fail:
pulsec_fcap_pulse_lang_Integer_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_lang_Integer_ensure endp

pulsec_pulse_lang_Integer_Integer__int proc
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
    mov dword ptr [rsp+72], edx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_lang_Integer_Integer__int_ctor_reuse
    mov ecx, 15
    call pulsec_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_fcap_pulse_lang_Integer_ensure
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_Integer_Integer__int_ctor_ready
pulsec_pulse_lang_Integer_Integer__int_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_lang_Integer_Integer__int_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_Integer__int_b0:
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_Integer_Integer__int_epilogue
pulsec_pulse_lang_Integer_Integer__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_Integer_Integer__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_Integer_Integer__int endp

pulsec_pulse_lang_Integer_valueOf__int proc
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
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_valueOf__int_b0:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_Integer_valueOf__int_epilogue
pulsec_pulse_lang_Integer_valueOf__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_valueOf__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Integer_valueOf__int endp

pulsec_pulse_lang_Integer_boxObject__int proc
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
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_boxObject__int_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    xor ecx, ecx
    call pulsec_pulse_lang_Integer_Integer__int
    jmp pulsec_pulse_lang_Integer_boxObject__int_epilogue
pulsec_pulse_lang_Integer_boxObject__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_boxObject__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_Integer_boxObject__int endp

pulsec_pulse_lang_Integer_unboxBoxed__Integer proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_unboxBoxed__Integer_b1
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_b2
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b1:
    lea rcx, msg0
    mov edx, msg0_len
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
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b2:
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_epilogue
pulsec_pulse_lang_Integer_unboxBoxed__Integer_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_lang_Integer_unboxBoxed__Integer_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_Integer_unboxBoxed__Integer endp

pulsec_pulse_lang_Integer_parse__String proc
    sub rsp, 456
    mov qword ptr [rsp+424], rcx
    mov qword ptr [rsp+432], rdx
    mov qword ptr [rsp+440], r8
    mov qword ptr [rsp+448], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
pulsec_pulse_lang_Integer_parse__String_b0:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b1
    jmp pulsec_pulse_lang_Integer_parse__String_b2
pulsec_pulse_lang_Integer_parse__String_b1:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b3
pulsec_pulse_lang_Integer_parse__String_b2:
    jmp pulsec_pulse_lang_Integer_parse__String_b3
pulsec_pulse_lang_Integer_parse__String_b3:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b4
    jmp pulsec_pulse_lang_Integer_parse__String_b5
pulsec_pulse_lang_Integer_parse__String_b4:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b6
pulsec_pulse_lang_Integer_parse__String_b5:
    jmp pulsec_pulse_lang_Integer_parse__String_b6
pulsec_pulse_lang_Integer_parse__String_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov dword ptr [rsp+160], eax
    call pulsec_fget_pulse_lang_Integer_MAX_VALUE
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    sub eax, edx
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov eax, 0
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b7
    jmp pulsec_pulse_lang_Integer_parse__String_b8
pulsec_pulse_lang_Integer_parse__String_b7:
    mov eax, 1
    mov dword ptr [rsp+80], eax
    call pulsec_fget_pulse_lang_Integer_MIN_VALUE
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Integer_parse__String_b9
pulsec_pulse_lang_Integer_parse__String_b8:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+176], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b10
    jmp pulsec_pulse_lang_Integer_parse__String_b11
pulsec_pulse_lang_Integer_parse__String_b9:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b13
    jmp pulsec_pulse_lang_Integer_parse__String_b14
pulsec_pulse_lang_Integer_parse__String_b10:
    mov eax, 1
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Integer_parse__String_b12
pulsec_pulse_lang_Integer_parse__String_b11:
    jmp pulsec_pulse_lang_Integer_parse__String_b12
pulsec_pulse_lang_Integer_parse__String_b12:
    jmp pulsec_pulse_lang_Integer_parse__String_b9
pulsec_pulse_lang_Integer_parse__String_b13:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b15
pulsec_pulse_lang_Integer_parse__String_b14:
    jmp pulsec_pulse_lang_Integer_parse__String_b15
pulsec_pulse_lang_Integer_parse__String_b15:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    mov ecx, edx
    cdq
    idiv ecx
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+112], eax
    jmp pulsec_pulse_lang_Integer_parse__String_b16
pulsec_pulse_lang_Integer_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b17
    jmp pulsec_pulse_lang_Integer_parse__String_b18
pulsec_pulse_lang_Integer_parse__String_b17:
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov edx, eax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+208], eax
    mov eax, 48
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Integer_parse_ternary_then_21_67
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+216], eax
    mov eax, 57
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp Integer_parse_ternary_done_21_67
Integer_parse_ternary_then_21_67:
    mov eax, 1
Integer_parse_ternary_done_21_67:
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b19
    jmp pulsec_pulse_lang_Integer_parse__String_b20
pulsec_pulse_lang_Integer_parse__String_b18:
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b28
    jmp pulsec_pulse_lang_Integer_parse__String_b29
pulsec_pulse_lang_Integer_parse__String_b19:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b21
pulsec_pulse_lang_Integer_parse__String_b20:
    jmp pulsec_pulse_lang_Integer_parse__String_b21
pulsec_pulse_lang_Integer_parse__String_b21:
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+232], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b22
    jmp pulsec_pulse_lang_Integer_parse__String_b23
pulsec_pulse_lang_Integer_parse__String_b22:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b24
pulsec_pulse_lang_Integer_parse__String_b23:
    jmp pulsec_pulse_lang_Integer_parse__String_b24
pulsec_pulse_lang_Integer_parse__String_b24:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+240], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    imul eax, edx
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+256], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+248], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b25
    jmp pulsec_pulse_lang_Integer_parse__String_b26
pulsec_pulse_lang_Integer_parse__String_b25:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    jmp pulsec_pulse_lang_Integer_parse__String_b27
pulsec_pulse_lang_Integer_parse__String_b26:
    jmp pulsec_pulse_lang_Integer_parse__String_b27
pulsec_pulse_lang_Integer_parse__String_b27:
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+264], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    sub eax, edx
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_Integer_parse__String_b16
pulsec_pulse_lang_Integer_parse__String_b28:
    mov eax, dword ptr [rsp+112]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_valueOf__int
    jmp pulsec_pulse_lang_Integer_parse__String_epilogue
pulsec_pulse_lang_Integer_parse__String_b29:
    jmp pulsec_pulse_lang_Integer_parse__String_b30
pulsec_pulse_lang_Integer_parse__String_b30:
    mov eax, 0
    mov dword ptr [rsp+280], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+280]
    sub eax, edx
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_valueOf__int
    jmp pulsec_pulse_lang_Integer_parse__String_epilogue
pulsec_pulse_lang_Integer_parse__String_epilogue:
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
pulsec_pulse_lang_Integer_parse__String_epilogue_post:
    mov qword ptr [rsp+328], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+328]
    add rsp, 456
    ret
pulsec_pulse_lang_Integer_parse__String endp

pulsec_pulse_lang_Integer_intValue__Integer proc
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
pulsec_pulse_lang_Integer_intValue__Integer_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Integer_intValue__Integer_epilogue
pulsec_pulse_lang_Integer_intValue__Integer_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_intValue__Integer_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Integer_intValue__Integer endp

pulsec_pulse_lang_Integer_equals__int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_Integer_equals__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_Integer_equals__int_int_epilogue
pulsec_pulse_lang_Integer_equals__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Integer_equals__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Integer_equals__int_int endp

pulsec_pulse_lang_Integer_compare__int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_Integer_compare__int_int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_compare__int_int_b1
    jmp pulsec_pulse_lang_Integer_compare__int_int_b2
pulsec_pulse_lang_Integer_compare__int_int_b1:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Integer_compare__int_int_epilogue
pulsec_pulse_lang_Integer_compare__int_int_b2:
    jmp pulsec_pulse_lang_Integer_compare__int_int_b3
pulsec_pulse_lang_Integer_compare__int_int_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_compare__int_int_b4
    jmp pulsec_pulse_lang_Integer_compare__int_int_b5
pulsec_pulse_lang_Integer_compare__int_int_b4:
    mov eax, 1
    jmp pulsec_pulse_lang_Integer_compare__int_int_epilogue
pulsec_pulse_lang_Integer_compare__int_int_b5:
    jmp pulsec_pulse_lang_Integer_compare__int_int_b6
pulsec_pulse_lang_Integer_compare__int_int_b6:
    mov eax, 0
    jmp pulsec_pulse_lang_Integer_compare__int_int_epilogue
pulsec_pulse_lang_Integer_compare__int_int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_lang_Integer_compare__int_int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_lang_Integer_compare__int_int endp

pulsec_pulse_lang_Integer_toString__int proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_toString__int_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    jmp pulsec_pulse_lang_Integer_toString__int_epilogue
pulsec_pulse_lang_Integer_toString__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_toString__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_Integer_toString__int endp

pulsec_pulse_lang_Integer_toHexString__int proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+104], ecx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_Integer_toHexString__int_b0:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_toHexString__int_b1
    jmp pulsec_pulse_lang_Integer_toHexString__int_b2
pulsec_pulse_lang_Integer_toHexString__int_b1:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Integer_toHexString__int_epilogue
pulsec_pulse_lang_Integer_toHexString__int_b2:
    jmp pulsec_pulse_lang_Integer_toHexString__int_b3
pulsec_pulse_lang_Integer_toHexString__int_b3:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rax
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Integer_toHexString__int_b4
pulsec_pulse_lang_Integer_toHexString__int_b4:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+120], eax
    mov eax, 8
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne Integer_toHexString_ternary_then_6_15
    mov eax, 0
    jmp Integer_toHexString_ternary_done_6_15
Integer_toHexString_ternary_then_6_15:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setne al
    movzx eax, al
Integer_toHexString_ternary_done_6_15:
    test eax, eax
    jne pulsec_pulse_lang_Integer_toHexString__int_b5
    jmp pulsec_pulse_lang_Integer_toHexString__int_b6
pulsec_pulse_lang_Integer_toHexString__int_b5:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, 15
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    and eax, edx
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 4
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    mov ecx, edx
    shr eax, cl
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_Integer_toHexString__int_b4
pulsec_pulse_lang_Integer_toHexString__int_b6:
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_Integer_toHexString__int_epilogue
pulsec_pulse_lang_Integer_toHexString__int_epilogue:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
pulsec_pulse_lang_Integer_toHexString__int_epilogue_post:
    mov qword ptr [rsp+200], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 408
    ret
pulsec_pulse_lang_Integer_toHexString__int endp

pulsec_pulse_lang_Integer_hashCode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_hashCode_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_lang_Integer_hashCode_epilogue
pulsec_pulse_lang_Integer_hashCode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_hashCode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_Integer_hashCode endp

pulsec_pulse_lang_Integer_equals__Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Integer_equals__Object_b0:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je Integer_equals_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz Integer_equals_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz Integer_equals_instof_0_1_true
Integer_equals_instof_0_1_false:
    xor eax, eax
    jmp Integer_equals_instof_0_1_done
Integer_equals_instof_0_1_true:
    mov eax, 1
Integer_equals_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_Integer_equals__Object_b1
    jmp pulsec_pulse_lang_Integer_equals__Object_b2
pulsec_pulse_lang_Integer_equals__Object_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_Integer_equals__Object_epilogue
pulsec_pulse_lang_Integer_equals__Object_b2:
    jmp pulsec_pulse_lang_Integer_equals__Object_b3
pulsec_pulse_lang_Integer_equals__Object_b3:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je Integer_equals_cast_2_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz Integer_equals_cast_2_7_fail
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz Integer_equals_cast_2_7_ok
Integer_equals_cast_2_7_fail:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp Integer_equals_cast_2_7_done
Integer_equals_cast_2_7_null:
    xor eax, eax
    jmp Integer_equals_cast_2_7_done
Integer_equals_cast_2_7_ok:
    mov rax, qword ptr [rsp+40]
Integer_equals_cast_2_7_done:
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_Integer_equals__Object_epilogue
pulsec_pulse_lang_Integer_equals__Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_lang_Integer_equals__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_lang_Integer_equals__Object endp

pulsec_pulse_lang_Integer_toString proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_toString_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_Integer_toString__int
    jmp pulsec_pulse_lang_Integer_toString_epilogue
pulsec_pulse_lang_Integer_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_Integer_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_Integer_toString endp

pulsec_fget_pulse_lang_Integer_MIN_VALUE proc
    mov eax, dword ptr [pulsec_fld_pulse_lang_Integer_MIN_VALUE]
    ret
pulsec_fget_pulse_lang_Integer_MIN_VALUE endp

pulsec_fset_pulse_lang_Integer_MIN_VALUE proc
    mov dword ptr [pulsec_fld_pulse_lang_Integer_MIN_VALUE], ecx
    ret
pulsec_fset_pulse_lang_Integer_MIN_VALUE endp


pulsec_fget_pulse_lang_Integer_MAX_VALUE proc
    mov eax, dword ptr [pulsec_fld_pulse_lang_Integer_MAX_VALUE]
    ret
pulsec_fget_pulse_lang_Integer_MAX_VALUE endp

pulsec_fset_pulse_lang_Integer_MAX_VALUE proc
    mov dword ptr [pulsec_fld_pulse_lang_Integer_MAX_VALUE], ecx
    ret
pulsec_fset_pulse_lang_Integer_MAX_VALUE endp


end
