[2017-12-31]
"dotnet run" can't compile .NET projects mounted as volume mount in docker.
 
	#======#
	#Dotnet#
	#======#

#Update the nuget chase
dotnet restore	
#Publish with a target runtime	
dotnet publich -r ubuntu.16.04-x64

#Test a website running in container
dotnet website.dll
curl -L http:\\localhost:6544\swagger


 
	#======#
	#Docker#
	#======#

#To check what happens when you run a image to create container -
# Run this event check in a CLI and run a container in another CLI	
docker events --format "{{json .}}"
docker events --format 'Type={{.Type}}  Status={{.Status}} Action={{.Action}}  ID={{.ID}}'

	
docker run -it -v C:/Users/A547184/Documents/etc:/win_data ubuntu-curl:1.0 sh
docker run -it --rm -v C:/Users/A547184/Documents/etc/dotnet-core-exp:/win_data voidrizvi/ubuntu.dotnet.2.0.0 sh
docker run -it --rm -v C:/Users/A547184/Documents/etc/dotnet-core-exp:/win_data ubuntu:16.04 bash 
cat /etc/os-release
docker run -it --rm -v C:/Users/A547184/Documents/etc/dotnet-core-exp:/volume_mount microsoft/dotnet:2.0-sdk-jessie bash

C:\Users\A547184\Git\Repos\cSharp-cronicals\dotnet-core\ASP.NET-core\TestSwagger\TestSwagger\bin
 
docker run -it --rm -v ${PWD}:/qApp -p 8080:80 microsoft/aspnetcore:2
 
 
	#=====================#
	# Install Dotnet Core #
	#=====================#

apt-get update
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-zesty-prod zesty main" > /etc/apt/sources.list.d/dotnetdev.list'
apt-get update
apt-get install dotnet-sdk-2.0.0

	#=====================#
	# Ubuntu Prerequisits #
	#=====================#

apt-get update
apt-get install libunwind8
apt-get install liblttng-ust0
apt-get install libcurl3
apt-get install libssl1.0.0
apt-get install libuuid1
apt-get install libkrb5
apt-get install zlib1g
apt-get install libicu52 (for 14.X)
apt-get install libicu55 (for 16.X)
apt-get install libicu57 (for 17.X)


