## Prerequis
You need following installations :

- Java 7 or java 8
- Scala 2.11.x

## How to setup

```sh
git clone https://github.com/SpinalHDL/SpinalBaseProject.git
cd SpinalBaseProject
git checkout makefile
```

## How to run

```sh
make run
```

## How to update the SpinalHDL library

You can get updated SpinalHDL JAR on sonatype to replace the ones in the lib folder: 
- [SpinalHDL-core](https://oss.sonatype.org/content/groups/public/com/github/spinalhdl/spinalhdl-core_2.11/)  
- [SpinalHDL-lib](https://oss.sonatype.org/content/groups/public/com/github/spinalhdl/spinalhdl-lib_2.11/)

Don't forget to update reference to those jars in the makefile.