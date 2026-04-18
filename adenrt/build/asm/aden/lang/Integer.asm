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
extrn adenc_rt_objectNew:proc
extrn adenc_rt_objectClassId:proc
extrn adenc_rt_classIdInSet:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_charAt__int:proc
extrn adenc_aden_lang_String_length:proc
extrn adenc_aden_lang_String_valueOf__char:proc
extrn adenc_aden_lang_String_valueOf__int:proc
extrn adenc_rt_panic:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Float_MAX_VALUE:proc
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

public adenc_fld_aden_lang_Integer_boxedValue
public adenc_fld_aden_lang_Integer_boxedValue_heap_owned
public adenc_fld_aden_lang_Integer_MIN_VALUE
public adenc_fget_aden_lang_Integer_MIN_VALUE
public adenc_fset_aden_lang_Integer_MIN_VALUE
public adenc_fld_aden_lang_Integer_MAX_VALUE
public adenc_fget_aden_lang_Integer_MAX_VALUE
public adenc_fset_aden_lang_Integer_MAX_VALUE

extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_aden_lang_Integer dd 0
adenc_fcap_aden_lang_Integer dd 63
adenc_fld_aden_lang_Integer_boxedValue_tbl dd 64 dup(0)
adenc_fld_aden_lang_Integer_boxedValue dq adenc_fld_aden_lang_Integer_boxedValue_tbl
adenc_fld_aden_lang_Integer_boxedValue_heap_owned dd 0
adenc_fld_aden_lang_Integer_MIN_VALUE dd -2147483648
adenc_fld_aden_lang_Integer_MAX_VALUE dd 2147483647
trace_m0 db "aden.lang.Integer.Integer"
trace_m0_len equ 25
adenc_aden_lang_Integer_Integer__int_trace_s0 db "aden.lang.Integer.Integer(Integer.aden:22)"
adenc_aden_lang_Integer_Integer__int_trace_s0_len equ 42
trace_m2 db "aden.lang.Integer.valueOf"
trace_m2_len equ 25
adenc_aden_lang_Integer_valueOf__int_trace_s0 db "aden.lang.Integer.valueOf(Integer.aden:30)"
adenc_aden_lang_Integer_valueOf__int_trace_s0_len equ 42
trace_m4 db "aden.lang.Integer.boxObject"
trace_m4_len equ 27
adenc_aden_lang_Integer_boxObject__int_trace_s0 db "aden.lang.Integer.boxObject(Integer.aden:38)"
adenc_aden_lang_Integer_boxObject__int_trace_s0_len equ 44
trace_m6 db "aden.lang.Integer.unboxBoxed"
trace_m6_len equ 28
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0 db "aden.lang.Integer.unboxBoxed(Integer.aden:46)"
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0_len equ 45
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s1 db "aden.lang.Integer.unboxBoxed(Integer.aden:47)"
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s1_len equ 45
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s2 db "aden.lang.Integer.unboxBoxed(Integer.aden:49)"
adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s2_len equ 45
trace_m10 db "aden.lang.Integer.parse"
trace_m10_len equ 23
adenc_aden_lang_Integer_parse__String_trace_s0 db "aden.lang.Integer.parse(Integer.aden:57)"
adenc_aden_lang_Integer_parse__String_trace_s0_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s1 db "aden.lang.Integer.parse(Integer.aden:58)"
adenc_aden_lang_Integer_parse__String_trace_s1_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s2 db "aden.lang.Integer.parse(Integer.aden:61)"
adenc_aden_lang_Integer_parse__String_trace_s2_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s3 db "aden.lang.Integer.parse(Integer.aden:62)"
adenc_aden_lang_Integer_parse__String_trace_s3_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s4 db "aden.lang.Integer.parse(Integer.aden:63)"
adenc_aden_lang_Integer_parse__String_trace_s4_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s5 db "aden.lang.Integer.parse(Integer.aden:66)"
adenc_aden_lang_Integer_parse__String_trace_s5_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s6 db "aden.lang.Integer.parse(Integer.aden:67)"
adenc_aden_lang_Integer_parse__String_trace_s6_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s7 db "aden.lang.Integer.parse(Integer.aden:68)"
adenc_aden_lang_Integer_parse__String_trace_s7_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s8 db "aden.lang.Integer.parse(Integer.aden:69)"
adenc_aden_lang_Integer_parse__String_trace_s8_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s9 db "aden.lang.Integer.parse(Integer.aden:70)"
adenc_aden_lang_Integer_parse__String_trace_s9_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s10 db "aden.lang.Integer.parse(Integer.aden:71)"
adenc_aden_lang_Integer_parse__String_trace_s10_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s11 db "aden.lang.Integer.parse(Integer.aden:72)"
adenc_aden_lang_Integer_parse__String_trace_s11_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s12 db "aden.lang.Integer.parse(Integer.aden:73)"
adenc_aden_lang_Integer_parse__String_trace_s12_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s13 db "aden.lang.Integer.parse(Integer.aden:74)"
adenc_aden_lang_Integer_parse__String_trace_s13_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s14 db "aden.lang.Integer.parse(Integer.aden:75)"
adenc_aden_lang_Integer_parse__String_trace_s14_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s15 db "aden.lang.Integer.parse(Integer.aden:78)"
adenc_aden_lang_Integer_parse__String_trace_s15_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s16 db "aden.lang.Integer.parse(Integer.aden:79)"
adenc_aden_lang_Integer_parse__String_trace_s16_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s17 db "aden.lang.Integer.parse(Integer.aden:82)"
adenc_aden_lang_Integer_parse__String_trace_s17_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s18 db "aden.lang.Integer.parse(Integer.aden:83)"
adenc_aden_lang_Integer_parse__String_trace_s18_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s19 db "aden.lang.Integer.parse(Integer.aden:84)"
adenc_aden_lang_Integer_parse__String_trace_s19_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s20 db "aden.lang.Integer.parse(Integer.aden:85)"
adenc_aden_lang_Integer_parse__String_trace_s20_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s21 db "aden.lang.Integer.parse(Integer.aden:86)"
adenc_aden_lang_Integer_parse__String_trace_s21_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s22 db "aden.lang.Integer.parse(Integer.aden:87)"
adenc_aden_lang_Integer_parse__String_trace_s22_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s23 db "aden.lang.Integer.parse(Integer.aden:89)"
adenc_aden_lang_Integer_parse__String_trace_s23_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s24 db "aden.lang.Integer.parse(Integer.aden:90)"
adenc_aden_lang_Integer_parse__String_trace_s24_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s25 db "aden.lang.Integer.parse(Integer.aden:91)"
adenc_aden_lang_Integer_parse__String_trace_s25_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s26 db "aden.lang.Integer.parse(Integer.aden:93)"
adenc_aden_lang_Integer_parse__String_trace_s26_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s27 db "aden.lang.Integer.parse(Integer.aden:94)"
adenc_aden_lang_Integer_parse__String_trace_s27_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s28 db "aden.lang.Integer.parse(Integer.aden:95)"
adenc_aden_lang_Integer_parse__String_trace_s28_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s29 db "aden.lang.Integer.parse(Integer.aden:97)"
adenc_aden_lang_Integer_parse__String_trace_s29_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s30 db "aden.lang.Integer.parse(Integer.aden:98)"
adenc_aden_lang_Integer_parse__String_trace_s30_len equ 40
adenc_aden_lang_Integer_parse__String_trace_s31 db "aden.lang.Integer.parse(Integer.aden:101)"
adenc_aden_lang_Integer_parse__String_trace_s31_len equ 41
adenc_aden_lang_Integer_parse__String_trace_s32 db "aden.lang.Integer.parse(Integer.aden:102)"
adenc_aden_lang_Integer_parse__String_trace_s32_len equ 41
adenc_aden_lang_Integer_parse__String_trace_s33 db "aden.lang.Integer.parse(Integer.aden:104)"
adenc_aden_lang_Integer_parse__String_trace_s33_len equ 41
trace_m45 db "aden.lang.Integer.intValue"
trace_m45_len equ 26
adenc_aden_lang_Integer_intValue__Integer_trace_s0 db "aden.lang.Integer.intValue(Integer.aden:112)"
adenc_aden_lang_Integer_intValue__Integer_trace_s0_len equ 44
trace_m47 db "aden.lang.Integer.equals"
trace_m47_len equ 24
adenc_aden_lang_Integer_equals__int_int_trace_s0 db "aden.lang.Integer.equals(Integer.aden:120)"
adenc_aden_lang_Integer_equals__int_int_trace_s0_len equ 42
trace_m49 db "aden.lang.Integer.compare"
trace_m49_len equ 25
adenc_aden_lang_Integer_compare__int_int_trace_s0 db "aden.lang.Integer.compare(Integer.aden:128)"
adenc_aden_lang_Integer_compare__int_int_trace_s0_len equ 43
adenc_aden_lang_Integer_compare__int_int_trace_s1 db "aden.lang.Integer.compare(Integer.aden:129)"
adenc_aden_lang_Integer_compare__int_int_trace_s1_len equ 43
adenc_aden_lang_Integer_compare__int_int_trace_s2 db "aden.lang.Integer.compare(Integer.aden:131)"
adenc_aden_lang_Integer_compare__int_int_trace_s2_len equ 43
adenc_aden_lang_Integer_compare__int_int_trace_s3 db "aden.lang.Integer.compare(Integer.aden:132)"
adenc_aden_lang_Integer_compare__int_int_trace_s3_len equ 43
adenc_aden_lang_Integer_compare__int_int_trace_s4 db "aden.lang.Integer.compare(Integer.aden:134)"
adenc_aden_lang_Integer_compare__int_int_trace_s4_len equ 43
trace_m55 db "aden.lang.Integer.toString"
trace_m55_len equ 26
adenc_aden_lang_Integer_toString__int_trace_s0 db "aden.lang.Integer.toString(Integer.aden:142)"
adenc_aden_lang_Integer_toString__int_trace_s0_len equ 44
trace_m57 db "aden.lang.Integer.toHexString"
trace_m57_len equ 29
adenc_aden_lang_Integer_toHexString__int_trace_s0 db "aden.lang.Integer.toHexString(Integer.aden:150)"
adenc_aden_lang_Integer_toHexString__int_trace_s0_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s1 db "aden.lang.Integer.toHexString(Integer.aden:151)"
adenc_aden_lang_Integer_toHexString__int_trace_s1_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s2 db "aden.lang.Integer.toHexString(Integer.aden:154)"
adenc_aden_lang_Integer_toHexString__int_trace_s2_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s3 db "aden.lang.Integer.toHexString(Integer.aden:155)"
adenc_aden_lang_Integer_toHexString__int_trace_s3_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s4 db "aden.lang.Integer.toHexString(Integer.aden:156)"
adenc_aden_lang_Integer_toHexString__int_trace_s4_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s5 db "aden.lang.Integer.toHexString(Integer.aden:157)"
adenc_aden_lang_Integer_toHexString__int_trace_s5_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s6 db "aden.lang.Integer.toHexString(Integer.aden:158)"
adenc_aden_lang_Integer_toHexString__int_trace_s6_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s7 db "aden.lang.Integer.toHexString(Integer.aden:159)"
adenc_aden_lang_Integer_toHexString__int_trace_s7_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s8 db "aden.lang.Integer.toHexString(Integer.aden:160)"
adenc_aden_lang_Integer_toHexString__int_trace_s8_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s9 db "aden.lang.Integer.toHexString(Integer.aden:161)"
adenc_aden_lang_Integer_toHexString__int_trace_s9_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s10 db "aden.lang.Integer.toHexString(Integer.aden:162)"
adenc_aden_lang_Integer_toHexString__int_trace_s10_len equ 47
adenc_aden_lang_Integer_toHexString__int_trace_s11 db "aden.lang.Integer.toHexString(Integer.aden:164)"
adenc_aden_lang_Integer_toHexString__int_trace_s11_len equ 47
trace_m70 db "aden.lang.Integer.hashCode"
trace_m70_len equ 26
adenc_aden_lang_Integer_hashCode_trace_s0 db "aden.lang.Integer.hashCode(Integer.aden:172)"
adenc_aden_lang_Integer_hashCode_trace_s0_len equ 44
trace_m72 db "aden.lang.Integer.equals"
trace_m72_len equ 24
adenc_aden_lang_Integer_equals__Object_trace_s0 db "aden.lang.Integer.equals(Integer.aden:180)"
adenc_aden_lang_Integer_equals__Object_trace_s0_len equ 42
adenc_aden_lang_Integer_equals__Object_trace_s1 db "aden.lang.Integer.equals(Integer.aden:181)"
adenc_aden_lang_Integer_equals__Object_trace_s1_len equ 42
adenc_aden_lang_Integer_equals__Object_trace_s2 db "aden.lang.Integer.equals(Integer.aden:183)"
adenc_aden_lang_Integer_equals__Object_trace_s2_len equ 42
trace_m76 db "aden.lang.Integer.toString"
trace_m76_len equ 26
adenc_aden_lang_Integer_toString_trace_s0 db "aden.lang.Integer.toString(Integer.aden:191)"
adenc_aden_lang_Integer_toString_trace_s0_len equ 44
cidset_2 dd 23
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
adenc_fcap_aden_lang_Integer_ensure proc
    cmp ecx, 1
    jb adenc_fcap_aden_lang_Integer_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_aden_lang_Integer]
    jbe adenc_fcap_aden_lang_Integer_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_aden_lang_Integer]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_aden_lang_Integer_ensure_fail
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
    jz adenc_fcap_aden_lang_Integer_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    xor esi, esi
