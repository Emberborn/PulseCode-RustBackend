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
extrn pulsec_author_build_BuildLayout_defaults__String:proc
extrn pulsec_author_build_BuildLayout_toString:proc
extrn pulsec_pulse_lang_String_valueOf__Object:proc
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

public pulsec_fld_author_build_BuildConfig_layout
public pulsec_fld_author_build_BuildConfig_layout_heap_owned
public pulsec_fld_author_build_BuildConfig_profile
public pulsec_fld_author_build_BuildConfig_profile_heap_owned
public pulsec_fld_author_build_BuildConfig_target
public pulsec_fld_author_build_BuildConfig_target_heap_owned
public pulsec_fld_author_build_BuildConfig_outputMode
public pulsec_fld_author_build_BuildConfig_outputMode_heap_owned
public pulsec_fld_author_build_BuildConfig_outputEntry
public pulsec_fld_author_build_BuildConfig_outputEntry_heap_owned
public pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator
public pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_heap_owned
public pulsec_fld_author_build_BuildConfig_runtimeCycleCollector
public pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_heap_owned
public pulsec_fld_author_build_BuildConfig_outDir
public pulsec_fld_author_build_BuildConfig_outDir_heap_owned

extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_author_build_BuildConfig dd 0
pulsec_fcap_author_build_BuildConfig dd 63
pulsec_fld_author_build_BuildConfig_layout_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_layout dq pulsec_fld_author_build_BuildConfig_layout_tbl
pulsec_fld_author_build_BuildConfig_layout_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_profile_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_profile dq pulsec_fld_author_build_BuildConfig_profile_tbl
pulsec_fld_author_build_BuildConfig_profile_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_target_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_target dq pulsec_fld_author_build_BuildConfig_target_tbl
pulsec_fld_author_build_BuildConfig_target_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_outputMode_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_outputMode dq pulsec_fld_author_build_BuildConfig_outputMode_tbl
pulsec_fld_author_build_BuildConfig_outputMode_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_outputEntry_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_outputEntry dq pulsec_fld_author_build_BuildConfig_outputEntry_tbl
pulsec_fld_author_build_BuildConfig_outputEntry_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator dq pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_tbl
pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_runtimeCycleCollector dq pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_tbl
pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_heap_owned dd 0
pulsec_fld_author_build_BuildConfig_outDir_tbl dq 64 dup(0)
pulsec_fld_author_build_BuildConfig_outDir dq pulsec_fld_author_build_BuildConfig_outDir_tbl
pulsec_fld_author_build_BuildConfig_outDir_heap_owned dd 0
trace_m0 db "author.build.BuildConfig.BuildConfig"
trace_m0_len equ 36
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s0 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:33)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s0_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s1 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:34)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s1_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s2 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:35)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s2_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s3 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:36)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s3_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s4 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:37)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s4_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s5 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:38)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s5_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s6 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:39)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s6_len equ 58
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s7 db "author.build.BuildConfig.BuildConfig(BuildConfig.pulse:40)"
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s7_len equ 58
trace_m9 db "author.build.BuildConfig.defaults"
trace_m9_len equ 33
pulsec_author_build_BuildConfig_defaults__String_trace_s0 db "author.build.BuildConfig.defaults(BuildConfig.pulse:47)"
pulsec_author_build_BuildConfig_defaults__String_trace_s0_len equ 55
trace_m11 db "author.build.BuildConfig.layout"
trace_m11_len equ 31
pulsec_author_build_BuildConfig_layout_trace_s0 db "author.build.BuildConfig.layout(BuildConfig.pulse:59)"
pulsec_author_build_BuildConfig_layout_trace_s0_len equ 53
trace_m13 db "author.build.BuildConfig.profile"
trace_m13_len equ 32
pulsec_author_build_BuildConfig_profile_trace_s0 db "author.build.BuildConfig.profile(BuildConfig.pulse:60)"
pulsec_author_build_BuildConfig_profile_trace_s0_len equ 54
trace_m15 db "author.build.BuildConfig.target"
trace_m15_len equ 31
pulsec_author_build_BuildConfig_target_trace_s0 db "author.build.BuildConfig.target(BuildConfig.pulse:61)"
pulsec_author_build_BuildConfig_target_trace_s0_len equ 53
trace_m17 db "author.build.BuildConfig.outputMode"
trace_m17_len equ 35
pulsec_author_build_BuildConfig_outputMode_trace_s0 db "author.build.BuildConfig.outputMode(BuildConfig.pulse:62)"
pulsec_author_build_BuildConfig_outputMode_trace_s0_len equ 57
trace_m19 db "author.build.BuildConfig.outputEntry"
trace_m19_len equ 36
pulsec_author_build_BuildConfig_outputEntry_trace_s0 db "author.build.BuildConfig.outputEntry(BuildConfig.pulse:63)"
pulsec_author_build_BuildConfig_outputEntry_trace_s0_len equ 58
trace_m21 db "author.build.BuildConfig.runtimeDebugAllocator"
trace_m21_len equ 46
pulsec_author_build_BuildConfig_runtimeDebugAllocator_trace_s0 db 97, 117, 116, 104, 111, 114, 46, 98, 117, 105, 108, 100, 46, 66, 117, 105, 108, 100, 67, 111, 110, 102, 105, 103, 46, 114, 117, 110, 116, 105, 109, 101
    db 68, 101, 98, 117, 103, 65, 108, 108, 111, 99, 97, 116, 111, 114, 40, 66, 117, 105, 108, 100, 67, 111, 110, 102, 105, 103, 46, 112, 117, 108, 115, 101
    db 58, 54, 52, 41
