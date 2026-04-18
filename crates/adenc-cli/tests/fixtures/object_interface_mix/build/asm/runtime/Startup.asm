option casemap:none
extrn ExitProcess:proc
extrn pulsec_rt_init:proc
extrn pulsec_rt_shutdown:proc
extrn pulsec_app_mixed_Main_main:proc

.code
mainCRTStartup proc
    sub rsp, 40
    call pulsec_rt_init
    call pulsec_app_mixed_Main_main
    mov ecx, eax
    mov dword ptr [rsp+32], ecx
    call pulsec_rt_shutdown
    mov ecx, dword ptr [rsp+32]
    call ExitProcess
mainCRTStartup endp

end