adenc_fcap_aden_lang_Integer_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_aden_lang_Integer_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_aden_lang_Integer_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_aden_lang_Integer_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_aden_lang_Integer_ensure_field_0_done_copy_loop
adenc_fcap_aden_lang_Integer_ensure_field_0_done:
    cmp dword ptr [adenc_fld_aden_lang_Integer_boxedValue_heap_owned], 0
    je adenc_fcap_aden_lang_Integer_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_aden_lang_Integer_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_aden_lang_Integer_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_aden_lang_Integer_boxedValue], r12
    mov dword ptr [adenc_fld_aden_lang_Integer_boxedValue_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_aden_lang_Integer], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_aden_lang_Integer_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_aden_lang_Integer_ensure_alloc_fail:
adenc_fcap_aden_lang_Integer_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_aden_lang_Integer_ensure endp

adenc_aden_lang_Integer_Integer__int proc
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
    mov dword ptr [rsp+72], edx
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_aden_lang_Integer_Integer__int_ctor_reuse
    mov ecx, 23
    call adenc_rt_objectNew
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_fcap_aden_lang_Integer_ensure
    mov rax, qword ptr [rsp+112]
    jmp adenc_aden_lang_Integer_Integer__int_ctor_ready
adenc_aden_lang_Integer_Integer__int_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_aden_lang_Integer_Integer__int_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Integer_Integer__int_b0:
    lea rcx, adenc_aden_lang_Integer_Integer__int_trace_s0
    mov edx, adenc_aden_lang_Integer_Integer__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp adenc_aden_lang_Integer_Integer__int_epilogue
