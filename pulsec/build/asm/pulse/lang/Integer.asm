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
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
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
pulsec_pulse_lang_Integer_Integer__int_trace_s0 db "pulse.lang.Integer.Integer(Integer.pulse:22)"
pulsec_pulse_lang_Integer_Integer__int_trace_s0_len equ 44
trace_m2 db "pulse.lang.Integer.valueOf"
trace_m2_len equ 26
pulsec_pulse_lang_Integer_valueOf__int_trace_s0 db "pulse.lang.Integer.valueOf(Integer.pulse:30)"
pulsec_pulse_lang_Integer_valueOf__int_trace_s0_len equ 44
trace_m4 db "pulse.lang.Integer.boxObject"
trace_m4_len equ 28
pulsec_pulse_lang_Integer_boxObject__int_trace_s0 db "pulse.lang.Integer.boxObject(Integer.pulse:38)"
pulsec_pulse_lang_Integer_boxObject__int_trace_s0_len equ 46
trace_m6 db "pulse.lang.Integer.unboxBoxed"
trace_m6_len equ 29
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0 db "pulse.lang.Integer.unboxBoxed(Integer.pulse:46)"
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0_len equ 47
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s1 db "pulse.lang.Integer.unboxBoxed(Integer.pulse:47)"
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s1_len equ 47
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s2 db "pulse.lang.Integer.unboxBoxed(Integer.pulse:49)"
pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s2_len equ 47
trace_m10 db "pulse.lang.Integer.parse"
trace_m10_len equ 24
pulsec_pulse_lang_Integer_parse__String_trace_s0 db "pulse.lang.Integer.parse(Integer.pulse:57)"
pulsec_pulse_lang_Integer_parse__String_trace_s0_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s1 db "pulse.lang.Integer.parse(Integer.pulse:58)"
pulsec_pulse_lang_Integer_parse__String_trace_s1_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s2 db "pulse.lang.Integer.parse(Integer.pulse:61)"
pulsec_pulse_lang_Integer_parse__String_trace_s2_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s3 db "pulse.lang.Integer.parse(Integer.pulse:62)"
pulsec_pulse_lang_Integer_parse__String_trace_s3_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s4 db "pulse.lang.Integer.parse(Integer.pulse:63)"
pulsec_pulse_lang_Integer_parse__String_trace_s4_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s5 db "pulse.lang.Integer.parse(Integer.pulse:66)"
pulsec_pulse_lang_Integer_parse__String_trace_s5_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s6 db "pulse.lang.Integer.parse(Integer.pulse:67)"
pulsec_pulse_lang_Integer_parse__String_trace_s6_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s7 db "pulse.lang.Integer.parse(Integer.pulse:68)"
pulsec_pulse_lang_Integer_parse__String_trace_s7_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s8 db "pulse.lang.Integer.parse(Integer.pulse:69)"
pulsec_pulse_lang_Integer_parse__String_trace_s8_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s9 db "pulse.lang.Integer.parse(Integer.pulse:70)"
pulsec_pulse_lang_Integer_parse__String_trace_s9_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s10 db "pulse.lang.Integer.parse(Integer.pulse:71)"
pulsec_pulse_lang_Integer_parse__String_trace_s10_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s11 db "pulse.lang.Integer.parse(Integer.pulse:72)"
pulsec_pulse_lang_Integer_parse__String_trace_s11_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s12 db "pulse.lang.Integer.parse(Integer.pulse:73)"
pulsec_pulse_lang_Integer_parse__String_trace_s12_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s13 db "pulse.lang.Integer.parse(Integer.pulse:74)"
pulsec_pulse_lang_Integer_parse__String_trace_s13_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s14 db "pulse.lang.Integer.parse(Integer.pulse:75)"
pulsec_pulse_lang_Integer_parse__String_trace_s14_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s15 db "pulse.lang.Integer.parse(Integer.pulse:78)"
pulsec_pulse_lang_Integer_parse__String_trace_s15_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s16 db "pulse.lang.Integer.parse(Integer.pulse:79)"
pulsec_pulse_lang_Integer_parse__String_trace_s16_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s17 db "pulse.lang.Integer.parse(Integer.pulse:82)"
pulsec_pulse_lang_Integer_parse__String_trace_s17_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s18 db "pulse.lang.Integer.parse(Integer.pulse:83)"
pulsec_pulse_lang_Integer_parse__String_trace_s18_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s19 db "pulse.lang.Integer.parse(Integer.pulse:84)"
pulsec_pulse_lang_Integer_parse__String_trace_s19_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s20 db "pulse.lang.Integer.parse(Integer.pulse:85)"
pulsec_pulse_lang_Integer_parse__String_trace_s20_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s21 db "pulse.lang.Integer.parse(Integer.pulse:86)"
pulsec_pulse_lang_Integer_parse__String_trace_s21_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s22 db "pulse.lang.Integer.parse(Integer.pulse:87)"
pulsec_pulse_lang_Integer_parse__String_trace_s22_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s23 db "pulse.lang.Integer.parse(Integer.pulse:89)"
pulsec_pulse_lang_Integer_parse__String_trace_s23_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s24 db "pulse.lang.Integer.parse(Integer.pulse:90)"
pulsec_pulse_lang_Integer_parse__String_trace_s24_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s25 db "pulse.lang.Integer.parse(Integer.pulse:91)"
pulsec_pulse_lang_Integer_parse__String_trace_s25_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s26 db "pulse.lang.Integer.parse(Integer.pulse:93)"
pulsec_pulse_lang_Integer_parse__String_trace_s26_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s27 db "pulse.lang.Integer.parse(Integer.pulse:94)"
pulsec_pulse_lang_Integer_parse__String_trace_s27_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s28 db "pulse.lang.Integer.parse(Integer.pulse:95)"
pulsec_pulse_lang_Integer_parse__String_trace_s28_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s29 db "pulse.lang.Integer.parse(Integer.pulse:97)"
pulsec_pulse_lang_Integer_parse__String_trace_s29_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s30 db "pulse.lang.Integer.parse(Integer.pulse:98)"
pulsec_pulse_lang_Integer_parse__String_trace_s30_len equ 42
pulsec_pulse_lang_Integer_parse__String_trace_s31 db "pulse.lang.Integer.parse(Integer.pulse:101)"
pulsec_pulse_lang_Integer_parse__String_trace_s31_len equ 43
pulsec_pulse_lang_Integer_parse__String_trace_s32 db "pulse.lang.Integer.parse(Integer.pulse:102)"
pulsec_pulse_lang_Integer_parse__String_trace_s32_len equ 43
pulsec_pulse_lang_Integer_parse__String_trace_s33 db "pulse.lang.Integer.parse(Integer.pulse:104)"
pulsec_pulse_lang_Integer_parse__String_trace_s33_len equ 43
trace_m45 db "pulse.lang.Integer.intValue"
trace_m45_len equ 27
pulsec_pulse_lang_Integer_intValue__Integer_trace_s0 db "pulse.lang.Integer.intValue(Integer.pulse:112)"
pulsec_pulse_lang_Integer_intValue__Integer_trace_s0_len equ 46
trace_m47 db "pulse.lang.Integer.equals"
trace_m47_len equ 25
pulsec_pulse_lang_Integer_equals__int_int_trace_s0 db "pulse.lang.Integer.equals(Integer.pulse:120)"
pulsec_pulse_lang_Integer_equals__int_int_trace_s0_len equ 44
trace_m49 db "pulse.lang.Integer.compare"
trace_m49_len equ 26
pulsec_pulse_lang_Integer_compare__int_int_trace_s0 db "pulse.lang.Integer.compare(Integer.pulse:128)"
pulsec_pulse_lang_Integer_compare__int_int_trace_s0_len equ 45
pulsec_pulse_lang_Integer_compare__int_int_trace_s1 db "pulse.lang.Integer.compare(Integer.pulse:129)"
pulsec_pulse_lang_Integer_compare__int_int_trace_s1_len equ 45
pulsec_pulse_lang_Integer_compare__int_int_trace_s2 db "pulse.lang.Integer.compare(Integer.pulse:131)"
pulsec_pulse_lang_Integer_compare__int_int_trace_s2_len equ 45
pulsec_pulse_lang_Integer_compare__int_int_trace_s3 db "pulse.lang.Integer.compare(Integer.pulse:132)"
pulsec_pulse_lang_Integer_compare__int_int_trace_s3_len equ 45
pulsec_pulse_lang_Integer_compare__int_int_trace_s4 db "pulse.lang.Integer.compare(Integer.pulse:134)"
pulsec_pulse_lang_Integer_compare__int_int_trace_s4_len equ 45
trace_m55 db "pulse.lang.Integer.toString"
trace_m55_len equ 27
pulsec_pulse_lang_Integer_toString__int_trace_s0 db "pulse.lang.Integer.toString(Integer.pulse:142)"
pulsec_pulse_lang_Integer_toString__int_trace_s0_len equ 46
trace_m57 db "pulse.lang.Integer.toHexString"
trace_m57_len equ 30
pulsec_pulse_lang_Integer_toHexString__int_trace_s0 db "pulse.lang.Integer.toHexString(Integer.pulse:150)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s0_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s1 db "pulse.lang.Integer.toHexString(Integer.pulse:151)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s1_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s2 db "pulse.lang.Integer.toHexString(Integer.pulse:154)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s2_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s3 db "pulse.lang.Integer.toHexString(Integer.pulse:155)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s3_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s4 db "pulse.lang.Integer.toHexString(Integer.pulse:156)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s4_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s5 db "pulse.lang.Integer.toHexString(Integer.pulse:157)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s5_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s6 db "pulse.lang.Integer.toHexString(Integer.pulse:158)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s6_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s7 db "pulse.lang.Integer.toHexString(Integer.pulse:159)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s7_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s8 db "pulse.lang.Integer.toHexString(Integer.pulse:160)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s8_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s9 db "pulse.lang.Integer.toHexString(Integer.pulse:161)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s9_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s10 db "pulse.lang.Integer.toHexString(Integer.pulse:162)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s10_len equ 49
pulsec_pulse_lang_Integer_toHexString__int_trace_s11 db "pulse.lang.Integer.toHexString(Integer.pulse:164)"
pulsec_pulse_lang_Integer_toHexString__int_trace_s11_len equ 49
trace_m70 db "pulse.lang.Integer.hashCode"
trace_m70_len equ 27
pulsec_pulse_lang_Integer_hashCode_trace_s0 db "pulse.lang.Integer.hashCode(Integer.pulse:172)"
pulsec_pulse_lang_Integer_hashCode_trace_s0_len equ 46
trace_m72 db "pulse.lang.Integer.equals"
trace_m72_len equ 25
pulsec_pulse_lang_Integer_equals__Object_trace_s0 db "pulse.lang.Integer.equals(Integer.pulse:180)"
pulsec_pulse_lang_Integer_equals__Object_trace_s0_len equ 44
pulsec_pulse_lang_Integer_equals__Object_trace_s1 db "pulse.lang.Integer.equals(Integer.pulse:181)"
pulsec_pulse_lang_Integer_equals__Object_trace_s1_len equ 44
pulsec_pulse_lang_Integer_equals__Object_trace_s2 db "pulse.lang.Integer.equals(Integer.pulse:183)"
pulsec_pulse_lang_Integer_equals__Object_trace_s2_len equ 44
trace_m76 db "pulse.lang.Integer.toString"
trace_m76_len equ 27
pulsec_pulse_lang_Integer_toString_trace_s0 db "pulse.lang.Integer.toString(Integer.pulse:191)"
pulsec_pulse_lang_Integer_toString_trace_s0_len equ 46
cidset_10 dd 28
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
    mov ecx, 28
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
    lea rcx, pulsec_pulse_lang_Integer_Integer__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_Integer__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_valueOf__int_b0:
    lea rcx, pulsec_pulse_lang_Integer_valueOf__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_valueOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_boxObject__int_b0:
    lea rcx, pulsec_pulse_lang_Integer_boxObject__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_boxObject__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b0:
    lea rcx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0
    mov edx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s1
    mov edx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s1_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0
    mov edx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b2:
    jmp pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3
