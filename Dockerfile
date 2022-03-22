# docker build -t logsight/logsight-result-api .

# set base image (host OS)
FROM logsight/logsight-init:latest

# copy code
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["sh", "/entrypoint.sh"]