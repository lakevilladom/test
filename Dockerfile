FROM caddy:2.6.4-alpine AS tmps
WORKDIR	/tmps
RUN apk add --no-cache curl
RUN curl -o btc.json https://api.coindesk.com/v1/bpi/currentprice/BTC.json
RUN cat /tmps/btc.json

FROM caddy:2.6.4-alpine
WORKDIR /app
COPY	--from=tmps /tmps/ /app
RUN echo ":80 {" > /etc/caddy/Caddyfile && \
    echo "    root * /app" >> /etc/caddy/Caddyfile && \
    echo "    file_server" >> /etc/caddy/Caddyfile && \
    echo "}" >> /etc/caddy/Caddyfile
EXPOSE 80
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
