option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn Sleep:proc
extrn SwitchToThread:proc
extrn GetCurrentThreadId:proc
extrn CreateThread:proc
extrn CreateMutexA:proc
extrn ReleaseMutex:proc
extrn CreateEventA:proc
extrn SetEvent:proc
extrn ResetEvent:proc
extrn CloseHandle:proc
extrn CreateSemaphoreA:proc
extrn ReleaseSemaphore:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapReAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_IO_println__int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_stringLength:proc
extrn pulsec_rt_weakGet:proc
extrn pulsec_rt_weakNew:proc
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


.data
written dq 0
pulsec_objc_app_core_Main dd 0
trace_m0 db "app.core.Main.main"
trace_m0_len equ 18
pulsec_app_core_Main_main_trace_s0 db "app.core.Main.main(Main.pulse:8)"
pulsec_app_core_Main_main_trace_s0_len equ 32
pulsec_app_core_Main_main_trace_s1 db "app.core.Main.main(Main.pulse:9)"
pulsec_app_core_Main_main_trace_s1_len equ 32
pulsec_app_core_Main_main_trace_s2 db "app.core.Main.main(Main.pulse:10)"
pulsec_app_core_Main_main_trace_s2_len equ 33
pulsec_app_core_Main_main_trace_s3 db "app.core.Main.main(Main.pulse:11)"
pulsec_app_core_Main_main_trace_s3_len equ 33
pulsec_app_core_Main_main_trace_s4 db "app.core.Main.main(Main.pulse:13)"
pulsec_app_core_Main_main_trace_s4_len equ 33
pulsec_app_core_Main_main_trace_s5 db "app.core.Main.main(Main.pulse:14)"
pulsec_app_core_Main_main_trace_s5_len equ 33
pulsec_app_core_Main_main_trace_s6 db "app.core.Main.main(Main.pulse:15)"
pulsec_app_core_Main_main_trace_s6_len equ 33
pulsec_app_core_Main_main_trace_s7 db "app.core.Main.main(Main.pulse:16)"
pulsec_app_core_Main_main_trace_s7_len equ 33
pulsec_app_core_Main_main_trace_s8 db "app.core.Main.main(Main.pulse:18)"
pulsec_app_core_Main_main_trace_s8_len equ 33
msg0 db "42"
msg0_len equ 2

.code
pulsec_app_core_Main_main proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_app_core_Main_main_b0:
    lea rcx, pulsec_app_core_Main_main_trace_s0
    mov edx, pulsec_app_core_Main_main_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_app_core_Main_main_trace_s1
    mov edx, pulsec_app_core_Main_main_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_weakNew
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_app_core_Main_main_trace_s2
    mov edx, pulsec_app_core_Main_main_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_app_core_Main_main_trace_s3
    mov edx, pulsec_app_core_Main_main_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_stringLength
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s4
    mov edx, pulsec_app_core_Main_main_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_app_core_Main_main_trace_s5
    mov edx, pulsec_app_core_Main_main_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_app_core_Main_main_trace_s6
    mov edx, pulsec_app_core_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_app_core_Main_main_b1
    jmp pulsec_app_core_Main_main_b2
pulsec_app_core_Main_main_b1:
    lea rcx, pulsec_app_core_Main_main_trace_s7
    mov edx, pulsec_app_core_Main_main_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s6
    mov edx, pulsec_app_core_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_core_Main_main_b3
pulsec_app_core_Main_main_b2:
    lea rcx, pulsec_app_core_Main_main_trace_s8
    mov edx, pulsec_app_core_Main_main_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s6
    mov edx, pulsec_app_core_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_core_Main_main_b3
pulsec_app_core_Main_main_b3:
    xor eax, eax
    jmp pulsec_app_core_Main_main_epilogue
pulsec_app_core_Main_main_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_app_core_Main_main_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_app_core_Main_main endp

end
