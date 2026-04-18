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
extrn pulsec_rt_panic:proc
extrn pulsec_rt_dispatchNullReceiverPanic:proc
extrn pulsec_rt_dispatchInvalidTypePanic:proc
extrn pulsec_rt_objectNew:proc
extrn pulsec_rt_objectClassId:proc
extrn pulsec_rt_classIdInSet:proc
extrn pulsec_rt_arcRetain:proc
extrn pulsec_rt_arcRelease:proc
extrn rt_slot_capacity:dword
extrn rt_arc_refcounts_tbl:dword
extrn rt_arc_kinds_tbl:dword
extrn rt_arc_flags_tbl:dword
extrn pulsec_rt_tracePush:proc
extrn pulsec_rt_traceUpdateTop:proc
extrn pulsec_rt_tracePop:proc
extrn pulsec_pulse_collections_ArrayList_ArrayList:proc
extrn pulsec_pulse_collections_ArrayList_addAll__Collection:proc
extrn pulsec_pulse_collections_ArrayList_contains__Object:proc
extrn pulsec_pulse_collections_ArrayList_iterator:proc
extrn pulsec_pulse_collections_Collection_contains__Object:proc
extrn pulsec_pulse_collections_LinkedListIterator_LinkedListIterator__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListIterator_hasNext:proc
extrn pulsec_pulse_collections_LinkedListIterator_next:proc
extrn pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object:proc
extrn pulsec_pulse_collections_LinkedListNode_getIntValue:proc
extrn pulsec_pulse_collections_LinkedListNode_getNext:proc
extrn pulsec_pulse_collections_LinkedListNode_getPrevious:proc
extrn pulsec_pulse_collections_LinkedListNode_getValue:proc
extrn pulsec_pulse_collections_LinkedListNode_hasIntValue:proc
extrn pulsec_pulse_collections_LinkedListNode_setIntValue__int:proc
extrn pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode:proc
extrn pulsec_pulse_collections_LinkedListNode_setValue__Object:proc
extrn pulsec_pulse_lang_Integer_unboxBoxed__Integer:proc
extrn pulsec_pulse_lang_Iterable_iterator:proc
extrn pulsec_pulse_lang_Iterator_hasNext:proc
extrn pulsec_pulse_lang_Iterator_next:proc
extrn pulsec_pulse_lang_String_equals__Object:proc
extrn pulsec_pulse_lang_String_length:proc
extrn pulsec_pulse_lang_String_substring__int_int:proc
extrn pulsec_rt_panic:proc
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

public pulsec_fld_pulse_collections_LinkedList_first
public pulsec_fld_pulse_collections_LinkedList_first_heap_owned
public pulsec_fld_pulse_collections_LinkedList_last
public pulsec_fld_pulse_collections_LinkedList_last_heap_owned
public pulsec_fld_pulse_collections_LinkedList_count
public pulsec_fld_pulse_collections_LinkedList_count_heap_owned

.data
written dq 0
pulsec_objc_pulse_collections_LinkedList dd 0
pulsec_fcap_pulse_collections_LinkedList dd 63
pulsec_fld_pulse_collections_LinkedList_first_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_first dq pulsec_fld_pulse_collections_LinkedList_first_tbl
pulsec_fld_pulse_collections_LinkedList_first_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedList_last_tbl dq 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_last dq pulsec_fld_pulse_collections_LinkedList_last_tbl
pulsec_fld_pulse_collections_LinkedList_last_heap_owned dd 0
pulsec_fld_pulse_collections_LinkedList_count_tbl dd 64 dup(0)
pulsec_fld_pulse_collections_LinkedList_count dq pulsec_fld_pulse_collections_LinkedList_count_tbl
pulsec_fld_pulse_collections_LinkedList_count_heap_owned dd 0
trace_m0 db "pulse.collections.LinkedList.LinkedList"
trace_m0_len equ 39
pulsec_pulse_collections_LinkedList_LinkedList_trace_s0 db "pulse.collections.LinkedList.LinkedList(LinkedList.pulse:20)"
pulsec_pulse_collections_LinkedList_LinkedList_trace_s0_len equ 60
pulsec_pulse_collections_LinkedList_LinkedList_trace_s1 db "pulse.collections.LinkedList.LinkedList(LinkedList.pulse:21)"
pulsec_pulse_collections_LinkedList_LinkedList_trace_s1_len equ 60
pulsec_pulse_collections_LinkedList_LinkedList_trace_s2 db "pulse.collections.LinkedList.LinkedList(LinkedList.pulse:22)"
pulsec_pulse_collections_LinkedList_LinkedList_trace_s2_len equ 60
trace_m4 db "pulse.collections.LinkedList.size"
trace_m4_len equ 33
pulsec_pulse_collections_LinkedList_size_trace_s0 db "pulse.collections.LinkedList.size(LinkedList.pulse:29)"
pulsec_pulse_collections_LinkedList_size_trace_s0_len equ 54
trace_m6 db "pulse.collections.LinkedList.iterator"
trace_m6_len equ 37
pulsec_pulse_collections_LinkedList_iterator_trace_s0 db "pulse.collections.LinkedList.iterator(LinkedList.pulse:36)"
pulsec_pulse_collections_LinkedList_iterator_trace_s0_len equ 58
trace_m8 db "pulse.collections.LinkedList.isEmpty"
trace_m8_len equ 36
pulsec_pulse_collections_LinkedList_isEmpty_trace_s0 db "pulse.collections.LinkedList.isEmpty(LinkedList.pulse:43)"
pulsec_pulse_collections_LinkedList_isEmpty_trace_s0_len equ 57
trace_m10 db "pulse.collections.LinkedList.clear"
trace_m10_len equ 34
pulsec_pulse_collections_LinkedList_clear_trace_s0 db "pulse.collections.LinkedList.clear(LinkedList.pulse:50)"
pulsec_pulse_collections_LinkedList_clear_trace_s0_len equ 55
pulsec_pulse_collections_LinkedList_clear_trace_s1 db "pulse.collections.LinkedList.clear(LinkedList.pulse:51)"
pulsec_pulse_collections_LinkedList_clear_trace_s1_len equ 55
pulsec_pulse_collections_LinkedList_clear_trace_s2 db "pulse.collections.LinkedList.clear(LinkedList.pulse:52)"
pulsec_pulse_collections_LinkedList_clear_trace_s2_len equ 55
trace_m14 db "pulse.collections.LinkedList.valuesEqual"
trace_m14_len equ 40
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:59)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s1 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:60)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s1_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:62)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s3 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:63)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s3_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:65)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s5 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:66)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s5_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s6 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:67)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s6_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s7 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:68)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s7_len equ 61
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s8 db "pulse.collections.LinkedList.valuesEqual(LinkedList.pulse:70)"
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s8_len equ 61
trace_m24 db "pulse.collections.LinkedList.appendValue"
trace_m24_len equ 40
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s0 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:77)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:78)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s2 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:79)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s2_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s3 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:80)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s3_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s4 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:82)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s4_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s5 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:83)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s5_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s6 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:84)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s6_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s7 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:86)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s7_len equ 61
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s8 db "pulse.collections.LinkedList.appendValue(LinkedList.pulse:87)"
pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s8_len equ 61
trace_m34 db "pulse.collections.LinkedList.appendIntValue"
trace_m34_len equ 43
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s0 db "pulse.collections.LinkedList.appendIntValue(LinkedList.pulse:94)"
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s0_len equ 64
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s1 db "pulse.collections.LinkedList.appendIntValue(LinkedList.pulse:95)"
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s1_len equ 64
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2 db "pulse.collections.LinkedList.appendIntValue(LinkedList.pulse:96)"
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2_len equ 64
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s3 db "pulse.collections.LinkedList.appendIntValue(LinkedList.pulse:97)"
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s3_len equ 64
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s4 db "pulse.collections.LinkedList.appendIntValue(LinkedList.pulse:98)"
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s4_len equ 64
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 112, 112
    db 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 48, 48
    db 41
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s5_len equ 65
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 112, 112
    db 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 48, 49
    db 41
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s6_len equ 65
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s7 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 112, 112
    db 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 48, 50
    db 41
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s7_len equ 65
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s8 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 112, 112
    db 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 48, 52
    db 41
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s8_len equ 65
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s9 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 112, 112
    db 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 48, 53
    db 41
pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s9_len equ 65
trace_m45 db "pulse.collections.LinkedList.insertValue"
trace_m45_len equ 40
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:112)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s1 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:113)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s1_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s2 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:114)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s2_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:116)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s4 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:117)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s4_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s5 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:118)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s5_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s6 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:120)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s6_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s7 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:121)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s7_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s8 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:122)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s8_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s9 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:123)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s9_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s10 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:124)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s10_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:125)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s12 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:126)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s12_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s13 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:128)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s13_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s14 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:130)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s14_len equ 62
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s15 db "pulse.collections.LinkedList.insertValue(LinkedList.pulse:131)"
pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s15_len equ 62
trace_m62 db "pulse.collections.LinkedList.insertIntValue"
trace_m62_len equ 43
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 51, 56
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 51, 57
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s1_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 48
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s2_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 50
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 51
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s4_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 52
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s5_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 54
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s6_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s7 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 55
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s7_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s8 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 56
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s8_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s9 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 52, 57
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s9_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s10 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 48
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s10_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s11 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 49
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s11_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 50
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s13 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 51
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s13_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s14 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 53
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s14_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s15 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 55
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s15_len equ 65
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s16 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 105, 110, 115
    db 101, 114, 116, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 53, 56
    db 41
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s16_len equ 65
trace_m80 db "pulse.collections.LinkedList.replaceValue"
trace_m80_len equ 41
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s0 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:165)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s0_len equ 63
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:166)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1_len equ 63
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s2 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:167)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s2_len equ 63
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s3 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:169)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s3_len equ 63
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s4 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:170)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s4_len equ 63
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s5 db "pulse.collections.LinkedList.replaceValue(LinkedList.pulse:171)"
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s5_len equ 63
trace_m87 db "pulse.collections.LinkedList.replaceIntValue"
trace_m87_len equ 44
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 55
    db 56, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s0_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 55
    db 57, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 48, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s2_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 50, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s3_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 51, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 52, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s5_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 54, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s6_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s7 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 55, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s7_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s8 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 56
    db 57, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s8_len equ 66
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s9 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 112
    db 108, 97, 99, 101, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 49, 57
    db 48, 41
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s9_len equ 66
trace_m98 db "pulse.collections.LinkedList.findIndex"
trace_m98_len equ 38
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s0 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:197)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s0_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s1 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:198)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s1_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:199)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:200)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s4 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:201)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s4_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s5 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:203)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s5_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s6 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:204)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s6_len equ 60
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s7 db "pulse.collections.LinkedList.findIndex(LinkedList.pulse:206)"
pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s7_len equ 60
trace_m107 db "pulse.collections.LinkedList.findIntIndex"
trace_m107_len equ 41
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s0 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:213)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s0_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s1 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:214)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s1_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:215)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:216)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s4 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:217)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s4_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s5 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:219)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s5_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s6 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:220)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s6_len equ 63
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s7 db "pulse.collections.LinkedList.findIntIndex(LinkedList.pulse:222)"
pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s7_len equ 63
trace_m116 db "pulse.collections.LinkedList.findLastIndex"
trace_m116_len equ 42
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s0 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:229)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s0_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s1 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:230)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s1_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:231)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:232)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s4 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:233)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s4_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s5 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:235)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s5_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s6 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:236)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s6_len equ 64
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s7 db "pulse.collections.LinkedList.findLastIndex(LinkedList.pulse:238)"
pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s7_len equ 64
trace_m125 db "pulse.collections.LinkedList.findLastIntIndex"
trace_m125_len equ 45
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 52, 53, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s0_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 52, 54, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s1_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 52, 55, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 52, 56, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 52, 57, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s4_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 53, 49, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s5_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 53, 50, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s6_len equ 67
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s7 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 102, 105, 110
    db 100, 76, 97, 115, 116, 73, 110, 116, 73, 110, 100, 101, 120, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 50
    db 53, 52, 41
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s7_len equ 67
trace_m134 db "pulse.collections.LinkedList.unlinkNode"
trace_m134_len equ 39
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:261)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s1 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:262)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s1_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s2 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:264)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s2_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s3 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:265)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s3_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:266)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s5 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:267)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s5_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s6 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:269)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s6_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:271)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s8 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:272)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s8_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s9 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:274)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s9_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s10 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:276)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s10_len equ 61
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s11 db "pulse.collections.LinkedList.unlinkNode(LinkedList.pulse:277)"
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s11_len equ 61
trace_m147 db "pulse.collections.LinkedList.prependValue"
trace_m147_len equ 41
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s0 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:284)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s0_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:285)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s2 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:286)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s2_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s3 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:287)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s3_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s4 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:289)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s4_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s5 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:290)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s5_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s6 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:291)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s6_len equ 63
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s7 db "pulse.collections.LinkedList.prependValue(LinkedList.pulse:293)"
pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s7_len equ 63
trace_m156 db "pulse.collections.LinkedList.prependIntValue"
trace_m156_len equ 44
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 48, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s0_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 49, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s1_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 50, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 51, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s3_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 52, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s4_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 54, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s5_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 55, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s6_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s7 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 48
    db 56, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s7_len equ 66
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s8 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 114, 101
    db 112, 101, 110, 100, 73, 110, 116, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 49
    db 48, 41
pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s8_len equ 66
trace_m166 db "pulse.collections.LinkedList.copyStringValue"
trace_m166_len equ 44
pulsec_pulse_collections_LinkedList_copyStringValue__String_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 99, 111, 112
    db 121, 83, 116, 114, 105, 110, 103, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 49
    db 55, 41
