FROM nginx:alpine

RUN apk add --no-cache jq

RUN curl -L -s  "$(curl -s https://api.github.com/gists/c1f7e2bcaf75b19b4d90450ca17d8966 | jq -r '.files["index.html"].raw_url')" -o /usr/share/nginx/html/index.html

EXPOSE 80