pulsec_author_build_BuildConfig_runtimeDebugAllocator_trace_s0_len equ 68
trace_m23 db "author.build.BuildConfig.runtimeCycleCollector"
trace_m23_len equ 46
pulsec_author_build_BuildConfig_runtimeCycleCollector_trace_s0 db 97, 117, 116, 104, 111, 114, 46, 98, 117, 105, 108, 100, 46, 66, 117, 105, 108, 100, 67, 111, 110, 102, 105, 103, 46, 114, 117, 110, 116, 105, 109, 101
    db 67, 121, 99, 108, 101, 67, 111, 108, 108, 101, 99, 116, 111, 114, 40, 66, 117, 105, 108, 100, 67, 111, 110, 102, 105, 103, 46, 112, 117, 108, 115, 101
    db 58, 54, 53, 41
pulsec_author_build_BuildConfig_runtimeCycleCollector_trace_s0_len equ 68
trace_m25 db "author.build.BuildConfig.outDir"
trace_m25_len equ 31
pulsec_author_build_BuildConfig_outDir_trace_s0 db "author.build.BuildConfig.outDir(BuildConfig.pulse:66)"
pulsec_author_build_BuildConfig_outDir_trace_s0_len equ 53
trace_m27 db "author.build.BuildConfig.equals"
trace_m27_len equ 31
pulsec_author_build_BuildConfig_equals__Object_trace_s0 db "author.build.BuildConfig.equals(BuildConfig.pulse:69)"
pulsec_author_build_BuildConfig_equals__Object_trace_s0_len equ 53
pulsec_author_build_BuildConfig_equals__Object_trace_s1 db "author.build.BuildConfig.equals(BuildConfig.pulse:70)"
pulsec_author_build_BuildConfig_equals__Object_trace_s1_len equ 53
pulsec_author_build_BuildConfig_equals__Object_trace_s2 db "author.build.BuildConfig.equals(BuildConfig.pulse:72)"
pulsec_author_build_BuildConfig_equals__Object_trace_s2_len equ 53
pulsec_author_build_BuildConfig_equals__Object_trace_s3 db "author.build.BuildConfig.equals(BuildConfig.pulse:73)"
pulsec_author_build_BuildConfig_equals__Object_trace_s3_len equ 53
pulsec_author_build_BuildConfig_equals__Object_trace_s4 db "author.build.BuildConfig.equals(BuildConfig.pulse:75)"
pulsec_author_build_BuildConfig_equals__Object_trace_s4_len equ 53
pulsec_author_build_BuildConfig_equals__Object_trace_s5 db "author.build.BuildConfig.equals(BuildConfig.pulse:76)"
pulsec_author_build_BuildConfig_equals__Object_trace_s5_len equ 53
trace_m34 db "author.build.BuildConfig.hashCode"
trace_m34_len equ 33
pulsec_author_build_BuildConfig_hashCode_trace_s0 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:87)"
pulsec_author_build_BuildConfig_hashCode_trace_s0_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s1 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:88)"
pulsec_author_build_BuildConfig_hashCode_trace_s1_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s2 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:89)"
pulsec_author_build_BuildConfig_hashCode_trace_s2_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s3 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:90)"
pulsec_author_build_BuildConfig_hashCode_trace_s3_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s4 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:91)"
pulsec_author_build_BuildConfig_hashCode_trace_s4_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s5 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:92)"
pulsec_author_build_BuildConfig_hashCode_trace_s5_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s6 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:93)"
pulsec_author_build_BuildConfig_hashCode_trace_s6_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s7 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:94)"
pulsec_author_build_BuildConfig_hashCode_trace_s7_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s8 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:95)"
pulsec_author_build_BuildConfig_hashCode_trace_s8_len equ 55
pulsec_author_build_BuildConfig_hashCode_trace_s9 db "author.build.BuildConfig.hashCode(BuildConfig.pulse:96)"
pulsec_author_build_BuildConfig_hashCode_trace_s9_len equ 55
trace_m45 db "author.build.BuildConfig.toString"
trace_m45_len equ 33
pulsec_author_build_BuildConfig_toString_trace_s0 db "author.build.BuildConfig.toString(BuildConfig.pulse:100)"
pulsec_author_build_BuildConfig_toString_trace_s0_len equ 56
cidset_0 dd 2
cidset_1 dd 35
cidset_2 dd 1
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
cidset_3 dd 1
msg0 db "layout must not be null"
msg0_len equ 23
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "profile must not be null"
msg2_len equ 24
msg3 db "Invalid cast"
msg3_len equ 12
msg4 db "target must not be null"
msg4_len equ 23
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "outputMode must not be null"
msg6_len equ 27
msg7 db "Invalid cast"
msg7_len equ 12
msg8 db "outputEntry must not be null"
msg8_len equ 28
msg9 db "Invalid cast"
msg9_len equ 12
msg10 db "runtimeDebugAllocator must not be null"
msg10_len equ 38
msg11 db "Invalid cast"
msg11_len equ 12
msg12 db "runtimeCycleCollector must not be null"
msg12_len equ 38
msg13 db "Invalid cast"
msg13_len equ 12
msg14 db "release"
msg14_len equ 7
msg15 db "windows-x64"
msg15_len equ 11
msg16 db "fat"
msg16_len equ 3
msg17 db "main"
msg17_len equ 4
msg18 db "off"
msg18_len equ 3
msg19 db "on"
msg19_len equ 2
msg20 db "Invalid cast"
msg20_len equ 12
msg21 db "Invalid cast"
msg21_len equ 12
msg22 db "BuildConfig[layout="
msg22_len equ 19
msg23 db ", profile="
msg23_len equ 10
msg24 db ", target="
msg24_len equ 9
msg25 db ", outputMode="
msg25_len equ 13
msg26 db ", outputEntry="
msg26_len equ 14
msg27 db ", runtimeDebugAllocator="
msg27_len equ 24
msg28 db ", runtimeCycleCollector="
msg28_len equ 24
msg29 db ", outDir="
msg29_len equ 9
msg30 db "Invalid cast"
msg30_len equ 12
msg31 db "]"
msg31_len equ 1

