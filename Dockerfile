FROM ubuntu:20.04
# Install dependencies
RUN apt update && \
  apt-get install -y opencv-dev \
  opencv-python \
  dlib-dev \
  python3-dev \
  python3-pip \
  ffmpeg-dev \
  ffmpeg-libs \
  build-base

RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
RUN chmod +x buildx
RUN mkdir -p ~/.docker/cli-plugins
RUN mv buildx ~/.docker/cli-plugins/docker-buildx

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt

CMD ["python3", "face-detection.py"]
