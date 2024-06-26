1. Run tests
    sudo apt install python3-pip
    pip3 install unittest

2. Build docker image
    - Create a unical tag for image
    - docker build -t <tag>
      

3. Push docker image to dockerhub
    - Login to

4. Run the image on our linux server
    - setUp the pipeline:
        - Generate ssh key-pair
        - Dobavit publicnij kliuc na linux server
        - Dobavit privatnij kliuc v permenuju v github actions
    - Steps:
        - Execute remote command via ssh: Edit docker compose on linux server by replacing the tag on latest
        docker images | awk '/lorissxd\/webapp_cicd/ {print $2}'
        cat docker-compose.yaml | awk '/webapp_cicd/ {print substr($2,22,7)}'
        - Execute remote command via ssh: docker compose down && docker compose up -d

Homework:

1. Create other format tag 1.x, where x will always be encrimanting.

2. Split build job on 2 (build and push)

3. Try to made deployment job (4)