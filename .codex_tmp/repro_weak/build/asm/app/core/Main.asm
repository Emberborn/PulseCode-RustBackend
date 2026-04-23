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
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_IO_println__int:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_valueOf__int:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_stringLength:proc
extrn pulsec_rt_weakClear:proc
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
pulsec_app_core_Main_main_trace_s9 db "app.core.Main.main(Main.pulse:21)"
pulsec_app_core_Main_main_trace_s9_len equ 33
pulsec_app_core_Main_main_trace_s10 db "app.core.Main.main(Main.pulse:22)"
pulsec_app_core_Main_main_trace_s10_len equ 33
pulsec_app_core_Main_main_trace_s11 db "app.core.Main.main(Main.pulse:23)"
pulsec_app_core_Main_main_trace_s11_len equ 33
pulsec_app_core_Main_main_trace_s12 db "app.core.Main.main(Main.pulse:24)"
pulsec_app_core_Main_main_trace_s12_len equ 33
pulsec_app_core_Main_main_trace_s13 db "app.core.Main.main(Main.pulse:26)"
pulsec_app_core_Main_main_trace_s13_len equ 33
pulsec_app_core_Main_main_trace_s14 db "app.core.Main.main(Main.pulse:29)"
pulsec_app_core_Main_main_trace_s14_len equ 33
pulsec_app_core_Main_main_trace_s15 db "app.core.Main.main(Main.pulse:30)"
pulsec_app_core_Main_main_trace_s15_len equ 33
pulsec_app_core_Main_main_trace_s16 db "app.core.Main.main(Main.pulse:31)"
pulsec_app_core_Main_main_trace_s16_len equ 33

.code
pulsec_app_core_Main_main proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+112], 0
pulsec_app_core_Main_main_b0:
    lea rcx, pulsec_app_core_Main_main_trace_s0
    mov edx, pulsec_app_core_Main_main_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 42
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_app_core_Main_main_trace_s1
    mov edx, pulsec_app_core_Main_main_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakNew
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_app_core_Main_main_trace_s2
    mov edx, pulsec_app_core_Main_main_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_app_core_Main_main_trace_s3
    mov edx, pulsec_app_core_Main_main_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_stringLength
    movsxd rax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s4
    mov edx, pulsec_app_core_Main_main_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+144]
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    lea rcx, pulsec_app_core_Main_main_trace_s5
    mov edx, pulsec_app_core_Main_main_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_app_core_Main_main_trace_s6
    mov edx, pulsec_app_core_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
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
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
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
    mov qword ptr [rsp+232], rax
    mov rcx, qword ptr [rsp+232]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s6
    mov edx, pulsec_app_core_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_core_Main_main_b3
pulsec_app_core_Main_main_b3:
    lea rcx, pulsec_app_core_Main_main_trace_s9
    mov edx, pulsec_app_core_Main_main_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakClear
    lea rcx, pulsec_app_core_Main_main_trace_s10
    mov edx, pulsec_app_core_Main_main_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_app_core_Main_main_trace_s11
    mov edx, pulsec_app_core_Main_main_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+128], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_app_core_Main_main_b4
    jmp pulsec_app_core_Main_main_b5
pulsec_app_core_Main_main_b4:
    lea rcx, pulsec_app_core_Main_main_trace_s12
    mov edx, pulsec_app_core_Main_main_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s11
    mov edx, pulsec_app_core_Main_main_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_core_Main_main_b6
pulsec_app_core_Main_main_b5:
    lea rcx, pulsec_app_core_Main_main_trace_s13
    mov edx, pulsec_app_core_Main_main_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rcx, qword ptr [rsp+232]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_core_Main_main_trace_s11
    mov edx, pulsec_app_core_Main_main_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_core_Main_main_b6
pulsec_app_core_Main_main_b6:
    lea rcx, pulsec_app_core_Main_main_trace_s14
    mov edx, pulsec_app_core_Main_main_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, 16777216
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    add rax, rdx
    mov qword ptr [rsp+104], rax
    lea rcx, pulsec_app_core_Main_main_trace_s15
    mov edx, pulsec_app_core_Main_main_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_weakGet
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+112], rax
    lea rcx, pulsec_app_core_Main_main_trace_s16
    mov edx, pulsec_app_core_Main_main_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+232], rax
    mov rcx, qword ptr [rsp+232]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    xor eax, eax
    jmp pulsec_app_core_Main_main_epilogue
pulsec_app_core_Main_main_epilogue:
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
pulsec_app_core_Main_main_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 344
    ret
pulsec_app_core_Main_main endp

end
