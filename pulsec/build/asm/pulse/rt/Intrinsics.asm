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
extrn pulsec_rt_hostAllocBytes:proc
extrn pulsec_rt_hostAllocUtf8Z:proc
extrn pulsec_rt_hostCallNative0:proc
extrn pulsec_rt_hostCallNative1:proc
extrn pulsec_rt_hostCallNative2:proc
extrn pulsec_rt_hostCallNative3:proc
extrn pulsec_rt_hostCallNative4:proc
extrn pulsec_rt_hostCopyBytes:proc
extrn pulsec_rt_hostCopyFile:proc
extrn pulsec_rt_hostCreateDirectory:proc
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
extrn pulsec_rt_hostResolveDynamicSymbol:proc
extrn pulsec_rt_hostRunShellProcess:proc
extrn pulsec_rt_hostStringFromUtf8:proc
extrn pulsec_rt_hostStringFromUtf8Z:proc
extrn pulsec_rt_hostStringUtf8Length:proc
extrn pulsec_rt_hostUnregisterNativeCallback0:proc
extrn pulsec_rt_hostUnregisterNativeCallback1:proc
extrn pulsec_rt_hostUnregisterNativeCallback2:proc
extrn pulsec_rt_hostUnregisterNativeCallback3:proc
extrn pulsec_rt_hostUnregisterNativeCallback4:proc
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
pulsec_pulse_rt_Intrinsics_consoleReadLine_trace_s0 db "pulse.rt.Intrinsics.consoleReadLine(Intrinsics.pulse:18)"
pulsec_pulse_rt_Intrinsics_consoleReadLine_trace_s0_len equ 56
trace_m2 db "pulse.rt.Intrinsics.consoleWrite"
trace_m2_len equ 32
trace_m3 db "pulse.rt.Intrinsics.consoleErrorWrite"
trace_m3_len equ 37
trace_m4 db "pulse.rt.Intrinsics.consoleWriteLine"
trace_m4_len equ 36
trace_m5 db "pulse.rt.Intrinsics.consoleErrorWriteLine"
trace_m5_len equ 41
trace_m6 db "pulse.rt.Intrinsics.panic"
trace_m6_len equ 25
trace_m7 db "pulse.rt.Intrinsics.stringConcat"
trace_m7_len equ 32
pulsec_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0 db "pulse.rt.Intrinsics.stringConcat(Intrinsics.pulse:61)"
pulsec_pulse_rt_Intrinsics_stringConcat__String_String_trace_s0_len equ 53
trace_m9 db "pulse.rt.Intrinsics.stringLength"
trace_m9_len equ 32
pulsec_pulse_rt_Intrinsics_stringLength__String_trace_s0 db "pulse.rt.Intrinsics.stringLength(Intrinsics.pulse:69)"
pulsec_pulse_rt_Intrinsics_stringLength__String_trace_s0_len equ 53
trace_m11 db "pulse.rt.Intrinsics.objectClassName"
trace_m11_len equ 35
pulsec_pulse_rt_Intrinsics_objectClassName__Object_trace_s0 db "pulse.rt.Intrinsics.objectClassName(Intrinsics.pulse:77)"
pulsec_pulse_rt_Intrinsics_objectClassName__Object_trace_s0_len equ 56
trace_m13 db "pulse.rt.Intrinsics.objectHashCode"
trace_m13_len equ 34
pulsec_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0 db "pulse.rt.Intrinsics.objectHashCode(Intrinsics.pulse:85)"
pulsec_pulse_rt_Intrinsics_objectHashCode__Object_trace_s0_len equ 55
trace_m15 db "pulse.rt.Intrinsics.arrayNew"
trace_m15_len equ 28
pulsec_pulse_rt_Intrinsics_arrayNew__int_trace_s0 db "pulse.rt.Intrinsics.arrayNew(Intrinsics.pulse:93)"
pulsec_pulse_rt_Intrinsics_arrayNew__int_trace_s0_len equ 49
trace_m17 db "pulse.rt.Intrinsics.arrayLength"
trace_m17_len equ 31
pulsec_pulse_rt_Intrinsics_arrayLength__long_trace_s0 db "pulse.rt.Intrinsics.arrayLength(Intrinsics.pulse:101)"
pulsec_pulse_rt_Intrinsics_arrayLength__long_trace_s0_len equ 53
trace_m19 db "pulse.rt.Intrinsics.arrayGetInt"
trace_m19_len equ 31
pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0 db "pulse.rt.Intrinsics.arrayGetInt(Intrinsics.pulse:109)"
pulsec_pulse_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len equ 53
trace_m21 db "pulse.rt.Intrinsics.arraySetInt"
trace_m21_len equ 31
trace_m22 db "pulse.rt.Intrinsics.arrayGetLong"
trace_m22_len equ 32
pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int_trace_s0 db "pulse.rt.Intrinsics.arrayGetLong(Intrinsics.pulse:124)"
pulsec_pulse_rt_Intrinsics_arrayGetLong__long_int_trace_s0_len equ 54
trace_m24 db "pulse.rt.Intrinsics.arraySetLong"
trace_m24_len equ 32
trace_m25 db "pulse.rt.Intrinsics.arrayGetString"
trace_m25_len equ 34
pulsec_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0 db "pulse.rt.Intrinsics.arrayGetString(Intrinsics.pulse:139)"
pulsec_pulse_rt_Intrinsics_arrayGetString__long_int_trace_s0_len equ 56
trace_m27 db "pulse.rt.Intrinsics.arraySetString"
trace_m27_len equ 34
trace_m28 db "pulse.rt.Intrinsics.listNew"
trace_m28_len equ 27
pulsec_pulse_rt_Intrinsics_listNew_trace_s0 db "pulse.rt.Intrinsics.listNew(Intrinsics.pulse:154)"
pulsec_pulse_rt_Intrinsics_listNew_trace_s0_len equ 49
trace_m30 db "pulse.rt.Intrinsics.listSize"
trace_m30_len equ 28
pulsec_pulse_rt_Intrinsics_listSize__long_trace_s0 db "pulse.rt.Intrinsics.listSize(Intrinsics.pulse:162)"
pulsec_pulse_rt_Intrinsics_listSize__long_trace_s0_len equ 50
trace_m32 db "pulse.rt.Intrinsics.listKind"
trace_m32_len equ 28
pulsec_pulse_rt_Intrinsics_listKind__long_trace_s0 db "pulse.rt.Intrinsics.listKind(Intrinsics.pulse:170)"
pulsec_pulse_rt_Intrinsics_listKind__long_trace_s0_len equ 50
trace_m34 db "pulse.rt.Intrinsics.listClear"
trace_m34_len equ 29
trace_m35 db "pulse.rt.Intrinsics.listAddInt"
trace_m35_len equ 30
trace_m36 db "pulse.rt.Intrinsics.listAddString"
trace_m36_len equ 33
trace_m37 db "pulse.rt.Intrinsics.listGetInt"
trace_m37_len equ 30
pulsec_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0 db "pulse.rt.Intrinsics.listGetInt(Intrinsics.pulse:199)"
pulsec_pulse_rt_Intrinsics_listGetInt__long_int_trace_s0_len equ 52
trace_m39 db "pulse.rt.Intrinsics.listGetString"
trace_m39_len equ 33
pulsec_pulse_rt_Intrinsics_listGetString__long_int_trace_s0 db "pulse.rt.Intrinsics.listGetString(Intrinsics.pulse:207)"
pulsec_pulse_rt_Intrinsics_listGetString__long_int_trace_s0_len equ 55
trace_m41 db "pulse.rt.Intrinsics.mapNew"
trace_m41_len equ 26
pulsec_pulse_rt_Intrinsics_mapNew_trace_s0 db "pulse.rt.Intrinsics.mapNew(Intrinsics.pulse:215)"
pulsec_pulse_rt_Intrinsics_mapNew_trace_s0_len equ 48
trace_m43 db "pulse.rt.Intrinsics.mapSize"
trace_m43_len equ 27
pulsec_pulse_rt_Intrinsics_mapSize__long_trace_s0 db "pulse.rt.Intrinsics.mapSize(Intrinsics.pulse:223)"
pulsec_pulse_rt_Intrinsics_mapSize__long_trace_s0_len equ 49
trace_m45 db "pulse.rt.Intrinsics.mapClear"
trace_m45_len equ 28
trace_m46 db "pulse.rt.Intrinsics.mapContainsKey"
trace_m46_len equ 34
pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0 db "pulse.rt.Intrinsics.mapContainsKey(Intrinsics.pulse:238)"
pulsec_pulse_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len equ 56
trace_m48 db "pulse.rt.Intrinsics.mapPut"
trace_m48_len equ 26
trace_m49 db "pulse.rt.Intrinsics.mapPutInt"
trace_m49_len equ 29
trace_m50 db "pulse.rt.Intrinsics.mapGet"
trace_m50_len equ 26
pulsec_pulse_rt_Intrinsics_mapGet__long_String_trace_s0 db "pulse.rt.Intrinsics.mapGet(Intrinsics.pulse:260)"
pulsec_pulse_rt_Intrinsics_mapGet__long_String_trace_s0_len equ 48
trace_m52 db "pulse.rt.Intrinsics.mapGetInt"
trace_m52_len equ 29
pulsec_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0 db "pulse.rt.Intrinsics.mapGetInt(Intrinsics.pulse:268)"
pulsec_pulse_rt_Intrinsics_mapGetInt__long_String_trace_s0_len equ 51
trace_m54 db "pulse.rt.Intrinsics.hostExists"
trace_m54_len equ 30
pulsec_pulse_rt_Intrinsics_hostExists__String_trace_s0 db "pulse.rt.Intrinsics.hostExists(Intrinsics.pulse:276)"
pulsec_pulse_rt_Intrinsics_hostExists__String_trace_s0_len equ 52
trace_m56 db "pulse.rt.Intrinsics.hostIsFile"
trace_m56_len equ 30
pulsec_pulse_rt_Intrinsics_hostIsFile__String_trace_s0 db "pulse.rt.Intrinsics.hostIsFile(Intrinsics.pulse:284)"
pulsec_pulse_rt_Intrinsics_hostIsFile__String_trace_s0_len equ 52
trace_m58 db "pulse.rt.Intrinsics.hostIsDirectory"
trace_m58_len equ 35
pulsec_pulse_rt_Intrinsics_hostIsDirectory__String_trace_s0 db "pulse.rt.Intrinsics.hostIsDirectory(Intrinsics.pulse:292)"
pulsec_pulse_rt_Intrinsics_hostIsDirectory__String_trace_s0_len equ 57
trace_m60 db "pulse.rt.Intrinsics.hostReadAllText"
trace_m60_len equ 35
pulsec_pulse_rt_Intrinsics_hostReadAllText__String_trace_s0 db "pulse.rt.Intrinsics.hostReadAllText(Intrinsics.pulse:300)"
pulsec_pulse_rt_Intrinsics_hostReadAllText__String_trace_s0_len equ 57
trace_m62 db "pulse.rt.Intrinsics.hostListChildren"
trace_m62_len equ 36
pulsec_pulse_rt_Intrinsics_hostListChildren__String_trace_s0 db "pulse.rt.Intrinsics.hostListChildren(Intrinsics.pulse:308)"
pulsec_pulse_rt_Intrinsics_hostListChildren__String_trace_s0_len equ 58
trace_m64 db "pulse.rt.Intrinsics.hostCreateDirectory"
trace_m64_len equ 39
pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String_trace_s0 db "pulse.rt.Intrinsics.hostCreateDirectory(Intrinsics.pulse:316)"
pulsec_pulse_rt_Intrinsics_hostCreateDirectory__String_trace_s0_len equ 61
trace_m66 db "pulse.rt.Intrinsics.hostWriteAllText"
trace_m66_len equ 36
pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String_trace_s0 db "pulse.rt.Intrinsics.hostWriteAllText(Intrinsics.pulse:324)"
pulsec_pulse_rt_Intrinsics_hostWriteAllText__String_String_trace_s0_len equ 58
trace_m68 db "pulse.rt.Intrinsics.hostCopyFile"
trace_m68_len equ 32
pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String_trace_s0 db "pulse.rt.Intrinsics.hostCopyFile(Intrinsics.pulse:332)"
pulsec_pulse_rt_Intrinsics_hostCopyFile__String_String_trace_s0_len equ 54
trace_m70 db "pulse.rt.Intrinsics.hostAllocBytes"
trace_m70_len equ 34
pulsec_pulse_rt_Intrinsics_hostAllocBytes__int_trace_s0 db "pulse.rt.Intrinsics.hostAllocBytes(Intrinsics.pulse:340)"
pulsec_pulse_rt_Intrinsics_hostAllocBytes__int_trace_s0_len equ 56
trace_m72 db "pulse.rt.Intrinsics.hostFreeBytes"
trace_m72_len equ 33
pulsec_pulse_rt_Intrinsics_hostFreeBytes__long_trace_s0 db "pulse.rt.Intrinsics.hostFreeBytes(Intrinsics.pulse:348)"
pulsec_pulse_rt_Intrinsics_hostFreeBytes__long_trace_s0_len equ 55
trace_m74 db "pulse.rt.Intrinsics.hostReadByte"
trace_m74_len equ 32
pulsec_pulse_rt_Intrinsics_hostReadByte__long_int_trace_s0 db "pulse.rt.Intrinsics.hostReadByte(Intrinsics.pulse:356)"
pulsec_pulse_rt_Intrinsics_hostReadByte__long_int_trace_s0_len equ 54
trace_m76 db "pulse.rt.Intrinsics.hostWriteByte"
trace_m76_len equ 33
trace_m77 db "pulse.rt.Intrinsics.hostCopyBytes"
trace_m77_len equ 33
pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int_trace_s0 db "pulse.rt.Intrinsics.hostCopyBytes(Intrinsics.pulse:371)"
pulsec_pulse_rt_Intrinsics_hostCopyBytes__long_long_int_trace_s0_len equ 55
trace_m79 db "pulse.rt.Intrinsics.hostReadLong"
trace_m79_len equ 32
pulsec_pulse_rt_Intrinsics_hostReadLong__long_int_trace_s0 db "pulse.rt.Intrinsics.hostReadLong(Intrinsics.pulse:379)"
pulsec_pulse_rt_Intrinsics_hostReadLong__long_int_trace_s0_len equ 54
trace_m81 db "pulse.rt.Intrinsics.hostWriteLong"
trace_m81_len equ 33
trace_m82 db "pulse.rt.Intrinsics.hostStringUtf8Length"
trace_m82_len equ 40
pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String_trace_s0 db "pulse.rt.Intrinsics.hostStringUtf8Length(Intrinsics.pulse:394)"
pulsec_pulse_rt_Intrinsics_hostStringUtf8Length__String_trace_s0_len equ 62
trace_m84 db "pulse.rt.Intrinsics.hostAllocUtf8Z"
trace_m84_len equ 34
pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String_trace_s0 db "pulse.rt.Intrinsics.hostAllocUtf8Z(Intrinsics.pulse:402)"
pulsec_pulse_rt_Intrinsics_hostAllocUtf8Z__String_trace_s0_len equ 56
trace_m86 db "pulse.rt.Intrinsics.hostStringFromUtf8"
trace_m86_len equ 38
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int_trace_s0 db "pulse.rt.Intrinsics.hostStringFromUtf8(Intrinsics.pulse:410)"
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8__long_int_trace_s0_len equ 60
trace_m88 db "pulse.rt.Intrinsics.hostStringFromUtf8Z"
trace_m88_len equ 39
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long_trace_s0 db "pulse.rt.Intrinsics.hostStringFromUtf8Z(Intrinsics.pulse:418)"
pulsec_pulse_rt_Intrinsics_hostStringFromUtf8Z__long_trace_s0_len equ 61
trace_m90 db "pulse.rt.Intrinsics.hostLoadDynamicLibrary"
trace_m90_len equ 42
pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String_trace_s0 db "pulse.rt.Intrinsics.hostLoadDynamicLibrary(Intrinsics.pulse:426)"
pulsec_pulse_rt_Intrinsics_hostLoadDynamicLibrary__String_trace_s0_len equ 64
trace_m92 db "pulse.rt.Intrinsics.hostLookupLoadedDynamicLibrary"
trace_m92_len equ 50
pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 76, 111, 111, 107, 117, 112, 76, 111
    db 97, 100, 101, 100, 68, 121, 110, 97, 109, 105, 99, 76, 105, 98, 114, 97, 114, 121, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117
    db 108, 115, 101, 58, 52, 51, 52, 41
