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
extrn adenc_aden_util_Objects_requireNonNull__Object_String:proc
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

public adenc_fld_adk_compiler_CheckResult_success
public adenc_fld_adk_compiler_CheckResult_success_heap_owned
public adenc_fld_adk_compiler_CheckResult_packageName
public adenc_fld_adk_compiler_CheckResult_packageName_heap_owned
public adenc_fld_adk_compiler_CheckResult_importCount
public adenc_fld_adk_compiler_CheckResult_importCount_heap_owned
public adenc_fld_adk_compiler_CheckResult_classCount
public adenc_fld_adk_compiler_CheckResult_classCount_heap_owned
public adenc_fld_adk_compiler_CheckResult_filesLoaded
public adenc_fld_adk_compiler_CheckResult_filesLoaded_heap_owned
public adenc_fld_adk_compiler_CheckResult_mode
public adenc_fld_adk_compiler_CheckResult_mode_heap_owned
public adenc_fld_adk_compiler_CheckResult_projectMode
public adenc_fld_adk_compiler_CheckResult_projectMode_heap_owned
public adenc_fld_adk_compiler_CheckResult_entryPath
public adenc_fld_adk_compiler_CheckResult_entryPath_heap_owned
public adenc_fld_adk_compiler_CheckResult_sourceRoot
public adenc_fld_adk_compiler_CheckResult_sourceRoot_heap_owned

