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
extrn adenc_adk_build_BuildConfig_defaults__String:proc
extrn adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String:proc
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
extrn adenc_adk_build_BuildConfig_target:proc
.data
written dq 0
adenc_objc_adk_compiler_entry_CompilerIdentity dd 0
trace_m0 db "adk.compiler.entry.CompilerIdentity.CompilerIdentity"
trace_m0_len equ 52
trace_m1 db "adk.compiler.entry.CompilerIdentity.projectName"
trace_m1_len equ 47
adenc_adk_compiler_entry_CompilerIdentity_projectName_trace_s0 db 97, 100, 107, 46, 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 112, 114, 111, 106, 101, 99, 116, 78, 97, 109, 101, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121
    db 46, 97, 100, 101, 110, 58, 49, 48, 41
adenc_adk_compiler_entry_CompilerIdentity_projectName_trace_s0_len equ 73
trace_m3 db "adk.compiler.entry.CompilerIdentity.stageName"
trace_m3_len equ 45
adenc_adk_compiler_entry_CompilerIdentity_stageName_trace_s0 db 97, 100, 107, 46, 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 115, 116, 97, 103, 101, 78, 97, 109, 101, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97
    db 100, 101, 110, 58, 49, 52, 41
adenc_adk_compiler_entry_CompilerIdentity_stageName_trace_s0_len equ 71
trace_m5 db "adk.compiler.entry.CompilerIdentity.target"
trace_m5_len equ 42
adenc_adk_compiler_entry_CompilerIdentity_target_trace_s0 db 97, 100, 107, 46, 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 116, 97, 114, 103, 101, 116, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110
    db 58, 49, 56, 41
adenc_adk_compiler_entry_CompilerIdentity_target_trace_s0_len equ 68
trace_m7 db "adk.compiler.entry.CompilerIdentity.smokeCheckContract"
trace_m7_len equ 54
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0 db 97, 100, 107, 46, 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 115, 109, 111, 107, 101, 67, 104, 101, 99, 107, 67, 111, 110, 116, 114, 97, 99, 116, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73
    db 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110, 58, 50, 50, 41
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0_len equ 80
trace_m9 db "adk.compiler.entry.CompilerIdentity.banner"
trace_m9_len equ 42
adenc_adk_compiler_entry_CompilerIdentity_banner_trace_s0 db 97, 100, 107, 46, 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 98, 97, 110, 110, 101, 114, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 97, 100, 101, 110
    db 58, 51, 53, 41
adenc_adk_compiler_entry_CompilerIdentity_banner_trace_s0_len equ 68
msg0 db "adenc"
msg0_len equ 5
msg1 db "adenc"
msg1_len equ 5
msg2 db "."
msg2_len equ 1
msg3 db "adk.compiler.entry"
msg3_len equ 18
msg4 db "project"
msg4_len equ 7
msg5 db "single"
msg5_len equ 6
msg6 db "adk/compiler/entry/Main.aden"
msg6_len equ 28
msg7 db "src/main/aden"
msg7_len equ 13
msg8 db " :: "
msg8_len equ 4
msg9 db " :: "
msg9_len equ 4

.code
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity proc
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
    jne adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_reuse
    mov ecx, 40
    call adenc_rt_objectNew
    jmp adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_ready
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_reuse:
    mov rax, qword ptr [rsp+64]
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_b0:
    mov rax, qword ptr [rsp+64]
    jmp adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_adk_compiler_entry_CompilerIdentity_CompilerIdentity endp

adenc_adk_compiler_entry_CompilerIdentity_projectName proc
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
adenc_adk_compiler_entry_CompilerIdentity_projectName_b0:
    lea rcx, adenc_adk_compiler_entry_CompilerIdentity_projectName_trace_s0
    mov edx, adenc_adk_compiler_entry_CompilerIdentity_projectName_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call adenc_rt_stringFromBytes
    jmp adenc_adk_compiler_entry_CompilerIdentity_projectName_epilogue
adenc_adk_compiler_entry_CompilerIdentity_projectName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_compiler_entry_CompilerIdentity_projectName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_adk_compiler_entry_CompilerIdentity_projectName endp

adenc_adk_compiler_entry_CompilerIdentity_stageName proc
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
adenc_adk_compiler_entry_CompilerIdentity_stageName_b0:
    lea rcx, adenc_adk_compiler_entry_CompilerIdentity_stageName_trace_s0
    mov edx, adenc_adk_compiler_entry_CompilerIdentity_stageName_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call adenc_rt_stringFromBytes
    jmp adenc_adk_compiler_entry_CompilerIdentity_stageName_epilogue
adenc_adk_compiler_entry_CompilerIdentity_stageName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_compiler_entry_CompilerIdentity_stageName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_adk_compiler_entry_CompilerIdentity_stageName endp

adenc_adk_compiler_entry_CompilerIdentity_target proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
adenc_adk_compiler_entry_CompilerIdentity_target_b0:
    lea rcx, adenc_adk_compiler_entry_CompilerIdentity_target_trace_s0
    mov edx, adenc_adk_compiler_entry_CompilerIdentity_target_trace_s0_len
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
    call adenc_adk_build_BuildConfig_defaults__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    mov rcx, qword ptr [rsp+112]
    call adenc_adk_build_BuildConfig_target
    jmp adenc_adk_compiler_entry_CompilerIdentity_target_epilogue
adenc_adk_compiler_entry_CompilerIdentity_target_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_compiler_entry_CompilerIdentity_target_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 264
    ret
adenc_adk_compiler_entry_CompilerIdentity_target endp

adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_b0:
    lea rcx, adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0
    mov edx, adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0_len
    call adenc_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call adenc_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov eax, 2
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov eax, 2
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov eax, 2
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+264], rax
    lea rcx, msg4
    mov edx, msg4_len
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
    lea rcx, msg5
    mov edx, msg5_len
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
    lea rcx, msg6
    mov edx, msg6_len
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
    lea rcx, msg7
    mov edx, msg7_len
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
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call adenc_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov eax, dword ptr [rsp+104]
    mov r9d, eax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+32], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+40], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+48], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+56], rax
    call adenc_adk_compiler_CheckResult_success__String_int_int_int_String_String_String_String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
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
    jmp adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue_post:
    mov qword ptr [rsp+152], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
adenc_adk_compiler_entry_CompilerIdentity_smokeCheckContract endp

adenc_adk_compiler_entry_CompilerIdentity_banner proc
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
adenc_adk_compiler_entry_CompilerIdentity_banner_b0:
    lea rcx, adenc_adk_compiler_entry_CompilerIdentity_banner_trace_s0
    mov edx, adenc_adk_compiler_entry_CompilerIdentity_banner_trace_s0_len
    call adenc_rt_traceUpdateTop
    call adenc_adk_compiler_entry_CompilerIdentity_projectName
    mov qword ptr [rsp+232], rax
    lea rcx, msg8
    mov edx, msg8_len
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
    call adenc_adk_compiler_entry_CompilerIdentity_stageName
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
    lea rcx, msg9
    mov edx, msg9_len
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
    call adenc_adk_compiler_entry_CompilerIdentity_target
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
    jmp adenc_adk_compiler_entry_CompilerIdentity_banner_epilogue
adenc_adk_compiler_entry_CompilerIdentity_banner_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_compiler_entry_CompilerIdentity_banner_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 392
    ret
adenc_adk_compiler_entry_CompilerIdentity_banner endp

end
