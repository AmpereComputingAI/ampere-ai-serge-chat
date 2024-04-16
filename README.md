<h1 align="center">Llama.cpp+Serge based LLM Chat application</h1>

## Download the demo repository
```shell
$ git clone https://github.com/AmpereComputingAI/ampere-ai-serge-chat.git
$ cd ampere-ai-serge-chat
```


## Install docker
Follow the instructions from this link,
https://docs.docker.com/engine/install/ubuntu/

## Install compose plugin
Follow the instructions from this link,
https://docs.docker.com/compose/install/linux/#install-using-the-repository

## Open the required ports
```shell
$ sudo firewall-cmd --zone public --permanent --add-port 8008/tcp
$ sudo firewall-cmd --reload
```

## Start the demo
Run the following script to start the demo

```shell
$ ./start-app.sh 
[+] Running 2/2
 ✔ Network ampere-ai-serge-chat_default  Created          0.1s 
 ✔ Container serge-app                   Started          0.1s
```

```docker
$ docker ps
CONTAINER ID   IMAGE                                                  COMMAND                  CREATED          STATUS          PORTS                                       NAMES
2b267cd90195   ghcr.io/amperecomputingai/ampere-ai-serge-chat:0.0.1   "/usr/bin/dumb-init …"   32 seconds ago   Up 31 seconds   0.0.0.0:8008->8008/tcp, :::8008->8008/tcp   serge-app
```

Open the Chrome browser and type in the following URL.
```
http://<server-IP>:8008
```

## Stop the demo
Run the following script to stop the demo
```shell
$ ./stop-app.sh 
[+] Running 2/2
 ✔ Container serge-app                   Removed                             0.3s 
 ✔ Network ampere-ai-serge-chat_default  Removed                             0.4s
```


## Developers
#### 1. Setup the repo
This command will clone the repo and apply patches

```shell
$ ./setup-serge-repo.sh 
Cloning into 'serge'...
remote: Enumerating objects: 5537, done.
remote: Counting objects: 100% (1597/1597), done.
remote: Compressing objects: 100% (365/365), done.
remote: Total 5537 (delta 1435), reused 1315 (delta 1222), pack-reused 3940
Receiving objects: 100% (5537/5537), 2.33 MiB | 5.96 MiB/s, done.
Resolving deltas: 100% (4203/4203), done.
~/dev/ampere-ai-serge-chat/serge ~/dev/ampere-ai-serge-chat
Switched to a new branch '0.9.0'
~/dev/ampere-ai-serge-chat
~/dev/ampere-ai-serge-chat/serge ~/dev/ampere-ai-serge-chat
Applied patch to 'scripts/deploy.sh' cleanly.
Applied patch to 'web/src/routes/+page.svelte' cleanly.
Applied patch to 'web/src/routes/chat/[id]/+page.svelte' cleanly.
Applied patch to 'api/src/serge/routers/chat.py' cleanly.
Applied patch to 'vendor/requirements.txt' cleanly.
```

#### 2. Build the application
This command will build the application
```shell
$ ./build-serge.sh 
[+] Building 0.7s (25/25) FINISHED                                                                                   docker:default
 => [serge internal] load build definition from Dockerfile                                                         0.0s
 => => transferring dockerfile: 1.69kB                                                                             0.0s
 => [serge internal] load metadata for docker.io/library/python:3.11-slim-bookworm                                 0.0s
 => [serge internal] load metadata for docker.io/library/node:20-bookworm-slim                                     0.6s
 => [serge internal] load metadata for docker.io/library/redis:7-bookworm                                          0.6s
 => [serge internal] load .dockerignore                                                                            0.0s
 => => transferring context: 606B                                                                                  0.0s
 => [serge internal] load build context                                                                            0.0s
 => => transferring context: 635.65kB                                                                              0.0s
 => [serge redis 1/1] FROM docker.io/library/redis:7-bookworm@sha256:d6ecc832969a4827645a083da38345327b3447772fe9  0.0s
 => [serge frontend 1/7] FROM docker.io/library/node:20-bookworm-slim@sha256:9f938a1eeb3f85ca7691e1b4b5e9ab91e1d2  0.0s
 => [serge release  1/10] FROM docker.io/library/python:3.11-slim-bookworm                                         0.0s
 => CACHED [serge release  2/10] WORKDIR /usr/src/app                                                              0.0s
 => CACHED [serge release  3/10] COPY --from=redis /usr/local/bin/redis-server /usr/local/bin/redis-server         0.0s
 => CACHED [serge release  4/10] COPY --from=redis /usr/local/bin/redis-cli /usr/local/bin/redis-cli               0.0s
 => CACHED [serge frontend 2/7] WORKDIR /usr/src/app                                                               0.0s
 => CACHED [serge frontend 3/7] COPY ./web/package.json ./web/package-lock.json ./                                 0.0s
 => CACHED [serge frontend 4/7] RUN npm ci                                                                         0.0s
 => CACHED [serge frontend 5/7] COPY ./web /usr/src/app/web/                                                       0.0s
 => CACHED [serge frontend 6/7] WORKDIR /usr/src/app/web/                                                          0.0s
 => CACHED [serge frontend 7/7] RUN npm run build                                                                  0.0s
 => CACHED [serge release  5/10] COPY --from=frontend /usr/src/app/web/build /usr/src/app/api/static/              0.0s
 => CACHED [serge release  6/10] COPY ./api /usr/src/app/api                                                       0.0s
 => CACHED [serge release  7/10] COPY scripts/deploy.sh /usr/src/app/deploy.sh                                     0.0s
 => CACHED [serge release  8/10] COPY scripts/serge.env /usr/src/app/serge.env                                     0.0s
 => CACHED [serge release  9/10] COPY vendor/requirements.txt /usr/src/app/requirements.txt                        0.0s
 => CACHED [serge release 10/10] RUN apt-get update     && apt-get install -y --no-install-recommends dumb-init    0.0s
 => [serge] exporting to image                                                                                     0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:ab834f38a577d31a9d6a4f3e1018788ce7111380c129499975ebf8e1dd4bcfd0                       0.0s
 => => naming to ghcr.io/amperecomputingai/ampere-ai-serge-chat:0.0.6-rc
```

## References
https://github.com/ggerganov/llama.cpp  
https://github.com/serge-chat/serge