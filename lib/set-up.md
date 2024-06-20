#Install Jflex, CUP and Java in macOS

Guide on how to install Java, Jflex and CUP in the macOS operating system.


##Java
The Oracle JDK can be downloaded at the following address https://www.oracle.com/java/technologies/javase-downloads.html, choosing the one marked as Windows x64 Installer (at the moment of this guide the recommended version to download is jdk-15.0.2_osx-x64_bin.tar.gz).

##Java installation
To install Java following those steps:

 1 - Create a folder into your home directory

----------------------------------------------------------------------------------------
cd
mkdir -p compilers
cd compilers
----------------------------------------------------------------------------------------

2 - Download into the folder the Java installation file jdk-15.0.2_osx-x64_bin.tar.gz.
3 - Decompress 
```sh
   tar xvfz jdk-15.0.2_osx-x64_bin.tar.gz
```

 #Install JFlex and CUP follow the following steps:

To install Jflex execute the command -----------------------------------------------
  ```sh
   brew install jflex
   ```
 To install cup ---------------------------------------------------------------------

Copy the folders java_cup_v11_draw_tree (that you can find in this [zip file](https://www.skenz.it/repository/compilers/progs/flctools.zip)) inside compilers, in order to have the path /home/skenz/compilers/java_cup_v11_draw_tree.
-------------------------------------------------------------------------------------
 1 - Enter the CUP directory
 2 - cd java_cup_v11_draw_tree/java_cup
Compile CUP:
 3 - javac *.java runtime/*.java ../StdDraw.java
--------------------------------------------------------------------------------------

##Configure environment variables
Before running CUP and Jflex, environment variables must be configured.

To set the environment variables, open in your home directory the file .zshrc (the .zshrc file is executed by the shell each time you open a terminal and usually it is used to configure a shell):
--------------------------------------------------------------------------------------
```sh
cd
touch .zshrc
open .zshrc
After opening the .zshrc file, add on its top the following lines:
```

After opening the .zshrc file, add on its top the following lines:

```sh
PATH=$PATH:.:/Users/skenz/compilers/java_cup_v11_draw_tree/java_cup/:/Users/skenz/compilers/jflex-1.8.2/bin
export PATH
CLASSPATH=.:/Users/skenz/compilers/java_cup_v11_draw_tree/
export CLASSPATH
Note: to make active the new environment variables you must reopen a new shell. Remember that both $PATH and $CLASSPATH 
```

environmental variables have to contain the . (dot) that represents the current directory.

##Check installation
To verify that the programs have been installed correctly, open a command prompt (cmd) and enter:
```sh
     jflex
```
 -----> A graphical window should be opened.

For CUP you can type into the command prompt:
```sh
       java java_cup.Main
```   

-----> and if it is correctly installed you see nothing in the terminal. To stop it you can press CTRL-c.

-----------------------------------------------------------------------------------------
## References.

https://www.skenz.it/compilers/install_macos
https://www.cs.princeton.edu/~appel/modern/java/CUP/