adenc_aden_lang_Integer_Integer__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_lang_Integer_Integer__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_lang_Integer_Integer__int endp

adenc_aden_lang_Integer_valueOf__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
adenc_aden_lang_Integer_valueOf__int_b0:
    lea rcx, adenc_aden_lang_Integer_valueOf__int_trace_s0
    mov edx, adenc_aden_lang_Integer_valueOf__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp adenc_aden_lang_Integer_valueOf__int_epilogue
adenc_aden_lang_Integer_valueOf__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_valueOf__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Integer_valueOf__int endp

adenc_aden_lang_Integer_boxObject__int proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
adenc_aden_lang_Integer_boxObject__int_b0:
    lea rcx, adenc_aden_lang_Integer_boxObject__int_trace_s0
    mov edx, adenc_aden_lang_Integer_boxObject__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    xor ecx, ecx
    call adenc_aden_lang_Integer_Integer__int
    jmp adenc_aden_lang_Integer_boxObject__int_epilogue
adenc_aden_lang_Integer_boxObject__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_boxObject__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_Integer_boxObject__int endp

adenc_aden_lang_Integer_unboxBoxed__Integer proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Integer_unboxBoxed__Integer_b0:
    lea rcx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0
    mov edx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_unboxBoxed__Integer_b1
    jmp adenc_aden_lang_Integer_unboxBoxed__Integer_b2
