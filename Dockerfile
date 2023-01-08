FROM arm64v8/debian:stable
FROM python:3

RUN apt-get update && apt-get install -y --fix-missing\
 build-essential \
 cmake \
 libopenblas-dev \
 liblapack-dev \
 libx11-dev \
 libgtk-3-dev \
 libboost-python-dev \
 qemu-user-static

# RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
# RUN chmod +x buildx
# RUN mkdir -p ~/.docker/cli-plugins
# RUN mv buildx ~/.docker/cli-plugins/docker-buildx

RUN pip install opencv-python

COPY qemu-user-static /usr/bin

COPY . /app

WORKDIR /app

CMD ["python", "face_detection.py"]



# RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
# RUN chmod +x buildx
# RUN mkdir -p ~/.docker/cli-plugins
# RUN mv buildx ~/.docker/cli-plugins/docker-buildx

# WORKDIR /app

# COPY . .

# RUN pip3 install -r requirements.txt

# CMD ["python3", "face-detection.py"]
