# docker build -t rabbit4win:1.0 -f ./rabbit.dockerfile .
# docker run -it --name rabbitsrv --hostname rabbithost rabbit4win:1.0
# 
# docker run -it --name rabbitsrv --hostname rabbithost -p 8088:15672 -e ERLANG_HOME='C:\Program Files\erl8.3' -e ERLANG_SERVICE_MANAGER_PATH='C:\Program Files\erl8.3\erts-8.3\bin' -e RABBITMQ_NODENAME='rabbithost' rabbit4win:1.0 powershell

FROM microsoft/windowsservercore:latest
MAINTAINER rizvi.kth@gmail.com

ENV ERLANG_HOME "C:\Program Files\erl8.3" 
ENV ERLANG_SERVICE_MANAGER_PATH "C:\Program Files\erl8.3\erts-8.3\bin" 
# Used by the PS script which runs the service
ENV RABBITMQ_SBIN "C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.10\sbin"
# Used by Erland node
#ENV RABBITMQ_NODENAME "rabbitnode"

#install chocolatey
RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#install rabbitmq
RUN choco install -y rabbitmq -version 3.6.10   
#RUN choco update -y rabbitmq

COPY rabbit_setup.ps1 C:/rabbitmq_my_conf/

#Main rabbitmq port
EXPOSE 5672
#port mapper daemon (epmd)
EXPOSE 4369
#inet_dist_listen
EXPOSE 35197
#rabbitmq management console
EXPOSE 15672

# powershell -executionpolicy bypass -File C:\rabbitmq_my_conf\rabbit_setup.ps1
#CMD ["powershell","-executionpolicy","bypass","-File", "C:\rabbitmq_my_conf\rabbit_setup.ps1"]
#ENTRYPOINT powershell -executionpolicy bypass -File C:\rabbitmq_my_conf\rabbit_setup.ps1
ENTRYPOINT powershell 