# --rm will remove the container when the exit from terminal (--it necessary to stay in the terminal)
docker run --rm -it -p 8080:80 nginx
# -v create a volume mount(shared file system with host)
docker run --rm -it -p 8080:80 -v C:/Users/A547184/Downloads/nginxweb:/usr/share/nginx/html nginx
# "-v /my-volume" will map /my-volume to host filesystem automatically (check with docker inspect) 

# -d runs container in background - preferabilly name the container with --name; (should not be used with --rm which is not applicable with -d)
docker run -d -p 8080:80 --name riznginx nginx

# To Attach to a container running detached
#docker attach <container_id>
docker attach 983475

# To check the mapped port of the container with host 
docker port container-id-or-name

# Linking a container with another:
 # 1. Create a container with a EXPOSE port (EXPOSE 80)
 # 2. Container must have a name (riz_src)
 # 3. No need to port map with the host (it is optional)
docker run -d --name riz_src riz_src.app
 # 4. Create a container with link to the source container (riz_src)
docker run -d --name riz_rcv --link riz_src:ali_riz_src riz_rcv.app
 # 5. Now check in the environment variables of the riz_rcv the it has ip & port info of riz_src
 # 6 Apps in the riz_rcv need to know those environment variables upfront to communicate with riz_src.

# To Ditach from a interactively running container
# Ctrl + P + Q

# With exec we run a bash in side the nginx container (exec can run a process in a container )
docker exec -it riznginx bash
docker exec riznginx ls -l /usr/share/nginx/html

# See the top executing commads/processes in a container 
#docker top <container_id>
docker top 283GKTU

# cp commad copies files between host and container
docker cp C:\Users\A547184\Downloads\nginxweb\. riznginx:/usr/share/nginx/html  

# commit commad takes a snapshot of the current container and creates a new image (docker help commit)
#docker commit <image_name> <new_image_name>:<tag>
docker commit riznginx riz2nginx:nginx

# When you run an image and create a container - a new RUN layer is added on top of all previous layers.
# diff show all the changes during the runtime of this container ie. contents of RUN layer
docker diff riznginx

# build - creates an image from a script (last . specifies the build location)
#docker build -f <script_file> -t <image_name:tag> .

# To push an image in docker hub
docker login
#docker tag <image_name>:tag <username>/<repo_name>:<tag>
docker tag riz2nginx:nginx voidrizvi/riz2nginx:nginx
docker push voidrizvi/riz2nginx:nginx



# To Get a container log
docker log container_id
# To follow the log(te. ping request log).
docker log -f container_id

