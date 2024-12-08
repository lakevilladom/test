FROM	alpine/curl:latest

WORKDIR	/tmps

RUN	curl -L -s -o test https://gist.githubusercontent.com/lakevilladom/c1f7e2bcaf75b19b4d90450ca17d8966/raw/test
	
CMD	cat /tmps/test
