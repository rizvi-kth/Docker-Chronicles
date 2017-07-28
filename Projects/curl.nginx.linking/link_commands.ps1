# Source (Web server)
docker run -d --rm --name riz2nginx riz2nginx:nginx

# Reciever (Client - curl)
docker run -it --rm --link riz2nginx:aliriz2nginx --name ubuntu_app ubuntu.curl:1.0 bash
# In the ubuntu_app container check with curl
# Using environment variable
curl -I $ALIRIZ2NGINX_PORT_80_TCP_ADDR
# Using /etc/hosts file
cat /etc/hosts | grep aliriz2nginx | awk {'print $1'} | xargs curl -I