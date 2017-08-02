# Ubuntu - Docker container with management plug-in
# docker run -d --hostname rabbithost --name rabbitapp rabbitmq:3-management
# docker inspect rabbitmq-app | sls ipaddress

# Windows Rabbitmw server setup
docker run -it --name rabbitsrv --hostname rabbithost rabbit4win:1.0

docker exec -it f powershell -noexit -command "cd c:\rabbitmq_my_conf"
docker exec -it f powershell -noexit -command cd $env:RABBITMQ_SBIN

Get-ExecutionPolicy
iex((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco

# Install RabbitMQ
choco install rabbitmq

# After installation fix the Environment Variables
#$env:Path += ";C:\Program Files\GnuWin32\bin"
$env:ERLANG_SERVICE_MANAGER_PATH = "C:\Program Files\erl8.3\erts-8.3\bin"
#                              For "C:\Program Files\erl8.3\erts-8.3\bin\erlsrv.exe"
$env:ERLANG_SERVICE_MANAGER_PATH = "C:\Program Files\erl9.0\erts-9.0\bin"
#                              For "C:\Program Files\erl9.0\erts-9.0\bin\erlsrv.exe"
$env:RABBITMQ_SBIN = "C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.10\sbin"

# Verification that service started 
# Check the log
cd $env:APPDATA\RabbitMQ\log
# Check uri for management plugin
$res = Invoke-WebRequest "http://localhost:15672"
$res = Invoke-WebRequest -usebasicparsing "http://172.18.98.219:15672"
$res.StatusCode

# Troubleshoot: If the service don't startup properly.
.$env:RABBITMQ_SBIN\rabbitmq-service.bat stop
.$env:RABBITMQ_SBIN\rabbitmq-server.bat

# Create a user for rabbitmq 
# (In V 1.0 these staps can be done manually then commit the container to make 2.0)
.\rabbitmq-service.bat stop
.\rabbitmq-server.bat
.\rabbitmqctl.bat add_user rizvi riz123
.\rabbitmqctl.bat set_permissions -p / rizvi ".*" ".*" ".*"
.\rabbitmqctl.bat set_user_tags rizvi administrator

# Windows - client
docker run -it --name rabbitsrv --hostname rabbithost rabbit4win:1.0
docker run -it --rm --name rabbitclient --link rizsrv:alirizsrv microsoft/windowsservercore:latest