.code
pulsec_fcap_author_build_BuildConfig_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_author_build_BuildConfig]
    jbe pulsec_fcap_author_build_BuildConfig_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_author_build_BuildConfig]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_fail
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
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_layout_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_layout], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_layout_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_profile_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_profile], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_profile_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_target_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_target], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_target_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_3_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_3_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_outputMode_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_3_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_outputMode], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_outputMode_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_4_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_4_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_outputEntry_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_4_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_outputEntry_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_5_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_5_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_5_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_6_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_6_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_6_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    xor esi, esi
pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_author_build_BuildConfig_ensure_field_7_done
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_next:
    add esi, 1
    jmp pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_copy_loop
pulsec_fcap_author_build_BuildConfig_ensure_field_7_done:
    cmp dword ptr [pulsec_fld_author_build_BuildConfig_outDir_heap_owned], 0
    je pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_commit
    test rbx, rbx
    jz pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_author_build_BuildConfig_ensure_field_7_done_commit:
    mov qword ptr [pulsec_fld_author_build_BuildConfig_outDir], r12
    mov dword ptr [pulsec_fld_author_build_BuildConfig_outDir_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_author_build_BuildConfig], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_author_build_BuildConfig_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_author_build_BuildConfig_ensure_alloc_fail:
pulsec_fcap_author_build_BuildConfig_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_author_build_BuildConfig_ensure endp