pulsec_pulse_collections_LinkedList_copyStringValue__String_trace_s0_len equ 66
trace_m168 db "pulse.collections.LinkedList.addCopiedValue"
trace_m168_len equ 43
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 100, 100
    db 67, 111, 112, 105, 101, 100, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 50, 52
    db 41
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0_len equ 65
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 100, 100
    db 67, 111, 112, 105, 101, 100, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 50, 53
    db 41
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s1_len equ 65
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 100, 100
    db 67, 111, 112, 105, 101, 100, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 50, 55
    db 41
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2_len equ 65
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 100, 100
    db 67, 111, 112, 105, 101, 100, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 50, 56
    db 41
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s3_len equ 65
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 97, 100, 100
    db 67, 111, 112, 105, 101, 100, 86, 97, 108, 117, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108, 115, 101, 58, 51, 51, 48
    db 41
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s4_len equ 65
trace_m174 db "pulse.collections.LinkedList.nodeAt"
trace_m174_len equ 35
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:337)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s1 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:338)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s1_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s2 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:339)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s2_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s3 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:341)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s3_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s4 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:342)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s4_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:343)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s6 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:344)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s6_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s7 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:345)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s7_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:346)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s9 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:347)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s9_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s10 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:348)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s10_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s11 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:350)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s11_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s12 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:352)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s12_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s13 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:353)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s13_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:354)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s15 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:355)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s15_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s16 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:356)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s16_len equ 57
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s17 db "pulse.collections.LinkedList.nodeAt(LinkedList.pulse:358)"
pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s17_len equ 57
trace_m193 db "pulse.collections.LinkedList.add"
trace_m193_len equ 32
pulsec_pulse_collections_LinkedList_add__Object_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:365)"
pulsec_pulse_collections_LinkedList_add__Object_trace_s0_len equ 54
trace_m195 db "pulse.collections.LinkedList.add"
trace_m195_len equ 32
pulsec_pulse_collections_LinkedList_add__int_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:372)"
pulsec_pulse_collections_LinkedList_add__int_trace_s0_len equ 54
trace_m197 db "pulse.collections.LinkedList.add"
trace_m197_len equ 32
pulsec_pulse_collections_LinkedList_add__String_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:379)"
pulsec_pulse_collections_LinkedList_add__String_trace_s0_len equ 54
trace_m199 db "pulse.collections.LinkedList.addAll"
trace_m199_len equ 35
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:386)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s1 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:387)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s1_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s2 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:388)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s2_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s3 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:389)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s3_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:390)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:391)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s6 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:392)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s6_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s7 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:394)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s7_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:395)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s9 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:396)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s9_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s10 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:398)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s10_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s11 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:401)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s11_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s12 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:402)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s12_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s13 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:404)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s13_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s14 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:406)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s14_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s15 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:407)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s15_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:408)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:409)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s18 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:410)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s18_len equ 57
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s19 db "pulse.collections.LinkedList.addAll(LinkedList.pulse:413)"
pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s19_len equ 57
trace_m220 db "pulse.collections.LinkedList.containsAll"
trace_m220_len equ 40
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s0 db "pulse.collections.LinkedList.containsAll(LinkedList.pulse:420)"
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s0_len equ 62
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1 db "pulse.collections.LinkedList.containsAll(LinkedList.pulse:421)"
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1_len equ 62
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2 db "pulse.collections.LinkedList.containsAll(LinkedList.pulse:422)"
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2_len equ 62
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s3 db "pulse.collections.LinkedList.containsAll(LinkedList.pulse:423)"
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s3_len equ 62
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s4 db "pulse.collections.LinkedList.containsAll(LinkedList.pulse:426)"
pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s4_len equ 62
trace_m226 db "pulse.collections.LinkedList.removeAll"
trace_m226_len equ 38
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:433)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s1 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:434)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s1_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s2 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:435)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s2_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s3 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:436)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s3_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s4 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:438)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s4_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s5 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:439)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s5_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:440)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s7 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:441)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s7_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:442)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s9 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:443)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s9_len equ 60
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s10 db "pulse.collections.LinkedList.removeAll(LinkedList.pulse:446)"
pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s10_len equ 60
trace_m238 db "pulse.collections.LinkedList.retainAll"
trace_m238_len equ 38
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:453)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s1 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:454)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s1_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s2 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:456)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s2_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s3 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:457)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s3_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s4 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:459)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s4_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s5 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:460)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s5_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:461)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s7 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:462)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s7_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:463)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:464)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s10 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:465)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s10_len equ 60
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s11 db "pulse.collections.LinkedList.retainAll(LinkedList.pulse:469)"
pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s11_len equ 60
trace_m251 db "pulse.collections.LinkedList.add"
trace_m251_len equ 32
pulsec_pulse_collections_LinkedList_add__int_Object_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:476)"
pulsec_pulse_collections_LinkedList_add__int_Object_trace_s0_len equ 54
trace_m253 db "pulse.collections.LinkedList.add"
trace_m253_len equ 32
pulsec_pulse_collections_LinkedList_add__int_int_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:483)"
pulsec_pulse_collections_LinkedList_add__int_int_trace_s0_len equ 54
trace_m255 db "pulse.collections.LinkedList.add"
trace_m255_len equ 32
pulsec_pulse_collections_LinkedList_add__int_String_trace_s0 db "pulse.collections.LinkedList.add(LinkedList.pulse:490)"
pulsec_pulse_collections_LinkedList_add__int_String_trace_s0_len equ 54
trace_m257 db "pulse.collections.LinkedList.get"
trace_m257_len equ 32
pulsec_pulse_collections_LinkedList_get__int_trace_s0 db "pulse.collections.LinkedList.get(LinkedList.pulse:497)"
pulsec_pulse_collections_LinkedList_get__int_trace_s0_len equ 54
pulsec_pulse_collections_LinkedList_get__int_trace_s1 db "pulse.collections.LinkedList.get(LinkedList.pulse:498)"
pulsec_pulse_collections_LinkedList_get__int_trace_s1_len equ 54
pulsec_pulse_collections_LinkedList_get__int_trace_s2 db "pulse.collections.LinkedList.get(LinkedList.pulse:499)"
pulsec_pulse_collections_LinkedList_get__int_trace_s2_len equ 54
pulsec_pulse_collections_LinkedList_get__int_trace_s3 db "pulse.collections.LinkedList.get(LinkedList.pulse:501)"
pulsec_pulse_collections_LinkedList_get__int_trace_s3_len equ 54
trace_m262 db "pulse.collections.LinkedList.getInt"
trace_m262_len equ 35
pulsec_pulse_collections_LinkedList_getInt__int_trace_s0 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:508)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s1 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:509)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s1_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s2 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:510)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s2_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s3 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:512)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s3_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s4 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:513)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s4_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s5 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:515)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s5_len equ 57
pulsec_pulse_collections_LinkedList_getInt__int_trace_s6 db "pulse.collections.LinkedList.getInt(LinkedList.pulse:516)"
pulsec_pulse_collections_LinkedList_getInt__int_trace_s6_len equ 57
trace_m270 db "pulse.collections.LinkedList.getString"
trace_m270_len equ 38
pulsec_pulse_collections_LinkedList_getString__int_trace_s0 db "pulse.collections.LinkedList.getString(LinkedList.pulse:523)"
pulsec_pulse_collections_LinkedList_getString__int_trace_s0_len equ 60
pulsec_pulse_collections_LinkedList_getString__int_trace_s1 db "pulse.collections.LinkedList.getString(LinkedList.pulse:524)"
pulsec_pulse_collections_LinkedList_getString__int_trace_s1_len equ 60
pulsec_pulse_collections_LinkedList_getString__int_trace_s2 db "pulse.collections.LinkedList.getString(LinkedList.pulse:525)"
pulsec_pulse_collections_LinkedList_getString__int_trace_s2_len equ 60
pulsec_pulse_collections_LinkedList_getString__int_trace_s3 db "pulse.collections.LinkedList.getString(LinkedList.pulse:527)"
pulsec_pulse_collections_LinkedList_getString__int_trace_s3_len equ 60
trace_m275 db "pulse.collections.LinkedList.remove"
trace_m275_len equ 35
pulsec_pulse_collections_LinkedList_remove__int_trace_s0 db "pulse.collections.LinkedList.remove(LinkedList.pulse:534)"
pulsec_pulse_collections_LinkedList_remove__int_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_remove__int_trace_s1 db "pulse.collections.LinkedList.remove(LinkedList.pulse:535)"
pulsec_pulse_collections_LinkedList_remove__int_trace_s1_len equ 57
trace_m278 db "pulse.collections.LinkedList.remove"
trace_m278_len equ 35
pulsec_pulse_collections_LinkedList_remove__Object_trace_s0 db "pulse.collections.LinkedList.remove(LinkedList.pulse:542)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s1 db "pulse.collections.LinkedList.remove(LinkedList.pulse:543)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s1_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s2 db "pulse.collections.LinkedList.remove(LinkedList.pulse:544)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s2_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s3 db "pulse.collections.LinkedList.remove(LinkedList.pulse:545)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s3_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s4 db "pulse.collections.LinkedList.remove(LinkedList.pulse:546)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s4_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s5 db "pulse.collections.LinkedList.remove(LinkedList.pulse:548)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s5_len equ 57
pulsec_pulse_collections_LinkedList_remove__Object_trace_s6 db "pulse.collections.LinkedList.remove(LinkedList.pulse:550)"
pulsec_pulse_collections_LinkedList_remove__Object_trace_s6_len equ 57
trace_m286 db "pulse.collections.LinkedList.set"
trace_m286_len equ 32
pulsec_pulse_collections_LinkedList_set__int_Object_trace_s0 db "pulse.collections.LinkedList.set(LinkedList.pulse:557)"
pulsec_pulse_collections_LinkedList_set__int_Object_trace_s0_len equ 54
trace_m288 db "pulse.collections.LinkedList.set"
trace_m288_len equ 32
pulsec_pulse_collections_LinkedList_set__int_int_trace_s0 db "pulse.collections.LinkedList.set(LinkedList.pulse:564)"
pulsec_pulse_collections_LinkedList_set__int_int_trace_s0_len equ 54
trace_m290 db "pulse.collections.LinkedList.set"
trace_m290_len equ 32
pulsec_pulse_collections_LinkedList_set__int_String_trace_s0 db "pulse.collections.LinkedList.set(LinkedList.pulse:571)"
pulsec_pulse_collections_LinkedList_set__int_String_trace_s0_len equ 54
trace_m292 db "pulse.collections.LinkedList.contains"
trace_m292_len equ 37
pulsec_pulse_collections_LinkedList_contains__Object_trace_s0 db "pulse.collections.LinkedList.contains(LinkedList.pulse:578)"
pulsec_pulse_collections_LinkedList_contains__Object_trace_s0_len equ 59
trace_m294 db "pulse.collections.LinkedList.contains"
trace_m294_len equ 37
pulsec_pulse_collections_LinkedList_contains__int_trace_s0 db "pulse.collections.LinkedList.contains(LinkedList.pulse:585)"
pulsec_pulse_collections_LinkedList_contains__int_trace_s0_len equ 59
trace_m296 db "pulse.collections.LinkedList.contains"
trace_m296_len equ 37
pulsec_pulse_collections_LinkedList_contains__String_trace_s0 db "pulse.collections.LinkedList.contains(LinkedList.pulse:592)"
pulsec_pulse_collections_LinkedList_contains__String_trace_s0_len equ 59
trace_m298 db "pulse.collections.LinkedList.indexOf"
trace_m298_len equ 36
pulsec_pulse_collections_LinkedList_indexOf__Object_trace_s0 db "pulse.collections.LinkedList.indexOf(LinkedList.pulse:599)"
pulsec_pulse_collections_LinkedList_indexOf__Object_trace_s0_len equ 58
trace_m300 db "pulse.collections.LinkedList.indexOf"
trace_m300_len equ 36
pulsec_pulse_collections_LinkedList_indexOf__int_trace_s0 db "pulse.collections.LinkedList.indexOf(LinkedList.pulse:606)"
pulsec_pulse_collections_LinkedList_indexOf__int_trace_s0_len equ 58
trace_m302 db "pulse.collections.LinkedList.indexOf"
trace_m302_len equ 36
pulsec_pulse_collections_LinkedList_indexOf__String_trace_s0 db "pulse.collections.LinkedList.indexOf(LinkedList.pulse:613)"
pulsec_pulse_collections_LinkedList_indexOf__String_trace_s0_len equ 58
trace_m304 db "pulse.collections.LinkedList.lastIndexOf"
trace_m304_len equ 40
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_trace_s0 db "pulse.collections.LinkedList.lastIndexOf(LinkedList.pulse:620)"
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_trace_s0_len equ 62
trace_m306 db "pulse.collections.LinkedList.lastIndexOf"
trace_m306_len equ 40
pulsec_pulse_collections_LinkedList_lastIndexOf__int_trace_s0 db "pulse.collections.LinkedList.lastIndexOf(LinkedList.pulse:627)"
pulsec_pulse_collections_LinkedList_lastIndexOf__int_trace_s0_len equ 62
trace_m308 db "pulse.collections.LinkedList.lastIndexOf"
trace_m308_len equ 40
pulsec_pulse_collections_LinkedList_lastIndexOf__String_trace_s0 db "pulse.collections.LinkedList.lastIndexOf(LinkedList.pulse:634)"
pulsec_pulse_collections_LinkedList_lastIndexOf__String_trace_s0_len equ 62
trace_m310 db "pulse.collections.LinkedList.offer"
trace_m310_len equ 34
pulsec_pulse_collections_LinkedList_offer__Object_trace_s0 db "pulse.collections.LinkedList.offer(LinkedList.pulse:641)"
pulsec_pulse_collections_LinkedList_offer__Object_trace_s0_len equ 56
trace_m312 db "pulse.collections.LinkedList.offer"
trace_m312_len equ 34
pulsec_pulse_collections_LinkedList_offer__int_trace_s0 db "pulse.collections.LinkedList.offer(LinkedList.pulse:648)"
pulsec_pulse_collections_LinkedList_offer__int_trace_s0_len equ 56
trace_m314 db "pulse.collections.LinkedList.offer"
trace_m314_len equ 34
pulsec_pulse_collections_LinkedList_offer__String_trace_s0 db "pulse.collections.LinkedList.offer(LinkedList.pulse:654)"
pulsec_pulse_collections_LinkedList_offer__String_trace_s0_len equ 56
trace_m316 db "pulse.collections.LinkedList.poll"
trace_m316_len equ 33
pulsec_pulse_collections_LinkedList_poll_trace_s0 db "pulse.collections.LinkedList.poll(LinkedList.pulse:661)"
pulsec_pulse_collections_LinkedList_poll_trace_s0_len equ 55
pulsec_pulse_collections_LinkedList_poll_trace_s1 db "pulse.collections.LinkedList.poll(LinkedList.pulse:662)"
pulsec_pulse_collections_LinkedList_poll_trace_s1_len equ 55
pulsec_pulse_collections_LinkedList_poll_trace_s2 db "pulse.collections.LinkedList.poll(LinkedList.pulse:664)"
pulsec_pulse_collections_LinkedList_poll_trace_s2_len equ 55
trace_m320 db "pulse.collections.LinkedList.remove"
trace_m320_len equ 35
pulsec_pulse_collections_LinkedList_remove_trace_s0 db "pulse.collections.LinkedList.remove(LinkedList.pulse:671)"
pulsec_pulse_collections_LinkedList_remove_trace_s0_len equ 57
pulsec_pulse_collections_LinkedList_remove_trace_s1 db "pulse.collections.LinkedList.remove(LinkedList.pulse:672)"
pulsec_pulse_collections_LinkedList_remove_trace_s1_len equ 57
pulsec_pulse_collections_LinkedList_remove_trace_s2 db "pulse.collections.LinkedList.remove(LinkedList.pulse:673)"
pulsec_pulse_collections_LinkedList_remove_trace_s2_len equ 57
pulsec_pulse_collections_LinkedList_remove_trace_s3 db "pulse.collections.LinkedList.remove(LinkedList.pulse:675)"
pulsec_pulse_collections_LinkedList_remove_trace_s3_len equ 57
trace_m325 db "pulse.collections.LinkedList.peek"
trace_m325_len equ 33
pulsec_pulse_collections_LinkedList_peek_trace_s0 db "pulse.collections.LinkedList.peek(LinkedList.pulse:682)"
pulsec_pulse_collections_LinkedList_peek_trace_s0_len equ 55
pulsec_pulse_collections_LinkedList_peek_trace_s1 db "pulse.collections.LinkedList.peek(LinkedList.pulse:683)"
pulsec_pulse_collections_LinkedList_peek_trace_s1_len equ 55
pulsec_pulse_collections_LinkedList_peek_trace_s2 db "pulse.collections.LinkedList.peek(LinkedList.pulse:685)"
pulsec_pulse_collections_LinkedList_peek_trace_s2_len equ 55
trace_m329 db "pulse.collections.LinkedList.element"
trace_m329_len equ 36
pulsec_pulse_collections_LinkedList_element_trace_s0 db "pulse.collections.LinkedList.element(LinkedList.pulse:692)"
pulsec_pulse_collections_LinkedList_element_trace_s0_len equ 58
pulsec_pulse_collections_LinkedList_element_trace_s1 db "pulse.collections.LinkedList.element(LinkedList.pulse:693)"
pulsec_pulse_collections_LinkedList_element_trace_s1_len equ 58
pulsec_pulse_collections_LinkedList_element_trace_s2 db "pulse.collections.LinkedList.element(LinkedList.pulse:694)"
pulsec_pulse_collections_LinkedList_element_trace_s2_len equ 58
pulsec_pulse_collections_LinkedList_element_trace_s3 db "pulse.collections.LinkedList.element(LinkedList.pulse:696)"
pulsec_pulse_collections_LinkedList_element_trace_s3_len equ 58
trace_m334 db "pulse.collections.LinkedList.addFirst"
trace_m334_len equ 37
pulsec_pulse_collections_LinkedList_addFirst__Object_trace_s0 db "pulse.collections.LinkedList.addFirst(LinkedList.pulse:703)"
pulsec_pulse_collections_LinkedList_addFirst__Object_trace_s0_len equ 59
trace_m336 db "pulse.collections.LinkedList.offerFirst"
trace_m336_len equ 39
pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s0 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:710)"
pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s1 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:711)"
pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s1_len equ 61
trace_m339 db "pulse.collections.LinkedList.addFirst"
trace_m339_len equ 37
pulsec_pulse_collections_LinkedList_addFirst__int_trace_s0 db "pulse.collections.LinkedList.addFirst(LinkedList.pulse:718)"
pulsec_pulse_collections_LinkedList_addFirst__int_trace_s0_len equ 59
trace_m341 db "pulse.collections.LinkedList.addFirst"
trace_m341_len equ 37
pulsec_pulse_collections_LinkedList_addFirst__String_trace_s0 db "pulse.collections.LinkedList.addFirst(LinkedList.pulse:724)"
pulsec_pulse_collections_LinkedList_addFirst__String_trace_s0_len equ 59
trace_m343 db "pulse.collections.LinkedList.offerFirst"
trace_m343_len equ 39
pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s0 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:731)"
pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s1 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:732)"
pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s1_len equ 61
trace_m346 db "pulse.collections.LinkedList.offerFirst"
trace_m346_len equ 39
pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s0 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:738)"
pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s1 db "pulse.collections.LinkedList.offerFirst(LinkedList.pulse:739)"
pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s1_len equ 61
trace_m349 db "pulse.collections.LinkedList.addLast"
trace_m349_len equ 36
pulsec_pulse_collections_LinkedList_addLast__Object_trace_s0 db "pulse.collections.LinkedList.addLast(LinkedList.pulse:746)"
pulsec_pulse_collections_LinkedList_addLast__Object_trace_s0_len equ 58
trace_m351 db "pulse.collections.LinkedList.offerLast"
trace_m351_len equ 38
pulsec_pulse_collections_LinkedList_offerLast__Object_trace_s0 db "pulse.collections.LinkedList.offerLast(LinkedList.pulse:753)"
pulsec_pulse_collections_LinkedList_offerLast__Object_trace_s0_len equ 60
trace_m353 db "pulse.collections.LinkedList.addLast"
trace_m353_len equ 36
pulsec_pulse_collections_LinkedList_addLast__int_trace_s0 db "pulse.collections.LinkedList.addLast(LinkedList.pulse:760)"
pulsec_pulse_collections_LinkedList_addLast__int_trace_s0_len equ 58
trace_m355 db "pulse.collections.LinkedList.addLast"
trace_m355_len equ 36
pulsec_pulse_collections_LinkedList_addLast__String_trace_s0 db "pulse.collections.LinkedList.addLast(LinkedList.pulse:766)"
pulsec_pulse_collections_LinkedList_addLast__String_trace_s0_len equ 58
trace_m357 db "pulse.collections.LinkedList.offerLast"
trace_m357_len equ 38
pulsec_pulse_collections_LinkedList_offerLast__int_trace_s0 db "pulse.collections.LinkedList.offerLast(LinkedList.pulse:773)"
pulsec_pulse_collections_LinkedList_offerLast__int_trace_s0_len equ 60
trace_m359 db "pulse.collections.LinkedList.offerLast"
trace_m359_len equ 38
pulsec_pulse_collections_LinkedList_offerLast__String_trace_s0 db "pulse.collections.LinkedList.offerLast(LinkedList.pulse:779)"
pulsec_pulse_collections_LinkedList_offerLast__String_trace_s0_len equ 60
trace_m361 db "pulse.collections.LinkedList.getFirst"
trace_m361_len equ 37
pulsec_pulse_collections_LinkedList_getFirst_trace_s0 db "pulse.collections.LinkedList.getFirst(LinkedList.pulse:786)"
pulsec_pulse_collections_LinkedList_getFirst_trace_s0_len equ 59
pulsec_pulse_collections_LinkedList_getFirst_trace_s1 db "pulse.collections.LinkedList.getFirst(LinkedList.pulse:787)"
pulsec_pulse_collections_LinkedList_getFirst_trace_s1_len equ 59
pulsec_pulse_collections_LinkedList_getFirst_trace_s2 db "pulse.collections.LinkedList.getFirst(LinkedList.pulse:788)"
pulsec_pulse_collections_LinkedList_getFirst_trace_s2_len equ 59
pulsec_pulse_collections_LinkedList_getFirst_trace_s3 db "pulse.collections.LinkedList.getFirst(LinkedList.pulse:790)"
pulsec_pulse_collections_LinkedList_getFirst_trace_s3_len equ 59
trace_m366 db "pulse.collections.LinkedList.removeFirst"
trace_m366_len equ 40
pulsec_pulse_collections_LinkedList_removeFirst_trace_s0 db "pulse.collections.LinkedList.removeFirst(LinkedList.pulse:797)"
pulsec_pulse_collections_LinkedList_removeFirst_trace_s0_len equ 62
pulsec_pulse_collections_LinkedList_removeFirst_trace_s1 db "pulse.collections.LinkedList.removeFirst(LinkedList.pulse:798)"
pulsec_pulse_collections_LinkedList_removeFirst_trace_s1_len equ 62
pulsec_pulse_collections_LinkedList_removeFirst_trace_s2 db "pulse.collections.LinkedList.removeFirst(LinkedList.pulse:799)"
pulsec_pulse_collections_LinkedList_removeFirst_trace_s2_len equ 62
pulsec_pulse_collections_LinkedList_removeFirst_trace_s3 db "pulse.collections.LinkedList.removeFirst(LinkedList.pulse:801)"
pulsec_pulse_collections_LinkedList_removeFirst_trace_s3_len equ 62
trace_m371 db "pulse.collections.LinkedList.peekFirst"
trace_m371_len equ 38
pulsec_pulse_collections_LinkedList_peekFirst_trace_s0 db "pulse.collections.LinkedList.peekFirst(LinkedList.pulse:808)"
pulsec_pulse_collections_LinkedList_peekFirst_trace_s0_len equ 60
trace_m373 db "pulse.collections.LinkedList.pollFirst"
trace_m373_len equ 38
pulsec_pulse_collections_LinkedList_pollFirst_trace_s0 db "pulse.collections.LinkedList.pollFirst(LinkedList.pulse:815)"
pulsec_pulse_collections_LinkedList_pollFirst_trace_s0_len equ 60
trace_m375 db "pulse.collections.LinkedList.removeLast"
trace_m375_len equ 39
pulsec_pulse_collections_LinkedList_removeLast_trace_s0 db "pulse.collections.LinkedList.removeLast(LinkedList.pulse:822)"
pulsec_pulse_collections_LinkedList_removeLast_trace_s0_len equ 61
pulsec_pulse_collections_LinkedList_removeLast_trace_s1 db "pulse.collections.LinkedList.removeLast(LinkedList.pulse:823)"
pulsec_pulse_collections_LinkedList_removeLast_trace_s1_len equ 61
pulsec_pulse_collections_LinkedList_removeLast_trace_s2 db "pulse.collections.LinkedList.removeLast(LinkedList.pulse:824)"
pulsec_pulse_collections_LinkedList_removeLast_trace_s2_len equ 61
pulsec_pulse_collections_LinkedList_removeLast_trace_s3 db "pulse.collections.LinkedList.removeLast(LinkedList.pulse:826)"
pulsec_pulse_collections_LinkedList_removeLast_trace_s3_len equ 61
trace_m380 db "pulse.collections.LinkedList.getLast"
trace_m380_len equ 36
pulsec_pulse_collections_LinkedList_getLast_trace_s0 db "pulse.collections.LinkedList.getLast(LinkedList.pulse:833)"
pulsec_pulse_collections_LinkedList_getLast_trace_s0_len equ 58
pulsec_pulse_collections_LinkedList_getLast_trace_s1 db "pulse.collections.LinkedList.getLast(LinkedList.pulse:834)"
pulsec_pulse_collections_LinkedList_getLast_trace_s1_len equ 58
pulsec_pulse_collections_LinkedList_getLast_trace_s2 db "pulse.collections.LinkedList.getLast(LinkedList.pulse:835)"
pulsec_pulse_collections_LinkedList_getLast_trace_s2_len equ 58
pulsec_pulse_collections_LinkedList_getLast_trace_s3 db "pulse.collections.LinkedList.getLast(LinkedList.pulse:837)"
pulsec_pulse_collections_LinkedList_getLast_trace_s3_len equ 58
trace_m385 db "pulse.collections.LinkedList.peekLast"
trace_m385_len equ 37
pulsec_pulse_collections_LinkedList_peekLast_trace_s0 db "pulse.collections.LinkedList.peekLast(LinkedList.pulse:844)"
pulsec_pulse_collections_LinkedList_peekLast_trace_s0_len equ 59
pulsec_pulse_collections_LinkedList_peekLast_trace_s1 db "pulse.collections.LinkedList.peekLast(LinkedList.pulse:845)"
pulsec_pulse_collections_LinkedList_peekLast_trace_s1_len equ 59
pulsec_pulse_collections_LinkedList_peekLast_trace_s2 db "pulse.collections.LinkedList.peekLast(LinkedList.pulse:847)"
pulsec_pulse_collections_LinkedList_peekLast_trace_s2_len equ 59
trace_m389 db "pulse.collections.LinkedList.pollLast"
trace_m389_len equ 37
pulsec_pulse_collections_LinkedList_pollLast_trace_s0 db "pulse.collections.LinkedList.pollLast(LinkedList.pulse:854)"
pulsec_pulse_collections_LinkedList_pollLast_trace_s0_len equ 59
pulsec_pulse_collections_LinkedList_pollLast_trace_s1 db "pulse.collections.LinkedList.pollLast(LinkedList.pulse:855)"
pulsec_pulse_collections_LinkedList_pollLast_trace_s1_len equ 59
pulsec_pulse_collections_LinkedList_pollLast_trace_s2 db "pulse.collections.LinkedList.pollLast(LinkedList.pulse:857)"
pulsec_pulse_collections_LinkedList_pollLast_trace_s2_len equ 59
trace_m393 db "pulse.collections.LinkedList.removeFirstOccurrence"
trace_m393_len equ 50
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 70, 105, 114, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117
    db 108, 115, 101, 58, 56, 54, 52, 41
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_trace_s0_len equ 72
trace_m395 db "pulse.collections.LinkedList.removeLastOccurrence"
trace_m395_len equ 49
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s0 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 49, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s0_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 50, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 51, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s3 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 52, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s3_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s4 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 53, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s4_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s5 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 55, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s5_len equ 71
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s6 db 112, 117, 108, 115, 101, 46, 99, 111, 108, 108, 101, 99, 116, 105, 111, 110, 115, 46, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 114, 101, 109
    db 111, 118, 101, 76, 97, 115, 116, 79, 99, 99, 117, 114, 114, 101, 110, 99, 101, 40, 76, 105, 110, 107, 101, 100, 76, 105, 115, 116, 46, 112, 117, 108
    db 115, 101, 58, 56, 55, 57, 41
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s6_len equ 71
trace_m403 db "pulse.collections.LinkedList.push"
trace_m403_len equ 33
pulsec_pulse_collections_LinkedList_push__Object_trace_s0 db "pulse.collections.LinkedList.push(LinkedList.pulse:886)"
pulsec_pulse_collections_LinkedList_push__Object_trace_s0_len equ 55
trace_m405 db "pulse.collections.LinkedList.push"
trace_m405_len equ 33
pulsec_pulse_collections_LinkedList_push__int_trace_s0 db "pulse.collections.LinkedList.push(LinkedList.pulse:893)"
pulsec_pulse_collections_LinkedList_push__int_trace_s0_len equ 55
trace_m407 db "pulse.collections.LinkedList.push"
trace_m407_len equ 33
pulsec_pulse_collections_LinkedList_push__String_trace_s0 db "pulse.collections.LinkedList.push(LinkedList.pulse:899)"
pulsec_pulse_collections_LinkedList_push__String_trace_s0_len equ 55
trace_m409 db "pulse.collections.LinkedList.pop"
trace_m409_len equ 32
pulsec_pulse_collections_LinkedList_pop_trace_s0 db "pulse.collections.LinkedList.pop(LinkedList.pulse:906)"
pulsec_pulse_collections_LinkedList_pop_trace_s0_len equ 54
cidset_8 dd 35
cidset_9 dd 28
msg0 db "Invalid cast"
msg0_len equ 12
msg1 db "Invalid cast"
msg1_len equ 12
msg2 db "LinkedList index out of bounds"
msg2_len equ 30
msg3 db "LinkedList index out of bounds"
msg3_len equ 30
msg4 db "LinkedList value is not an int"
msg4_len equ 30
msg5 db "Invalid cast"
msg5_len equ 12
msg6 db "Invalid cast"
msg6_len equ 12
msg7 db "LinkedList index out of bounds"
msg7_len equ 30
msg8 db "Invalid cast"
msg8_len equ 12
msg9 db "LinkedList value is not an int"
msg9_len equ 30
msg10 db "Invalid cast"
msg10_len equ 12
msg11 db "Invalid cast"
msg11_len equ 12
msg12 db "Queue is empty"
msg12_len equ 14
msg13 db "Queue is empty"
msg13_len equ 14
msg14 db "Deque is empty"
msg14_len equ 14
msg15 db "Deque is empty"
msg15_len equ 14
msg16 db "Deque is empty"
msg16_len equ 14
msg17 db "Deque is empty"
msg17_len equ 14

