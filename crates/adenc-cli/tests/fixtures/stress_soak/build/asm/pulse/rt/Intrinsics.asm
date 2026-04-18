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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_objectClassName:proc
extrn pulsec_rt_objectHashCode:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_String_concat__String:proc
extrn pulsec_pulse_lang_String_length:proc
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


extrn pulsec_rt_arrayGetInt:proc
extrn pulsec_rt_arrayGetLong:proc
extrn pulsec_rt_arrayGetString:proc
extrn pulsec_rt_arrayLength:proc
extrn pulsec_rt_arrayNew:proc
extrn pulsec_rt_arraySetInt:proc
extrn pulsec_rt_arraySetLong:proc
extrn pulsec_rt_arraySetString:proc
extrn pulsec_rt_consoleErrorWrite:proc
extrn pulsec_rt_consoleErrorWriteLine:proc
extrn pulsec_rt_consoleReadLine:proc
extrn pulsec_rt_hostCreateDirectory:proc
extrn pulsec_rt_hostExists:proc
extrn pulsec_rt_hostIsDirectory:proc
extrn pulsec_rt_hostIsFile:proc
extrn pulsec_rt_hostListChildren:proc
extrn pulsec_rt_hostReadAllText:proc
extrn pulsec_rt_hostWriteAllText:proc
extrn pulsec_rt_listAddInt:proc
extrn pulsec_rt_listAddString:proc
extrn pulsec_rt_listClear:proc
extrn pulsec_rt_listGetInt:proc
extrn pulsec_rt_listGetString:proc
extrn pulsec_rt_listKind:proc
extrn pulsec_rt_listNew:proc
extrn pulsec_rt_listSize:proc
extrn pulsec_rt_mapClear:proc
extrn pulsec_rt_mapContainsKey:proc
extrn pulsec_rt_mapGet:proc
extrn pulsec_rt_mapGetInt:proc
extrn pulsec_rt_mapNew:proc
extrn pulsec_rt_mapPut:proc
extrn pulsec_rt_mapPutInt:proc
extrn pulsec_rt_mapSize:proc
extrn pulsec_rt_stringConcat:proc
extrn pulsec_rt_stringLength:proc
.data
written dq 0
pulsec_objc_pulse_rt_Intrinsics dd 0
trace_m0 db "pulse.rt.Intrinsics.consoleReadLine"
trace_m0_len equ 35
trace_m1 db "pulse.rt.Intrinsics.consoleWrite"
trace_m1_len equ 32
trace_m2 db "pulse.rt.Intrinsics.consoleErrorWrite"
trace_m2_len equ 37
trace_m3 db "pulse.rt.Intrinsics.consoleWriteLine"
trace_m3_len equ 36
trace_m4 db "pulse.rt.Intrinsics.consoleErrorWriteLine"
trace_m4_len equ 41
trace_m5 db "pulse.rt.Intrinsics.panic"
trace_m5_len equ 25
trace_m6 db "pulse.rt.Intrinsics.stringConcat"
trace_m6_len equ 32
trace_m7 db "pulse.rt.Intrinsics.stringLength"
trace_m7_len equ 32
trace_m8 db "pulse.rt.Intrinsics.objectClassName"
trace_m8_len equ 35
trace_m9 db "pulse.rt.Intrinsics.objectHashCode"
trace_m9_len equ 34
trace_m10 db "pulse.rt.Intrinsics.arrayNew"
trace_m10_len equ 28
trace_m11 db "pulse.rt.Intrinsics.arrayLength"
trace_m11_len equ 31
trace_m12 db "pulse.rt.Intrinsics.arrayGetInt"
trace_m12_len equ 31
trace_m13 db "pulse.rt.Intrinsics.arraySetInt"
trace_m13_len equ 31
trace_m14 db "pulse.rt.Intrinsics.arrayGetLong"
trace_m14_len equ 32
trace_m15 db "pulse.rt.Intrinsics.arraySetLong"
trace_m15_len equ 32
trace_m16 db "pulse.rt.Intrinsics.arrayGetString"
trace_m16_len equ 34
trace_m17 db "pulse.rt.Intrinsics.arraySetString"
trace_m17_len equ 34
trace_m18 db "pulse.rt.Intrinsics.listNew"
trace_m18_len equ 27
trace_m19 db "pulse.rt.Intrinsics.listSize"
trace_m19_len equ 28
trace_m20 db "pulse.rt.Intrinsics.listKind"
trace_m20_len equ 28
trace_m21 db "pulse.rt.Intrinsics.listClear"
trace_m21_len equ 29
trace_m22 db "pulse.rt.Intrinsics.listAddInt"
trace_m22_len equ 30
trace_m23 db "pulse.rt.Intrinsics.listAddString"
trace_m23_len equ 33
trace_m24 db "pulse.rt.Intrinsics.listGetInt"
trace_m24_len equ 30
trace_m25 db "pulse.rt.Intrinsics.listGetString"
trace_m25_len equ 33
trace_m26 db "pulse.rt.Intrinsics.mapNew"
trace_m26_len equ 26
trace_m27 db "pulse.rt.Intrinsics.mapSize"
trace_m27_len equ 27
trace_m28 db "pulse.rt.Intrinsics.mapClear"
trace_m28_len equ 28
trace_m29 db "pulse.rt.Intrinsics.mapContainsKey"
trace_m29_len equ 34
trace_m30 db "pulse.rt.Intrinsics.mapPut"
trace_m30_len equ 26
trace_m31 db "pulse.rt.Intrinsics.mapPutInt"
trace_m31_len equ 29
trace_m32 db "pulse.rt.Intrinsics.mapGet"
trace_m32_len equ 26
trace_m33 db "pulse.rt.Intrinsics.mapGetInt"
trace_m33_len equ 29
trace_m34 db "pulse.rt.Intrinsics.hostExists"
trace_m34_len equ 30
trace_m35 db "pulse.rt.Intrinsics.hostIsFile"
trace_m35_len equ 30
trace_m36 db "pulse.rt.Intrinsics.hostIsDirectory"
trace_m36_len equ 35
trace_m37 db "pulse.rt.Intrinsics.hostReadAllText"
trace_m37_len equ 35
trace_m38 db "pulse.rt.Intrinsics.hostListChildren"
trace_m38_len equ 36
trace_m39 db "pulse.rt.Intrinsics.hostCreateDirectory"
trace_m39_len equ 39
trace_m40 db "pulse.rt.Intrinsics.hostWriteAllText"
trace_m40_len equ 36

