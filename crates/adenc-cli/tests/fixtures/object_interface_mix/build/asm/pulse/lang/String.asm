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
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_panic:proc
extrn pulsec_pulse_lang_Object_toString:proc
extrn pulsec_pulse_lang_Throwable_toString:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_lang_CharSequence_charAt__int:proc
extrn pulsec_pulse_lang_CharSequence_length:proc
extrn pulsec_pulse_lang_Class_toString:proc
extrn pulsec_pulse_lang_Double_toString__double:proc
extrn pulsec_pulse_lang_Float_toString__float:proc
extrn pulsec_pulse_lang_Integer_toString:proc
extrn pulsec_pulse_lang_Long_toString__long:proc
extrn pulsec_pulse_lang_Object_toString:proc
extrn pulsec_pulse_lang_StringBuilder_charAt__int:proc
extrn pulsec_pulse_lang_StringBuilder_length:proc
extrn pulsec_pulse_lang_StringBuilder_toString:proc
extrn pulsec_pulse_lang_Throwable_toString:proc
extrn pulsec_pulse_lang_UInteger_toString__uint:proc
extrn pulsec_pulse_lang_ULong_toString__ulong:proc
extrn pulsec_rt_charToString:proc
extrn pulsec_rt_panic:proc
extrn pulsec_rt_stringCharAt:proc
extrn pulsec_rt_stringConcat:proc
extrn pulsec_rt_stringLength:proc
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
extrn pulsec_rt_arrayGetString:proc
extrn pulsec_rt_arrayLength:proc
extrn pulsec_rt_arrayNew:proc
extrn pulsec_rt_arraySetInt:proc
extrn pulsec_rt_arraySetString:proc
.data
written dq 0
pulsec_objc_pulse_lang_String dd 0
trace_m0 db "pulse.lang.String.length"
trace_m0_len equ 24
trace_m1 db "pulse.lang.String.isEmpty"
trace_m1_len equ 25
trace_m2 db "pulse.lang.String.concat"
trace_m2_len equ 24
trace_m3 db "pulse.lang.String.charAt"
trace_m3_len equ 24
trace_m4 db "pulse.lang.String.substring"
trace_m4_len equ 27
trace_m5 db "pulse.lang.String.substring"
trace_m5_len equ 27
trace_m6 db "pulse.lang.String.subSequence"
trace_m6_len equ 29
trace_m7 db "pulse.lang.String.equals"
trace_m7_len equ 24
trace_m8 db "pulse.lang.String.contentEquals"
trace_m8_len equ 31
trace_m9 db "pulse.lang.String.hashCode"
trace_m9_len equ 26
trace_m10 db "pulse.lang.String.compareTo"
trace_m10_len equ 27
trace_m11 db "pulse.lang.String.startsWith"
trace_m11_len equ 28
trace_m12 db "pulse.lang.String.startsWith"
trace_m12_len equ 28
trace_m13 db "pulse.lang.String.regionMatches"
trace_m13_len equ 31
trace_m14 db "pulse.lang.String.regionMatches"
trace_m14_len equ 31
trace_m15 db "pulse.lang.String.endsWith"
trace_m15_len equ 26
trace_m16 db "pulse.lang.String.contains"
trace_m16_len equ 26
trace_m17 db "pulse.lang.String.contains"
trace_m17_len equ 26
trace_m18 db "pulse.lang.String.contains"
trace_m18_len equ 26
trace_m19 db "pulse.lang.String.indexOf"
trace_m19_len equ 25
trace_m20 db "pulse.lang.String.indexOf"
trace_m20_len equ 25
trace_m21 db "pulse.lang.String.indexOf"
trace_m21_len equ 25
trace_m22 db "pulse.lang.String.indexOf"
trace_m22_len equ 25
trace_m23 db "pulse.lang.String.lastIndexOf"
trace_m23_len equ 29
trace_m24 db "pulse.lang.String.lastIndexOf"
trace_m24_len equ 29
trace_m25 db "pulse.lang.String.lastIndexOf"
trace_m25_len equ 29
trace_m26 db "pulse.lang.String.lastIndexOf"
trace_m26_len equ 29
trace_m27 db "pulse.lang.String.trim"
trace_m27_len equ 22
trace_m28 db "pulse.lang.String.isBlank"
trace_m28_len equ 25
trace_m29 db "pulse.lang.String.strip"
trace_m29_len equ 23
trace_m30 db "pulse.lang.String.stripLeading"
trace_m30_len equ 30
trace_m31 db "pulse.lang.String.stripTrailing"
trace_m31_len equ 31
trace_m32 db "pulse.lang.String.toLowerCase"
trace_m32_len equ 29
trace_m33 db "pulse.lang.String.toUpperCase"
trace_m33_len equ 29
trace_m34 db "pulse.lang.String.equalsIgnoreCase"
trace_m34_len equ 34
trace_m35 db "pulse.lang.String.replace"
trace_m35_len equ 25
trace_m36 db "pulse.lang.String.replace"
trace_m36_len equ 25
trace_m37 db "pulse.lang.String.repeat"
trace_m37_len equ 24
trace_m38 db "pulse.lang.String.removePrefix"
trace_m38_len equ 30
trace_m39 db "pulse.lang.String.removeSuffix"
trace_m39_len equ 30
trace_m40 db "pulse.lang.String.padLeft"
trace_m40_len equ 25
trace_m41 db "pulse.lang.String.padRight"
trace_m41_len equ 26
trace_m42 db "pulse.lang.String.split"
trace_m42_len equ 23
trace_m43 db "pulse.lang.String.split"
trace_m43_len equ 23
trace_m44 db "pulse.lang.String.join"
trace_m44_len equ 22
trace_m45 db "pulse.lang.String.toCharArray"
trace_m45_len equ 29
trace_m46 db "pulse.lang.String.getChars"
trace_m46_len equ 26
trace_m47 db "pulse.lang.String.valueOf"
trace_m47_len equ 25
trace_m48 db "pulse.lang.String.valueOf"
trace_m48_len equ 25
trace_m49 db "pulse.lang.String.valueOf"
trace_m49_len equ 25
trace_m50 db "pulse.lang.String.valueOf"
trace_m50_len equ 25
trace_m51 db "pulse.lang.String.valueOf"
trace_m51_len equ 25
trace_m52 db "pulse.lang.String.valueOf"
trace_m52_len equ 25
trace_m53 db "pulse.lang.String.valueOf"
trace_m53_len equ 25
trace_m54 db "pulse.lang.String.valueOf"
trace_m54_len equ 25
trace_m55 db "pulse.lang.String.valueOf"
trace_m55_len equ 25
trace_m56 db "pulse.lang.String.valueOf"
trace_m56_len equ 25
trace_m57 db "pulse.lang.String.valueOf"
trace_m57_len equ 25
trace_m58 db "pulse.lang.String.valueOf"
trace_m58_len equ 25
trace_m59 db "pulse.lang.String.valueOf"
trace_m59_len equ 25
trace_m60 db "pulse.lang.String.valueOf"
trace_m60_len equ 25
trace_m61 db "pulse.lang.String.valueOf"
trace_m61_len equ 25
trace_m62 db "pulse.lang.String.copyValueOf"
trace_m62_len equ 29
trace_m63 db "pulse.lang.String.copyValueOf"
trace_m63_len equ 29
trace_m64 db "pulse.lang.String.runtimeCharAt"
trace_m64_len equ 31
trace_m65 db "pulse.lang.String.runtimeLength"
trace_m65_len equ 31
trace_m66 db "pulse.lang.String.runtimeConcat"
trace_m66_len equ 31
trace_m67 db "pulse.lang.String.runtimeFromChar"
trace_m67_len equ 33
trace_m68 db "pulse.lang.String.digitText"
trace_m68_len equ 27
trace_m69 db "pulse.lang.String.toLowerAscii"
trace_m69_len equ 30
trace_m70 db "pulse.lang.String.toUpperAscii"
trace_m70_len equ 30
trace_m71 db "pulse.lang.String.isAsciiWhitespace"
trace_m71_len equ 35
cidset_1 dd 15
cidset_2 dd 1
    dd 4
    dd 6
    dd 7
    dd 8
    dd 9
    dd 10
    dd 11
    dd 12
    dd 13
    dd 14
    dd 15
    dd 16
    dd 17
    dd 18
    dd 19
    dd 20
msg0 db "String.substring range out of bounds"
msg0_len equ 36
msg1 db 0
msg1_len equ 0
msg2 db "Invalid cast"
msg2_len equ 12
msg3 db "String.compareTo requires String"
msg3_len equ 32
msg4 db "Invalid cast"
msg4_len equ 12
msg5 db 0
msg5_len equ 0
msg6 db "Invalid cast"
msg6_len equ 12
msg7 db 0
msg7_len equ 0
msg8 db 0
msg8_len equ 0
msg9 db "String.replace target must not be null"
msg9_len equ 38
msg10 db "String.replace replacement must not be null"
msg10_len equ 43
msg11 db 0
msg11_len equ 0
msg12 db 0
msg12_len equ 0
msg13 db 0
msg13_len equ 0
msg14 db 0
msg14_len equ 0
msg15 db "String.removePrefix prefix must not be null"
msg15_len equ 43
msg16 db "String.removeSuffix suffix must not be null"
msg16_len equ 43
msg17 db 0
msg17_len equ 0
msg18 db 0
msg18_len equ 0
msg19 db "String.split delimiter must not be null"
msg19_len equ 39
msg20 db "String.split delimiter must not be empty"
msg20_len equ 40
msg21 db "String.join delimiter must not be null"
msg21_len equ 38
msg22 db "String.join parts must not be null"
msg22_len equ 34
msg23 db 0
msg23_len equ 0
msg24 db "Invalid cast"
msg24_len equ 12
msg25 db "String.getChars destination must not be null"
msg25_len equ 44
msg26 db "String.getChars source range out of bounds"
msg26_len equ 42
msg27 db "String.getChars destination range out of bounds"
msg27_len equ 47
msg28 db "0"
msg28_len equ 1
msg29 db "-2147483648"
msg29_len equ 11
msg30 db 0
msg30_len equ 0
msg31 db "-"
msg31_len equ 1
msg32 db "true"
msg32_len equ 4
msg33 db "false"
msg33_len equ 5
msg34 db "null"
msg34_len equ 4
msg35 db "Invalid cast"
msg35_len equ 12
msg36 db "String.copyValueOf value must not be null"
msg36_len equ 41
msg37 db "String.copyValueOf value must not be null"
msg37_len equ 41
msg38 db "String.copyValueOf range out of bounds"
msg38_len equ 38
msg39 db 0
msg39_len equ 0
msg40 db "0"
msg40_len equ 1
msg41 db "1"
msg41_len equ 1
msg42 db "2"
msg42_len equ 1
msg43 db "3"
msg43_len equ 1
msg44 db "4"
msg44_len equ 1
msg45 db "5"
msg45_len equ 1
msg46 db "6"
msg46_len equ 1
msg47 db "7"
msg47_len equ 1
msg48 db "8"
msg48_len equ 1
msg49 db "9"
msg49_len equ 1

.code
pulsec_pulse_lang_String_length proc
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
pulsec_pulse_lang_String_length_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_stringLength
    movsxd rax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_String_length_epilogue
pulsec_pulse_lang_String_length_epilogue:
pulsec_pulse_lang_String_length_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_length endp

pulsec_pulse_lang_String_isEmpty proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_isEmpty_b0:
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_String_isEmpty_epilogue
pulsec_pulse_lang_String_isEmpty_epilogue:
pulsec_pulse_lang_String_isEmpty_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_isEmpty endp

pulsec_pulse_lang_String_concat__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_concat__String_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    call pulsec_rt_stringConcat
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_concat__String_epilogue
pulsec_pulse_lang_String_concat__String_epilogue:
pulsec_pulse_lang_String_concat__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_concat__String endp

pulsec_pulse_lang_String_charAt__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_String_charAt__int_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_stringCharAt
    movzx eax, ax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_charAt__int_epilogue
pulsec_pulse_lang_String_charAt__int_epilogue:
pulsec_pulse_lang_String_charAt__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_charAt__int endp

pulsec_pulse_lang_String_substring__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_String_substring__int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_substring__int_epilogue
pulsec_pulse_lang_String_substring__int_epilogue:
pulsec_pulse_lang_String_substring__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_String_substring__int endp

pulsec_pulse_lang_String_substring__int_int proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov qword ptr [rsp+88], rcx
    mov dword ptr [rsp+96], edx
    mov dword ptr [rsp+104], r8d
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_String_substring__int_int_b0:
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_substring_ternary_then_1_10
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    jmp String_substring_ternary_done_1_10
String_substring_ternary_then_1_10:
    mov eax, 1
String_substring_ternary_done_1_10:
    test rax, rax
    jne String_substring_ternary_then_1_14
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_substring_ternary_done_1_14
String_substring_ternary_then_1_14:
    mov eax, 1
String_substring_ternary_done_1_14:
    test eax, eax
    jne pulsec_pulse_lang_String_substring__int_int_b1
    jmp pulsec_pulse_lang_String_substring__int_int_b2
pulsec_pulse_lang_String_substring__int_int_b1:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    jmp pulsec_pulse_lang_String_substring__int_int_b3
pulsec_pulse_lang_String_substring__int_int_b2:
    jmp pulsec_pulse_lang_String_substring__int_int_b3
pulsec_pulse_lang_String_substring__int_int_b3:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+136], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_substring_ternary_then_3_26
    mov eax, 0
    jmp String_substring_ternary_done_3_26
String_substring_ternary_then_3_26:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    sete al
    movzx eax, al
String_substring_ternary_done_3_26:
    test eax, eax
    jne pulsec_pulse_lang_String_substring__int_int_b4
    jmp pulsec_pulse_lang_String_substring__int_int_b5
pulsec_pulse_lang_String_substring__int_int_b4:
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_substring__int_int_epilogue
pulsec_pulse_lang_String_substring__int_int_b5:
    jmp pulsec_pulse_lang_String_substring__int_int_b6
pulsec_pulse_lang_String_substring__int_int_b6:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_substring__int_int_b7
pulsec_pulse_lang_String_substring__int_int_b7:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_substring__int_int_b8
    jmp pulsec_pulse_lang_String_substring__int_int_b9
