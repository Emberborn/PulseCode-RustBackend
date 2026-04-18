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
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_io_Path_resolve__String_String:proc
extrn pulsec_pulse_util_Objects_equals__Object_Object:proc
extrn pulsec_pulse_util_Objects_hashCode__Object:proc
extrn pulsec_pulse_util_Objects_requireNonNull__Object_String:proc
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

public pulsec_fld_author_build_BuildLayout_buildRoot
public pulsec_fld_author_build_BuildLayout_buildRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_asmRoot
public pulsec_fld_author_build_BuildLayout_asmRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_generatedRoot
public pulsec_fld_author_build_BuildLayout_generatedRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_assetsRoot
public pulsec_fld_author_build_BuildLayout_assetsRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_sanityRoot
public pulsec_fld_author_build_BuildLayout_sanityRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_tmpRoot
public pulsec_fld_author_build_BuildLayout_tmpRoot_heap_owned
public pulsec_fld_author_build_BuildLayout_distroRoot
public pulsec_fld_author_build_BuildLayout_distroRoot_heap_owned

extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_author_build_BuildLayout dd 0
pulsec_fcap_author_build_BuildLayout dd 63
pulsec_fld_author_build_BuildLayout_buildRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_buildRoot dq pulsec_fld_author_build_BuildLayout_buildRoot_tbl
pulsec_fld_author_build_BuildLayout_buildRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_asmRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_asmRoot dq pulsec_fld_author_build_BuildLayout_asmRoot_tbl
pulsec_fld_author_build_BuildLayout_asmRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_generatedRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_generatedRoot dq pulsec_fld_author_build_BuildLayout_generatedRoot_tbl
pulsec_fld_author_build_BuildLayout_generatedRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_assetsRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_assetsRoot dq pulsec_fld_author_build_BuildLayout_assetsRoot_tbl
pulsec_fld_author_build_BuildLayout_assetsRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_sanityRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_sanityRoot dq pulsec_fld_author_build_BuildLayout_sanityRoot_tbl
pulsec_fld_author_build_BuildLayout_sanityRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_tmpRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_tmpRoot dq pulsec_fld_author_build_BuildLayout_tmpRoot_tbl
pulsec_fld_author_build_BuildLayout_tmpRoot_heap_owned dd 0
pulsec_fld_author_build_BuildLayout_distroRoot_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildLayout_distroRoot dq pulsec_fld_author_build_BuildLayout_distroRoot_tbl
pulsec_fld_author_build_BuildLayout_distroRoot_heap_owned dd 0
trace_m0 db "author.build.BuildLayout.BuildLayout"
trace_m0_len equ 36
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s0 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:32)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s0_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s1 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:33)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s1_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s2 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:34)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s2_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s3 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:35)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s3_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s4 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:36)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s4_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s5 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:37)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s5_len equ 58
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s6 db "author.build.BuildLayout.BuildLayout(BuildLayout.pulse:38)"
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s6_len equ 58
trace_m8 db "author.build.BuildLayout.defaults"
trace_m8_len equ 33
pulsec_author_build_BuildLayout_defaults__String_trace_s0 db "author.build.BuildLayout.defaults(BuildLayout.pulse:45)"
pulsec_author_build_BuildLayout_defaults__String_trace_s0_len equ 55
pulsec_author_build_BuildLayout_defaults__String_trace_s1 db "author.build.BuildLayout.defaults(BuildLayout.pulse:46)"
pulsec_author_build_BuildLayout_defaults__String_trace_s1_len equ 55
pulsec_author_build_BuildLayout_defaults__String_trace_s2 db "author.build.BuildLayout.defaults(BuildLayout.pulse:47)"
pulsec_author_build_BuildLayout_defaults__String_trace_s2_len equ 55
trace_m12 db "author.build.BuildLayout.buildRoot"
trace_m12_len equ 34
pulsec_author_build_BuildLayout_buildRoot_trace_s0 db "author.build.BuildLayout.buildRoot(BuildLayout.pulse:62)"
pulsec_author_build_BuildLayout_buildRoot_trace_s0_len equ 56
trace_m14 db "author.build.BuildLayout.asmRoot"
trace_m14_len equ 32
pulsec_author_build_BuildLayout_asmRoot_trace_s0 db "author.build.BuildLayout.asmRoot(BuildLayout.pulse:69)"
pulsec_author_build_BuildLayout_asmRoot_trace_s0_len equ 54
trace_m16 db "author.build.BuildLayout.generatedRoot"
trace_m16_len equ 38
pulsec_author_build_BuildLayout_generatedRoot_trace_s0 db "author.build.BuildLayout.generatedRoot(BuildLayout.pulse:76)"
pulsec_author_build_BuildLayout_generatedRoot_trace_s0_len equ 60
trace_m18 db "author.build.BuildLayout.assetsRoot"
trace_m18_len equ 35
pulsec_author_build_BuildLayout_assetsRoot_trace_s0 db "author.build.BuildLayout.assetsRoot(BuildLayout.pulse:83)"
pulsec_author_build_BuildLayout_assetsRoot_trace_s0_len equ 57
trace_m20 db "author.build.BuildLayout.sanityRoot"
trace_m20_len equ 35
pulsec_author_build_BuildLayout_sanityRoot_trace_s0 db "author.build.BuildLayout.sanityRoot(BuildLayout.pulse:90)"
pulsec_author_build_BuildLayout_sanityRoot_trace_s0_len equ 57
trace_m22 db "author.build.BuildLayout.tmpRoot"
trace_m22_len equ 32
pulsec_author_build_BuildLayout_tmpRoot_trace_s0 db "author.build.BuildLayout.tmpRoot(BuildLayout.pulse:97)"
pulsec_author_build_BuildLayout_tmpRoot_trace_s0_len equ 54
trace_m24 db "author.build.BuildLayout.distroRoot"
trace_m24_len equ 35
pulsec_author_build_BuildLayout_distroRoot_trace_s0 db "author.build.BuildLayout.distroRoot(BuildLayout.pulse:104)"
pulsec_author_build_BuildLayout_distroRoot_trace_s0_len equ 58
trace_m26 db "author.build.BuildLayout.equals"
trace_m26_len equ 31
pulsec_author_build_BuildLayout_equals__Object_trace_s0 db "author.build.BuildLayout.equals(BuildLayout.pulse:111)"
pulsec_author_build_BuildLayout_equals__Object_trace_s0_len equ 54
pulsec_author_build_BuildLayout_equals__Object_trace_s1 db "author.build.BuildLayout.equals(BuildLayout.pulse:112)"
pulsec_author_build_BuildLayout_equals__Object_trace_s1_len equ 54
pulsec_author_build_BuildLayout_equals__Object_trace_s2 db "author.build.BuildLayout.equals(BuildLayout.pulse:114)"
pulsec_author_build_BuildLayout_equals__Object_trace_s2_len equ 54
pulsec_author_build_BuildLayout_equals__Object_trace_s3 db "author.build.BuildLayout.equals(BuildLayout.pulse:115)"
pulsec_author_build_BuildLayout_equals__Object_trace_s3_len equ 54
pulsec_author_build_BuildLayout_equals__Object_trace_s4 db "author.build.BuildLayout.equals(BuildLayout.pulse:117)"
pulsec_author_build_BuildLayout_equals__Object_trace_s4_len equ 54
pulsec_author_build_BuildLayout_equals__Object_trace_s5 db "author.build.BuildLayout.equals(BuildLayout.pulse:118)"
pulsec_author_build_BuildLayout_equals__Object_trace_s5_len equ 54
trace_m33 db "author.build.BuildLayout.hashCode"
trace_m33_len equ 33
pulsec_author_build_BuildLayout_hashCode_trace_s0 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:131)"
pulsec_author_build_BuildLayout_hashCode_trace_s0_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s1 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:132)"
pulsec_author_build_BuildLayout_hashCode_trace_s1_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s2 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:133)"
pulsec_author_build_BuildLayout_hashCode_trace_s2_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s3 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:134)"
pulsec_author_build_BuildLayout_hashCode_trace_s3_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s4 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:135)"
pulsec_author_build_BuildLayout_hashCode_trace_s4_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s5 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:136)"
pulsec_author_build_BuildLayout_hashCode_trace_s5_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s6 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:137)"
pulsec_author_build_BuildLayout_hashCode_trace_s6_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s7 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:138)"
pulsec_author_build_BuildLayout_hashCode_trace_s7_len equ 56
pulsec_author_build_BuildLayout_hashCode_trace_s8 db "author.build.BuildLayout.hashCode(BuildLayout.pulse:139)"
pulsec_author_build_BuildLayout_hashCode_trace_s8_len equ 56
trace_m43 db "author.build.BuildLayout.toString"
trace_m43_len equ 33
pulsec_author_build_BuildLayout_toString_trace_s0 db "author.build.BuildLayout.toString(BuildLayout.pulse:146)"
pulsec_author_build_BuildLayout_toString_trace_s0_len equ 56
cidset_4 dd 35
cidset_5 dd 1
    dd 2
    dd 3
    dd 4
    dd 5
    dd 6
    dd 9
    dd 10
    dd 11
    dd 19
    dd 22
    dd 24
    dd 25
    dd 26
    dd 27
    dd 28
    dd 31
    dd 32
    dd 33
    dd 34
    dd 35
    dd 36
    dd 37
    dd 38
    dd 39
    dd 40
    dd 41