pulsec_pulse_lang_Integer_unboxBoxed__Integer_b3:
    lea rcx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s2
    mov edx, pulsec_pulse_lang_Integer_unboxBoxed__Integer_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
pulsec_pulse_lang_Integer_parse__String_b0:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s1
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s0
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b3
pulsec_pulse_lang_Integer_parse__String_b2:
    jmp pulsec_pulse_lang_Integer_parse__String_b3
pulsec_pulse_lang_Integer_parse__String_b3:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s2
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s4
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s3
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b6
pulsec_pulse_lang_Integer_parse__String_b5:
    jmp pulsec_pulse_lang_Integer_parse__String_b6
pulsec_pulse_lang_Integer_parse__String_b6:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s5
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s6
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s7
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+160], eax
    call pulsec_fget_pulse_lang_Integer_MAX_VALUE
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    sub eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s8
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s8_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s10
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s11
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s11_len
    call pulsec_rt_traceUpdateTop
    call pulsec_fget_pulse_lang_Integer_MIN_VALUE
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s12
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b9
pulsec_pulse_lang_Integer_parse__String_b8:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s13
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s15
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s14
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s13
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s13_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b12
pulsec_pulse_lang_Integer_parse__String_b11:
    jmp pulsec_pulse_lang_Integer_parse__String_b12
