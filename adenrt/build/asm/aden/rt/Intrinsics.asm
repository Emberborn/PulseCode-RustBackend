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
extrn adenc_rt_consoleWrite:proc
extrn adenc_rt_consoleWriteLine:proc
extrn adenc_rt_panic:proc
extrn adenc_rt_objectClassName:proc
extrn adenc_rt_objectHashCode:proc
extrn adenc_rt_tracePush:proc
extrn adenc_rt_tracePop:proc
extrn adenc_aden_lang_String_concat__String:proc
extrn adenc_aden_lang_String_length:proc
extrn adenc_fget_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Double_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Double_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Float_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Float_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Integer_MAX_VALUE:proc
extrn adenc_fget_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fset_aden_lang_Long_MIN_VALUE:proc
extrn adenc_fget_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fset_aden_lang_Long_MAX_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MIN_VALUE:proc
extrn adenc_fget_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fset_aden_lang_UInteger_MAX_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MIN_VALUE:proc
extrn adenc_fget_aden_lang_ULong_MAX_VALUE:proc
extrn adenc_fset_aden_lang_ULong_MAX_VALUE:proc


extrn adenc_rt_arrayGetInt:proc
extrn adenc_rt_arrayGetLong:proc
extrn adenc_rt_arrayGetString:proc
extrn adenc_rt_arrayLength:proc
extrn adenc_rt_arrayNew:proc
extrn adenc_rt_arraySetInt:proc
extrn adenc_rt_arraySetLong:proc
extrn adenc_rt_arraySetString:proc
extrn adenc_rt_consoleErrorWrite:proc
extrn adenc_rt_consoleErrorWriteLine:proc
extrn adenc_rt_consoleReadLine:proc
extrn adenc_rt_hostAllocBytes:proc
extrn adenc_rt_hostAllocUtf8Z:proc
extrn adenc_rt_hostCallNative0:proc
extrn adenc_rt_hostCallNative1:proc
extrn adenc_rt_hostCallNative2:proc
extrn adenc_rt_hostCallNative3:proc
extrn adenc_rt_hostCallNative4:proc
extrn adenc_rt_hostCopyBytes:proc
extrn adenc_rt_hostCopyFile:proc
extrn adenc_rt_hostCreateDirectory:proc
extrn adenc_rt_hostExists:proc
extrn adenc_rt_hostFreeBytes:proc
extrn adenc_rt_hostFreeDynamicLibrary:proc
extrn adenc_rt_hostGetNativeCallbackAddress0:proc
extrn adenc_rt_hostGetNativeCallbackAddress1:proc
extrn adenc_rt_hostGetNativeCallbackAddress2:proc
extrn adenc_rt_hostGetNativeCallbackAddress3:proc
extrn adenc_rt_hostGetNativeCallbackAddress4:proc
extrn adenc_rt_hostIsDirectory:proc
extrn adenc_rt_hostIsFile:proc
extrn adenc_rt_hostListChildren:proc
extrn adenc_rt_hostLoadDynamicLibrary:proc
extrn adenc_rt_hostLookupLoadedDynamicLibrary:proc
extrn adenc_rt_hostLookupSelfDynamicLibrary:proc
extrn adenc_rt_hostReadAllText:proc
extrn adenc_rt_hostReadByte:proc
extrn adenc_rt_hostReadLong:proc
extrn adenc_rt_hostRegisterNativeCallback0:proc
extrn adenc_rt_hostRegisterNativeCallback1:proc
extrn adenc_rt_hostRegisterNativeCallback2:proc
extrn adenc_rt_hostRegisterNativeCallback3:proc
extrn adenc_rt_hostRegisterNativeCallback4:proc
extrn adenc_rt_hostResolveDynamicSymbol:proc
extrn adenc_rt_hostRunShellProcess:proc
extrn adenc_rt_hostStringFromUtf8:proc
extrn adenc_rt_hostStringFromUtf8Z:proc
extrn adenc_rt_hostStringUtf8Length:proc
extrn adenc_rt_hostUnregisterNativeCallback0:proc
extrn adenc_rt_hostUnregisterNativeCallback1:proc
extrn adenc_rt_hostUnregisterNativeCallback2:proc
extrn adenc_rt_hostUnregisterNativeCallback3:proc
extrn adenc_rt_hostUnregisterNativeCallback4:proc
extrn adenc_rt_hostWriteAllText:proc
extrn adenc_rt_hostWriteByte:proc
extrn adenc_rt_hostWriteLong:proc
extrn adenc_rt_listAddInt:proc
extrn adenc_rt_listAddString:proc
extrn adenc_rt_listClear:proc
extrn adenc_rt_listGetInt:proc
extrn adenc_rt_listGetString:proc
extrn adenc_rt_listKind:proc
extrn adenc_rt_listNew:proc
extrn adenc_rt_listSize:proc
extrn adenc_rt_mapClear:proc
extrn adenc_rt_mapContainsKey:proc
extrn adenc_rt_mapGet:proc
extrn adenc_rt_mapGetInt:proc
extrn adenc_rt_mapNew:proc
extrn adenc_rt_mapPut:proc
extrn adenc_rt_mapPutInt:proc
extrn adenc_rt_mapSize:proc
extrn adenc_rt_stringConcat:proc
extrn adenc_rt_stringLength:proc
.data
written dq 0
adenc_objc_aden_rt_Intrinsics dd 0
trace_m0 db "aden.rt.Intrinsics.consoleReadLine"
trace_m0_len equ 34
adenc_aden_rt_Intrinsics_consoleReadLine_trace_s0 db "aden.rt.Intrinsics.consoleReadLine(Intrinsics.aden:18)"
adenc_aden_rt_Intrinsics_consoleReadLine_trace_s0_len equ 54
trace_m2 db "aden.rt.Intrinsics.consoleWrite"
trace_m2_len equ 31
trace_m3 db "aden.rt.Intrinsics.consoleErrorWrite"
trace_m3_len equ 36
trace_m4 db "aden.rt.Intrinsics.consoleWriteLine"
trace_m4_len equ 35
trace_m5 db "aden.rt.Intrinsics.consoleErrorWriteLine"
trace_m5_len equ 40
trace_m6 db "aden.rt.Intrinsics.panic"
trace_m6_len equ 24
trace_m7 db "aden.rt.Intrinsics.stringConcat"
trace_m7_len equ 31
adenc_aden_rt_Intrinsics_stringConcat__String_String_trace_s0 db "aden.rt.Intrinsics.stringConcat(Intrinsics.aden:61)"
adenc_aden_rt_Intrinsics_stringConcat__String_String_trace_s0_len equ 51
trace_m9 db "aden.rt.Intrinsics.stringLength"
trace_m9_len equ 31
adenc_aden_rt_Intrinsics_stringLength__String_trace_s0 db "aden.rt.Intrinsics.stringLength(Intrinsics.aden:69)"
adenc_aden_rt_Intrinsics_stringLength__String_trace_s0_len equ 51
trace_m11 db "aden.rt.Intrinsics.objectClassName"
trace_m11_len equ 34
adenc_aden_rt_Intrinsics_objectClassName__Object_trace_s0 db "aden.rt.Intrinsics.objectClassName(Intrinsics.aden:77)"
adenc_aden_rt_Intrinsics_objectClassName__Object_trace_s0_len equ 54
trace_m13 db "aden.rt.Intrinsics.objectHashCode"
trace_m13_len equ 33
adenc_aden_rt_Intrinsics_objectHashCode__Object_trace_s0 db "aden.rt.Intrinsics.objectHashCode(Intrinsics.aden:85)"
adenc_aden_rt_Intrinsics_objectHashCode__Object_trace_s0_len equ 53
trace_m15 db "aden.rt.Intrinsics.arrayNew"
trace_m15_len equ 27
adenc_aden_rt_Intrinsics_arrayNew__int_trace_s0 db "aden.rt.Intrinsics.arrayNew(Intrinsics.aden:93)"
adenc_aden_rt_Intrinsics_arrayNew__int_trace_s0_len equ 47
trace_m17 db "aden.rt.Intrinsics.arrayLength"
trace_m17_len equ 30
adenc_aden_rt_Intrinsics_arrayLength__long_trace_s0 db "aden.rt.Intrinsics.arrayLength(Intrinsics.aden:101)"
adenc_aden_rt_Intrinsics_arrayLength__long_trace_s0_len equ 51
trace_m19 db "aden.rt.Intrinsics.arrayGetInt"
trace_m19_len equ 30
adenc_aden_rt_Intrinsics_arrayGetInt__long_int_trace_s0 db "aden.rt.Intrinsics.arrayGetInt(Intrinsics.aden:109)"
adenc_aden_rt_Intrinsics_arrayGetInt__long_int_trace_s0_len equ 51
trace_m21 db "aden.rt.Intrinsics.arraySetInt"
trace_m21_len equ 30
trace_m22 db "aden.rt.Intrinsics.arrayGetLong"
trace_m22_len equ 31
adenc_aden_rt_Intrinsics_arrayGetLong__long_int_trace_s0 db "aden.rt.Intrinsics.arrayGetLong(Intrinsics.aden:124)"
adenc_aden_rt_Intrinsics_arrayGetLong__long_int_trace_s0_len equ 52
trace_m24 db "aden.rt.Intrinsics.arraySetLong"
trace_m24_len equ 31
trace_m25 db "aden.rt.Intrinsics.arrayGetString"
trace_m25_len equ 33
adenc_aden_rt_Intrinsics_arrayGetString__long_int_trace_s0 db "aden.rt.Intrinsics.arrayGetString(Intrinsics.aden:139)"
adenc_aden_rt_Intrinsics_arrayGetString__long_int_trace_s0_len equ 54
trace_m27 db "aden.rt.Intrinsics.arraySetString"
trace_m27_len equ 33
trace_m28 db "aden.rt.Intrinsics.listNew"
trace_m28_len equ 26
adenc_aden_rt_Intrinsics_listNew_trace_s0 db "aden.rt.Intrinsics.listNew(Intrinsics.aden:154)"
adenc_aden_rt_Intrinsics_listNew_trace_s0_len equ 47
trace_m30 db "aden.rt.Intrinsics.listSize"
trace_m30_len equ 27
adenc_aden_rt_Intrinsics_listSize__long_trace_s0 db "aden.rt.Intrinsics.listSize(Intrinsics.aden:162)"
adenc_aden_rt_Intrinsics_listSize__long_trace_s0_len equ 48
trace_m32 db "aden.rt.Intrinsics.listKind"
trace_m32_len equ 27
adenc_aden_rt_Intrinsics_listKind__long_trace_s0 db "aden.rt.Intrinsics.listKind(Intrinsics.aden:170)"
adenc_aden_rt_Intrinsics_listKind__long_trace_s0_len equ 48
trace_m34 db "aden.rt.Intrinsics.listClear"
trace_m34_len equ 28
trace_m35 db "aden.rt.Intrinsics.listAddInt"
trace_m35_len equ 29
trace_m36 db "aden.rt.Intrinsics.listAddString"
trace_m36_len equ 32
trace_m37 db "aden.rt.Intrinsics.listGetInt"
trace_m37_len equ 29
adenc_aden_rt_Intrinsics_listGetInt__long_int_trace_s0 db "aden.rt.Intrinsics.listGetInt(Intrinsics.aden:199)"
adenc_aden_rt_Intrinsics_listGetInt__long_int_trace_s0_len equ 50
trace_m39 db "aden.rt.Intrinsics.listGetString"
trace_m39_len equ 32
adenc_aden_rt_Intrinsics_listGetString__long_int_trace_s0 db "aden.rt.Intrinsics.listGetString(Intrinsics.aden:207)"
adenc_aden_rt_Intrinsics_listGetString__long_int_trace_s0_len equ 53
trace_m41 db "aden.rt.Intrinsics.mapNew"
trace_m41_len equ 25
adenc_aden_rt_Intrinsics_mapNew_trace_s0 db "aden.rt.Intrinsics.mapNew(Intrinsics.aden:215)"
adenc_aden_rt_Intrinsics_mapNew_trace_s0_len equ 46
trace_m43 db "aden.rt.Intrinsics.mapSize"
trace_m43_len equ 26
adenc_aden_rt_Intrinsics_mapSize__long_trace_s0 db "aden.rt.Intrinsics.mapSize(Intrinsics.aden:223)"
adenc_aden_rt_Intrinsics_mapSize__long_trace_s0_len equ 47
trace_m45 db "aden.rt.Intrinsics.mapClear"
trace_m45_len equ 27
trace_m46 db "aden.rt.Intrinsics.mapContainsKey"
trace_m46_len equ 33
adenc_aden_rt_Intrinsics_mapContainsKey__long_String_trace_s0 db "aden.rt.Intrinsics.mapContainsKey(Intrinsics.aden:238)"
adenc_aden_rt_Intrinsics_mapContainsKey__long_String_trace_s0_len equ 54
trace_m48 db "aden.rt.Intrinsics.mapPut"
trace_m48_len equ 25
trace_m49 db "aden.rt.Intrinsics.mapPutInt"
trace_m49_len equ 28
trace_m50 db "aden.rt.Intrinsics.mapGet"
trace_m50_len equ 25
adenc_aden_rt_Intrinsics_mapGet__long_String_trace_s0 db "aden.rt.Intrinsics.mapGet(Intrinsics.aden:260)"
adenc_aden_rt_Intrinsics_mapGet__long_String_trace_s0_len equ 46
trace_m52 db "aden.rt.Intrinsics.mapGetInt"
trace_m52_len equ 28
adenc_aden_rt_Intrinsics_mapGetInt__long_String_trace_s0 db "aden.rt.Intrinsics.mapGetInt(Intrinsics.aden:268)"
adenc_aden_rt_Intrinsics_mapGetInt__long_String_trace_s0_len equ 49
trace_m54 db "aden.rt.Intrinsics.hostExists"
trace_m54_len equ 29
adenc_aden_rt_Intrinsics_hostExists__String_trace_s0 db "aden.rt.Intrinsics.hostExists(Intrinsics.aden:276)"
adenc_aden_rt_Intrinsics_hostExists__String_trace_s0_len equ 50
trace_m56 db "aden.rt.Intrinsics.hostIsFile"
trace_m56_len equ 29
adenc_aden_rt_Intrinsics_hostIsFile__String_trace_s0 db "aden.rt.Intrinsics.hostIsFile(Intrinsics.aden:284)"
adenc_aden_rt_Intrinsics_hostIsFile__String_trace_s0_len equ 50
trace_m58 db "aden.rt.Intrinsics.hostIsDirectory"
trace_m58_len equ 34
adenc_aden_rt_Intrinsics_hostIsDirectory__String_trace_s0 db "aden.rt.Intrinsics.hostIsDirectory(Intrinsics.aden:292)"
adenc_aden_rt_Intrinsics_hostIsDirectory__String_trace_s0_len equ 55
trace_m60 db "aden.rt.Intrinsics.hostReadAllText"
trace_m60_len equ 34
adenc_aden_rt_Intrinsics_hostReadAllText__String_trace_s0 db "aden.rt.Intrinsics.hostReadAllText(Intrinsics.aden:300)"
adenc_aden_rt_Intrinsics_hostReadAllText__String_trace_s0_len equ 55
trace_m62 db "aden.rt.Intrinsics.hostListChildren"
trace_m62_len equ 35
adenc_aden_rt_Intrinsics_hostListChildren__String_trace_s0 db "aden.rt.Intrinsics.hostListChildren(Intrinsics.aden:308)"
adenc_aden_rt_Intrinsics_hostListChildren__String_trace_s0_len equ 56
trace_m64 db "aden.rt.Intrinsics.hostCreateDirectory"
trace_m64_len equ 38
adenc_aden_rt_Intrinsics_hostCreateDirectory__String_trace_s0 db "aden.rt.Intrinsics.hostCreateDirectory(Intrinsics.aden:316)"
adenc_aden_rt_Intrinsics_hostCreateDirectory__String_trace_s0_len equ 59
trace_m66 db "aden.rt.Intrinsics.hostWriteAllText"
trace_m66_len equ 35
adenc_aden_rt_Intrinsics_hostWriteAllText__String_String_trace_s0 db "aden.rt.Intrinsics.hostWriteAllText(Intrinsics.aden:324)"
adenc_aden_rt_Intrinsics_hostWriteAllText__String_String_trace_s0_len equ 56
trace_m68 db "aden.rt.Intrinsics.hostCopyFile"
trace_m68_len equ 31
adenc_aden_rt_Intrinsics_hostCopyFile__String_String_trace_s0 db "aden.rt.Intrinsics.hostCopyFile(Intrinsics.aden:332)"
adenc_aden_rt_Intrinsics_hostCopyFile__String_String_trace_s0_len equ 52
trace_m70 db "aden.rt.Intrinsics.hostAllocBytes"
trace_m70_len equ 33
adenc_aden_rt_Intrinsics_hostAllocBytes__int_trace_s0 db "aden.rt.Intrinsics.hostAllocBytes(Intrinsics.aden:340)"
adenc_aden_rt_Intrinsics_hostAllocBytes__int_trace_s0_len equ 54
trace_m72 db "aden.rt.Intrinsics.hostFreeBytes"
trace_m72_len equ 32
adenc_aden_rt_Intrinsics_hostFreeBytes__long_trace_s0 db "aden.rt.Intrinsics.hostFreeBytes(Intrinsics.aden:348)"
adenc_aden_rt_Intrinsics_hostFreeBytes__long_trace_s0_len equ 53
trace_m74 db "aden.rt.Intrinsics.hostReadByte"
trace_m74_len equ 31
adenc_aden_rt_Intrinsics_hostReadByte__long_int_trace_s0 db "aden.rt.Intrinsics.hostReadByte(Intrinsics.aden:356)"
adenc_aden_rt_Intrinsics_hostReadByte__long_int_trace_s0_len equ 52
trace_m76 db "aden.rt.Intrinsics.hostWriteByte"
trace_m76_len equ 32
trace_m77 db "aden.rt.Intrinsics.hostCopyBytes"
trace_m77_len equ 32
adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int_trace_s0 db "aden.rt.Intrinsics.hostCopyBytes(Intrinsics.aden:371)"
adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int_trace_s0_len equ 53
trace_m79 db "aden.rt.Intrinsics.hostReadLong"
trace_m79_len equ 31
adenc_aden_rt_Intrinsics_hostReadLong__long_int_trace_s0 db "aden.rt.Intrinsics.hostReadLong(Intrinsics.aden:379)"
adenc_aden_rt_Intrinsics_hostReadLong__long_int_trace_s0_len equ 52
trace_m81 db "aden.rt.Intrinsics.hostWriteLong"
trace_m81_len equ 32
trace_m82 db "aden.rt.Intrinsics.hostStringUtf8Length"
trace_m82_len equ 39
adenc_aden_rt_Intrinsics_hostStringUtf8Length__String_trace_s0 db "aden.rt.Intrinsics.hostStringUtf8Length(Intrinsics.aden:394)"
adenc_aden_rt_Intrinsics_hostStringUtf8Length__String_trace_s0_len equ 60
trace_m84 db "aden.rt.Intrinsics.hostAllocUtf8Z"
trace_m84_len equ 33
adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String_trace_s0 db "aden.rt.Intrinsics.hostAllocUtf8Z(Intrinsics.aden:402)"
adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String_trace_s0_len equ 54
trace_m86 db "aden.rt.Intrinsics.hostStringFromUtf8"
trace_m86_len equ 37
adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int_trace_s0 db "aden.rt.Intrinsics.hostStringFromUtf8(Intrinsics.aden:410)"
adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int_trace_s0_len equ 58
trace_m88 db "aden.rt.Intrinsics.hostStringFromUtf8Z"
trace_m88_len equ 38
adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long_trace_s0 db "aden.rt.Intrinsics.hostStringFromUtf8Z(Intrinsics.aden:418)"
adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long_trace_s0_len equ 59
trace_m90 db "aden.rt.Intrinsics.hostLoadDynamicLibrary"
trace_m90_len equ 41
adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String_trace_s0 db "aden.rt.Intrinsics.hostLoadDynamicLibrary(Intrinsics.aden:426)"
adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String_trace_s0_len equ 62
trace_m92 db "aden.rt.Intrinsics.hostLookupLoadedDynamicLibrary"
trace_m92_len equ 49
adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 76, 111, 111, 107, 117, 112, 76, 111, 97
    db 100, 101, 100, 68, 121, 110, 97, 109, 105, 99, 76, 105, 98, 114, 97, 114, 121, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101
    db 110, 58, 52, 51, 52, 41
adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_trace_s0_len equ 70
trace_m94 db "aden.rt.Intrinsics.hostLookupSelfDynamicLibrary"
trace_m94_len equ 47
adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 76, 111, 111, 107, 117, 112, 83, 101, 108
    db 102, 68, 121, 110, 97, 109, 105, 99, 76, 105, 98, 114, 97, 114, 121, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58
    db 52, 52, 50, 41
adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary_trace_s0_len equ 68
trace_m96 db "aden.rt.Intrinsics.hostFreeDynamicLibrary"
trace_m96_len equ 41
adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long_trace_s0 db "aden.rt.Intrinsics.hostFreeDynamicLibrary(Intrinsics.aden:450)"
adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long_trace_s0_len equ 62
trace_m98 db "aden.rt.Intrinsics.hostResolveDynamicSymbol"
trace_m98_len equ 43
adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String_trace_s0 db "aden.rt.Intrinsics.hostResolveDynamicSymbol(Intrinsics.aden:458)"
adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String_trace_s0_len equ 64
trace_m100 db "aden.rt.Intrinsics.hostCallNative0"
trace_m100_len equ 34
adenc_aden_rt_Intrinsics_hostCallNative0__long_trace_s0 db "aden.rt.Intrinsics.hostCallNative0(Intrinsics.aden:466)"
adenc_aden_rt_Intrinsics_hostCallNative0__long_trace_s0_len equ 55
trace_m102 db "aden.rt.Intrinsics.hostCallNative1"
trace_m102_len equ 34
adenc_aden_rt_Intrinsics_hostCallNative1__long_long_trace_s0 db "aden.rt.Intrinsics.hostCallNative1(Intrinsics.aden:474)"
adenc_aden_rt_Intrinsics_hostCallNative1__long_long_trace_s0_len equ 55
trace_m104 db "aden.rt.Intrinsics.hostCallNative2"
trace_m104_len equ 34
adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long_trace_s0 db "aden.rt.Intrinsics.hostCallNative2(Intrinsics.aden:482)"
adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long_trace_s0_len equ 55
trace_m106 db "aden.rt.Intrinsics.hostCallNative3"
trace_m106_len equ 34
adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long_trace_s0 db "aden.rt.Intrinsics.hostCallNative3(Intrinsics.aden:490)"
adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long_trace_s0_len equ 55
trace_m108 db "aden.rt.Intrinsics.hostCallNative4"
trace_m108_len equ 34
adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long_trace_s0 db "aden.rt.Intrinsics.hostCallNative4(Intrinsics.aden:504)"
adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long_trace_s0_len equ 55
trace_m110 db "aden.rt.Intrinsics.hostRegisterNativeCallback0"
trace_m110_len equ 46
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114, 78
    db 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58, 53
    db 49, 50, 41
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_trace_s0_len equ 67
trace_m112 db "aden.rt.Intrinsics.hostGetNativeCallbackAddress0"
trace_m112_len equ 48
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118, 101
    db 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 50, 48, 41
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int_trace_s0_len equ 69
trace_m114 db "aden.rt.Intrinsics.hostUnregisterNativeCallback0"
trace_m114_len equ 48
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116, 101
    db 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 48, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 50, 56, 41
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int_trace_s0_len equ 69
trace_m116 db "aden.rt.Intrinsics.hostRegisterNativeCallback1"
trace_m116_len equ 46
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114, 78
    db 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58, 53
    db 51, 54, 41
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_trace_s0_len equ 67
trace_m118 db "aden.rt.Intrinsics.hostGetNativeCallbackAddress1"
trace_m118_len equ 48
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118, 101
    db 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 52, 52, 41
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int_trace_s0_len equ 69
trace_m120 db "aden.rt.Intrinsics.hostUnregisterNativeCallback1"
trace_m120_len equ 48
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116, 101
    db 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 49, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 53, 50, 41
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int_trace_s0_len equ 69
trace_m122 db "aden.rt.Intrinsics.hostRegisterNativeCallback2"
trace_m122_len equ 46
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114, 78
    db 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58, 53
    db 54, 48, 41
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_trace_s0_len equ 67
trace_m124 db "aden.rt.Intrinsics.hostGetNativeCallbackAddress2"
trace_m124_len equ 48
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118, 101
    db 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 54, 56, 41
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int_trace_s0_len equ 69
trace_m126 db "aden.rt.Intrinsics.hostUnregisterNativeCallback2"
trace_m126_len equ 48
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116, 101
    db 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 50, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 55, 54, 41
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int_trace_s0_len equ 69
trace_m128 db "aden.rt.Intrinsics.hostRegisterNativeCallback3"
trace_m128_len equ 46
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114, 78
    db 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58, 53
    db 56, 52, 41
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_trace_s0_len equ 67
trace_m130 db "aden.rt.Intrinsics.hostGetNativeCallbackAddress3"
trace_m130_len equ 48
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118, 101
    db 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 53, 57, 50, 41
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int_trace_s0_len equ 69
trace_m132 db "aden.rt.Intrinsics.hostUnregisterNativeCallback3"
trace_m132_len equ 48
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116, 101
    db 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 51, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 54, 48, 48, 41
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int_trace_s0_len equ 69
trace_m134 db "aden.rt.Intrinsics.hostRegisterNativeCallback4"
trace_m134_len equ 46
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 82, 101, 103, 105, 115, 116, 101, 114, 78
    db 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110, 58, 54
    db 48, 56, 41
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_trace_s0_len equ 67
trace_m136 db "aden.rt.Intrinsics.hostGetNativeCallbackAddress4"
trace_m136_len equ 48
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 71, 101, 116, 78, 97, 116, 105, 118, 101
    db 67, 97, 108, 108, 98, 97, 99, 107, 65, 100, 100, 114, 101, 115, 115, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 54, 49, 54, 41
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int_trace_s0_len equ 69
trace_m138 db "aden.rt.Intrinsics.hostUnregisterNativeCallback4"
trace_m138_len equ 48
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int_trace_s0 db 97, 100, 101, 110, 46, 114, 116, 46, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 104, 111, 115, 116, 85, 110, 114, 101, 103, 105, 115, 116, 101
    db 114, 78, 97, 116, 105, 118, 101, 67, 97, 108, 108, 98, 97, 99, 107, 52, 40, 73, 110, 116, 114, 105, 110, 115, 105, 99, 115, 46, 97, 100, 101, 110
    db 58, 54, 50, 52, 41
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int_trace_s0_len equ 69
trace_m140 db "aden.rt.Intrinsics.hostRunShellProcess"
trace_m140_len equ 38
adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String_trace_s0 db "aden.rt.Intrinsics.hostRunShellProcess(Intrinsics.aden:632)"
adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String_trace_s0_len equ 59

