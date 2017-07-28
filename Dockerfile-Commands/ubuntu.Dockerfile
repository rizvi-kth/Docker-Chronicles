FROM ubuntu:17.10
MAINTAINER rizvi.kth@gmail.com
RUN     apt-get update \
    &&  apt-get python3
    &&  apt-get install bash-completion
    
#CMD ["echo","Ubuntu with python3, bash-completion "]
CMD ["/bin/bash"]