pulsec_fcap_author_build_BuildConfig_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_2_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_3_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_4_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_5_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_6_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_author_build_BuildConfig_arc_teardown_field_7_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_author_build_BuildConfig_arc_teardown_field_7_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildConfig_arc_teardown_done:
    ret
pulsec_fcap_author_build_BuildConfig_arc_teardown endp
pulsec_fcap_author_build_BuildConfig_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_field_7_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildConfig_arc_scan_edges_done:
    ret
pulsec_fcap_author_build_BuildConfig_arc_scan_edges endp
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_field_7_skip:
    add rsp, 40
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges_done:
    ret
pulsec_fcap_author_build_BuildConfig_arc_invalidate_edges endp
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38 proc
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
    mov rax, qword ptr [rsp+368]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_ctor_reuse
    mov ecx, 1
    call pulsec_rt_objectNew
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_fcap_author_build_BuildConfig_ensure
    mov rax, qword ptr [rsp+168]
    jmp pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_ctor_ready
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_b0:
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s0
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_0_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_0_7_fail
    mov ecx, edx
    lea rdx, cidset_0
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_0_7_ok
BuildConfig_BuildConfig_cast_0_7_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_0_7_done
BuildConfig_BuildConfig_cast_0_7_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_0_7_done
BuildConfig_BuildConfig_cast_0_7_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_0_7_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s1
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_1_15_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_1_15_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_1_15_ok
BuildConfig_BuildConfig_cast_1_15_fail:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_1_15_done
BuildConfig_BuildConfig_cast_1_15_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_1_15_done
BuildConfig_BuildConfig_cast_1_15_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_1_15_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s2
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_2_23_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_2_23_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_2_23_ok
BuildConfig_BuildConfig_cast_2_23_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_2_23_done
BuildConfig_BuildConfig_cast_2_23_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_2_23_done
BuildConfig_BuildConfig_cast_2_23_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_2_23_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s3
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_3_31_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_3_31_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_3_31_ok
BuildConfig_BuildConfig_cast_3_31_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_3_31_done
BuildConfig_BuildConfig_cast_3_31_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_3_31_done
BuildConfig_BuildConfig_cast_3_31_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_3_31_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s4
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_4_39_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_4_39_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_4_39_ok
BuildConfig_BuildConfig_cast_4_39_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_4_39_done
BuildConfig_BuildConfig_cast_4_39_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_4_39_done
BuildConfig_BuildConfig_cast_4_39_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_4_39_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s5
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_5_47_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_5_47_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_5_47_ok
BuildConfig_BuildConfig_cast_5_47_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_5_47_done
BuildConfig_BuildConfig_cast_5_47_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_5_47_done
BuildConfig_BuildConfig_cast_5_47_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_5_47_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s6
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call pulsec_pulse_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_6_55_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_6_55_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_6_55_ok
BuildConfig_BuildConfig_cast_6_55_fail:
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_6_55_done
BuildConfig_BuildConfig_cast_6_55_null:
    xor eax, eax
    jmp BuildConfig_BuildConfig_cast_6_55_done
