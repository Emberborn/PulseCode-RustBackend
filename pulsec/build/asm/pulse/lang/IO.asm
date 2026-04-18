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
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
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
pulsec_pulse_lang_IO_println__String_trace_s0 db "pulse.lang.IO.println(IO.pulse:14)"
pulsec_pulse_lang_IO_println__String_trace_s0_len equ 34
trace_m2 db "pulse.lang.IO.println"
trace_m2_len equ 21
pulsec_pulse_lang_IO_println__Object_trace_s0 db "pulse.lang.IO.println(IO.pulse:22)"
pulsec_pulse_lang_IO_println__Object_trace_s0_len equ 34
trace_m4 db "pulse.lang.IO.println"
trace_m4_len equ 21
pulsec_pulse_lang_IO_println__charArr_trace_s0 db "pulse.lang.IO.println(IO.pulse:30)"
pulsec_pulse_lang_IO_println__charArr_trace_s0_len equ 34
trace_m6 db "pulse.lang.IO.println"
trace_m6_len equ 21
pulsec_pulse_lang_IO_println__int_trace_s0 db "pulse.lang.IO.println(IO.pulse:38)"
pulsec_pulse_lang_IO_println__int_trace_s0_len equ 34
trace_m8 db "pulse.lang.IO.println"
trace_m8_len equ 21
pulsec_pulse_lang_IO_println__byte_trace_s0 db "pulse.lang.IO.println(IO.pulse:46)"
pulsec_pulse_lang_IO_println__byte_trace_s0_len equ 34
trace_m10 db "pulse.lang.IO.println"
trace_m10_len equ 21
pulsec_pulse_lang_IO_println__short_trace_s0 db "pulse.lang.IO.println(IO.pulse:54)"
pulsec_pulse_lang_IO_println__short_trace_s0_len equ 34
trace_m12 db "pulse.lang.IO.println"
trace_m12_len equ 21
pulsec_pulse_lang_IO_println__long_trace_s0 db "pulse.lang.IO.println(IO.pulse:62)"
pulsec_pulse_lang_IO_println__long_trace_s0_len equ 34
trace_m14 db "pulse.lang.IO.println"
trace_m14_len equ 21
pulsec_pulse_lang_IO_println__char_trace_s0 db "pulse.lang.IO.println(IO.pulse:70)"
pulsec_pulse_lang_IO_println__char_trace_s0_len equ 34
trace_m16 db "pulse.lang.IO.println"
trace_m16_len equ 21
pulsec_pulse_lang_IO_println__float_trace_s0 db "pulse.lang.IO.println(IO.pulse:78)"
pulsec_pulse_lang_IO_println__float_trace_s0_len equ 34
trace_m18 db "pulse.lang.IO.println"
trace_m18_len equ 21
pulsec_pulse_lang_IO_println__double_trace_s0 db "pulse.lang.IO.println(IO.pulse:86)"
pulsec_pulse_lang_IO_println__double_trace_s0_len equ 34
trace_m20 db "pulse.lang.IO.println"
trace_m20_len equ 21
pulsec_pulse_lang_IO_println__ubyte_trace_s0 db "pulse.lang.IO.println(IO.pulse:94)"
pulsec_pulse_lang_IO_println__ubyte_trace_s0_len equ 34
trace_m22 db "pulse.lang.IO.println"
trace_m22_len equ 21
pulsec_pulse_lang_IO_println__ushort_trace_s0 db "pulse.lang.IO.println(IO.pulse:102)"
pulsec_pulse_lang_IO_println__ushort_trace_s0_len equ 35
trace_m24 db "pulse.lang.IO.println"
trace_m24_len equ 21
pulsec_pulse_lang_IO_println__uint_trace_s0 db "pulse.lang.IO.println(IO.pulse:110)"
pulsec_pulse_lang_IO_println__uint_trace_s0_len equ 35
trace_m26 db "pulse.lang.IO.println"
trace_m26_len equ 21
pulsec_pulse_lang_IO_println__ulong_trace_s0 db "pulse.lang.IO.println(IO.pulse:118)"
pulsec_pulse_lang_IO_println__ulong_trace_s0_len equ 35
trace_m28 db "pulse.lang.IO.println"
trace_m28_len equ 21
pulsec_pulse_lang_IO_println__boolean_trace_s0 db "pulse.lang.IO.println(IO.pulse:126)"
pulsec_pulse_lang_IO_println__boolean_trace_s0_len equ 35
trace_m30 db "pulse.lang.IO.print"
trace_m30_len equ 19
pulsec_pulse_lang_IO_print__String_trace_s0 db "pulse.lang.IO.print(IO.pulse:134)"
pulsec_pulse_lang_IO_print__String_trace_s0_len equ 33
trace_m32 db "pulse.lang.IO.print"
trace_m32_len equ 19
pulsec_pulse_lang_IO_print__Object_trace_s0 db "pulse.lang.IO.print(IO.pulse:142)"
pulsec_pulse_lang_IO_print__Object_trace_s0_len equ 33
trace_m34 db "pulse.lang.IO.print"
trace_m34_len equ 19
pulsec_pulse_lang_IO_print__charArr_trace_s0 db "pulse.lang.IO.print(IO.pulse:150)"
pulsec_pulse_lang_IO_print__charArr_trace_s0_len equ 33
trace_m36 db "pulse.lang.IO.print"
trace_m36_len equ 19
pulsec_pulse_lang_IO_print__int_trace_s0 db "pulse.lang.IO.print(IO.pulse:158)"
pulsec_pulse_lang_IO_print__int_trace_s0_len equ 33
trace_m38 db "pulse.lang.IO.print"
trace_m38_len equ 19
pulsec_pulse_lang_IO_print__byte_trace_s0 db "pulse.lang.IO.print(IO.pulse:166)"
pulsec_pulse_lang_IO_print__byte_trace_s0_len equ 33
trace_m40 db "pulse.lang.IO.print"
trace_m40_len equ 19
pulsec_pulse_lang_IO_print__short_trace_s0 db "pulse.lang.IO.print(IO.pulse:174)"
pulsec_pulse_lang_IO_print__short_trace_s0_len equ 33
trace_m42 db "pulse.lang.IO.print"
trace_m42_len equ 19
pulsec_pulse_lang_IO_print__long_trace_s0 db "pulse.lang.IO.print(IO.pulse:182)"
pulsec_pulse_lang_IO_print__long_trace_s0_len equ 33
trace_m44 db "pulse.lang.IO.print"
trace_m44_len equ 19
pulsec_pulse_lang_IO_print__char_trace_s0 db "pulse.lang.IO.print(IO.pulse:190)"
pulsec_pulse_lang_IO_print__char_trace_s0_len equ 33
trace_m46 db "pulse.lang.IO.print"
trace_m46_len equ 19
pulsec_pulse_lang_IO_print__float_trace_s0 db "pulse.lang.IO.print(IO.pulse:198)"
pulsec_pulse_lang_IO_print__float_trace_s0_len equ 33
trace_m48 db "pulse.lang.IO.print"
trace_m48_len equ 19
pulsec_pulse_lang_IO_print__double_trace_s0 db "pulse.lang.IO.print(IO.pulse:206)"
pulsec_pulse_lang_IO_print__double_trace_s0_len equ 33
trace_m50 db "pulse.lang.IO.print"
trace_m50_len equ 19
pulsec_pulse_lang_IO_print__ubyte_trace_s0 db "pulse.lang.IO.print(IO.pulse:214)"
pulsec_pulse_lang_IO_print__ubyte_trace_s0_len equ 33
trace_m52 db "pulse.lang.IO.print"
trace_m52_len equ 19
pulsec_pulse_lang_IO_print__ushort_trace_s0 db "pulse.lang.IO.print(IO.pulse:222)"
pulsec_pulse_lang_IO_print__ushort_trace_s0_len equ 33
trace_m54 db "pulse.lang.IO.print"
trace_m54_len equ 19
pulsec_pulse_lang_IO_print__uint_trace_s0 db "pulse.lang.IO.print(IO.pulse:230)"
pulsec_pulse_lang_IO_print__uint_trace_s0_len equ 33
trace_m56 db "pulse.lang.IO.print"
trace_m56_len equ 19
pulsec_pulse_lang_IO_print__ulong_trace_s0 db "pulse.lang.IO.print(IO.pulse:238)"
pulsec_pulse_lang_IO_print__ulong_trace_s0_len equ 33
trace_m58 db "pulse.lang.IO.print"
trace_m58_len equ 19
pulsec_pulse_lang_IO_print__boolean_trace_s0 db "pulse.lang.IO.print(IO.pulse:246)"
pulsec_pulse_lang_IO_print__boolean_trace_s0_len equ 33

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
    lea rcx, pulsec_pulse_lang_IO_println__String_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__Object_b0:
    lea rcx, pulsec_pulse_lang_IO_println__Object_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__charArr_b0:
    lea rcx, pulsec_pulse_lang_IO_println__charArr_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__charArr_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__int_b0:
    lea rcx, pulsec_pulse_lang_IO_println__int_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__byte_b0:
    lea rcx, pulsec_pulse_lang_IO_println__byte_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__short_b0:
    lea rcx, pulsec_pulse_lang_IO_println__short_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__long_b0:
    lea rcx, pulsec_pulse_lang_IO_println__long_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__char_b0:
    lea rcx, pulsec_pulse_lang_IO_println__char_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__float_b0:
    lea rcx, pulsec_pulse_lang_IO_println__float_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__double_b0:
    lea rcx, pulsec_pulse_lang_IO_println__double_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__double_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__ubyte_b0:
    lea rcx, pulsec_pulse_lang_IO_println__ubyte_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__ushort_b0:
    lea rcx, pulsec_pulse_lang_IO_println__ushort_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__uint_b0:
    lea rcx, pulsec_pulse_lang_IO_println__uint_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_println__ulong_b0:
    lea rcx, pulsec_pulse_lang_IO_println__ulong_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_println__boolean_b0:
    lea rcx, pulsec_pulse_lang_IO_println__boolean_trace_s0
    mov edx, pulsec_pulse_lang_IO_println__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__String_b0:
    lea rcx, pulsec_pulse_lang_IO_print__String_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__Object_b0:
    lea rcx, pulsec_pulse_lang_IO_print__Object_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__charArr_b0:
    lea rcx, pulsec_pulse_lang_IO_print__charArr_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__charArr_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__int_b0:
    lea rcx, pulsec_pulse_lang_IO_print__int_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__byte_b0:
    lea rcx, pulsec_pulse_lang_IO_print__byte_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__byte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__short_b0:
    lea rcx, pulsec_pulse_lang_IO_print__short_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__short_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__long_b0:
    lea rcx, pulsec_pulse_lang_IO_print__long_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__char_b0:
    lea rcx, pulsec_pulse_lang_IO_print__char_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__char_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__float_b0:
    lea rcx, pulsec_pulse_lang_IO_print__float_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__float_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__double_b0:
    lea rcx, pulsec_pulse_lang_IO_print__double_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__double_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__ubyte_b0:
    lea rcx, pulsec_pulse_lang_IO_print__ubyte_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__ubyte_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__ushort_b0:
    lea rcx, pulsec_pulse_lang_IO_print__ushort_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__ushort_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__uint_b0:
    lea rcx, pulsec_pulse_lang_IO_print__uint_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__uint_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_IO_print__ulong_b0:
    lea rcx, pulsec_pulse_lang_IO_print__ulong_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__ulong_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_IO_print__boolean_b0:
    lea rcx, pulsec_pulse_lang_IO_print__boolean_trace_s0
    mov edx, pulsec_pulse_lang_IO_print__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
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
