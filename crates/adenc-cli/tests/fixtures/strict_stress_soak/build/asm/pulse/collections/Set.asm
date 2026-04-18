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
pulsec_objc_pulse_collections_Set dd 0
trace_m0 db "pulse.collections.Set.remove"
trace_m0_len equ 28
trace_m1 db "pulse.collections.Set.add"
trace_m1_len equ 25
trace_m2 db "pulse.collections.Set.remove"
trace_m2_len equ 28
trace_m3 db "pulse.collections.Set.contains"
trace_m3_len equ 30

.code
pulsec_pulse_collections_Set_remove__Object proc
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
pulsec_pulse_collections_Set_remove__Object_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Set_remove__Object_epilogue
pulsec_pulse_collections_Set_remove__Object_epilogue:
pulsec_pulse_collections_Set_remove__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Set_remove__Object endp

pulsec_pulse_collections_Set_add__String proc
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
pulsec_pulse_collections_Set_add__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Set_add__String_epilogue
pulsec_pulse_collections_Set_add__String_epilogue:
pulsec_pulse_collections_Set_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Set_add__String endp

pulsec_pulse_collections_Set_remove__String proc
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
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_Set_remove__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Set_remove__String_epilogue
pulsec_pulse_collections_Set_remove__String_epilogue:
pulsec_pulse_collections_Set_remove__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Set_remove__String endp

pulsec_pulse_collections_Set_contains__String proc
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
pulsec_pulse_collections_Set_contains__String_b0:
    xor eax, eax
    jmp pulsec_pulse_collections_Set_contains__String_epilogue
pulsec_pulse_collections_Set_contains__String_epilogue:
pulsec_pulse_collections_Set_contains__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_Set_contains__String endp

end