BuildConfig_BuildConfig_cast_6_55_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_BuildConfig_cast_6_55_done:
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s7
    mov edx, pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_epilogue
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38 endp

pulsec_author_build_BuildConfig_defaults__String proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+72], rcx
pulsec_author_build_BuildConfig_defaults__String_b0:
    lea rcx, pulsec_author_build_BuildConfig_defaults__String_trace_s0
    mov edx, pulsec_author_build_BuildConfig_defaults__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_author_build_BuildLayout_defaults__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+264], rax
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+272], rax
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+280], rax
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+264], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+288], rax
    xor eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+264]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
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
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    xor ecx, ecx
    call pulsec_author_build_BuildConfig_BuildConfig__BuildLayout_String_String_String__hb3e3aba0c1ac2b38
    mov qword ptr [rsp+152], rax
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
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_author_build_BuildConfig_defaults__String_epilogue
pulsec_author_build_BuildConfig_defaults__String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
pulsec_author_build_BuildConfig_defaults__String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 392
    ret
pulsec_author_build_BuildConfig_defaults__String endp

pulsec_author_build_BuildConfig_layout proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_layout_b0:
    lea rcx, pulsec_author_build_BuildConfig_layout_trace_s0
    mov edx, pulsec_author_build_BuildConfig_layout_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_layout_epilogue
pulsec_author_build_BuildConfig_layout_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_layout_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_layout endp

pulsec_author_build_BuildConfig_profile proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_profile_b0:
    lea rcx, pulsec_author_build_BuildConfig_profile_trace_s0
    mov edx, pulsec_author_build_BuildConfig_profile_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_profile_epilogue
pulsec_author_build_BuildConfig_profile_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_profile_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_profile endp

pulsec_author_build_BuildConfig_target proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_target_b0:
    lea rcx, pulsec_author_build_BuildConfig_target_trace_s0
    mov edx, pulsec_author_build_BuildConfig_target_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_target_epilogue
pulsec_author_build_BuildConfig_target_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_target_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_target endp

pulsec_author_build_BuildConfig_outputMode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_outputMode_b0:
    lea rcx, pulsec_author_build_BuildConfig_outputMode_trace_s0
    mov edx, pulsec_author_build_BuildConfig_outputMode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_outputMode_epilogue
pulsec_author_build_BuildConfig_outputMode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_outputMode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_outputMode endp

pulsec_author_build_BuildConfig_outputEntry proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_outputEntry_b0:
    lea rcx, pulsec_author_build_BuildConfig_outputEntry_trace_s0
    mov edx, pulsec_author_build_BuildConfig_outputEntry_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_outputEntry_epilogue
pulsec_author_build_BuildConfig_outputEntry_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_outputEntry_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_outputEntry endp

pulsec_author_build_BuildConfig_runtimeDebugAllocator proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_runtimeDebugAllocator_b0:
    lea rcx, pulsec_author_build_BuildConfig_runtimeDebugAllocator_trace_s0
    mov edx, pulsec_author_build_BuildConfig_runtimeDebugAllocator_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_runtimeDebugAllocator_epilogue
pulsec_author_build_BuildConfig_runtimeDebugAllocator_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_runtimeDebugAllocator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_runtimeDebugAllocator endp