pulsec_pulse_lang_String_substring__int_int_b8:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+216], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+168]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+168]
    mov ecx, eax
    call pulsec_rt_charToString
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov rdx, rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_substring__int_int_b7
pulsec_pulse_lang_String_substring__int_int_b9:
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_lang_String_substring__int_int_epilogue
pulsec_pulse_lang_String_substring__int_int_epilogue:
pulsec_pulse_lang_String_substring__int_int_epilogue_post:
    mov qword ptr [rsp+208], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+208]
    add rsp, 408
    ret
pulsec_pulse_lang_String_substring__int_int endp

pulsec_pulse_lang_String_subSequence__int_int proc
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
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_String_subSequence__int_int_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_subSequence__int_int_epilogue
pulsec_pulse_lang_String_subSequence__int_int_epilogue:
pulsec_pulse_lang_String_subSequence__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_String_subSequence__int_int endp

pulsec_pulse_lang_String_equals__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_equals__Object_b0:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je String_equals_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_equals_instof_0_1_true
String_equals_instof_0_1_false:
    xor eax, eax
    jmp String_equals_instof_0_1_done
String_equals_instof_0_1_true:
    mov eax, 1
String_equals_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equals__Object_b1
    jmp pulsec_pulse_lang_String_equals__Object_b2
pulsec_pulse_lang_String_equals__Object_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equals__Object_epilogue
pulsec_pulse_lang_String_equals__Object_b2:
    jmp pulsec_pulse_lang_String_equals__Object_b3
pulsec_pulse_lang_String_equals__Object_b3:
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je String_equals_cast_2_5_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_equals_cast_2_5_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_equals_cast_2_5_ok
String_equals_cast_2_5_fail:
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_equals_cast_2_5_done
String_equals_cast_2_5_null:
    xor eax, eax
    jmp String_equals_cast_2_5_done
String_equals_cast_2_5_ok:
    mov rax, qword ptr [rsp+40]
String_equals_cast_2_5_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+96], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equals__Object_b4
    jmp pulsec_pulse_lang_String_equals__Object_b5
pulsec_pulse_lang_String_equals__Object_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equals__Object_epilogue
pulsec_pulse_lang_String_equals__Object_b5:
    jmp pulsec_pulse_lang_String_equals__Object_b6
pulsec_pulse_lang_String_equals__Object_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_equals__Object_b7
pulsec_pulse_lang_String_equals__Object_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equals__Object_b8
    jmp pulsec_pulse_lang_String_equals__Object_b9
pulsec_pulse_lang_String_equals__Object_b8:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equals__Object_b10
    jmp pulsec_pulse_lang_String_equals__Object_b11
pulsec_pulse_lang_String_equals__Object_b9:
    mov eax, 1
    jmp pulsec_pulse_lang_String_equals__Object_epilogue
pulsec_pulse_lang_String_equals__Object_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equals__Object_epilogue
pulsec_pulse_lang_String_equals__Object_b11:
    jmp pulsec_pulse_lang_String_equals__Object_b12
pulsec_pulse_lang_String_equals__Object_b12:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_equals__Object_b7
pulsec_pulse_lang_String_equals__Object_epilogue:
pulsec_pulse_lang_String_equals__Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_lang_String_equals__Object endp

pulsec_pulse_lang_String_contentEquals__CharSequence proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_pulse_lang_String_contentEquals__CharSequence_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_contentEquals__CharSequence_b1
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b2
pulsec_pulse_lang_String_contentEquals__CharSequence_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_String_contentEquals__CharSequence_b2:
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b3
pulsec_pulse_lang_String_contentEquals__CharSequence_b3:
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je String_contentEquals_vd3_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz String_contentEquals_vd3_10_type
    cmp eax, 15
    je String_contentEquals_vd3_10_assign_ok
    cmp eax, 16
    je String_contentEquals_vd3_10_assign_ok
    jmp String_contentEquals_vd3_10_type
String_contentEquals_vd3_10_assign_ok:
    cmp eax, 15
    je String_contentEquals_vd3_10_ovr0
    cmp eax, 16
    je String_contentEquals_vd3_10_ovr1
    jmp String_contentEquals_vd3_10_default
String_contentEquals_vd3_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_length
    jmp String_contentEquals_vd3_10_done
String_contentEquals_vd3_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_length
    jmp String_contentEquals_vd3_10_done
String_contentEquals_vd3_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_length
    jmp String_contentEquals_vd3_10_done
String_contentEquals_vd3_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp String_contentEquals_vd3_10_done
String_contentEquals_vd3_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
String_contentEquals_vd3_10_done:
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_contentEquals__CharSequence_b4
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b5
pulsec_pulse_lang_String_contentEquals__CharSequence_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_String_contentEquals__CharSequence_b5:
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b6
pulsec_pulse_lang_String_contentEquals__CharSequence_b6:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b7
pulsec_pulse_lang_String_contentEquals__CharSequence_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_contentEquals__CharSequence_b8
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b9
pulsec_pulse_lang_String_contentEquals__CharSequence_b8:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+184]
    test rcx, rcx
    je String_contentEquals_vd7_24_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz String_contentEquals_vd7_24_type
    cmp eax, 15
    je String_contentEquals_vd7_24_assign_ok
    cmp eax, 16
    je String_contentEquals_vd7_24_assign_ok
    jmp String_contentEquals_vd7_24_type
String_contentEquals_vd7_24_assign_ok:
    cmp eax, 15
    je String_contentEquals_vd7_24_ovr0
    cmp eax, 16
    je String_contentEquals_vd7_24_ovr1
    jmp String_contentEquals_vd7_24_default
String_contentEquals_vd7_24_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_String_charAt__int
    jmp String_contentEquals_vd7_24_done
String_contentEquals_vd7_24_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_charAt__int
    jmp String_contentEquals_vd7_24_done
String_contentEquals_vd7_24_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_CharSequence_charAt__int
    jmp String_contentEquals_vd7_24_done
String_contentEquals_vd7_24_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp String_contentEquals_vd7_24_done
String_contentEquals_vd7_24_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
String_contentEquals_vd7_24_done:
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_contentEquals__CharSequence_b10
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b11
pulsec_pulse_lang_String_contentEquals__CharSequence_b9:
    mov eax, 1
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_String_contentEquals__CharSequence_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue
pulsec_pulse_lang_String_contentEquals__CharSequence_b11:
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b12
pulsec_pulse_lang_String_contentEquals__CharSequence_b12:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_contentEquals__CharSequence_b7
pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue:
pulsec_pulse_lang_String_contentEquals__CharSequence_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_lang_String_contentEquals__CharSequence endp

pulsec_pulse_lang_String_hashCode proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+88], rcx
pulsec_pulse_lang_String_hashCode_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_hashCode_b1
pulsec_pulse_lang_String_hashCode_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_hashCode_b2
    jmp pulsec_pulse_lang_String_hashCode_b3
pulsec_pulse_lang_String_hashCode_b2:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 31
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    imul eax, edx
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+128]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_hashCode_b1
pulsec_pulse_lang_String_hashCode_b3:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_hashCode_epilogue
pulsec_pulse_lang_String_hashCode_epilogue:
pulsec_pulse_lang_String_hashCode_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_lang_String_hashCode endp

pulsec_pulse_lang_String_compareTo__Object proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+120], rcx
    mov qword ptr [rsp+128], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_compareTo__Object_b0:
    mov rax, qword ptr [rsp+128]
    test rax, rax
    je String_compareTo_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_compareTo_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_compareTo_instof_0_1_true
String_compareTo_instof_0_1_false:
    xor eax, eax
    jmp String_compareTo_instof_0_1_done
String_compareTo_instof_0_1_true:
    mov eax, 1
String_compareTo_instof_0_1_done:
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b1
    jmp pulsec_pulse_lang_String_compareTo__Object_b2
pulsec_pulse_lang_String_compareTo__Object_b1:
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    jmp pulsec_pulse_lang_String_compareTo__Object_b3
pulsec_pulse_lang_String_compareTo__Object_b2:
    jmp pulsec_pulse_lang_String_compareTo__Object_b3
pulsec_pulse_lang_String_compareTo__Object_b3:
    mov rax, qword ptr [rsp+128]
    test rax, rax
    je String_compareTo_cast_2_8_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_compareTo_cast_2_8_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_compareTo_cast_2_8_ok
String_compareTo_cast_2_8_fail:
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_compareTo_cast_2_8_done
String_compareTo_cast_2_8_null:
    xor eax, eax
    jmp String_compareTo_cast_2_8_done
String_compareTo_cast_2_8_ok:
    mov rax, qword ptr [rsp+40]
String_compareTo_cast_2_8_done:
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+224]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+240], rax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b4
    jmp pulsec_pulse_lang_String_compareTo__Object_b5
pulsec_pulse_lang_String_compareTo__Object_b4:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_String_compareTo__Object_b6
pulsec_pulse_lang_String_compareTo__Object_b5:
    jmp pulsec_pulse_lang_String_compareTo__Object_b6
pulsec_pulse_lang_String_compareTo__Object_b6:
    mov eax, 0
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_compareTo__Object_b7
pulsec_pulse_lang_String_compareTo__Object_b7:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b8
    jmp pulsec_pulse_lang_String_compareTo__Object_b9
pulsec_pulse_lang_String_compareTo__Object_b8:
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+120]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b10
    jmp pulsec_pulse_lang_String_compareTo__Object_b11
pulsec_pulse_lang_String_compareTo__Object_b9:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b16
    jmp pulsec_pulse_lang_String_compareTo__Object_b17
pulsec_pulse_lang_String_compareTo__Object_b10:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_compareTo__Object_epilogue
pulsec_pulse_lang_String_compareTo__Object_b11:
    jmp pulsec_pulse_lang_String_compareTo__Object_b12
pulsec_pulse_lang_String_compareTo__Object_b12:
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b13
    jmp pulsec_pulse_lang_String_compareTo__Object_b14
pulsec_pulse_lang_String_compareTo__Object_b13:
    mov eax, 1
    jmp pulsec_pulse_lang_String_compareTo__Object_epilogue
pulsec_pulse_lang_String_compareTo__Object_b14:
    jmp pulsec_pulse_lang_String_compareTo__Object_b15
pulsec_pulse_lang_String_compareTo__Object_b15:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+168], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_compareTo__Object_b7
pulsec_pulse_lang_String_compareTo__Object_b16:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_compareTo__Object_epilogue
pulsec_pulse_lang_String_compareTo__Object_b17:
    jmp pulsec_pulse_lang_String_compareTo__Object_b18
pulsec_pulse_lang_String_compareTo__Object_b18:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_compareTo__Object_b19
    jmp pulsec_pulse_lang_String_compareTo__Object_b20
pulsec_pulse_lang_String_compareTo__Object_b19:
    mov eax, 1
    jmp pulsec_pulse_lang_String_compareTo__Object_epilogue
pulsec_pulse_lang_String_compareTo__Object_b20:
    jmp pulsec_pulse_lang_String_compareTo__Object_b21
pulsec_pulse_lang_String_compareTo__Object_b21:
    mov eax, 0
    jmp pulsec_pulse_lang_String_compareTo__Object_epilogue
pulsec_pulse_lang_String_compareTo__Object_epilogue:
pulsec_pulse_lang_String_compareTo__Object_epilogue_post:
    mov qword ptr [rsp+232], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+232]
    add rsp, 360
    ret
pulsec_pulse_lang_String_compareTo__Object endp

pulsec_pulse_lang_String_startsWith__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_startsWith__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_String_startsWith__String_epilogue
pulsec_pulse_lang_String_startsWith__String_epilogue:
pulsec_pulse_lang_String_startsWith__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_String_startsWith__String endp

pulsec_pulse_lang_String_startsWith__String_int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_String_startsWith__String_int_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_lang_String_startsWith__String_int_epilogue
pulsec_pulse_lang_String_startsWith__String_int_epilogue:
pulsec_pulse_lang_String_startsWith__String_int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_lang_String_startsWith__String_int endp

pulsec_pulse_lang_String_regionMatches__int_String_int_int proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m13
    mov edx, trace_m13_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
    mov dword ptr [rsp+88], r9d
    mov eax, dword ptr [rsp+336]
    mov dword ptr [rsp+96], eax
pulsec_pulse_lang_String_regionMatches__int_String_int_int_b0:
    mov eax, 0
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+216], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+240]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rax, qword ptr [rsp+120]
    mov r9, rax
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+32], eax
    mov eax, dword ptr [rsp+136]
    mov dword ptr [rsp+40], eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    jmp pulsec_pulse_lang_String_regionMatches__int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__int_String_int_int_epilogue:
pulsec_pulse_lang_String_regionMatches__int_String_int_int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 296
    ret
pulsec_pulse_lang_String_regionMatches__int_String_int_int endp

pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int proc
    sub rsp, 424
    mov qword ptr [rsp+392], rcx
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+392]
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    mov qword ptr [rsp+104], rcx
    mov dword ptr [rsp+112], edx
    mov dword ptr [rsp+120], r8d
    mov qword ptr [rsp+128], r9
    mov eax, dword ptr [rsp+464]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+472]
    mov dword ptr [rsp+144], eax
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b0:
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+152], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+152]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b1
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b2
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b2:
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b3
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b3:
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+160], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_regionMatches_ternary_then_2_11
    mov eax, dword ptr [rsp+136]
    mov dword ptr [rsp+168], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    setl al
    movzx eax, al
    jmp String_regionMatches_ternary_done_2_11
String_regionMatches_ternary_then_2_11:
    mov eax, 1
String_regionMatches_ternary_done_2_11:
    test rax, rax
    jne String_regionMatches_ternary_then_2_15
    mov eax, dword ptr [rsp+144]
    mov dword ptr [rsp+176], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setl al
    movzx eax, al
    jmp String_regionMatches_ternary_done_2_15
String_regionMatches_ternary_then_2_15:
    mov eax, 1
String_regionMatches_ternary_done_2_15:
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b4
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b5
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b5:
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b6
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b6:
    mov rcx, qword ptr [rsp+104]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne String_regionMatches_ternary_then_6_34
    mov eax, dword ptr [rsp+136]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov dword ptr [rsp+208], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_regionMatches_ternary_done_6_34
String_regionMatches_ternary_then_6_34:
    mov eax, 1