cidset_6 dd 2
msg0 db "buildRoot must not be null"
msg0_len equ 26
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "asmRoot must not be null"
msg2_len equ 24
msg3 db "Invalid cast"
msg3_len equ 12
msg4 db "generatedRoot must not be null"
msg4_len equ 30
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "assetsRoot must not be null"
msg6_len equ 27
msg7 db "Invalid cast"
msg7_len equ 12
msg8 db "sanityRoot must not be null"
msg8_len equ 27
msg9 db "Invalid cast"
msg9_len equ 12
msg10 db "tmpRoot must not be null"
msg10_len equ 24
msg11 db "Invalid cast"
msg11_len equ 12
msg12 db "distroRoot must not be null"
msg12_len equ 27
msg13 db "Invalid cast"
msg13_len equ 12
msg14 db "projectRoot must not be null"
msg14_len equ 28
msg15 db "build"
msg15_len equ 5
msg16 db "build/asm"
msg16_len equ 9
msg17 db "build/generated"
msg17_len equ 15
msg18 db "build/assets"
msg18_len equ 12
msg19 db "build/sanity"
msg19_len equ 12
msg20 db "build/tmp"
msg20_len equ 9
msg21 db "distro"
msg21_len equ 6
msg22 db "Invalid cast"
msg22_len equ 12
msg23 db "Invalid cast"
msg23_len equ 12
msg24 db "BuildLayout[build="
msg24_len equ 18
msg25 db ", asm="
msg25_len equ 6
msg26 db ", generated="
msg26_len equ 12
msg27 db ", assets="
msg27_len equ 9
msg28 db ", sanity="
msg28_len equ 9
msg29 db ", tmp="
msg29_len equ 6
msg30 db ", distro="
msg30_len equ 9
msg31 db "]"
msg31_len equ 1

