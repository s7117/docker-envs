FROM ubuntu:20.04

# ENV
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0.0

# Set Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install apt-utils \
  sudo vim git wget curl locales ssh htop \
  build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev \
  libffi-dev liblzma-dev \
  g++ make unzip zip \
  dos2unix x11-apps -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:temp2022' | chpasswd


########## OPENVINO ##########

# OpenCV
RUN apt-get install git libgtk2.0-dev \
  pkg-config libavcodec-dev libavformat-dev \
  libswscale-dev libatlas-base-dev python3-scipy -y

WORKDIR /home/user

# Get CMAKE
RUN su - user -c "wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4.tar.gz"

# Get OpenCV
RUN su - user -c "git clone --depth 1 --branch 4.5.2-openvino https://github.com/opencv/opencv.git"

# OpenVINO
RUN su - user -c "git clone --depth 1 --branch 2021.3 https://github.com/openvinotoolkit/openvino.git"

WORKDIR /home/user
USER user

# Command
CMD [ "/bin/bash" ]