String_regionMatches_ternary_done_6_34:
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b7
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b8
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b7:
    mov eax, 0
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b8:
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b9
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b9:
    mov eax, 0
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b10
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b10:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+216], eax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b11
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b12
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b11:
    mov eax, dword ptr [rsp+120]
    mov dword ptr [rsp+224], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+104]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+136]
    mov dword ptr [rsp+232], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    add eax, edx
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+112]
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b13
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b14
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b12:
    mov eax, 1
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b13:
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov ecx, eax
    call pulsec_pulse_lang_String_toLowerAscii__char
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+296], rax
    mov rax, qword ptr [rsp+296]
    mov eax, eax
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+256]
    mov ecx, eax
    call pulsec_pulse_lang_String_toLowerAscii__char
    movzx eax, ax
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b15
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b14:
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b15
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b15:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+240], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b16
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b17
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b16:
    mov eax, 0
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b17:
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b18
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b18:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+248], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_b10
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue:
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int_epilogue_post:
    mov qword ptr [rsp+296], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+296]
    add rsp, 424
    ret
pulsec_pulse_lang_String_regionMatches__boolean_int_String_int_int endp

pulsec_pulse_lang_String_endsWith__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m15
    mov edx, trace_m15_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_String_endsWith__String_b0:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_endsWith__String_b1
    jmp pulsec_pulse_lang_String_endsWith__String_b2
pulsec_pulse_lang_String_endsWith__String_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_endsWith__String_epilogue
pulsec_pulse_lang_String_endsWith__String_b2:
    jmp pulsec_pulse_lang_String_endsWith__String_b3
pulsec_pulse_lang_String_endsWith__String_b3:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov eax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    mov r8d, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_equals__Object
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    jmp pulsec_pulse_lang_String_endsWith__String_epilogue
pulsec_pulse_lang_String_endsWith__String_epilogue:
pulsec_pulse_lang_String_endsWith__String_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_lang_String_endsWith__String endp

pulsec_pulse_lang_String_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m16
    mov edx, trace_m16_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_contains__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_pulse_lang_String_contains__String_epilogue
pulsec_pulse_lang_String_contains__String_epilogue:
pulsec_pulse_lang_String_contains__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_String_contains__String endp

pulsec_pulse_lang_String_contains__CharSequence proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m17
    mov edx, trace_m17_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_contains__CharSequence_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_contains__CharSequence_b1
    jmp pulsec_pulse_lang_String_contains__CharSequence_b2
pulsec_pulse_lang_String_contains__CharSequence_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_contains__CharSequence_epilogue
pulsec_pulse_lang_String_contains__CharSequence_b2:
    jmp pulsec_pulse_lang_String_contains__CharSequence_b3
pulsec_pulse_lang_String_contains__CharSequence_b3:
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je String_contains_cast_2_9_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_contains_cast_2_9_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 17
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_contains_cast_2_9_ok
String_contains_cast_2_9_fail:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_contains_cast_2_9_done
String_contains_cast_2_9_null:
    xor eax, eax
    jmp String_contains_cast_2_9_done
String_contains_cast_2_9_ok:
    mov rax, qword ptr [rsp+40]
String_contains_cast_2_9_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_contains__String
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_String_contains__CharSequence_epilogue
pulsec_pulse_lang_String_contains__CharSequence_epilogue:
pulsec_pulse_lang_String_contains__CharSequence_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_String_contains__CharSequence endp

pulsec_pulse_lang_String_contains__char proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_String_contains__char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__char
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_pulse_lang_String_contains__char_epilogue
pulsec_pulse_lang_String_contains__char_epilogue:
pulsec_pulse_lang_String_contains__char_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_String_contains__char endp

pulsec_pulse_lang_String_indexOf__char proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_String_indexOf__char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov eax, 0
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__char_int
    movsxd rax, eax
    jmp pulsec_pulse_lang_String_indexOf__char_epilogue
pulsec_pulse_lang_String_indexOf__char_epilogue:
pulsec_pulse_lang_String_indexOf__char_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_indexOf__char endp

pulsec_pulse_lang_String_indexOf__char_int proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
pulsec_pulse_lang_String_indexOf__char_int_b0:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__char_int_b1
    jmp pulsec_pulse_lang_String_indexOf__char_int_b2
pulsec_pulse_lang_String_indexOf__char_int_b1:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_indexOf__char_int_b3
pulsec_pulse_lang_String_indexOf__char_int_b2:
    jmp pulsec_pulse_lang_String_indexOf__char_int_b3
pulsec_pulse_lang_String_indexOf__char_int_b3:
    jmp pulsec_pulse_lang_String_indexOf__char_int_b4
pulsec_pulse_lang_String_indexOf__char_int_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__char_int_b5
    jmp pulsec_pulse_lang_String_indexOf__char_int_b6
pulsec_pulse_lang_String_indexOf__char_int_b5:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__char_int_b7
    jmp pulsec_pulse_lang_String_indexOf__char_int_b8
pulsec_pulse_lang_String_indexOf__char_int_b6:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_indexOf__char_int_epilogue
pulsec_pulse_lang_String_indexOf__char_int_b7:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_indexOf__char_int_epilogue
pulsec_pulse_lang_String_indexOf__char_int_b8:
    jmp pulsec_pulse_lang_String_indexOf__char_int_b9
pulsec_pulse_lang_String_indexOf__char_int_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_indexOf__char_int_b4
pulsec_pulse_lang_String_indexOf__char_int_epilogue:
pulsec_pulse_lang_String_indexOf__char_int_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 296
    ret
pulsec_pulse_lang_String_indexOf__char_int endp

pulsec_pulse_lang_String_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m21
    mov edx, trace_m21_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_indexOf__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov eax, 0
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_indexOf__String_epilogue
pulsec_pulse_lang_String_indexOf__String_epilogue:
pulsec_pulse_lang_String_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_indexOf__String endp

pulsec_pulse_lang_String_indexOf__String_int proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m22
    mov edx, trace_m22_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
    mov dword ptr [rsp+128], r8d
pulsec_pulse_lang_String_indexOf__String_int_b0:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+288], rax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b1
    jmp pulsec_pulse_lang_String_indexOf__String_int_b2
pulsec_pulse_lang_String_indexOf__String_int_b1:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b4
    jmp pulsec_pulse_lang_String_indexOf__String_int_b5
pulsec_pulse_lang_String_indexOf__String_int_b2:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b3
pulsec_pulse_lang_String_indexOf__String_int_b3:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b10
    jmp pulsec_pulse_lang_String_indexOf__String_int_b11
pulsec_pulse_lang_String_indexOf__String_int_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b5:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b6
pulsec_pulse_lang_String_indexOf__String_int_b6:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b7
    jmp pulsec_pulse_lang_String_indexOf__String_int_b8
pulsec_pulse_lang_String_indexOf__String_int_b7:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b8:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b9
pulsec_pulse_lang_String_indexOf__String_int_b9:
    mov eax, dword ptr [rsp+80]
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b10:
    mov eax, 0
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_b12
pulsec_pulse_lang_String_indexOf__String_int_b11:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b12
pulsec_pulse_lang_String_indexOf__String_int_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b13
    jmp pulsec_pulse_lang_String_indexOf__String_int_b14
pulsec_pulse_lang_String_indexOf__String_int_b13:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b14:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b15
pulsec_pulse_lang_String_indexOf__String_int_b15:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    sub eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b16
    jmp pulsec_pulse_lang_String_indexOf__String_int_b17
pulsec_pulse_lang_String_indexOf__String_int_b16:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b17:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b18
pulsec_pulse_lang_String_indexOf__String_int_b18:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b19
pulsec_pulse_lang_String_indexOf__String_int_b19:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b20
    jmp pulsec_pulse_lang_String_indexOf__String_int_b21
pulsec_pulse_lang_String_indexOf__String_int_b20:
    mov eax, 0
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov dword ptr [rsp+104], eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_b22
pulsec_pulse_lang_String_indexOf__String_int_b21:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b22:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b23
    jmp pulsec_pulse_lang_String_indexOf__String_int_b24
pulsec_pulse_lang_String_indexOf__String_int_b23:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+208], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    add eax, edx
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+240]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+216], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+280], rax
    mov rax, qword ptr [rsp+280]
    mov eax, eax
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+240]
    mov edx, eax
    mov rcx, qword ptr [rsp+288]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b25
    jmp pulsec_pulse_lang_String_indexOf__String_int_b26
pulsec_pulse_lang_String_indexOf__String_int_b24:
    mov eax, dword ptr [rsp+104]
    test eax, eax
    jne pulsec_pulse_lang_String_indexOf__String_int_b28
    jmp pulsec_pulse_lang_String_indexOf__String_int_b29
pulsec_pulse_lang_String_indexOf__String_int_b25:
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_b27
pulsec_pulse_lang_String_indexOf__String_int_b26:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    add eax, edx
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_b27
pulsec_pulse_lang_String_indexOf__String_int_b27:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b22
pulsec_pulse_lang_String_indexOf__String_int_b28:
    mov eax, dword ptr [rsp+80]
    jmp pulsec_pulse_lang_String_indexOf__String_int_epilogue
pulsec_pulse_lang_String_indexOf__String_int_b29:
    jmp pulsec_pulse_lang_String_indexOf__String_int_b30
pulsec_pulse_lang_String_indexOf__String_int_b30:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+232], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_indexOf__String_int_b19
pulsec_pulse_lang_String_indexOf__String_int_epilogue:
pulsec_pulse_lang_String_indexOf__String_int_epilogue_post:
    mov qword ptr [rsp+280], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+280]
    add rsp, 408
    ret
pulsec_pulse_lang_String_indexOf__String_int endp

pulsec_pulse_lang_String_lastIndexOf__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_lastIndexOf__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_lastIndexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_lastIndexOf__String_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_epilogue:
pulsec_pulse_lang_String_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_lang_String_lastIndexOf__String endp

pulsec_pulse_lang_String_lastIndexOf__char proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_lang_String_lastIndexOf__char_b0:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    sub eax, edx
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_lastIndexOf__char_int
    movsxd rax, eax
    jmp pulsec_pulse_lang_String_lastIndexOf__char_epilogue
pulsec_pulse_lang_String_lastIndexOf__char_epilogue:
pulsec_pulse_lang_String_lastIndexOf__char_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_String_lastIndexOf__char endp

pulsec_pulse_lang_String_lastIndexOf__char_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m25
    mov edx, trace_m25_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
pulsec_pulse_lang_String_lastIndexOf__char_int_b0:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__char_int_b1
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b2
pulsec_pulse_lang_String_lastIndexOf__char_int_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b3
pulsec_pulse_lang_String_lastIndexOf__char_int_b2:
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b3
pulsec_pulse_lang_String_lastIndexOf__char_int_b3:
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b4
pulsec_pulse_lang_String_lastIndexOf__char_int_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__char_int_b5
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b6
pulsec_pulse_lang_String_lastIndexOf__char_int_b5:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__char_int_b7
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b8
pulsec_pulse_lang_String_lastIndexOf__char_int_b6:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__char_int_b7:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__char_int_b8:
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b9
pulsec_pulse_lang_String_lastIndexOf__char_int_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__char_int_b4
pulsec_pulse_lang_String_lastIndexOf__char_int_epilogue:
pulsec_pulse_lang_String_lastIndexOf__char_int_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 312
    ret
pulsec_pulse_lang_String_lastIndexOf__char_int endp

pulsec_pulse_lang_String_lastIndexOf__String_int proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m26
    mov edx, trace_m26_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
    mov dword ptr [rsp+128], r8d
pulsec_pulse_lang_String_lastIndexOf__String_int_b0:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+280], rax
    mov rcx, qword ptr [rsp+280]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b1
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b2
pulsec_pulse_lang_String_lastIndexOf__String_int_b1:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b4
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b5
pulsec_pulse_lang_String_lastIndexOf__String_int_b2:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b3
pulsec_pulse_lang_String_lastIndexOf__String_int_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b10
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b11
pulsec_pulse_lang_String_lastIndexOf__String_int_b4:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b5:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b6
pulsec_pulse_lang_String_lastIndexOf__String_int_b6:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b7
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b8
pulsec_pulse_lang_String_lastIndexOf__String_int_b7:
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b8:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b9
pulsec_pulse_lang_String_lastIndexOf__String_int_b9:
    mov eax, dword ptr [rsp+128]
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b10:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b11:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b12
pulsec_pulse_lang_String_lastIndexOf__String_int_b12:
    mov eax, dword ptr [rsp+128]
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    sub eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+176], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b13
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b14
pulsec_pulse_lang_String_lastIndexOf__String_int_b13:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b15
pulsec_pulse_lang_String_lastIndexOf__String_int_b14:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b15
pulsec_pulse_lang_String_lastIndexOf__String_int_b15:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b16
pulsec_pulse_lang_String_lastIndexOf__String_int_b16:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b17
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b18
pulsec_pulse_lang_String_lastIndexOf__String_int_b17:
    mov eax, 0
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov dword ptr [rsp+104], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b19
pulsec_pulse_lang_String_lastIndexOf__String_int_b18:
    mov eax, 1
    neg eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b19:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b20
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b21
pulsec_pulse_lang_String_lastIndexOf__String_int_b20:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+272]
    mov eax, eax
    mov qword ptr [rsp+232], rax
    mov eax, dword ptr [rsp+232]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+208], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+280], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+272], rax
    mov rax, qword ptr [rsp+272]
    mov eax, eax
    mov qword ptr [rsp+232], rax
    mov eax, dword ptr [rsp+232]
    mov edx, eax
    mov rcx, qword ptr [rsp+280]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b22
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b23
pulsec_pulse_lang_String_lastIndexOf__String_int_b21:
    mov eax, dword ptr [rsp+104]
    test eax, eax
    jne pulsec_pulse_lang_String_lastIndexOf__String_int_b25
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b26
pulsec_pulse_lang_String_lastIndexOf__String_int_b22:
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b24
pulsec_pulse_lang_String_lastIndexOf__String_int_b23:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+216], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    add eax, edx
    mov dword ptr [rsp+96], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b24
