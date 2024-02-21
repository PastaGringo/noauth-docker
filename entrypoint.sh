#!/bin/bash
echo ""
echo "Welcome to"
echo "      __            ___       __  ";
echo "|\ | /  \  /\  |  |  |  |__| |  \ ";
echo "| \| \__/ /~~\ \__/  |  |  | |__/ ";
echo "                                  ";
echo "Creator: Brugeman @npub1xdtducdnjerex88gkg2qk2atsdlqsyxqaag4h05jmcpyspqt30wscmntxy"
echo "Github noauth : https://github.com/nostrband/noauthd"
echo ""
echo "Containerizator: Pastadmin @npub1ky4kxtyg0uxgw8g5p5mmedh8c8s6sqny6zmaaqj44gv4rk0plaus3m4fd2"
echo "Github noauth-nauth-traefik-docker: https://github.com/pastagringo/noauth-nauth-traefik-docker"
echo
cat <<EOT >> .env
ENV PUSH_PUBKEY=$PUSH_PUBKEY
ENV PUSH_SECRET=$PUSH_SECRET
ENV ORIGIN=$ORIGIN
ENV DATABASE_URL=$DATABASE_URL
ENV BUNKER_NSEC=$BUNKER_NSEC
ENV BUNKER_RELAY=$BUNKER_RELAY
ENV BUNKER_DOMAIN=$BUNKER_DOMAIN
ENV BUNKER_ORIGIN=$BUNKER_ORIGIN
EOT
echo
echo "Starting noauthd on URL : $ORIGIN ..."
echo
npx prisma migrate deploy
npx prisma generate
node -r dotenv/config src/index.js dotenv_config_path=.env