.code
adenc_aden_rt_Intrinsics_consoleReadLine proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call adenc_rt_consoleReadLine
    jmp adenc_aden_rt_Intrinsics_consoleReadLine_epilogue
adenc_aden_rt_Intrinsics_consoleReadLine_epilogue:
adenc_aden_rt_Intrinsics_consoleReadLine_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_aden_rt_Intrinsics_consoleReadLine endp

adenc_aden_rt_Intrinsics_consoleWrite__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_consoleWrite
    jmp adenc_aden_rt_Intrinsics_consoleWrite__String_epilogue
adenc_aden_rt_Intrinsics_consoleWrite__String_epilogue:
adenc_aden_rt_Intrinsics_consoleWrite__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_consoleWrite__String endp

adenc_aden_rt_Intrinsics_consoleErrorWrite__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_consoleErrorWrite
    jmp adenc_aden_rt_Intrinsics_consoleErrorWrite__String_epilogue
adenc_aden_rt_Intrinsics_consoleErrorWrite__String_epilogue:
adenc_aden_rt_Intrinsics_consoleErrorWrite__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_consoleErrorWrite__String endp

adenc_aden_rt_Intrinsics_consoleWriteLine__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_consoleWriteLine
    jmp adenc_aden_rt_Intrinsics_consoleWriteLine__String_epilogue
