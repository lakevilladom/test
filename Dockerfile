FROM caddy:2.6.4-alpine
RUN apk add --no-cache curl
WORKDIR /app
RUN curl -o btc.json https://api.coindesk.com/v1/bpi/currentprice/BTC.json
RUN echo ":80 {\n    root * /app\n    file_server\n}" > /etc/caddy/Caddyfile
EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
