FROM arm64v8/alpine:3.12
FROM python:3

RUN apk update && apk add --no-cache \
  curl \
  git \
  build-base

RUN apt-get -y update 
RUN apt-get install -y --fix-missing\
  build-essential \
  cmake \
  libopenblas-dev \
  liblapack-dev \
  libx11-dev \
  libgtk-3-dev

RUN pip install opencv-python

COPY . /app

WORKDIR /app

CMD ["python", "face-detection.py"]