adenc_aden_lang_Integer_unboxBoxed__Integer_b1:
    lea rcx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s1
    mov edx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0
    mov edx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_unboxBoxed__Integer_b3
adenc_aden_lang_Integer_unboxBoxed__Integer_b2:
    jmp adenc_aden_lang_Integer_unboxBoxed__Integer_b3
adenc_aden_lang_Integer_unboxBoxed__Integer_b3:
    lea rcx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s2
    mov edx, adenc_aden_lang_Integer_unboxBoxed__Integer_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_aden_lang_Integer_unboxBoxed__Integer_epilogue
adenc_aden_lang_Integer_unboxBoxed__Integer_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_lang_Integer_unboxBoxed__Integer_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_lang_Integer_unboxBoxed__Integer endp

adenc_aden_lang_Integer_parse__String proc
    sub rsp, 456
    mov qword ptr [rsp+424], rcx
    mov qword ptr [rsp+432], rdx
    mov qword ptr [rsp+440], r8
    mov qword ptr [rsp+448], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+424]
    mov rdx, qword ptr [rsp+432]
    mov r8, qword ptr [rsp+440]
    mov r9, qword ptr [rsp+448]
    mov qword ptr [rsp+136], rcx
adenc_aden_lang_Integer_parse__String_b0:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s0
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+144], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+144]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b1
    jmp adenc_aden_lang_Integer_parse__String_b2
