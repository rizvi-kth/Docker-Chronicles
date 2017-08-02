# Create all the images and containers 
docker-compose up

# Build indevidual service 
docker-compose build service_name


# Destroy all the containers (stop only)
docker-compose stop
# Destroy all the containers (stop + remove)
docker-compose down
# Destroy all the containers (stop + remove + images-removed)
docker-compose down --rmi all
# Destroy all the containers (stop + remove + images-removed + volumes-destroyrd)
docker-compose down --rmi all --volumes
