option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc

.data
written dq 0
pulsec_objc_com_pulse_rt_Intrinsics dd 0
trace_m0 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.rt.Intrinsics.panic"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.rt.Intrinsics.stringConcat"
trace_m7_len equ $ - trace_m7
trace_m8 db "com.pulse.rt.Intrinsics.stringLength"
trace_m8_len equ $ - trace_m8
trace_m9 db "com.pulse.rt.Intrinsics.intToString"
trace_m9_len equ $ - trace_m9
trace_m10 db "com.pulse.rt.Intrinsics.booleanToString"
trace_m10_len equ $ - trace_m10
trace_m11 db "com.pulse.rt.Intrinsics.parseInt"
trace_m11_len equ $ - trace_m11
trace_m12 db "com.pulse.rt.Intrinsics.parseBoolean"
trace_m12_len equ $ - trace_m12
trace_m13 db "com.pulse.rt.Intrinsics.arrayNew"
trace_m13_len equ $ - trace_m13
trace_m14 db "com.pulse.rt.Intrinsics.arrayLength"
trace_m14_len equ $ - trace_m14
trace_m15 db "com.pulse.rt.Intrinsics.arrayGetInt"
trace_m15_len equ $ - trace_m15
trace_m16 db "com.pulse.rt.Intrinsics.arraySetInt"
trace_m16_len equ $ - trace_m16
trace_m17 db "com.pulse.rt.Intrinsics.arrayGetString"
trace_m17_len equ $ - trace_m17
trace_m18 db "com.pulse.rt.Intrinsics.arraySetString"
trace_m18_len equ $ - trace_m18
trace_m19 db "com.pulse.rt.Intrinsics.listNew"
trace_m19_len equ $ - trace_m19
trace_m20 db "com.pulse.rt.Intrinsics.listSize"
trace_m20_len equ $ - trace_m20
trace_m21 db "com.pulse.rt.Intrinsics.listClear"
trace_m21_len equ $ - trace_m21
trace_m22 db "com.pulse.rt.Intrinsics.listAddInt"
trace_m22_len equ $ - trace_m22
trace_m23 db "com.pulse.rt.Intrinsics.listAddString"
trace_m23_len equ $ - trace_m23
trace_m24 db "com.pulse.rt.Intrinsics.listGetInt"
trace_m24_len equ $ - trace_m24
trace_m25 db "com.pulse.rt.Intrinsics.listGetString"
trace_m25_len equ $ - trace_m25
trace_m26 db "com.pulse.rt.Intrinsics.mapNew"
trace_m26_len equ $ - trace_m26
trace_m27 db "com.pulse.rt.Intrinsics.mapSize"
trace_m27_len equ $ - trace_m27
trace_m28 db "com.pulse.rt.Intrinsics.mapClear"
trace_m28_len equ $ - trace_m28
trace_m29 db "com.pulse.rt.Intrinsics.mapContainsKey"
trace_m29_len equ $ - trace_m29
trace_m30 db "com.pulse.rt.Intrinsics.mapPut"
trace_m30_len equ $ - trace_m30
trace_m31 db "com.pulse.rt.Intrinsics.mapPutInt"
trace_m31_len equ $ - trace_m31
trace_m32 db "com.pulse.rt.Intrinsics.mapGet"
trace_m32_len equ $ - trace_m32
trace_m33 db "com.pulse.rt.Intrinsics.mapGetInt"
trace_m33_len equ $ - trace_m33
trace_m34 db "com.pulse.rt.Intrinsics.arcRetain"
trace_m34_len equ $ - trace_m34
trace_m35 db "com.pulse.rt.Intrinsics.arcRelease"
trace_m35_len equ $ - trace_m35
trace_m36 db "com.pulse.rt.Intrinsics.arcRelease"
trace_m36_len equ $ - trace_m36
trace_m37 db "com.pulse.rt.Intrinsics.arcCycleYoungPass"
trace_m37_len equ $ - trace_m37
trace_m38 db "com.pulse.rt.Intrinsics.arcCycleFullPass"
trace_m38_len equ $ - trace_m38
trace_m39 db "com.pulse.rt.Intrinsics.arcCycleTick"
trace_m39_len equ $ - trace_m39
trace_m40 db "com.pulse.rt.Intrinsics.weakNew"
trace_m40_len equ $ - trace_m40
trace_m41 db "com.pulse.rt.Intrinsics.weakGet"
trace_m41_len equ $ - trace_m41
trace_m42 db "com.pulse.rt.Intrinsics.weakClear"
trace_m42_len equ $ - trace_m42
msg0 db 0
msg0_len equ $ - msg0
msg1 db 0
msg1_len equ $ - msg1
msg2 db 0
msg2_len equ $ - msg2
msg3 db 0
msg3_len equ $ - msg3
msg4 db 0
msg4_len equ $ - msg4
msg5 db 0
msg5_len equ $ - msg5
msg6 db 0
msg6_len equ $ - msg6

.code
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean endp

pulsec_com_pulse_rt_Intrinsics_panic__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_panic__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_panic__String endp

pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_b0:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String endp

pulsec_com_pulse_rt_Intrinsics_stringLength__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_stringLength__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_stringLength__String endp

pulsec_com_pulse_rt_Intrinsics_intToString__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_intToString__int_b0:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_intToString__int endp

pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_b0:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean endp

pulsec_com_pulse_rt_Intrinsics_parseInt__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_parseInt__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseInt__String endp

pulsec_com_pulse_rt_Intrinsics_parseBoolean__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String endp

pulsec_com_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayNew__int endp

pulsec_com_pulse_rt_Intrinsics_arrayLength__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayLength__long endp

pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int endp

pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_b0:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String endp

pulsec_com_pulse_rt_Intrinsics_listNew proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_listNew_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listNew_epilogue
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listNew endp

pulsec_com_pulse_rt_Intrinsics_listSize__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_listSize__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listSize__long endp

pulsec_com_pulse_rt_Intrinsics_listClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_listClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_listClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listClear__long endp

pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listAddString__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String endp

pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_b0:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_mapNew proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_mapNew_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapNew endp

pulsec_com_pulse_rt_Intrinsics_mapSize__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapSize__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapSize__long endp

pulsec_com_pulse_rt_Intrinsics_mapClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapClear__long endp

pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String endp

pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int endp

pulsec_com_pulse_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_b0:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String endp

pulsec_com_pulse_rt_Intrinsics_arcRetain__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRetain__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRetain__long endp

pulsec_com_pulse_rt_Intrinsics_arcRelease__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRelease__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRelease__long endp

pulsec_com_pulse_rt_Intrinsics_arcRelease__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcRelease__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcRelease__String endp

pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleYoungPass endp

pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleFullPass endp

pulsec_com_pulse_rt_Intrinsics_arcCycleTick proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue:
pulsec_com_pulse_rt_Intrinsics_arcCycleTick_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arcCycleTick endp

pulsec_com_pulse_rt_Intrinsics_weakNew__String proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_weakNew__String_b0:
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue
pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakNew__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakNew__String endp

pulsec_com_pulse_rt_Intrinsics_weakGet__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_weakGet__long_b0:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue
pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakGet__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakGet__long endp

pulsec_com_pulse_rt_Intrinsics_weakClear__long proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_weakClear__long_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue
pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_weakClear__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_weakClear__long endp

end
