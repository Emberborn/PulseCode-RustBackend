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
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_author_build_BuildConfig_defaults__String:proc
extrn pulsec_author_compiler_CheckResult_success__String_int_int_int_String_String_String_String:proc
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


extrn pulsec_author_build_BuildConfig_target:proc
extrn pulsec_pulse_lang_String_concat__String:proc
.data
written dq 0
pulsec_objc_compiler_entry_CompilerIdentity dd 0
trace_m0 db "compiler.entry.CompilerIdentity.CompilerIdentity"
trace_m0_len equ 48
trace_m1 db "compiler.entry.CompilerIdentity.projectName"
trace_m1_len equ 43
pulsec_compiler_entry_CompilerIdentity_projectName_trace_s0 db 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46
    db 112, 114, 111, 106, 101, 99, 116, 78, 97, 109, 101, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 112, 117, 108
    db 115, 101, 58, 49, 48, 41
pulsec_compiler_entry_CompilerIdentity_projectName_trace_s0_len equ 70
trace_m3 db "compiler.entry.CompilerIdentity.stageName"
trace_m3_len equ 41
pulsec_compiler_entry_CompilerIdentity_stageName_trace_s0 db 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46
    db 115, 116, 97, 103, 101, 78, 97, 109, 101, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 112, 117, 108, 115, 101
    db 58, 49, 52, 41
pulsec_compiler_entry_CompilerIdentity_stageName_trace_s0_len equ 68
trace_m5 db "compiler.entry.CompilerIdentity.target"
trace_m5_len equ 38
pulsec_compiler_entry_CompilerIdentity_target_trace_s0 db 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46
    db 116, 97, 114, 103, 101, 116, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 41
pulsec_compiler_entry_CompilerIdentity_target_trace_s0_len equ 65
trace_m7 db "compiler.entry.CompilerIdentity.smokeCheckContract"
trace_m7_len equ 50
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0 db 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46
    db 115, 109, 111, 107, 101, 67, 104, 101, 99, 107, 67, 111, 110, 116, 114, 97, 99, 116, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116
    db 105, 116, 121, 46, 112, 117, 108, 115, 101, 58, 50, 50, 41
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0_len equ 77
trace_m9 db "compiler.entry.CompilerIdentity.banner"
trace_m9_len equ 38
pulsec_compiler_entry_CompilerIdentity_banner_trace_s0 db 99, 111, 109, 112, 105, 108, 101, 114, 46, 101, 110, 116, 114, 121, 46, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46
    db 98, 97, 110, 110, 101, 114, 40, 67, 111, 109, 112, 105, 108, 101, 114, 73, 100, 101, 110, 116, 105, 116, 121, 46, 112, 117, 108, 115, 101, 58, 51, 53
    db 41
pulsec_compiler_entry_CompilerIdentity_banner_trace_s0_len equ 65
msg0 db "pulsec"
msg0_len equ 6
msg1 db "compiler"
msg1_len equ 8
msg2 db "."
msg2_len equ 1
msg3 db "compiler.entry"
msg3_len equ 14
msg4 db "project"
msg4_len equ 7
msg5 db "single"
msg5_len equ 6
msg6 db "compiler/entry/Main.pulse"
msg6_len equ 25
msg7 db "src/main/pulse"
msg7_len equ 14
msg8 db " :: "
msg8_len equ 4
msg9 db " :: "
msg9_len equ 4

.code
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_reuse
    mov ecx, 4
    call pulsec_rt_objectNew
    jmp pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_ready
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_b0:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_compiler_entry_CompilerIdentity_CompilerIdentity endp

pulsec_compiler_entry_CompilerIdentity_projectName proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
pulsec_compiler_entry_CompilerIdentity_projectName_b0:
    lea rcx, pulsec_compiler_entry_CompilerIdentity_projectName_trace_s0
    mov edx, pulsec_compiler_entry_CompilerIdentity_projectName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_compiler_entry_CompilerIdentity_projectName_epilogue
pulsec_compiler_entry_CompilerIdentity_projectName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_compiler_entry_CompilerIdentity_projectName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_compiler_entry_CompilerIdentity_projectName endp

pulsec_compiler_entry_CompilerIdentity_stageName proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
pulsec_compiler_entry_CompilerIdentity_stageName_b0:
    lea rcx, pulsec_compiler_entry_CompilerIdentity_stageName_trace_s0
    mov edx, pulsec_compiler_entry_CompilerIdentity_stageName_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_compiler_entry_CompilerIdentity_stageName_epilogue
pulsec_compiler_entry_CompilerIdentity_stageName_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_compiler_entry_CompilerIdentity_stageName_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_compiler_entry_CompilerIdentity_stageName endp

pulsec_compiler_entry_CompilerIdentity_target proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
pulsec_compiler_entry_CompilerIdentity_target_b0:
    lea rcx, pulsec_compiler_entry_CompilerIdentity_target_trace_s0
    mov edx, pulsec_compiler_entry_CompilerIdentity_target_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_author_build_BuildConfig_defaults__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_author_build_BuildConfig_target
    jmp pulsec_compiler_entry_CompilerIdentity_target_epilogue
pulsec_compiler_entry_CompilerIdentity_target_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_compiler_entry_CompilerIdentity_target_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 264
    ret
pulsec_compiler_entry_CompilerIdentity_target endp

pulsec_compiler_entry_CompilerIdentity_smokeCheckContract proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_b0:
    lea rcx, pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0
    mov edx, pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
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
    lea rcx, msg5
    mov edx, msg5_len
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
    lea rcx, msg6
    mov edx, msg6_len
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
    lea rcx, msg7
    mov edx, msg7_len
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
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
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
    call pulsec_author_compiler_CheckResult_success__String_int_int_int_String_String_String_String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
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
    jmp pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_compiler_entry_CompilerIdentity_smokeCheckContract endp

pulsec_compiler_entry_CompilerIdentity_banner proc
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
pulsec_compiler_entry_CompilerIdentity_banner_b0:
    lea rcx, pulsec_compiler_entry_CompilerIdentity_banner_trace_s0
    mov edx, pulsec_compiler_entry_CompilerIdentity_banner_trace_s0_len
    call pulsec_rt_traceUpdateTop
    call pulsec_compiler_entry_CompilerIdentity_projectName
    mov qword ptr [rsp+232], rax
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+232]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    call pulsec_compiler_entry_CompilerIdentity_stageName
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+152], rax
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+64], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+152]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    call pulsec_compiler_entry_CompilerIdentity_target
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    jmp pulsec_compiler_entry_CompilerIdentity_banner_epilogue
pulsec_compiler_entry_CompilerIdentity_banner_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_compiler_entry_CompilerIdentity_banner_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 392
    ret
pulsec_compiler_entry_CompilerIdentity_banner endp

end
