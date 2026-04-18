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
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
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
pulsec_objc_pulse_collections_Map dd 0
trace_m0 db "pulse.collections.Map.size"
trace_m0_len equ 26
trace_m1 db "pulse.collections.Map.isEmpty"
trace_m1_len equ 29
trace_m2 db "pulse.collections.Map.clear"
trace_m2_len equ 27
trace_m3 db "pulse.collections.Map.containsKey"
trace_m3_len equ 33
trace_m4 db "pulse.collections.Map.containsKey"
trace_m4_len equ 33
trace_m5 db "pulse.collections.Map.containsValue"
trace_m5_len equ 35
trace_m6 db "pulse.collections.Map.containsValue"
trace_m6_len equ 35
trace_m7 db "pulse.collections.Map.containsValue"
trace_m7_len equ 35
trace_m8 db "pulse.collections.Map.put"
trace_m8_len equ 25
trace_m9 db "pulse.collections.Map.putInt"
trace_m9_len equ 28
trace_m10 db "pulse.collections.Map.putAll"
trace_m10_len equ 28
trace_m11 db "pulse.collections.Map.putIfAbsent"
trace_m11_len equ 33
trace_m12 db "pulse.collections.Map.putIfAbsent"
trace_m12_len equ 33
trace_m13 db "pulse.collections.Map.replace"
trace_m13_len equ 29
trace_m14 db "pulse.collections.Map.replace"
trace_m14_len equ 29
trace_m15 db "pulse.collections.Map.remove"
trace_m15_len equ 28
trace_m16 db "pulse.collections.Map.get"
trace_m16_len equ 25
trace_m17 db "pulse.collections.Map.getInt"
trace_m17_len equ 28
trace_m18 db "pulse.collections.Map.getOrDefault"
trace_m18_len equ 34
trace_m19 db "pulse.collections.Map.getOrDefault"
trace_m19_len equ 34
trace_m20 db "pulse.collections.Map.getIntOrDefault"
trace_m20_len equ 37
trace_m21 db "pulse.collections.Map.keyIterator"
trace_m21_len equ 33
trace_m22 db "pulse.collections.Map.entrySet"
trace_m22_len equ 30
trace_m23 db "pulse.collections.Map.keySet"
trace_m23_len equ 28
trace_m24 db "pulse.collections.Map.values"
trace_m24_len equ 28

.code
pulsec_pulse_collections_Map_size proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_Map_size_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_size_epilogue
pulsec_pulse_collections_Map_size_epilogue:
pulsec_pulse_collections_Map_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_size endp

pulsec_pulse_collections_Map_isEmpty proc
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
pulsec_pulse_collections_Map_isEmpty_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_isEmpty_epilogue
pulsec_pulse_collections_Map_isEmpty_epilogue:
pulsec_pulse_collections_Map_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_isEmpty endp

pulsec_pulse_collections_Map_clear proc
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
pulsec_pulse_collections_Map_clear_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_clear_epilogue
pulsec_pulse_collections_Map_clear_epilogue:
pulsec_pulse_collections_Map_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_clear endp

pulsec_pulse_collections_Map_containsKey__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_containsKey__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_containsKey__Object_epilogue
pulsec_pulse_collections_Map_containsKey__Object_epilogue:
pulsec_pulse_collections_Map_containsKey__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_containsKey__Object endp

pulsec_pulse_collections_Map_containsKey__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_containsKey__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_containsKey__String_epilogue
pulsec_pulse_collections_Map_containsKey__String_epilogue:
pulsec_pulse_collections_Map_containsKey__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_containsKey__String endp

pulsec_pulse_collections_Map_containsValue__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_containsValue__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_containsValue__Object_epilogue
pulsec_pulse_collections_Map_containsValue__Object_epilogue:
pulsec_pulse_collections_Map_containsValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_containsValue__Object endp

pulsec_pulse_collections_Map_containsValue__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_containsValue__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_containsValue__String_epilogue
pulsec_pulse_collections_Map_containsValue__String_epilogue:
pulsec_pulse_collections_Map_containsValue__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_containsValue__String endp

pulsec_pulse_collections_Map_containsValue__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Map_containsValue__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_containsValue__int_epilogue
pulsec_pulse_collections_Map_containsValue__int_epilogue:
pulsec_pulse_collections_Map_containsValue__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_containsValue__int endp

pulsec_pulse_collections_Map_put__Object_Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_put__Object_Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_put__Object_Object_epilogue
pulsec_pulse_collections_Map_put__Object_Object_epilogue:
pulsec_pulse_collections_Map_put__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_put__Object_Object endp

