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
adenc_objc_aden_collections_Collection dd 0
trace_m0 db "aden.collections.Collection.size"
trace_m0_len equ 32
trace_m1 db "aden.collections.Collection.isEmpty"
trace_m1_len equ 35
trace_m2 db "aden.collections.Collection.clear"
trace_m2_len equ 33
trace_m3 db "aden.collections.Collection.add"
trace_m3_len equ 31
trace_m4 db "aden.collections.Collection.contains"
trace_m4_len equ 36
trace_m5 db "aden.collections.Collection.remove"
trace_m5_len equ 34
trace_m6 db "aden.collections.Collection.containsAll"
trace_m6_len equ 39
trace_m7 db "aden.collections.Collection.addAll"
trace_m7_len equ 34
trace_m8 db "aden.collections.Collection.removeAll"
trace_m8_len equ 37
trace_m9 db "aden.collections.Collection.retainAll"
trace_m9_len equ 37

.code
adenc_aden_collections_Collection_size proc
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
adenc_aden_collections_Collection_size_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_size_epilogue
adenc_aden_collections_Collection_size_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Collection_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Collection_size endp

adenc_aden_collections_Collection_isEmpty proc
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
adenc_aden_collections_Collection_isEmpty_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_isEmpty_epilogue
adenc_aden_collections_Collection_isEmpty_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Collection_isEmpty_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Collection_isEmpty endp

adenc_aden_collections_Collection_clear proc
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
adenc_aden_collections_Collection_clear_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_clear_epilogue
adenc_aden_collections_Collection_clear_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
adenc_aden_collections_Collection_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
adenc_aden_collections_Collection_clear endp

adenc_aden_collections_Collection_add__Object proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_add__Object_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_add__Object_epilogue
adenc_aden_collections_Collection_add__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_add__Object endp

adenc_aden_collections_Collection_contains__Object proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_contains__Object_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_contains__Object_epilogue
adenc_aden_collections_Collection_contains__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_contains__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_contains__Object endp

adenc_aden_collections_Collection_remove__Object proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_remove__Object_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_remove__Object_epilogue
adenc_aden_collections_Collection_remove__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_remove__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_remove__Object endp

adenc_aden_collections_Collection_containsAll__Collection proc
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
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_containsAll__Collection_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_containsAll__Collection_epilogue
adenc_aden_collections_Collection_containsAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_containsAll__Collection endp

adenc_aden_collections_Collection_addAll__Collection proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_addAll__Collection_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_addAll__Collection_epilogue
adenc_aden_collections_Collection_addAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_addAll__Collection endp

adenc_aden_collections_Collection_removeAll__Collection proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_removeAll__Collection_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_removeAll__Collection_epilogue
adenc_aden_collections_Collection_removeAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_removeAll__Collection endp

adenc_aden_collections_Collection_retainAll__Collection proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m9
    mov edx, trace_m9_len
    call adenc_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
adenc_aden_collections_Collection_retainAll__Collection_b0:
    xor eax, eax
    jmp adenc_aden_collections_Collection_retainAll__Collection_epilogue
adenc_aden_collections_Collection_retainAll__Collection_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
adenc_aden_collections_Collection_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+120], rax
    call adenc_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
adenc_aden_collections_Collection_retainAll__Collection endp

end