.code
pulsec_fcap_author_build_BuildLayout_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_author_build_BuildLayout]
    jbe pulsec_fcap_author_build_BuildLayout_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_author_build_BuildLayout]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_fail
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
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_buildRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_buildRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_asmRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_asmRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_3_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_3_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_3_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_4_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_4_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_4_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_5_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_5_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_5_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    xor esi, esi
pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildLayout_ensure_field_6_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_copy_loop
pulsec_fcap_author_build_BuildLayout_ensure_field_6_done:
    cmp dword ptr [pulsec_fld_author_build_BuildLayout_distroRoot_heap_owned], 0
    je pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildLayout_ensure_field_6_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot], r12
    mov dword ptr [pulsec_fld_author_build_BuildLayout_distroRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_author_build_BuildLayout], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_author_build_BuildLayout_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_author_build_BuildLayout_ensure_alloc_fail:
pulsec_fcap_author_build_BuildLayout_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_author_build_BuildLayout_ensure endp

pulsec_fcap_author_build_BuildLayout_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_2_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_3_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_4_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_5_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildLayout_arc_teardown_field_6_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildLayout_arc_teardown_field_6_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildLayout_arc_teardown_done:
    ret
pulsec_fcap_author_build_BuildLayout_arc_teardown endp
pulsec_fcap_author_build_BuildLayout_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_field_6_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildLayout_arc_scan_edges_done:
    ret
