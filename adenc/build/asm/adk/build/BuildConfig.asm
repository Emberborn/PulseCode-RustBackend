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
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_valueOf__Object:proc
extrn adenc_aden_util_Objects_equals__Object_Object:proc
extrn adenc_aden_util_Objects_hashCode__Object:proc
extrn adenc_aden_util_Objects_requireNonNull__Object_String:proc
extrn adenc_adk_build_BuildLayout_defaults__String:proc
extrn adenc_adk_build_BuildLayout_toString:proc
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

public adenc_fld_adk_build_BuildConfig_layout
public adenc_fld_adk_build_BuildConfig_layout_heap_owned
public adenc_fld_adk_build_BuildConfig_profile
public adenc_fld_adk_build_BuildConfig_profile_heap_owned
public adenc_fld_adk_build_BuildConfig_target
public adenc_fld_adk_build_BuildConfig_target_heap_owned
public adenc_fld_adk_build_BuildConfig_outputMode
public adenc_fld_adk_build_BuildConfig_outputMode_heap_owned
public adenc_fld_adk_build_BuildConfig_outputEntry
public adenc_fld_adk_build_BuildConfig_outputEntry_heap_owned
public adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator
public adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_heap_owned
public adenc_fld_adk_build_BuildConfig_runtimeCycleCollector
public adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_heap_owned
public adenc_fld_adk_build_BuildConfig_outDir
public adenc_fld_adk_build_BuildConfig_outDir_heap_owned

extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_adk_build_BuildConfig dd 0
adenc_fcap_adk_build_BuildConfig dd 63
adenc_fld_adk_build_BuildConfig_layout_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_layout dq adenc_fld_adk_build_BuildConfig_layout_tbl
adenc_fld_adk_build_BuildConfig_layout_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_profile_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_profile dq adenc_fld_adk_build_BuildConfig_profile_tbl
adenc_fld_adk_build_BuildConfig_profile_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_target_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_target dq adenc_fld_adk_build_BuildConfig_target_tbl
adenc_fld_adk_build_BuildConfig_target_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_outputMode_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_outputMode dq adenc_fld_adk_build_BuildConfig_outputMode_tbl
adenc_fld_adk_build_BuildConfig_outputMode_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_outputEntry_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_outputEntry dq adenc_fld_adk_build_BuildConfig_outputEntry_tbl
adenc_fld_adk_build_BuildConfig_outputEntry_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator dq adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_tbl
adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_runtimeCycleCollector dq adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_tbl
adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_heap_owned dd 0
adenc_fld_adk_build_BuildConfig_outDir_tbl dq 64 dup(0)
adenc_fld_adk_build_BuildConfig_outDir dq adenc_fld_adk_build_BuildConfig_outDir_tbl
adenc_fld_adk_build_BuildConfig_outDir_heap_owned dd 0
trace_m0 db "adk.build.BuildConfig.BuildConfig"
trace_m0_len equ 33
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s0 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:33)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s0_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s1 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:34)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s1_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s2 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:35)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s2_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s3 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:36)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s3_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s4 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:37)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s4_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s5 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:38)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s5_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s6 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:39)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s6_len equ 54
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s7 db "adk.build.BuildConfig.BuildConfig(BuildConfig.aden:40)"
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s7_len equ 54
trace_m9 db "adk.build.BuildConfig.defaults"
trace_m9_len equ 30
adenc_adk_build_BuildConfig_defaults__String_trace_s0 db "adk.build.BuildConfig.defaults(BuildConfig.aden:47)"
adenc_adk_build_BuildConfig_defaults__String_trace_s0_len equ 51
trace_m11 db "adk.build.BuildConfig.layout"
trace_m11_len equ 28
adenc_adk_build_BuildConfig_layout_trace_s0 db "adk.build.BuildConfig.layout(BuildConfig.aden:59)"
adenc_adk_build_BuildConfig_layout_trace_s0_len equ 49
trace_m13 db "adk.build.BuildConfig.profile"
trace_m13_len equ 29
adenc_adk_build_BuildConfig_profile_trace_s0 db "adk.build.BuildConfig.profile(BuildConfig.aden:60)"
adenc_adk_build_BuildConfig_profile_trace_s0_len equ 50
trace_m15 db "adk.build.BuildConfig.target"
trace_m15_len equ 28
adenc_adk_build_BuildConfig_target_trace_s0 db "adk.build.BuildConfig.target(BuildConfig.aden:61)"
adenc_adk_build_BuildConfig_target_trace_s0_len equ 49
trace_m17 db "adk.build.BuildConfig.outputMode"
trace_m17_len equ 32
adenc_adk_build_BuildConfig_outputMode_trace_s0 db "adk.build.BuildConfig.outputMode(BuildConfig.aden:62)"
adenc_adk_build_BuildConfig_outputMode_trace_s0_len equ 53
trace_m19 db "adk.build.BuildConfig.outputEntry"
trace_m19_len equ 33
adenc_adk_build_BuildConfig_outputEntry_trace_s0 db "adk.build.BuildConfig.outputEntry(BuildConfig.aden:63)"
adenc_adk_build_BuildConfig_outputEntry_trace_s0_len equ 54
trace_m21 db "adk.build.BuildConfig.runtimeDebugAllocator"
trace_m21_len equ 43
adenc_adk_build_BuildConfig_runtimeDebugAllocator_trace_s0 db "adk.build.BuildConfig.runtimeDebugAllocator(BuildConfig.aden:64)"
adenc_adk_build_BuildConfig_runtimeDebugAllocator_trace_s0_len equ 64
trace_m23 db "adk.build.BuildConfig.runtimeCycleCollector"
trace_m23_len equ 43
adenc_adk_build_BuildConfig_runtimeCycleCollector_trace_s0 db "adk.build.BuildConfig.runtimeCycleCollector(BuildConfig.aden:65)"
adenc_adk_build_BuildConfig_runtimeCycleCollector_trace_s0_len equ 64
trace_m25 db "adk.build.BuildConfig.outDir"
trace_m25_len equ 28
adenc_adk_build_BuildConfig_outDir_trace_s0 db "adk.build.BuildConfig.outDir(BuildConfig.aden:66)"
adenc_adk_build_BuildConfig_outDir_trace_s0_len equ 49
trace_m27 db "adk.build.BuildConfig.equals"
trace_m27_len equ 28
adenc_adk_build_BuildConfig_equals__Object_trace_s0 db "adk.build.BuildConfig.equals(BuildConfig.aden:69)"
adenc_adk_build_BuildConfig_equals__Object_trace_s0_len equ 49
adenc_adk_build_BuildConfig_equals__Object_trace_s1 db "adk.build.BuildConfig.equals(BuildConfig.aden:70)"
adenc_adk_build_BuildConfig_equals__Object_trace_s1_len equ 49
adenc_adk_build_BuildConfig_equals__Object_trace_s2 db "adk.build.BuildConfig.equals(BuildConfig.aden:72)"
adenc_adk_build_BuildConfig_equals__Object_trace_s2_len equ 49
adenc_adk_build_BuildConfig_equals__Object_trace_s3 db "adk.build.BuildConfig.equals(BuildConfig.aden:73)"
adenc_adk_build_BuildConfig_equals__Object_trace_s3_len equ 49
adenc_adk_build_BuildConfig_equals__Object_trace_s4 db "adk.build.BuildConfig.equals(BuildConfig.aden:75)"
adenc_adk_build_BuildConfig_equals__Object_trace_s4_len equ 49
adenc_adk_build_BuildConfig_equals__Object_trace_s5 db "adk.build.BuildConfig.equals(BuildConfig.aden:76)"
adenc_adk_build_BuildConfig_equals__Object_trace_s5_len equ 49
trace_m34 db "adk.build.BuildConfig.hashCode"
trace_m34_len equ 30
adenc_adk_build_BuildConfig_hashCode_trace_s0 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:87)"
adenc_adk_build_BuildConfig_hashCode_trace_s0_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s1 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:88)"
adenc_adk_build_BuildConfig_hashCode_trace_s1_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s2 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:89)"
adenc_adk_build_BuildConfig_hashCode_trace_s2_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s3 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:90)"
adenc_adk_build_BuildConfig_hashCode_trace_s3_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s4 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:91)"
adenc_adk_build_BuildConfig_hashCode_trace_s4_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s5 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:92)"
adenc_adk_build_BuildConfig_hashCode_trace_s5_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s6 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:93)"
adenc_adk_build_BuildConfig_hashCode_trace_s6_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s7 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:94)"
adenc_adk_build_BuildConfig_hashCode_trace_s7_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s8 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:95)"
adenc_adk_build_BuildConfig_hashCode_trace_s8_len equ 51
adenc_adk_build_BuildConfig_hashCode_trace_s9 db "adk.build.BuildConfig.hashCode(BuildConfig.aden:96)"
adenc_adk_build_BuildConfig_hashCode_trace_s9_len equ 51
trace_m45 db "adk.build.BuildConfig.toString"
trace_m45_len equ 30
adenc_adk_build_BuildConfig_toString_trace_s0 db "adk.build.BuildConfig.toString(BuildConfig.aden:100)"
adenc_adk_build_BuildConfig_toString_trace_s0_len equ 52
cidset_5 dd 38
cidset_6 dd 30
cidset_7 dd 1
    dd 4
    dd 5
    dd 6
    dd 14
    dd 17
    dd 19
    dd 20
    dd 21
    dd 22
    dd 23
    dd 26
    dd 27
    dd 28
    dd 29
    dd 30
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
cidset_8 dd 37
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
adenc_fcap_adk_build_BuildConfig_ensure proc
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_adk_build_BuildConfig]
    jbe adenc_fcap_adk_build_BuildConfig_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_adk_build_BuildConfig]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_fail
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
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_0_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_layout_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_layout], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_layout_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_1_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_1_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_profile_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_1_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_profile], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_profile_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_2_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_2_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_target_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_2_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_target], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_target_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_3_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_3_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_outputMode_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_3_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_outputMode], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_outputMode_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_4_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_4_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_outputEntry_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_4_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_outputEntry_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_5_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_5_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_5_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_6_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_6_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_6_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    xor esi, esi
adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_build_BuildConfig_ensure_field_7_done
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_next:
    add esi, 1
    jmp adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_copy_loop
