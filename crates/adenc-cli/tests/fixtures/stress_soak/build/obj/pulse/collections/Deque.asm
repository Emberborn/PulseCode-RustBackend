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
pulsec_objc_pulse_collections_Deque dd 0
trace_m0 db "pulse.collections.Deque.addFirst"
trace_m0_len equ 32
trace_m1 db "pulse.collections.Deque.offerFirst"
trace_m1_len equ 34
trace_m2 db "pulse.collections.Deque.addFirst"
trace_m2_len equ 32
trace_m3 db "pulse.collections.Deque.addFirst"
trace_m3_len equ 32
trace_m4 db "pulse.collections.Deque.offerFirst"
trace_m4_len equ 34
trace_m5 db "pulse.collections.Deque.offerFirst"
trace_m5_len equ 34
trace_m6 db "pulse.collections.Deque.addLast"
trace_m6_len equ 31
trace_m7 db "pulse.collections.Deque.offerLast"
trace_m7_len equ 33
trace_m8 db "pulse.collections.Deque.addLast"
trace_m8_len equ 31
trace_m9 db "pulse.collections.Deque.addLast"
trace_m9_len equ 31
trace_m10 db "pulse.collections.Deque.offerLast"
trace_m10_len equ 33
trace_m11 db "pulse.collections.Deque.offerLast"
trace_m11_len equ 33
trace_m12 db "pulse.collections.Deque.getFirst"
trace_m12_len equ 32
trace_m13 db "pulse.collections.Deque.removeFirst"
trace_m13_len equ 35
trace_m14 db "pulse.collections.Deque.peekFirst"
trace_m14_len equ 33
trace_m15 db "pulse.collections.Deque.pollFirst"
trace_m15_len equ 33
trace_m16 db "pulse.collections.Deque.removeLast"
trace_m16_len equ 34
trace_m17 db "pulse.collections.Deque.getLast"
trace_m17_len equ 31
trace_m18 db "pulse.collections.Deque.peekLast"
trace_m18_len equ 32
trace_m19 db "pulse.collections.Deque.pollLast"
trace_m19_len equ 32
trace_m20 db "pulse.collections.Deque.removeFirstOccurrence"
trace_m20_len equ 45
trace_m21 db "pulse.collections.Deque.removeLastOccurrence"
trace_m21_len equ 44
trace_m22 db "pulse.collections.Deque.push"
trace_m22_len equ 28
trace_m23 db "pulse.collections.Deque.push"
trace_m23_len equ 28
trace_m24 db "pulse.collections.Deque.push"
trace_m24_len equ 28
trace_m25 db "pulse.collections.Deque.pop"
trace_m25_len equ 27

.code
pulsec_pulse_collections_Deque_addFirst__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_addFirst__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addFirst__Object_epilogue
pulsec_pulse_collections_Deque_addFirst__Object_epilogue:
pulsec_pulse_collections_Deque_addFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addFirst__Object endp

pulsec_pulse_collections_Deque_offerFirst__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_offerFirst__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerFirst__Object_epilogue
pulsec_pulse_collections_Deque_offerFirst__Object_epilogue:
pulsec_pulse_collections_Deque_offerFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerFirst__Object endp

pulsec_pulse_collections_Deque_addFirst__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Deque_addFirst__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addFirst__int_epilogue
pulsec_pulse_collections_Deque_addFirst__int_epilogue:
pulsec_pulse_collections_Deque_addFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addFirst__int endp

pulsec_pulse_collections_Deque_addFirst__String proc
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
pulsec_pulse_collections_Deque_addFirst__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addFirst__String_epilogue
pulsec_pulse_collections_Deque_addFirst__String_epilogue:
pulsec_pulse_collections_Deque_addFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addFirst__String endp

pulsec_pulse_collections_Deque_offerFirst__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Deque_offerFirst__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerFirst__int_epilogue
pulsec_pulse_collections_Deque_offerFirst__int_epilogue:
pulsec_pulse_collections_Deque_offerFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerFirst__int endp

pulsec_pulse_collections_Deque_offerFirst__String proc
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
pulsec_pulse_collections_Deque_offerFirst__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerFirst__String_epilogue
pulsec_pulse_collections_Deque_offerFirst__String_epilogue:
pulsec_pulse_collections_Deque_offerFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerFirst__String endp

pulsec_pulse_collections_Deque_addLast__Object proc
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
pulsec_pulse_collections_Deque_addLast__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addLast__Object_epilogue
pulsec_pulse_collections_Deque_addLast__Object_epilogue:
pulsec_pulse_collections_Deque_addLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addLast__Object endp

pulsec_pulse_collections_Deque_offerLast__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_offerLast__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerLast__Object_epilogue
pulsec_pulse_collections_Deque_offerLast__Object_epilogue:
pulsec_pulse_collections_Deque_offerLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerLast__Object endp

