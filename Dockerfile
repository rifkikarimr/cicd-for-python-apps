FROM arm64v8/alpine:latest

# Install dependencies
RUN apk update && apk add --no-cache \
  opencv-dev \
  opencv-python \
  dlib-dev \
  python3-dev \
  python3-pip \
  build-base

RUN apk upgrade --ignore alpine-baselayout

RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
RUN chmod +x buildx
RUN mkdir -p ~/.docker/cli-plugins
RUN mv buildx ~/.docker/cli-plugins/docker-buildx

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt

CMD ["python3", "face-detection.py"]