adenc_aden_rt_Intrinsics_consoleWriteLine__String_epilogue:
adenc_aden_rt_Intrinsics_consoleWriteLine__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_consoleWriteLine__String endp

adenc_aden_rt_Intrinsics_consoleErrorWriteLine__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_consoleErrorWriteLine
    jmp adenc_aden_rt_Intrinsics_consoleErrorWriteLine__String_epilogue
adenc_aden_rt_Intrinsics_consoleErrorWriteLine__String_epilogue:
adenc_aden_rt_Intrinsics_consoleErrorWriteLine__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_consoleErrorWriteLine__String endp

adenc_aden_rt_Intrinsics_panic__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_panic
    jmp adenc_aden_rt_Intrinsics_panic__String_epilogue
adenc_aden_rt_Intrinsics_panic__String_epilogue:
adenc_aden_rt_Intrinsics_panic__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_panic__String endp

adenc_aden_rt_Intrinsics_stringConcat__String_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_stringConcat
    jmp adenc_aden_rt_Intrinsics_stringConcat__String_String_epilogue
adenc_aden_rt_Intrinsics_stringConcat__String_String_epilogue:
adenc_aden_rt_Intrinsics_stringConcat__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
adenc_aden_rt_Intrinsics_stringConcat__String_String endp

adenc_aden_rt_Intrinsics_stringLength__String proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_stringLength
    jmp adenc_aden_rt_Intrinsics_stringLength__String_epilogue