pulsec_pulse_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_trace_s0_len equ 72
trace_m94 db "pulse.rt.Intrinsics.hostLookupSelfDynamicLibrary"
trace_m94_len equ 48
pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 76, 111, 111, 107, 117, 112, 83, 101
    db 108, 102, 68, 121, 110, 97, 109, 105, 99, 76, 105, 98, 114, 97, 114, 121, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115
    db 101, 58, 52, 52, 50, 41
pulsec_pulse_rt_Intrinsics_hostLookupSelfDynamicLibrary_trace_s0_len equ 70
trace_m96 db "pulse.rt.Intrinsics.hostFreeDynamicLibrary"
trace_m96_len equ 42
pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long_trace_s0 db "pulse.rt.Intrinsics.hostFreeDynamicLibrary(Intrinsics.pulse:450)"
pulsec_pulse_rt_Intrinsics_hostFreeDynamicLibrary__long_trace_s0_len equ 64
trace_m98 db "pulse.rt.Intrinsics.hostResolveDynamicSymbol"
trace_m98_len equ 44
pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 115, 111, 108, 118, 101, 68
    db 121, 110, 97, 109, 105, 99, 83, 121, 109, 98, 111, 108, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101, 58, 52, 53
    db 56, 41
pulsec_pulse_rt_Intrinsics_hostResolveDynamicSymbol__long_String_trace_s0_len equ 66
trace_m100 db "pulse.rt.Intrinsics.hostCallNative0"
trace_m100_len equ 35
pulsec_pulse_rt_Intrinsics_hostCallNative0__long_trace_s0 db "pulse.rt.Intrinsics.hostCallNative0(Intrinsics.pulse:466)"
pulsec_pulse_rt_Intrinsics_hostCallNative0__long_trace_s0_len equ 57
trace_m102 db "pulse.rt.Intrinsics.hostCallNative1"
trace_m102_len equ 35
pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long_trace_s0 db "pulse.rt.Intrinsics.hostCallNative1(Intrinsics.pulse:474)"
pulsec_pulse_rt_Intrinsics_hostCallNative1__long_long_trace_s0_len equ 57
trace_m104 db "pulse.rt.Intrinsics.hostCallNative2"
trace_m104_len equ 35
pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long_trace_s0 db "pulse.rt.Intrinsics.hostCallNative2(Intrinsics.pulse:482)"
pulsec_pulse_rt_Intrinsics_hostCallNative2__long_long_long_trace_s0_len equ 57
trace_m106 db "pulse.rt.Intrinsics.hostCallNative3"
trace_m106_len equ 35
pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long_trace_s0 db "pulse.rt.Intrinsics.hostCallNative3(Intrinsics.pulse:490)"
pulsec_pulse_rt_Intrinsics_hostCallNative3__long_long_long_long_trace_s0_len equ 57
trace_m108 db "pulse.rt.Intrinsics.hostCallNative4"
trace_m108_len equ 35
pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long_trace_s0 db "pulse.rt.Intrinsics.hostCallNative4(Intrinsics.pulse:504)"
pulsec_pulse_rt_Intrinsics_hostCallNative4__long_long_long_long_long_trace_s0_len equ 57
trace_m110 db "pulse.rt.Intrinsics.hostRegisterNativeCallback0"
trace_m110_len equ 47
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114
    db 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101
    db 58, 53, 49, 50, 41
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_trace_s0_len equ 69
trace_m112 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress0"
trace_m112_len equ 49
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118
    db 101, 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 50, 48, 41
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress0__int_trace_s0_len equ 71
trace_m114 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback0"
trace_m114_len equ 49
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116
    db 101, 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 50, 56, 41
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback0__int_trace_s0_len equ 71
trace_m116 db "pulse.rt.Intrinsics.hostRegisterNativeCallback1"
trace_m116_len equ 47
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114
    db 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101
    db 58, 53, 51, 54, 41
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_trace_s0_len equ 69
trace_m118 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress1"
trace_m118_len equ 49
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118
    db 101, 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 52, 52, 41
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress1__int_trace_s0_len equ 71
trace_m120 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback1"
trace_m120_len equ 49
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116
    db 101, 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 53, 50, 41
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback1__int_trace_s0_len equ 71
trace_m122 db "pulse.rt.Intrinsics.hostRegisterNativeCallback2"
trace_m122_len equ 47
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114
    db 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101
    db 58, 53, 54, 48, 41
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_trace_s0_len equ 69
trace_m124 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress2"
trace_m124_len equ 49
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118
    db 101, 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 54, 56, 41
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress2__int_trace_s0_len equ 71
trace_m126 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback2"
trace_m126_len equ 49
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116
    db 101, 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 55, 54, 41
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback2__int_trace_s0_len equ 71
trace_m128 db "pulse.rt.Intrinsics.hostRegisterNativeCallback3"
trace_m128_len equ 47
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114
    db 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101
    db 58, 53, 56, 52, 41
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_trace_s0_len equ 69
trace_m130 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress3"
trace_m130_len equ 49
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118
    db 101, 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 53, 57, 50, 41
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress3__int_trace_s0_len equ 71
trace_m132 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback3"
trace_m132_len equ 49
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116
    db 101, 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 54, 48, 48, 41
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback3__int_trace_s0_len equ 71
trace_m134 db "pulse.rt.Intrinsics.hostRegisterNativeCallback4"
trace_m134_len equ 47
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114
    db 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108, 115, 101
    db 58, 54, 48, 56, 41