.code
pulsec_fcap_pulse_collections_LinkedList_ensure proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok
    cmp ecx, dword ptr [pulsec_fcap_pulse_collections_LinkedList]
    jbe pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok
    sub rsp, 88
    mov qword ptr [rsp+40], rbx
    mov qword ptr [rsp+48], rsi
    mov qword ptr [rsp+56], rdi
    mov qword ptr [rsp+64], r12
    mov qword ptr [rsp+72], r13
    mov dword ptr [rsp+80], ecx
    mov eax, dword ptr [pulsec_fcap_pulse_collections_LinkedList]
    mov dword ptr [rsp+84], eax
    call GetProcessHeap
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_fail
    mov r13, rax
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_first_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_0_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_first], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_first_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 3
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_next
    mov rax, qword ptr [rbx+rsi*8]
    mov qword ptr [r12+rsi*8], rax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_last_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_1_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_last], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_last_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    add eax, 1
    shl eax, 2
    mov edx, eax
    mov rcx, r13
    mov r8d, edx
    mov edx, 8
    call HeapAlloc
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail
    mov r12, rax
    mov rbx, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    xor esi, esi
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_copy_loop:
    cmp esi, dword ptr [rsp+84]
    ja pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_next
    mov eax, dword ptr [rbx+rsi*4]
    mov dword ptr [r12+rsi*4], eax
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_next:
    add esi, 1
    jmp pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_copy_loop
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done:
    cmp dword ptr [pulsec_fld_pulse_collections_LinkedList_count_heap_owned], 0
    je pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit
    test rbx, rbx
    jz pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit
    mov rcx, r13
    xor edx, edx
    mov r8, rbx
    call HeapFree
