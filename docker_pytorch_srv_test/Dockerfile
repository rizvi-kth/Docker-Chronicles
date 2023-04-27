# For more information, please refer to https://aka.ms/vscode-docker-python
# FROM python:3.10-slim
FROM pytorch/torchserve:0.7.1-cpu

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Install torchserve
COPY config.properties .
# COPY xsumm-sf.mar /home/model-server/model-store/

USER root
COPY dockerd-entrypoint-2.sh /usr/local/bin/dockerd-entrypoint-2.sh
RUN chmod +x /usr/local/bin/dockerd-entrypoint-2.sh \
    && chown -R model-server /home/model-server

USER model-server
RUN mkdir -p /home/model-server/tmp/models

EXPOSE 8080 8081 8082 7070 7071

# Entry point is actually running
# torchserve --start --model-store /home/model-server/model-store --models xsumm=xsumm-sf.mar --ts-config config.properties
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint-2.sh"]

# CMD is the parameter for ENTRYPOINT
# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["serve"]

