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

COMPILE_NAME="helloWorld"
COMPILE_FOLDER="build"
COMPILE_PATH="${COMPILE_FOLDER}/${COMPILE_NAME}"
PYTHON_EXEC="helloWorld"

mkdir -p ${COMPILE_FOLDER}

# Shared Library Only
if [[ ${compile} == "true" && ${run} != "true" ]]
then
    g++ -shared -fPIC -Wl,-install_name,${COMPILE_PATH}.so -o ${COMPILE_PATH}.so ${COMPILE_NAME}.cpp && python3 ${PYTHON_EXEC}.py


# Compile and RUN C++ Only
elif [[ ${run} == "true" && ${compile} != "true" ]]
then
    g++ helloWorld.cpp -o ${COMPILE_PATH} && ./${COMPILE_PATH}


# Shared Library And Compile/Run C++
elif [[ ${run} == "true" && ${compile} == "true" ]]
then
    g++ -shared -fPIC -Wl,-install_name,${COMPILE_PATH}.so -o ${COMPILE_PATH}.so ${COMPILE_NAME}.cpp && python3 ${PYTHON_EXEC}.py
    g++ helloWorld.cpp -o ${COMPILE_PATH} && ./${COMPILE_PATH}


# Clears Build Folder
elif [[ ${delete} == "true" ]]
then
    echo -e "\n Cleaning Build Folder \n";
    rm ${COMPILE_FOLDER}/*
fi;