pulsec_fcap_author_build_BuildLayout_arc_scan_edges endp
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_field_6_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges_done:
    ret
pulsec_fcap_author_build_BuildLayout_arc_invalidate_edges endp
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+360]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_ctor_reuse
    mov ecx, 2
    call pulsec_rt_objectNew
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_fcap_author_build_BuildLayout_ensure
    mov rax, qword ptr [rsp+160]
    jmp pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_ctor_ready
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_b0:
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s0
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_0_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_0_7_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_0_7_ok
BuildLayout_BuildLayout_cast_0_7_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_0_7_done
BuildLayout_BuildLayout_cast_0_7_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_0_7_done
BuildLayout_BuildLayout_cast_0_7_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_0_7_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s1
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_1_15_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_1_15_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_1_15_ok
BuildLayout_BuildLayout_cast_1_15_fail:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_1_15_done
BuildLayout_BuildLayout_cast_1_15_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_1_15_done
BuildLayout_BuildLayout_cast_1_15_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_1_15_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s2
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_2_23_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_2_23_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_2_23_ok
BuildLayout_BuildLayout_cast_2_23_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_2_23_done
BuildLayout_BuildLayout_cast_2_23_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_2_23_done
BuildLayout_BuildLayout_cast_2_23_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_2_23_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s3
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_3_31_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_3_31_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_3_31_ok
BuildLayout_BuildLayout_cast_3_31_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_3_31_done
BuildLayout_BuildLayout_cast_3_31_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_3_31_done
BuildLayout_BuildLayout_cast_3_31_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_3_31_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s4
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_4_39_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_4_39_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_4_39_ok
BuildLayout_BuildLayout_cast_4_39_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_4_39_done
BuildLayout_BuildLayout_cast_4_39_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_4_39_done
BuildLayout_BuildLayout_cast_4_39_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_4_39_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s5
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_5_47_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_5_47_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_5_47_ok
BuildLayout_BuildLayout_cast_5_47_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_5_47_done
BuildLayout_BuildLayout_cast_5_47_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_5_47_done
BuildLayout_BuildLayout_cast_5_47_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_5_47_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s6
    mov edx, pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    test rax, rax
    je BuildLayout_BuildLayout_cast_6_55_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_BuildLayout_cast_6_55_fail
    mov ecx, edx
    lea rdx, cidset_4
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_BuildLayout_cast_6_55_ok
BuildLayout_BuildLayout_cast_6_55_fail:
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_6_55_done
BuildLayout_BuildLayout_cast_6_55_null:
    xor eax, eax
    jmp BuildLayout_BuildLayout_cast_6_55_done
BuildLayout_BuildLayout_cast_6_55_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_BuildLayout_cast_6_55_done:
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_epilogue
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_epilogue:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String endp

pulsec_author_build_BuildLayout_defaults__String proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+64], 0
pulsec_author_build_BuildLayout_defaults__String_b0:
    lea rcx, pulsec_author_build_BuildLayout_defaults__String_trace_s0
    mov edx, pulsec_author_build_BuildLayout_defaults__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_author_build_BuildLayout_defaults__String_trace_s1
    mov edx, pulsec_author_build_BuildLayout_defaults__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_author_build_BuildLayout_defaults__String_trace_s2
    mov edx, pulsec_author_build_BuildLayout_defaults__String_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+288], rax
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_pulse_io_Path_resolve__String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov rax, qword ptr [rsp+96]
    mov r9, rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+32], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+40], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+56], rax
    xor ecx, ecx
    call pulsec_author_build_BuildLayout_BuildLayout__String_String_String_String_String_String_String
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    jmp pulsec_author_build_BuildLayout_defaults__String_epilogue
pulsec_author_build_BuildLayout_defaults__String_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_author_build_BuildLayout_defaults__String_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 360
    ret
