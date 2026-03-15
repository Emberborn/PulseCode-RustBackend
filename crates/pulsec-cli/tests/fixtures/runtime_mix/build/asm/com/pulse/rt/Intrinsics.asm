option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc


.data
written dq 0
pulsec_objc_com_pulse_rt_Intrinsics dd 0
trace_m0 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m0_len equ 36
trace_m1 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m1_len equ 36
trace_m2 db "com.pulse.rt.Intrinsics.consoleWrite"
trace_m2_len equ 36
trace_m3 db "com.pulse.rt.Intrinsics.consoleErrorWrite"
trace_m3_len equ 41
trace_m4 db "com.pulse.rt.Intrinsics.consoleErrorWrite"
trace_m4_len equ 41
trace_m5 db "com.pulse.rt.Intrinsics.consoleErrorWrite"
trace_m5_len equ 41
trace_m6 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m6_len equ 40
trace_m7 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m7_len equ 40
trace_m8 db "com.pulse.rt.Intrinsics.consoleWriteLine"
trace_m8_len equ 40
trace_m9 db "com.pulse.rt.Intrinsics.consoleErrorWriteLine"
trace_m9_len equ 45
trace_m10 db "com.pulse.rt.Intrinsics.consoleErrorWriteLine"
trace_m10_len equ 45
trace_m11 db "com.pulse.rt.Intrinsics.consoleErrorWriteLine"
trace_m11_len equ 45
trace_m12 db "com.pulse.rt.Intrinsics.panic"
trace_m12_len equ 29
trace_m13 db "com.pulse.rt.Intrinsics.stringConcat"
trace_m13_len equ 36
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0 db "com.pulse.rt.Intrinsics.stringConcat(Intrinsics.pulse:103)"
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len equ 58
trace_m15 db "com.pulse.rt.Intrinsics.stringLength"
trace_m15_len equ 36
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0 db "com.pulse.rt.Intrinsics.stringLength(Intrinsics.pulse:111)"
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0_len equ 58
trace_m17 db "com.pulse.rt.Intrinsics.intToString"
trace_m17_len equ 35
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0 db "com.pulse.rt.Intrinsics.intToString(Intrinsics.pulse:119)"
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0_len equ 57
trace_m19 db "com.pulse.rt.Intrinsics.booleanToString"
trace_m19_len equ 39
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0 db "com.pulse.rt.Intrinsics.booleanToString(Intrinsics.pulse:127)"
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0_len equ 61
trace_m21 db "com.pulse.rt.Intrinsics.parseInt"
trace_m21_len equ 32
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0 db "com.pulse.rt.Intrinsics.parseInt(Intrinsics.pulse:135)"
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0_len equ 54
trace_m23 db "com.pulse.rt.Intrinsics.parseBoolean"
trace_m23_len equ 36
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0 db "com.pulse.rt.Intrinsics.parseBoolean(Intrinsics.pulse:143)"
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0_len equ 58
trace_m25 db "com.pulse.rt.Intrinsics.objectClassName"
trace_m25_len equ 39
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectClassName(Intrinsics.pulse:151)"
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len equ 61
trace_m27 db "com.pulse.rt.Intrinsics.objectHashCode"
trace_m27_len equ 38
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectHashCode(Intrinsics.pulse:159)"
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len equ 60
trace_m29 db "com.pulse.rt.Intrinsics.arrayNew"
trace_m29_len equ 32
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0 db "com.pulse.rt.Intrinsics.arrayNew(Intrinsics.pulse:167)"
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len equ 54
trace_m31 db "com.pulse.rt.Intrinsics.arrayLength"
trace_m31_len equ 35
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0 db "com.pulse.rt.Intrinsics.arrayLength(Intrinsics.pulse:175)"
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len equ 57
trace_m33 db "com.pulse.rt.Intrinsics.arrayGetInt"
trace_m33_len equ 35
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetInt(Intrinsics.pulse:183)"
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len equ 57
trace_m35 db "com.pulse.rt.Intrinsics.arraySetInt"
trace_m35_len equ 35
trace_m36 db "com.pulse.rt.Intrinsics.arrayGetString"
trace_m36_len equ 38
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetString(Intrinsics.pulse:198)"
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len equ 60
trace_m38 db "com.pulse.rt.Intrinsics.arraySetString"
trace_m38_len equ 38
trace_m39 db "com.pulse.rt.Intrinsics.listNew"
trace_m39_len equ 31
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0 db "com.pulse.rt.Intrinsics.listNew(Intrinsics.pulse:213)"
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0_len equ 53
trace_m41 db "com.pulse.rt.Intrinsics.listSize"
trace_m41_len equ 32
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0 db "com.pulse.rt.Intrinsics.listSize(Intrinsics.pulse:221)"
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0_len equ 54
trace_m43 db "com.pulse.rt.Intrinsics.listClear"
trace_m43_len equ 33
trace_m44 db "com.pulse.rt.Intrinsics.listAddInt"
trace_m44_len equ 34
trace_m45 db "com.pulse.rt.Intrinsics.listAddString"
trace_m45_len equ 37
trace_m46 db "com.pulse.rt.Intrinsics.listGetInt"
trace_m46_len equ 34
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetInt(Intrinsics.pulse:250)"
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len equ 56
trace_m48 db "com.pulse.rt.Intrinsics.listGetString"
trace_m48_len equ 37
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetString(Intrinsics.pulse:258)"
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len equ 59
trace_m50 db "com.pulse.rt.Intrinsics.mapNew"
trace_m50_len equ 30
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0 db "com.pulse.rt.Intrinsics.mapNew(Intrinsics.pulse:266)"
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0_len equ 52
trace_m52 db "com.pulse.rt.Intrinsics.mapSize"
trace_m52_len equ 31
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0 db "com.pulse.rt.Intrinsics.mapSize(Intrinsics.pulse:274)"
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0_len equ 53
trace_m54 db "com.pulse.rt.Intrinsics.mapClear"
trace_m54_len equ 32
trace_m55 db "com.pulse.rt.Intrinsics.mapContainsKey"
trace_m55_len equ 38
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapContainsKey(Intrinsics.pulse:289)"
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len equ 60
trace_m57 db "com.pulse.rt.Intrinsics.mapPut"
trace_m57_len equ 30
trace_m58 db "com.pulse.rt.Intrinsics.mapPutInt"
trace_m58_len equ 33
trace_m59 db "com.pulse.rt.Intrinsics.mapGet"
trace_m59_len equ 30
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGet(Intrinsics.pulse:311)"
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len equ 52
trace_m61 db "com.pulse.rt.Intrinsics.mapGetInt"
trace_m61_len equ 33
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGetInt(Intrinsics.pulse:319)"
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len equ 55
msg0 db 0
msg0_len equ 0
msg1 db 0
msg1_len equ 0
msg2 db 0
msg2_len equ 0
msg3 db 0
msg3_len equ 0
msg4 db 0
msg4_len equ 0
msg5 db 0
msg5_len equ 0
msg6 db 0
msg6_len equ 0

