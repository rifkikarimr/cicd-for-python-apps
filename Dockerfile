FROM arm64v8/alpine:3.12
FROM python:3

# Install dependencies
RUN apk update && apk add --no-cache \
  opencv-dev \
  opencv-python \
  dlib-dev \
  python3-dev \
  python3-pip \
  build-base

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt

CMD ["python3", "face-detection.py"]