.data
written dq 0
adenc_objc_adk_compiler_CheckResult dd 0
adenc_fcap_adk_compiler_CheckResult dd 63
adenc_fld_adk_compiler_CheckResult_success_tbl dd 64 dup(0)
adenc_fld_adk_compiler_CheckResult_success dq adenc_fld_adk_compiler_CheckResult_success_tbl
adenc_fld_adk_compiler_CheckResult_success_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_packageName_tbl dq 64 dup(0)
adenc_fld_adk_compiler_CheckResult_packageName dq adenc_fld_adk_compiler_CheckResult_packageName_tbl
adenc_fld_adk_compiler_CheckResult_packageName_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_importCount_tbl dd 64 dup(0)
adenc_fld_adk_compiler_CheckResult_importCount dq adenc_fld_adk_compiler_CheckResult_importCount_tbl
adenc_fld_adk_compiler_CheckResult_importCount_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_classCount_tbl dd 64 dup(0)
adenc_fld_adk_compiler_CheckResult_classCount dq adenc_fld_adk_compiler_CheckResult_classCount_tbl
adenc_fld_adk_compiler_CheckResult_classCount_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_filesLoaded_tbl dd 64 dup(0)
adenc_fld_adk_compiler_CheckResult_filesLoaded dq adenc_fld_adk_compiler_CheckResult_filesLoaded_tbl
adenc_fld_adk_compiler_CheckResult_filesLoaded_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_mode_tbl dq 64 dup(0)
adenc_fld_adk_compiler_CheckResult_mode dq adenc_fld_adk_compiler_CheckResult_mode_tbl
adenc_fld_adk_compiler_CheckResult_mode_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_projectMode_tbl dq 64 dup(0)
adenc_fld_adk_compiler_CheckResult_projectMode dq adenc_fld_adk_compiler_CheckResult_projectMode_tbl
adenc_fld_adk_compiler_CheckResult_projectMode_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_entryPath_tbl dq 64 dup(0)
adenc_fld_adk_compiler_CheckResult_entryPath dq adenc_fld_adk_compiler_CheckResult_entryPath_tbl
adenc_fld_adk_compiler_CheckResult_entryPath_heap_owned dd 0
adenc_fld_adk_compiler_CheckResult_sourceRoot_tbl dq 64 dup(0)
adenc_fld_adk_compiler_CheckResult_sourceRoot dq adenc_fld_adk_compiler_CheckResult_sourceRoot_tbl
adenc_fld_adk_compiler_CheckResult_sourceRoot_heap_owned dd 0
trace_m0 db "adk.compiler.CheckResult.CheckResult"
trace_m0_len equ 36
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s0 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:30)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s0_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s1 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:31)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s1_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s2 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:32)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s2_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s3 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:33)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s3_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s4 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:34)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s4_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s5 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:35)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s5_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s6 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:36)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s6_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s7 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:37)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s7_len equ 57
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s8 db "adk.compiler.CheckResult.CheckResult(CheckResult.aden:38)"
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s8_len equ 57
trace_m10 db "adk.compiler.CheckResult.success"
trace_m10_len equ 32
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_trace_s0 db "adk.compiler.CheckResult.success(CheckResult.aden:51)"
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_trace_s0_len equ 53
trace_m12 db "adk.compiler.CheckResult.failure"
trace_m12_len equ 32
adenc_adk_compiler_CheckResult_failure__String_String_String_trace_s0 db "adk.compiler.CheckResult.failure(CheckResult.aden:65)"
adenc_adk_compiler_CheckResult_failure__String_String_String_trace_s0_len equ 53
trace_m14 db "adk.compiler.CheckResult.success"
trace_m14_len equ 32
adenc_adk_compiler_CheckResult_success_trace_s0 db "adk.compiler.CheckResult.success(CheckResult.aden:68)"
adenc_adk_compiler_CheckResult_success_trace_s0_len equ 53
trace_m16 db "adk.compiler.CheckResult.packageName"
trace_m16_len equ 36
adenc_adk_compiler_CheckResult_packageName_trace_s0 db "adk.compiler.CheckResult.packageName(CheckResult.aden:69)"
adenc_adk_compiler_CheckResult_packageName_trace_s0_len equ 57
trace_m18 db "adk.compiler.CheckResult.importCount"
trace_m18_len equ 36
adenc_adk_compiler_CheckResult_importCount_trace_s0 db "adk.compiler.CheckResult.importCount(CheckResult.aden:70)"
adenc_adk_compiler_CheckResult_importCount_trace_s0_len equ 57
trace_m20 db "adk.compiler.CheckResult.classCount"
trace_m20_len equ 35
adenc_adk_compiler_CheckResult_classCount_trace_s0 db "adk.compiler.CheckResult.classCount(CheckResult.aden:71)"
adenc_adk_compiler_CheckResult_classCount_trace_s0_len equ 56
trace_m22 db "adk.compiler.CheckResult.filesLoaded"
trace_m22_len equ 36
adenc_adk_compiler_CheckResult_filesLoaded_trace_s0 db "adk.compiler.CheckResult.filesLoaded(CheckResult.aden:72)"
adenc_adk_compiler_CheckResult_filesLoaded_trace_s0_len equ 57
trace_m24 db "adk.compiler.CheckResult.mode"
trace_m24_len equ 29
adenc_adk_compiler_CheckResult_mode_trace_s0 db "adk.compiler.CheckResult.mode(CheckResult.aden:73)"
adenc_adk_compiler_CheckResult_mode_trace_s0_len equ 50
trace_m26 db "adk.compiler.CheckResult.projectMode"
trace_m26_len equ 36
adenc_adk_compiler_CheckResult_projectMode_trace_s0 db "adk.compiler.CheckResult.projectMode(CheckResult.aden:74)"
adenc_adk_compiler_CheckResult_projectMode_trace_s0_len equ 57
trace_m28 db "adk.compiler.CheckResult.entryPath"
trace_m28_len equ 34
adenc_adk_compiler_CheckResult_entryPath_trace_s0 db "adk.compiler.CheckResult.entryPath(CheckResult.aden:75)"
adenc_adk_compiler_CheckResult_entryPath_trace_s0_len equ 55
trace_m30 db "adk.compiler.CheckResult.sourceRoot"
trace_m30_len equ 35
adenc_adk_compiler_CheckResult_sourceRoot_trace_s0 db "adk.compiler.CheckResult.sourceRoot(CheckResult.aden:76)"
adenc_adk_compiler_CheckResult_sourceRoot_trace_s0_len equ 56
cidset_12 dd 30
msg0 db "mode must not be null"
msg0_len equ 21
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "entryPath must not be null"
msg2_len equ 26
msg3 db "Invalid cast"
msg3_len equ 12
msg4 db "sourceRoot must not be null"
msg4_len equ 27
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "packageName must not be null"
msg6_len equ 28
msg7 db "Invalid cast"
msg7_len equ 12
msg8 db "projectMode must not be null"
msg8_len equ 28
msg9 db "Invalid cast"
msg9_len equ 12