pulsec_author_build_BuildLayout_defaults__String endp

pulsec_author_build_BuildLayout_buildRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_buildRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_buildRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_buildRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_buildRoot_epilogue
pulsec_author_build_BuildLayout_buildRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_buildRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_buildRoot endp

pulsec_author_build_BuildLayout_asmRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_asmRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_asmRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_asmRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_asmRoot_epilogue
pulsec_author_build_BuildLayout_asmRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_asmRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_asmRoot endp

pulsec_author_build_BuildLayout_generatedRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_generatedRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_generatedRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_generatedRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_generatedRoot_epilogue
pulsec_author_build_BuildLayout_generatedRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_generatedRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_generatedRoot endp

pulsec_author_build_BuildLayout_assetsRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_assetsRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_assetsRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_assetsRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_assetsRoot_epilogue
pulsec_author_build_BuildLayout_assetsRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_assetsRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_assetsRoot endp

pulsec_author_build_BuildLayout_sanityRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_sanityRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_sanityRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_sanityRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_sanityRoot_epilogue
pulsec_author_build_BuildLayout_sanityRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_sanityRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_sanityRoot endp

pulsec_author_build_BuildLayout_tmpRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_tmpRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_tmpRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_tmpRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_tmpRoot_epilogue
pulsec_author_build_BuildLayout_tmpRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_tmpRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_tmpRoot endp

pulsec_author_build_BuildLayout_distroRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_distroRoot_b0:
    lea rcx, pulsec_author_build_BuildLayout_distroRoot_trace_s0
    mov edx, pulsec_author_build_BuildLayout_distroRoot_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildLayout_distroRoot_epilogue
pulsec_author_build_BuildLayout_distroRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_distroRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildLayout_distroRoot endp

pulsec_author_build_BuildLayout_equals__Object proc
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
    mov qword ptr [rsp+64], 0
pulsec_author_build_BuildLayout_equals__Object_b0:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s0
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je BuildLayout_equals_cast_0_1_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_equals_cast_0_1_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 27
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_equals_cast_0_1_ok
BuildLayout_equals_cast_0_1_fail:
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_equals_cast_0_1_done
BuildLayout_equals_cast_0_1_null:
    xor eax, eax
    jmp BuildLayout_equals_cast_0_1_done
BuildLayout_equals_cast_0_1_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_equals_cast_0_1_done:
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_author_build_BuildLayout_equals__Object_b1
    jmp pulsec_author_build_BuildLayout_equals__Object_b2
pulsec_author_build_BuildLayout_equals__Object_b1:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s1
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_author_build_BuildLayout_equals__Object_epilogue
pulsec_author_build_BuildLayout_equals__Object_b2:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s0
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_author_build_BuildLayout_equals__Object_b3
pulsec_author_build_BuildLayout_equals__Object_b3:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s2
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildLayout_equals_instof_2_6_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_equals_instof_2_6_false
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_equals_instof_2_6_true
BuildLayout_equals_instof_2_6_false:
    xor eax, eax
    jmp BuildLayout_equals_instof_2_6_done
BuildLayout_equals_instof_2_6_true:
    mov eax, 1
BuildLayout_equals_instof_2_6_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_author_build_BuildLayout_equals__Object_b4
    jmp pulsec_author_build_BuildLayout_equals__Object_b5
pulsec_author_build_BuildLayout_equals__Object_b4:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s3
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_author_build_BuildLayout_equals__Object_epilogue
pulsec_author_build_BuildLayout_equals__Object_b5:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s2
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_author_build_BuildLayout_equals__Object_b6
pulsec_author_build_BuildLayout_equals__Object_b6:
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s4
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildLayout_equals_cast_4_10_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildLayout_equals_cast_4_10_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildLayout_equals_cast_4_10_ok
BuildLayout_equals_cast_4_10_fail:
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildLayout_equals_cast_4_10_done
BuildLayout_equals_cast_4_10_null:
    xor eax, eax
    jmp BuildLayout_equals_cast_4_10_done