adenc_aden_lang_Integer_parse__String_b1:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s1
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s0
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b3
adenc_aden_lang_Integer_parse__String_b2:
    jmp adenc_aden_lang_Integer_parse__String_b3
adenc_aden_lang_Integer_parse__String_b3:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s2
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+336], rax
    mov rcx, qword ptr [rsp+336]
    call adenc_aden_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s3
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b4
    jmp adenc_aden_lang_Integer_parse__String_b5
adenc_aden_lang_Integer_parse__String_b4:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s4
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s4_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s3
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s3_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b6
adenc_aden_lang_Integer_parse__String_b5:
    jmp adenc_aden_lang_Integer_parse__String_b6
adenc_aden_lang_Integer_parse__String_b6:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s5
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s6
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s7
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+160], eax
    call adenc_fget_aden_lang_Integer_MAX_VALUE
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    sub eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s8
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s9
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 45
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b7
    jmp adenc_aden_lang_Integer_parse__String_b8
adenc_aden_lang_Integer_parse__String_b7:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s10
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s11
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s11_len
    call adenc_rt_traceUpdateTop
    call adenc_fget_aden_lang_Integer_MIN_VALUE
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s12
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s12_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s9
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b9
adenc_aden_lang_Integer_parse__String_b8:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s13
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+176], eax
    mov eax, 43
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b10
    jmp adenc_aden_lang_Integer_parse__String_b11
adenc_aden_lang_Integer_parse__String_b9:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s15
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s15_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b13
    jmp adenc_aden_lang_Integer_parse__String_b14
