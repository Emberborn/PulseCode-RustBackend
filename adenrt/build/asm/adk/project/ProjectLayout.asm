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
extrn adenc_aden_io_Path_resolve__String_String:proc
extrn adenc_aden_lang_String_equals__Object:proc
extrn adenc_aden_lang_String_hashCode:proc
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

public adenc_fld_adk_project_ProjectLayout_projectRoot
public adenc_fld_adk_project_ProjectLayout_projectRoot_heap_owned
public adenc_fld_adk_project_ProjectLayout_mainAdenRoot
public adenc_fld_adk_project_ProjectLayout_mainAdenRoot_heap_owned
public adenc_fld_adk_project_ProjectLayout_mainResourcesRoot
public adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_heap_owned

extrn adenc_aden_lang_String_concat__String:proc
.data
written dq 0
adenc_objc_adk_project_ProjectLayout dd 0
adenc_fcap_adk_project_ProjectLayout dd 63
adenc_fld_adk_project_ProjectLayout_projectRoot_tbl dq 64 dup(0)
adenc_fld_adk_project_ProjectLayout_projectRoot dq adenc_fld_adk_project_ProjectLayout_projectRoot_tbl
adenc_fld_adk_project_ProjectLayout_projectRoot_heap_owned dd 0
adenc_fld_adk_project_ProjectLayout_mainAdenRoot_tbl dq 64 dup(0)
adenc_fld_adk_project_ProjectLayout_mainAdenRoot dq adenc_fld_adk_project_ProjectLayout_mainAdenRoot_tbl
adenc_fld_adk_project_ProjectLayout_mainAdenRoot_heap_owned dd 0
adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_tbl dq 64 dup(0)
adenc_fld_adk_project_ProjectLayout_mainResourcesRoot dq adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_tbl
adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_heap_owned dd 0
trace_m0 db "adk.project.ProjectLayout.ProjectLayout"
trace_m0_len equ 39
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:19)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s1 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:20)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s1_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:22)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s3 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:23)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s3_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:25)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s5 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:26)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s5_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s6 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:28)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s6_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s7 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:29)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s7_len equ 62
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s8 db "adk.project.ProjectLayout.ProjectLayout(ProjectLayout.aden:30)"
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s8_len equ 62
trace_m10 db "adk.project.ProjectLayout.defaults"
trace_m10_len equ 34
adenc_adk_project_ProjectLayout_defaults__String_trace_s0 db "adk.project.ProjectLayout.defaults(ProjectLayout.aden:37)"
adenc_adk_project_ProjectLayout_defaults__String_trace_s0_len equ 57
adenc_adk_project_ProjectLayout_defaults__String_trace_s1 db "adk.project.ProjectLayout.defaults(ProjectLayout.aden:38)"
adenc_adk_project_ProjectLayout_defaults__String_trace_s1_len equ 57
adenc_adk_project_ProjectLayout_defaults__String_trace_s2 db "adk.project.ProjectLayout.defaults(ProjectLayout.aden:40)"
adenc_adk_project_ProjectLayout_defaults__String_trace_s2_len equ 57
trace_m14 db "adk.project.ProjectLayout.projectRoot"
trace_m14_len equ 37
adenc_adk_project_ProjectLayout_projectRoot_trace_s0 db "adk.project.ProjectLayout.projectRoot(ProjectLayout.aden:51)"
adenc_adk_project_ProjectLayout_projectRoot_trace_s0_len equ 60
trace_m16 db "adk.project.ProjectLayout.mainAdenRoot"
trace_m16_len equ 38
adenc_adk_project_ProjectLayout_mainAdenRoot_trace_s0 db "adk.project.ProjectLayout.mainAdenRoot(ProjectLayout.aden:58)"
adenc_adk_project_ProjectLayout_mainAdenRoot_trace_s0_len equ 61
trace_m18 db "adk.project.ProjectLayout.mainResourcesRoot"
trace_m18_len equ 43
adenc_adk_project_ProjectLayout_mainResourcesRoot_trace_s0 db 97, 100, 107, 46, 112, 114, 111, 106, 101, 99, 116, 46, 80, 114, 111, 106, 101, 99, 116, 76, 97, 121, 111, 117, 116, 46, 109, 97, 105, 110, 82, 101
    db 115, 111, 117, 114, 99, 101, 115, 82, 111, 111, 116, 40, 80, 114, 111, 106, 101, 99, 116, 76, 97, 121, 111, 117, 116, 46, 97, 100, 101, 110, 58, 54
    db 53, 41