.code
pulsec_pulse_rt_Intrinsics_consoleReadLine proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_rt_consoleReadLine
    jmp pulsec_pulse_rt_Intrinsics_consoleReadLine_epilogue
pulsec_pulse_rt_Intrinsics_consoleReadLine_epilogue:
pulsec_pulse_rt_Intrinsics_consoleReadLine_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_consoleReadLine endp

pulsec_pulse_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_consoleWrite
    jmp pulsec_pulse_rt_Intrinsics_consoleWrite__String_epilogue
pulsec_pulse_rt_Intrinsics_consoleWrite__String_epilogue:
pulsec_pulse_rt_Intrinsics_consoleWrite__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_consoleWrite__String endp

pulsec_pulse_rt_Intrinsics_consoleErrorWrite__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_consoleErrorWrite
    jmp pulsec_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue
pulsec_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue:
pulsec_pulse_rt_Intrinsics_consoleErrorWrite__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_consoleErrorWrite__String endp

pulsec_pulse_rt_Intrinsics_consoleWriteLine__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_consoleWriteLine
    jmp pulsec_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue
pulsec_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue:
pulsec_pulse_rt_Intrinsics_consoleWriteLine__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_consoleWriteLine__String endp

pulsec_pulse_rt_Intrinsics_consoleErrorWriteLine__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_consoleErrorWriteLine
    jmp pulsec_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue
pulsec_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue:
pulsec_pulse_rt_Intrinsics_consoleErrorWriteLine__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_consoleErrorWriteLine__String endp

pulsec_pulse_rt_Intrinsics_panic__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_panic
    jmp pulsec_pulse_rt_Intrinsics_panic__String_epilogue
pulsec_pulse_rt_Intrinsics_panic__String_epilogue:
pulsec_pulse_rt_Intrinsics_panic__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_panic__String endp

pulsec_pulse_rt_Intrinsics_stringConcat__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_stringConcat
    jmp pulsec_pulse_rt_Intrinsics_stringConcat__String_String_epilogue
pulsec_pulse_rt_Intrinsics_stringConcat__String_String_epilogue:
pulsec_pulse_rt_Intrinsics_stringConcat__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_rt_Intrinsics_stringConcat__String_String endp

pulsec_pulse_rt_Intrinsics_stringLength__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_stringLength
    jmp pulsec_pulse_rt_Intrinsics_stringLength__String_epilogue
pulsec_pulse_rt_Intrinsics_stringLength__String_epilogue:
pulsec_pulse_rt_Intrinsics_stringLength__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_rt_Intrinsics_stringLength__String endp

