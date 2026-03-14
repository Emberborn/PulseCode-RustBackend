option casemap:none
extrn ExitProcess:proc
extrn pulsec_rt_init:proc
extrn pulsec_app_stress_Main_main:proc

.code
mainCRTStartup proc
    sub rsp, 40
    call pulsec_rt_init
    call pulsec_app_stress_Main_main
    mov ecx, eax
    call ExitProcess
mainCRTStartup endp
end