adenc_fcap_adk_build_BuildConfig_ensure_field_7_done:
    cmp dword ptr [adenc_fld_adk_build_BuildConfig_outDir_heap_owned], 0
    je adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_build_BuildConfig_ensure_field_7_done_commit:
    mov qword ptr [adenc_fld_adk_build_BuildConfig_outDir], r12
    mov dword ptr [adenc_fld_adk_build_BuildConfig_outDir_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_adk_build_BuildConfig], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_adk_build_BuildConfig_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_adk_build_BuildConfig_ensure_alloc_fail:
adenc_fcap_adk_build_BuildConfig_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_adk_build_BuildConfig_ensure endp

adenc_fcap_adk_build_BuildConfig_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_1_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_2_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_3_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_4_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_5_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_6_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_build_BuildConfig_arc_teardown_field_7_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_build_BuildConfig_arc_teardown_field_7_skip:
    add rsp, 40
adenc_fcap_adk_build_BuildConfig_arc_teardown_done:
    ret
adenc_fcap_adk_build_BuildConfig_arc_teardown endp
adenc_fcap_adk_build_BuildConfig_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_field_7_skip:
    add rsp, 40
adenc_fcap_adk_build_BuildConfig_arc_scan_edges_done:
    ret
adenc_fcap_adk_build_BuildConfig_arc_scan_edges endp
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_4_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_5_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_6_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_field_7_skip:
    add rsp, 40
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges_done:
    ret