pulsec_pulse_lang_Integer_parse__String_b12:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s9
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b9
pulsec_pulse_lang_Integer_parse__String_b13:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s16
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s16_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s15
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s15_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b15
pulsec_pulse_lang_Integer_parse__String_b14:
    jmp pulsec_pulse_lang_Integer_parse__String_b15
pulsec_pulse_lang_Integer_parse__String_b15:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s17
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    mov ecx, edx
    cdq
    idiv ecx
    mov dword ptr [rsp+104], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s18
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s20
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s20_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s21
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s31
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne pulsec_pulse_lang_Integer_parse__String_b28
    jmp pulsec_pulse_lang_Integer_parse__String_b29
pulsec_pulse_lang_Integer_parse__String_b19:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s22
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s22_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s21
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s21_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b21
pulsec_pulse_lang_Integer_parse__String_b20:
    jmp pulsec_pulse_lang_Integer_parse__String_b21
pulsec_pulse_lang_Integer_parse__String_b21:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s23
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s23_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s25
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s25_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s24
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s24_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b24
pulsec_pulse_lang_Integer_parse__String_b23:
    jmp pulsec_pulse_lang_Integer_parse__String_b24
pulsec_pulse_lang_Integer_parse__String_b24:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s26
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s26_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+240], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    imul eax, edx
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s27
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s28
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s28_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s27
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s27_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b27
pulsec_pulse_lang_Integer_parse__String_b26:
    jmp pulsec_pulse_lang_Integer_parse__String_b27