pulsec_fcap_pulse_collections_LinkedList_ensure_field_2_done_commit:
    mov qword ptr [pulsec_fld_pulse_collections_LinkedList_count], r12
    mov dword ptr [pulsec_fld_pulse_collections_LinkedList_count_heap_owned], 1
    mov eax, dword ptr [rt_slot_capacity]
    mov dword ptr [pulsec_fcap_pulse_collections_LinkedList], eax
    mov rbx, qword ptr [rsp+40]
    mov rsi, qword ptr [rsp+48]
    mov rdi, qword ptr [rsp+56]
    mov r12, qword ptr [rsp+64]
    mov r13, qword ptr [rsp+72]
    add rsp, 88
pulsec_fcap_pulse_collections_LinkedList_ensure_done_ok:
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedList_ensure_alloc_fail:
pulsec_fcap_pulse_collections_LinkedList_ensure_fail:
    mov ecx, 1
    call ExitProcess
    xor eax, eax
    ret
pulsec_fcap_pulse_collections_LinkedList_ensure endp

pulsec_fcap_pulse_collections_LinkedList_arc_teardown proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_0_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rcx*8]
    mov qword ptr [r10+rcx*8], 0
    test rax, rax
    jz pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_1_skip
    mov rcx, rax
    call pulsec_rt_arcRelease
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_teardown_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_teardown endp
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    mov eax, dword ptr [r11+rcx*4]
    cmp eax, 4294967294
    jae pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip
    add eax, 1
    mov dword ptr [r11+rcx*4], eax
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_scan_edges endp
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges proc
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done
    sub rsp, 40
    mov dword ptr [rsp+32], ecx
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_0_skip:
    mov ecx, dword ptr [rsp+32]
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rcx, qword ptr [r10+rcx*8]
    test rcx, rcx
    jz pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    and ecx, 4294967295
    cmp ecx, 1
    jb pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    cmp ecx, dword ptr [rt_slot_capacity]
    ja pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_kinds_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_refcounts_tbl
    cmp dword ptr [r11+rcx*4], 0
    je pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    lea r11, rt_arc_flags_tbl
    cmp dword ptr [r11+rcx*4], 1
    jne pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip
    mov dword ptr [r11+rcx*4], 0
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_field_1_skip:
    add rsp, 40
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges_done:
    ret
pulsec_fcap_pulse_collections_LinkedList_arc_invalidate_edges endp
pulsec_pulse_collections_LinkedList_LinkedList proc
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
    mov rax, qword ptr [rsp+64]
    test rax, rax
    jne pulsec_pulse_collections_LinkedList_LinkedList_ctor_reuse
    mov ecx, 9
    call pulsec_rt_objectNew
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_fcap_pulse_collections_LinkedList_ensure
    mov rax, qword ptr [rsp+104]
    jmp pulsec_pulse_collections_LinkedList_LinkedList_ctor_ready
pulsec_pulse_collections_LinkedList_LinkedList_ctor_reuse:
    mov rax, qword ptr [rsp+64]
pulsec_pulse_collections_LinkedList_LinkedList_ctor_ready:
    mov rcx, rax
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_LinkedList_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    lea rcx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    lea rcx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_LinkedList_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    mov rax, qword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_LinkedList_epilogue
pulsec_pulse_collections_LinkedList_LinkedList_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_LinkedList_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_LinkedList endp

pulsec_pulse_collections_LinkedList_size proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m4
    mov edx, trace_m4_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_size_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_size_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_size_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    jmp pulsec_pulse_collections_LinkedList_size_epilogue
pulsec_pulse_collections_LinkedList_size_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_size_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_size endp

pulsec_pulse_collections_LinkedList_iterator proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m6
    mov edx, trace_m6_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_iterator_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_iterator_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_iterator_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+72], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rax, qword ptr [rsp+72]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListIterator_LinkedListIterator__LinkedListNode
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+112]
    jmp pulsec_pulse_collections_LinkedList_iterator_epilogue
pulsec_pulse_collections_LinkedList_iterator_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_iterator_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_iterator endp

pulsec_pulse_collections_LinkedList_isEmpty proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m8
    mov edx, trace_m8_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_isEmpty_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_isEmpty_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_isEmpty_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+72], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+72]
    cmp eax, edx
    sete al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_isEmpty_epilogue
pulsec_pulse_collections_LinkedList_isEmpty_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_isEmpty_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_isEmpty endp

pulsec_pulse_collections_LinkedList_clear proc
    sub rsp, 200
    mov qword ptr [rsp+168], rcx
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    lea rcx, trace_m10
    mov edx, trace_m10_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+168]
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_clear_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_clear_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_clear_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    lea rcx, pulsec_pulse_collections_LinkedList_clear_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_clear_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    lea rcx, pulsec_pulse_collections_LinkedList_clear_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_clear_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_clear_epilogue
pulsec_pulse_collections_LinkedList_clear_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_clear_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 200
    ret
pulsec_pulse_collections_LinkedList_clear endp

pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m14
    mov edx, trace_m14_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b1
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b2
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b3
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_valuesEqual_ternary_then_2_11
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+120], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    cmp rax, rdx
    sete al
    movzx eax, al
    jmp LinkedList_valuesEqual_ternary_done_2_11
LinkedList_valuesEqual_ternary_then_2_11:
    mov eax, 1
LinkedList_valuesEqual_ternary_done_2_11:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b4
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b5
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b6
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je LinkedList_valuesEqual_instof_4_15_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_instof_4_15_false
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_instof_4_15_true
LinkedList_valuesEqual_instof_4_15_false:
    xor eax, eax
    jmp LinkedList_valuesEqual_instof_4_15_done
LinkedList_valuesEqual_instof_4_15_true:
    mov eax, 1
LinkedList_valuesEqual_instof_4_15_done:
    test rax, rax
    jne LinkedList_valuesEqual_ternary_then_4_18
    mov eax, 0
    jmp LinkedList_valuesEqual_ternary_done_4_18
LinkedList_valuesEqual_ternary_then_4_18:
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je LinkedList_valuesEqual_instof_4_17_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_instof_4_17_false
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_instof_4_17_true
LinkedList_valuesEqual_instof_4_17_false:
    xor eax, eax
    jmp LinkedList_valuesEqual_instof_4_17_done
LinkedList_valuesEqual_instof_4_17_true:
    mov eax, 1
LinkedList_valuesEqual_instof_4_17_done:
LinkedList_valuesEqual_ternary_done_4_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b7
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b8
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    test rax, rax
    je LinkedList_valuesEqual_cast_5_20_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_cast_5_20_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_cast_5_20_ok
LinkedList_valuesEqual_cast_5_20_fail:
    lea rcx, msg0
    mov edx, msg0_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_5_20_done
LinkedList_valuesEqual_cast_5_20_null:
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_5_20_done
LinkedList_valuesEqual_cast_5_20_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_valuesEqual_cast_5_20_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    test rax, rax
    je LinkedList_valuesEqual_cast_6_22_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_valuesEqual_cast_6_22_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_valuesEqual_cast_6_22_ok
LinkedList_valuesEqual_cast_6_22_fail:
    lea rcx, msg1
    mov edx, msg1_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_6_22_done
LinkedList_valuesEqual_cast_6_22_null:
    xor eax, eax
    jmp LinkedList_valuesEqual_cast_6_22_done
LinkedList_valuesEqual_cast_6_22_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_valuesEqual_cast_6_22_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_lang_String_equals__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b9
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object endp

pulsec_pulse_collections_LinkedList_appendValue__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m24
    mov edx, trace_m24_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_appendValue__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_appendValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b2
pulsec_pulse_collections_LinkedList_appendValue__Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b3
pulsec_pulse_collections_LinkedList_appendValue__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_b3
pulsec_pulse_collections_LinkedList_appendValue__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_appendValue__Object_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue
pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_collections_LinkedList_appendValue__Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_appendValue__Object endp

pulsec_pulse_collections_LinkedList_appendIntValue__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m34
    mov edx, trace_m34_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_appendIntValue__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_appendIntValue__int_b1
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b2
pulsec_pulse_collections_LinkedList_appendIntValue__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b3
pulsec_pulse_collections_LinkedList_appendIntValue__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_b3
pulsec_pulse_collections_LinkedList_appendIntValue__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_appendIntValue__int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue
pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_collections_LinkedList_appendIntValue__int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_appendIntValue__int endp

pulsec_pulse_collections_LinkedList_insertValue__int_Object proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m45
    mov edx, trace_m45_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], rcx
    mov dword ptr [rsp+96], edx
    mov qword ptr [rsp+104], r8
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_insertValue_ternary_then_0_8
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp LinkedList_insertValue_ternary_done_0_8
LinkedList_insertValue_ternary_then_0_8:
    mov eax, 1
LinkedList_insertValue_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b1
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b2
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg2
    mov edx, msg2_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b3
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+128], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b4
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b5
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b6
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertValue__int_Object_b7
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b8
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s13
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s11_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9
pulsec_pulse_collections_LinkedList_insertValue__int_Object_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s15
    mov edx, pulsec_pulse_collections_LinkedList_insertValue__int_Object_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
pulsec_pulse_collections_LinkedList_insertValue__int_Object_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_insertValue__int_Object endp

pulsec_pulse_collections_LinkedList_insertIntValue__int_int proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m62
    mov edx, trace_m62_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+88], rcx
    mov dword ptr [rsp+96], edx
    mov dword ptr [rsp+104], r8d
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+112], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_insertIntValue_ternary_then_0_8
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp LinkedList_insertIntValue_ternary_done_0_8
LinkedList_insertIntValue_ternary_then_0_8:
    mov eax, 1
LinkedList_insertIntValue_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b1
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b2
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg3
    mov edx, msg3_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b3
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov dword ptr [rsp+128], eax
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b4
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b5
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b6
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov rcx, qword ptr [rsp+88]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+104]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov eax, dword ptr [rsp+152]
    mov edx, eax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+184]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+136]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b7
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b8
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s13
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+184], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+184]
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s12_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s15
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+152], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+152]
    mov rax, qword ptr [rsp+152]
    mov rdx, rax
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+248], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+248]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    lea rcx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s16
    mov edx, pulsec_pulse_collections_LinkedList_insertIntValue__int_int_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov edx, dword ptr [rsp+88]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
pulsec_pulse_collections_LinkedList_insertIntValue__int_int_epilogue_post:
    mov qword ptr [rsp+192], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+192]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_insertIntValue__int_int endp

pulsec_pulse_collections_LinkedList_replaceValue__int_Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m80
    mov edx, trace_m80_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+96], r8
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b1
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b2
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b3
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov qword ptr [rsp+168], rdx
    mov qword ptr [rsp+176], r8
    mov qword ptr [rsp+184], r9
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    mov rdx, qword ptr [rsp+168]
    mov r8, qword ptr [rsp+176]
    mov r9, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_setValue__Object
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    lea rcx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_replaceValue__int_Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_collections_LinkedList_replaceValue__int_Object_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_replaceValue__int_Object endp

pulsec_pulse_collections_LinkedList_replaceIntValue__int_int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m87
    mov edx, trace_m87_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov dword ptr [rsp+96], r8d
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b1
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b2
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b3
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b4
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b5
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b6
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg4
    mov edx, msg4_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+96]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+112], rax
    mov eax, dword ptr [rsp+112]
    mov edx, eax
    mov qword ptr [rsp+168], rdx
    mov qword ptr [rsp+176], r8
    mov qword ptr [rsp+184], r9
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    mov rdx, qword ptr [rsp+168]
    mov r8, qword ptr [rsp+176]
    mov r9, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_replaceIntValue__int_int endp

pulsec_pulse_collections_LinkedList_findIndex__Object proc
    sub rsp, 312
    mov qword ptr [rsp+280], rcx
    mov qword ptr [rsp+288], rdx
    mov qword ptr [rsp+296], r8
    mov qword ptr [rsp+304], r9
    lea rcx, trace_m98
    mov edx, trace_m98_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+280]
    mov rdx, qword ptr [rsp+288]
    mov r8, qword ptr [rsp+296]
    mov r9, qword ptr [rsp+304]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findIndex__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b1
pulsec_pulse_collections_LinkedList_findIndex__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIndex__Object_b2
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b3
pulsec_pulse_collections_LinkedList_findIndex__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_findIndex_ternary_then_3_18
    mov eax, 0
    jmp LinkedList_findIndex_ternary_done_3_18
LinkedList_findIndex_ternary_then_3_18:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+200], rax
    mov rcx, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+120]
    mov r8, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
LinkedList_findIndex_ternary_done_3_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIndex__Object_b4
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b5
pulsec_pulse_collections_LinkedList_findIndex__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findIndex__Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findIndex__Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b6
pulsec_pulse_collections_LinkedList_findIndex__Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+104], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findIndex__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIndex__Object_b1
pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_collections_LinkedList_findIndex__Object_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 312
    ret
pulsec_pulse_collections_LinkedList_findIndex__Object endp

pulsec_pulse_collections_LinkedList_findIntIndex__int proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m107
    mov edx, trace_m107_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findIntIndex__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findIntIndex__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIntIndex__int_b2
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b3
pulsec_pulse_collections_LinkedList_findIntIndex__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test rax, rax
    jne LinkedList_findIntIndex_ternary_then_3_15
    mov eax, 0
    jmp LinkedList_findIntIndex_ternary_done_3_15
LinkedList_findIntIndex_ternary_then_3_15:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+104], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    sete al
    movzx eax, al
LinkedList_findIntIndex_ternary_done_3_15:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findIntIndex__int_b4
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b5
pulsec_pulse_collections_LinkedList_findIntIndex__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findIntIndex__int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findIntIndex__int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b6
pulsec_pulse_collections_LinkedList_findIntIndex__int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findIntIndex__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_collections_LinkedList_findIntIndex__int_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_findIntIndex__int endp

pulsec_pulse_collections_LinkedList_findLastIndex__Object proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m116
    mov edx, trace_m116_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIndex__Object_b2
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b3
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_findLastIndex_ternary_then_3_21
    mov eax, 0
    jmp LinkedList_findLastIndex_ternary_done_3_21
LinkedList_findLastIndex_ternary_then_3_21:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    mov r8, rax
    mov rcx, qword ptr [rsp+80]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
