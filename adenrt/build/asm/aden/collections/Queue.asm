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
extrn adenc_rt_tracePush:proc
extrn adenc_rt_tracePop:proc
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


.data
written dq 0
adenc_objc_aden_collections_Queue dd 0
trace_m0 db "aden.collections.Queue.offer"
trace_m0_len equ 28
trace_m1 db "aden.collections.Queue.offer"
trace_m1_len equ 28
trace_m2 db "aden.collections.Queue.offer"
trace_m2_len equ 28
trace_m3 db "aden.collections.Queue.poll"
trace_m3_len equ 27
trace_m4 db "aden.collections.Queue.remove"
trace_m4_len equ 29
trace_m5 db "aden.collections.Queue.peek"
trace_m5_len equ 27
trace_m6 db "aden.collections.Queue.element"
trace_m6_len equ 30

.code
adenc_aden_collections_Queue_offer__Object proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Queue_offer__Object_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_offer__Object_epilogue
adenc_aden_collections_Queue_offer__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Queue_offer__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Queue_offer__Object endp

adenc_aden_collections_Queue_offer__int proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
adenc_aden_collections_Queue_offer__int_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_offer__int_epilogue
adenc_aden_collections_Queue_offer__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Queue_offer__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Queue_offer__int endp

adenc_aden_collections_Queue_offer__String proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Queue_offer__String_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_offer__String_epilogue
adenc_aden_collections_Queue_offer__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Queue_offer__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Queue_offer__String endp

adenc_aden_collections_Queue_poll proc
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
adenc_aden_collections_Queue_poll_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_poll_epilogue
adenc_aden_collections_Queue_poll_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Queue_poll_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Queue_poll endp

adenc_aden_collections_Queue_remove proc
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
adenc_aden_collections_Queue_remove_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_remove_epilogue
adenc_aden_collections_Queue_remove_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Queue_remove_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Queue_remove endp

adenc_aden_collections_Queue_peek proc
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
adenc_aden_collections_Queue_peek_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_peek_epilogue
adenc_aden_collections_Queue_peek_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Queue_peek_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Queue_peek endp

adenc_aden_collections_Queue_element proc
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
adenc_aden_collections_Queue_element_b0:
    xor eax, eax
    jmp adenc_aden_collections_Queue_element_epilogue
adenc_aden_collections_Queue_element_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Queue_element_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Queue_element endp

end