pulsec_author_build_BuildConfig_runtimeCycleCollector proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_runtimeCycleCollector_b0:
    lea rcx, pulsec_author_build_BuildConfig_runtimeCycleCollector_trace_s0
    mov edx, pulsec_author_build_BuildConfig_runtimeCycleCollector_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_runtimeCycleCollector_epilogue
pulsec_author_build_BuildConfig_runtimeCycleCollector_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_runtimeCycleCollector_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_runtimeCycleCollector endp

pulsec_author_build_BuildConfig_outDir proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_outDir_b0:
    lea rcx, pulsec_author_build_BuildConfig_outDir_trace_s0
    mov edx, pulsec_author_build_BuildConfig_outDir_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_author_build_BuildConfig_outDir_epilogue
pulsec_author_build_BuildConfig_outDir_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_outDir_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_author_build_BuildConfig_outDir endp

pulsec_author_build_BuildConfig_equals__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_author_build_BuildConfig_equals__Object_b0:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s0
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je BuildConfig_equals_cast_0_1_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_cast_0_1_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 27
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_equals_cast_0_1_ok
BuildConfig_equals_cast_0_1_fail:
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_equals_cast_0_1_done
BuildConfig_equals_cast_0_1_null:
    xor eax, eax
    jmp BuildConfig_equals_cast_0_1_done
BuildConfig_equals_cast_0_1_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_equals_cast_0_1_done:
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_author_build_BuildConfig_equals__Object_b1
    jmp pulsec_author_build_BuildConfig_equals__Object_b2
pulsec_author_build_BuildConfig_equals__Object_b1:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s1
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_author_build_BuildConfig_equals__Object_epilogue
pulsec_author_build_BuildConfig_equals__Object_b2:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s0
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_author_build_BuildConfig_equals__Object_b3
pulsec_author_build_BuildConfig_equals__Object_b3:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s2
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildConfig_equals_instof_2_6_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_instof_2_6_false
    mov ecx, edx
    lea rdx, cidset_3
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_equals_instof_2_6_true
BuildConfig_equals_instof_2_6_false:
    xor eax, eax
    jmp BuildConfig_equals_instof_2_6_done
BuildConfig_equals_instof_2_6_true:
    mov eax, 1
BuildConfig_equals_instof_2_6_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_author_build_BuildConfig_equals__Object_b4
    jmp pulsec_author_build_BuildConfig_equals__Object_b5
pulsec_author_build_BuildConfig_equals__Object_b4:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s3
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_author_build_BuildConfig_equals__Object_epilogue
pulsec_author_build_BuildConfig_equals__Object_b5:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s2
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_author_build_BuildConfig_equals__Object_b6
pulsec_author_build_BuildConfig_equals__Object_b6:
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s4
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildConfig_equals_cast_4_10_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_cast_4_10_fail
    mov ecx, edx
    lea rdx, cidset_3
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_equals_cast_4_10_ok
BuildConfig_equals_cast_4_10_fail:
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_equals_cast_4_10_done
BuildConfig_equals_cast_4_10_null:
    xor eax, eax
    jmp BuildConfig_equals_cast_4_10_done
BuildConfig_equals_cast_4_10_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_equals_cast_4_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_author_build_BuildConfig_equals__Object_trace_s5
    mov edx, pulsec_author_build_BuildConfig_equals__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
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
    jne BuildConfig_equals_ternary_then_5_26
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_26
BuildConfig_equals_ternary_then_5_26:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
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
BuildConfig_equals_ternary_done_5_26:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_34
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_34
BuildConfig_equals_ternary_then_5_34:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
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
BuildConfig_equals_ternary_done_5_34:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_42
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_42
BuildConfig_equals_ternary_then_5_42:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
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
BuildConfig_equals_ternary_done_5_42:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_50
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_50
BuildConfig_equals_ternary_then_5_50:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
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
BuildConfig_equals_ternary_done_5_50:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_58
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_58
BuildConfig_equals_ternary_then_5_58:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
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
BuildConfig_equals_ternary_done_5_58:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_66
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_66
BuildConfig_equals_ternary_then_5_66:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
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
BuildConfig_equals_ternary_done_5_66:
    test rax, rax
    jne BuildConfig_equals_ternary_then_5_74
    mov eax, 0
    jmp BuildConfig_equals_ternary_done_5_74