pulsec_pulse_rt_Intrinsics_objectClassName__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_objectClassName
    jmp pulsec_pulse_rt_Intrinsics_objectClassName__Object_epilogue
pulsec_pulse_rt_Intrinsics_objectClassName__Object_epilogue:
pulsec_pulse_rt_Intrinsics_objectClassName__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_objectClassName__Object endp

pulsec_pulse_rt_Intrinsics_objectHashCode__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_objectHashCode
    jmp pulsec_pulse_rt_Intrinsics_objectHashCode__Object_epilogue
pulsec_pulse_rt_Intrinsics_objectHashCode__Object_epilogue:
pulsec_pulse_rt_Intrinsics_objectHashCode__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_objectHashCode__Object endp

pulsec_pulse_rt_Intrinsics_arrayNew__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_arrayNew
    jmp pulsec_pulse_rt_Intrinsics_arrayNew__int_epilogue
pulsec_pulse_rt_Intrinsics_arrayNew__int_epilogue:
pulsec_pulse_rt_Intrinsics_arrayNew__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_arrayNew__int endp

pulsec_pulse_rt_Intrinsics_arrayLength__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_arrayLength
    jmp pulsec_pulse_rt_Intrinsics_arrayLength__long_epilogue
pulsec_pulse_rt_Intrinsics_arrayLength__long_epilogue:
pulsec_pulse_rt_Intrinsics_arrayLength__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_arrayLength__long endp

pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_arrayGetInt
    jmp pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int endp

pulsec_pulse_rt_Intrinsics_arraySetInt__long_int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    mov r8d, dword ptr [rsp+80]
    call pulsec_rt_arraySetInt
    jmp pulsec_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue
pulsec_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue:
pulsec_pulse_rt_Intrinsics_arraySetInt__long_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_arraySetInt__long_int_int endp

pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_arrayGetLong
    jmp pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int_epilogue
pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int endp

pulsec_pulse_rt_Intrinsics_arraySetLong__long_int_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    mov r8, qword ptr [rsp+80]
    call pulsec_rt_arraySetLong
    jmp pulsec_pulse_rt_Intrinsics_arraySetLong__long_int_long_epilogue
pulsec_pulse_rt_Intrinsics_arraySetLong__long_int_long_epilogue:
pulsec_pulse_rt_Intrinsics_arraySetLong__long_int_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_arraySetLong__long_int_long endp

pulsec_pulse_rt_Intrinsics_arrayGetString__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_arrayGetString
    jmp pulsec_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue
pulsec_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_arrayGetString__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_arrayGetString__long_int endp

pulsec_pulse_rt_Intrinsics_arraySetString__long_int_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    mov r8, qword ptr [rsp+80]
    call pulsec_rt_arraySetString
    jmp pulsec_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue
pulsec_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue:
pulsec_pulse_rt_Intrinsics_arraySetString__long_int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_arraySetString__long_int_String endp

pulsec_pulse_rt_Intrinsics_listNew proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_rt_listNew
    jmp pulsec_pulse_rt_Intrinsics_listNew_epilogue
pulsec_pulse_rt_Intrinsics_listNew_epilogue:
pulsec_pulse_rt_Intrinsics_listNew_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_listNew endp

pulsec_pulse_rt_Intrinsics_listSize__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_listSize
    jmp pulsec_pulse_rt_Intrinsics_listSize__long_epilogue
pulsec_pulse_rt_Intrinsics_listSize__long_epilogue:
pulsec_pulse_rt_Intrinsics_listSize__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listSize__long endp

pulsec_pulse_rt_Intrinsics_listKind__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_listKind
    jmp pulsec_pulse_rt_Intrinsics_listKind__long_epilogue
pulsec_pulse_rt_Intrinsics_listKind__long_epilogue:
pulsec_pulse_rt_Intrinsics_listKind__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listKind__long endp

pulsec_pulse_rt_Intrinsics_listClear__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_listClear
    jmp pulsec_pulse_rt_Intrinsics_listClear__long_epilogue
pulsec_pulse_rt_Intrinsics_listClear__long_epilogue:
pulsec_pulse_rt_Intrinsics_listClear__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listClear__long endp

pulsec_pulse_rt_Intrinsics_listAddInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_listAddInt
    jmp pulsec_pulse_rt_Intrinsics_listAddInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_listAddInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_listAddInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listAddInt__long_int endp