adenc_aden_rt_Intrinsics_stringLength__String_epilogue:
adenc_aden_rt_Intrinsics_stringLength__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
adenc_aden_rt_Intrinsics_stringLength__String endp

adenc_aden_rt_Intrinsics_objectClassName__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_objectClassName
    jmp adenc_aden_rt_Intrinsics_objectClassName__Object_epilogue
adenc_aden_rt_Intrinsics_objectClassName__Object_epilogue:
adenc_aden_rt_Intrinsics_objectClassName__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_objectClassName__Object endp

adenc_aden_rt_Intrinsics_objectHashCode__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_objectHashCode
    jmp adenc_aden_rt_Intrinsics_objectHashCode__Object_epilogue
adenc_aden_rt_Intrinsics_objectHashCode__Object_epilogue:
adenc_aden_rt_Intrinsics_objectHashCode__Object_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_objectHashCode__Object endp

adenc_aden_rt_Intrinsics_arrayNew__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_arrayNew
    jmp adenc_aden_rt_Intrinsics_arrayNew__int_epilogue
adenc_aden_rt_Intrinsics_arrayNew__int_epilogue:
adenc_aden_rt_Intrinsics_arrayNew__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_arrayNew__int endp

adenc_aden_rt_Intrinsics_arrayLength__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_arrayLength
    jmp adenc_aden_rt_Intrinsics_arrayLength__long_epilogue
adenc_aden_rt_Intrinsics_arrayLength__long_epilogue:
adenc_aden_rt_Intrinsics_arrayLength__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_arrayLength__long endp

adenc_aden_rt_Intrinsics_arrayGetInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_arrayGetInt
    jmp adenc_aden_rt_Intrinsics_arrayGetInt__long_int_epilogue
adenc_aden_rt_Intrinsics_arrayGetInt__long_int_epilogue:
adenc_aden_rt_Intrinsics_arrayGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_arrayGetInt__long_int endp