pulsec_pulse_lang_String_lastIndexOf__String_int_b24:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b19
pulsec_pulse_lang_String_lastIndexOf__String_int_b25:
    mov eax, dword ptr [rsp+80]
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue
pulsec_pulse_lang_String_lastIndexOf__String_int_b26:
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b27
pulsec_pulse_lang_String_lastIndexOf__String_int_b27:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+224], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    sub eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_lastIndexOf__String_int_b16
pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue:
pulsec_pulse_lang_String_lastIndexOf__String_int_epilogue_post:
    mov qword ptr [rsp+272], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+272]
    add rsp, 392
    ret
pulsec_pulse_lang_String_lastIndexOf__String_int endp

pulsec_pulse_lang_String_trim proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m27
    mov edx, trace_m27_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+88], rcx
pulsec_pulse_lang_String_trim_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_trim_b1
pulsec_pulse_lang_String_trim_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_trim_b2
    jmp pulsec_pulse_lang_String_trim_b3
pulsec_pulse_lang_String_trim_b2:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+104], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_trim_ternary_then_4_18
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+112], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_18
String_trim_ternary_then_4_18:
    mov eax, 1
String_trim_ternary_done_4_18:
    test rax, rax
    jne String_trim_ternary_then_4_22
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+120], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_22
String_trim_ternary_then_4_22:
    mov eax, 1
String_trim_ternary_done_4_22:
    test rax, rax
    jne String_trim_ternary_then_4_26
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+128], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_4_26
String_trim_ternary_then_4_26:
    mov eax, 1
String_trim_ternary_done_4_26:
    test eax, eax
    jne pulsec_pulse_lang_String_trim_b4
    jmp pulsec_pulse_lang_String_trim_b5
pulsec_pulse_lang_String_trim_b3:
    jmp pulsec_pulse_lang_String_trim_b7
pulsec_pulse_lang_String_trim_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_trim_b6
pulsec_pulse_lang_String_trim_b5:
    jmp pulsec_pulse_lang_String_trim_b3
pulsec_pulse_lang_String_trim_b6:
    jmp pulsec_pulse_lang_String_trim_b1
pulsec_pulse_lang_String_trim_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+144], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_trim_b8
    jmp pulsec_pulse_lang_String_trim_b9
pulsec_pulse_lang_String_trim_b8:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    sub eax, edx
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+80], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_trim_ternary_then_9_47
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_47
String_trim_ternary_then_9_47:
    mov eax, 1
String_trim_ternary_done_9_47:
    test rax, rax
    jne String_trim_ternary_then_9_51
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+176], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_51
String_trim_ternary_then_9_51:
    mov eax, 1
String_trim_ternary_done_9_51:
    test rax, rax
    jne String_trim_ternary_then_9_55
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_trim_ternary_done_9_55
String_trim_ternary_then_9_55:
    mov eax, 1
String_trim_ternary_done_9_55:
    test eax, eax
    jne pulsec_pulse_lang_String_trim_b10
    jmp pulsec_pulse_lang_String_trim_b11
pulsec_pulse_lang_String_trim_b9:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+296], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    mov r8d, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_trim_epilogue
pulsec_pulse_lang_String_trim_b10:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+192], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_trim_b12
pulsec_pulse_lang_String_trim_b11:
    jmp pulsec_pulse_lang_String_trim_b9
pulsec_pulse_lang_String_trim_b12:
    jmp pulsec_pulse_lang_String_trim_b7
pulsec_pulse_lang_String_trim_epilogue:
pulsec_pulse_lang_String_trim_epilogue_post:
    mov qword ptr [rsp+240], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+240]
    add rsp, 360
    ret
pulsec_pulse_lang_String_trim endp

pulsec_pulse_lang_String_isBlank proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m28
    mov edx, trace_m28_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
pulsec_pulse_lang_String_isBlank_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_isBlank_b1
pulsec_pulse_lang_String_isBlank_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_isBlank_b2
    jmp pulsec_pulse_lang_String_isBlank_b3
pulsec_pulse_lang_String_isBlank_b2:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_String_isAsciiWhitespace__char
    mov eax, eax
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_isBlank_b4
    jmp pulsec_pulse_lang_String_isBlank_b5
pulsec_pulse_lang_String_isBlank_b3:
    mov eax, 1
    jmp pulsec_pulse_lang_String_isBlank_epilogue
pulsec_pulse_lang_String_isBlank_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_isBlank_epilogue
pulsec_pulse_lang_String_isBlank_b5:
    jmp pulsec_pulse_lang_String_isBlank_b6
pulsec_pulse_lang_String_isBlank_b6:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_isBlank_b1
pulsec_pulse_lang_String_isBlank_epilogue:
pulsec_pulse_lang_String_isBlank_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_lang_String_isBlank endp

pulsec_pulse_lang_String_strip proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m29
    mov edx, trace_m29_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_strip_b0:
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_trim
    jmp pulsec_pulse_lang_String_strip_epilogue
pulsec_pulse_lang_String_strip_epilogue:
pulsec_pulse_lang_String_strip_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_strip endp

pulsec_pulse_lang_String_stripLeading proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m30
    mov edx, trace_m30_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
pulsec_pulse_lang_String_stripLeading_b0:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_stripLeading_b1
pulsec_pulse_lang_String_stripLeading_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_stripLeading_ternary_then_2_15
    mov eax, 0
    jmp String_stripLeading_ternary_done_2_15
String_stripLeading_ternary_then_2_15:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_String_isAsciiWhitespace__char
    mov eax, eax
String_stripLeading_ternary_done_2_15:
    test eax, eax
    jne pulsec_pulse_lang_String_stripLeading_b2
    jmp pulsec_pulse_lang_String_stripLeading_b3
pulsec_pulse_lang_String_stripLeading_b2:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_stripLeading_b1
pulsec_pulse_lang_String_stripLeading_b3:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_stripLeading_epilogue
pulsec_pulse_lang_String_stripLeading_epilogue:
pulsec_pulse_lang_String_stripLeading_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_lang_String_stripLeading endp

pulsec_pulse_lang_String_stripTrailing proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m31
    mov edx, trace_m31_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+72], rcx
pulsec_pulse_lang_String_stripTrailing_b0:
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_stripTrailing_b1
pulsec_pulse_lang_String_stripTrailing_b1:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setg al
    movzx eax, al
    test rax, rax
    jne String_stripTrailing_ternary_then_1_16
    mov eax, 0
    jmp String_stripTrailing_ternary_done_1_16
String_stripTrailing_ternary_then_1_16:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov ecx, eax
    call pulsec_pulse_lang_String_isAsciiWhitespace__char
    mov eax, eax
String_stripTrailing_ternary_done_1_16:
    test eax, eax
    jne pulsec_pulse_lang_String_stripTrailing_b2
    jmp pulsec_pulse_lang_String_stripTrailing_b3
pulsec_pulse_lang_String_stripTrailing_b2:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_stripTrailing_b1
pulsec_pulse_lang_String_stripTrailing_b3:
    mov eax, 0
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov r8d, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_stripTrailing_epilogue
pulsec_pulse_lang_String_stripTrailing_epilogue:
pulsec_pulse_lang_String_stripTrailing_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 312
    ret
pulsec_pulse_lang_String_stripTrailing endp

pulsec_pulse_lang_String_toLowerCase proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m32
    mov edx, trace_m32_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_toLowerCase_b0:
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_toLowerCase_b1
pulsec_pulse_lang_String_toLowerCase_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerCase_b2
    jmp pulsec_pulse_lang_String_toLowerCase_b3
pulsec_pulse_lang_String_toLowerCase_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_toLowerAscii__char
    movzx eax, ax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_toLowerCase_b1
pulsec_pulse_lang_String_toLowerCase_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_toLowerCase_epilogue
pulsec_pulse_lang_String_toLowerCase_epilogue:
pulsec_pulse_lang_String_toLowerCase_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 392
    ret
pulsec_pulse_lang_String_toLowerCase endp

pulsec_pulse_lang_String_toUpperCase proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m33
    mov edx, trace_m33_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_toUpperCase_b0:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_toUpperCase_b1
pulsec_pulse_lang_String_toUpperCase_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperCase_b2
    jmp pulsec_pulse_lang_String_toUpperCase_b3
pulsec_pulse_lang_String_toUpperCase_b2:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_toUpperAscii__char
    movzx eax, ax
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_toUpperCase_b1
pulsec_pulse_lang_String_toUpperCase_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_toUpperCase_epilogue
pulsec_pulse_lang_String_toUpperCase_epilogue:
pulsec_pulse_lang_String_toUpperCase_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 392
    ret
pulsec_pulse_lang_String_toUpperCase endp

pulsec_pulse_lang_String_equalsIgnoreCase__String proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
pulsec_pulse_lang_String_equalsIgnoreCase__String_b0:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equalsIgnoreCase__String_b1
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b2
pulsec_pulse_lang_String_equalsIgnoreCase__String_b1:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue
pulsec_pulse_lang_String_equalsIgnoreCase__String_b2:
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b3
pulsec_pulse_lang_String_equalsIgnoreCase__String_b3:
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equalsIgnoreCase__String_b4
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b5
pulsec_pulse_lang_String_equalsIgnoreCase__String_b4:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue
pulsec_pulse_lang_String_equalsIgnoreCase__String_b5:
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b6
pulsec_pulse_lang_String_equalsIgnoreCase__String_b6:
    mov eax, 0
    mov dword ptr [rsp+64], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b7
pulsec_pulse_lang_String_equalsIgnoreCase__String_b7:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equalsIgnoreCase__String_b8
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b9
pulsec_pulse_lang_String_equalsIgnoreCase__String_b8:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_pulse_lang_String_toLowerAscii__char
    movzx eax, ax
    mov dword ptr [rsp+120], eax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+224], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov edx, eax
    mov rcx, qword ptr [rsp+224]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_pulse_lang_String_toLowerAscii__char
    movzx eax, ax
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_equalsIgnoreCase__String_b10
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b11
pulsec_pulse_lang_String_equalsIgnoreCase__String_b9:
    mov eax, 1
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue
pulsec_pulse_lang_String_equalsIgnoreCase__String_b10:
    mov eax, 0
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue
pulsec_pulse_lang_String_equalsIgnoreCase__String_b11:
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b12
pulsec_pulse_lang_String_equalsIgnoreCase__String_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_equalsIgnoreCase__String_b7
pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue:
pulsec_pulse_lang_String_equalsIgnoreCase__String_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_lang_String_equalsIgnoreCase__String endp

pulsec_pulse_lang_String_replace__String_String proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m35
    mov edx, trace_m35_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+112], r8
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_String_replace__String_String_b0:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__String_String_b1
    jmp pulsec_pulse_lang_String_replace__String_String_b2
pulsec_pulse_lang_String_replace__String_String_b1:
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    jmp pulsec_pulse_lang_String_replace__String_String_b3
pulsec_pulse_lang_String_replace__String_String_b2:
    jmp pulsec_pulse_lang_String_replace__String_String_b3
pulsec_pulse_lang_String_replace__String_String_b3:
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+128], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__String_String_b4
    jmp pulsec_pulse_lang_String_replace__String_String_b5
pulsec_pulse_lang_String_replace__String_String_b4:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    jmp pulsec_pulse_lang_String_replace__String_String_b6
pulsec_pulse_lang_String_replace__String_String_b5:
    jmp pulsec_pulse_lang_String_replace__String_String_b6
pulsec_pulse_lang_String_replace__String_String_b6:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_isEmpty
    mov eax, eax
    test eax, eax
    jne pulsec_pulse_lang_String_replace__String_String_b7
    jmp pulsec_pulse_lang_String_replace__String_String_b8
pulsec_pulse_lang_String_replace__String_String_b7:
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_replace__String_String_epilogue
pulsec_pulse_lang_String_replace__String_String_b8:
    jmp pulsec_pulse_lang_String_replace__String_String_b9
pulsec_pulse_lang_String_replace__String_String_b9:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_indexOf__String
    movsxd rax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__String_String_b10
    jmp pulsec_pulse_lang_String_replace__String_String_b11
pulsec_pulse_lang_String_replace__String_String_b10:
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_replace__String_String_epilogue
pulsec_pulse_lang_String_replace__String_String_b11:
    jmp pulsec_pulse_lang_String_replace__String_String_b12
pulsec_pulse_lang_String_replace__String_String_b12:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, 0
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_String_replace__String_String_b13
pulsec_pulse_lang_String_replace__String_String_b13:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__String_String_b14
    jmp pulsec_pulse_lang_String_replace__String_String_b15
pulsec_pulse_lang_String_replace__String_String_b14:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+296], rax
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+200]
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    mov r8d, eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_substring__int_int
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+256], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+200]
    mov eax, eax
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov eax, dword ptr [rsp+168]
    mov r8d, eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_replace__String_String_b13
pulsec_pulse_lang_String_replace__String_String_b15:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov eax, eax
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_substring__int
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_lang_String_replace__String_String_epilogue
pulsec_pulse_lang_String_replace__String_String_epilogue:
pulsec_pulse_lang_String_replace__String_String_epilogue_post:
    mov qword ptr [rsp+200], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 360
    ret
pulsec_pulse_lang_String_replace__String_String endp

pulsec_pulse_lang_String_replace__char_char proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m36
    mov edx, trace_m36_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+96], rcx
    mov dword ptr [rsp+104], edx
    mov dword ptr [rsp+112], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_replace__char_char_b0:
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_replace__char_char_b1
pulsec_pulse_lang_String_replace__char_char_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__char_char_b2
    jmp pulsec_pulse_lang_String_replace__char_char_b3
pulsec_pulse_lang_String_replace__char_char_b2:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov edx, eax
    mov rcx, qword ptr [rsp+96]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_replace__char_char_b4
    jmp pulsec_pulse_lang_String_replace__char_char_b5
pulsec_pulse_lang_String_replace__char_char_b3:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_replace__char_char_epilogue
pulsec_pulse_lang_String_replace__char_char_b4:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+112]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_lang_String_replace__char_char_b6
pulsec_pulse_lang_String_replace__char_char_b5:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov eax, eax
    mov qword ptr [rsp+144], rax
    mov eax, dword ptr [rsp+144]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rdx, rax
    mov rcx, qword ptr [rsp+192]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_lang_String_replace__char_char_b6
