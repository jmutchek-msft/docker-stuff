#!/bin/bash

function is_linux
{
	if [[ "$(uname)" == "Linux" ]]; then
		echo 1
		return
	fi

	echo 0
}

SET="set"
GET="get"
CFLAGS=""
if [[ "$(is_linux)" == "1" ]]; then
	CFLAGS="-lrt"
fi

gcc ${SET}.c ${CFLAGS} -o ${SET} 
gcc ${GET}.c ${CFLAGS} -o ${GET} 

./${SET} &
sleep 1
./${GET}
if [[ "$(is_linux)" == "1" ]]; then
	echo "/dev/shm:"
	ls -l /dev/shm
fi
sleep 1

rm ${SET} ${GET}