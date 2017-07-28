# docker build -t safehouse-site:1.0 --build-arg site_root=/ .
# docker run -d -p 8000:80 --name safehouse.net safehouse-site:1.0
# docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" safehouse.net

# To see the layers of the image 
# docker histry <image-id>
# The `FROM` instruction specifies the base image. You are extending the `microsoft/aspnet` image.
FROM microsoft/aspnet:latest

# The final instruction copies the site you published earlier into the container.
COPY ./Safehouse/ /inetpub/wwwroot

#ARG site_root=.
#ADD ${site_root} /inetpub/wwwroot

# Installs the package and creates a new layer
RUN apt-get install bash-completion

# IMPORTANT: As each run will create a new layer and increase size of the image
# try to run multiple commands in a single run.
RUN apt-get install bash-completion \
    && apt-get install python3

# RUN executes its instructions when you build an Image from Dockerfile/build file
# CMD executes its instructions when you build a Container from an Image
# EXEC form 
CMD ["echo","Ubuntu with python3, bash-completion "]
# Shell form
CMD echo "Ubuntu with python3, bash-completion"

# Similar with CMD but recommanded - because:
# Any thing provided after the run-command(docker run <img-id> arg1) 
# will be the argument for the command(echo) of the ENTRYPOINT.
# EXEC form 
ENTRYPOINT ["echo"]
# Shell form
ENTRYPOINT echo

# Specify a volume (host volume sharing is not possible in Dockerfile; only possible in 'docker run')
VOLUME /my-volume

# Type env in the bash of a container to verify thet the environment variabls are added.
ENV var1=value1 var2=value2

# Exposes port 80 to any container that uses this image
EXPOSE 80