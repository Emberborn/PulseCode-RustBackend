option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn pulsec_rt_stringFromBytes:proc
extrn pulsec_rt_consoleWrite:proc
extrn pulsec_rt_consoleWriteLine:proc
extrn pulsec_rt_intToString:proc
extrn pulsec_rt_booleanToString:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_rt_mapClear:proc
extrn pulsec_rt_mapContainsKey:proc
extrn pulsec_rt_mapGet:proc
extrn pulsec_rt_mapGetInt:proc
extrn pulsec_rt_mapNew:proc
extrn pulsec_rt_mapPut:proc
extrn pulsec_rt_mapPutInt:proc
extrn pulsec_rt_mapSize:proc

.data
written dq 0
pulsec_objc_com_pulse_collections_HashMap dd 0
pulsec_fld_com_pulse_collections_HashMap_handle dd 64 dup(0)
trace_m0 db "com.pulse.collections.HashMap.HashMap"
trace_m0_len equ $ - trace_m0
trace_m1 db "com.pulse.collections.HashMap.size"
trace_m1_len equ $ - trace_m1
trace_m2 db "com.pulse.collections.HashMap.clear"
trace_m2_len equ $ - trace_m2
trace_m3 db "com.pulse.collections.HashMap.containsKey"
trace_m3_len equ $ - trace_m3
trace_m4 db "com.pulse.collections.HashMap.put"
trace_m4_len equ $ - trace_m4
trace_m5 db "com.pulse.collections.HashMap.putInt"
trace_m5_len equ $ - trace_m5
trace_m6 db "com.pulse.collections.HashMap.get"
trace_m6_len equ $ - trace_m6
trace_m7 db "com.pulse.collections.HashMap.getInt"
trace_m7_len equ $ - trace_m7

.code
pulsec_com_pulse_collections_HashMap_HashMap proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
    mov eax, dword ptr [pulsec_objc_com_pulse_collections_HashMap]
    cmp eax, 63
    jae pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat
    add eax, 1
    jmp pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat_done
pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat:
    mov eax, 63
pulsec_com_pulse_collections_HashMap_HashMap_ctor_sat_done:
    mov dword ptr [pulsec_objc_com_pulse_collections_HashMap], eax
    mov ecx, eax
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_HashMap_b0:
    call pulsec_rt_mapNew
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov dword ptr [r10+rdx*4], eax
    mov eax, dword ptr [rsp+64]
    jmp pulsec_com_pulse_collections_HashMap_HashMap_epilogue
pulsec_com_pulse_collections_HashMap_HashMap_epilogue:
pulsec_com_pulse_collections_HashMap_HashMap_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_HashMap endp

pulsec_com_pulse_collections_HashMap_size proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m1
    mov edx, trace_m1_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_size_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapSize
    jmp pulsec_com_pulse_collections_HashMap_size_epilogue
pulsec_com_pulse_collections_HashMap_size_epilogue:
pulsec_com_pulse_collections_HashMap_size_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_size endp

pulsec_com_pulse_collections_HashMap_clear proc
    sub rsp, 120
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m2
    mov edx, trace_m2_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], ecx
pulsec_com_pulse_collections_HashMap_clear_b0:
    mov edx, dword ptr [rsp+64]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+72], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_mapClear
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_clear_epilogue
pulsec_com_pulse_collections_HashMap_clear_epilogue:
pulsec_com_pulse_collections_HashMap_clear_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 120
    ret
pulsec_com_pulse_collections_HashMap_clear endp

pulsec_com_pulse_collections_HashMap_containsKey__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m3
    mov edx, trace_m3_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_containsKey__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapContainsKey
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue
pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue:
pulsec_com_pulse_collections_HashMap_containsKey__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_containsKey__String endp

pulsec_com_pulse_collections_HashMap_put__String_String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_HashMap_put__String_String_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+104]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPut
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov eax, dword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_put__String_String_epilogue
pulsec_com_pulse_collections_HashMap_put__String_String_epilogue:
pulsec_com_pulse_collections_HashMap_put__String_String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_put__String_String endp

pulsec_com_pulse_collections_HashMap_putInt__String_int proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m5
    mov edx, trace_m5_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], r8d
    mov dword ptr [rsp+80], ecx
pulsec_com_pulse_collections_HashMap_putInt__String_int_b0:
    mov edx, dword ptr [rsp+80]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+96], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+96]
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    mov r8d, eax
    call pulsec_rt_mapPutInt
    mov qword ptr [rsp+128], rax
    mov eax, dword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue
pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue:
pulsec_com_pulse_collections_HashMap_putInt__String_int_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_putInt__String_int endp

pulsec_com_pulse_collections_HashMap_get__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_get__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGet
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_get__String_epilogue
pulsec_com_pulse_collections_HashMap_get__String_epilogue:
pulsec_com_pulse_collections_HashMap_get__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_get__String endp

pulsec_com_pulse_collections_HashMap_getInt__String proc
    sub rsp, 136
    mov qword ptr [rsp+8], rcx
    mov qword ptr [rsp+16], rdx
    mov qword ptr [rsp+24], r8
    mov qword ptr [rsp+32], r9
    lea rcx, trace_m7
    mov edx, trace_m7_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+8]
    mov rdx, qword ptr [rsp+16]
    mov r8, qword ptr [rsp+24]
    mov r9, qword ptr [rsp+32]
    mov dword ptr [rsp+64], edx
    mov dword ptr [rsp+72], ecx
pulsec_com_pulse_collections_HashMap_getInt__String_b0:
    mov edx, dword ptr [rsp+72]
    cmp edx, 63
    jbe @F
    mov edx, 63
@@:
    lea r10, pulsec_fld_com_pulse_collections_HashMap_handle
    mov eax, dword ptr [r10+rdx*4]
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+88], eax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov eax, dword ptr [rsp+88]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    call pulsec_rt_mapGetInt
    mov qword ptr [rsp+120], rax
    mov eax, dword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_com_pulse_collections_HashMap_getInt__String_epilogue
pulsec_com_pulse_collections_HashMap_getInt__String_epilogue:
pulsec_com_pulse_collections_HashMap_getInt__String_epilogue_post:
    mov qword ptr [rsp+40], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+40]
    add rsp, 136
    ret
pulsec_com_pulse_collections_HashMap_getInt__String endp

end
