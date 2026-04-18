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
extrn adenc_rt_consoleWrite:proc
extrn adenc_rt_arcRetain:proc
extrn adenc_rt_arcRelease:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_traceUpdateTop:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_IO_println__String:proc
extrn adenc_adk_runtime_entry_RuntimeIdentity_banner:proc
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


.data
written dq 0
adenc_objc_adk_runtime_entry_Main dd 0
trace_m0 db "adk.runtime.entry.Main.main"
trace_m0_len equ 27
adenc_adk_runtime_entry_Main_main_trace_s0 db "adk.runtime.entry.Main.main(Main.aden:7)"
adenc_adk_runtime_entry_Main_main_trace_s0_len equ 40

.code
adenc_adk_runtime_entry_Main_main proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
adenc_adk_runtime_entry_Main_main_b0:
    lea rcx, adenc_adk_runtime_entry_Main_main_trace_s0
    mov edx, adenc_adk_runtime_entry_Main_main_trace_s0_len
    call adenc_rt_traceUpdateTop
    call adenc_adk_runtime_entry_RuntimeIdentity_banner
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call adenc_rt_arcRetain
    mov qword ptr [rsp+64], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_aden_lang_IO_println__String
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call adenc_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    xor eax, eax
    jmp adenc_adk_runtime_entry_Main_main_epilogue
adenc_adk_runtime_entry_Main_main_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
adenc_adk_runtime_entry_Main_main_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 264
    ret
adenc_adk_runtime_entry_Main_main endp

end
