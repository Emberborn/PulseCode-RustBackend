option casemap:none
extrn ExitProcess:proc
extrn adenc_rt_init:proc
extrn adenc_rt_shutdown:proc
extrn adenc_adk_compiler_entry_Main_main:proc

.code
mainCRTStartup proc
    sub rsp, 40
    call adenc_rt_init
    call adenc_adk_compiler_entry_Main_main
    mov ecx, eax
    mov dword ptr [rsp+32], ecx
    call adenc_rt_shutdown
    mov ecx, dword ptr [rsp+32]
    call ExitProcess
mainCRTStartup endp

end