adenc_fcap_adk_build_BuildConfig_arc_invalidate_edges endp
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072 proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
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
    jne adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_ctor_reuse
    mov ecx, 37
    call adenc_rt_objectNew
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call adenc_fcap_adk_build_BuildConfig_ensure
    mov rax, qword ptr [rsp+168]
    jmp adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_ctor_ready
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_b0:
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s0
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_0_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_0_7_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_0_7_ok
BuildConfig_BuildConfig_cast_0_7_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s1
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_1_15_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_1_15_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_1_15_ok
BuildConfig_BuildConfig_cast_1_15_fail:
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s2
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_2_23_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_2_23_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_2_23_ok
BuildConfig_BuildConfig_cast_2_23_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s3
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_3_31_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_3_31_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_3_31_ok
BuildConfig_BuildConfig_cast_3_31_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s4
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_4_39_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_4_39_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_4_39_ok
BuildConfig_BuildConfig_cast_4_39_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s5
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg10
    mov edx, msg10_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_5_47_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_5_47_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_5_47_ok
BuildConfig_BuildConfig_cast_5_47_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s6
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+232], rax
    lea rcx, msg12
    mov edx, msg12_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    test rax, rax
    je BuildConfig_BuildConfig_cast_6_55_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_BuildConfig_cast_6_55_fail
    mov ecx, edx
    lea rdx, cidset_6
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_BuildConfig_cast_6_55_ok
BuildConfig_BuildConfig_cast_6_55_fail:
    lea rcx, msg13
    mov edx, msg13_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s7
    mov edx, adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_epilogue
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_epilogue:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072_epilogue_post:
    mov qword ptr [rsp+176], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072 endp

adenc_adk_build_BuildConfig_defaults__String proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+72], rcx
adenc_adk_build_BuildConfig_defaults__String_b0:
    lea rcx, adenc_adk_build_BuildConfig_defaults__String_trace_s0
    mov edx, adenc_adk_build_BuildConfig_defaults__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_adk_build_BuildLayout_defaults__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    lea rcx, msg14
    mov edx, msg14_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    lea rcx, msg15
    mov edx, msg15_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    lea rcx, msg16
    mov edx, msg16_len
    call adenc_rt_stringFromBytes
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
    call adenc_rt_arcRetain
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
    call adenc_rt_stringFromBytes
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
    call adenc_rt_arcRetain
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
    call adenc_rt_stringFromBytes
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
    call adenc_rt_arcRetain
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
    call adenc_rt_stringFromBytes
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
    call adenc_rt_arcRetain
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
    call adenc_rt_arcRetain
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
    call adenc_adk_build_BuildConfig_BuildConfig__BuildLayout_String_String_String_Stri_hb4726db17b165072
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp adenc_adk_build_BuildConfig_defaults__String_epilogue
adenc_adk_build_BuildConfig_defaults__String_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
adenc_adk_build_BuildConfig_defaults__String_epilogue_post:
    mov qword ptr [rsp+152], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 392
    ret
adenc_adk_build_BuildConfig_defaults__String endp

adenc_adk_build_BuildConfig_layout proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_layout_b0:
    lea rcx, adenc_adk_build_BuildConfig_layout_trace_s0
    mov edx, adenc_adk_build_BuildConfig_layout_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_layout_epilogue
adenc_adk_build_BuildConfig_layout_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_layout_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_layout endp

adenc_adk_build_BuildConfig_profile proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_profile_b0:
    lea rcx, adenc_adk_build_BuildConfig_profile_trace_s0
    mov edx, adenc_adk_build_BuildConfig_profile_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_profile_epilogue
adenc_adk_build_BuildConfig_profile_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_profile_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_profile endp

adenc_adk_build_BuildConfig_target proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_target_b0:
    lea rcx, adenc_adk_build_BuildConfig_target_trace_s0
    mov edx, adenc_adk_build_BuildConfig_target_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_target_epilogue
adenc_adk_build_BuildConfig_target_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_target_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_target endp

adenc_adk_build_BuildConfig_outputMode proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_outputMode_b0:
    lea rcx, adenc_adk_build_BuildConfig_outputMode_trace_s0
    mov edx, adenc_adk_build_BuildConfig_outputMode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_outputMode_epilogue
