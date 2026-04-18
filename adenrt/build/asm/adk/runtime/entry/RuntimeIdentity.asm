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
extrn adenc_rt_objectNew:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_adk_project_ProjectLayout_defaults__String:proc
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


extrn adenc_aden_lang_String_concat__String:proc
extrn adenc_adk_project_ProjectLayout_mainAdenRoot:proc
.data
written dq 0
adenc_objc_adk_runtime_entry_RuntimeIdentity dd 0
trace_m0 db "adk.runtime.entry.RuntimeIdentity.RuntimeIdentity"
trace_m0_len equ 49
trace_m1 db "adk.runtime.entry.RuntimeIdentity.projectName"
trace_m1_len equ 45
adenc_adk_runtime_entry_RuntimeIdentity_projectName_trace_s0 db 97, 100, 107, 46, 114, 117, 110, 116, 105, 109, 101, 46, 101, 110, 116, 114, 121, 46, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116
    db 121, 46, 112, 114, 111, 106, 101, 99, 116, 78, 97, 109, 101, 40, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100
    db 101, 110, 58, 57, 41
adenc_adk_runtime_entry_RuntimeIdentity_projectName_trace_s0_len equ 69
trace_m3 db "adk.runtime.entry.RuntimeIdentity.stageName"
trace_m3_len equ 43
adenc_adk_runtime_entry_RuntimeIdentity_stageName_trace_s0 db 97, 100, 107, 46, 114, 117, 110, 116, 105, 109, 101, 46, 101, 110, 116, 114, 121, 46, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116
    db 121, 46, 115, 116, 97, 103, 101, 78, 97, 109, 101, 40, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110
    db 58, 49, 51, 41
adenc_adk_runtime_entry_RuntimeIdentity_stageName_trace_s0_len equ 68
trace_m5 db "adk.runtime.entry.RuntimeIdentity.layout"
trace_m5_len equ 40
adenc_adk_runtime_entry_RuntimeIdentity_layout_trace_s0 db 97, 100, 107, 46, 114, 117, 110, 116, 105, 109, 101, 46, 101, 110, 116, 114, 121, 46, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116
    db 121, 46, 108, 97, 121, 111, 117, 116, 40, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110, 58, 49, 55
    db 41
adenc_adk_runtime_entry_RuntimeIdentity_layout_trace_s0_len equ 65
trace_m7 db "adk.runtime.entry.RuntimeIdentity.banner"
trace_m7_len equ 40
adenc_adk_runtime_entry_RuntimeIdentity_banner_trace_s0 db 97, 100, 107, 46, 114, 117, 110, 116, 105, 109, 101, 46, 101, 110, 116, 114, 121, 46, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116
    db 121, 46, 98, 97, 110, 110, 101, 114, 40, 82, 117, 110, 116, 105, 109, 101, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110, 58, 50, 49
    db 41
adenc_adk_runtime_entry_RuntimeIdentity_banner_trace_s0_len equ 65
msg0 db "adenrt"
msg0_len equ 6
msg1 db "adenrt"
msg1_len equ 6
msg2 db "."
msg2_len equ 1
msg3 db " :: "
msg3_len equ 4
msg4 db " :: "
msg4_len equ 4

.code
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_ctor_reuse
    mov ecx, 38
    call adenc_rt_objectNew
    jmp adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_ctor_ready
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_b0:
    mov rax, qword ptr [rsp+64]
    jmp adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_epilogue
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_runtime_entry_RuntimeIdentity_RuntimeIdentity endp

adenc_adk_runtime_entry_RuntimeIdentity_projectName proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
adenc_adk_runtime_entry_RuntimeIdentity_projectName_b0:
    lea rcx, adenc_adk_runtime_entry_RuntimeIdentity_projectName_trace_s0
    mov edx, adenc_adk_runtime_entry_RuntimeIdentity_projectName_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_adk_runtime_entry_RuntimeIdentity_projectName_epilogue
adenc_adk_runtime_entry_RuntimeIdentity_projectName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_runtime_entry_RuntimeIdentity_projectName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_adk_runtime_entry_RuntimeIdentity_projectName endp

adenc_adk_runtime_entry_RuntimeIdentity_stageName proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
adenc_adk_runtime_entry_RuntimeIdentity_stageName_b0:
    lea rcx, adenc_adk_runtime_entry_RuntimeIdentity_stageName_trace_s0
    mov edx, adenc_adk_runtime_entry_RuntimeIdentity_stageName_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    jmp adenc_adk_runtime_entry_RuntimeIdentity_stageName_epilogue
adenc_adk_runtime_entry_RuntimeIdentity_stageName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_runtime_entry_RuntimeIdentity_stageName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_adk_runtime_entry_RuntimeIdentity_stageName endp

adenc_adk_runtime_entry_RuntimeIdentity_layout proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
adenc_adk_runtime_entry_RuntimeIdentity_layout_b0:
    lea rcx, adenc_adk_runtime_entry_RuntimeIdentity_layout_trace_s0
    mov edx, adenc_adk_runtime_entry_RuntimeIdentity_layout_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_adk_project_ProjectLayout_defaults__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    jmp adenc_adk_runtime_entry_RuntimeIdentity_layout_epilogue
adenc_adk_runtime_entry_RuntimeIdentity_layout_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_runtime_entry_RuntimeIdentity_layout_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 232
    ret
adenc_adk_runtime_entry_RuntimeIdentity_layout endp

adenc_adk_runtime_entry_RuntimeIdentity_banner proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
adenc_adk_runtime_entry_RuntimeIdentity_banner_b0:
    lea rcx, adenc_adk_runtime_entry_RuntimeIdentity_banner_trace_s0
    mov edx, adenc_adk_runtime_entry_RuntimeIdentity_banner_trace_s0_len
    call adenc_rt_traceUpdateTop
    call adenc_adk_runtime_entry_RuntimeIdentity_projectName
    mov qword ptr [rsp+232], rax
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+232]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    call adenc_adk_runtime_entry_RuntimeIdentity_stageName
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+152], rax
    lea rcx, msg4
    mov edx, msg4_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    call adenc_adk_runtime_entry_RuntimeIdentity_layout
    mov qword ptr [rsp+152], rax
    mov rcx, qword ptr [rsp+152]
    call adenc_adk_project_ProjectLayout_mainAdenRoot
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call adenc_aden_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    jmp adenc_adk_runtime_entry_RuntimeIdentity_banner_epilogue
adenc_adk_runtime_entry_RuntimeIdentity_banner_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_runtime_entry_RuntimeIdentity_banner_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 392
    ret
adenc_adk_runtime_entry_RuntimeIdentity_banner endp

end
