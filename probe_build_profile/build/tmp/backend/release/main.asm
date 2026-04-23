option casemap:none
extrn GetStdHandle:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn ExitProcess:proc

extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc

extrn Sleep:proc
extrn SwitchToThread:proc
extrn GetCurrentThreadId:proc
extrn CreateThread:proc

.data
written dq 0
msg0 db 111, 107, 13, 10
msg0_len equ 4

.code
mainCRTStartup proc
    sub rsp, 40
    mov rcx, -11
    call GetStdHandle
    mov rbx, rax
    mov rcx, rbx
    lea rdx, msg0
    mov r8d, msg0_len
    lea r9, written
    mov qword ptr [rsp+32], 0
    call WriteFile
    xor ecx, ecx
    call ExitProcess
mainCRTStartup endp
end