adenc_aden_rt_Intrinsics_arraySetInt__long_int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call adenc_rt_tracePush
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
    call adenc_rt_arraySetInt
    jmp adenc_aden_rt_Intrinsics_arraySetInt__long_int_int_epilogue
adenc_aden_rt_Intrinsics_arraySetInt__long_int_int_epilogue:
adenc_aden_rt_Intrinsics_arraySetInt__long_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_arraySetInt__long_int_int endp

adenc_aden_rt_Intrinsics_arrayGetLong__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_arrayGetLong
    jmp adenc_aden_rt_Intrinsics_arrayGetLong__long_int_epilogue
adenc_aden_rt_Intrinsics_arrayGetLong__long_int_epilogue:
adenc_aden_rt_Intrinsics_arrayGetLong__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_arrayGetLong__long_int endp

adenc_aden_rt_Intrinsics_arraySetLong__long_int_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call adenc_rt_tracePush
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
    call adenc_rt_arraySetLong
    jmp adenc_aden_rt_Intrinsics_arraySetLong__long_int_long_epilogue
adenc_aden_rt_Intrinsics_arraySetLong__long_int_long_epilogue:
adenc_aden_rt_Intrinsics_arraySetLong__long_int_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_arraySetLong__long_int_long endp

adenc_aden_rt_Intrinsics_arrayGetString__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_arrayGetString
    jmp adenc_aden_rt_Intrinsics_arrayGetString__long_int_epilogue
adenc_aden_rt_Intrinsics_arrayGetString__long_int_epilogue:
adenc_aden_rt_Intrinsics_arrayGetString__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_arrayGetString__long_int endp

adenc_aden_rt_Intrinsics_arraySetString__long_int_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call adenc_rt_tracePush
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
    call adenc_rt_arraySetString
    jmp adenc_aden_rt_Intrinsics_arraySetString__long_int_String_epilogue
adenc_aden_rt_Intrinsics_arraySetString__long_int_String_epilogue:
adenc_aden_rt_Intrinsics_arraySetString__long_int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_arraySetString__long_int_String endp

adenc_aden_rt_Intrinsics_listNew proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call adenc_rt_listNew
    jmp adenc_aden_rt_Intrinsics_listNew_epilogue
adenc_aden_rt_Intrinsics_listNew_epilogue:
adenc_aden_rt_Intrinsics_listNew_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_aden_rt_Intrinsics_listNew endp

adenc_aden_rt_Intrinsics_listSize__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_listSize
    jmp adenc_aden_rt_Intrinsics_listSize__long_epilogue
adenc_aden_rt_Intrinsics_listSize__long_epilogue:
adenc_aden_rt_Intrinsics_listSize__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listSize__long endp

adenc_aden_rt_Intrinsics_listKind__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_listKind
    jmp adenc_aden_rt_Intrinsics_listKind__long_epilogue
adenc_aden_rt_Intrinsics_listKind__long_epilogue:
adenc_aden_rt_Intrinsics_listKind__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listKind__long endp

adenc_aden_rt_Intrinsics_listClear__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_listClear
    jmp adenc_aden_rt_Intrinsics_listClear__long_epilogue
adenc_aden_rt_Intrinsics_listClear__long_epilogue:
adenc_aden_rt_Intrinsics_listClear__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listClear__long endp

adenc_aden_rt_Intrinsics_listAddInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_listAddInt
    jmp adenc_aden_rt_Intrinsics_listAddInt__long_int_epilogue
adenc_aden_rt_Intrinsics_listAddInt__long_int_epilogue:
adenc_aden_rt_Intrinsics_listAddInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listAddInt__long_int endp

adenc_aden_rt_Intrinsics_listAddString__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_listAddString
    jmp adenc_aden_rt_Intrinsics_listAddString__long_String_epilogue
adenc_aden_rt_Intrinsics_listAddString__long_String_epilogue:
adenc_aden_rt_Intrinsics_listAddString__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listAddString__long_String endp

adenc_aden_rt_Intrinsics_listGetInt__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_listGetInt
    jmp adenc_aden_rt_Intrinsics_listGetInt__long_int_epilogue
adenc_aden_rt_Intrinsics_listGetInt__long_int_epilogue:
adenc_aden_rt_Intrinsics_listGetInt__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listGetInt__long_int endp

adenc_aden_rt_Intrinsics_listGetString__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_listGetString
    jmp adenc_aden_rt_Intrinsics_listGetString__long_int_epilogue
adenc_aden_rt_Intrinsics_listGetString__long_int_epilogue:
adenc_aden_rt_Intrinsics_listGetString__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_listGetString__long_int endp

adenc_aden_rt_Intrinsics_mapNew proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call adenc_rt_mapNew
    jmp adenc_aden_rt_Intrinsics_mapNew_epilogue
adenc_aden_rt_Intrinsics_mapNew_epilogue:
adenc_aden_rt_Intrinsics_mapNew_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_aden_rt_Intrinsics_mapNew endp

adenc_aden_rt_Intrinsics_mapSize__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_mapSize
    jmp adenc_aden_rt_Intrinsics_mapSize__long_epilogue
adenc_aden_rt_Intrinsics_mapSize__long_epilogue:
adenc_aden_rt_Intrinsics_mapSize__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_mapSize__long endp

adenc_aden_rt_Intrinsics_mapClear__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_mapClear
    jmp adenc_aden_rt_Intrinsics_mapClear__long_epilogue
adenc_aden_rt_Intrinsics_mapClear__long_epilogue:
adenc_aden_rt_Intrinsics_mapClear__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_mapClear__long endp

adenc_aden_rt_Intrinsics_mapContainsKey__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_mapContainsKey
    jmp adenc_aden_rt_Intrinsics_mapContainsKey__long_String_epilogue
adenc_aden_rt_Intrinsics_mapContainsKey__long_String_epilogue:
adenc_aden_rt_Intrinsics_mapContainsKey__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_mapContainsKey__long_String endp

adenc_aden_rt_Intrinsics_mapPut__long_String_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call adenc_rt_tracePush
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
    call adenc_rt_mapPut
    jmp adenc_aden_rt_Intrinsics_mapPut__long_String_String_epilogue
adenc_aden_rt_Intrinsics_mapPut__long_String_String_epilogue:
adenc_aden_rt_Intrinsics_mapPut__long_String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_mapPut__long_String_String endp

adenc_aden_rt_Intrinsics_mapPutInt__long_String_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call adenc_rt_tracePush
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
    call adenc_rt_mapPutInt
    jmp adenc_aden_rt_Intrinsics_mapPutInt__long_String_int_epilogue