LinkedList_findLastIndex_ternary_done_3_21:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIndex__Object_b4
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b5
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b6
pulsec_pulse_collections_LinkedList_findLastIndex__Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+112], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findLastIndex__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIndex__Object_b1
pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_collections_LinkedList_findLastIndex__Object_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 328
    ret
pulsec_pulse_collections_LinkedList_findLastIndex__Object endp

pulsec_pulse_collections_LinkedList_findLastIntIndex__int proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m125
    mov edx, trace_m125_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b2
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b3
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test rax, rax
    jne LinkedList_findLastIntIndex_ternary_then_3_18
    mov eax, 0
    jmp LinkedList_findLastIntIndex_ternary_done_3_18
LinkedList_findLastIntIndex_ternary_then_3_18:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov dword ptr [rsp+112], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    cmp eax, edx
    sete al
    movzx eax, al
LinkedList_findLastIntIndex_ternary_done_3_18:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b4
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b5
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    neg eax
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b6
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_findLastIntIndex__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_findLastIntIndex__int_b1
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
pulsec_pulse_collections_LinkedList_findLastIntIndex__int_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_findLastIntIndex__int endp

pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m134
    mov edx, trace_m134_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+80], rcx
    mov qword ptr [rsp+88], rdx
    mov qword ptr [rsp+64], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+96], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+96]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b1
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b2
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b3
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+104], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b4
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b5
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov qword ptr [rsp+184], rdx
    mov qword ptr [rsp+192], r8
    mov qword ptr [rsp+200], r9
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+112], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b7
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b8
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+168]
    mov qword ptr [rsp+128], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+128]
    mov rax, qword ptr [rsp+128]
    mov rdx, rax
    mov qword ptr [rsp+184], rdx
    mov qword ptr [rsp+192], r8
    mov qword ptr [rsp+200], r9
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+224], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+224]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    mov rdx, qword ptr [rsp+184]
    mov r8, qword ptr [rsp+192]
    mov r9, qword ptr [rsp+200]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s7_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+120], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    sub eax, edx
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    lea rcx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue:
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+168]
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode_epilogue_post:
    mov qword ptr [rsp+168], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+168]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode endp

pulsec_pulse_collections_LinkedList_prependValue__Object proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m147
    mov edx, trace_m147_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_prependValue__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_prependValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b2
pulsec_pulse_collections_LinkedList_prependValue__Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b3
pulsec_pulse_collections_LinkedList_prependValue__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_b3
pulsec_pulse_collections_LinkedList_prependValue__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_prependValue__Object_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue
pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_collections_LinkedList_prependValue__Object_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_prependValue__Object endp

pulsec_pulse_collections_LinkedList_prependIntValue__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m156
    mov edx, trace_m156_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_prependIntValue__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    xor ecx, ecx
    call pulsec_pulse_collections_LinkedListNode_LinkedListNode__Object
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+104], rax
    mov eax, dword ptr [rsp+104]
    mov edx, eax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_prependIntValue__int_b1
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b2
pulsec_pulse_collections_LinkedList_prependIntValue__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b3
pulsec_pulse_collections_LinkedList_prependIntValue__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setNext__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+104]
    mov rdx, rax
    mov qword ptr [rsp+160], rdx
    mov qword ptr [rsp+168], r8
    mov qword ptr [rsp+176], r9
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+144]
    mov rcx, rax
    mov rdx, qword ptr [rsp+160]
    mov r8, qword ptr [rsp+168]
    mov r9, qword ptr [rsp+176]
    call pulsec_pulse_collections_LinkedListNode_setPrevious__LinkedListNode
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov qword ptr [r10+rdx*8], rax
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_b3
pulsec_pulse_collections_LinkedList_prependIntValue__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_prependIntValue__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+96], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    add eax, edx
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov dword ptr [r10+rdx*4], eax
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue
pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
pulsec_pulse_collections_LinkedList_prependIntValue__int_epilogue_post:
    mov qword ptr [rsp+144], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+144]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_prependIntValue__int endp

pulsec_pulse_collections_LinkedList_copyStringValue__String proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m166
    mov edx, trace_m166_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_copyStringValue__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_copyStringValue__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_copyStringValue__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov eax, 0
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+176], rax
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    call pulsec_pulse_lang_String_length
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+176]
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov eax, dword ptr [rsp+88]
    mov r8d, eax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_lang_String_substring__int_int
    jmp pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue
pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_copyStringValue__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_copyStringValue__String endp

pulsec_pulse_collections_LinkedList_addCopiedValue__Object proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m168
    mov edx, trace_m168_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_instof_0_1_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_instof_0_1_false
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_instof_0_1_true
LinkedList_addCopiedValue_instof_0_1_false:
    xor eax, eax
    jmp LinkedList_addCopiedValue_instof_0_1_done
LinkedList_addCopiedValue_instof_0_1_true:
    mov eax, 1
LinkedList_addCopiedValue_instof_0_1_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b1
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b2
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_cast_1_7_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_cast_1_7_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_cast_1_7_ok
LinkedList_addCopiedValue_cast_1_7_fail:
    lea rcx, msg5
    mov edx, msg5_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_1_7_done
LinkedList_addCopiedValue_cast_1_7_null:
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_1_7_done
LinkedList_addCopiedValue_cast_1_7_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addCopiedValue_cast_1_7_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_copyStringValue__String
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+80], rax
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_addCopiedValue_vd1_9_null
    call pulsec_pulse_collections_LinkedList_add__String
    jmp LinkedList_addCopiedValue_vd1_9_done
LinkedList_addCopiedValue_vd1_9_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd1_9_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b3
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_instof_2_11_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_instof_2_11_false
    mov ecx, edx
    lea rdx, cidset_9
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_instof_2_11_true
LinkedList_addCopiedValue_instof_2_11_false:
    xor eax, eax
    jmp LinkedList_addCopiedValue_instof_2_11_done
LinkedList_addCopiedValue_instof_2_11_true:
    mov eax, 1
LinkedList_addCopiedValue_instof_2_11_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b4
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b5
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    test rax, rax
    je LinkedList_addCopiedValue_cast_3_17_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addCopiedValue_cast_3_17_fail
    mov ecx, edx
    lea rdx, cidset_9
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addCopiedValue_cast_3_17_ok
LinkedList_addCopiedValue_cast_3_17_fail:
    lea rcx, msg6
    mov edx, msg6_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_3_17_done
LinkedList_addCopiedValue_cast_3_17_null:
    xor eax, eax
    jmp LinkedList_addCopiedValue_cast_3_17_done
LinkedList_addCopiedValue_cast_3_17_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addCopiedValue_cast_3_17_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_pulse_lang_Integer_unboxBoxed__Integer
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_addCopiedValue_vd3_19_null
    call pulsec_pulse_collections_LinkedList_add__int
    jmp LinkedList_addCopiedValue_vd3_19_done
LinkedList_addCopiedValue_vd3_19_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd3_19_done:
    and rax, 0FFFFFFFFh
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b6
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_addCopiedValue__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_addCopiedValue_vd4_23_null
    call pulsec_pulse_collections_LinkedList_add__Object
    jmp LinkedList_addCopiedValue_vd4_23_done
LinkedList_addCopiedValue_vd4_23_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_addCopiedValue_vd4_23_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addCopiedValue__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_addCopiedValue__Object endp

pulsec_pulse_collections_LinkedList_nodeAt__int proc
    sub rsp, 328
    mov qword ptr [rsp+296], rcx
    mov qword ptr [rsp+304], rdx
    mov qword ptr [rsp+312], r8
    mov qword ptr [rsp+320], r9
    lea rcx, trace_m174
    mov edx, trace_m174_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+296]
    mov rdx, qword ptr [rsp+304]
    mov r8, qword ptr [rsp+312]
    mov r9, qword ptr [rsp+320]
    mov qword ptr [rsp+80], rcx
    mov dword ptr [rsp+88], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_nodeAt__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+96], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    cmp eax, edx
    setl al
    movzx eax, al
    test rax, rax
    jne LinkedList_nodeAt_ternary_then_0_8
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+104], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov edx, eax
    mov eax, dword ptr [rsp+104]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp LinkedList_nodeAt_ternary_done_0_8
LinkedList_nodeAt_ternary_then_0_8:
    mov eax, 1
LinkedList_nodeAt_ternary_done_0_8:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b1
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b2
pulsec_pulse_collections_LinkedList_nodeAt__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg7
    mov edx, msg7_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+208]
    mov qword ptr [rsp+168], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+168]
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+168]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b3
pulsec_pulse_collections_LinkedList_nodeAt__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    mov dword ptr [rsp+120], eax
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+112], eax
    mov eax, 2
    mov edx, eax
    mov eax, dword ptr [rsp+112]
    mov ecx, edx
    cdq
    idiv ecx
    mov edx, eax
    mov eax, dword ptr [rsp+120]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b4
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b5
pulsec_pulse_collections_LinkedList_nodeAt__int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b7
pulsec_pulse_collections_LinkedList_nodeAt__int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b6
pulsec_pulse_collections_LinkedList_nodeAt__int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s13
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+80]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b10
pulsec_pulse_collections_LinkedList_nodeAt__int_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+128], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+128]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b8
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b9
pulsec_pulse_collections_LinkedList_nodeAt__int_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+136], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    add eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b7
pulsec_pulse_collections_LinkedList_nodeAt__int_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_b10:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+152], eax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_nodeAt__int_b11
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b12
pulsec_pulse_collections_LinkedList_nodeAt__int_b11:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s15
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+216], rax
    mov rcx, qword ptr [rsp+216]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s16
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov dword ptr [rsp+160], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+160]
    sub eax, edx
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s14_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_b10
pulsec_pulse_collections_LinkedList_nodeAt__int_b12:
    lea rcx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s17
    mov edx, pulsec_pulse_collections_LinkedList_nodeAt__int_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue
pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue:
    mov qword ptr [rsp+208], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+208]
pulsec_pulse_collections_LinkedList_nodeAt__int_epilogue_post:
    mov qword ptr [rsp+208], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+208]
    add rsp, 328
    ret
pulsec_pulse_collections_LinkedList_nodeAt__int endp

pulsec_pulse_collections_LinkedList_add__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m193
    mov edx, trace_m193_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_add__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_add__Object_epilogue
pulsec_pulse_collections_LinkedList_add__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_add__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__Object endp

pulsec_pulse_collections_LinkedList_add__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m195
    mov edx, trace_m195_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_add__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    and rax, 0FFFFFFFFh
    jmp pulsec_pulse_collections_LinkedList_add__int_epilogue
pulsec_pulse_collections_LinkedList_add__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_add__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int endp

pulsec_pulse_collections_LinkedList_add__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m197
    mov edx, trace_m197_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_add__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_add__String_epilogue
pulsec_pulse_collections_LinkedList_add__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_add__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__String endp

pulsec_pulse_collections_LinkedList_addAll__Collection proc
    sub rsp, 360
    mov qword ptr [rsp+328], rcx
    mov qword ptr [rsp+336], rdx
    mov qword ptr [rsp+344], r8
    mov qword ptr [rsp+352], r9
    lea rcx, trace_m199
    mov edx, trace_m199_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+328]
    mov rdx, qword ptr [rsp+336]
    mov r8, qword ptr [rsp+344]
    mov r9, qword ptr [rsp+352]
    mov qword ptr [rsp+112], rcx
    mov qword ptr [rsp+120], rdx
    mov qword ptr [rsp+72], 0
    mov qword ptr [rsp+96], 0
    mov qword ptr [rsp+104], 0
pulsec_pulse_collections_LinkedList_addAll__Collection_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rax, qword ptr [rsp+128]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b2
pulsec_pulse_collections_LinkedList_addAll__Collection_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+112]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_count]
    mov eax, dword ptr [r10+rdx*4]
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+112]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b4
pulsec_pulse_collections_LinkedList_addAll__Collection_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b3
pulsec_pulse_collections_LinkedList_addAll__Collection_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s14
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s14_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s15
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s15_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    test rcx, rcx
    je LinkedList_addAll_vd15_51_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd15_51_type
    cmp eax, 6
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 8
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 9
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 12
    je LinkedList_addAll_vd15_51_assign_ok
    cmp eax, 13
    je LinkedList_addAll_vd15_51_assign_ok
    jmp LinkedList_addAll_vd15_51_type
LinkedList_addAll_vd15_51_assign_ok:
    cmp eax, 6
    je LinkedList_addAll_vd15_51_ovr0
    cmp eax, 9
    je LinkedList_addAll_vd15_51_ovr1
    jmp LinkedList_addAll_vd15_51_default
LinkedList_addAll_vd15_51_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd15_51_done
LinkedList_addAll_vd15_51_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd15_51_done:
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b13
pulsec_pulse_collections_LinkedList_addAll__Collection_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+136], eax
    mov eax, dword ptr [rsp+64]
    mov edx, eax
    mov eax, dword ptr [rsp+136]
    cmp eax, edx
    setl al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b6
pulsec_pulse_collections_LinkedList_addAll__Collection_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b7
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b8
pulsec_pulse_collections_LinkedList_addAll__Collection_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s13
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s13_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    mov dword ptr [rsp+152], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+152]
    cmp eax, edx
    setg al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_addAll__Collection_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+248], rax
    mov rcx, qword ptr [rsp+248]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov eax, dword ptr [rsp+160]
    mov edx, eax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_null
    call pulsec_pulse_collections_LinkedList_add__int
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_7_6_0_done:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b9
pulsec_pulse_collections_LinkedList_addAll__Collection_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+104], rax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    test rax, rax
    je LinkedList_addAll_instof_8_24_false
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addAll_instof_8_24_false
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addAll_instof_8_24_true
LinkedList_addAll_instof_8_24_false:
    xor eax, eax
    jmp LinkedList_addAll_instof_8_24_done
LinkedList_addAll_instof_8_24_true:
    mov eax, 1
LinkedList_addAll_instof_8_24_done:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b10
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b11
pulsec_pulse_collections_LinkedList_addAll__Collection_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+192]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s12
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s12_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov dword ptr [rsp+144], eax
    mov eax, 1
    mov edx, eax
    mov eax, dword ptr [rsp+144]
    add eax, edx
    mov dword ptr [rsp+80], eax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b4
pulsec_pulse_collections_LinkedList_addAll__Collection_b10:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    test rax, rax
    je LinkedList_addAll_cast_9_30_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_addAll_cast_9_30_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_addAll_cast_9_30_ok
LinkedList_addAll_cast_9_30_fail:
    lea rcx, msg8
    mov edx, msg8_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_addAll_cast_9_30_done
LinkedList_addAll_cast_9_30_null:
    xor eax, eax
    jmp LinkedList_addAll_cast_9_30_done
LinkedList_addAll_cast_9_30_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_addAll_cast_9_30_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_collections_LinkedList_copyStringValue__String
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_null
    call pulsec_pulse_collections_LinkedList_add__String
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_10_9_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b12
pulsec_pulse_collections_LinkedList_addAll__Collection_b11:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov qword ptr [rsp+160], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+160]
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_null
    call pulsec_pulse_collections_LinkedList_add__Object
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_done
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_addAll__Collection_vd_stmt_11_10_0_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b12
pulsec_pulse_collections_LinkedList_addAll__Collection_b12:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s5_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b9
pulsec_pulse_collections_LinkedList_addAll__Collection_b13:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+208], rax
    mov rcx, qword ptr [rsp+208]
    test rcx, rcx
    je LinkedList_addAll_vd16_54_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd16_54_type
    cmp eax, 10
    je LinkedList_addAll_vd16_54_assign_ok
    jmp LinkedList_addAll_vd16_54_type
