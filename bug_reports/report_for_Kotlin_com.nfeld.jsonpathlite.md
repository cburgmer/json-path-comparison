Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[:]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Index 0 out of bounds for length 0 -> [Help 1]
  org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Index 0 out of bounds for length 0
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Index 0 out of bounds for length 0
      at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
      at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
      at jdk.internal.util.Preconditions.outOfBounds (Preconditions.java:64)
      at jdk.internal.util.Preconditions.outOfBoundsCheckIndex (Preconditions.java:70)
      at jdk.internal.util.Preconditions.checkIndex (Preconditions.java:248)
      at java.util.Objects.checkIndex (Objects.java:372)
      at java.util.ArrayList.get (ArrayList.java:458)
      at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite (PathCompiler.kt:232)
      at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite (PathCompiler.kt:59)
      at com.nfeld.jsonpathlite.JsonPath.<init> (JsonPath.kt:17)
      at com.nfeld.jsonpathlite.extension.JSONArrayKt.read (JSONArray.kt:8)
      at com.nfeld.jsonpathlite.JsonArray.read (JsonResult.kt:12)
      at query.AppKt.main (App.kt:10)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
      at java.lang.Thread.run (Thread.java:834)
  [ERROR] 
  [ERROR] Re-run Maven using the -X switch to enable full debug logging.
  [ERROR] 
  [ERROR] For more information about the errors and possible solutions, please read the following articles:
  [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException
  ```

- [ ] `$[0:3:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Actual output:
  ```
  ["first", "second", "third"]
  ```

- [ ] `$['key','another']`
  Input:
  ```
  {"another": "entry", "key": "value"}
  ```
  Expected output:
  ```
  ["value", "entry"]
  ```
  Actual output:
  ```
  {"key": "value", "another": "entry"}
  ```

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  No JSON object could be decoded
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "price": 8.95, "title": "Sayings of the Century", "author": "Nigel Rees"}, {"category": "fiction", "price": 12.99, "title": "Sword of Honour", "author": "Evelyn Waugh"}, {"category": "fiction", "price": 8.99, "title": "Moby Dick", "isbn": "0-553-21311-3", "author": "Herman Melville"}, {"category": "fiction", "price": 22.99, "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "author": "J. R. R. Tolkien"}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [8.95, 12.99, 8.99, 22.99, 19.95]
  ```
  Actual output:
  ```
  [19.95, 8.95, 12.99, 8.99, 22.99]
  ```

- [ ] `$[*]`
  Input:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Unexpected char, char=*, index=2 -> [Help 1]
  org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Unexpected char, char=*, index=2
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Unexpected char, char=*, index=2
      at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
      at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
      at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite (PathCompiler.kt:198)
      at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite (PathCompiler.kt:59)
      at com.nfeld.jsonpathlite.JsonPath.<init> (JsonPath.kt:17)
      at com.nfeld.jsonpathlite.extension.JSONArrayKt.read (JSONArray.kt:8)
      at com.nfeld.jsonpathlite.JsonArray.read (JsonResult.kt:12)
      at query.AppKt.main (App.kt:10)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
      at java.lang.Thread.run (Thread.java:834)
  [ERROR] 
  [ERROR] Re-run Maven using the -X switch to enable full debug logging.
  [ERROR] 
  [ERROR] For more information about the errors and possible solutions, please read the following articles:
  [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException
  ```

- [ ] `$[*]`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Unexpected char, char=*, index=2 -> [Help 1]
  org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Unexpected char, char=*, index=2
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Unexpected char, char=*, index=2
      at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
      at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
      at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
      at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
      at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
      at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
      at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
      at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
      at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
      at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
      at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
      at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
      at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
      at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
  Caused by: java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
      at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite (PathCompiler.kt:198)
      at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite (PathCompiler.kt:59)
      at com.nfeld.jsonpathlite.JsonPath.<init> (JsonPath.kt:17)
      at com.nfeld.jsonpathlite.extension.JSONObjectKt.read (JSONObject.kt:8)
      at com.nfeld.jsonpathlite.JsonObject.read (JsonResult.kt:8)
      at query.AppKt.main (App.kt:10)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
      at java.lang.Thread.run (Thread.java:834)
  [ERROR] 
  [ERROR] Re-run Maven using the -X switch to enable full debug logging.
  [ERROR] 
  [ERROR] For more information about the errors and possible solutions, please read the following articles:
  [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException
  ```

- [ ] `$.*`
  Input:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  null
  ```

- [ ] `$.*`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  null
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Kotlin_com.nfeld.jsonpathlite.
