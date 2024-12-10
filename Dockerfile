FROM nginx:alpine

RUN curl -s https://gist.githubusercontent.com/lakevilladom/c1f7e2bcaf75b19b4d90450ca17d8966/raw/index.html -o /usr/share/nginx/html/index.html

EXPOSE 80