LinkedList_addAll_vd16_54_assign_ok:
    cmp eax, 10
    je LinkedList_addAll_vd16_54_ovr0
    jmp LinkedList_addAll_vd16_54_default
LinkedList_addAll_vd16_54_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd16_54_done
LinkedList_addAll_vd16_54_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd16_54_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b14
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b15
pulsec_pulse_collections_LinkedList_addAll__Collection_b14:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+248], rax
    mov rcx, qword ptr [rsp+248]
    test rcx, rcx
    je LinkedList_addAll_vd17_59_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_addAll_vd17_59_type
    cmp eax, 10
    je LinkedList_addAll_vd17_59_assign_ok
    jmp LinkedList_addAll_vd17_59_type
LinkedList_addAll_vd17_59_assign_ok:
    cmp eax, 10
    je LinkedList_addAll_vd17_59_ovr0
    jmp LinkedList_addAll_vd17_59_default
LinkedList_addAll_vd17_59_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_addAll_vd17_59_done
LinkedList_addAll_vd17_59_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_addAll_vd17_59_done:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+200]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov rdx, rax
    mov rcx, qword ptr [rsp+112]
    call pulsec_pulse_collections_LinkedList_addCopiedValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_addAll__Collection_b16
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b17
pulsec_pulse_collections_LinkedList_addAll__Collection_b15:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s19
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s19_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+88]
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_addAll__Collection_b16:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s18
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s18_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+88], eax
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s17_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b18
pulsec_pulse_collections_LinkedList_addAll__Collection_b17:
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b18
pulsec_pulse_collections_LinkedList_addAll__Collection_b18:
    lea rcx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16
    mov edx, pulsec_pulse_collections_LinkedList_addAll__Collection_trace_s16_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_addAll__Collection_b13
pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue:
    mov qword ptr [rsp+200], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+200]
pulsec_pulse_collections_LinkedList_addAll__Collection_epilogue_post:
    mov qword ptr [rsp+200], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+200]
    add rsp, 360
    ret
pulsec_pulse_collections_LinkedList_addAll__Collection endp

pulsec_pulse_collections_LinkedList_containsAll__Collection proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m220
    mov edx, trace_m220_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_containsAll__Collection_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je LinkedList_containsAll_vd0_2_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd0_2_type
    cmp eax, 6
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 8
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 9
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 12
    je LinkedList_containsAll_vd0_2_assign_ok
    cmp eax, 13
    je LinkedList_containsAll_vd0_2_assign_ok
    jmp LinkedList_containsAll_vd0_2_type
LinkedList_containsAll_vd0_2_assign_ok:
    cmp eax, 6
    je LinkedList_containsAll_vd0_2_ovr0
    cmp eax, 9
    je LinkedList_containsAll_vd0_2_ovr1
    jmp LinkedList_containsAll_vd0_2_default
LinkedList_containsAll_vd0_2_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd0_2_done
LinkedList_containsAll_vd0_2_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd0_2_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b1
pulsec_pulse_collections_LinkedList_containsAll__Collection_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rcx, qword ptr [rsp+136]
    test rcx, rcx
    je LinkedList_containsAll_vd1_5_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd1_5_type
    cmp eax, 10
    je LinkedList_containsAll_vd1_5_assign_ok
    jmp LinkedList_containsAll_vd1_5_type
LinkedList_containsAll_vd1_5_assign_ok:
    cmp eax, 10
    je LinkedList_containsAll_vd1_5_ovr0
    jmp LinkedList_containsAll_vd1_5_default
LinkedList_containsAll_vd1_5_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd1_5_done
LinkedList_containsAll_vd1_5_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd1_5_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_containsAll__Collection_b2
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b3
pulsec_pulse_collections_LinkedList_containsAll__Collection_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+176], rax
    mov rcx, qword ptr [rsp+176]
    test rcx, rcx
    je LinkedList_containsAll_vd2_10_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_containsAll_vd2_10_type
    cmp eax, 10
    je LinkedList_containsAll_vd2_10_assign_ok
    jmp LinkedList_containsAll_vd2_10_type
LinkedList_containsAll_vd2_10_assign_ok:
    cmp eax, 10
    je LinkedList_containsAll_vd2_10_ovr0
    jmp LinkedList_containsAll_vd2_10_default
LinkedList_containsAll_vd2_10_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_containsAll_vd2_10_done
LinkedList_containsAll_vd2_10_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_containsAll_vd2_10_done:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    test rcx, rcx
    je LinkedList_containsAll_vd2_11_null
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp LinkedList_containsAll_vd2_11_done
LinkedList_containsAll_vd2_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_containsAll_vd2_11_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_containsAll__Collection_b4
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b5
pulsec_pulse_collections_LinkedList_containsAll__Collection_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_containsAll__Collection_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_containsAll__Collection_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b6
pulsec_pulse_collections_LinkedList_containsAll__Collection_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_containsAll__Collection_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_containsAll__Collection_b1
pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_containsAll__Collection_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_containsAll__Collection endp

pulsec_pulse_collections_LinkedList_removeAll__Collection proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m226
    mov edx, trace_m226_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+88], rcx
    mov qword ptr [rsp+96], rdx
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+72], 0
pulsec_pulse_collections_LinkedList_removeAll__Collection_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+104], rax
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b2
pulsec_pulse_collections_LinkedList_removeAll__Collection_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je LinkedList_removeAll_vd1_5_null
    call pulsec_pulse_collections_LinkedList_isEmpty
    jmp LinkedList_removeAll_vd1_5_done
LinkedList_removeAll_vd1_5_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeAll_vd1_5_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_null
    call pulsec_pulse_collections_LinkedList_clear
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_done
pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_removeAll__Collection_vd_stmt_1_2_2_done:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_removeAll__Collection_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b3
pulsec_pulse_collections_LinkedList_removeAll__Collection_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd5_14_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd5_14_type
    cmp eax, 6
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 8
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 9
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 12
    je LinkedList_removeAll_vd5_14_assign_ok
    cmp eax, 13
    je LinkedList_removeAll_vd5_14_assign_ok
    jmp LinkedList_removeAll_vd5_14_type
LinkedList_removeAll_vd5_14_assign_ok:
    cmp eax, 6
    je LinkedList_removeAll_vd5_14_ovr0
    cmp eax, 9
    je LinkedList_removeAll_vd5_14_ovr1
    jmp LinkedList_removeAll_vd5_14_default
LinkedList_removeAll_vd5_14_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterable_iterator
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd5_14_done
LinkedList_removeAll_vd5_14_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd5_14_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+72], rax
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b4
pulsec_pulse_collections_LinkedList_removeAll__Collection_b4:
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd6_17_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd6_17_type
    cmp eax, 10
    je LinkedList_removeAll_vd6_17_assign_ok
    jmp LinkedList_removeAll_vd6_17_type
LinkedList_removeAll_vd6_17_assign_ok:
    cmp eax, 10
    je LinkedList_removeAll_vd6_17_ovr0
    jmp LinkedList_removeAll_vd6_17_default
LinkedList_removeAll_vd6_17_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd6_17_done
LinkedList_removeAll_vd6_17_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd6_17_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b6
pulsec_pulse_collections_LinkedList_removeAll__Collection_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+160], rax
    mov rcx, qword ptr [rsp+160]
    test rcx, rcx
    je LinkedList_removeAll_vd7_20_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_removeAll_vd7_20_type
    cmp eax, 10
    je LinkedList_removeAll_vd7_20_assign_ok
    jmp LinkedList_removeAll_vd7_20_type
LinkedList_removeAll_vd7_20_assign_ok:
    cmp eax, 10
    je LinkedList_removeAll_vd7_20_ovr0
    jmp LinkedList_removeAll_vd7_20_default
LinkedList_removeAll_vd7_20_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_removeAll_vd7_20_done
LinkedList_removeAll_vd7_20_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_removeAll_vd7_20_done:
    mov qword ptr [rsp+144], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+144]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b7
pulsec_pulse_collections_LinkedList_removeAll__Collection_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+64]
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_removeAll__Collection_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+112], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+112]
    mov rax, qword ptr [rsp+112]
    mov rdx, rax
    mov rcx, qword ptr [rsp+88]
    test rcx, rcx
    je LinkedList_removeAll_vd8_24_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_removeAll_vd8_24_done
LinkedList_removeAll_vd8_24_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeAll_vd8_24_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+112]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeAll__Collection_b8
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b9
pulsec_pulse_collections_LinkedList_removeAll__Collection_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+64], eax
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b7
pulsec_pulse_collections_LinkedList_removeAll__Collection_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_removeAll__Collection_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeAll__Collection_b4
pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+72]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
pulsec_pulse_collections_LinkedList_removeAll__Collection_epilogue_post:
    mov qword ptr [rsp+152], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+152]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_removeAll__Collection endp

pulsec_pulse_collections_LinkedList_retainAll__Collection proc
    sub rsp, 280
    mov qword ptr [rsp+248], rcx
    mov qword ptr [rsp+256], rdx
    mov qword ptr [rsp+264], r8
    mov qword ptr [rsp+272], r9
    lea rcx, trace_m238
    mov edx, trace_m238_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+248]
    mov rdx, qword ptr [rsp+256]
    mov r8, qword ptr [rsp+264]
    mov r9, qword ptr [rsp+272]
    mov qword ptr [rsp+96], rcx
    mov qword ptr [rsp+104], rdx
    mov qword ptr [rsp+88], 0
    mov qword ptr [rsp+80], 0
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_retainAll__Collection_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+112]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b1
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b2
pulsec_pulse_collections_LinkedList_retainAll__Collection_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_retainAll__Collection_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b3
pulsec_pulse_collections_LinkedList_retainAll__Collection_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor ecx, ecx
    call pulsec_pulse_collections_ArrayList_ArrayList
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov qword ptr [rsp+176], rdx
    mov qword ptr [rsp+184], r8
    mov qword ptr [rsp+192], r9
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+216], rax
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+216]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+160]
    mov rcx, rax
    mov rdx, qword ptr [rsp+176]
    mov r8, qword ptr [rsp+184]
    mov r9, qword ptr [rsp+192]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_null
    call pulsec_pulse_collections_ArrayList_addAll__Collection
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_done
pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_retainAll__Collection_vd_stmt_3_3_2_done:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd5_12_null
    call pulsec_pulse_collections_ArrayList_iterator
    jmp LinkedList_retainAll_vd5_12_done
LinkedList_retainAll_vd5_12_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_retainAll_vd5_12_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+80], rax
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b4
pulsec_pulse_collections_LinkedList_retainAll__Collection_b4:
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd6_15_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd6_15_type
    cmp eax, 10
    je LinkedList_retainAll_vd6_15_assign_ok
    jmp LinkedList_retainAll_vd6_15_type
LinkedList_retainAll_vd6_15_assign_ok:
    cmp eax, 10
    je LinkedList_retainAll_vd6_15_ovr0
    jmp LinkedList_retainAll_vd6_15_default
LinkedList_retainAll_vd6_15_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_hasNext
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd6_15_done
LinkedList_retainAll_vd6_15_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd6_15_done:
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b5
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b6
pulsec_pulse_collections_LinkedList_retainAll__Collection_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s7
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s7_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+168], rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd7_18_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd7_18_type
    cmp eax, 10
    je LinkedList_retainAll_vd7_18_assign_ok
    jmp LinkedList_retainAll_vd7_18_type
LinkedList_retainAll_vd7_18_assign_ok:
    cmp eax, 10
    je LinkedList_retainAll_vd7_18_ovr0
    jmp LinkedList_retainAll_vd7_18_default
LinkedList_retainAll_vd7_18_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedListIterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_lang_Iterator_next
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd7_18_done
LinkedList_retainAll_vd7_18_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd7_18_done:
    mov qword ptr [rsp+152], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+152]
    mov qword ptr [rsp+88], rax
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+104]
    mov qword ptr [rsp+168], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+168]
    test rcx, rcx
    je LinkedList_retainAll_vd8_22_null
    sub rsp, 80
    mov qword ptr [rsp+40], rcx
    mov qword ptr [rsp+48], rdx
    mov qword ptr [rsp+56], r8
    mov qword ptr [rsp+64], r9
    call pulsec_rt_objectClassId
    test eax, eax
    jz LinkedList_retainAll_vd8_22_type
    cmp eax, 6
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 8
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 9
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 12
    je LinkedList_retainAll_vd8_22_assign_ok
    cmp eax, 13
    je LinkedList_retainAll_vd8_22_assign_ok
    jmp LinkedList_retainAll_vd8_22_type
LinkedList_retainAll_vd8_22_assign_ok:
    cmp eax, 6
    je LinkedList_retainAll_vd8_22_ovr0
    cmp eax, 9
    je LinkedList_retainAll_vd8_22_ovr1
    jmp LinkedList_retainAll_vd8_22_default
LinkedList_retainAll_vd8_22_ovr0:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_ArrayList_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_ovr1:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_LinkedList_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_default:
    mov rcx, qword ptr [rsp+40]
    mov rdx, qword ptr [rsp+48]
    mov r8, qword ptr [rsp+56]
    mov r9, qword ptr [rsp+64]
    add rsp, 80
    call pulsec_pulse_collections_Collection_contains__Object
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_null:
    call pulsec_rt_dispatchNullReceiverPanic
    jmp LinkedList_retainAll_vd8_22_done
LinkedList_retainAll_vd8_22_type:
    add rsp, 80
    call pulsec_rt_dispatchInvalidTypePanic
LinkedList_retainAll_vd8_22_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    test eax, eax
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b7
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b8
pulsec_pulse_collections_LinkedList_retainAll__Collection_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s11
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s11_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue
pulsec_pulse_collections_LinkedList_retainAll__Collection_b7:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+160]
    mov qword ptr [rsp+120], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+120]
    mov rax, qword ptr [rsp+120]
    mov rdx, rax
    mov rcx, qword ptr [rsp+96]
    test rcx, rcx
    je LinkedList_retainAll_vd9_27_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_retainAll_vd9_27_done
LinkedList_retainAll_vd9_27_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_retainAll_vd9_27_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+120]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_retainAll__Collection_b10
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b11
pulsec_pulse_collections_LinkedList_retainAll__Collection_b8:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b9
pulsec_pulse_collections_LinkedList_retainAll__Collection_b9:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s6_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b4
pulsec_pulse_collections_LinkedList_retainAll__Collection_b10:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s10
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s10_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    mov dword ptr [rsp+72], eax
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s9_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b12
pulsec_pulse_collections_LinkedList_retainAll__Collection_b11:
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b12
pulsec_pulse_collections_LinkedList_retainAll__Collection_b12:
    lea rcx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8
    mov edx, pulsec_pulse_collections_LinkedList_retainAll__Collection_trace_s8_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_retainAll__Collection_b9
pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue:
    mov qword ptr [rsp+160], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+160]
pulsec_pulse_collections_LinkedList_retainAll__Collection_epilogue_post:
    mov qword ptr [rsp+160], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+160]
    add rsp, 280
    ret
