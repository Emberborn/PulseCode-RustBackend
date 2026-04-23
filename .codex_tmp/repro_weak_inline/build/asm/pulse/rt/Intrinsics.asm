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
extrn pulsec_rt_hostAllocBytes:proc
extrn pulsec_rt_hostAllocUtf8Z:proc
extrn pulsec_rt_hostAtomicCompareAndSetReference:proc
extrn pulsec_rt_hostAtomicCompareExchangeInt:proc
extrn pulsec_rt_hostAtomicCompareExchangeLong:proc
extrn pulsec_rt_hostAtomicExchangeInt:proc
extrn pulsec_rt_hostAtomicExchangeLong:proc
extrn pulsec_rt_hostAtomicExchangeReference:proc
extrn pulsec_rt_hostAtomicFetchAddInt:proc
extrn pulsec_rt_hostAtomicFetchAddLong:proc
extrn pulsec_rt_hostAtomicLoadInt:proc
extrn pulsec_rt_hostAtomicLoadLong:proc
extrn pulsec_rt_hostAtomicLoadReference:proc
extrn pulsec_rt_hostAtomicStoreInt:proc
extrn pulsec_rt_hostAtomicStoreLong:proc
extrn pulsec_rt_hostAtomicStoreReference:proc
extrn pulsec_rt_hostCallNative0:proc
extrn pulsec_rt_hostCallNative1:proc
extrn pulsec_rt_hostCallNative2:proc
extrn pulsec_rt_hostCallNative3:proc
extrn pulsec_rt_hostCallNative4:proc
extrn pulsec_rt_hostCloseHandle:proc
extrn pulsec_rt_hostCopyBytes:proc
extrn pulsec_rt_hostCopyFile:proc
extrn pulsec_rt_hostCreateDirectory:proc
extrn pulsec_rt_hostCreateEvent:proc
extrn pulsec_rt_hostCreateMutex:proc
extrn pulsec_rt_hostCreateSemaphore:proc
extrn pulsec_rt_hostExists:proc
extrn pulsec_rt_hostFreeBytes:proc
extrn pulsec_rt_hostFreeDynamicLibrary:proc
extrn pulsec_rt_hostGetNativeCallbackAddress0:proc
extrn pulsec_rt_hostGetNativeCallbackAddress1:proc
extrn pulsec_rt_hostGetNativeCallbackAddress2:proc
extrn pulsec_rt_hostGetNativeCallbackAddress3:proc
extrn pulsec_rt_hostGetNativeCallbackAddress4:proc
extrn pulsec_rt_hostIsDirectory:proc
extrn pulsec_rt_hostIsFile:proc
extrn pulsec_rt_hostListChildren:proc
extrn pulsec_rt_hostLoadDynamicLibrary:proc
extrn pulsec_rt_hostLookupLoadedDynamicLibrary:proc
extrn pulsec_rt_hostLookupSelfDynamicLibrary:proc
extrn pulsec_rt_hostReadAllText:proc
extrn pulsec_rt_hostReadByte:proc
extrn pulsec_rt_hostReadLong:proc
extrn pulsec_rt_hostRegisterNativeCallback0:proc
extrn pulsec_rt_hostRegisterNativeCallback1:proc
extrn pulsec_rt_hostRegisterNativeCallback2:proc
extrn pulsec_rt_hostRegisterNativeCallback3:proc
extrn pulsec_rt_hostRegisterNativeCallback4:proc
extrn pulsec_rt_hostReleaseMutex:proc
extrn pulsec_rt_hostReleaseSemaphore:proc
extrn pulsec_rt_hostResetEvent:proc
extrn pulsec_rt_hostResolveDynamicSymbol:proc
extrn pulsec_rt_hostRunShellProcess:proc
extrn pulsec_rt_hostSetEvent:proc
extrn pulsec_rt_hostStartThread:proc
extrn pulsec_rt_hostStringFromUtf8:proc
extrn pulsec_rt_hostStringFromUtf8Z:proc
extrn pulsec_rt_hostStringUtf8Length:proc
extrn pulsec_rt_hostUnregisterNativeCallback0:proc
extrn pulsec_rt_hostUnregisterNativeCallback1:proc
extrn pulsec_rt_hostUnregisterNativeCallback2:proc
extrn pulsec_rt_hostUnregisterNativeCallback3:proc
extrn pulsec_rt_hostUnregisterNativeCallback4:proc
extrn pulsec_rt_hostWaitHandle:proc
extrn pulsec_rt_hostWriteAllText:proc
extrn pulsec_rt_hostWriteByte:proc
extrn pulsec_rt_hostWriteLong:proc
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
trace_m41 db "pulse.rt.Intrinsics.hostCopyFile"
trace_m41_len equ 32
trace_m42 db "pulse.rt.Intrinsics.hostSleepMillis"
trace_m42_len equ 35
trace_m43 db "pulse.rt.Intrinsics.hostYieldThread"
trace_m43_len equ 35
trace_m44 db "pulse.rt.Intrinsics.hostCurrentThreadId"
trace_m44_len equ 39
trace_m45 db "pulse.rt.Intrinsics.hostStartThread"
trace_m45_len equ 35
trace_m46 db "pulse.rt.Intrinsics.hostCreateMutex"
trace_m46_len equ 35
trace_m47 db "pulse.rt.Intrinsics.hostCreateEvent"
trace_m47_len equ 35
trace_m48 db "pulse.rt.Intrinsics.hostWaitHandle"
trace_m48_len equ 34
trace_m49 db "pulse.rt.Intrinsics.hostReleaseMutex"
trace_m49_len equ 36
trace_m50 db "pulse.rt.Intrinsics.hostSetEvent"
trace_m50_len equ 32
trace_m51 db "pulse.rt.Intrinsics.hostResetEvent"
trace_m51_len equ 34
trace_m52 db "pulse.rt.Intrinsics.hostCloseHandle"
trace_m52_len equ 35
trace_m53 db "pulse.rt.Intrinsics.hostCreateSemaphore"
trace_m53_len equ 39
trace_m54 db "pulse.rt.Intrinsics.hostReleaseSemaphore"
trace_m54_len equ 40
trace_m55 db "pulse.rt.Intrinsics.hostAtomicLoadInt"
trace_m55_len equ 37
trace_m56 db "pulse.rt.Intrinsics.hostAtomicStoreInt"
trace_m56_len equ 38
trace_m57 db "pulse.rt.Intrinsics.hostAtomicCompareExchangeInt"
trace_m57_len equ 48
trace_m58 db "pulse.rt.Intrinsics.hostAtomicExchangeInt"
trace_m58_len equ 41
trace_m59 db "pulse.rt.Intrinsics.hostAtomicFetchAddInt"
trace_m59_len equ 41
trace_m60 db "pulse.rt.Intrinsics.hostAtomicLoadLong"
trace_m60_len equ 38
trace_m61 db "pulse.rt.Intrinsics.hostAtomicStoreLong"
trace_m61_len equ 39
trace_m62 db "pulse.rt.Intrinsics.hostAtomicCompareExchangeLong"
trace_m62_len equ 49
trace_m63 db "pulse.rt.Intrinsics.hostAtomicExchangeLong"
trace_m63_len equ 42
trace_m64 db "pulse.rt.Intrinsics.hostAtomicFetchAddLong"
trace_m64_len equ 42
trace_m65 db "pulse.rt.Intrinsics.hostAtomicLoadReference"
trace_m65_len equ 43
trace_m66 db "pulse.rt.Intrinsics.hostAtomicStoreReference"
trace_m66_len equ 44
trace_m67 db "pulse.rt.Intrinsics.hostAtomicCompareAndSetReference"
trace_m67_len equ 52
trace_m68 db "pulse.rt.Intrinsics.hostAtomicExchangeReference"
trace_m68_len equ 47
trace_m69 db "pulse.rt.Intrinsics.hostAllocBytes"
trace_m69_len equ 34
trace_m70 db "pulse.rt.Intrinsics.hostFreeBytes"
trace_m70_len equ 33
trace_m71 db "pulse.rt.Intrinsics.hostReadByte"
trace_m71_len equ 32
trace_m72 db "pulse.rt.Intrinsics.hostWriteByte"
trace_m72_len equ 33
trace_m73 db "pulse.rt.Intrinsics.hostCopyBytes"
trace_m73_len equ 33
trace_m74 db "pulse.rt.Intrinsics.hostReadLong"
trace_m74_len equ 32
trace_m75 db "pulse.rt.Intrinsics.hostWriteLong"
trace_m75_len equ 33
trace_m76 db "pulse.rt.Intrinsics.hostStringUtf8Length"
trace_m76_len equ 40
trace_m77 db "pulse.rt.Intrinsics.hostAllocUtf8Z"
trace_m77_len equ 34
trace_m78 db "pulse.rt.Intrinsics.hostStringFromUtf8"
trace_m78_len equ 38
trace_m79 db "pulse.rt.Intrinsics.hostStringFromUtf8Z"
trace_m79_len equ 39
trace_m80 db "pulse.rt.Intrinsics.hostLoadDynamicLibrary"
trace_m80_len equ 42
trace_m81 db "pulse.rt.Intrinsics.hostLookupLoadedDynamicLibrary"
trace_m81_len equ 50
trace_m82 db "pulse.rt.Intrinsics.hostLookupSelfDynamicLibrary"
trace_m82_len equ 48
trace_m83 db "pulse.rt.Intrinsics.hostFreeDynamicLibrary"
trace_m83_len equ 42
trace_m84 db "pulse.rt.Intrinsics.hostResolveDynamicSymbol"
trace_m84_len equ 44
trace_m85 db "pulse.rt.Intrinsics.hostCallNative0"
trace_m85_len equ 35
trace_m86 db "pulse.rt.Intrinsics.hostCallNative1"
trace_m86_len equ 35
trace_m87 db "pulse.rt.Intrinsics.hostCallNative2"
trace_m87_len equ 35
trace_m88 db "pulse.rt.Intrinsics.hostCallNative3"
trace_m88_len equ 35
trace_m89 db "pulse.rt.Intrinsics.hostCallNative4"
trace_m89_len equ 35
trace_m90 db "pulse.rt.Intrinsics.hostRegisterNativeCallback0"
trace_m90_len equ 47
trace_m91 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress0"
trace_m91_len equ 49
trace_m92 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback0"
trace_m92_len equ 49
trace_m93 db "pulse.rt.Intrinsics.hostRegisterNativeCallback1"
trace_m93_len equ 47
trace_m94 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress1"
trace_m94_len equ 49
trace_m95 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback1"
trace_m95_len equ 49
trace_m96 db "pulse.rt.Intrinsics.hostRegisterNativeCallback2"
trace_m96_len equ 47
trace_m97 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress2"
trace_m97_len equ 49
trace_m98 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback2"
trace_m98_len equ 49
trace_m99 db "pulse.rt.Intrinsics.hostRegisterNativeCallback3"
trace_m99_len equ 47
trace_m100 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress3"
trace_m100_len equ 49
trace_m101 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback3"
trace_m101_len equ 49
trace_m102 db "pulse.rt.Intrinsics.hostRegisterNativeCallback4"
trace_m102_len equ 47
trace_m103 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress4"
trace_m103_len equ 49
trace_m104 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback4"
trace_m104_len equ 49
trace_m105 db "pulse.rt.Intrinsics.hostRunShellProcess"
trace_m105_len equ 39

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

pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostCopyFile
    jmp pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String_epilogue
pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String_epilogue:
pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String endp

pulsec_pulse_rt_Intrinsics_hostSleepMillis__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_rt_Intrinsics_hostSleepMillis__long_b0:
    xor eax, eax
    jmp pulsec_pulse_rt_Intrinsics_hostSleepMillis__long_epilogue
pulsec_pulse_rt_Intrinsics_hostSleepMillis__long_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_rt_Intrinsics_hostSleepMillis__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostSleepMillis__long endp

pulsec_pulse_rt_Intrinsics_hostYieldThread proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
pulsec_pulse_rt_Intrinsics_hostYieldThread_b0:
    mov eax, 0
    jmp pulsec_pulse_rt_Intrinsics_hostYieldThread_epilogue
pulsec_pulse_rt_Intrinsics_hostYieldThread_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_pulse_rt_Intrinsics_hostYieldThread_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_hostYieldThread endp

pulsec_pulse_rt_Intrinsics_hostCurrentThreadId proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
pulsec_pulse_rt_Intrinsics_hostCurrentThreadId_b0:
    mov rax, 0
    jmp pulsec_pulse_rt_Intrinsics_hostCurrentThreadId_epilogue
pulsec_pulse_rt_Intrinsics_hostCurrentThreadId_epilogue:
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
pulsec_pulse_rt_Intrinsics_hostCurrentThreadId_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_hostCurrentThreadId endp

