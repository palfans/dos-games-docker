FROM ghcr.io/linuxserver/baseimage-alpine:arm64v8-3.14

RUN \
  echo "**** install python3 ****" && \
  apk add --no-cache python3 py3-pip && \
  echo "**** install Flask ****" && \
  pip3 install flask && \
  echo "initial work git repo" && \
  apk add --no-cache git && \
  git clone https://github.com/rwv/chinese-dos-games-web.git /dosgames && \
  echo "**** cleanup ****" && \
  
# ports and volumes
EXPOSE 5000
VOLUME /dosgames/static/games
ENTRYPOINT ["python3", "/dosgames/app.py"]