.code
adenc_fcap_adk_compiler_CheckResult_ensure proc
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_adk_compiler_CheckResult]
    jbe adenc_fcap_adk_compiler_CheckResult_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_adk_compiler_CheckResult]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_fail
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
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_success]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_success_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_success], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_success_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_packageName_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_1_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_packageName], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_packageName_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_importCount]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_importCount_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_2_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_importCount], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_importCount_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_classCount]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_classCount_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_3_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_classCount], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_classCount_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_4_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_mode_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_5_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_mode], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_mode_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_projectMode_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_6_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_projectMode_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_entryPath_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_7_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_entryPath_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    xor esi, esi
adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_next:
    add esi, 1
    jmp adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_copy_loop
adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done:
    cmp dword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot_heap_owned], 0
    je adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_compiler_CheckResult_ensure_field_8_done_commit:
    mov qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot], r12
    mov dword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_adk_compiler_CheckResult], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_adk_compiler_CheckResult_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_adk_compiler_CheckResult_ensure_alloc_fail:
adenc_fcap_adk_compiler_CheckResult_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_adk_compiler_CheckResult_ensure endp

adenc_fcap_adk_compiler_CheckResult_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_1_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_2_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_3_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_4_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_compiler_CheckResult_arc_teardown_field_4_skip:
    add rsp, 40
adenc_fcap_adk_compiler_CheckResult_arc_teardown_done:
    ret
adenc_fcap_adk_compiler_CheckResult_arc_teardown endp
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_field_4_skip:
    add rsp, 40
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges_done:
    ret
adenc_fcap_adk_compiler_CheckResult_arc_scan_edges endp
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_2_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_3_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_field_4_skip:
    add rsp, 40
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges_done:
    ret
adenc_fcap_adk_compiler_CheckResult_arc_invalidate_edges endp
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
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
    mov eax, dword ptr [rsp+360]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+368]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+384]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+392]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_ctor_reuse
    mov ecx, 39
    call adenc_rt_objectNew
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_fcap_adk_compiler_CheckResult_ensure
    mov rax, qword ptr [rsp+176]
    jmp adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_ctor_ready
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_b0:
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_success]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s1
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s2
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_importCount]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s3
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_classCount]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s4
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s5
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s5_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+240], rax
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    test rax, rax
    je CheckResult_CheckResult_cast_5_22_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz CheckResult_CheckResult_cast_5_22_fail
    mov ecx, edx
    lea rdx, cidset_12
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz CheckResult_CheckResult_cast_5_22_ok
CheckResult_CheckResult_cast_5_22_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp CheckResult_CheckResult_cast_5_22_done
CheckResult_CheckResult_cast_5_22_null:
    xor eax, eax
    jmp CheckResult_CheckResult_cast_5_22_done
CheckResult_CheckResult_cast_5_22_ok:
    mov rax, qword ptr [rsp+40]
CheckResult_CheckResult_cast_5_22_done:
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s6
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s7
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+240], rax
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    test rax, rax
    je CheckResult_CheckResult_cast_7_33_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz CheckResult_CheckResult_cast_7_33_fail
    mov ecx, edx
    lea rdx, cidset_12
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz CheckResult_CheckResult_cast_7_33_ok
CheckResult_CheckResult_cast_7_33_fail:
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp CheckResult_CheckResult_cast_7_33_done
CheckResult_CheckResult_cast_7_33_null:
    xor eax, eax
    jmp CheckResult_CheckResult_cast_7_33_done
CheckResult_CheckResult_cast_7_33_ok:
    mov rax, qword ptr [rsp+40]
CheckResult_CheckResult_cast_7_33_done:
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s8
    mov edx, adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+240], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    test rax, rax
    je CheckResult_CheckResult_cast_8_41_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz CheckResult_CheckResult_cast_8_41_fail
    mov ecx, edx
    lea rdx, cidset_12
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz CheckResult_CheckResult_cast_8_41_ok
CheckResult_CheckResult_cast_8_41_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp CheckResult_CheckResult_cast_8_41_done
CheckResult_CheckResult_cast_8_41_null:
    xor eax, eax
    jmp CheckResult_CheckResult_cast_8_41_done