.code
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__int proc
    sub rsp, 184
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
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean proc
    sub rsp, 184
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
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWrite__boolean endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__String endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__int endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWrite__boolean endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__String endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__int endp

pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleWriteLine__boolean endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__String endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__int endp

pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_consoleErrorWriteLine__boolean endp

pulsec_com_pulse_rt_Intrinsics_panic__String proc
    sub rsp, 184
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
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_panic__String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_panic__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_panic__String endp

pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String endp

pulsec_com_pulse_rt_Intrinsics_stringLength__String proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_stringLength__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_stringLength__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_stringLength__String endp

pulsec_com_pulse_rt_Intrinsics_intToString__int proc
    sub rsp, 184
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_intToString__int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_intToString__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_intToString__int endp

pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean proc
    sub rsp, 184
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue:
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean endp

pulsec_com_pulse_rt_Intrinsics_parseInt__String proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_parseInt__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_parseInt__String endp

pulsec_com_pulse_rt_Intrinsics_parseBoolean__String proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue:
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String endp

pulsec_com_pulse_rt_Intrinsics_objectClassName__Object proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue:
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object endp

pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue:
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object endp

pulsec_com_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 184
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
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_arrayNew__int endp

pulsec_com_pulse_rt_Intrinsics_arrayLength__long proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_arrayLength__long endp

pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 200
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
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int proc
    sub rsp, 200
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
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int endp

pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String proc
    sub rsp, 200
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
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String endp

pulsec_com_pulse_rt_Intrinsics_listNew proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_listNew_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listNew_epilogue
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_listNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_listNew endp

pulsec_com_pulse_rt_Intrinsics_listSize__long proc
    sub rsp, 184
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
pulsec_com_pulse_rt_Intrinsics_listSize__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_listSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_listSize__long endp

pulsec_com_pulse_rt_Intrinsics_listClear__long proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
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
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_listClear__long endp

pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
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
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_listAddInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listAddString__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String endp

pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_mapNew proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
pulsec_com_pulse_rt_Intrinsics_mapNew_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    movsxd rax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapNew_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_mapNew endp

pulsec_com_pulse_rt_Intrinsics_mapSize__long proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
pulsec_com_pulse_rt_Intrinsics_mapSize__long_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapSize__long_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_mapSize__long endp

pulsec_com_pulse_rt_Intrinsics_mapClear__long proc
    sub rsp, 184
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
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
    add rsp, 184
    ret
pulsec_com_pulse_rt_Intrinsics_mapClear__long endp

pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String endp

pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_b0:
    xor eax, eax
    jmp pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int endp

pulsec_com_pulse_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_b0:
    lea rcx, pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0
    mov edx, pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue:
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 200
    ret
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String endp

end
