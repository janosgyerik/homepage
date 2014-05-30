---
layout: post
title: "Adding a Scala Maven module inside an otherwise Java Maven project"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

The other day I attended a [Brown Bag Lunch by Nicolas Martignole on Scala][1].
He spoke passionately about the language,
and got me interested in dusting off my [Coursera notes][2] and start playing with it again.

Scala is a powerful, solid, very expressive functional language.
And since it runs on JVM,
it should be possible to sneak some Scala code into Java projects.

As a first step in that direction,
I tried adding a Scala Maven module inside a Java Maven project.
I started with this minimalistic pom:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.example.scala</groupId>
	<artifactId>scala-examples</artifactId>
	<version>1.0-SNAPSHOT</version>

	<properties>
		<maven.compiler.source>1.6</maven.compiler.source>
		<maven.compiler.target>1.6</maven.compiler.target>
		<encoding>UTF-8</encoding>

		<maven-scala-plugin.version>2.15.2</maven-scala-plugin.version>
		<scala-library.version>2.10.3</scala-library.version>
	</properties>

	<build>
		<plugins>
			<plugin>
				<groupId>org.scala-tools</groupId>
				<artifactId>maven-scala-plugin</artifactId>
				<version>${maven-scala-plugin.version}</version>
				<executions>
					<execution>
						<goals>
							<goal>add-source</goal>
							<goal>compile</goal>
							<goal>testCompile</goal>
						</goals>
					</execution>
				</executions>
			</plugin>
		</plugins>
	</build>

	<dependencies>
		<dependency>
			<groupId>org.scala-lang</groupId>
			<artifactId>scala-library</artifactId>
			<version>${scala-library.version}</version>
		</dependency>
	</dependencies>
</project>
```

And of course a mandatory "hello world!" application:

```scala
package com.example.scala

object HelloWorld {
  def main(args: Array[String]) {
    println("Hello, world!")
  }
}
```

This is ready to build, package, and run:

    $ mvn package
    $ java -cp 'target/scala-examples-1.0-SNAPSHOT.jar;$HOME/.m2/repository/org/scala-lang/scala-library/2.10.3/scala-library-2.10.3.jar' com.example.scala.HelloWorld
    Hello, world!

To get it working in Eclipse,
you have to jump through a few more hoops:

- Open **Help | Install New Software...**, and install the **Maven Integration for Eclipse** from the update site: http://alchim31.free.fr/m2e-scala/update-site/
- Open **Help | Eclipse Marketplace**, search for "Scala", and install **The Scala IDE for Eclipse 3.0.2**
- Import the Maven module, using **File | Import... | Existing Maven Projects...**

After this, now you can open `HelloWorld.scala`,
with nice syntax highlighting,
and the **Run As | Scala Application** context menu.

If you right-click on the project in **Package Explorer**,
select **Scala | Create Scala interpreter in scala-examples**,
you get a nice interpreter where you can easily test Scala expressions, for example:

<a href="#" class="thumbnail">
<img src="{{ site.url }}/assets/screenshots/scala-interpreter.png" />
</a>

Some gotchas I had along the way:

- Without the `add-source` goal, [Eclipse did not recognize Scala sources][3].
- Using the default package (without `com.example.scala` above) the **Run As | Scala Application** context menu was missing.

[1]: http://www.touilleur-express.fr/2014/04/08/passer-a-scala-ce-quil-faut-retenir/
[2]: https://www.coursera.org/course/progfun
[3]: http://stackoverflow.com/questions/23794398/eclipse-doesnt-recognize-scala-source-directory
