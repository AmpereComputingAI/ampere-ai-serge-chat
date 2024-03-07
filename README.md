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

## References
https://github.com/ggerganov/llama.cpp  
https://github.com/serge-chat/serge