BuildConfig_equals_ternary_then_5_74:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
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
BuildConfig_equals_ternary_done_5_74:
    jmp pulsec_author_build_BuildConfig_equals__Object_epilogue
pulsec_author_build_BuildConfig_equals__Object_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_author_build_BuildConfig_equals__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_author_build_BuildConfig_equals__Object endp

pulsec_author_build_BuildConfig_hashCode proc
    sub rsp, 376
    mov qword ptr [rsp+344], rcx
    mov qword ptr [rsp+352], rdx
    mov qword ptr [rsp+360], r8
    mov qword ptr [rsp+368], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+344]
    mov rdx, qword ptr [rsp+352]
    mov r8, qword ptr [rsp+360]
    mov r9, qword ptr [rsp+368]
    mov qword ptr [rsp+72], rcx
pulsec_author_build_BuildConfig_hashCode_b0:
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s0
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 17
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s1
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s1_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s2
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s2_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s3
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s3_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s4
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s4_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s5
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s5_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s6
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s6_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+168]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s7
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s7_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s8
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    imul eax, edx
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_pulse_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+200]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_author_build_BuildConfig_hashCode_trace_s9
    mov edx, pulsec_author_build_BuildConfig_hashCode_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_author_build_BuildConfig_hashCode_epilogue
pulsec_author_build_BuildConfig_hashCode_epilogue:
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
pulsec_author_build_BuildConfig_hashCode_epilogue_post:
    mov qword ptr [rsp+248], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+248]
    add rsp, 376
    ret
pulsec_author_build_BuildConfig_hashCode endp

pulsec_author_build_BuildConfig_toString proc
    sub rsp, 872
    mov qword ptr [rsp+840], rcx
    mov qword ptr [rsp+848], rdx
    mov qword ptr [rsp+856], r8
    mov qword ptr [rsp+864], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+840]
    mov rdx, qword ptr [rsp+848]
    mov r8, qword ptr [rsp+856]
    mov r9, qword ptr [rsp+864]
    mov qword ptr [rsp+64], rcx
pulsec_author_build_BuildConfig_toString_b0:
    lea rcx, pulsec_author_build_BuildConfig_toString_trace_s0
    mov edx, pulsec_author_build_BuildConfig_toString_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+720], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+760], rax
    mov rcx, qword ptr [rsp+760]
    call pulsec_author_build_BuildLayout_toString
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+720]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+680], rax
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+680]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+640], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_profile]
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
    lea rcx, msg24
    mov edx, msg24_len
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_target]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputMode]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outputEntry]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeDebugAllocator]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_runtimeCycleCollector]
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
    mov r10, qword ptr [pulsec_fld_author_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    test rax, rax
    je BuildConfig_toString_cast_0_57_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_toString_cast_0_57_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 27
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_toString_cast_0_57_ok
BuildConfig_toString_cast_0_57_fail:
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp BuildConfig_toString_cast_0_57_done
BuildConfig_toString_cast_0_57_null:
    xor eax, eax
    jmp BuildConfig_toString_cast_0_57_done
BuildConfig_toString_cast_0_57_ok:
    mov rax, qword ptr [rsp+40]
BuildConfig_toString_cast_0_57_done:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__Object
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+72], rax
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
    jmp pulsec_author_build_BuildConfig_toString_epilogue
pulsec_author_build_BuildConfig_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_author_build_BuildConfig_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 872
    ret
pulsec_author_build_BuildConfig_toString endp

end
