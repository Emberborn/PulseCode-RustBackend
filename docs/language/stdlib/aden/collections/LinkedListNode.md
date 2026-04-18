# aden.collections.LinkedListNode

Kind: ``class``

Source: ``stdlib/src/aden/collections/LinkedListNode.aden``

## Summary

Internal node used by the raw-object linked collection storage.

## Declaration

```aden
final class LinkedListNode
```

## Members

### ``public LinkedListNode(Object value)``

Creates one linked-list node carrying the supplied value.

### ``public Object getValue()``

Returns the value carried by this node.

### ``public void setValue(Object value)``

Replaces the value carried by this node.

### ``public boolean hasIntValue()``

Reports whether this node currently stores an int helper value.

### ``public int getIntValue()``

Returns the int helper value carried by this node.

### ``public void setIntValue(int value)``

Replaces the value carried by this node with an int helper value.

### ``public LinkedListNode getPrevious()``

Returns the previous node in the chain.

### ``public void setPrevious(LinkedListNode previous)``

Replaces the previous node link.

### ``public LinkedListNode getNext()``

Returns the next node in the chain.

### ``public void setNext(LinkedListNode next)``

Replaces the next node link.