pulsec_pulse_collections_LinkedList_retainAll__Collection endp

pulsec_pulse_collections_LinkedList_add__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m251
    mov edx, trace_m251_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_add__int_Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__int_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__int_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_Object_epilogue
pulsec_pulse_collections_LinkedList_add__int_Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_add__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_Object endp

pulsec_pulse_collections_LinkedList_add__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m253
    mov edx, trace_m253_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_LinkedList_add__int_int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__int_int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertIntValue__int_int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_int_epilogue
pulsec_pulse_collections_LinkedList_add__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_add__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_int endp

pulsec_pulse_collections_LinkedList_add__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m255
    mov edx, trace_m255_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_add__int_String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_add__int_String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_add__int_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_insertValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_add__int_String_epilogue
pulsec_pulse_collections_LinkedList_add__int_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_add__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_add__int_String endp

pulsec_pulse_collections_LinkedList_get__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m257
    mov edx, trace_m257_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_get__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_get__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_get__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_get__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_get__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_get__int_b1
    jmp pulsec_pulse_collections_LinkedList_get__int_b2
pulsec_pulse_collections_LinkedList_get__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_get__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_get__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_get__int_epilogue
pulsec_pulse_collections_LinkedList_get__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_get__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_get__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_get__int_b3
pulsec_pulse_collections_LinkedList_get__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_get__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_get__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_get__int_epilogue
pulsec_pulse_collections_LinkedList_get__int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_collections_LinkedList_get__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_get__int endp

pulsec_pulse_collections_LinkedList_getInt__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m262
    mov edx, trace_m262_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_getInt__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getInt__int_b1
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b2
pulsec_pulse_collections_LinkedList_getInt__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b3
pulsec_pulse_collections_LinkedList_getInt__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getInt__int_b4
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b5
pulsec_pulse_collections_LinkedList_getInt__int_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getIntValue
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_getInt__int_b6
pulsec_pulse_collections_LinkedList_getInt__int_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s5_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg9
    mov edx, msg9_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_getInt__int_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_getInt__int_epilogue
pulsec_pulse_collections_LinkedList_getInt__int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_collections_LinkedList_getInt__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_getInt__int endp

pulsec_pulse_collections_LinkedList_getString__int proc
    sub rsp, 264
    mov qword ptr [rsp+232], rcx
    mov qword ptr [rsp+240], rdx
    mov qword ptr [rsp+248], r8
    mov qword ptr [rsp+256], r9
    lea rcx, trace_m270
    mov edx, trace_m270_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+232]
    mov rdx, qword ptr [rsp+240]
    mov r8, qword ptr [rsp+248]
    mov r9, qword ptr [rsp+256]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_getString__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_getString__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getString__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+96]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_getString__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getString__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getString__int_b1
    jmp pulsec_pulse_collections_LinkedList_getString__int_b2
pulsec_pulse_collections_LinkedList_getString__int_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_getString__int_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_getString__int_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getString__int_epilogue
pulsec_pulse_collections_LinkedList_getString__int_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_getString__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getString__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_getString__int_b3
pulsec_pulse_collections_LinkedList_getString__int_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_getString__int_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_getString__int_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getValue
    test rax, rax
    je LinkedList_getString_cast_3_11_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_getString_cast_3_11_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_getString_cast_3_11_ok
LinkedList_getString_cast_3_11_fail:
    lea rcx, msg10
    mov edx, msg10_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_getString_cast_3_11_done
LinkedList_getString_cast_3_11_null:
    xor eax, eax
    jmp LinkedList_getString_cast_3_11_done
LinkedList_getString_cast_3_11_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_getString_cast_3_11_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_getString__int_epilogue
pulsec_pulse_collections_LinkedList_getString__int_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_collections_LinkedList_getString__int_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 264
    ret
pulsec_pulse_collections_LinkedList_getString__int endp

pulsec_pulse_collections_LinkedList_remove__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m275
    mov edx, trace_m275_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+72], rcx
    mov dword ptr [rsp+80], edx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_remove__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_remove__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_nodeAt__int
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_remove__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_remove__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_LinkedList_remove__int_epilogue
pulsec_pulse_collections_LinkedList_remove__int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_remove__int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_remove__int endp

pulsec_pulse_collections_LinkedList_remove__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m278
    mov edx, trace_m278_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_remove__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b1
pulsec_pulse_collections_LinkedList_remove__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove__Object_b2
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b3
pulsec_pulse_collections_LinkedList_remove__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_remove_ternary_then_2_17
    mov eax, 0
    jmp LinkedList_remove_ternary_done_2_17
LinkedList_remove_ternary_then_2_17:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
LinkedList_remove_ternary_done_2_17:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove__Object_b4
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b5
pulsec_pulse_collections_LinkedList_remove__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_remove__Object_epilogue
pulsec_pulse_collections_LinkedList_remove__Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_remove__Object_epilogue
pulsec_pulse_collections_LinkedList_remove__Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b6
pulsec_pulse_collections_LinkedList_remove__Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getNext
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_remove__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_remove__Object_b1
pulsec_pulse_collections_LinkedList_remove__Object_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_collections_LinkedList_remove__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_remove__Object endp

pulsec_pulse_collections_LinkedList_set__int_Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m286
    mov edx, trace_m286_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_set__int_Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_set__int_Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_set__int_Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    jmp pulsec_pulse_collections_LinkedList_set__int_Object_epilogue
pulsec_pulse_collections_LinkedList_set__int_Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_set__int_Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_Object endp

pulsec_pulse_collections_LinkedList_set__int_int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m288
    mov edx, trace_m288_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov dword ptr [rsp+80], r8d
pulsec_pulse_collections_LinkedList_set__int_int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_set__int_int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_set__int_int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov eax, dword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+96], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov eax, dword ptr [rsp+96]
    mov r8d, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceIntValue__int_int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_set__int_int_epilogue
pulsec_pulse_collections_LinkedList_set__int_int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_set__int_int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_int endp

pulsec_pulse_collections_LinkedList_set__int_String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m290
    mov edx, trace_m290_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
    mov qword ptr [rsp+80], r8
pulsec_pulse_collections_LinkedList_set__int_String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_set__int_String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_set__int_String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+88]
    mov qword ptr [rsp+184], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+184]
    mov qword ptr [rsp+88], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rax, qword ptr [rsp+96]
    mov r8, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_replaceValue__int_Object
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    test rax, rax
    je LinkedList_set_cast_0_5_null
    mov qword ptr [rsp+40], rax
    mov rcx, rax
    call pulsec_rt_objectClassId
    mov edx, eax
    test edx, edx
    jz LinkedList_set_cast_0_5_fail
    mov ecx, edx
    lea rdx, cidset_8
    mov r8d, 1
    call pulsec_rt_classIdInSet
    test eax, eax
    jnz LinkedList_set_cast_0_5_ok
LinkedList_set_cast_0_5_fail:
    lea rcx, msg11
    mov edx, msg11_len
    call pulsec_rt_stringFromBytes
    mov rcx, rax
    call pulsec_rt_panic
    xor eax, eax
    jmp LinkedList_set_cast_0_5_done
LinkedList_set_cast_0_5_null:
    xor eax, eax
    jmp LinkedList_set_cast_0_5_done
LinkedList_set_cast_0_5_ok:
    mov rax, qword ptr [rsp+40]
LinkedList_set_cast_0_5_done:
    mov rcx, rax
    call pulsec_rt_arcRetain
    jmp pulsec_pulse_collections_LinkedList_set__int_String_epilogue
pulsec_pulse_collections_LinkedList_set__int_String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_set__int_String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_set__int_String endp

pulsec_pulse_collections_LinkedList_contains__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m292
    mov edx, trace_m292_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_contains__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_contains__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_contains__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+80], rax
    mov eax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__Object_epilogue
pulsec_pulse_collections_LinkedList_contains__Object_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_contains__Object_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__Object endp

pulsec_pulse_collections_LinkedList_contains__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m294
    mov edx, trace_m294_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_contains__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_contains__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_contains__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+88], rax
    mov eax, dword ptr [rsp+88]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIntIndex__int
    movsxd rax, eax
    mov dword ptr [rsp+80], eax
    mov eax, 0
    mov edx, eax
    mov eax, dword ptr [rsp+80]
    cmp eax, edx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__int_epilogue
pulsec_pulse_collections_LinkedList_contains__int_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_contains__int_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__int endp

pulsec_pulse_collections_LinkedList_contains__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m296
    mov edx, trace_m296_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_contains__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_contains__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_contains__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+88], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+88]
    mov rax, qword ptr [rsp+88]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+88]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+80], rax
    mov eax, 0
    mov rdx, rax
    mov rax, qword ptr [rsp+80]
    cmp rax, rdx
    setge al
    movzx eax, al
    jmp pulsec_pulse_collections_LinkedList_contains__String_epilogue
pulsec_pulse_collections_LinkedList_contains__String_epilogue:
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
pulsec_pulse_collections_LinkedList_contains__String_epilogue_post:
    mov qword ptr [rsp+128], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+128]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_contains__String endp

pulsec_pulse_collections_LinkedList_indexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m298
    mov edx, trace_m298_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_indexOf__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_indexOf__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_indexOf__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue
pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_indexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__Object endp

pulsec_pulse_collections_LinkedList_indexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m300
    mov edx, trace_m300_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_indexOf__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_indexOf__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_indexOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIntIndex__int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_indexOf__int_epilogue
pulsec_pulse_collections_LinkedList_indexOf__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_indexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__int endp

pulsec_pulse_collections_LinkedList_indexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m302
    mov edx, trace_m302_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_indexOf__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_indexOf__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_indexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_indexOf__String_epilogue
pulsec_pulse_collections_LinkedList_indexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_indexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_indexOf__String endp

pulsec_pulse_collections_LinkedList_lastIndexOf__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m304
    mov edx, trace_m304_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_lastIndexOf__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_lastIndexOf__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findLastIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_lastIndexOf__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__Object endp

pulsec_pulse_collections_LinkedList_lastIndexOf__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m306
    mov edx, trace_m306_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_lastIndexOf__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_lastIndexOf__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_lastIndexOf__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findLastIntIndex__int
    movsxd rax, eax
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_lastIndexOf__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__int endp

pulsec_pulse_collections_LinkedList_lastIndexOf__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m308
    mov edx, trace_m308_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_lastIndexOf__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_lastIndexOf__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_lastIndexOf__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_findLastIndex__Object
    movsxd rax, eax
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue
pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_lastIndexOf__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_lastIndexOf__String endp

pulsec_pulse_collections_LinkedList_offer__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m310
    mov edx, trace_m310_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offer__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offer__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offer__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offer__Object_epilogue
pulsec_pulse_collections_LinkedList_offer__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offer__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__Object endp

pulsec_pulse_collections_LinkedList_offer__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m312
    mov edx, trace_m312_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offer__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offer__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offer__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    and rax, 0FFFFFFFFh
    jmp pulsec_pulse_collections_LinkedList_offer__int_epilogue
pulsec_pulse_collections_LinkedList_offer__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offer__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__int endp

pulsec_pulse_collections_LinkedList_offer__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m314
    mov edx, trace_m314_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offer__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offer__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offer__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offer__String_epilogue
pulsec_pulse_collections_LinkedList_offer__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offer__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offer__String endp

pulsec_pulse_collections_LinkedList_poll proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m316
    mov edx, trace_m316_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_poll_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_poll_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_poll_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_poll_b1
    jmp pulsec_pulse_collections_LinkedList_poll_b2
pulsec_pulse_collections_LinkedList_poll_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_poll_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_poll_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_poll_epilogue
pulsec_pulse_collections_LinkedList_poll_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_poll_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_poll_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_poll_b3
pulsec_pulse_collections_LinkedList_poll_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_poll_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_poll_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_poll_epilogue
pulsec_pulse_collections_LinkedList_poll_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_poll_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_poll endp

pulsec_pulse_collections_LinkedList_remove proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m320
    mov edx, trace_m320_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_remove_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_remove_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_remove_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_remove_b1
    jmp pulsec_pulse_collections_LinkedList_remove_b2
pulsec_pulse_collections_LinkedList_remove_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_remove_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_remove_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg12
    mov edx, msg12_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_remove_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_remove_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_remove_epilogue
pulsec_pulse_collections_LinkedList_remove_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_remove_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_remove_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_remove_b3
pulsec_pulse_collections_LinkedList_remove_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_remove_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_remove_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_remove_vd3_11_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_remove_vd3_11_done
LinkedList_remove_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_remove_vd3_11_done:
    jmp pulsec_pulse_collections_LinkedList_remove_epilogue
pulsec_pulse_collections_LinkedList_remove_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_remove_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_remove endp

pulsec_pulse_collections_LinkedList_peek proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m325
    mov edx, trace_m325_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peek_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_peek_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_peek_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_peek_b1
    jmp pulsec_pulse_collections_LinkedList_peek_b2
pulsec_pulse_collections_LinkedList_peek_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_peek_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_peek_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_peek_epilogue
pulsec_pulse_collections_LinkedList_peek_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_peek_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_peek_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_peek_b3
pulsec_pulse_collections_LinkedList_peek_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_peek_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_peek_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_peek_epilogue
pulsec_pulse_collections_LinkedList_peek_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_peek_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_peek endp

pulsec_pulse_collections_LinkedList_element proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m329
    mov edx, trace_m329_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_element_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_element_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_element_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_element_b1
    jmp pulsec_pulse_collections_LinkedList_element_b2
pulsec_pulse_collections_LinkedList_element_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_element_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_element_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg13
    mov edx, msg13_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_element_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_element_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_element_epilogue
pulsec_pulse_collections_LinkedList_element_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_element_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_element_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_element_b3
pulsec_pulse_collections_LinkedList_element_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_element_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_element_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_element_epilogue
pulsec_pulse_collections_LinkedList_element_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_element_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_element endp

pulsec_pulse_collections_LinkedList_addFirst__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m334
    mov edx, trace_m334_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addFirst__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addFirst__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addFirst__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue
pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__Object endp

pulsec_pulse_collections_LinkedList_offerFirst__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m336
    mov edx, trace_m336_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerFirst__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerFirst__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__Object endp

pulsec_pulse_collections_LinkedList_addFirst__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m339
    mov edx, trace_m339_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_addFirst__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addFirst__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addFirst__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__int_epilogue
pulsec_pulse_collections_LinkedList_addFirst__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__int endp

pulsec_pulse_collections_LinkedList_addFirst__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m341
    mov edx, trace_m341_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addFirst__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addFirst__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addFirst__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addFirst__String_epilogue
pulsec_pulse_collections_LinkedList_addFirst__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addFirst__String endp

pulsec_pulse_collections_LinkedList_offerFirst__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m343
    mov edx, trace_m343_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offerFirst__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependIntValue__int
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__int_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerFirst__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__int endp

pulsec_pulse_collections_LinkedList_offerFirst__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m346
    mov edx, trace_m346_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerFirst__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_offerFirst__String_trace_s1_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue
pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerFirst__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerFirst__String endp

pulsec_pulse_collections_LinkedList_addLast__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m349
    mov edx, trace_m349_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addLast__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addLast__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addLast__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__Object_epilogue
pulsec_pulse_collections_LinkedList_addLast__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__Object endp