pulsec_pulse_rt_Intrinsics_hostStartThread__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostStartThread
    jmp pulsec_pulse_rt_Intrinsics_hostStartThread__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostStartThread__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostStartThread__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostStartThread__long_long endp

pulsec_pulse_rt_Intrinsics_hostCreateMutex proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_rt_hostCreateMutex
    jmp pulsec_pulse_rt_Intrinsics_hostCreateMutex_epilogue
pulsec_pulse_rt_Intrinsics_hostCreateMutex_epilogue:
pulsec_pulse_rt_Intrinsics_hostCreateMutex_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_hostCreateMutex endp

pulsec_pulse_rt_Intrinsics_hostCreateEvent__boolean_boolean proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
    mov ecx, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostCreateEvent
    jmp pulsec_pulse_rt_Intrinsics_hostCreateEvent__boolean_boolean_epilogue
pulsec_pulse_rt_Intrinsics_hostCreateEvent__boolean_boolean_epilogue:
pulsec_pulse_rt_Intrinsics_hostCreateEvent__boolean_boolean_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCreateEvent__boolean_boolean endp

pulsec_pulse_rt_Intrinsics_hostWaitHandle__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostWaitHandle
    jmp pulsec_pulse_rt_Intrinsics_hostWaitHandle__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostWaitHandle__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostWaitHandle__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostWaitHandle__long_long endp