pulsec_pulse_collections_Map_putInt__String_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_Map_putInt__String_int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_putInt__String_int_epilogue
pulsec_pulse_collections_Map_putInt__String_int_epilogue:
pulsec_pulse_collections_Map_putInt__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_putInt__String_int endp

pulsec_pulse_collections_Map_putAll__Map proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_putAll__Map_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_putAll__Map_epilogue
pulsec_pulse_collections_Map_putAll__Map_epilogue:
pulsec_pulse_collections_Map_putAll__Map_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_putAll__Map endp

pulsec_pulse_collections_Map_putIfAbsent__Object_Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m11
    mov edx, trace_m11_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_putIfAbsent__Object_Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_putIfAbsent__Object_Object_epilogue
pulsec_pulse_collections_Map_putIfAbsent__Object_Object_epilogue:
pulsec_pulse_collections_Map_putIfAbsent__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_putIfAbsent__Object_Object endp

pulsec_pulse_collections_Map_putIfAbsent__String_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m12
    mov edx, trace_m12_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_putIfAbsent__String_String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_putIfAbsent__String_String_epilogue
pulsec_pulse_collections_Map_putIfAbsent__String_String_epilogue:
pulsec_pulse_collections_Map_putIfAbsent__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_putIfAbsent__String_String endp

pulsec_pulse_collections_Map_replace__Object_Object proc
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
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_replace__Object_Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_replace__Object_Object_epilogue
pulsec_pulse_collections_Map_replace__Object_Object_epilogue:
pulsec_pulse_collections_Map_replace__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_replace__Object_Object endp

pulsec_pulse_collections_Map_replace__String_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_replace__String_String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_replace__String_String_epilogue
pulsec_pulse_collections_Map_replace__String_String_epilogue:
pulsec_pulse_collections_Map_replace__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_replace__String_String endp

pulsec_pulse_collections_Map_remove__Object proc
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
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_remove__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_remove__Object_epilogue
pulsec_pulse_collections_Map_remove__Object_epilogue:
pulsec_pulse_collections_Map_remove__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_remove__Object endp

pulsec_pulse_collections_Map_get__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_get__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_get__Object_epilogue
pulsec_pulse_collections_Map_get__Object_epilogue:
pulsec_pulse_collections_Map_get__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_get__Object endp

pulsec_pulse_collections_Map_getInt__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Map_getInt__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_getInt__String_epilogue
pulsec_pulse_collections_Map_getInt__String_epilogue:
pulsec_pulse_collections_Map_getInt__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_getInt__String endp

pulsec_pulse_collections_Map_getOrDefault__Object_Object proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_getOrDefault__Object_Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_getOrDefault__Object_Object_epilogue
pulsec_pulse_collections_Map_getOrDefault__Object_Object_epilogue:
pulsec_pulse_collections_Map_getOrDefault__Object_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_getOrDefault__Object_Object endp

pulsec_pulse_collections_Map_getOrDefault__String_String proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m19
    mov edx, trace_m19_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_Map_getOrDefault__String_String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_getOrDefault__String_String_epilogue
pulsec_pulse_collections_Map_getOrDefault__String_String_epilogue:
pulsec_pulse_collections_Map_getOrDefault__String_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_getOrDefault__String_String endp

pulsec_pulse_collections_Map_getIntOrDefault__String_int proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m20
    mov edx, trace_m20_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_Map_getIntOrDefault__String_int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_getIntOrDefault__String_int_epilogue
pulsec_pulse_collections_Map_getIntOrDefault__String_int_epilogue:
pulsec_pulse_collections_Map_getIntOrDefault__String_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 216
    ret
pulsec_pulse_collections_Map_getIntOrDefault__String_int endp

pulsec_pulse_collections_Map_keyIterator proc
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
pulsec_pulse_collections_Map_keyIterator_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_keyIterator_epilogue
pulsec_pulse_collections_Map_keyIterator_epilogue:
pulsec_pulse_collections_Map_keyIterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_keyIterator endp

pulsec_pulse_collections_Map_entrySet proc
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
pulsec_pulse_collections_Map_entrySet_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_entrySet_epilogue
pulsec_pulse_collections_Map_entrySet_epilogue:
pulsec_pulse_collections_Map_entrySet_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_entrySet endp

pulsec_pulse_collections_Map_keySet proc
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
pulsec_pulse_collections_Map_keySet_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_keySet_epilogue
pulsec_pulse_collections_Map_keySet_epilogue:
pulsec_pulse_collections_Map_keySet_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_keySet endp

pulsec_pulse_collections_Map_values proc
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
pulsec_pulse_collections_Map_values_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Map_values_epilogue
pulsec_pulse_collections_Map_values_epilogue:
pulsec_pulse_collections_Map_values_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Map_values endp

end
