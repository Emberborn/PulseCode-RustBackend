# aden.util.Properties

Kind: ``class``

Source: ``stdlib/src/aden/util/Properties.aden``

## Summary

Lightweight string-to-string property bag for configuration-style flows.

## Declaration

```aden
public final class Properties
```

## Members

### ``public Properties()``

Creates an empty property bag.
Use this for Java-like config assembly without dropping to raw maps.

### ``public int size()``

Returns the number of stored properties.

### ``public boolean isEmpty()``

Reports whether the property bag is empty.

### ``public void clear()``

Removes all stored properties.

### ``public String setProperty(String key, String value)``

Stores the supplied key/value pair and returns the prior value when present.

### ``public String getProperty(String key)``

Returns the value for the supplied key, or null when absent.

### ``public String getProperty(String key, String defaultValue)``

Returns the value for the supplied key, or the provided fallback when absent.

### ``public boolean containsKey(String key)``

Reports whether the supplied property key is present.

### ``public String remove(String key)``

Removes the supplied property and returns the prior value when present.

### ``public Set<String> propertyNames()``

Returns the current property keys.

### ``public String toString()``

Returns a Java-like debug string for the current property contents.
