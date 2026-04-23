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
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_valueOf__Object:proc
extrn pulsec_pulse_lang_String_valueOf__boolean:proc
extrn pulsec_pulse_lang_String_valueOf__byte:proc
extrn pulsec_pulse_lang_String_valueOf__char:proc
extrn pulsec_pulse_lang_String_valueOf__charArr:proc
extrn pulsec_pulse_lang_String_valueOf__double:proc
extrn pulsec_pulse_lang_String_valueOf__float:proc
extrn pulsec_pulse_lang_String_valueOf__int:proc
extrn pulsec_pulse_lang_String_valueOf__long:proc
extrn pulsec_pulse_lang_String_valueOf__short:proc
extrn pulsec_pulse_lang_String_valueOf__ubyte:proc
extrn pulsec_pulse_lang_String_valueOf__uint:proc
extrn pulsec_pulse_lang_String_valueOf__ulong:proc
extrn pulsec_pulse_lang_String_valueOf__ushort:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
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
pulsec_objc_pulse_lang_IO dd 0
trace_m0 db "pulse.lang.IO.println"
trace_m0_len equ 21
trace_m1 db "pulse.lang.IO.println"
trace_m1_len equ 21
trace_m2 db "pulse.lang.IO.println"
trace_m2_len equ 21
trace_m3 db "pulse.lang.IO.println"
trace_m3_len equ 21
trace_m4 db "pulse.lang.IO.println"
trace_m4_len equ 21
trace_m5 db "pulse.lang.IO.println"
trace_m5_len equ 21
trace_m6 db "pulse.lang.IO.println"
trace_m6_len equ 21
trace_m7 db "pulse.lang.IO.println"
trace_m7_len equ 21
trace_m8 db "pulse.lang.IO.println"
trace_m8_len equ 21
trace_m9 db "pulse.lang.IO.println"
trace_m9_len equ 21
trace_m10 db "pulse.lang.IO.println"
trace_m10_len equ 21
trace_m11 db "pulse.lang.IO.println"
trace_m11_len equ 21
trace_m12 db "pulse.lang.IO.println"
trace_m12_len equ 21
trace_m13 db "pulse.lang.IO.println"
trace_m13_len equ 21
trace_m14 db "pulse.lang.IO.println"
trace_m14_len equ 21
trace_m15 db "pulse.lang.IO.print"
trace_m15_len equ 19
trace_m16 db "pulse.lang.IO.print"
trace_m16_len equ 19
trace_m17 db "pulse.lang.IO.print"
trace_m17_len equ 19
trace_m18 db "pulse.lang.IO.print"
trace_m18_len equ 19
trace_m19 db "pulse.lang.IO.print"
trace_m19_len equ 19
trace_m20 db "pulse.lang.IO.print"
trace_m20_len equ 19
trace_m21 db "pulse.lang.IO.print"
trace_m21_len equ 19
trace_m22 db "pulse.lang.IO.print"
trace_m22_len equ 19
trace_m23 db "pulse.lang.IO.print"
trace_m23_len equ 19
trace_m24 db "pulse.lang.IO.print"
trace_m24_len equ 19
trace_m25 db "pulse.lang.IO.print"
trace_m25_len equ 19
trace_m26 db "pulse.lang.IO.print"
trace_m26_len equ 19
trace_m27 db "pulse.lang.IO.print"
trace_m27_len equ 19
trace_m28 db "pulse.lang.IO.print"
trace_m28_len equ 19
trace_m29 db "pulse.lang.IO.print"
trace_m29_len equ 19

.code
pulsec_pulse_lang_IO_println__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__String_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__String_epilogue
pulsec_pulse_lang_IO_println__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_IO_println__String endp

pulsec_pulse_lang_IO_println__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__Object_b0:
    mov rax, qword ptr [rsp+64]
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
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__Object_epilogue
pulsec_pulse_lang_IO_println__Object_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__Object endp

pulsec_pulse_lang_IO_println__charArr proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__charArr_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__charArr
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__charArr_epilogue
pulsec_pulse_lang_IO_println__charArr_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__charArr_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__charArr endp

pulsec_pulse_lang_IO_println__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__int_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__int_epilogue
pulsec_pulse_lang_IO_println__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__int endp

pulsec_pulse_lang_IO_println__byte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__byte_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__byte
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__byte_epilogue
pulsec_pulse_lang_IO_println__byte_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__byte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__byte endp

pulsec_pulse_lang_IO_println__short proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__short_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__short
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__short_epilogue
pulsec_pulse_lang_IO_println__short_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__short_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__short endp