pulsec_pulse_rt_Intrinsics_listAddString__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m23
    mov edx, trace_m23_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_listAddString
    jmp pulsec_pulse_rt_Intrinsics_listAddString__long_String_epilogue
pulsec_pulse_rt_Intrinsics_listAddString__long_String_epilogue:
pulsec_pulse_rt_Intrinsics_listAddString__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listAddString__long_String endp

pulsec_pulse_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_listGetInt
    jmp pulsec_pulse_rt_Intrinsics_listGetInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_listGetInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_listGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listGetInt__long_int endp

pulsec_pulse_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_listGetString
    jmp pulsec_pulse_rt_Intrinsics_listGetString__long_int_epilogue
pulsec_pulse_rt_Intrinsics_listGetString__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_listGetString__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_listGetString__long_int endp

pulsec_pulse_rt_Intrinsics_mapNew proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_rt_mapNew
    jmp pulsec_pulse_rt_Intrinsics_mapNew_epilogue
pulsec_pulse_rt_Intrinsics_mapNew_epilogue:
pulsec_pulse_rt_Intrinsics_mapNew_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_mapNew endp

pulsec_pulse_rt_Intrinsics_mapSize__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_mapSize
    jmp pulsec_pulse_rt_Intrinsics_mapSize__long_epilogue
pulsec_pulse_rt_Intrinsics_mapSize__long_epilogue:
pulsec_pulse_rt_Intrinsics_mapSize__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_mapSize__long endp

pulsec_pulse_rt_Intrinsics_mapClear__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_mapClear
    jmp pulsec_pulse_rt_Intrinsics_mapClear__long_epilogue
pulsec_pulse_rt_Intrinsics_mapClear__long_epilogue:
pulsec_pulse_rt_Intrinsics_mapClear__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_mapClear__long endp

pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_mapContainsKey
    jmp pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue
pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue:
pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String endp

pulsec_pulse_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    mov r8, qword ptr [rsp+80]
    call pulsec_rt_mapPut
    jmp pulsec_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue
pulsec_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue:
pulsec_pulse_rt_Intrinsics_mapPut__long_String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_mapPut__long_String_String endp

pulsec_pulse_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    mov r8d, dword ptr [rsp+80]
    call pulsec_rt_mapPutInt
    jmp pulsec_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue
pulsec_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue:
pulsec_pulse_rt_Intrinsics_mapPutInt__long_String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_mapPutInt__long_String_int endp

pulsec_pulse_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_mapGet
    jmp pulsec_pulse_rt_Intrinsics_mapGet__long_String_epilogue
pulsec_pulse_rt_Intrinsics_mapGet__long_String_epilogue:
pulsec_pulse_rt_Intrinsics_mapGet__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_mapGet__long_String endp

pulsec_pulse_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_mapGetInt
    jmp pulsec_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue
pulsec_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue:
pulsec_pulse_rt_Intrinsics_mapGetInt__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_mapGetInt__long_String endp

pulsec_pulse_rt_Intrinsics_hostExists__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostExists
    jmp pulsec_pulse_rt_Intrinsics_hostExists__String_epilogue
pulsec_pulse_rt_Intrinsics_hostExists__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostExists__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostExists__String endp

pulsec_pulse_rt_Intrinsics_hostIsFile__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostIsFile
    jmp pulsec_pulse_rt_Intrinsics_hostIsFile__String_epilogue
pulsec_pulse_rt_Intrinsics_hostIsFile__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostIsFile__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostIsFile__String endp

pulsec_pulse_rt_Intrinsics_hostIsDirectory__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostIsDirectory
    jmp pulsec_pulse_rt_Intrinsics_hostIsDirectory__String_epilogue
pulsec_pulse_rt_Intrinsics_hostIsDirectory__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostIsDirectory__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostIsDirectory__String endp

pulsec_pulse_rt_Intrinsics_hostReadAllText__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostReadAllText
    jmp pulsec_pulse_rt_Intrinsics_hostReadAllText__String_epilogue
pulsec_pulse_rt_Intrinsics_hostReadAllText__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostReadAllText__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostReadAllText__String endp

pulsec_pulse_rt_Intrinsics_hostListChildren__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostListChildren
    jmp pulsec_pulse_rt_Intrinsics_hostListChildren__String_epilogue
pulsec_pulse_rt_Intrinsics_hostListChildren__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostListChildren__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostListChildren__String endp

pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostCreateDirectory
    jmp pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String_epilogue
pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String endp

pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostWriteAllText
    jmp pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String_epilogue
pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String_epilogue:
pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String endp

end
