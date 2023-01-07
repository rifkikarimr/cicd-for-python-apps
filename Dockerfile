FROM arm64v8/python:3.8

RUN apt-get -y update 
RUN curl -fsSLO https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64
RUN chmod +x buildx-v0.5.0.linux-arm64
RUN mv buildx-v0.5.0.linux-arm64 ~/.docker/cli-plugins/docker-buildx

RUN apt-get install -y --fix-missing\
  build-essential \
  cmake \
  libopenblas-dev \
  liblapack-dev \
  libx11-dev \
  libgtk-3-dev

WORKDIR /app

COPY . /app

RUN pip install opencv-python

RUN make

CMD ["python", "face-detection.py"]
