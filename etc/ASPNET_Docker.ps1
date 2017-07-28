# Run in Administration Mode
docker run -d -p 8000:80 --name riz-running-site microsoft/aspnet
docker ps -a
docker rm 9f
docker exec -it riz-running-site powershell 
docker exec     riz-running-site powershell ls c:\inetpub\wwwroot

docker inspect riz-running-site | sls network
docker cp C:\Users\A547184\Downloads\nginxweb\. riz-running-site:C:\inetpub\wwwroot 
