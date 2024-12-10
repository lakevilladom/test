FROM	alpine/curl:latest AS tmps

WORKDIR	/tmps

RUN	cat date.txt

FROM nginx:alpine

COPY--from=tmps /tmps/ /opt/app/

EXPOSE 80

EXEC echo /opt/app/date.txt
