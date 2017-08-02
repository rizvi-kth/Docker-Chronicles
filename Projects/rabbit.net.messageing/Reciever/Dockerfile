# docker build -t sender-img:1.0 -f ./Sender.dockerfile .
# docker run -it --name riz-rcvr -e RABBITMQ_HOST='172.18.98.219' -e RABBITMQ_USER='rizvi' -e RABBITMQ_PASS='riz123' sender-img:1.0 


FROM microsoft/windowsservercore:latest
MAINTAINER rizvi.kth@gmail.com

#RUN mkdir C:\Temp
ADD /Release/. /rcv-app

ENTRYPOINT /rcv-app/SimpleReciever.exe
#ENTRYPOINT powershell