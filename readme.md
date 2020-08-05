# Running docker file
`$ docker build -t test-framework path`

# Running container
`$ docker run -it test-framework`

# Execute command in a running container
`$ docker exec -it container bash -c "cd /path;python3 test.py"`

# copy files from docker machine to your host
`$ docker cp container:/path/test.png /c/src/docker`