pulsec_pulse_lang_IO_println__long proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__long_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__long_epilogue
pulsec_pulse_lang_IO_println__long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__long endp

pulsec_pulse_lang_IO_println__char proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__char_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__char_epilogue
pulsec_pulse_lang_IO_println__char_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__char_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__char endp

pulsec_pulse_lang_IO_println__float proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__float_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__float
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__float_epilogue
pulsec_pulse_lang_IO_println__float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__float endp

pulsec_pulse_lang_IO_println__double proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__double_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__double
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__double_epilogue
pulsec_pulse_lang_IO_println__double_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__double_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__double endp

pulsec_pulse_lang_IO_println__ubyte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__ubyte_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ubyte
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__ubyte_epilogue
pulsec_pulse_lang_IO_println__ubyte_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__ubyte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__ubyte endp

pulsec_pulse_lang_IO_println__ushort proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__ushort_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ushort
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__ushort_epilogue
pulsec_pulse_lang_IO_println__ushort_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__ushort_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__ushort endp

pulsec_pulse_lang_IO_println__uint proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__uint_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__uint
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__uint_epilogue
pulsec_pulse_lang_IO_println__uint_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__uint_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__uint endp

pulsec_pulse_lang_IO_println__ulong proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__ulong
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__ulong_epilogue
pulsec_pulse_lang_IO_println__ulong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__ulong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__ulong endp

pulsec_pulse_lang_IO_println__boolean proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__boolean
    mov rcx, rax
    call pulsec_rt_consoleWriteLine
    xor eax, eax
    jmp pulsec_pulse_lang_IO_println__boolean_epilogue
pulsec_pulse_lang_IO_println__boolean_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_println__boolean_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_println__boolean endp

pulsec_pulse_lang_IO_print__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__String_b0:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__String_epilogue
pulsec_pulse_lang_IO_print__String_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_IO_print__String endp

pulsec_pulse_lang_IO_print__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__Object_b0:
    mov rax, qword ptr [rsp+64]
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
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__Object_epilogue
pulsec_pulse_lang_IO_print__Object_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__Object endp

pulsec_pulse_lang_IO_print__charArr proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__charArr_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__charArr
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__charArr_epilogue
pulsec_pulse_lang_IO_print__charArr_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__charArr_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__charArr endp

pulsec_pulse_lang_IO_print__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__int_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__int_epilogue
pulsec_pulse_lang_IO_print__int_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__int endp

pulsec_pulse_lang_IO_print__byte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__byte_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__byte
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__byte_epilogue
pulsec_pulse_lang_IO_print__byte_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__byte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__byte endp

pulsec_pulse_lang_IO_print__short proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__short_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__short
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__short_epilogue
pulsec_pulse_lang_IO_print__short_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__short_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__short endp

pulsec_pulse_lang_IO_print__long proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__long_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__long
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__long_epilogue
pulsec_pulse_lang_IO_print__long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__long endp

pulsec_pulse_lang_IO_print__char proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__char_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__char_epilogue
pulsec_pulse_lang_IO_print__char_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__char_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__char endp

pulsec_pulse_lang_IO_print__float proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__float_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__float
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__float_epilogue
pulsec_pulse_lang_IO_print__float_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__float endp

pulsec_pulse_lang_IO_print__double proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__double_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__double
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__double_epilogue
pulsec_pulse_lang_IO_print__double_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__double_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__double endp

pulsec_pulse_lang_IO_print__ubyte proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__ubyte_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ubyte
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__ubyte_epilogue
pulsec_pulse_lang_IO_print__ubyte_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__ubyte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__ubyte endp

pulsec_pulse_lang_IO_print__ushort proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__ushort_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__ushort
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__ushort_epilogue
pulsec_pulse_lang_IO_print__ushort_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__ushort_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__ushort endp

pulsec_pulse_lang_IO_print__uint proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__uint_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__uint
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__uint_epilogue
pulsec_pulse_lang_IO_print__uint_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__uint_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__uint endp

pulsec_pulse_lang_IO_print__ulong proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__ulong
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__ulong_epilogue
pulsec_pulse_lang_IO_print__ulong_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__ulong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__ulong endp

pulsec_pulse_lang_IO_print__boolean proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__boolean_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__boolean
    mov rcx, rax
    call pulsec_rt_consoleWrite
    xor eax, eax
    jmp pulsec_pulse_lang_IO_print__boolean_epilogue
pulsec_pulse_lang_IO_print__boolean_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_lang_IO_print__boolean_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 280
    ret
pulsec_pulse_lang_IO_print__boolean endp

end