pulsec_pulse_rt_Intrinsics_hostReleaseMutex__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostReleaseMutex
    jmp pulsec_pulse_rt_Intrinsics_hostReleaseMutex__long_epilogue
pulsec_pulse_rt_Intrinsics_hostReleaseMutex__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostReleaseMutex__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostReleaseMutex__long endp

pulsec_pulse_rt_Intrinsics_hostSetEvent__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostSetEvent
    jmp pulsec_pulse_rt_Intrinsics_hostSetEvent__long_epilogue
pulsec_pulse_rt_Intrinsics_hostSetEvent__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostSetEvent__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostSetEvent__long endp

pulsec_pulse_rt_Intrinsics_hostResetEvent__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostResetEvent
    jmp pulsec_pulse_rt_Intrinsics_hostResetEvent__long_epilogue
pulsec_pulse_rt_Intrinsics_hostResetEvent__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostResetEvent__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostResetEvent__long endp

pulsec_pulse_rt_Intrinsics_hostCloseHandle__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostCloseHandle
    jmp pulsec_pulse_rt_Intrinsics_hostCloseHandle__long_epilogue
pulsec_pulse_rt_Intrinsics_hostCloseHandle__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCloseHandle__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCloseHandle__long endp

pulsec_pulse_rt_Intrinsics_hostCreateSemaphore__int_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov dword ptr [rsp+72], edx
    mov ecx, dword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostCreateSemaphore
    jmp pulsec_pulse_rt_Intrinsics_hostCreateSemaphore__int_int_epilogue
pulsec_pulse_rt_Intrinsics_hostCreateSemaphore__int_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostCreateSemaphore__int_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCreateSemaphore__int_int endp

pulsec_pulse_rt_Intrinsics_hostReleaseSemaphore__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostReleaseSemaphore
    jmp pulsec_pulse_rt_Intrinsics_hostReleaseSemaphore__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostReleaseSemaphore__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostReleaseSemaphore__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostReleaseSemaphore__long_int endp

pulsec_pulse_rt_Intrinsics_hostAtomicLoadInt__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m55
    mov edx, trace_m55_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostAtomicLoadInt
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicLoadInt__long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicLoadInt__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicLoadInt__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicLoadInt__long endp

pulsec_pulse_rt_Intrinsics_hostAtomicStoreInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostAtomicStoreInt
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicStoreInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicStoreInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicStoreInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicStoreInt__long_int endp

pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeInt__long_int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
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
    call pulsec_rt_hostAtomicCompareExchangeInt
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeInt__long_int_int_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeInt__long_int_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeInt__long_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeInt__long_int_int endp

pulsec_pulse_rt_Intrinsics_hostAtomicExchangeInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostAtomicExchangeInt
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicExchangeInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeInt__long_int endp

pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostAtomicFetchAddInt
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddInt__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddInt__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddInt__long_int endp

pulsec_pulse_rt_Intrinsics_hostAtomicLoadLong__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostAtomicLoadLong
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicLoadLong__long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicLoadLong__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicLoadLong__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicLoadLong__long endp

pulsec_pulse_rt_Intrinsics_hostAtomicStoreLong__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostAtomicStoreLong
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicStoreLong__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicStoreLong__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicStoreLong__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicStoreLong__long_long endp

pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeLong__long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
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
    call pulsec_rt_hostAtomicCompareExchangeLong
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeLong__long_long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeLong__long_long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeLong__long_long_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicCompareExchangeLong__long_long_long endp

pulsec_pulse_rt_Intrinsics_hostAtomicExchangeLong__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostAtomicExchangeLong
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicExchangeLong__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeLong__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeLong__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeLong__long_long endp

pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddLong__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostAtomicFetchAddLong
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddLong__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddLong__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddLong__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicFetchAddLong__long_long endp

pulsec_pulse_rt_Intrinsics_hostAtomicLoadReference__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m65
    mov edx, trace_m65_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostAtomicLoadReference
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicLoadReference__long_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicLoadReference__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicLoadReference__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicLoadReference__long endp

pulsec_pulse_rt_Intrinsics_hostAtomicStoreReference__long_Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m66
    mov edx, trace_m66_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostAtomicStoreReference
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicStoreReference__long_Object_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicStoreReference__long_Object_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicStoreReference__long_Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicStoreReference__long_Object endp

pulsec_pulse_rt_Intrinsics_hostAtomicCompareAndSetReference__long_Object_Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m67
    mov edx, trace_m67_len
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
    call pulsec_rt_hostAtomicCompareAndSetReference
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicCompareAndSetReference__long_Object_Object_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicCompareAndSetReference__long_Object_Object_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicCompareAndSetReference__long_Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicCompareAndSetReference__long_Object_Object endp

pulsec_pulse_rt_Intrinsics_hostAtomicExchangeReference__long_Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m68
    mov edx, trace_m68_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostAtomicExchangeReference
    jmp pulsec_pulse_rt_Intrinsics_hostAtomicExchangeReference__long_Object_epilogue
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeReference__long_Object_epilogue:
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeReference__long_Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAtomicExchangeReference__long_Object endp

pulsec_pulse_rt_Intrinsics_hostAllocBytes__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m69
    mov edx, trace_m69_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostAllocBytes
    jmp pulsec_pulse_rt_Intrinsics_hostAllocBytes__int_epilogue
pulsec_pulse_rt_Intrinsics_hostAllocBytes__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostAllocBytes__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAllocBytes__int endp

pulsec_pulse_rt_Intrinsics_hostFreeBytes__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostFreeBytes
    jmp pulsec_pulse_rt_Intrinsics_hostFreeBytes__long_epilogue
pulsec_pulse_rt_Intrinsics_hostFreeBytes__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostFreeBytes__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostFreeBytes__long endp

pulsec_pulse_rt_Intrinsics_hostReadByte__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostReadByte
    jmp pulsec_pulse_rt_Intrinsics_hostReadByte__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostReadByte__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostReadByte__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostReadByte__long_int endp

pulsec_pulse_rt_Intrinsics_hostWriteByte__long_int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
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
    call pulsec_rt_hostWriteByte
    jmp pulsec_pulse_rt_Intrinsics_hostWriteByte__long_int_int_epilogue
pulsec_pulse_rt_Intrinsics_hostWriteByte__long_int_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostWriteByte__long_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostWriteByte__long_int_int endp

pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m73
    mov edx, trace_m73_len
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
    call pulsec_rt_hostCopyBytes
    jmp pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int endp

pulsec_pulse_rt_Intrinsics_hostReadLong__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m74
    mov edx, trace_m74_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostReadLong
    jmp pulsec_pulse_rt_Intrinsics_hostReadLong__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostReadLong__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostReadLong__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostReadLong__long_int endp

pulsec_pulse_rt_Intrinsics_hostWriteLong__long_int_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m75
    mov edx, trace_m75_len
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
    call pulsec_rt_hostWriteLong
    jmp pulsec_pulse_rt_Intrinsics_hostWriteLong__long_int_long_epilogue