pulsec_pulse_lang_String_replace__char_char_b6:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_replace__char_char_b1
pulsec_pulse_lang_String_replace__char_char_epilogue:
pulsec_pulse_lang_String_replace__char_char_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 344
    ret
pulsec_pulse_lang_String_replace__char_char endp

pulsec_pulse_lang_String_repeat__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m37
    mov edx, trace_m37_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_repeat__int_b0:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_repeat__int_b1
    jmp pulsec_pulse_lang_String_repeat__int_b2
pulsec_pulse_lang_String_repeat__int_b1:
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_repeat__int_epilogue
pulsec_pulse_lang_String_repeat__int_b2:
    jmp pulsec_pulse_lang_String_repeat__int_b3
pulsec_pulse_lang_String_repeat__int_b3:
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_repeat__int_b4
pulsec_pulse_lang_String_repeat__int_b4:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_repeat__int_b5
    jmp pulsec_pulse_lang_String_repeat__int_b6
pulsec_pulse_lang_String_repeat__int_b5:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_repeat__int_b4
pulsec_pulse_lang_String_repeat__int_b6:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_repeat__int_epilogue
pulsec_pulse_lang_String_repeat__int_epilogue:
pulsec_pulse_lang_String_repeat__int_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_lang_String_repeat__int endp

pulsec_pulse_lang_String_removePrefix__String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m38
    mov edx, trace_m38_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_removePrefix__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_removePrefix__String_b1
    jmp pulsec_pulse_lang_String_removePrefix__String_b2
pulsec_pulse_lang_String_removePrefix__String_b1:
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_String_removePrefix__String_b3
pulsec_pulse_lang_String_removePrefix__String_b2:
    jmp pulsec_pulse_lang_String_removePrefix__String_b3
pulsec_pulse_lang_String_removePrefix__String_b3:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_startsWith__String
    mov eax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_removePrefix__String_b4
    jmp pulsec_pulse_lang_String_removePrefix__String_b5
pulsec_pulse_lang_String_removePrefix__String_b4:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_removePrefix__String_epilogue
pulsec_pulse_lang_String_removePrefix__String_b5:
    jmp pulsec_pulse_lang_String_removePrefix__String_b6
pulsec_pulse_lang_String_removePrefix__String_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_substring__int
    jmp pulsec_pulse_lang_String_removePrefix__String_epilogue
pulsec_pulse_lang_String_removePrefix__String_epilogue:
pulsec_pulse_lang_String_removePrefix__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_lang_String_removePrefix__String endp

pulsec_pulse_lang_String_removeSuffix__String proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m39
    mov edx, trace_m39_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_lang_String_removeSuffix__String_b0:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+80], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_removeSuffix__String_b1
    jmp pulsec_pulse_lang_String_removeSuffix__String_b2
pulsec_pulse_lang_String_removeSuffix__String_b1:
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    jmp pulsec_pulse_lang_String_removeSuffix__String_b3
pulsec_pulse_lang_String_removeSuffix__String_b2:
    jmp pulsec_pulse_lang_String_removeSuffix__String_b3
pulsec_pulse_lang_String_removeSuffix__String_b3:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_endsWith__String
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_removeSuffix__String_b4
    jmp pulsec_pulse_lang_String_removeSuffix__String_b5
pulsec_pulse_lang_String_removeSuffix__String_b4:
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_removeSuffix__String_epilogue
pulsec_pulse_lang_String_removeSuffix__String_b5:
    jmp pulsec_pulse_lang_String_removeSuffix__String_b6
pulsec_pulse_lang_String_removeSuffix__String_b6:
    mov eax, 0
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+88], eax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    sub eax, edx
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_lang_String_removeSuffix__String_epilogue
pulsec_pulse_lang_String_removeSuffix__String_epilogue:
pulsec_pulse_lang_String_removeSuffix__String_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_lang_String_removeSuffix__String endp

pulsec_pulse_lang_String_padLeft__int_char proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m40
    mov edx, trace_m40_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_String_padLeft__int_char_b0:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+104], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_padLeft__int_char_b1
    jmp pulsec_pulse_lang_String_padLeft__int_char_b2
pulsec_pulse_lang_String_padLeft__int_char_b1:
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_padLeft__int_char_epilogue
pulsec_pulse_lang_String_padLeft__int_char_b2:
    jmp pulsec_pulse_lang_String_padLeft__int_char_b3
pulsec_pulse_lang_String_padLeft__int_char_b3:
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_String_padLeft__int_char_b4
pulsec_pulse_lang_String_padLeft__int_char_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_padLeft__int_char_b5
    jmp pulsec_pulse_lang_String_padLeft__int_char_b6
pulsec_pulse_lang_String_padLeft__int_char_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_padLeft__int_char_b4
pulsec_pulse_lang_String_padLeft__int_char_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_lang_String_padLeft__int_char_epilogue
pulsec_pulse_lang_String_padLeft__int_char_epilogue:
pulsec_pulse_lang_String_padLeft__int_char_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_lang_String_padLeft__int_char endp

pulsec_pulse_lang_String_padRight__int_char proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m41
    mov edx, trace_m41_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_String_padRight__int_char_b0:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+104], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setle al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_padRight__int_char_b1
    jmp pulsec_pulse_lang_String_padRight__int_char_b2
pulsec_pulse_lang_String_padRight__int_char_b1:
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_padRight__int_char_epilogue
pulsec_pulse_lang_String_padRight__int_char_b2:
    jmp pulsec_pulse_lang_String_padRight__int_char_b3
pulsec_pulse_lang_String_padRight__int_char_b3:
    lea rcx, msg18
    mov edx, msg18_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    jmp pulsec_pulse_lang_String_padRight__int_char_b4
pulsec_pulse_lang_String_padRight__int_char_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_padRight__int_char_b5
    jmp pulsec_pulse_lang_String_padRight__int_char_b6
pulsec_pulse_lang_String_padRight__int_char_b5:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov eax, eax
    mov qword ptr [rsp+136], rax
    mov eax, dword ptr [rsp+136]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_padRight__int_char_b4
pulsec_pulse_lang_String_padRight__int_char_b6:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_lang_String_padRight__int_char_epilogue
pulsec_pulse_lang_String_padRight__int_char_epilogue:
pulsec_pulse_lang_String_padRight__int_char_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_lang_String_padRight__int_char endp

pulsec_pulse_lang_String_split__char proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m42
    mov edx, trace_m42_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+112], rcx
    mov dword ptr [rsp+120], edx
    mov qword ptr [rsp+88], 0
pulsec_pulse_lang_String_split__char_b0:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_split__char_b1
pulsec_pulse_lang_String_split__char_b1:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__char_b2
    jmp pulsec_pulse_lang_String_split__char_b3
pulsec_pulse_lang_String_split__char_b2:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__char_b4
    jmp pulsec_pulse_lang_String_split__char_b5
pulsec_pulse_lang_String_split__char_b3:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_arrayNew
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+88], rax
    mov eax, 0
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_split__char_b7
pulsec_pulse_lang_String_split__char_b4:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_split__char_b6
pulsec_pulse_lang_String_split__char_b5:
    jmp pulsec_pulse_lang_String_split__char_b6
pulsec_pulse_lang_String_split__char_b6:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_split__char_b1
pulsec_pulse_lang_String_split__char_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__char_b8
    jmp pulsec_pulse_lang_String_split__char_b9
pulsec_pulse_lang_String_split__char_b8:
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+120]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__char_b10
    jmp pulsec_pulse_lang_String_split__char_b11
pulsec_pulse_lang_String_split__char_b9:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+296], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_substring__int_int
    mov r8, rax
    mov rcx, qword ptr [rsp+344]
    mov edx, dword ptr [rsp+352]
    call pulsec_rt_arraySetString
    xor eax, eax
    mov rax, qword ptr [rsp+88]
    jmp pulsec_pulse_lang_String_split__char_epilogue
pulsec_pulse_lang_String_split__char_b10:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+328], rax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+336], eax
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+296], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov rax, qword ptr [rsp+296]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+240]
    mov eax, eax
    mov qword ptr [rsp+208], rax
    mov eax, dword ptr [rsp+200]
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_substring__int_int
    mov r8, rax
    mov rcx, qword ptr [rsp+328]
    mov edx, dword ptr [rsp+336]
    call pulsec_rt_arraySetString
    xor eax, eax
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+176], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    add eax, edx
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+104], eax
    jmp pulsec_pulse_lang_String_split__char_b12
pulsec_pulse_lang_String_split__char_b11:
    jmp pulsec_pulse_lang_String_split__char_b12
pulsec_pulse_lang_String_split__char_b12:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+192], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_split__char_b7
pulsec_pulse_lang_String_split__char_epilogue:
pulsec_pulse_lang_String_split__char_epilogue_post:
    mov qword ptr [rsp+240], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+240]
    add rsp, 392
    ret
pulsec_pulse_lang_String_split__char endp

pulsec_pulse_lang_String_split__String proc
    sub rsp, 424
    mov qword ptr [rsp+392], rcx
    mov qword ptr [rsp+400], rdx
    mov qword ptr [rsp+408], r8
    mov qword ptr [rsp+416], r9
    lea rcx, trace_m43
    mov edx, trace_m43_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+392]
    mov rdx, qword ptr [rsp+400]
    mov r8, qword ptr [rsp+408]
    mov r9, qword ptr [rsp+416]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+96], 0
pulsec_pulse_lang_String_split__String_b0:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__String_b1
    jmp pulsec_pulse_lang_String_split__String_b2
pulsec_pulse_lang_String_split__String_b1:
    lea rcx, msg19
    mov edx, msg19_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    jmp pulsec_pulse_lang_String_split__String_b3
pulsec_pulse_lang_String_split__String_b2:
    jmp pulsec_pulse_lang_String_split__String_b3
pulsec_pulse_lang_String_split__String_b3:
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+240], rax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+136], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__String_b4
    jmp pulsec_pulse_lang_String_split__String_b5
pulsec_pulse_lang_String_split__String_b4:
    lea rcx, msg20
    mov edx, msg20_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    jmp pulsec_pulse_lang_String_split__String_b6
pulsec_pulse_lang_String_split__String_b5:
    jmp pulsec_pulse_lang_String_split__String_b6
pulsec_pulse_lang_String_split__String_b6:
    mov eax, 1
    mov dword ptr [rsp+64], eax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+192]
    mov rdx, rax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+80], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+240], rax
    mov rcx, qword ptr [rsp+240]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+88], eax
    jmp pulsec_pulse_lang_String_split__String_b7
pulsec_pulse_lang_String_split__String_b7:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__String_b8
    jmp pulsec_pulse_lang_String_split__String_b9
pulsec_pulse_lang_String_split__String_b8:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    add eax, edx
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    add eax, edx
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+192]
    mov rdx, rax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_split__String_b7
pulsec_pulse_lang_String_split__String_b9:
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_arrayNew
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+96], rax
    mov eax, 0
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+192]
    mov rdx, rax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_split__String_b10
pulsec_pulse_lang_String_split__String_b10:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+168], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    setge al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_split__String_b11
    jmp pulsec_pulse_lang_String_split__String_b12
pulsec_pulse_lang_String_split__String_b11:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+360], rax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+368], eax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_substring__int_int
    mov r8, rax
    mov rcx, qword ptr [rsp+360]
    mov edx, dword ptr [rsp+368]
    call pulsec_rt_arraySetString
    xor eax, eax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+176], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    add eax, edx
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    add eax, edx
    mov dword ptr [rsp+72], eax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov qword ptr [rsp+192], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+192]
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+192]
    mov rdx, rax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_indexOf__String_int
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+232]
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_split__String_b10
pulsec_pulse_lang_String_split__String_b12:
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+376], rax
    mov eax, dword ptr [rsp+104]
    mov dword ptr [rsp+384], eax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+288], rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+232], rax
    mov rax, qword ptr [rsp+288]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+232]
    mov eax, eax
    mov qword ptr [rsp+200], rax
    mov eax, dword ptr [rsp+192]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    mov r8d, eax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_lang_String_substring__int_int
    mov r8, rax
    mov rcx, qword ptr [rsp+376]
    mov edx, dword ptr [rsp+384]
    call pulsec_rt_arraySetString
    xor eax, eax
    mov rax, qword ptr [rsp+96]
    jmp pulsec_pulse_lang_String_split__String_epilogue
pulsec_pulse_lang_String_split__String_epilogue:
pulsec_pulse_lang_String_split__String_epilogue_post:
    mov qword ptr [rsp+232], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+232]
    add rsp, 424
    ret
pulsec_pulse_lang_String_split__String endp

pulsec_pulse_lang_String_join__String_StringArr proc
    sub rsp, 344
    mov qword ptr [rsp+312], rcx
    mov qword ptr [rsp+320], rdx
    mov qword ptr [rsp+328], r8
    mov qword ptr [rsp+336], r9
    lea rcx, trace_m44
    mov edx, trace_m44_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+312]
    mov rdx, qword ptr [rsp+320]
    mov r8, qword ptr [rsp+328]
    mov r9, qword ptr [rsp+336]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_join__String_StringArr_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_join__String_StringArr_b1
    jmp pulsec_pulse_lang_String_join__String_StringArr_b2
pulsec_pulse_lang_String_join__String_StringArr_b1:
    lea rcx, msg21
    mov edx, msg21_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_lang_String_join__String_StringArr_b3
pulsec_pulse_lang_String_join__String_StringArr_b2:
    jmp pulsec_pulse_lang_String_join__String_StringArr_b3
pulsec_pulse_lang_String_join__String_StringArr_b3:
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_join__String_StringArr_b4
    jmp pulsec_pulse_lang_String_join__String_StringArr_b5
pulsec_pulse_lang_String_join__String_StringArr_b4:
    lea rcx, msg22
    mov edx, msg22_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    jmp pulsec_pulse_lang_String_join__String_StringArr_b6
pulsec_pulse_lang_String_join__String_StringArr_b5:
    jmp pulsec_pulse_lang_String_join__String_StringArr_b6
pulsec_pulse_lang_String_join__String_StringArr_b6:
    lea rcx, msg23
    mov edx, msg23_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_join__String_StringArr_b7
pulsec_pulse_lang_String_join__String_StringArr_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_join__String_StringArr_b8
    jmp pulsec_pulse_lang_String_join__String_StringArr_b9
