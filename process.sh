
function wrap() {
    echo "wrap: ${1}"

    RET="${1}";
}

function unwrap() {
    echo "unwrap: ${1}"

    RET="${1}";
}

function process() {
    local RET=

    unwrap "${1}"
    CMD=${RET}

    PIPE="${2}"

    wrap "$( eval ${CMD} )"
    echo "${RET}" >${PIPE}
}

function respond() {
    while true
    do
        if read result; then

            if [[ "$result" == 'exit' ]]; then
                break
            fi

            echo "${result}" >&${FD}
        fi
    done <"${RET_PIPE}" 
}