adenc_aden_lang_Integer_parse__String_b10:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s14
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s14_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s13
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s13_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b12
adenc_aden_lang_Integer_parse__String_b11:
    jmp adenc_aden_lang_Integer_parse__String_b12
adenc_aden_lang_Integer_parse__String_b12:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s9
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s9_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b9
adenc_aden_lang_Integer_parse__String_b13:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s16
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s16_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s15
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s15_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b15
adenc_aden_lang_Integer_parse__String_b14:
    jmp adenc_aden_lang_Integer_parse__String_b15
adenc_aden_lang_Integer_parse__String_b15:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s17
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s17_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+192], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    mov ecx, edx
    cdq
    idiv ecx
    mov dword ptr [rsp+104], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s18
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s18_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+112], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s19
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b16
adenc_aden_lang_Integer_parse__String_b16:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b17
    jmp adenc_aden_lang_Integer_parse__String_b18
adenc_aden_lang_Integer_parse__String_b17:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s20
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s20_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s21
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s21_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_lang_Integer_parse__String_b19
    jmp adenc_aden_lang_Integer_parse__String_b20
adenc_aden_lang_Integer_parse__String_b18:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s31
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b28
    jmp adenc_aden_lang_Integer_parse__String_b29
adenc_aden_lang_Integer_parse__String_b19:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s22
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s22_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s21
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s21_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b21
adenc_aden_lang_Integer_parse__String_b20:
    jmp adenc_aden_lang_Integer_parse__String_b21
adenc_aden_lang_Integer_parse__String_b21:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s23
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s23_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+120]
    movzx eax, ax
    mov dword ptr [rsp+224], eax
    mov eax, 48
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+128], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s24
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+232], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_parse__String_b22
    jmp adenc_aden_lang_Integer_parse__String_b23
adenc_aden_lang_Integer_parse__String_b22:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s25
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s25_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s24
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s24_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b24
adenc_aden_lang_Integer_parse__String_b23:
    jmp adenc_aden_lang_Integer_parse__String_b24
adenc_aden_lang_Integer_parse__String_b24:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s26
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s26_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+240], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    imul eax, edx
    mov dword ptr [rsp+112], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s27
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s27_len
    call adenc_rt_traceUpdateTop
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
    jne adenc_aden_lang_Integer_parse__String_b25
    jmp adenc_aden_lang_Integer_parse__String_b26
adenc_aden_lang_Integer_parse__String_b25:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s28
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s28_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+288], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+288]
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+288]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+328]
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s27
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s27_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b27
adenc_aden_lang_Integer_parse__String_b26:
    jmp adenc_aden_lang_Integer_parse__String_b27
adenc_aden_lang_Integer_parse__String_b27:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s29
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s29_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+264], eax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    sub eax, edx
    mov dword ptr [rsp+112], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s30
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s30_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+272], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s19
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s19_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b16
adenc_aden_lang_Integer_parse__String_b28:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s32
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s32_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+112]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+288]
    mov ecx, eax
    call adenc_aden_lang_Integer_valueOf__int
    jmp adenc_aden_lang_Integer_parse__String_epilogue
adenc_aden_lang_Integer_parse__String_b29:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s31
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s31_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_parse__String_b30
adenc_aden_lang_Integer_parse__String_b30:
    lea rcx, adenc_aden_lang_Integer_parse__String_trace_s33
    mov edx, adenc_aden_lang_Integer_parse__String_trace_s33_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_Integer_valueOf__int
    jmp adenc_aden_lang_Integer_parse__String_epilogue
adenc_aden_lang_Integer_parse__String_epilogue:
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+328]
adenc_aden_lang_Integer_parse__String_epilogue_post:
    mov qword ptr [rsp+328], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+328]
    add rsp, 456
    ret
adenc_aden_lang_Integer_parse__String endp

