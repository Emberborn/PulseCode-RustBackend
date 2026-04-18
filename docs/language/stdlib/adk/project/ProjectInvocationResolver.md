# adk.project.ProjectInvocationResolver

Kind: ``class``

Source: ``stdlib/src/adk/project/ProjectInvocationResolver.aden``

## Summary

Resolves compiler-facing check and test invocations from the current project surface.

## Declaration

```aden
public final class ProjectInvocationResolver
```

## Members

### ``public static CheckInvocation resolveCheckInvocation(``

Resolves one check invocation from the supplied start path and optional direct overrides.

### ``public static TestInvocation resolveTestInvocation(``

Resolves one test invocation from the supplied start path and optional source-root override.
