FROM	alpine/curl:latest AS tmps
WORKDIR	/tmps
RUN	rm -rf ./* && date > date.txt



FROM nginx:alpine
COPY	--from=tmps /tmps/ /opt/app/
EXPOSE 80
CMD	cat /opt/app/date.txt && nginx -g "daemon off;"