pulsec_pulse_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_trace_s0_len equ 69
trace_m136 db "pulse.rt.Intrinsics.hostGetNativeCallbackAddress4"
trace_m136_len equ 49
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118
    db 101, 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 54, 49, 54, 41
pulsec_pulse_rt_Intrinsics_hostGetNativeCallbackAddress4__int_trace_s0_len equ 71
trace_m138 db "pulse.rt.Intrinsics.hostUnregisterNativeCallback4"
trace_m138_len equ 49
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int_trace_s0 db 112, 117, 108, 115, 101, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116
    db 101, 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 112, 117, 108
    db 115, 101, 58, 54, 50, 52, 41
pulsec_pulse_rt_Intrinsics_hostUnregisterNativeCallback4__int_trace_s0_len equ 71
trace_m140 db "pulse.rt.Intrinsics.hostRunShellProcess"
trace_m140_len equ 39
pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String_trace_s0 db "pulse.rt.Intrinsics.hostRunShellProcess(Intrinsics.pulse:632)"
pulsec_pulse_rt_Intrinsics_hostRunShellProcess__String_String_trace_s0_len equ 61

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
    lea rcx, trace_m2
    mov edx, trace_m2_len
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
    lea rcx, trace_m3
    mov edx, trace_m3_len
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
    lea rcx, trace_m4
    mov edx, trace_m4_len
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
    lea rcx, trace_m5
    mov edx, trace_m5_len
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
    lea rcx, trace_m6
    mov edx, trace_m6_len
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
    lea rcx, trace_m7
    mov edx, trace_m7_len
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
    lea rcx, trace_m9
    mov edx, trace_m9_len
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
    lea rcx, trace_m11
    mov edx, trace_m11_len
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
    lea rcx, trace_m13
    mov edx, trace_m13_len
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
    lea rcx, trace_m15
    mov edx, trace_m15_len
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
    lea rcx, trace_m17
    mov edx, trace_m17_len
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
    lea rcx, trace_m19
    mov edx, trace_m19_len
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
    lea rcx, trace_m21
    mov edx, trace_m21_len
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
    lea rcx, trace_m24
    mov edx, trace_m24_len
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
    lea rcx, trace_m27
    mov edx, trace_m27_len
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
    lea rcx, trace_m28
    mov edx, trace_m28_len
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
    lea rcx, trace_m30
    mov edx, trace_m30_len
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
    lea rcx, trace_m32
    mov edx, trace_m32_len
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
    lea rcx, trace_m34
    mov edx, trace_m34_len
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
    lea rcx, trace_m35
    mov edx, trace_m35_len
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
    lea rcx, trace_m36
    mov edx, trace_m36_len
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
    lea rcx, trace_m37
    mov edx, trace_m37_len
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
    lea rcx, trace_m39
    mov edx, trace_m39_len
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
    lea rcx, trace_m41
    mov edx, trace_m41_len
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
    lea rcx, trace_m43
    mov edx, trace_m43_len
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
    lea rcx, trace_m45
    mov edx, trace_m45_len
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
    lea rcx, trace_m46
    mov edx, trace_m46_len
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
    lea rcx, trace_m48
    mov edx, trace_m48_len
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
    lea rcx, trace_m49
    mov edx, trace_m49_len
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
    lea rcx, trace_m50
    mov edx, trace_m50_len
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
    lea rcx, trace_m52
    mov edx, trace_m52_len
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
    lea rcx, trace_m54
    mov edx, trace_m54_len
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
    lea rcx, trace_m56
    mov edx, trace_m56_len
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
    lea rcx, trace_m58
    mov edx, trace_m58_len
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
    lea rcx, trace_m60
    mov edx, trace_m60_len
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
    lea rcx, trace_m62
    mov edx, trace_m62_len
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
    lea rcx, trace_m64
    mov edx, trace_m64_len
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