pulsec_pulse_collections_LinkedList_offerLast__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m351
    mov edx, trace_m351_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerLast__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerLast__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerLast__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue
pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerLast__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__Object endp

pulsec_pulse_collections_LinkedList_addLast__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m353
    mov edx, trace_m353_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_addLast__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addLast__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addLast__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__int_epilogue
pulsec_pulse_collections_LinkedList_addLast__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__int endp

pulsec_pulse_collections_LinkedList_addLast__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m355
    mov edx, trace_m355_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_addLast__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_addLast__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_addLast__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_addLast__String_epilogue
pulsec_pulse_collections_LinkedList_addLast__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_addLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_addLast__String endp

pulsec_pulse_collections_LinkedList_offerLast__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m357
    mov edx, trace_m357_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_offerLast__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerLast__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerLast__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendIntValue__int
    and rax, 0FFFFFFFFh
    jmp pulsec_pulse_collections_LinkedList_offerLast__int_epilogue
pulsec_pulse_collections_LinkedList_offerLast__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerLast__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__int endp

pulsec_pulse_collections_LinkedList_offerLast__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m359
    mov edx, trace_m359_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_offerLast__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_offerLast__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_offerLast__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_appendValue__Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_offerLast__String_epilogue
pulsec_pulse_collections_LinkedList_offerLast__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_offerLast__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_offerLast__String endp

pulsec_pulse_collections_LinkedList_getFirst proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m361
    mov edx, trace_m361_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_getFirst_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_getFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getFirst_b1
    jmp pulsec_pulse_collections_LinkedList_getFirst_b2
pulsec_pulse_collections_LinkedList_getFirst_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_getFirst_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getFirst_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg14
    mov edx, msg14_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_getFirst_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_getFirst_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getFirst_epilogue
pulsec_pulse_collections_LinkedList_getFirst_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_getFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_getFirst_b3
pulsec_pulse_collections_LinkedList_getFirst_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_getFirst_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_getFirst_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_getFirst_epilogue
pulsec_pulse_collections_LinkedList_getFirst_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_getFirst_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_getFirst endp

pulsec_pulse_collections_LinkedList_removeFirst proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m366
    mov edx, trace_m366_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_removeFirst_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_first]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeFirst_b1
    jmp pulsec_pulse_collections_LinkedList_removeFirst_b2
pulsec_pulse_collections_LinkedList_removeFirst_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg15
    mov edx, msg15_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_pulse_collections_LinkedList_removeFirst_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeFirst_b3
pulsec_pulse_collections_LinkedList_removeFirst_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_removeFirst_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_removeFirst_vd3_11_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_removeFirst_vd3_11_done
LinkedList_removeFirst_vd3_11_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeFirst_vd3_11_done:
    jmp pulsec_pulse_collections_LinkedList_removeFirst_epilogue
pulsec_pulse_collections_LinkedList_removeFirst_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_removeFirst_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeFirst endp

pulsec_pulse_collections_LinkedList_peekFirst proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m371
    mov edx, trace_m371_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peekFirst_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_peekFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_peekFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_peekFirst_vd0_2_null
    call pulsec_pulse_collections_LinkedList_peek
    jmp LinkedList_peekFirst_vd0_2_done
LinkedList_peekFirst_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_peekFirst_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_peekFirst_epilogue
pulsec_pulse_collections_LinkedList_peekFirst_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_peekFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_peekFirst endp

pulsec_pulse_collections_LinkedList_pollFirst proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m373
    mov edx, trace_m373_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pollFirst_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_pollFirst_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_pollFirst_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_pollFirst_vd0_2_null
    call pulsec_pulse_collections_LinkedList_poll
    jmp LinkedList_pollFirst_vd0_2_done
LinkedList_pollFirst_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_pollFirst_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_pollFirst_epilogue
pulsec_pulse_collections_LinkedList_pollFirst_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_pollFirst_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_pollFirst endp

pulsec_pulse_collections_LinkedList_removeLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m375
    mov edx, trace_m375_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_removeLast_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLast_b1
    jmp pulsec_pulse_collections_LinkedList_removeLast_b2
pulsec_pulse_collections_LinkedList_removeLast_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLast_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_removeLast_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg16
    mov edx, msg16_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_removeLast_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_removeLast_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_removeLast_epilogue
pulsec_pulse_collections_LinkedList_removeLast_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeLast_b3
pulsec_pulse_collections_LinkedList_removeLast_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLast_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_removeLast_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_removeLast_epilogue
pulsec_pulse_collections_LinkedList_removeLast_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_removeLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeLast endp

pulsec_pulse_collections_LinkedList_getLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m380
    mov edx, trace_m380_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_getLast_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_getLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_getLast_b1
    jmp pulsec_pulse_collections_LinkedList_getLast_b2
pulsec_pulse_collections_LinkedList_getLast_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_getLast_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_getLast_trace_s1_len
    call pulsec_rt_traceUpdateTop
    lea rcx, msg17
    mov edx, msg17_len
    call pulsec_rt_stringFromBytes
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_panic
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    lea rcx, pulsec_pulse_collections_LinkedList_getLast_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_getLast_trace_s2_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_getLast_epilogue
pulsec_pulse_collections_LinkedList_getLast_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_getLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_getLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_getLast_b3
pulsec_pulse_collections_LinkedList_getLast_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_getLast_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_getLast_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_getLast_epilogue
pulsec_pulse_collections_LinkedList_getLast_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_getLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_getLast endp

pulsec_pulse_collections_LinkedList_peekLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m385
    mov edx, trace_m385_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_peekLast_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_peekLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_peekLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_peekLast_b1
    jmp pulsec_pulse_collections_LinkedList_peekLast_b2
pulsec_pulse_collections_LinkedList_peekLast_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_peekLast_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_peekLast_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_peekLast_epilogue
pulsec_pulse_collections_LinkedList_peekLast_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_peekLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_peekLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_peekLast_b3
pulsec_pulse_collections_LinkedList_peekLast_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_peekLast_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_peekLast_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rcx, qword ptr [rsp+128]
    call pulsec_pulse_collections_LinkedListNode_getValue
    jmp pulsec_pulse_collections_LinkedList_peekLast_epilogue
pulsec_pulse_collections_LinkedList_peekLast_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_peekLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_peekLast endp

pulsec_pulse_collections_LinkedList_pollLast proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m389
    mov edx, trace_m389_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pollLast_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_pollLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_pollLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+72], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+72]
    cmp rax, rdx
    sete al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_pollLast_b1
    jmp pulsec_pulse_collections_LinkedList_pollLast_b2
pulsec_pulse_collections_LinkedList_pollLast_b1:
    lea rcx, pulsec_pulse_collections_LinkedList_pollLast_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_pollLast_trace_s1_len
    call pulsec_rt_traceUpdateTop
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_pollLast_epilogue
pulsec_pulse_collections_LinkedList_pollLast_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_pollLast_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_pollLast_trace_s0_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_pollLast_b3
pulsec_pulse_collections_LinkedList_pollLast_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_pollLast_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_pollLast_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+64]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_pollLast_epilogue
pulsec_pulse_collections_LinkedList_pollLast_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_pollLast_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_pollLast endp

pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m393
    mov edx, trace_m393_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_removeFirstOccurrence_vd0_3_null
    call pulsec_pulse_collections_LinkedList_remove__Object
    jmp LinkedList_removeFirstOccurrence_vd0_3_done
LinkedList_removeFirstOccurrence_vd0_3_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_removeFirstOccurrence_vd0_3_done:
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    jmp pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_removeFirstOccurrence__Object endp

pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object proc
    sub rsp, 296
    mov qword ptr [rsp+264], rcx
    mov qword ptr [rsp+272], rdx
    mov qword ptr [rsp+280], r8
    mov qword ptr [rsp+288], r9
    lea rcx, trace_m395
    mov edx, trace_m395_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+264]
    mov rdx, qword ptr [rsp+272]
    mov r8, qword ptr [rsp+280]
    mov r9, qword ptr [rsp+288]
    mov qword ptr [rsp+72], rcx
    mov qword ptr [rsp+80], rdx
    mov qword ptr [rsp+64], 0
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov edx, dword ptr [rsp+72]
    cmp edx, 4294967295
    jbe @F
    mov edx, 4294967295
@@:
    mov r10, qword ptr [pulsec_fld_pulse_collections_LinkedList_last]
    mov rax, qword ptr [r10+rdx*8]
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+88], rax
    xor eax, eax
    mov rdx, rax
    mov rax, qword ptr [rsp+88]
    cmp rax, rdx
    setne al
    movzx eax, al
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b2
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b3
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b2:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_hasIntValue
    and rax, 0FFFFFFFFh
    test eax, eax
    sete al
    movzx eax, al
    test rax, rax
    jne LinkedList_removeLastOccurrence_ternary_then_2_17
    mov eax, 0
    jmp LinkedList_removeLastOccurrence_ternary_done_2_17
LinkedList_removeLastOccurrence_ternary_then_2_17:
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+184], rax
    mov rcx, qword ptr [rsp+184]
    call pulsec_pulse_collections_LinkedListNode_getValue
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+96]
    mov qword ptr [rsp+192], rax
    mov rax, qword ptr [rsp+80]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+192]
    mov qword ptr [rsp+96], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+104], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+104]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rax, qword ptr [rsp+104]
    mov r8, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_valuesEqual__Object_Object
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+104]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
LinkedList_removeLastOccurrence_ternary_done_2_17:
    test eax, eax
    jne pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b4
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b5
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b3:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s6
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s6_len
    call pulsec_rt_traceUpdateTop
    mov eax, 0
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b4:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s3
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s3_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+136]
    mov qword ptr [rsp+96], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+96]
    mov rax, qword ptr [rsp+96]
    mov rdx, rax
    mov rcx, qword ptr [rsp+72]
    call pulsec_pulse_collections_LinkedList_unlinkNode__LinkedListNode
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+96]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s4
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s4_len
    call pulsec_rt_traceUpdateTop
    mov eax, 1
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b5:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s2_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b6
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b6:
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s5
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s5_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+64]
    mov qword ptr [rsp+144], rax
    mov rcx, qword ptr [rsp+144]
    call pulsec_pulse_collections_LinkedListNode_getPrevious
    mov qword ptr [rsp+128], rax
    mov rax, qword ptr [rsp+128]
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+128]
    mov qword ptr [rsp+64], rax
    lea rcx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1
    mov edx, pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_trace_s1_len
    call pulsec_rt_traceUpdateTop
    jmp pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_b1
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue:
    mov qword ptr [rsp+136], rax
    mov rax, qword ptr [rsp+64]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+136]
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object_epilogue_post:
    mov qword ptr [rsp+136], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+136]
    add rsp, 296
    ret
pulsec_pulse_collections_LinkedList_removeLastOccurrence__Object endp

pulsec_pulse_collections_LinkedList_push__Object proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m403
    mov edx, trace_m403_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_push__Object_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_push__Object_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_push__Object_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_LinkedList_addFirst__Object
    jmp pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_done
pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_push__Object_vd_stmt_0_0_0_done:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__Object_epilogue
pulsec_pulse_collections_LinkedList_push__Object_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_push__Object_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__Object endp

pulsec_pulse_collections_LinkedList_push__int proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m405
    mov edx, trace_m405_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov dword ptr [rsp+72], edx
pulsec_pulse_collections_LinkedList_push__int_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_push__int_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_push__int_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov eax, dword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    and rax, 0FFFFFFFFh
    mov qword ptr [rsp+80], rax
    mov eax, dword ptr [rsp+80]
    mov edx, eax
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_null
    call pulsec_pulse_collections_LinkedList_addFirst__int
    jmp pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_done
pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_null:
    call pulsec_rt_dispatchNullReceiverPanic
pulsec_pulse_collections_LinkedList_push__int_vd_stmt_0_0_0_done:
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__int_epilogue
pulsec_pulse_collections_LinkedList_push__int_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_push__int_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__int endp

pulsec_pulse_collections_LinkedList_push__String proc
    sub rsp, 248
    mov qword ptr [rsp+216], rcx
    mov qword ptr [rsp+224], rdx
    mov qword ptr [rsp+232], r8
    mov qword ptr [rsp+240], r9
    lea rcx, trace_m407
    mov edx, trace_m407_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+216]
    mov rdx, qword ptr [rsp+224]
    mov r8, qword ptr [rsp+232]
    mov r9, qword ptr [rsp+240]
    mov qword ptr [rsp+64], rcx
    mov qword ptr [rsp+72], rdx
pulsec_pulse_collections_LinkedList_push__String_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_push__String_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_push__String_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rax, qword ptr [rsp+72]
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
    mov qword ptr [rsp+80], rax
    mov rcx, rax
    call pulsec_rt_arcRetain
    mov rax, qword ptr [rsp+80]
    mov rax, qword ptr [rsp+80]
    mov rdx, rax
    mov rcx, qword ptr [rsp+64]
    call pulsec_pulse_collections_LinkedList_prependValue__Object
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+80]
    mov rcx, rax
    call pulsec_rt_arcRelease
    mov rax, qword ptr [rsp+120]
    xor eax, eax
    jmp pulsec_pulse_collections_LinkedList_push__String_epilogue
pulsec_pulse_collections_LinkedList_push__String_epilogue:
    mov qword ptr [rsp+120], rax
    mov rax, qword ptr [rsp+120]
pulsec_pulse_collections_LinkedList_push__String_epilogue_post:
    mov qword ptr [rsp+120], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+120]
    add rsp, 248
    ret
pulsec_pulse_collections_LinkedList_push__String endp

pulsec_pulse_collections_LinkedList_pop proc
    sub rsp, 232
    mov qword ptr [rsp+200], rcx
    mov qword ptr [rsp+208], rdx
    mov qword ptr [rsp+216], r8
    mov qword ptr [rsp+224], r9
    lea rcx, trace_m409
    mov edx, trace_m409_len
    call pulsec_rt_tracePush
    mov rcx, qword ptr [rsp+200]
    mov rdx, qword ptr [rsp+208]
    mov r8, qword ptr [rsp+216]
    mov r9, qword ptr [rsp+224]
    mov qword ptr [rsp+64], rcx
pulsec_pulse_collections_LinkedList_pop_b0:
    lea rcx, pulsec_pulse_collections_LinkedList_pop_trace_s0
    mov edx, pulsec_pulse_collections_LinkedList_pop_trace_s0_len
    call pulsec_rt_traceUpdateTop
    mov rcx, qword ptr [rsp+64]
    test rcx, rcx
    je LinkedList_pop_vd0_2_null
    call pulsec_pulse_collections_LinkedList_removeFirst
    jmp LinkedList_pop_vd0_2_done
LinkedList_pop_vd0_2_null:
    call pulsec_rt_dispatchNullReceiverPanic
LinkedList_pop_vd0_2_done:
    jmp pulsec_pulse_collections_LinkedList_pop_epilogue
pulsec_pulse_collections_LinkedList_pop_epilogue:
    mov qword ptr [rsp+112], rax
    mov rax, qword ptr [rsp+112]
pulsec_pulse_collections_LinkedList_pop_epilogue_post:
    mov qword ptr [rsp+112], rax
    call pulsec_rt_tracePop
    mov rax, qword ptr [rsp+112]
    add rsp, 232
    ret
pulsec_pulse_collections_LinkedList_pop endp

end