pulsec_pulse_lang_String_join__String_StringArr_b8:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_join__String_StringArr_b10
    jmp pulsec_pulse_lang_String_join__String_StringArr_b11
pulsec_pulse_lang_String_join__String_StringArr_b9:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_join__String_StringArr_epilogue
pulsec_pulse_lang_String_join__String_StringArr_b10:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    jmp pulsec_pulse_lang_String_join__String_StringArr_b12
pulsec_pulse_lang_String_join__String_StringArr_b11:
    jmp pulsec_pulse_lang_String_join__String_StringArr_b12
pulsec_pulse_lang_String_join__String_StringArr_b12:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+304], rax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov rcx, qword ptr [rsp+304]
    call pulsec_rt_arrayGetString
    test rax, rax
    je String_join_cast_9_36_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_join_cast_9_36_fail
    mov ecx, edx
    lea rdx, cidset_2
    mov r8d, 17
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_join_cast_9_36_ok
String_join_cast_9_36_fail:
    lea rcx, msg24
    mov edx, msg24_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_join_cast_9_36_done
String_join_cast_9_36_null:
    xor eax, eax
    jmp String_join_cast_9_36_done
String_join_cast_9_36_ok:
    mov rax, qword ptr [rsp+40]
String_join_cast_9_36_done:
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+136]
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_pulse_lang_String_valueOf__Object
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rdx, rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_join__String_StringArr_b7
pulsec_pulse_lang_String_join__String_StringArr_epilogue:
pulsec_pulse_lang_String_join__String_StringArr_epilogue_post:
    mov qword ptr [rsp+176], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+176]
    add rsp, 344
    ret
pulsec_pulse_lang_String_join__String_StringArr endp

pulsec_pulse_lang_String_toCharArray proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+72], 0
pulsec_pulse_lang_String_toCharArray_b0:
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov ecx, eax
    call pulsec_rt_arrayNew
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    mov eax, 0
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_toCharArray_b1
pulsec_pulse_lang_String_toCharArray_b1:
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+96], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toCharArray_b2
    jmp pulsec_pulse_lang_String_toCharArray_b3
pulsec_pulse_lang_String_toCharArray_b2:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+240], rax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+248], eax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov eax, eax
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov r8, rax
    mov rcx, qword ptr [rsp+240]
    mov edx, dword ptr [rsp+248]
    call pulsec_rt_arraySetInt
    xor eax, eax
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+80], eax
    jmp pulsec_pulse_lang_String_toCharArray_b1
pulsec_pulse_lang_String_toCharArray_b3:
    mov rax, qword ptr [rsp+72]
    jmp pulsec_pulse_lang_String_toCharArray_epilogue
pulsec_pulse_lang_String_toCharArray_epilogue:
pulsec_pulse_lang_String_toCharArray_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 296
    ret
pulsec_pulse_lang_String_toCharArray endp

pulsec_pulse_lang_String_getChars__int_int_charArr_int proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m46
    mov edx, trace_m46_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+104], r9
    mov eax, dword ptr [rsp+432]
    mov dword ptr [rsp+112], eax
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b0:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_getChars__int_int_charArr_int_b1
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b2
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b1:
    lea rcx, msg25
    mov edx, msg25_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+216], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+216]
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+256]
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b3
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b2:
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b3
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b3:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_getChars_ternary_then_2_14
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    jmp String_getChars_ternary_done_2_14
String_getChars_ternary_then_2_14:
    mov eax, 1
String_getChars_ternary_done_2_14:
    test rax, rax
    jne String_getChars_ternary_then_2_20
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+144], eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_getChars_ternary_done_2_20
String_getChars_ternary_then_2_20:
    mov eax, 1
String_getChars_ternary_done_2_20:
    test eax, eax
    jne pulsec_pulse_lang_String_getChars__int_int_charArr_int_b4
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b5
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b4:
    lea rcx, msg26
    mov edx, msg26_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+216], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+216]
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+256]
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b6
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b5:
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b6
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b6:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    sub eax, edx
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+160], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_getChars_ternary_then_5_38
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+168], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+176], eax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_getChars_ternary_done_5_38
String_getChars_ternary_then_5_38:
    mov eax, 1
String_getChars_ternary_done_5_38:
    test eax, eax
    jne pulsec_pulse_lang_String_getChars__int_int_charArr_int_b7
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b8
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b7:
    lea rcx, msg27
    mov edx, msg27_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov qword ptr [rsp+216], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+216]
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+256]
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b9
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b8:
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b9
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b9:
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b10
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b10:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+184], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_getChars__int_int_charArr_int_b11
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b12
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b11:
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+112]
    mov dword ptr [rsp+192], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    add eax, edx
    mov dword ptr [rsp+352], eax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+200], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    add eax, edx
    mov qword ptr [rsp+256], rax
    mov rax, qword ptr [rsp+256]
    mov eax, eax
    mov qword ptr [rsp+216], rax
    mov eax, dword ptr [rsp+216]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_lang_String_charAt__int
    movzx eax, ax
    mov r8, rax
    mov rcx, qword ptr [rsp+344]
    mov edx, dword ptr [rsp+352]
    call pulsec_rt_arraySetInt
    xor eax, eax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+208], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_b10
pulsec_pulse_lang_String_getChars__int_int_charArr_int_b12:
    xor eax, eax
    jmp pulsec_pulse_lang_String_getChars__int_int_charArr_int_epilogue
pulsec_pulse_lang_String_getChars__int_int_charArr_int_epilogue:
pulsec_pulse_lang_String_getChars__int_int_charArr_int_epilogue_post:
    mov qword ptr [rsp+256], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+256]
    add rsp, 392
    ret
pulsec_pulse_lang_String_getChars__int_int_charArr_int endp

pulsec_pulse_lang_String_valueOf__int proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m47
    mov edx, trace_m47_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov dword ptr [rsp+96], ecx
    mov qword ptr [rsp+80], 0
pulsec_pulse_lang_String_valueOf__int_b0:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+104], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__int_b1
    jmp pulsec_pulse_lang_String_valueOf__int_b2
pulsec_pulse_lang_String_valueOf__int_b1:
    lea rcx, msg28
    mov edx, msg28_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_valueOf__int_epilogue
pulsec_pulse_lang_String_valueOf__int_b2:
    jmp pulsec_pulse_lang_String_valueOf__int_b3
pulsec_pulse_lang_String_valueOf__int_b3:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    call pulsec_fget_pulse_lang_Integer_MIN_VALUE
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__int_b4
    jmp pulsec_pulse_lang_String_valueOf__int_b5
pulsec_pulse_lang_String_valueOf__int_b4:
    lea rcx, msg29
    mov edx, msg29_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_valueOf__int_epilogue
pulsec_pulse_lang_String_valueOf__int_b5:
    jmp pulsec_pulse_lang_String_valueOf__int_b6
pulsec_pulse_lang_String_valueOf__int_b6:
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+64], eax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    mov dword ptr [rsp+72], eax
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__int_b7
    jmp pulsec_pulse_lang_String_valueOf__int_b8
pulsec_pulse_lang_String_valueOf__int_b7:
    mov eax, dword ptr [rsp+64]
    neg eax
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_valueOf__int_b9
pulsec_pulse_lang_String_valueOf__int_b8:
    jmp pulsec_pulse_lang_String_valueOf__int_b9
pulsec_pulse_lang_String_valueOf__int_b9:
    lea rcx, msg30
    mov edx, msg30_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    jmp pulsec_pulse_lang_String_valueOf__int_b10
pulsec_pulse_lang_String_valueOf__int_b10:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__int_b11
    jmp pulsec_pulse_lang_String_valueOf__int_b12
pulsec_pulse_lang_String_valueOf__int_b11:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    mov ecx, edx
    cdq
    idiv ecx
    mov eax, edx
    mov dword ptr [rsp+88], eax
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov eax, eax
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov ecx, eax
    call pulsec_pulse_lang_String_digitText__int
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+144], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    mov ecx, edx
    cdq
    idiv ecx
    mov dword ptr [rsp+64], eax
    jmp pulsec_pulse_lang_String_valueOf__int_b10
pulsec_pulse_lang_String_valueOf__int_b12:
    mov eax, dword ptr [rsp+72]
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__int_b13
    jmp pulsec_pulse_lang_String_valueOf__int_b14
pulsec_pulse_lang_String_valueOf__int_b13:
    lea rcx, msg31
    mov edx, msg31_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    jmp pulsec_pulse_lang_String_valueOf__int_epilogue
pulsec_pulse_lang_String_valueOf__int_b14:
    jmp pulsec_pulse_lang_String_valueOf__int_b15
pulsec_pulse_lang_String_valueOf__int_b15:
    mov rax, qword ptr [rsp+80]
    jmp pulsec_pulse_lang_String_valueOf__int_epilogue
pulsec_pulse_lang_String_valueOf__int_epilogue:
pulsec_pulse_lang_String_valueOf__int_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 360
    ret
pulsec_pulse_lang_String_valueOf__int endp

pulsec_pulse_lang_String_valueOf__byte proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m48
    mov edx, trace_m48_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__byte_b0:
    mov eax, dword ptr [rsp+64]
    movsx eax, al
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    jmp pulsec_pulse_lang_String_valueOf__byte_epilogue
pulsec_pulse_lang_String_valueOf__byte_epilogue:
pulsec_pulse_lang_String_valueOf__byte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__byte endp

pulsec_pulse_lang_String_valueOf__short proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m49
    mov edx, trace_m49_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__short_b0:
    mov eax, dword ptr [rsp+64]
    movsx eax, ax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    jmp pulsec_pulse_lang_String_valueOf__short_epilogue
pulsec_pulse_lang_String_valueOf__short_epilogue:
pulsec_pulse_lang_String_valueOf__short_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__short endp

pulsec_pulse_lang_String_valueOf__long proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m50
    mov edx, trace_m50_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__long_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Long_toString__long
    jmp pulsec_pulse_lang_String_valueOf__long_epilogue
pulsec_pulse_lang_String_valueOf__long_epilogue:
pulsec_pulse_lang_String_valueOf__long_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__long endp

pulsec_pulse_lang_String_valueOf__ubyte proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m51
    mov edx, trace_m51_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__ubyte_b0:
    mov eax, dword ptr [rsp+64]
    movzx eax, al
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    jmp pulsec_pulse_lang_String_valueOf__ubyte_epilogue
pulsec_pulse_lang_String_valueOf__ubyte_epilogue:
pulsec_pulse_lang_String_valueOf__ubyte_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__ubyte endp

pulsec_pulse_lang_String_valueOf__ushort proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m52
    mov edx, trace_m52_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__ushort_b0:
    mov eax, dword ptr [rsp+64]
    movzx eax, ax
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__int
    jmp pulsec_pulse_lang_String_valueOf__ushort_epilogue
pulsec_pulse_lang_String_valueOf__ushort_epilogue:
pulsec_pulse_lang_String_valueOf__ushort_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__ushort endp

pulsec_pulse_lang_String_valueOf__uint proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m53
    mov edx, trace_m53_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__uint_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_pulse_lang_UInteger_toString__uint
    jmp pulsec_pulse_lang_String_valueOf__uint_epilogue
pulsec_pulse_lang_String_valueOf__uint_epilogue:
pulsec_pulse_lang_String_valueOf__uint_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__uint endp

pulsec_pulse_lang_String_valueOf__ulong proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m54
    mov edx, trace_m54_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__ulong_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_ULong_toString__ulong
    jmp pulsec_pulse_lang_String_valueOf__ulong_epilogue
pulsec_pulse_lang_String_valueOf__ulong_epilogue:
pulsec_pulse_lang_String_valueOf__ulong_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__ulong endp

pulsec_pulse_lang_String_valueOf__boolean proc
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
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__boolean_b0:
    mov eax, dword ptr [rsp+64]
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__boolean_b1
    jmp pulsec_pulse_lang_String_valueOf__boolean_b2
pulsec_pulse_lang_String_valueOf__boolean_b1:
    lea rcx, msg32
    mov edx, msg32_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_valueOf__boolean_epilogue
pulsec_pulse_lang_String_valueOf__boolean_b2:
    jmp pulsec_pulse_lang_String_valueOf__boolean_b3
pulsec_pulse_lang_String_valueOf__boolean_b3:
    lea rcx, msg33
    mov edx, msg33_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_valueOf__boolean_epilogue
pulsec_pulse_lang_String_valueOf__boolean_epilogue:
pulsec_pulse_lang_String_valueOf__boolean_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_String_valueOf__boolean endp

pulsec_pulse_lang_String_valueOf__char proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m56
    mov edx, trace_m56_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_valueOf__char_b0:
    mov eax, dword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov eax, eax
    mov qword ptr [rsp+72], rax
    mov eax, dword ptr [rsp+72]
    mov ecx, eax
    call pulsec_rt_charToString
    jmp pulsec_pulse_lang_String_valueOf__char_epilogue
pulsec_pulse_lang_String_valueOf__char_epilogue:
pulsec_pulse_lang_String_valueOf__char_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__char endp

pulsec_pulse_lang_String_valueOf__charArr proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m57
    mov edx, trace_m57_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__charArr_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_String_copyValueOf__charArr
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_lang_String_valueOf__charArr_epilogue
pulsec_pulse_lang_String_valueOf__charArr_epilogue:
pulsec_pulse_lang_String_valueOf__charArr_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__charArr endp

pulsec_pulse_lang_String_valueOf__charArr_int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m58
    mov edx, trace_m58_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_lang_String_valueOf__charArr_int_int_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_pulse_lang_String_copyValueOf__charArr_int_int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_lang_String_valueOf__charArr_int_int_epilogue
pulsec_pulse_lang_String_valueOf__charArr_int_int_epilogue:
pulsec_pulse_lang_String_valueOf__charArr_int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_lang_String_valueOf__charArr_int_int endp

pulsec_pulse_lang_String_valueOf__float proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m59
    mov edx, trace_m59_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__float_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Float_toString__float
    jmp pulsec_pulse_lang_String_valueOf__float_epilogue
pulsec_pulse_lang_String_valueOf__float_epilogue:
pulsec_pulse_lang_String_valueOf__float_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__float endp

