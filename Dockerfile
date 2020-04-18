FROM ubuntu

LABEL version="1.14.60.5"

ENV VERSION=1.14.60.5

WORKDIR /opt/minecraft

ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip bedrock-server-${VERSION}.zip

RUN ["apt-get", "update"]
RUN ["apt-get", "install","-y", "unzip"]
RUN ["mkdir", "/opt/minecraft/worlds"]

RUN unzip -n bedrock-server-${VERSION}.zip && rm bedrock-server-${VERSION}.zip

RUN ["apt-get", "purge", "-y", "unzip"]
RUN ["apt-get", "clean"]
RUN ["rm", "-rf", "/var/cache/apt"]

EXPOSE 19132
EXPOSE 19133

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