CheckResult_CheckResult_cast_8_41_ok:
    mov rax, qword ptr [rsp+40]
CheckResult_CheckResult_cast_8_41_done:
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_epilogue
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_epilogue:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf_epilogue_post:
    mov qword ptr [rsp+184], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 312
    ret
adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf endp

adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String proc
    sub rsp, 472
    mov qword ptr [rsp+440], rcx
    mov qword ptr [rsp+448], rdx
    mov qword ptr [rsp+456], r8
    mov qword ptr [rsp+464], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+440]
    mov rdx, qword ptr [rsp+448]
    mov r8, qword ptr [rsp+456]
    mov r9, qword ptr [rsp+464]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov dword ptr [rsp+104], r9d
    mov rax, qword ptr [rsp+512]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+520]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+528]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+536]
    mov qword ptr [rsp+136], rax
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_b0:
    lea rcx, adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 1
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+224]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+400], rax
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+400]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+224]
    test rax, rax
    je CheckResult_success_cast_0_6_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz CheckResult_success_cast_0_6_fail
    mov ecx, edx
    lea rdx, cidset_12
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz CheckResult_success_cast_0_6_ok
CheckResult_success_cast_0_6_fail:
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp CheckResult_success_cast_0_6_done
CheckResult_success_cast_0_6_null:
    xor eax, eax
    jmp CheckResult_success_cast_0_6_done
CheckResult_success_cast_0_6_ok:
    mov rax, qword ptr [rsp+40]
CheckResult_success_cast_0_6_done:
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+224]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+224]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+184], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+184]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+400], rax
    lea rcx, msg8
    mov edx, msg8_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+400]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    call adenc_aden_util_Objects_requireNonNull__Object_String
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+224]
    test rax, rax
    je CheckResult_success_cast_0_16_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz CheckResult_success_cast_0_16_fail
    mov ecx, edx
    lea rdx, cidset_12
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz CheckResult_success_cast_0_16_ok
CheckResult_success_cast_0_16_fail:
    lea rcx, msg9
    mov edx, msg9_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp CheckResult_success_cast_0_16_done
CheckResult_success_cast_0_16_null:
    xor eax, eax
    jmp CheckResult_success_cast_0_16_done
CheckResult_success_cast_0_16_ok:
    mov rax, qword ptr [rsp+40]
CheckResult_success_cast_0_16_done:
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+360]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+368], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+360]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+368]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+200], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+200]
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+344], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+352], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+360], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+368], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+376], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+344]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+352]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+360]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+368]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+376]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+208], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+208]
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rax, qword ptr [rsp+152]
    mov r8, rax
    mov eax, dword ptr [rsp+160]
    mov r9d, eax
    mov eax, dword ptr [rsp+168]
    mov dword ptr [rsp+32], eax
    mov eax, dword ptr [rsp+176]
    mov dword ptr [rsp+40], eax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+56], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+72], rax
    xor ecx, ecx
    call adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+224]
    jmp adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_epilogue
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_epilogue:
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+224]
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String_epilogue_post:
    mov qword ptr [rsp+224], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+224]
    add rsp, 472
    ret
adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String endp

adenc_adk_compiler_CheckResult_failure__String_String_String proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+96], r8
adenc_adk_compiler_CheckResult_failure__String_String_String_b0:
    lea rcx, adenc_adk_compiler_CheckResult_failure__String_String_String_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_failure__String_String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    xor eax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov eax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov eax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov eax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+304]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+312], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+304]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+312]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+312], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    xor eax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+304]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+312]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+312], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+304]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+312]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+288], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+312], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+320], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+328], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+336], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+280]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+304]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+312]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+320]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+328]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+336]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+168]
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rax, qword ptr [rsp+112]
    mov r8, rax
    mov eax, dword ptr [rsp+120]
    mov r9d, eax
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+32], eax
    mov eax, dword ptr [rsp+136]
    mov dword ptr [rsp+40], eax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+56], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    xor ecx, ecx
    call adenc_adk_compiler_CheckResult_CheckResult__boolean_String_int_int_int_String__h49a08b55b3795eaf
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    jmp adenc_adk_compiler_CheckResult_failure__String_String_String_epilogue
adenc_adk_compiler_CheckResult_failure__String_String_String_epilogue:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
adenc_adk_compiler_CheckResult_failure__String_String_String_epilogue_post:
    mov qword ptr [rsp+184], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 360
    ret