pulsec_pulse_lang_String_valueOf__double proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m60
    mov edx, trace_m60_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__double_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_pulse_lang_Double_toString__double
    jmp pulsec_pulse_lang_String_valueOf__double_epilogue
pulsec_pulse_lang_String_valueOf__double_epilogue:
pulsec_pulse_lang_String_valueOf__double_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_lang_String_valueOf__double endp

pulsec_pulse_lang_String_valueOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m61
    mov edx, trace_m61_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_valueOf__Object_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__Object_b1
    jmp pulsec_pulse_lang_String_valueOf__Object_b2
pulsec_pulse_lang_String_valueOf__Object_b1:
    lea rcx, msg34
    mov edx, msg34_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_valueOf__Object_epilogue
pulsec_pulse_lang_String_valueOf__Object_b2:
    jmp pulsec_pulse_lang_String_valueOf__Object_b3
pulsec_pulse_lang_String_valueOf__Object_b3:
    mov rax, qword ptr [rsp+64]
    test rax, rax
    je String_valueOf_instof_2_5_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_valueOf_instof_2_5_false
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_valueOf_instof_2_5_true
String_valueOf_instof_2_5_false:
    xor eax, eax
    jmp String_valueOf_instof_2_5_done
String_valueOf_instof_2_5_true:
    mov eax, 1
String_valueOf_instof_2_5_done:
    test eax, eax
    jne pulsec_pulse_lang_String_valueOf__Object_b4
    jmp pulsec_pulse_lang_String_valueOf__Object_b5
pulsec_pulse_lang_String_valueOf__Object_b4:
    mov rax, qword ptr [rsp+64]
    test rax, rax
    je String_valueOf_cast_3_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz String_valueOf_cast_3_7_fail
    mov ecx, edx
    lea rdx, cidset_1
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz String_valueOf_cast_3_7_ok
String_valueOf_cast_3_7_fail:
    lea rcx, msg35
    mov edx, msg35_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp String_valueOf_cast_3_7_done
String_valueOf_cast_3_7_null:
    xor eax, eax
    jmp String_valueOf_cast_3_7_done
String_valueOf_cast_3_7_ok:
    mov rax, qword ptr [rsp+40]
String_valueOf_cast_3_7_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_lang_String_valueOf__Object_epilogue
pulsec_pulse_lang_String_valueOf__Object_b5:
    jmp pulsec_pulse_lang_String_valueOf__Object_b6
pulsec_pulse_lang_String_valueOf__Object_b6:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    test rcx, rcx
    je String_valueOf_vd4_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz String_valueOf_vd4_10_type
    cmp eax, 1
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 4
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 6
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 7
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 8
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 9
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 10
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 11
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 12
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 13
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 14
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 15
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 16
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 17
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 18
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 19
    je String_valueOf_vd4_10_assign_ok
    cmp eax, 20
    je String_valueOf_vd4_10_assign_ok
    jmp String_valueOf_vd4_10_type
String_valueOf_vd4_10_assign_ok:
    cmp eax, 4
    je String_valueOf_vd4_10_ovr0
    cmp eax, 7
    je String_valueOf_vd4_10_ovr1
    cmp eax, 10
    je String_valueOf_vd4_10_ovr2
    cmp eax, 12
    je String_valueOf_vd4_10_ovr3
    cmp eax, 14
    je String_valueOf_vd4_10_ovr4
    cmp eax, 16
    je String_valueOf_vd4_10_ovr5
    cmp eax, 17
    je String_valueOf_vd4_10_ovr6
    jmp String_valueOf_vd4_10_default
String_valueOf_vd4_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Class_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr2:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Integer_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr3:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr4:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr5:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_StringBuilder_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_ovr6:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Throwable_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Object_toString
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp String_valueOf_vd4_10_done
String_valueOf_vd4_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
String_valueOf_vd4_10_done:
    jmp pulsec_pulse_lang_String_valueOf__Object_epilogue
pulsec_pulse_lang_String_valueOf__Object_epilogue:
pulsec_pulse_lang_String_valueOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_valueOf__Object endp

pulsec_pulse_lang_String_copyValueOf__charArr proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_lang_String_copyValueOf__charArr_b0:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_copyValueOf__charArr_b1
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_b2
pulsec_pulse_lang_String_copyValueOf__charArr_b1:
    lea rcx, msg36
    mov edx, msg36_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_b3
pulsec_pulse_lang_String_copyValueOf__charArr_b2:
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_b3
pulsec_pulse_lang_String_copyValueOf__charArr_b3:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov eax, 0
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+120]
    mov eax, eax
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    call pulsec_pulse_lang_String_copyValueOf__charArr_int_int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_epilogue
pulsec_pulse_lang_String_copyValueOf__charArr_epilogue:
pulsec_pulse_lang_String_copyValueOf__charArr_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_lang_String_copyValueOf__charArr endp

pulsec_pulse_lang_String_copyValueOf__charArr_int_int proc
    sub rsp, 392
    mov qword ptr [rsp+360], rcx
    mov qword ptr [rsp+368], rdx
    mov qword ptr [rsp+376], r8
    mov qword ptr [rsp+384], r9
    lea rcx, trace_m63
    mov edx, trace_m63_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+360]
    mov rdx, qword ptr [rsp+368]
    mov r8, qword ptr [rsp+376]
    mov r9, qword ptr [rsp+384]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b0:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b1
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b2
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b1:
    lea rcx, msg37
    mov edx, msg37_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+176]
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+216]
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b3
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b2:
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b3
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b3:
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne String_copyValueOf_ternary_then_2_14
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+120], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    jmp String_copyValueOf_ternary_done_2_14
String_copyValueOf_ternary_then_2_14:
    mov eax, 1
String_copyValueOf_ternary_done_2_14:
    test rax, rax
    jne String_copyValueOf_ternary_then_2_19
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+128], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_copyValueOf_ternary_done_2_19
String_copyValueOf_ternary_then_2_19:
    mov eax, 1
String_copyValueOf_ternary_done_2_19:
    test rax, rax
    jne String_copyValueOf_ternary_then_2_26
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+144], eax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arrayLength
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp String_copyValueOf_ternary_done_2_26
String_copyValueOf_ternary_then_2_26:
    mov eax, 1
String_copyValueOf_ternary_done_2_26:
    test eax, eax
    jne pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b4
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b5
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b4:
    lea rcx, msg38
    mov edx, msg38_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+176], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+176]
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+216]
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b6
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b5:
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b6
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b6:
    lea rcx, msg39
    mov edx, msg39_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rax
    mov eax, 0
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b7
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b7:
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b8
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b9
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b8:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+344], rax
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+160], eax
    mov eax, dword ptr [rsp+72]
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    add eax, edx
    mov edx, eax
    mov rcx, qword ptr [rsp+344]
    call pulsec_rt_arrayGetInt
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+216]
    mov eax, eax
    mov qword ptr [rsp+176], rax
    mov eax, dword ptr [rsp+176]
    mov ecx, eax
    call pulsec_pulse_lang_String_valueOf__char
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+216]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+176]
    mov rdx, rax
    mov rcx, qword ptr [rsp+224]
    call pulsec_pulse_lang_String_concat__String
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+176]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rax
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+168], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    add eax, edx
    mov dword ptr [rsp+72], eax
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b7
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_b9:
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_copyValueOf__charArr_int_int_epilogue
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_epilogue:
pulsec_pulse_lang_String_copyValueOf__charArr_int_int_epilogue_post:
    mov qword ptr [rsp+216], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+216]
    add rsp, 392
    ret
pulsec_pulse_lang_String_copyValueOf__charArr_int_int endp

pulsec_pulse_lang_String_runtimeCharAt__String_int proc
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
    mov dword ptr [rsp+72], edx
    mov rcx, qword ptr [rsp+64]
    mov edx, dword ptr [rsp+72]
    call pulsec_rt_stringCharAt
    jmp pulsec_pulse_lang_String_runtimeCharAt__String_int_epilogue
pulsec_pulse_lang_String_runtimeCharAt__String_int_epilogue:
pulsec_pulse_lang_String_runtimeCharAt__String_int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_String_runtimeCharAt__String_int endp

pulsec_pulse_lang_String_runtimeLength__String proc
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
    call pulsec_rt_stringLength
    jmp pulsec_pulse_lang_String_runtimeLength__String_epilogue
pulsec_pulse_lang_String_runtimeLength__String_epilogue:
pulsec_pulse_lang_String_runtimeLength__String_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_String_runtimeLength__String endp

pulsec_pulse_lang_String_runtimeConcat__String_String proc
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
    call pulsec_rt_stringConcat
    jmp pulsec_pulse_lang_String_runtimeConcat__String_String_epilogue
pulsec_pulse_lang_String_runtimeConcat__String_String_epilogue:
pulsec_pulse_lang_String_runtimeConcat__String_String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_lang_String_runtimeConcat__String_String endp

pulsec_pulse_lang_String_runtimeFromChar__char proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m67
    mov edx, trace_m67_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov dword ptr [rsp+64], ecx
    mov ecx, dword ptr [rsp+64]
    call pulsec_rt_charToString
    jmp pulsec_pulse_lang_String_runtimeFromChar__char_epilogue
pulsec_pulse_lang_String_runtimeFromChar__char_epilogue:
pulsec_pulse_lang_String_runtimeFromChar__char_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_lang_String_runtimeFromChar__char endp

pulsec_pulse_lang_String_digitText__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m68
    mov edx, trace_m68_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_digitText__int_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b1
    jmp pulsec_pulse_lang_String_digitText__int_b2
pulsec_pulse_lang_String_digitText__int_b1:
    lea rcx, msg40
    mov edx, msg40_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b2:
    jmp pulsec_pulse_lang_String_digitText__int_b3
pulsec_pulse_lang_String_digitText__int_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b4
    jmp pulsec_pulse_lang_String_digitText__int_b5
pulsec_pulse_lang_String_digitText__int_b4:
    lea rcx, msg41
    mov edx, msg41_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b5:
    jmp pulsec_pulse_lang_String_digitText__int_b6
pulsec_pulse_lang_String_digitText__int_b6:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b7
    jmp pulsec_pulse_lang_String_digitText__int_b8
pulsec_pulse_lang_String_digitText__int_b7:
    lea rcx, msg42
    mov edx, msg42_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b8:
    jmp pulsec_pulse_lang_String_digitText__int_b9
pulsec_pulse_lang_String_digitText__int_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 3
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b10
    jmp pulsec_pulse_lang_String_digitText__int_b11
pulsec_pulse_lang_String_digitText__int_b10:
    lea rcx, msg43
    mov edx, msg43_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b11:
    jmp pulsec_pulse_lang_String_digitText__int_b12
pulsec_pulse_lang_String_digitText__int_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 4
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b13
    jmp pulsec_pulse_lang_String_digitText__int_b14
pulsec_pulse_lang_String_digitText__int_b13:
    lea rcx, msg44
    mov edx, msg44_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b14:
    jmp pulsec_pulse_lang_String_digitText__int_b15
pulsec_pulse_lang_String_digitText__int_b15:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, 5
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b16
    jmp pulsec_pulse_lang_String_digitText__int_b17
pulsec_pulse_lang_String_digitText__int_b16:
    lea rcx, msg45
    mov edx, msg45_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b17:
    jmp pulsec_pulse_lang_String_digitText__int_b18
pulsec_pulse_lang_String_digitText__int_b18:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 6
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b19
    jmp pulsec_pulse_lang_String_digitText__int_b20
pulsec_pulse_lang_String_digitText__int_b19:
    lea rcx, msg46
    mov edx, msg46_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b20:
    jmp pulsec_pulse_lang_String_digitText__int_b21
pulsec_pulse_lang_String_digitText__int_b21:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 7
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b22
    jmp pulsec_pulse_lang_String_digitText__int_b23
pulsec_pulse_lang_String_digitText__int_b22:
    lea rcx, msg47
    mov edx, msg47_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b23:
    jmp pulsec_pulse_lang_String_digitText__int_b24
pulsec_pulse_lang_String_digitText__int_b24:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 8
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_digitText__int_b25
    jmp pulsec_pulse_lang_String_digitText__int_b26
pulsec_pulse_lang_String_digitText__int_b25:
    lea rcx, msg48
    mov edx, msg48_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_b26:
    jmp pulsec_pulse_lang_String_digitText__int_b27
pulsec_pulse_lang_String_digitText__int_b27:
    lea rcx, msg49
    mov edx, msg49_len
    call pulsec_rt_stringFromBytes
    jmp pulsec_pulse_lang_String_digitText__int_epilogue
pulsec_pulse_lang_String_digitText__int_epilogue:
pulsec_pulse_lang_String_digitText__int_epilogue_post:
    mov qword ptr [rsp+184], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+184]
    add rsp, 264
    ret
pulsec_pulse_lang_String_digitText__int endp

