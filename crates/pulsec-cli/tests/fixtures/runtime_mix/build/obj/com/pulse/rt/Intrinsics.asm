option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
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
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0 db "com.pulse.rt.Intrinsics.stringConcat(Intrinsics.pulse:61)"
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0
trace_m9 db "com.pulse.rt.Intrinsics.stringLength"
trace_m9_len equ $ - trace_m9
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0 db "com.pulse.rt.Intrinsics.stringLength(Intrinsics.pulse:69)"
pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_stringLength__String_trace_s0
trace_m11 db "com.pulse.rt.Intrinsics.intToString"
trace_m11_len equ $ - trace_m11
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0 db "com.pulse.rt.Intrinsics.intToString(Intrinsics.pulse:77)"
pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_intToString__int_trace_s0
trace_m13 db "com.pulse.rt.Intrinsics.booleanToString"
trace_m13_len equ $ - trace_m13
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0 db "com.pulse.rt.Intrinsics.booleanToString(Intrinsics.pulse:85)"
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean_trace_s0
trace_m15 db "com.pulse.rt.Intrinsics.parseInt"
trace_m15_len equ $ - trace_m15
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0 db "com.pulse.rt.Intrinsics.parseInt(Intrinsics.pulse:93)"
pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_parseInt__String_trace_s0
trace_m17 db "com.pulse.rt.Intrinsics.parseBoolean"
trace_m17_len equ $ - trace_m17
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0 db "com.pulse.rt.Intrinsics.parseBoolean(Intrinsics.pulse:101)"
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_parseBoolean__String_trace_s0
trace_m19 db "com.pulse.rt.Intrinsics.objectClassName"
trace_m19_len equ $ - trace_m19
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectClassName(Intrinsics.pulse:109)"
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_objectClassName__Object_trace_s0
trace_m21 db "com.pulse.rt.Intrinsics.objectHashCode"
trace_m21_len equ $ - trace_m21
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0 db "com.pulse.rt.Intrinsics.objectHashCode(Intrinsics.pulse:117)"
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0
trace_m23 db "com.pulse.rt.Intrinsics.arrayNew"
trace_m23_len equ $ - trace_m23
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0 db "com.pulse.rt.Intrinsics.arrayNew(Intrinsics.pulse:125)"
pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayNew__int_trace_s0
trace_m25 db "com.pulse.rt.Intrinsics.arrayLength"
trace_m25_len equ $ - trace_m25
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0 db "com.pulse.rt.Intrinsics.arrayLength(Intrinsics.pulse:133)"
pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayLength__long_trace_s0
trace_m27 db "com.pulse.rt.Intrinsics.arrayGetInt"
trace_m27_len equ $ - trace_m27
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetInt(Intrinsics.pulse:141)"
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0
trace_m29 db "com.pulse.rt.Intrinsics.arraySetInt"
trace_m29_len equ $ - trace_m29
trace_m30 db "com.pulse.rt.Intrinsics.arrayGetString"
trace_m30_len equ $ - trace_m30
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.arrayGetString(Intrinsics.pulse:156)"
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0
trace_m32 db "com.pulse.rt.Intrinsics.arraySetString"
trace_m32_len equ $ - trace_m32
trace_m33 db "com.pulse.rt.Intrinsics.listNew"
trace_m33_len equ $ - trace_m33
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0 db "com.pulse.rt.Intrinsics.listNew(Intrinsics.pulse:171)"
pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listNew_trace_s0
trace_m35 db "com.pulse.rt.Intrinsics.listSize"
trace_m35_len equ $ - trace_m35
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0 db "com.pulse.rt.Intrinsics.listSize(Intrinsics.pulse:179)"
pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listSize__long_trace_s0
trace_m37 db "com.pulse.rt.Intrinsics.listClear"
trace_m37_len equ $ - trace_m37
trace_m38 db "com.pulse.rt.Intrinsics.listAddInt"
trace_m38_len equ $ - trace_m38
trace_m39 db "com.pulse.rt.Intrinsics.listAddString"
trace_m39_len equ $ - trace_m39
trace_m40 db "com.pulse.rt.Intrinsics.listGetInt"
trace_m40_len equ $ - trace_m40
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetInt(Intrinsics.pulse:208)"
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0
trace_m42 db "com.pulse.rt.Intrinsics.listGetString"
trace_m42_len equ $ - trace_m42
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0 db "com.pulse.rt.Intrinsics.listGetString(Intrinsics.pulse:216)"
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_listGetString__long_int_trace_s0
trace_m44 db "com.pulse.rt.Intrinsics.mapNew"
trace_m44_len equ $ - trace_m44
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0 db "com.pulse.rt.Intrinsics.mapNew(Intrinsics.pulse:224)"
pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapNew_trace_s0
trace_m46 db "com.pulse.rt.Intrinsics.mapSize"
trace_m46_len equ $ - trace_m46
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0 db "com.pulse.rt.Intrinsics.mapSize(Intrinsics.pulse:232)"
pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapSize__long_trace_s0
trace_m48 db "com.pulse.rt.Intrinsics.mapClear"
trace_m48_len equ $ - trace_m48
trace_m49 db "com.pulse.rt.Intrinsics.mapContainsKey"
trace_m49_len equ $ - trace_m49
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapContainsKey(Intrinsics.pulse:247)"
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0
trace_m51 db "com.pulse.rt.Intrinsics.mapPut"
trace_m51_len equ $ - trace_m51
trace_m52 db "com.pulse.rt.Intrinsics.mapPutInt"
trace_m52_len equ $ - trace_m52
trace_m53 db "com.pulse.rt.Intrinsics.mapGet"
trace_m53_len equ $ - trace_m53
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGet(Intrinsics.pulse:269)"
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapGet__long_String_trace_s0
trace_m55 db "com.pulse.rt.Intrinsics.mapGetInt"
trace_m55_len equ $ - trace_m55
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0 db "com.pulse.rt.Intrinsics.mapGetInt(Intrinsics.pulse:277)"
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len equ $ - pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0
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
    mov qword ptr [rsp+64], rcx
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
    mov qword ptr [rsp+64], rcx
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
    mov qword ptr [rsp+64], rcx
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_stringConcat__String_String endp