adenc_adk_project_ProjectLayout_mainResourcesRoot_trace_s0_len equ 66
trace_m20 db "adk.project.ProjectLayout.equals"
trace_m20_len equ 32
adenc_adk_project_ProjectLayout_equals__Object_trace_s0 db "adk.project.ProjectLayout.equals(ProjectLayout.aden:72)"
adenc_adk_project_ProjectLayout_equals__Object_trace_s0_len equ 55
adenc_adk_project_ProjectLayout_equals__Object_trace_s1 db "adk.project.ProjectLayout.equals(ProjectLayout.aden:73)"
adenc_adk_project_ProjectLayout_equals__Object_trace_s1_len equ 55
adenc_adk_project_ProjectLayout_equals__Object_trace_s2 db "adk.project.ProjectLayout.equals(ProjectLayout.aden:75)"
adenc_adk_project_ProjectLayout_equals__Object_trace_s2_len equ 55
adenc_adk_project_ProjectLayout_equals__Object_trace_s3 db "adk.project.ProjectLayout.equals(ProjectLayout.aden:76)"
adenc_adk_project_ProjectLayout_equals__Object_trace_s3_len equ 55
trace_m25 db "adk.project.ProjectLayout.hashCode"
trace_m25_len equ 34
adenc_adk_project_ProjectLayout_hashCode_trace_s0 db "adk.project.ProjectLayout.hashCode(ProjectLayout.aden:85)"
adenc_adk_project_ProjectLayout_hashCode_trace_s0_len equ 57
adenc_adk_project_ProjectLayout_hashCode_trace_s1 db "adk.project.ProjectLayout.hashCode(ProjectLayout.aden:86)"
adenc_adk_project_ProjectLayout_hashCode_trace_s1_len equ 57
adenc_adk_project_ProjectLayout_hashCode_trace_s2 db "adk.project.ProjectLayout.hashCode(ProjectLayout.aden:87)"
adenc_adk_project_ProjectLayout_hashCode_trace_s2_len equ 57
adenc_adk_project_ProjectLayout_hashCode_trace_s3 db "adk.project.ProjectLayout.hashCode(ProjectLayout.aden:88)"
adenc_adk_project_ProjectLayout_hashCode_trace_s3_len equ 57
adenc_adk_project_ProjectLayout_hashCode_trace_s4 db "adk.project.ProjectLayout.hashCode(ProjectLayout.aden:89)"
adenc_adk_project_ProjectLayout_hashCode_trace_s4_len equ 57
trace_m31 db "adk.project.ProjectLayout.toString"
trace_m31_len equ 34
adenc_adk_project_ProjectLayout_toString_trace_s0 db "adk.project.ProjectLayout.toString(ProjectLayout.aden:96)"
adenc_adk_project_ProjectLayout_toString_trace_s0_len equ 57
cidset_5 dd 36
msg0 db "projectRoot must not be null"
msg0_len equ 28
msg1 db "mainAdenRoot must not be null"
msg1_len equ 29
msg2 db "mainResourcesRoot must not be null"
msg2_len equ 34
msg3 db "projectRoot must not be null"
msg3_len equ 28
msg4 db "src/main/aden"
msg4_len equ 13
msg5 db "src/main/resources"
msg5_len equ 18
msg6 db "Invalid cast"
msg6_len equ 12
msg7 db "ProjectLayout[root="
msg7_len equ 19
msg8 db ", mainAden="
msg8_len equ 11
msg9 db ", mainResources="
msg9_len equ 16
msg10 db "]"
msg10_len equ 1

.code
adenc_fcap_adk_project_ProjectLayout_ensure proc
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_ensure_done_ok
    cmp ecx, dword ptr [adenc_fcap_adk_project_ProjectLayout]
    jbe adenc_fcap_adk_project_ProjectLayout_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [adenc_fcap_adk_project_ProjectLayout]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_ensure_fail
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
    jz adenc_fcap_adk_project_ProjectLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    xor esi, esi
adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_next:
    add esi, 1
    jmp adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_copy_loop
adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done:
    cmp dword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot_heap_owned], 0
    je adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_project_ProjectLayout_ensure_field_0_done_commit:
    mov qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot], r12
    mov dword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    xor esi, esi
adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_next:
    add esi, 1
    jmp adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_copy_loop
adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done:
    cmp dword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot_heap_owned], 0
    je adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_project_ProjectLayout_ensure_field_1_done_commit:
    mov qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot], r12
    mov dword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    xor esi, esi
adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_next:
    add esi, 1
    jmp adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_copy_loop
adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done:
    cmp dword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_heap_owned], 0
    je adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_commit
    test rbx, rbx
    jz adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
adenc_fcap_adk_project_ProjectLayout_ensure_field_2_done_commit:
    mov qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot], r12
    mov dword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [adenc_fcap_adk_project_ProjectLayout], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
adenc_fcap_adk_project_ProjectLayout_ensure_done_ok:
    xor eax, eax
    ret
adenc_fcap_adk_project_ProjectLayout_ensure_alloc_fail:
adenc_fcap_adk_project_ProjectLayout_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
adenc_fcap_adk_project_ProjectLayout_ensure endp

adenc_fcap_adk_project_ProjectLayout_arc_teardown proc
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_0_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_1_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_2_skip
    mov rcx, rax
    call adenc_rt_arcRelease
adenc_fcap_adk_project_ProjectLayout_arc_teardown_field_2_skip:
    add rsp, 40
adenc_fcap_adk_project_ProjectLayout_arc_teardown_done:
    ret
adenc_fcap_adk_project_ProjectLayout_arc_teardown endp
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_field_2_skip:
    add rsp, 40
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges_done:
    ret
adenc_fcap_adk_project_ProjectLayout_arc_scan_edges endp
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges proc
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_1_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip
    mov dword ptr [r11+rcx*4], 0
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_field_2_skip:
    add rsp, 40
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges_done:
    ret
adenc_fcap_adk_project_ProjectLayout_arc_invalidate_edges endp
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_ctor_reuse
    mov ecx, 36
    call adenc_rt_objectNew
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_fcap_adk_project_ProjectLayout_ensure
    mov rax, qword ptr [rsp+152]
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_ctor_ready
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b0:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b1
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b2
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b1:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s1
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b3
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b2:
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b3
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b3:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b4
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b5
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b4:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s3
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s3_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s2_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b6
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b5:
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b6
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b6:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b7
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b8
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b7:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s5
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s5_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_panic
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s4_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b9
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b8:
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b9
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_b9:
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s6
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s6_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s7
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s7_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s8
    mov edx, adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_trace_s8_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov qword ptr [r10+rdx*8], rax
    mov rax, qword ptr [rsp+64]
    jmp adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_epilogue
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String endp

adenc_adk_project_ProjectLayout_defaults__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
adenc_adk_project_ProjectLayout_defaults__String_b0:
    lea rcx, adenc_adk_project_ProjectLayout_defaults__String_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_defaults__String_trace_s0_len
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
    jne adenc_adk_project_ProjectLayout_defaults__String_b1
    jmp adenc_adk_project_ProjectLayout_defaults__String_b2
adenc_adk_project_ProjectLayout_defaults__String_b1:
    lea rcx, adenc_adk_project_ProjectLayout_defaults__String_trace_s1
    mov edx, adenc_adk_project_ProjectLayout_defaults__String_trace_s1_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
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
    lea rcx, adenc_adk_project_ProjectLayout_defaults__String_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_defaults__String_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_project_ProjectLayout_defaults__String_b3
adenc_adk_project_ProjectLayout_defaults__String_b2:
    jmp adenc_adk_project_ProjectLayout_defaults__String_b3
adenc_adk_project_ProjectLayout_defaults__String_b3:
    lea rcx, adenc_adk_project_ProjectLayout_defaults__String_trace_s2
    mov edx, adenc_adk_project_ProjectLayout_defaults__String_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+216], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call adenc_aden_io_Path_resolve__String_String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+216], rax
    lea rcx, msg5
    mov edx, msg5_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call adenc_aden_io_Path_resolve__String_String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    mov r8, rax
    mov rax, qword ptr [rsp+96]
    mov r9, rax
    xor ecx, ecx
    call adenc_adk_project_ProjectLayout_ProjectLayout__String_String_String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp adenc_adk_project_ProjectLayout_defaults__String_epilogue
