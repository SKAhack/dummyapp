FROM mhart/alpine-node:6.4.0

COPY . /src/
WORKDIR /src

ENV NODE_ENV=production

RUN apk update \
  && apk add --upgrade openssl \
  && apk add curl python make g++ ca-certificates \
  && update-ca-certificates --fresh \
  && npm install \
  && npm prune --production \
  && apk del --purge make g++ \
  && rm -rf /var/cache/apk/* /tmp/*

EXPOSE 3030

ENTRYPOINT ["node", "index.js"]
