Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[-1:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Actual output:
  ```
  ["first", "second", "third"]
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
  Error:
  ```
  [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. null: ParseCancellationException: InputMismatchException -> [Help 1]
  org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. null
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
  Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. null
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
  Caused by: org.antlr.v4.runtime.misc.ParseCancellationException
      at org.antlr.v4.runtime.BailErrorStrategy.recoverInline (BailErrorStrategy.java:66)
      at org.antlr.v4.runtime.Parser.match (Parser.java:206)
      at org.jsfr.json.compiler.JsonPathParser.slicing (JsonPathParser.java:636)
      at org.jsfr.json.compiler.JsonPathParser.relativePath (JsonPathParser.java:265)
      at org.jsfr.json.compiler.JsonPathParser.path (JsonPathParser.java:159)
      at org.jsfr.json.compiler.JsonPathCompiler.compile (JsonPathCompiler.java:283)
      at org.jsfr.json.compiler.JsonPathCompiler.compile (JsonPathCompiler.java:273)
      at org.jsfr.json.JsonSurfer.collectAll (JsonSurfer.java:262)
      at query.App.main (App.java:27)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
      at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
      at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
      at java.lang.reflect.Method.invoke (Method.java:566)
      at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
      at java.lang.Thread.run (Thread.java:834)
  Caused by: org.antlr.v4.runtime.InputMismatchException
      at org.antlr.v4.runtime.BailErrorStrategy.recoverInline (BailErrorStrategy.java:61)
      at org.antlr.v4.runtime.Parser.match (Parser.java:206)
      at org.jsfr.json.compiler.JsonPathParser.slicing (JsonPathParser.java:636)
      at org.jsfr.json.compiler.JsonPathParser.relativePath (JsonPathParser.java:265)
      at org.jsfr.json.compiler.JsonPathParser.path (JsonPathParser.java:159)
      at org.jsfr.json.compiler.JsonPathCompiler.compile (JsonPathCompiler.java:283)
      at org.jsfr.json.compiler.JsonPathCompiler.compile (JsonPathCompiler.java:273)
      at org.jsfr.json.JsonSurfer.collectAll (JsonSurfer.java:262)
      at query.App.main (App.java:27)
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
  [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in "$['special:"chars']" -> [Help 1]
  org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in "$['special:"chars']"
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
  Caused by: org.apache.maven.plugin.MojoExecutionException: unbalanced quotes in "$['special:"chars']"
      at org.codehaus.mojo.exec.AbstractExecMojo.parseCommandlineArgs (AbstractExecMojo.java:225)
      at org.codehaus.mojo.exec.ExecJavaMojo.addRelevantPluginDependenciesToClasspath (ExecJavaMojo.java:563)
      at org.codehaus.mojo.exec.ExecJavaMojo.getClassLoader (ExecJavaMojo.java:520)
      at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:301)
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
  [ERROR] 
  [ERROR] Re-run Maven using the -X switch to enable full debug logging.
  [ERROR] 
  [ERROR] For more information about the errors and possible solutions, please read the following articles:
  [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"array": [{"key": "something"}, {"key": {"key": "russian dolls"}}], "key": "value"}, "key": "top"}
  ```
  Expected output:
  ```
  ["top", "value", "something", {"key": "russian dolls"}, "russian dolls"]
  ```
  Actual output:
  ```
  ["value", "something", "russian dolls", {"key": "russian dolls"}, "top"]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.github.jsurfer.