adenc_adk_project_ProjectLayout_defaults__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_adk_project_ProjectLayout_defaults__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
adenc_adk_project_ProjectLayout_defaults__String endp

adenc_adk_project_ProjectLayout_projectRoot proc
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
adenc_adk_project_ProjectLayout_projectRoot_b0:
    lea rcx, adenc_adk_project_ProjectLayout_projectRoot_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_projectRoot_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_project_ProjectLayout_projectRoot_epilogue
adenc_adk_project_ProjectLayout_projectRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_project_ProjectLayout_projectRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_project_ProjectLayout_projectRoot endp

adenc_adk_project_ProjectLayout_mainAdenRoot proc
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
adenc_adk_project_ProjectLayout_mainAdenRoot_b0:
    lea rcx, adenc_adk_project_ProjectLayout_mainAdenRoot_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_mainAdenRoot_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_project_ProjectLayout_mainAdenRoot_epilogue
adenc_adk_project_ProjectLayout_mainAdenRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_project_ProjectLayout_mainAdenRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_project_ProjectLayout_mainAdenRoot endp

adenc_adk_project_ProjectLayout_mainResourcesRoot proc
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
adenc_adk_project_ProjectLayout_mainResourcesRoot_b0:
    lea rcx, adenc_adk_project_ProjectLayout_mainResourcesRoot_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_mainResourcesRoot_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call adenc_rt_arcRetain
    jmp adenc_adk_project_ProjectLayout_mainResourcesRoot_epilogue
adenc_adk_project_ProjectLayout_mainResourcesRoot_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_project_ProjectLayout_mainResourcesRoot_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_project_ProjectLayout_mainResourcesRoot endp

adenc_adk_project_ProjectLayout_equals__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
adenc_adk_project_ProjectLayout_equals__Object_b0:
    lea rcx, adenc_adk_project_ProjectLayout_equals__Object_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je ProjectLayout_equals_instof_0_1_false
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz ProjectLayout_equals_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz ProjectLayout_equals_instof_0_1_true
ProjectLayout_equals_instof_0_1_false:
    xor eax, eax
    jmp ProjectLayout_equals_instof_0_1_done
ProjectLayout_equals_instof_0_1_true:
    mov eax, 1
ProjectLayout_equals_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne adenc_adk_project_ProjectLayout_equals__Object_b1
    jmp adenc_adk_project_ProjectLayout_equals__Object_b2
adenc_adk_project_ProjectLayout_equals__Object_b1:
    lea rcx, adenc_adk_project_ProjectLayout_equals__Object_trace_s1
    mov edx, adenc_adk_project_ProjectLayout_equals__Object_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 0
    jmp adenc_adk_project_ProjectLayout_equals__Object_epilogue
adenc_adk_project_ProjectLayout_equals__Object_b2:
    lea rcx, adenc_adk_project_ProjectLayout_equals__Object_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_equals__Object_trace_s0_len
    call adenc_rt_traceUpdateTop
    jmp adenc_adk_project_ProjectLayout_equals__Object_b3
adenc_adk_project_ProjectLayout_equals__Object_b3:
    lea rcx, adenc_adk_project_ProjectLayout_equals__Object_trace_s2
    mov edx, adenc_adk_project_ProjectLayout_equals__Object_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    test rax, rax
    je ProjectLayout_equals_cast_2_5_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call adenc_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz ProjectLayout_equals_cast_2_5_fail
    mov ecx, edx
    lea rdx, cidset_5
    mov r8d, 1
    call adenc_rt_classIdInSet
    test eax, eax
    jnz ProjectLayout_equals_cast_2_5_ok
ProjectLayout_equals_cast_2_5_fail:
    lea rcx, msg6
    mov edx, msg6_len
    call adenc_rt_stringFromBytes
    mov rcx, rax
    call adenc_rt_panic
    xor eax, eax
    jmp ProjectLayout_equals_cast_2_5_done
ProjectLayout_equals_cast_2_5_null:
    xor eax, eax
    jmp ProjectLayout_equals_cast_2_5_done