pulsec_pulse_collections_Deque_addLast__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Deque_addLast__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addLast__int_epilogue
pulsec_pulse_collections_Deque_addLast__int_epilogue:
pulsec_pulse_collections_Deque_addLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addLast__int endp

pulsec_pulse_collections_Deque_addLast__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_addLast__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_addLast__String_epilogue
pulsec_pulse_collections_Deque_addLast__String_epilogue:
pulsec_pulse_collections_Deque_addLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_addLast__String endp

pulsec_pulse_collections_Deque_offerLast__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Deque_offerLast__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerLast__int_epilogue
pulsec_pulse_collections_Deque_offerLast__int_epilogue:
pulsec_pulse_collections_Deque_offerLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerLast__int endp

pulsec_pulse_collections_Deque_offerLast__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_offerLast__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_offerLast__String_epilogue
pulsec_pulse_collections_Deque_offerLast__String_epilogue:
pulsec_pulse_collections_Deque_offerLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_offerLast__String endp

pulsec_pulse_collections_Deque_getFirst proc
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
pulsec_pulse_collections_Deque_getFirst_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_getFirst_epilogue
pulsec_pulse_collections_Deque_getFirst_epilogue:
pulsec_pulse_collections_Deque_getFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_getFirst endp

pulsec_pulse_collections_Deque_removeFirst proc
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
pulsec_pulse_collections_Deque_removeFirst_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_removeFirst_epilogue
pulsec_pulse_collections_Deque_removeFirst_epilogue:
pulsec_pulse_collections_Deque_removeFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_removeFirst endp

pulsec_pulse_collections_Deque_peekFirst proc
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
pulsec_pulse_collections_Deque_peekFirst_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_peekFirst_epilogue
pulsec_pulse_collections_Deque_peekFirst_epilogue:
pulsec_pulse_collections_Deque_peekFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_peekFirst endp

pulsec_pulse_collections_Deque_pollFirst proc
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
pulsec_pulse_collections_Deque_pollFirst_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_pollFirst_epilogue
pulsec_pulse_collections_Deque_pollFirst_epilogue:
pulsec_pulse_collections_Deque_pollFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_pollFirst endp

pulsec_pulse_collections_Deque_removeLast proc
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
pulsec_pulse_collections_Deque_removeLast_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_removeLast_epilogue
pulsec_pulse_collections_Deque_removeLast_epilogue:
pulsec_pulse_collections_Deque_removeLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_removeLast endp

pulsec_pulse_collections_Deque_getLast proc
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
pulsec_pulse_collections_Deque_getLast_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_getLast_epilogue
pulsec_pulse_collections_Deque_getLast_epilogue:
pulsec_pulse_collections_Deque_getLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_getLast endp

pulsec_pulse_collections_Deque_peekLast proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m18
    mov edx, trace_m18_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_Deque_peekLast_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_peekLast_epilogue
pulsec_pulse_collections_Deque_peekLast_epilogue:
pulsec_pulse_collections_Deque_peekLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_peekLast endp

pulsec_pulse_collections_Deque_pollLast proc
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
pulsec_pulse_collections_Deque_pollLast_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_pollLast_epilogue
pulsec_pulse_collections_Deque_pollLast_epilogue:
pulsec_pulse_collections_Deque_pollLast_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_pollLast endp

pulsec_pulse_collections_Deque_removeFirstOccurrence__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_removeFirstOccurrence__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_removeFirstOccurrence__Object_epilogue
pulsec_pulse_collections_Deque_removeFirstOccurrence__Object_epilogue:
pulsec_pulse_collections_Deque_removeFirstOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_removeFirstOccurrence__Object endp

pulsec_pulse_collections_Deque_removeLastOccurrence__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_removeLastOccurrence__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_removeLastOccurrence__Object_epilogue
pulsec_pulse_collections_Deque_removeLastOccurrence__Object_epilogue:
pulsec_pulse_collections_Deque_removeLastOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_removeLastOccurrence__Object endp

pulsec_pulse_collections_Deque_push__Object proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_push__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_push__Object_epilogue
pulsec_pulse_collections_Deque_push__Object_epilogue:
pulsec_pulse_collections_Deque_push__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_push__Object endp

pulsec_pulse_collections_Deque_push__int proc
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
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_Deque_push__int_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_push__int_epilogue
pulsec_pulse_collections_Deque_push__int_epilogue:
pulsec_pulse_collections_Deque_push__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_push__int endp

pulsec_pulse_collections_Deque_push__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Deque_push__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_push__String_epilogue
pulsec_pulse_collections_Deque_push__String_epilogue:
pulsec_pulse_collections_Deque_push__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_push__String endp

pulsec_pulse_collections_Deque_pop proc
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
pulsec_pulse_collections_Deque_pop_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Deque_pop_epilogue
pulsec_pulse_collections_Deque_pop_epilogue:
pulsec_pulse_collections_Deque_pop_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_Deque_pop endp

end
