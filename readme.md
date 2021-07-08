# C++ Shared Library Base

### Bash Script Usage

```
bash build.sh -c -r

-c Compiles Shared Library`
-r Compile and Run CPP Code`
-d Clear Build Folder
```

### Outputs

```
bash build.sh -c -r                                                       
Hello Python
When Python Meets C++
Hello C++
```

## G++ Compiler

UNIX

- `g++ -shared -fPIC -Wl,-install_name,helloWorld.so -o helloWorld.so helloWorld.cpp`

Windows

- `g++ -shared -fPIC -Wl,-so_name,helloWorld.so -o helloWorld.so helloWorld.cpp`
