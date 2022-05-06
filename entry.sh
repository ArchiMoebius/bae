respond &

RET_PID=$?

while [ ${RUNNING} -eq 1 ]; do
    while read -t ${CALLBACK_TIMEOUT} -u ${FD} line; do
        if [ ! -z "${line}" ]; then

            if [[ "${line}" == "exit" ]]; then
                echo "k'bye!"
                RUNNING=0
                break
            fi

            process "${line}" "${RET_PIPE}" ;
        fi
    done

    echo '.'
done

kill -9 $RET_PID

exec {FD}>&-