pulsec_pulse_rt_Intrinsics_hostWriteLong__long_int_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostWriteLong__long_int_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostWriteLong__long_int_long endp

pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostStringUtf8Length
    jmp pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String_epilogue
pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String endp

pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m77
    mov edx, trace_m77_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostAllocUtf8Z
    jmp pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String_epilogue
pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String endp

pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m78
    mov edx, trace_m78_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_hostStringFromUtf8
    jmp pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue:
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int endp

pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m79
    mov edx, trace_m79_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostStringFromUtf8Z
    jmp pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long endp

pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m80
    mov edx, trace_m80_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostLoadDynamicLibrary
    jmp pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue
pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String endp

pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m81
    mov edx, trace_m81_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostLookupLoadedDynamicLibrary
    jmp pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue
pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue:
pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String endp

pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m82
    mov edx, trace_m82_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_rt_hostLookupSelfDynamicLibrary
    jmp pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue
pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue:
pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue_post:
    mov qword ptr [rsp+104], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary endp

pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m83
    mov edx, trace_m83_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostFreeDynamicLibrary
    jmp pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue
pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long endp

pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostResolveDynamicSymbol
    jmp pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue
pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue:
pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String endp

pulsec_pulse_rt_Intrinsics_hostCallNative0__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m85
    mov edx, trace_m85_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostCallNative0
    jmp pulsec_pulse_rt_Intrinsics_hostCallNative0__long_epilogue
pulsec_pulse_rt_Intrinsics_hostCallNative0__long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCallNative0__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCallNative0__long endp

pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m86
    mov edx, trace_m86_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostCallNative1
    jmp pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long endp

pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m87
    mov edx, trace_m87_len
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
    call pulsec_rt_hostCallNative2
    jmp pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long endp

pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m88
    mov edx, trace_m88_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    mov r8, qword ptr [rsp+80]
    mov r9, qword ptr [rsp+88]
    call pulsec_rt_hostCallNative3
    jmp pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long endp

pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m89
    mov edx, trace_m89_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
    mov rax, qword ptr [rsp+272]
    mov qword ptr [rsp+96], rax
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    mov r8, qword ptr [rsp+80]
    mov r9, qword ptr [rsp+88]
    mov rcx, qword ptr [rsp+96]
    call pulsec_rt_hostCallNative4
    jmp pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue
pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue:
pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long endp

pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostRegisterNativeCallback0
    jmp pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue:
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0 endp

pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m91
    mov edx, trace_m91_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostGetNativeCallbackAddress0
    jmp pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int endp

pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostUnregisterNativeCallback0
    jmp pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int endp

pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m93
    mov edx, trace_m93_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostRegisterNativeCallback1
    jmp pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue:
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1 endp

pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m94
    mov edx, trace_m94_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostGetNativeCallbackAddress1
    jmp pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int endp

pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m95
    mov edx, trace_m95_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostUnregisterNativeCallback1
    jmp pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int endp

pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m96
    mov edx, trace_m96_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostRegisterNativeCallback2
    jmp pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue:
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2 endp

pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m97
    mov edx, trace_m97_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostGetNativeCallbackAddress2
    jmp pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int endp

pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostUnregisterNativeCallback2
    jmp pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int endp

pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m99
    mov edx, trace_m99_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostRegisterNativeCallback3
    jmp pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue:
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3 endp

pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m100
    mov edx, trace_m100_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostGetNativeCallbackAddress3
    jmp pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int endp

pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m101
    mov edx, trace_m101_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostUnregisterNativeCallback3
    jmp pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int endp

pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m102
    mov edx, trace_m102_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call pulsec_rt_hostRegisterNativeCallback4
    jmp pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue:
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4 endp

pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m103
    mov edx, trace_m103_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostGetNativeCallbackAddress4
    jmp pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int endp

pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m104
    mov edx, trace_m104_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_hostUnregisterNativeCallback4
    jmp pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue:
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int endp

pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m105
    mov edx, trace_m105_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call pulsec_rt_hostRunShellProcess
    jmp pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String_epilogue
pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String_epilogue:
pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String endp

end
