#!/bin/bash

while [ -n "$1" ]; do
	case "$1" in
	-c) compile="true";;
	-r) run="true";;
    -d) delete="true";;
	*) echo "Parameter $1 Not Recognized";; 
	esac
	shift
done

BUILD_PATH="build"
COMPILE_PATH="${BUILD_PATH}/helloWorld"
CPP_PATH="src/helloWorld"
PYTHON_PATH="src/helloWorld"

mkdir -p ${BUILD_PATH}

# Shared Library Only
if [[ ${compile} == "true" && ${run} != "true" ]]
then
    g++ -shared -fPIC -Wl,-install_name,${COMPILE_PATH}.so -o ${COMPILE_PATH}.so ${CPP_PATH}.cpp && python3 ${PYTHON_PATH}.py


# Compile and RUN C++ Only
elif [[ ${run} == "true" && ${compile} != "true" ]]
then
    g++ ${CPP_PATH}.cpp -o ${COMPILE_PATH} && ./${COMPILE_PATH}


# Shared Library And Compile/Run C++
elif [[ ${run} == "true" && ${compile} == "true" ]]
then
    g++ -shared -fPIC -Wl,-install_name,${COMPILE_PATH}.so -o ${COMPILE_PATH}.so ${CPP_PATH}.cpp && python3 ${PYTHON_PATH}.py
    g++ ${CPP_PATH}.cpp -o ${COMPILE_PATH} && ./${COMPILE_PATH}


# Clears Build Folder
elif [[ ${delete} == "true" ]]
then
    echo -e "\n Cleaning Build Folder \n";
    rm ${BUILD_PATH}/*
fi;