ProjectLayout_equals_cast_2_5_ok:
    mov rax, qword ptr [rsp+40]
ProjectLayout_equals_cast_2_5_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, adenc_adk_project_ProjectLayout_equals__Object_trace_s3
    mov edx, adenc_adk_project_ProjectLayout_equals__Object_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test rax, rax
    jne ProjectLayout_equals_ternary_then_3_19
    mov eax, 0
    jmp ProjectLayout_equals_ternary_done_3_19
ProjectLayout_equals_ternary_then_3_19:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
ProjectLayout_equals_ternary_done_3_19:
    test rax, rax
    jne ProjectLayout_equals_ternary_then_3_26
    mov eax, 0
    jmp ProjectLayout_equals_ternary_done_3_26
ProjectLayout_equals_ternary_then_3_26:
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+136], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+136]
    call adenc_aden_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
ProjectLayout_equals_ternary_done_3_26:
    jmp adenc_adk_project_ProjectLayout_equals__Object_epilogue
adenc_adk_project_ProjectLayout_equals__Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+128]
adenc_adk_project_ProjectLayout_equals__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
adenc_adk_project_ProjectLayout_equals__Object endp

adenc_adk_project_ProjectLayout_hashCode proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
adenc_adk_project_ProjectLayout_hashCode_b0:
    lea rcx, adenc_adk_project_ProjectLayout_hashCode_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_hashCode_trace_s0_len
    call adenc_rt_traceUpdateTop
    mov eax, 17
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_project_ProjectLayout_hashCode_trace_s1
    mov edx, adenc_adk_project_ProjectLayout_hashCode_trace_s1_len
    call adenc_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    imul eax, edx
    mov dword ptr [rsp+88], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call adenc_aden_lang_String_hashCode
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    add eax, edx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_project_ProjectLayout_hashCode_trace_s2
    mov edx, adenc_adk_project_ProjectLayout_hashCode_trace_s2_len
    call adenc_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    imul eax, edx
    mov dword ptr [rsp+104], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call adenc_aden_lang_String_hashCode
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_project_ProjectLayout_hashCode_trace_s3
    mov edx, adenc_adk_project_ProjectLayout_hashCode_trace_s3_len
    call adenc_rt_traceUpdateTop
    mov eax, 31
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    imul eax, edx
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call adenc_aden_lang_String_hashCode
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov dword ptr [rsp+64], eax
    lea rcx, adenc_adk_project_ProjectLayout_hashCode_trace_s4
    mov edx, adenc_adk_project_ProjectLayout_hashCode_trace_s4_len
    call adenc_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp adenc_adk_project_ProjectLayout_hashCode_epilogue
adenc_adk_project_ProjectLayout_hashCode_epilogue:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
adenc_adk_project_ProjectLayout_hashCode_epilogue_post:
    mov qword ptr [rsp+168], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
adenc_adk_project_ProjectLayout_hashCode endp

adenc_adk_project_ProjectLayout_toString proc
    sub rsp, 440
    mov qword ptr [rsp+408], rcx
    mov qword ptr [rsp+416], rdx
    mov qword ptr [rsp+424], r8
    mov qword ptr [rsp+432], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+408]
    mov rdx, qword ptr [rsp+416]
    mov r8, qword ptr [rsp+424]
    mov r9, qword ptr [rsp+432]
    mov qword ptr [rsp+64], rcx
adenc_adk_project_ProjectLayout_toString_b0:
    lea rcx, adenc_adk_project_ProjectLayout_toString_trace_s0
    mov edx, adenc_adk_project_ProjectLayout_toString_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+320], rax
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_projectRoot]
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
    lea rcx, msg8
    mov edx, msg8_len
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
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainAdenRoot]
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
    lea rcx, msg9
    mov edx, msg9_len
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
    mov r10, qword ptr [adenc_fld_adk_project_ProjectLayout_mainResourcesRoot]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+72]
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
    lea rcx, msg10
    mov edx, msg10_len
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
    jmp adenc_adk_project_ProjectLayout_toString_epilogue
adenc_adk_project_ProjectLayout_toString_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_project_ProjectLayout_toString_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 440
    ret
adenc_adk_project_ProjectLayout_toString endp

end