adenc_adk_compiler_CheckResult_failure__String_String_String endp

adenc_adk_compiler_CheckResult_success proc
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
adenc_adk_compiler_CheckResult_success_b0:
    lea rcx, adenc_adk_compiler_CheckResult_success_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_success_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_success]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_adk_compiler_CheckResult_success_epilogue
adenc_adk_compiler_CheckResult_success_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_success_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_success endp

adenc_adk_compiler_CheckResult_packageName proc
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
adenc_adk_compiler_CheckResult_packageName_b0:
    lea rcx, adenc_adk_compiler_CheckResult_packageName_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_packageName_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_packageName]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_compiler_CheckResult_packageName_epilogue
adenc_adk_compiler_CheckResult_packageName_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_packageName_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_packageName endp

adenc_adk_compiler_CheckResult_importCount proc
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
adenc_adk_compiler_CheckResult_importCount_b0:
    lea rcx, adenc_adk_compiler_CheckResult_importCount_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_importCount_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_importCount]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_adk_compiler_CheckResult_importCount_epilogue
adenc_adk_compiler_CheckResult_importCount_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_importCount_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_importCount endp

adenc_adk_compiler_CheckResult_classCount proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_compiler_CheckResult_classCount_b0:
    lea rcx, adenc_adk_compiler_CheckResult_classCount_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_classCount_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_classCount]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_adk_compiler_CheckResult_classCount_epilogue
adenc_adk_compiler_CheckResult_classCount_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_classCount_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_classCount endp

adenc_adk_compiler_CheckResult_filesLoaded proc
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
adenc_adk_compiler_CheckResult_filesLoaded_b0:
    lea rcx, adenc_adk_compiler_CheckResult_filesLoaded_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_filesLoaded_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_filesLoaded]
    mov eax, dword ptr [r10+rdx*4]
    jmp adenc_adk_compiler_CheckResult_filesLoaded_epilogue
adenc_adk_compiler_CheckResult_filesLoaded_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_filesLoaded_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_filesLoaded endp

adenc_adk_compiler_CheckResult_mode proc
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
adenc_adk_compiler_CheckResult_mode_b0:
    lea rcx, adenc_adk_compiler_CheckResult_mode_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_mode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_mode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_compiler_CheckResult_mode_epilogue
adenc_adk_compiler_CheckResult_mode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_mode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_mode endp

adenc_adk_compiler_CheckResult_projectMode proc
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
adenc_adk_compiler_CheckResult_projectMode_b0:
    lea rcx, adenc_adk_compiler_CheckResult_projectMode_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_projectMode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_projectMode]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_compiler_CheckResult_projectMode_epilogue
adenc_adk_compiler_CheckResult_projectMode_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_projectMode_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_projectMode endp

adenc_adk_compiler_CheckResult_entryPath proc
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
adenc_adk_compiler_CheckResult_entryPath_b0:
    lea rcx, adenc_adk_compiler_CheckResult_entryPath_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_entryPath_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_entryPath]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_compiler_CheckResult_entryPath_epilogue
adenc_adk_compiler_CheckResult_entryPath_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_entryPath_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_entryPath endp

adenc_adk_compiler_CheckResult_sourceRoot proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
adenc_adk_compiler_CheckResult_sourceRoot_b0:
    lea rcx, adenc_adk_compiler_CheckResult_sourceRoot_trace_s0
    mov edx, adenc_adk_compiler_CheckResult_sourceRoot_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_compiler_CheckResult_sourceRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_compiler_CheckResult_sourceRoot_epilogue
adenc_adk_compiler_CheckResult_sourceRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_CheckResult_sourceRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_CheckResult_sourceRoot endp

end