pulsec_com_pulse_rt_Intrinsics_stringLength__String proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_stringLength__String endp

pulsec_com_pulse_rt_Intrinsics_intToString__int proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_intToString__int endp

pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_booleanToString__boolean endp

pulsec_com_pulse_rt_Intrinsics_parseInt__String proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseInt__String endp

pulsec_com_pulse_rt_Intrinsics_parseBoolean__String proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_parseBoolean__String endp

pulsec_com_pulse_rt_Intrinsics_objectClassName__Object proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_objectClassName__Object endp

pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_objectHashCode__Object endp

pulsec_com_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayNew__int endp

pulsec_com_pulse_rt_Intrinsics_arrayLength__long proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_arrayLength__long endp

pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetInt__long_int_int proc
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
    lea rcx, trace_m30
    mov edx, trace_m30_len
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_arrayGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_arraySetString__long_int_String proc
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
    mov qword ptr [rsp+80], r8
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
    lea rcx, trace_m33
    mov edx, trace_m33_len
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listNew endp

pulsec_com_pulse_rt_Intrinsics_listSize__long proc
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_listSize__long endp

pulsec_com_pulse_rt_Intrinsics_listClear__long proc
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
    lea rcx, trace_m38
    mov edx, trace_m38_len
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
    lea rcx, trace_m39
    mov edx, trace_m39_len
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listAddString__long_String endp

pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetInt__long_int endp

pulsec_com_pulse_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_listGetString__long_int endp

pulsec_com_pulse_rt_Intrinsics_mapNew proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapNew endp

pulsec_com_pulse_rt_Intrinsics_mapSize__long proc
    sub rsp, 120
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
    add rsp, 120
    ret
pulsec_com_pulse_rt_Intrinsics_mapSize__long endp

pulsec_com_pulse_rt_Intrinsics_mapClear__long proc
    sub rsp, 120
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
    lea rcx, trace_m49
    mov edx, trace_m49_len
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapContainsKey__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPut__long_String_String endp

pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapPutInt__long_String_int endp

pulsec_com_pulse_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGet__long_String endp

pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 136
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
    add rsp, 136
    ret
pulsec_com_pulse_rt_Intrinsics_mapGetInt__long_String endp

end
