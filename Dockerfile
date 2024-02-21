FROM node:18-alpine
ENV PUSH_PUBKEY=
ENV PUSH_SECRET=
ENV ORIGIN=
ENV DATABASE_URL=
ENV BUNKER_NSEC=
ENV BUNKER_RELAY=
ENV BUNKER_DOMAIN=
ENV BUNKER_ORIGIN=
RUN apk update && apk upgrade && \
    apk add --no-cache bash git busybox-extras
RUN git clone https://github.com/nostrband/noauthd.git
WORKDIR /noauthd
RUN npm install
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
EXPOSE 8000
ENTRYPOINT ["./entrypoint.sh"]
