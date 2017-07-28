# Docker build - build content is in the Dockerfile
docker build -t safehouse-site --build-arg site_root=/ .

# Docker build - build content is in the Dockerfile
docker build -t safehouse-site -f my_build_file --build-arg site_root=/ .

