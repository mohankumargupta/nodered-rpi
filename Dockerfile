FROM yobasystems/alpine-nodejs:arm32v7-min

RUN mkdir /data && mkdir /nodered
WORKDIR /nodered
COPY package.json /nodered

RUN apk add --no-cache --virtual build-deps \
            python python-dev make g++  \
    && npm install --unsafe-perm \
    && apk del build-deps \
    && npm cache clean --force

VOLUME ["/data"]
EXPOSE 1880

CMD ["npm", "start", "--", "--userDir", "/data"]
