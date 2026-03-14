option casemap:none
extrn GetStdHandle:proc
extrn WriteFile:proc
extrn ExitProcess:proc
extrn GetProcessHeap:proc
extrn HeapAlloc:proc
extrn HeapFree:proc
extrn pulsec_rt_consoleWrite:proc


.data
written dq 0
pulsec_objc_com_pulse_lang_Void dd 0

.code
end