adenc_aden_lang_Integer_intValue__Integer proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Integer_intValue__Integer_b0:
    lea rcx, adenc_aden_lang_Integer_intValue__Integer_trace_s0
    mov edx, adenc_aden_lang_Integer_intValue__Integer_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Integer_intValue__Integer_epilogue
adenc_aden_lang_Integer_intValue__Integer_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_intValue__Integer_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Integer_intValue__Integer endp

adenc_aden_lang_Integer_equals__int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
adenc_aden_lang_Integer_equals__int_int_b0:
    lea rcx, adenc_aden_lang_Integer_equals__int_int_trace_s0
    mov edx, adenc_aden_lang_Integer_equals__int_int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp adenc_aden_lang_Integer_equals__int_int_epilogue
adenc_aden_lang_Integer_equals__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Integer_equals__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Integer_equals__int_int endp

adenc_aden_lang_Integer_compare__int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
adenc_aden_lang_Integer_compare__int_int_b0:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s0
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_compare__int_int_b1
    jmp adenc_aden_lang_Integer_compare__int_int_b2
adenc_aden_lang_Integer_compare__int_int_b1:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s1
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp adenc_aden_lang_Integer_compare__int_int_epilogue
adenc_aden_lang_Integer_compare__int_int_b2:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s0
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_compare__int_int_b3
adenc_aden_lang_Integer_compare__int_int_b3:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s2
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_compare__int_int_b4
    jmp adenc_aden_lang_Integer_compare__int_int_b5
adenc_aden_lang_Integer_compare__int_int_b4:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s3
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_aden_lang_Integer_compare__int_int_epilogue
adenc_aden_lang_Integer_compare__int_int_b5:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s2
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_compare__int_int_b6
adenc_aden_lang_Integer_compare__int_int_b6:
    lea rcx, adenc_aden_lang_Integer_compare__int_int_trace_s4
    mov edx, adenc_aden_lang_Integer_compare__int_int_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_Integer_compare__int_int_epilogue
adenc_aden_lang_Integer_compare__int_int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
adenc_aden_lang_Integer_compare__int_int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
adenc_aden_lang_Integer_compare__int_int endp

adenc_aden_lang_Integer_toString__int proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
adenc_aden_lang_Integer_toString__int_b0:
    lea rcx, adenc_aden_lang_Integer_toString__int_trace_s0
    mov edx, adenc_aden_lang_Integer_toString__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call adenc_aden_lang_String_valueOf__int
    jmp adenc_aden_lang_Integer_toString__int_epilogue
adenc_aden_lang_Integer_toString__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_toString__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_Integer_toString__int endp

adenc_aden_lang_Integer_toHexString__int proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+104], ecx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
adenc_aden_lang_Integer_toHexString__int_b0:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s0
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_aden_lang_Integer_toHexString__int_b1
    jmp adenc_aden_lang_Integer_toHexString__int_b2
adenc_aden_lang_Integer_toHexString__int_b1:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s1
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    jmp adenc_aden_lang_Integer_toHexString__int_epilogue
adenc_aden_lang_Integer_toHexString__int_b2:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s0
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_toHexString__int_b3
adenc_aden_lang_Integer_toHexString__int_b3:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s2
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s2_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s3
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s3_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg9
    mov edx, msg9_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s4
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s5
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s6
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_toHexString__int_b4
adenc_aden_lang_Integer_toHexString__int_b4:
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
    jne adenc_aden_lang_Integer_toHexString__int_b5
    jmp adenc_aden_lang_Integer_toHexString__int_b6
adenc_aden_lang_Integer_toHexString__int_b5:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s7
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, 15
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    and eax, edx
    mov dword ptr [rsp+96], eax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s8
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    call adenc_aden_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov ecx, eax
    call adenc_aden_lang_String_valueOf__char
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s9
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 4
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    mov ecx, edx
    shr eax, cl
    mov dword ptr [rsp+80], eax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s10
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s10_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+88], eax
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s6
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s6_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_toHexString__int_b4
adenc_aden_lang_Integer_toHexString__int_b6:
    lea rcx, adenc_aden_lang_Integer_toHexString__int_trace_s11
    mov edx, adenc_aden_lang_Integer_toHexString__int_trace_s11_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_aden_lang_Integer_toHexString__int_epilogue
