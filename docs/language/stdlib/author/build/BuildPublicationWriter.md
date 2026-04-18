# author.build.BuildPublicationWriter

Kind: ``class``

Source: ``stdlib/src/author/build/BuildPublicationWriter.pulse``

## Summary

Writes build publication metadata onto the host filesystem.
This owns artifact stamp and shared launch descriptor shaping for author-build publication.

## Declaration

```pulse
public final class BuildPublicationWriter
```

## Members

### ``public static String artifactStamp(String packageName, String packageVersion, String profile)``

Returns the normalized artifact stamp used by published outputs.

### ``public static String artifactBaseName(String packageName, String packageVersion)``

Returns the normalized published base filename without the profile suffix.

### ``public static String writeSharedRuntimeLookupMetadata(``

Writes one shared runtime launch descriptor and returns the descriptor path on success.

### ``public static String writeArtifactStamp(``

Writes one artifact stamp file and returns the stamp path on success.

### ``public static String copyFile(String sourcePath, String destinationPath)``

Copies one published artifact file and returns the destination path on success.

### ``public static String copyRecursive(String sourcePath, String destinationPath)``

Copies one published artifact tree and returns the destination root on success.

### ``public static String copyRecursiveMatchingExtension(``

Copies one published artifact tree while keeping only files whose final extension matches.
Returns the destination root on success.

### ``public static boolean ensureLayoutRoots(``

Ensures the standard build materialization roots exist.

### ``public static String materializeBuildLayout(``

Materializes the build layout staging roots and copies emitted/scaffold inputs into them.
Returns the sanity root on success.

### ``public static BuildPublicationPlan resolvePublicationPlan(``

Resolves one published materialization plan from the current build/runtime artifact paths.

### ``public static String writeBuildConfigPlan(``

Writes the resolved build config plan JSON and returns the written path on success.

### ``public static BuildPublishedArtifact publishArtifacts(``

Publishes built artifacts into their resolved output layout and returns the effective paths.

### ``public static String finalizeBuildBridgeText(``

Finalizes the authored post-emit build flow and returns the published artifact plus config plan.
