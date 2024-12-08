FROM	alpine/curl:latest

WORKDIR	/tmps

RUN	echo "123" > test

EXPOSE 8080

CMD	cat /tmps/test
