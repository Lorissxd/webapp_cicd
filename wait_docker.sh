while true; do
    docker ps | grep "DOCKER PS" 2>&1 >/dev/null
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        echo "Docker sucessfully found on the server"
        exit
    else
        echo "Waiting for docker to be installed"
        sleep 1
    fi
done