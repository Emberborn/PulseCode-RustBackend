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
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_app_stress_SoakRunner_run__int:proc
extrn pulsec_pulse_lang_IO_println__String:proc
extrn pulsec_pulse_lang_IO_println__int:proc
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
pulsec_objc_app_stress_Main dd 0
trace_m0 db "app.stress.Main.main"
trace_m0_len equ 20
pulsec_app_stress_Main_main_trace_s0 db "app.stress.Main.main(Main.aden:7)"
pulsec_app_stress_Main_main_trace_s0_len equ 34
pulsec_app_stress_Main_main_trace_s1 db "app.stress.Main.main(Main.aden:8)"
pulsec_app_stress_Main_main_trace_s1_len equ 34
pulsec_app_stress_Main_main_trace_s2 db "app.stress.Main.main(Main.aden:9)"
pulsec_app_stress_Main_main_trace_s2_len equ 34
pulsec_app_stress_Main_main_trace_s3 db "app.stress.Main.main(Main.aden:10)"
pulsec_app_stress_Main_main_trace_s3_len equ 35
pulsec_app_stress_Main_main_trace_s4 db "app.stress.Main.main(Main.aden:11)"
pulsec_app_stress_Main_main_trace_s4_len equ 35
pulsec_app_stress_Main_main_trace_s5 db "app.stress.Main.main(Main.aden:13)"
pulsec_app_stress_Main_main_trace_s5_len equ 35
pulsec_app_stress_Main_main_trace_s6 db "app.stress.Main.main(Main.aden:14)"
pulsec_app_stress_Main_main_trace_s6_len equ 35
msg0 db "soak_ok"
msg0_len equ 7
msg1 db "soak_bad"
msg1_len equ 8

.code
pulsec_app_stress_Main_main proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m0
    mov edx, trace_m0_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], 0
pulsec_app_stress_Main_main_b0:
    lea rcx, pulsec_app_stress_Main_main_trace_s0
    mov edx, pulsec_app_stress_Main_main_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov ecx, 2
    call pulsec_rt_objectNew
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_app_stress_Main_main_trace_s1
    mov edx, pulsec_app_stress_Main_main_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov eax, 200
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je Main_main_vd1_4_null
    call pulsec_app_stress_SoakRunner_run__int
    jmp Main_main_vd1_4_done
Main_main_vd1_4_null:
    call pulsec_rt_dispatchNullReceiverPanic
Main_main_vd1_4_done:
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_app_stress_Main_main_trace_s2
    mov edx, pulsec_app_stress_Main_main_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+80], eax
    mov eax, 40415
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_app_stress_Main_main_b1
    jmp pulsec_app_stress_Main_main_b2
pulsec_app_stress_Main_main_b1:
    lea rcx, pulsec_app_stress_Main_main_trace_s3
    mov edx, pulsec_app_stress_Main_main_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_IO_println__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    lea rcx, pulsec_app_stress_Main_main_trace_s4
    mov edx, pulsec_app_stress_Main_main_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_stress_Main_main_trace_s2
    mov edx, pulsec_app_stress_Main_main_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_stress_Main_main_b3
pulsec_app_stress_Main_main_b2:
    lea rcx, pulsec_app_stress_Main_main_trace_s5
    mov edx, pulsec_app_stress_Main_main_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_pulse_lang_IO_println__String
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    lea rcx, pulsec_app_stress_Main_main_trace_s6
    mov edx, pulsec_app_stress_Main_main_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov eax, eax
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov ecx, eax
    call pulsec_pulse_lang_IO_println__int
    lea rcx, pulsec_app_stress_Main_main_trace_s2
    mov edx, pulsec_app_stress_Main_main_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_app_stress_Main_main_b3
pulsec_app_stress_Main_main_b3:
    xor eax, eax
    jmp pulsec_app_stress_Main_main_epilogue
pulsec_app_stress_Main_main_epilogue:
pulsec_app_stress_Main_main_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_app_stress_Main_main endp

end
