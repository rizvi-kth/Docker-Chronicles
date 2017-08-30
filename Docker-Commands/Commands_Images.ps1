# If you would like to have handy tab completion for Docker commands, you can install the posh-docker PowerShell Module as follows.
Install-Module posh-docker
Import-Module posh-docker

# Info
docker info
# To get both Client and Server information 
docker version 

#Show all process history With running process
docker ps -a
#Show all running process
docker ps


# Stop  a running container (get container-id from PS command; specify name with --name while start)
#docker stop <container-id> / <image_name> / <some_name>
# Remove a container (running or stopped)
#docker rm <container-id/name>
# Remove a container and its mapped volume (folder content in the host)
#docker rm -v <container-id/name>
# Remove all (stopped)containers
docker ps -a -q | ForEach-Object{docker rm $_.ToString()}

# Start  a container (get container-id from PS command)
#docker start <container-id> / <image_name>
# Start  a container with interactive mode
#docker start -it --name some_name <container-id> 
# Start  a container with detached mode
#docker start -d --name some_name <container-id> 
# Start  a container with detached mode with port mapping
docker start -d --name some_name -p 8080:80 microsoft/iis:nanoserver 
# Start  a container with a first/startup command (powershell / dotnet --version)
docker run microsoft/dotnet:nanoserver dotnet --version 
docker run microsoft/dotnet:nanoserver powershell 

# Switch to linux container to run Alpine linux
docker run -it alpine:latest

# Mount windows filesystem in Alpine Linux(C:/Users/A547184/Documents/etc -> /win_data)
docker run --rm -it -v C:/Users/A547184/Documents/etc:/win_data alpine sh 

# Attach the IO and error stream in current terminal
#docker attach <container-id>
 
# To inspect an Image
#docker inspect <image>
# To inspect an Container
#docker inspect <Container_name/id>
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" my-running-site


# List all downloaded images 
docker images
docker images --tree
# Filter this list with string selector
docker images | sls nginx
# Remove an image 
#docker rmi <images_id>


# To check isolated envoronment in host and container run this command
ls env:\
git.io/vPj49


#Save Image to a file
sudo docker save -o jupyter-tensorflow-notebook jupyter/tensorflow-notebook
#Load image
sudo docker load jupyter-tensorflow-notebook    