 Docker commands to run application:
 ```
 >> docker build -t flask-app .
 >> docker run -d -p 5000:5000 flask-app
```
 Get the name of your container:
 ```
 >> docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS         PORTS                    NAMES
3f1b1e2f1f20   flask-app   "/bin/sh -c ./entry-…"   10 seconds ago   Up 8 seconds   0.0.0.0:5000->5000/tcp   upbeat_beaver
```
** Note that the name of your image and your container are different. 
Stop running your container:
```
>>> docker stop [container_name]
```
To completely clean your containers and images from the directory:
```
>>> docker system prune -a
```