BuildLayout_equals_cast_4_10_ok:
    mov rax, qword ptr [rsp+40]
BuildLayout_equals_cast_4_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_author_build_BuildLayout_equals__Object_trace_s5
    mov edx, pulsec_author_build_BuildLayout_equals__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_26
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_26
BuildLayout_equals_ternary_then_5_26:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_26:
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_34
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_34
BuildLayout_equals_ternary_then_5_34:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_34:
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_42
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_42
BuildLayout_equals_ternary_then_5_42:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_42:
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_50
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_50
BuildLayout_equals_ternary_then_5_50:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_50:
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_58
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_58
BuildLayout_equals_ternary_then_5_58:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_58:
    test rax, rax
    jne BuildLayout_equals_ternary_then_5_66
    mov eax, 0
    jmp BuildLayout_equals_ternary_done_5_66
BuildLayout_equals_ternary_then_5_66:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call pulsec_pulse_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildLayout_equals_ternary_done_5_66:
    jmp pulsec_author_build_BuildLayout_equals__Object_epilogue
pulsec_author_build_BuildLayout_equals__Object_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_author_build_BuildLayout_equals__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_author_build_BuildLayout_equals__Object endp

pulsec_author_build_BuildLayout_hashCode proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+72], rcx
pulsec_author_build_BuildLayout_hashCode_b0:
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s0
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 17
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s1
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    imul eax, edx
    mov qword ptr [rsp+88], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s2
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    imul eax, edx
    mov qword ptr [rsp+104], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s3
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    imul eax, edx
    mov qword ptr [rsp+120], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s4
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    imul eax, edx
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s5
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    imul eax, edx
    mov qword ptr [rsp+152], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s6
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    imul eax, edx
    mov qword ptr [rsp+168], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+168]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s7
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    imul eax, edx
    mov qword ptr [rsp+184], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildLayout_hashCode_trace_s8
    mov edx, pulsec_author_build_BuildLayout_hashCode_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_author_build_BuildLayout_hashCode_epilogue
pulsec_author_build_BuildLayout_hashCode_epilogue:
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
pulsec_author_build_BuildLayout_hashCode_epilogue_post:
    mov qword ptr [rsp+232], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+232]
    add rsp, 360
    ret
pulsec_author_build_BuildLayout_hashCode endp

pulsec_author_build_BuildLayout_toString proc
    sub rsp, 760
    mov qword ptr [rsp+728], rcx
    mov qword ptr [rsp+736], rdx
    mov qword ptr [rsp+744], r8
    mov qword ptr [rsp+752], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+728]
    mov rdx, qword ptr [rsp+736]
    mov r8, qword ptr [rsp+744]
    mov r9, qword ptr [rsp+752]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildLayout_toString_b0:
    lea rcx, pulsec_author_build_BuildLayout_toString_trace_s0
    mov edx, pulsec_author_build_BuildLayout_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg24
    mov edx, msg24_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+640], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_buildRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+640]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+600], rax
    lea rcx, msg25
    mov edx, msg25_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+600]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+560], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_asmRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+560]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+520], rax
    lea rcx, msg26
    mov edx, msg26_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+520]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+480], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_generatedRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+480]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+440], rax
    lea rcx, msg27
    mov edx, msg27_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+440]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+400], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_assetsRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+400]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+360], rax
    lea rcx, msg28
    mov edx, msg28_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+360]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+320], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_sanityRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+320]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+280], rax
    lea rcx, msg29
    mov edx, msg29_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+280]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_tmpRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+200], rax
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+160], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildLayout_distroRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    lea rcx, msg31
    mov edx, msg31_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_author_build_BuildLayout_toString_epilogue
pulsec_author_build_BuildLayout_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildLayout_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 760
    ret
pulsec_author_build_BuildLayout_toString endp

end
