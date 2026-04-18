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
pulsec_objc_pulse_interop_NativeCallback3 dd 0
trace_m0 db "pulse.interop.NativeCallback3.invoke"
trace_m0_len equ 36

.code
pulsec_pulse_interop_NativeCallback3_invoke__long_long_long proc
    sub rsp, 216
    mov qword ptr [rsp+184], rcx
    mov qword ptr [rsp+192], rdx
    mov qword ptr [rsp+200], r8
    mov qword ptr [rsp+208], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+184]
    mov rdx, qword ptr [rsp+192]
    mov r8, qword ptr [rsp+200]
    mov r9, qword ptr [rsp+208]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
    mov qword ptr [rsp+80], r8
    mov qword ptr [rsp+88], r9
pulsec_pulse_interop_NativeCallback3_invoke__long_long_long_b0:
    xor eax, eax
    jmp pulsec_pulse_interop_NativeCallback3_invoke__long_long_long_epilogue
pulsec_pulse_interop_NativeCallback3_invoke__long_long_long_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
pulsec_pulse_interop_NativeCallback3_invoke__long_long_long_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 216
    ret
pulsec_pulse_interop_NativeCallback3_invoke__long_long_long endp

end