adenc_aden_lang_Integer_toHexString__int_epilogue:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
adenc_aden_lang_Integer_toHexString__int_epilogue_post:
    mov qword ptr [rsp+200], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 408
    ret
adenc_aden_lang_Integer_toHexString__int endp

adenc_aden_lang_Integer_hashCode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Integer_hashCode_b0:
    lea rcx, adenc_aden_lang_Integer_hashCode_trace_s0
    mov edx, adenc_aden_lang_Integer_hashCode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_aden_lang_Integer_hashCode_epilogue
adenc_aden_lang_Integer_hashCode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_hashCode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_lang_Integer_hashCode endp

adenc_aden_lang_Integer_equals__Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_lang_Integer_equals__Object_b0:
    lea rcx, adenc_aden_lang_Integer_equals__Object_trace_s0
    mov edx, adenc_aden_lang_Integer_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je Integer_equals_instof_0_1_false
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz Integer_equals_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call adenc_rt_classIdInSet
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
    jne adenc_aden_lang_Integer_equals__Object_b1
    jmp adenc_aden_lang_Integer_equals__Object_b2
adenc_aden_lang_Integer_equals__Object_b1:
    lea rcx, adenc_aden_lang_Integer_equals__Object_trace_s1
    mov edx, adenc_aden_lang_Integer_equals__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_aden_lang_Integer_equals__Object_epilogue
adenc_aden_lang_Integer_equals__Object_b2:
    lea rcx, adenc_aden_lang_Integer_equals__Object_trace_s0
    mov edx, adenc_aden_lang_Integer_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_aden_lang_Integer_equals__Object_b3
adenc_aden_lang_Integer_equals__Object_b3:
    lea rcx, adenc_aden_lang_Integer_equals__Object_trace_s2
    mov edx, adenc_aden_lang_Integer_equals__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je Integer_equals_cast_2_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz Integer_equals_cast_2_7_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz Integer_equals_cast_2_7_ok
Integer_equals_cast_2_7_fail:
    lea rcx, msg10
    mov edx, msg10_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    jmp adenc_aden_lang_Integer_equals__Object_epilogue
adenc_aden_lang_Integer_equals__Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
adenc_aden_lang_Integer_equals__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_lang_Integer_equals__Object endp

adenc_aden_lang_Integer_toString proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
adenc_aden_lang_Integer_toString_b0:
    lea rcx, adenc_aden_lang_Integer_toString_trace_s0
    mov edx, adenc_aden_lang_Integer_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_aden_lang_Integer_boxedValue]
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call adenc_aden_lang_Integer_toString__int
    jmp adenc_aden_lang_Integer_toString_epilogue
adenc_aden_lang_Integer_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_lang_Integer_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_lang_Integer_toString endp

adenc_fget_aden_lang_Integer_MIN_VALUE proc
    mov eax, dword ptr [adenc_fld_aden_lang_Integer_MIN_VALUE]
    ret
adenc_fget_aden_lang_Integer_MIN_VALUE endp

adenc_fset_aden_lang_Integer_MIN_VALUE proc
    mov dword ptr [adenc_fld_aden_lang_Integer_MIN_VALUE], ecx
    ret
adenc_fset_aden_lang_Integer_MIN_VALUE endp


adenc_fget_aden_lang_Integer_MAX_VALUE proc
    mov eax, dword ptr [adenc_fld_aden_lang_Integer_MAX_VALUE]
    ret
adenc_fget_aden_lang_Integer_MAX_VALUE endp

adenc_fset_aden_lang_Integer_MAX_VALUE proc
    mov dword ptr [adenc_fld_aden_lang_Integer_MAX_VALUE], ecx
    ret
adenc_fset_aden_lang_Integer_MAX_VALUE endp


end
