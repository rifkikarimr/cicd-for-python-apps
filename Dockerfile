FROM arm64v8/python:3


WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
    build-essential \
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
    libpq-dev \
    libatlas-base-dev \
    libjasper-dev \
    libgtk2.0-dev \
    libavcodec-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libavresample-dev

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

RUN pip install --no-cache-dir -r requirements.txt


# COPY qemu-user-static /usr/bin

# ADD . .
COPY ..

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