adenc_adk_build_BuildConfig_outputMode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_outputMode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_outputMode endp

adenc_adk_build_BuildConfig_outputEntry proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_outputEntry_b0:
    lea rcx, adenc_adk_build_BuildConfig_outputEntry_trace_s0
    mov edx, adenc_adk_build_BuildConfig_outputEntry_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_outputEntry_epilogue
adenc_adk_build_BuildConfig_outputEntry_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_outputEntry_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_outputEntry endp

adenc_adk_build_BuildConfig_runtimeDebugAllocator proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_runtimeDebugAllocator_b0:
    lea rcx, adenc_adk_build_BuildConfig_runtimeDebugAllocator_trace_s0
    mov edx, adenc_adk_build_BuildConfig_runtimeDebugAllocator_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_runtimeDebugAllocator_epilogue
adenc_adk_build_BuildConfig_runtimeDebugAllocator_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_runtimeDebugAllocator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_runtimeDebugAllocator endp

adenc_adk_build_BuildConfig_runtimeCycleCollector proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_runtimeCycleCollector_b0:
    lea rcx, adenc_adk_build_BuildConfig_runtimeCycleCollector_trace_s0
    mov edx, adenc_adk_build_BuildConfig_runtimeCycleCollector_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_runtimeCycleCollector_epilogue
adenc_adk_build_BuildConfig_runtimeCycleCollector_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_runtimeCycleCollector_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_runtimeCycleCollector endp

adenc_adk_build_BuildConfig_outDir proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_outDir_b0:
    lea rcx, adenc_adk_build_BuildConfig_outDir_trace_s0
    mov edx, adenc_adk_build_BuildConfig_outDir_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_build_BuildConfig_outDir_epilogue
adenc_adk_build_BuildConfig_outDir_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_outDir_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_build_BuildConfig_outDir endp

adenc_adk_build_BuildConfig_equals__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
adenc_adk_build_BuildConfig_equals__Object_b0:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s0
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je BuildConfig_equals_cast_0_1_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_cast_0_1_fail
    mov ecx, edx
    lea rdx, cidset_7
    mov r8d, 27
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_equals_cast_0_1_ok
BuildConfig_equals_cast_0_1_fail:
    lea rcx, msg20
    mov edx, msg20_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    jne adenc_adk_build_BuildConfig_equals__Object_b1
    jmp adenc_adk_build_BuildConfig_equals__Object_b2
adenc_adk_build_BuildConfig_equals__Object_b1:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s1
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    jmp adenc_adk_build_BuildConfig_equals__Object_epilogue
adenc_adk_build_BuildConfig_equals__Object_b2:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s0
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_build_BuildConfig_equals__Object_b3
adenc_adk_build_BuildConfig_equals__Object_b3:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s2
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildConfig_equals_instof_2_6_false
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_instof_2_6_false
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call adenc_rt_classIdInSet
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
    jne adenc_adk_build_BuildConfig_equals__Object_b4
    jmp adenc_adk_build_BuildConfig_equals__Object_b5
adenc_adk_build_BuildConfig_equals__Object_b4:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s3
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_adk_build_BuildConfig_equals__Object_epilogue
adenc_adk_build_BuildConfig_equals__Object_b5:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s2
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_build_BuildConfig_equals__Object_b6
adenc_adk_build_BuildConfig_equals__Object_b6:
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s4
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je BuildConfig_equals_cast_4_10_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_equals_cast_4_10_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_equals_cast_4_10_ok
BuildConfig_equals_cast_4_10_fail:
    lea rcx, msg21
    mov edx, msg21_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_adk_build_BuildConfig_equals__Object_trace_s5
    mov edx, adenc_adk_build_BuildConfig_equals__Object_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    call adenc_aden_util_Objects_equals__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
BuildConfig_equals_ternary_done_5_74:
    jmp adenc_adk_build_BuildConfig_equals__Object_epilogue
adenc_adk_build_BuildConfig_equals__Object_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+136]
adenc_adk_build_BuildConfig_equals__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
adenc_adk_build_BuildConfig_equals__Object endp