adenc_aden_rt_Intrinsics_mapPutInt__long_String_int_epilogue:
adenc_aden_rt_Intrinsics_mapPutInt__long_String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_mapPutInt__long_String_int endp

adenc_aden_rt_Intrinsics_mapGet__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_mapGet
    jmp adenc_aden_rt_Intrinsics_mapGet__long_String_epilogue
adenc_aden_rt_Intrinsics_mapGet__long_String_epilogue:
adenc_aden_rt_Intrinsics_mapGet__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_mapGet__long_String endp

adenc_aden_rt_Intrinsics_mapGetInt__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_mapGetInt
    jmp adenc_aden_rt_Intrinsics_mapGetInt__long_String_epilogue
adenc_aden_rt_Intrinsics_mapGetInt__long_String_epilogue:
adenc_aden_rt_Intrinsics_mapGetInt__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_mapGetInt__long_String endp

adenc_aden_rt_Intrinsics_hostExists__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostExists
    jmp adenc_aden_rt_Intrinsics_hostExists__String_epilogue
adenc_aden_rt_Intrinsics_hostExists__String_epilogue:
adenc_aden_rt_Intrinsics_hostExists__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostExists__String endp

adenc_aden_rt_Intrinsics_hostIsFile__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostIsFile
    jmp adenc_aden_rt_Intrinsics_hostIsFile__String_epilogue
adenc_aden_rt_Intrinsics_hostIsFile__String_epilogue:
adenc_aden_rt_Intrinsics_hostIsFile__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostIsFile__String endp

adenc_aden_rt_Intrinsics_hostIsDirectory__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostIsDirectory
    jmp adenc_aden_rt_Intrinsics_hostIsDirectory__String_epilogue
adenc_aden_rt_Intrinsics_hostIsDirectory__String_epilogue:
adenc_aden_rt_Intrinsics_hostIsDirectory__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostIsDirectory__String endp

adenc_aden_rt_Intrinsics_hostReadAllText__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostReadAllText
    jmp adenc_aden_rt_Intrinsics_hostReadAllText__String_epilogue
adenc_aden_rt_Intrinsics_hostReadAllText__String_epilogue:
adenc_aden_rt_Intrinsics_hostReadAllText__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostReadAllText__String endp

adenc_aden_rt_Intrinsics_hostListChildren__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostListChildren
    jmp adenc_aden_rt_Intrinsics_hostListChildren__String_epilogue
adenc_aden_rt_Intrinsics_hostListChildren__String_epilogue:
adenc_aden_rt_Intrinsics_hostListChildren__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostListChildren__String endp

adenc_aden_rt_Intrinsics_hostCreateDirectory__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m64
    mov edx, trace_m64_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostCreateDirectory
    jmp adenc_aden_rt_Intrinsics_hostCreateDirectory__String_epilogue
adenc_aden_rt_Intrinsics_hostCreateDirectory__String_epilogue:
adenc_aden_rt_Intrinsics_hostCreateDirectory__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostCreateDirectory__String endp

adenc_aden_rt_Intrinsics_hostWriteAllText__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m66
    mov edx, trace_m66_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_hostWriteAllText
    jmp adenc_aden_rt_Intrinsics_hostWriteAllText__String_String_epilogue
adenc_aden_rt_Intrinsics_hostWriteAllText__String_String_epilogue:
adenc_aden_rt_Intrinsics_hostWriteAllText__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostWriteAllText__String_String endp

adenc_aden_rt_Intrinsics_hostCopyFile__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m68
    mov edx, trace_m68_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_hostCopyFile
    jmp adenc_aden_rt_Intrinsics_hostCopyFile__String_String_epilogue
adenc_aden_rt_Intrinsics_hostCopyFile__String_String_epilogue:
adenc_aden_rt_Intrinsics_hostCopyFile__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostCopyFile__String_String endp

adenc_aden_rt_Intrinsics_hostAllocBytes__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostAllocBytes
    jmp adenc_aden_rt_Intrinsics_hostAllocBytes__int_epilogue
adenc_aden_rt_Intrinsics_hostAllocBytes__int_epilogue:
adenc_aden_rt_Intrinsics_hostAllocBytes__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostAllocBytes__int endp

adenc_aden_rt_Intrinsics_hostFreeBytes__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m72
    mov edx, trace_m72_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostFreeBytes
    jmp adenc_aden_rt_Intrinsics_hostFreeBytes__long_epilogue
adenc_aden_rt_Intrinsics_hostFreeBytes__long_epilogue:
adenc_aden_rt_Intrinsics_hostFreeBytes__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostFreeBytes__long endp

adenc_aden_rt_Intrinsics_hostReadByte__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m74
    mov edx, trace_m74_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_hostReadByte
    jmp adenc_aden_rt_Intrinsics_hostReadByte__long_int_epilogue
adenc_aden_rt_Intrinsics_hostReadByte__long_int_epilogue:
adenc_aden_rt_Intrinsics_hostReadByte__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostReadByte__long_int endp

adenc_aden_rt_Intrinsics_hostWriteByte__long_int_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m76
    mov edx, trace_m76_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostWriteByte
    jmp adenc_aden_rt_Intrinsics_hostWriteByte__long_int_int_epilogue
adenc_aden_rt_Intrinsics_hostWriteByte__long_int_int_epilogue:
adenc_aden_rt_Intrinsics_hostWriteByte__long_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_hostWriteByte__long_int_int endp

adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m77
    mov edx, trace_m77_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostCopyBytes
    jmp adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue
adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue:
adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_hostCopyBytes__long_long_int endp

adenc_aden_rt_Intrinsics_hostReadLong__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m79
    mov edx, trace_m79_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_hostReadLong
    jmp adenc_aden_rt_Intrinsics_hostReadLong__long_int_epilogue
adenc_aden_rt_Intrinsics_hostReadLong__long_int_epilogue:
adenc_aden_rt_Intrinsics_hostReadLong__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostReadLong__long_int endp

adenc_aden_rt_Intrinsics_hostWriteLong__long_int_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m81
    mov edx, trace_m81_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostWriteLong
    jmp adenc_aden_rt_Intrinsics_hostWriteLong__long_int_long_epilogue
adenc_aden_rt_Intrinsics_hostWriteLong__long_int_long_epilogue:
adenc_aden_rt_Intrinsics_hostWriteLong__long_int_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_hostWriteLong__long_int_long endp

