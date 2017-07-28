# docker build -t ubuntu.curl:1.0 -f ./curl.dockerfile .
# docker run -it --rm ubuntu.curl:1.0

FROM ubuntu:17.10
MAINTAINER rizvi.kth@gmail.com

# This is for a bug in ubuntu image which dont have apt-utils
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y curl \
    && apt-get install -y bash-completion

#&& apt-get install -y apt-utils \        
#CMD ["echo","Ubuntu with python3, bash-completion "]
CMD ["curl", "--version" ]
