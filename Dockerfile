FROM arm64v8/debian:stable
FROM python:3

RUN apt-get -y update 
RUN apt-get install -y --fix-missing\
  build-essential \
  cmake \
  libopenblas-dev \
  liblapack-dev \
  libx11-dev \
  libgtk-3-dev

RUN pip install opencv-python

RUN pip install google-cloud-pubsub

COPY . /app

WORKDIR /app

CMD ["python", "face-detection.py"]