pulsec_pulse_rt_Intrinsics_hostAllocBytes__int proc
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
    lea rcx, trace_m72
    mov edx, trace_m72_len
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
    lea rcx, trace_m76
    mov edx, trace_m76_len
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
    lea rcx, trace_m77
    mov edx, trace_m77_len
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
    lea rcx, trace_m79
    mov edx, trace_m79_len
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
    lea rcx, trace_m81
    mov edx, trace_m81_len
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
    lea rcx, trace_m82
    mov edx, trace_m82_len
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
    lea rcx, trace_m84
    mov edx, trace_m84_len
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
    lea rcx, trace_m86
    mov edx, trace_m86_len
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
    lea rcx, trace_m88
    mov edx, trace_m88_len
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
    lea rcx, trace_m90
    mov edx, trace_m90_len
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
    lea rcx, trace_m92
    mov edx, trace_m92_len
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
    lea rcx, trace_m94
    mov edx, trace_m94_len
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
    lea rcx, trace_m96
    mov edx, trace_m96_len
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
    lea rcx, trace_m98
    mov edx, trace_m98_len
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
    lea rcx, trace_m100
    mov edx, trace_m100_len
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
    lea rcx, trace_m102
    mov edx, trace_m102_len
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
    lea rcx, trace_m104
    mov edx, trace_m104_len
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
    lea rcx, trace_m106
    mov edx, trace_m106_len
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
    lea rcx, trace_m108
    mov edx, trace_m108_len
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
    lea rcx, trace_m110
    mov edx, trace_m110_len
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
    lea rcx, trace_m112
    mov edx, trace_m112_len
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
    lea rcx, trace_m114
    mov edx, trace_m114_len
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
    lea rcx, trace_m116
    mov edx, trace_m116_len
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
    lea rcx, trace_m118
    mov edx, trace_m118_len
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
    lea rcx, trace_m120
    mov edx, trace_m120_len
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
    lea rcx, trace_m122
    mov edx, trace_m122_len
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
    lea rcx, trace_m124
    mov edx, trace_m124_len
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
    lea rcx, trace_m126
    mov edx, trace_m126_len
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
    lea rcx, trace_m128
    mov edx, trace_m128_len
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
    lea rcx, trace_m130
    mov edx, trace_m130_len
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
    lea rcx, trace_m132
    mov edx, trace_m132_len
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
    lea rcx, trace_m134
    mov edx, trace_m134_len
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
    lea rcx, trace_m136
    mov edx, trace_m136_len
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
    lea rcx, trace_m138
    mov edx, trace_m138_len
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
    lea rcx, trace_m140
    mov edx, trace_m140_len
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
