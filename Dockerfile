FROM ubuntu:20.04
LABEL maintainer="Marcus Vinícius da R G Cardoso <marcusvy@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Porto_Velho

RUN apt-get update && apt-get install -y \ 
  python3-pip zlib1g-dev python-dev libxml2-dev libxslt1-dev tzdata 
RUN  apt-get install -y antiword unrtf poppler-utils pstotext tesseract-ocr \
  flac ffmpeg lame libmad0 libsox-fmt-mp3 sox libjpeg-dev swig \
  && apt-get clean

RUN pip3 install --no-cache-dir textract

ENTRYPOINT ["textract"]