adenc_adk_build_BuildConfig_hashCode proc
    sub rsp, 376
    mov qword ptr [rsp+344], rcx
    mov qword ptr [rsp+352], rdx
    mov qword ptr [rsp+360], r8
    mov qword ptr [rsp+368], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+344]
    mov rdx, qword ptr [rsp+352]
    mov r8, qword ptr [rsp+360]
    mov r9, qword ptr [rsp+368]
    mov qword ptr [rsp+72], rcx
adenc_adk_build_BuildConfig_hashCode_b0:
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s0
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 17
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s1
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s1_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s2
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s2_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s3
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s3_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s4
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s4_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s5
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s5_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s6
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s6_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+168]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s7
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s7_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+184]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s8
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s8_len
    call adenc_rt_traceUpdateTop
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
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_aden_util_Objects_hashCode__Object
    movsxd rax, eax
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+248]
    mov rdx, rax
    mov rax, qword ptr [rsp+200]
    add rax, rdx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_build_BuildConfig_hashCode_trace_s9
    mov edx, adenc_adk_build_BuildConfig_hashCode_trace_s9_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp adenc_adk_build_BuildConfig_hashCode_epilogue
adenc_adk_build_BuildConfig_hashCode_epilogue:
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+248]
adenc_adk_build_BuildConfig_hashCode_epilogue_post:
    mov qword ptr [rsp+248], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+248]
    add rsp, 376
    ret
adenc_adk_build_BuildConfig_hashCode endp

adenc_adk_build_BuildConfig_toString proc
    sub rsp, 872
    mov qword ptr [rsp+840], rcx
    mov qword ptr [rsp+848], rdx
    mov qword ptr [rsp+856], r8
    mov qword ptr [rsp+864], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+840]
    mov rdx, qword ptr [rsp+848]
    mov r8, qword ptr [rsp+856]
    mov r9, qword ptr [rsp+864]
    mov qword ptr [rsp+64], rcx
adenc_adk_build_BuildConfig_toString_b0:
    lea rcx, adenc_adk_build_BuildConfig_toString_trace_s0
    mov edx, adenc_adk_build_BuildConfig_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg22
    mov edx, msg22_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+720], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_layout]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+760], rax
    mov rcx, qword ptr [rsp+760]
    call adenc_adk_build_BuildLayout_toString
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+720]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+680], rax
    lea rcx, msg23
    mov edx, msg23_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+680]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+640], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_profile]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+640]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+600], rax
    lea rcx, msg24
    mov edx, msg24_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+600]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+560], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_target]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+560]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+520], rax
    lea rcx, msg25
    mov edx, msg25_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+520]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+480], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputMode]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+480]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+440], rax
    lea rcx, msg26
    mov edx, msg26_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+440]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+400], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outputEntry]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+400]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+360], rax
    lea rcx, msg27
    mov edx, msg27_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+360]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+320], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeDebugAllocator]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+320]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+280], rax
    lea rcx, msg28
    mov edx, msg28_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+280]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+240], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_runtimeCycleCollector]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+240]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+200], rax
    lea rcx, msg29
    mov edx, msg29_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+200]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+160], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_build_BuildConfig_outDir]
    mov rax, qword ptr [r10+rdx*8]
    test rax, rax
    je BuildConfig_toString_cast_0_57_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz BuildConfig_toString_cast_0_57_fail
    mov ecx, edx
    lea rdx, cidset_7
    mov r8d, 27
    call adenc_rt_classIdInSet
    test eax, eax
    jnz BuildConfig_toString_cast_0_57_ok
BuildConfig_toString_cast_0_57_fail:
    lea rcx, msg30
    mov edx, msg30_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
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
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_aden_lang_String_valueOf__Object
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+120], rax
    lea rcx, msg31
    mov edx, msg31_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    mov rcx, qword ptr [rsp+120]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp adenc_adk_build_BuildConfig_toString_epilogue
adenc_adk_build_BuildConfig_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_build_BuildConfig_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 872
    ret
adenc_adk_build_BuildConfig_toString endp

end
