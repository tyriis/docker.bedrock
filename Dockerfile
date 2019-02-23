FROM ubuntu

LABEL version="1.9.0.15"

ENV NAME Bedrock-Server
ENV arc=bedrock-server-1.9.0.15.zip
ENV dlarc=https://minecraft.azureedge.net/bin-linux/${arc}

WORKDIR /opt/minecraft

RUN ["apt-get", "update"]
RUN ["apt-get", "install","-y", "unzip", "curl"]
RUN ["mkdir", "/opt/minecraft/worlds"]

ADD ${dlarc} ${arc}
RUN unzip -n ${arc}

RUN ["apt-get", "purge", "-y", "unzip"]
RUN ["apt-get", "clean"]
RUN ["rm", "-rf", "/var/cache/apt"] 

EXPOSE 19132
EXPOSE 19133

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server

