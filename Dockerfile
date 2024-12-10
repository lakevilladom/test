FROM	alpine/curl:latest AS tmps

WORKDIR	/tmps

RUN	cat date.txt

FROM nginx:alpine

COPY	--from=tmps /tmps/ /opt/app/

EXPOSE 80

CMD	echo /opt/app/date.txt
