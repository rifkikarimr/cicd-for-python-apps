FROM arm64v8/debian:latest
FROM python:3

RUN apt-get update --fix-missing \
    apt-get install build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavformat-dev \
    libpq-dev

# RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
# RUN chmod +x buildx
# RUN mkdir -p ~/.docker/cli-plugins
# RUN mv buildx ~/.docker/cli-plugins/docker-buildx

RUN wget https://github.com/opencv/opencv/archive/4.5.0.zip && \
    unzip 4.5.0.zip && \
    rm 4.5.0.zip && \
    mkdir /opencv-4.5.0/build && \
    cd /opencv-4.5.0/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D WITH_TBB=ON \
        -D WITH_V4L=ON \
        -D WITH_QT=OFF \
        -D WITH_OPENGL=ON \
        -D BUILD_opencv_python3=ON .. && \
    make -j4 && \
    make install && \
    ldconfig

# COPY qemu-user-static /usr/bin

# ADD . .

COPY . /app

WORKDIR /app

# RUN make

CMD ["python", "face-detection.py"]



# RUN curl -L https://github.com/docker/buildx/releases/download/v0.5.0/buildx-v0.5.0.linux-arm64 -o buildx
# RUN chmod +x buildx
# RUN mkdir -p ~/.docker/cli-plugins
# RUN mv buildx ~/.docker/cli-plugins/docker-buildx

# WORKDIR /app

# COPY . .

# RUN pip3 install -r requirements.txt

# CMD ["python3", "face-detection.py"]
