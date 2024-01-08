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
RUN passwd --lock root
RUN echo 'user:change-this-2024' | chpasswd


########## OPENVINO ##########

# OpenCV Deps
RUN apt-get install git libgtk2.0-dev \
  pkg-config libavcodec-dev libavformat-dev \
  libswscale-dev libatlas-base-dev python3-scipy \
  python3-pip -y

WORKDIR /root

# Get CMAKE
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4.tar.gz
RUN tar -xvzf cmake-3.14.4.tar.gz
WORKDIR /root/cmake-3.14.4
RUN /root/cmake-3.14.4/bootstrap
RUN make -j8
RUN make install
WORKDIR /root

# Get OpenCV
RUN git clone --depth 1 --branch 4.5.5-openvino-2022.1.0 https://github.com/opencv/opencv.git
RUN mkdir /root/opencv/build
WORKDIR /root/opencv/build
RUN cmake –DCMAKE_BUILD_TYPE=Release –DCMAKE_INSTALL_PREFIX=/usr/local ..
RUN make -j8
RUN make install
WORKDIR /root

# OpenVINO
RUN git clone --depth 1 --branch 2022.2.0 https://github.com/openvinotoolkit/openvino.git
WORKDIR /root/openvino
RUN git submodule update --init --recursive
RUN bash install_build_dependencies.sh
ENV OpenCV_DIR /usr/local/lib/cmake/opencv4
RUN pip3 install -r /root/openvino/src/bindings/python/src/compatibility/openvino/requirements-dev.txt
RUN mkdir /root/openvino/build
WORKDIR /root/openvino/build
#RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/pi/openvino_dist -DENABLE_MKL_DNN=OFF -DENABLE_CLDNN=OFF -DENABLE_GNA=OFF -DENABLE_SSE42=OFF -DTHREADING=SEQ -DENABLE_OPENCV=OFF -DNGRAPH_PYTHON_BUILD_ENABLE=ON -DNGRAPH_ONNX_IMPORT_ENABLE=ON -DENABLE_PYTHON=ON -DPYTHON_EXECUTABLE=/usr/bin/python3.8 -DPYTHON_LIBRARY=/usr/lib/arm-linux-gnueabihf/libpython3.8m.so -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 -DCMAKE_CXX_FLAGS=-latomic ..
RUN  cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_PYTHON=ON -DPYTHON_EXECUTABLE=/usr/bin/python3.8 -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.8m.so -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 -DENABLE_OV_ONNX_FRONTEND=ON ..
RUN make -j8
#RUN make install

########## DOTFILES ##########
RUN su - user -c  "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"


USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
