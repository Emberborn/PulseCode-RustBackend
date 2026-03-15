option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc

extrn GetSystemTimeAsFileTime:proc
extrn GetTickCount64:proc

.data
written dq 0
msg0 db 114, 117, 110, 116, 105, 109, 101, 95, 109, 105, 120, 95, 111, 107, 13, 10
msg0_len equ 16

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