pulsec_pulse_lang_Integer_parse__String_b27:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s29
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s29_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+264], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    sub eax, edx
    mov dword ptr [rsp+112], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s30
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s30_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s19
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s19_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b16
pulsec_pulse_lang_Integer_parse__String_b28:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s32
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s32_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s31
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s31_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_parse__String_b30
pulsec_pulse_lang_Integer_parse__String_b30:
    lea rcx, pulsec_pulse_lang_Integer_parse__String_trace_s33
    mov edx, pulsec_pulse_lang_Integer_parse__String_trace_s33_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_intValue__Integer_b0:
    lea rcx, pulsec_pulse_lang_Integer_intValue__Integer_trace_s0
    mov edx, pulsec_pulse_lang_Integer_intValue__Integer_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_Integer_equals__int_int_b0:
    lea rcx, pulsec_pulse_lang_Integer_equals__int_int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_equals__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_Integer_compare__int_int_b0:
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s1
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_Integer_compare__int_int_epilogue
pulsec_pulse_lang_Integer_compare__int_int_b2:
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_compare__int_int_b3
pulsec_pulse_lang_Integer_compare__int_int_b3:
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s3
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_lang_Integer_compare__int_int_epilogue
pulsec_pulse_lang_Integer_compare__int_int_b5:
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s2
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_compare__int_int_b6
pulsec_pulse_lang_Integer_compare__int_int_b6:
    lea rcx, pulsec_pulse_lang_Integer_compare__int_int_trace_s4
    mov edx, pulsec_pulse_lang_Integer_compare__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_Integer_toString__int_b0:
    lea rcx, pulsec_pulse_lang_Integer_toString__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_toString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+104], ecx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_Integer_toHexString__int_b0:
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s1
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_Integer_toHexString__int_epilogue
pulsec_pulse_lang_Integer_toHexString__int_b2:
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s0
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_toHexString__int_b3
pulsec_pulse_lang_Integer_toHexString__int_b3:
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s2
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s3
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s4
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s5
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s6
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s7
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, 15
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    and eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s8
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s9
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 4
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    mov ecx, edx
    shr eax, cl
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s10
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s6
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_toHexString__int_b4
pulsec_pulse_lang_Integer_toHexString__int_b6:
    lea rcx, pulsec_pulse_lang_Integer_toHexString__int_trace_s11
    mov edx, pulsec_pulse_lang_Integer_toHexString__int_trace_s11_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_hashCode_b0:
    lea rcx, pulsec_pulse_lang_Integer_hashCode_trace_s0
    mov edx, pulsec_pulse_lang_Integer_hashCode_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_Integer_equals__Object_b0:
    lea rcx, pulsec_pulse_lang_Integer_equals__Object_trace_s0
    mov edx, pulsec_pulse_lang_Integer_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je Integer_equals_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz Integer_equals_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_10
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
    lea rcx, pulsec_pulse_lang_Integer_equals__Object_trace_s1
    mov edx, pulsec_pulse_lang_Integer_equals__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_lang_Integer_equals__Object_epilogue
pulsec_pulse_lang_Integer_equals__Object_b2:
    lea rcx, pulsec_pulse_lang_Integer_equals__Object_trace_s0
    mov edx, pulsec_pulse_lang_Integer_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_lang_Integer_equals__Object_b3
pulsec_pulse_lang_Integer_equals__Object_b3:
    lea rcx, pulsec_pulse_lang_Integer_equals__Object_trace_s2
    mov edx, pulsec_pulse_lang_Integer_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
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
    lea rdx, cidset_10
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
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_Integer_toString_b0:
    lea rcx, pulsec_pulse_lang_Integer_toString_trace_s0
    mov edx, pulsec_pulse_lang_Integer_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