pulsec_pulse_lang_String_toLowerAscii__char proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m69
    mov edx, trace_m69_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_toLowerAscii__char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 65
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b1
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b2
pulsec_pulse_lang_String_toLowerAscii__char_b1:
    mov eax, 97
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b2:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b3
pulsec_pulse_lang_String_toLowerAscii__char_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 66
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b4
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b5
pulsec_pulse_lang_String_toLowerAscii__char_b4:
    mov eax, 98
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b5:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b6
pulsec_pulse_lang_String_toLowerAscii__char_b6:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 67
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b7
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b8
pulsec_pulse_lang_String_toLowerAscii__char_b7:
    mov eax, 99
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b8:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b9
pulsec_pulse_lang_String_toLowerAscii__char_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 68
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b10
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b11
pulsec_pulse_lang_String_toLowerAscii__char_b10:
    mov eax, 100
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b11:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b12
pulsec_pulse_lang_String_toLowerAscii__char_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 69
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b13
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b14
pulsec_pulse_lang_String_toLowerAscii__char_b13:
    mov eax, 101
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b14:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b15
pulsec_pulse_lang_String_toLowerAscii__char_b15:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, 70
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b16
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b17
pulsec_pulse_lang_String_toLowerAscii__char_b16:
    mov eax, 102
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b17:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b18
pulsec_pulse_lang_String_toLowerAscii__char_b18:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 71
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b19
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b20
pulsec_pulse_lang_String_toLowerAscii__char_b19:
    mov eax, 103
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b20:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b21
pulsec_pulse_lang_String_toLowerAscii__char_b21:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 72
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b22
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b23
pulsec_pulse_lang_String_toLowerAscii__char_b22:
    mov eax, 104
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b23:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b24
pulsec_pulse_lang_String_toLowerAscii__char_b24:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 73
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b25
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b26
pulsec_pulse_lang_String_toLowerAscii__char_b25:
    mov eax, 105
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b26:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b27
pulsec_pulse_lang_String_toLowerAscii__char_b27:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+144], eax
    mov eax, 74
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b28
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b29
pulsec_pulse_lang_String_toLowerAscii__char_b28:
    mov eax, 106
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b29:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b30
pulsec_pulse_lang_String_toLowerAscii__char_b30:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 75
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b31
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b32
pulsec_pulse_lang_String_toLowerAscii__char_b31:
    mov eax, 107
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b32:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b33
pulsec_pulse_lang_String_toLowerAscii__char_b33:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+160], eax
    mov eax, 76
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b34
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b35
pulsec_pulse_lang_String_toLowerAscii__char_b34:
    mov eax, 108
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b35:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b36
pulsec_pulse_lang_String_toLowerAscii__char_b36:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+168], eax
    mov eax, 77
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b37
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b38
pulsec_pulse_lang_String_toLowerAscii__char_b37:
    mov eax, 109
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b38:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b39
pulsec_pulse_lang_String_toLowerAscii__char_b39:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+176], eax
    mov eax, 78
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b40
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b41
pulsec_pulse_lang_String_toLowerAscii__char_b40:
    mov eax, 110
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b41:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b42
pulsec_pulse_lang_String_toLowerAscii__char_b42:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+184], eax
    mov eax, 79
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b43
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b44
pulsec_pulse_lang_String_toLowerAscii__char_b43:
    mov eax, 111
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b44:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b45
pulsec_pulse_lang_String_toLowerAscii__char_b45:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+192], eax
    mov eax, 80
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b46
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b47
pulsec_pulse_lang_String_toLowerAscii__char_b46:
    mov eax, 112
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b47:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b48
pulsec_pulse_lang_String_toLowerAscii__char_b48:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+200], eax
    mov eax, 81
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b49
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b50
pulsec_pulse_lang_String_toLowerAscii__char_b49:
    mov eax, 113
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b50:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b51
pulsec_pulse_lang_String_toLowerAscii__char_b51:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+208], eax
    mov eax, 82
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b52
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b53
pulsec_pulse_lang_String_toLowerAscii__char_b52:
    mov eax, 114
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b53:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b54
pulsec_pulse_lang_String_toLowerAscii__char_b54:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+216], eax
    mov eax, 83
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b55
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b56
pulsec_pulse_lang_String_toLowerAscii__char_b55:
    mov eax, 115
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b56:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b57
pulsec_pulse_lang_String_toLowerAscii__char_b57:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+224], eax
    mov eax, 84
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b58
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b59
pulsec_pulse_lang_String_toLowerAscii__char_b58:
    mov eax, 116
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b59:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b60
pulsec_pulse_lang_String_toLowerAscii__char_b60:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+232], eax
    mov eax, 85
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b61
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b62
pulsec_pulse_lang_String_toLowerAscii__char_b61:
    mov eax, 117
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b62:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b63
pulsec_pulse_lang_String_toLowerAscii__char_b63:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+240], eax
    mov eax, 86
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b64
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b65
pulsec_pulse_lang_String_toLowerAscii__char_b64:
    mov eax, 118
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b65:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b66
pulsec_pulse_lang_String_toLowerAscii__char_b66:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+248], eax
    mov eax, 87
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b67
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b68
pulsec_pulse_lang_String_toLowerAscii__char_b67:
    mov eax, 119
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b68:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b69
pulsec_pulse_lang_String_toLowerAscii__char_b69:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+256], eax
    mov eax, 88
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b70
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b71
pulsec_pulse_lang_String_toLowerAscii__char_b70:
    mov eax, 120
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b71:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b72
pulsec_pulse_lang_String_toLowerAscii__char_b72:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+264], eax
    mov eax, 89
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b73
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b74
pulsec_pulse_lang_String_toLowerAscii__char_b73:
    mov eax, 121
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b74:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b75
pulsec_pulse_lang_String_toLowerAscii__char_b75:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+272], eax
    mov eax, 90
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toLowerAscii__char_b76
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b77
pulsec_pulse_lang_String_toLowerAscii__char_b76:
    mov eax, 122
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_b77:
    jmp pulsec_pulse_lang_String_toLowerAscii__char_b78
pulsec_pulse_lang_String_toLowerAscii__char_b78:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_toLowerAscii__char_epilogue
pulsec_pulse_lang_String_toLowerAscii__char_epilogue:
pulsec_pulse_lang_String_toLowerAscii__char_epilogue_post:
    mov qword ptr [rsp+320], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+320]
    add rsp, 408
    ret
pulsec_pulse_lang_String_toLowerAscii__char endp

pulsec_pulse_lang_String_toUpperAscii__char proc
    sub rsp, 408
    mov qword ptr [rsp+376], rcx
    mov qword ptr [rsp+384], rdx
    mov qword ptr [rsp+392], r8
    mov qword ptr [rsp+400], r9
    lea rcx, trace_m70
    mov edx, trace_m70_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+376]
    mov rdx, qword ptr [rsp+384]
    mov r8, qword ptr [rsp+392]
    mov r9, qword ptr [rsp+400]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_toUpperAscii__char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 97
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b1
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b2
pulsec_pulse_lang_String_toUpperAscii__char_b1:
    mov eax, 65
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b2:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b3
pulsec_pulse_lang_String_toUpperAscii__char_b3:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 98
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b4
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b5
pulsec_pulse_lang_String_toUpperAscii__char_b4:
    mov eax, 66
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b5:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b6
pulsec_pulse_lang_String_toUpperAscii__char_b6:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 99
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b7
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b8
pulsec_pulse_lang_String_toUpperAscii__char_b7:
    mov eax, 67
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b8:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b9
pulsec_pulse_lang_String_toUpperAscii__char_b9:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 100
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b10
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b11
pulsec_pulse_lang_String_toUpperAscii__char_b10:
    mov eax, 68
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b11:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b12
pulsec_pulse_lang_String_toUpperAscii__char_b12:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+104], eax
    mov eax, 101
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b13
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b14
pulsec_pulse_lang_String_toUpperAscii__char_b13:
    mov eax, 69
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b14:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b15
pulsec_pulse_lang_String_toUpperAscii__char_b15:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+112], eax
    mov eax, 102
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b16
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b17
pulsec_pulse_lang_String_toUpperAscii__char_b16:
    mov eax, 70
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b17:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b18
pulsec_pulse_lang_String_toUpperAscii__char_b18:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+120], eax
    mov eax, 103
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b19
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b20
pulsec_pulse_lang_String_toUpperAscii__char_b19:
    mov eax, 71
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b20:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b21
pulsec_pulse_lang_String_toUpperAscii__char_b21:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+128], eax
    mov eax, 104
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b22
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b23
pulsec_pulse_lang_String_toUpperAscii__char_b22:
    mov eax, 72
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b23:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b24
pulsec_pulse_lang_String_toUpperAscii__char_b24:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+136], eax
    mov eax, 105
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b25
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b26
pulsec_pulse_lang_String_toUpperAscii__char_b25:
    mov eax, 73
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b26:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b27
pulsec_pulse_lang_String_toUpperAscii__char_b27:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+144], eax
    mov eax, 106
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b28
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b29
pulsec_pulse_lang_String_toUpperAscii__char_b28:
    mov eax, 74
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b29:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b30
pulsec_pulse_lang_String_toUpperAscii__char_b30:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 107
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b31
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b32
pulsec_pulse_lang_String_toUpperAscii__char_b31:
    mov eax, 75
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b32:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b33
pulsec_pulse_lang_String_toUpperAscii__char_b33:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+160], eax
    mov eax, 108
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b34
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b35
pulsec_pulse_lang_String_toUpperAscii__char_b34:
    mov eax, 76
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b35:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b36
pulsec_pulse_lang_String_toUpperAscii__char_b36:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+168], eax
    mov eax, 109
    mov edx, eax
    mov eax, dword ptr [rsp+168]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b37
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b38
pulsec_pulse_lang_String_toUpperAscii__char_b37:
    mov eax, 77
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b38:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b39
pulsec_pulse_lang_String_toUpperAscii__char_b39:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+176], eax
    mov eax, 110
    mov edx, eax
    mov eax, dword ptr [rsp+176]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b40
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b41
pulsec_pulse_lang_String_toUpperAscii__char_b40:
    mov eax, 78
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b41:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b42
pulsec_pulse_lang_String_toUpperAscii__char_b42:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+184], eax
    mov eax, 111
    mov edx, eax
    mov eax, dword ptr [rsp+184]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b43
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b44
pulsec_pulse_lang_String_toUpperAscii__char_b43:
    mov eax, 79
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b44:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b45
pulsec_pulse_lang_String_toUpperAscii__char_b45:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+192], eax
    mov eax, 112
    mov edx, eax
    mov eax, dword ptr [rsp+192]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b46
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b47
pulsec_pulse_lang_String_toUpperAscii__char_b46:
    mov eax, 80
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b47:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b48
pulsec_pulse_lang_String_toUpperAscii__char_b48:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+200], eax
    mov eax, 113
    mov edx, eax
    mov eax, dword ptr [rsp+200]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b49
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b50
pulsec_pulse_lang_String_toUpperAscii__char_b49:
    mov eax, 81
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b50:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b51
pulsec_pulse_lang_String_toUpperAscii__char_b51:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+208], eax
    mov eax, 114
    mov edx, eax
    mov eax, dword ptr [rsp+208]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b52
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b53
pulsec_pulse_lang_String_toUpperAscii__char_b52:
    mov eax, 82
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b53:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b54
pulsec_pulse_lang_String_toUpperAscii__char_b54:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+216], eax
    mov eax, 115
    mov edx, eax
    mov eax, dword ptr [rsp+216]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b55
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b56
pulsec_pulse_lang_String_toUpperAscii__char_b55:
    mov eax, 83
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b56:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b57
pulsec_pulse_lang_String_toUpperAscii__char_b57:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+224], eax
    mov eax, 116
    mov edx, eax
    mov eax, dword ptr [rsp+224]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b58
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b59
pulsec_pulse_lang_String_toUpperAscii__char_b58:
    mov eax, 84
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b59:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b60
pulsec_pulse_lang_String_toUpperAscii__char_b60:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+232], eax
    mov eax, 117
    mov edx, eax
    mov eax, dword ptr [rsp+232]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b61
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b62
pulsec_pulse_lang_String_toUpperAscii__char_b61:
    mov eax, 85
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b62:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b63
pulsec_pulse_lang_String_toUpperAscii__char_b63:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+240], eax
    mov eax, 118
    mov edx, eax
    mov eax, dword ptr [rsp+240]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b64
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b65
pulsec_pulse_lang_String_toUpperAscii__char_b64:
    mov eax, 86
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b65:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b66
pulsec_pulse_lang_String_toUpperAscii__char_b66:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+248], eax
    mov eax, 119
    mov edx, eax
    mov eax, dword ptr [rsp+248]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b67
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b68
pulsec_pulse_lang_String_toUpperAscii__char_b67:
    mov eax, 87
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b68:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b69
pulsec_pulse_lang_String_toUpperAscii__char_b69:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+256], eax
    mov eax, 120
    mov edx, eax
    mov eax, dword ptr [rsp+256]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b70
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b71
pulsec_pulse_lang_String_toUpperAscii__char_b70:
    mov eax, 88
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b71:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b72
pulsec_pulse_lang_String_toUpperAscii__char_b72:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+264], eax
    mov eax, 121
    mov edx, eax
    mov eax, dword ptr [rsp+264]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b73
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b74
pulsec_pulse_lang_String_toUpperAscii__char_b73:
    mov eax, 89
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b74:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b75
pulsec_pulse_lang_String_toUpperAscii__char_b75:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+272], eax
    mov eax, 122
    mov edx, eax
    mov eax, dword ptr [rsp+272]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_lang_String_toUpperAscii__char_b76
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b77
pulsec_pulse_lang_String_toUpperAscii__char_b76:
    mov eax, 90
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_b77:
    jmp pulsec_pulse_lang_String_toUpperAscii__char_b78
pulsec_pulse_lang_String_toUpperAscii__char_b78:
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_lang_String_toUpperAscii__char_epilogue
pulsec_pulse_lang_String_toUpperAscii__char_epilogue:
pulsec_pulse_lang_String_toUpperAscii__char_epilogue_post:
    mov qword ptr [rsp+320], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+320]
    add rsp, 408
    ret
pulsec_pulse_lang_String_toUpperAscii__char endp

pulsec_pulse_lang_String_isAsciiWhitespace__char proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m71
    mov edx, trace_m71_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov dword ptr [rsp+64], ecx
pulsec_pulse_lang_String_isAsciiWhitespace__char_b0:
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+72], eax
    mov eax, 32
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    test rax, rax
    jne String_isAsciiWhitespace_ternary_then_0_7
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+80], eax
    mov eax, 9
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_isAsciiWhitespace_ternary_done_0_7
String_isAsciiWhitespace_ternary_then_0_7:
    mov eax, 1
String_isAsciiWhitespace_ternary_done_0_7:
    test rax, rax
    jne String_isAsciiWhitespace_ternary_then_0_11
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov eax, 10
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_isAsciiWhitespace_ternary_done_0_11
String_isAsciiWhitespace_ternary_then_0_11:
    mov eax, 1
String_isAsciiWhitespace_ternary_done_0_11:
    test rax, rax
    jne String_isAsciiWhitespace_ternary_then_0_15
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov eax, 13
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp String_isAsciiWhitespace_ternary_done_0_15
String_isAsciiWhitespace_ternary_then_0_15:
    mov eax, 1
String_isAsciiWhitespace_ternary_done_0_15:
    jmp pulsec_pulse_lang_String_isAsciiWhitespace__char_epilogue
pulsec_pulse_lang_String_isAsciiWhitespace__char_epilogue:
pulsec_pulse_lang_String_isAsciiWhitespace__char_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 232
    ret
pulsec_pulse_lang_String_isAsciiWhitespace__char endp

end
