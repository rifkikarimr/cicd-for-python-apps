FROM python:3

RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  libopenblas-dev \
  liblapack-dev \
  libx11-dev \
  libgtk-3-dev \
  libboost-python-dev

RUN pip install opencv-python dlib

COPY . /app

WORKDIR /app

CMD ["python", "face_detection.py"]