adenc_aden_rt_Intrinsics_hostStringUtf8Length__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m82
    mov edx, trace_m82_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostStringUtf8Length
    jmp adenc_aden_rt_Intrinsics_hostStringUtf8Length__String_epilogue
adenc_aden_rt_Intrinsics_hostStringUtf8Length__String_epilogue:
adenc_aden_rt_Intrinsics_hostStringUtf8Length__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostStringUtf8Length__String endp

adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m84
    mov edx, trace_m84_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostAllocUtf8Z
    jmp adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String_epilogue
adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String_epilogue:
adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostAllocUtf8Z__String endp

adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m86
    mov edx, trace_m86_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call adenc_rt_hostStringFromUtf8
    jmp adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue
adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue:
adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostStringFromUtf8__long_int endp

adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m88
    mov edx, trace_m88_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostStringFromUtf8Z
    jmp adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue
adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue:
adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostStringFromUtf8Z__long endp

adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m90
    mov edx, trace_m90_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostLoadDynamicLibrary
    jmp adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue
adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue:
adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostLoadDynamicLibrary__String endp

adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m92
    mov edx, trace_m92_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostLookupLoadedDynamicLibrary
    jmp adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue
adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue:
adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostLookupLoadedDynamicLibrary__String endp

adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary proc
    sub rsp, 184
    mov qword ptr [rsp+152], rcx
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    lea rcx, trace_m94
    mov edx, trace_m94_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+152]
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call adenc_rt_hostLookupSelfDynamicLibrary
    jmp adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue
adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue:
adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary_epilogue_post:
    mov qword ptr [rsp+104], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+104]
    add rsp, 184
    ret
adenc_aden_rt_Intrinsics_hostLookupSelfDynamicLibrary endp

adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m96
    mov edx, trace_m96_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostFreeDynamicLibrary
    jmp adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue
adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue:
adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostFreeDynamicLibrary__long endp

adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_hostResolveDynamicSymbol
    jmp adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue
adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue:
adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostResolveDynamicSymbol__long_String endp

adenc_aden_rt_Intrinsics_hostCallNative0__long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m100
    mov edx, trace_m100_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostCallNative0
    jmp adenc_aden_rt_Intrinsics_hostCallNative0__long_epilogue
adenc_aden_rt_Intrinsics_hostCallNative0__long_epilogue:
adenc_aden_rt_Intrinsics_hostCallNative0__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostCallNative0__long endp

adenc_aden_rt_Intrinsics_hostCallNative1__long_long proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m102
    mov edx, trace_m102_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_hostCallNative1
    jmp adenc_aden_rt_Intrinsics_hostCallNative1__long_long_epilogue
adenc_aden_rt_Intrinsics_hostCallNative1__long_long_epilogue:
adenc_aden_rt_Intrinsics_hostCallNative1__long_long_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostCallNative1__long_long endp

adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m104
    mov edx, trace_m104_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostCallNative2
    jmp adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long_epilogue
adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long_epilogue:
adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long_epilogue_post:
    mov qword ptr [rsp+128], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_hostCallNative2__long_long_long endp

adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m106
    mov edx, trace_m106_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostCallNative3
    jmp adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue
adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue:
adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long_epilogue_post:
    mov qword ptr [rsp+136], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
adenc_aden_rt_Intrinsics_hostCallNative3__long_long_long_long endp

adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m108
    mov edx, trace_m108_len
    call adenc_rt_tracePush
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
    call adenc_rt_hostCallNative4
    jmp adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue
adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue:
adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long_epilogue_post:
    mov qword ptr [rsp+144], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
adenc_aden_rt_Intrinsics_hostCallNative4__long_long_long_long_long endp

adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m110
    mov edx, trace_m110_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostRegisterNativeCallback0
    jmp adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue:
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback0__NativeCallback0 endp

adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m112
    mov edx, trace_m112_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostGetNativeCallbackAddress0
    jmp adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue:
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress0__int endp

adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m114
    mov edx, trace_m114_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostUnregisterNativeCallback0
    jmp adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue:
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback0__int endp

adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m116
    mov edx, trace_m116_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostRegisterNativeCallback1
    jmp adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue:
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback1__NativeCallback1 endp

adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m118
    mov edx, trace_m118_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostGetNativeCallbackAddress1
    jmp adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue:
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress1__int endp

adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m120
    mov edx, trace_m120_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostUnregisterNativeCallback1
    jmp adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue:
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback1__int endp

adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m122
    mov edx, trace_m122_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostRegisterNativeCallback2
    jmp adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue:
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback2__NativeCallback2 endp

adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m124
    mov edx, trace_m124_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostGetNativeCallbackAddress2
    jmp adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue:
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress2__int endp

adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m126
    mov edx, trace_m126_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostUnregisterNativeCallback2
    jmp adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue:
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback2__int endp

adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m128
    mov edx, trace_m128_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostRegisterNativeCallback3
    jmp adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue:
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback3__NativeCallback3 endp

adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m130
    mov edx, trace_m130_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostGetNativeCallbackAddress3
    jmp adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue:
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress3__int endp

adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m132
    mov edx, trace_m132_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostUnregisterNativeCallback3
    jmp adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue:
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback3__int endp

adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4 proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m134
    mov edx, trace_m134_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov rcx, qword ptr [rsp+64]
    call adenc_rt_hostRegisterNativeCallback4
    jmp adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue:
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRegisterNativeCallback4__NativeCallback4 endp

adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m136
    mov edx, trace_m136_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostGetNativeCallbackAddress4
    jmp adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue:
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostGetNativeCallbackAddress4__int endp

adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m138
    mov edx, trace_m138_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call adenc_rt_hostUnregisterNativeCallback4
    jmp adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue:
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostUnregisterNativeCallback4__int endp

adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m140
    mov edx, trace_m140_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov rcx, qword ptr [rsp+64]
    mov rdx, qword ptr [rsp+72]
    call adenc_rt_hostRunShellProcess
    jmp adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String_epilogue
adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String_epilogue:
adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_rt_Intrinsics_hostRunShellProcess__String_String endp

end
