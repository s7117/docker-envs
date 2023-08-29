FROM ubuntu:20.04

# ENV
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0.0
ENV TERM=xterm-256color

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
  libffi-dev liblzma-dev usbutils \
  g++ make unzip zip zsh \
  dos2unix x11-apps cmake python3.9 libpython3.9 -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN passwd --lock root
RUN echo 'user:temp2023' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"

# OPENVINO SETUP
RUN mkdir -p /opt/intel
COPY l_openvino_toolkit_debian9_2022.3.1_arm64.tgz /opt/intel
COPY l_openvino_toolkit_debian9_2022.3.1_arm64.tgz.sha256 /opt/intel
WORKDIR /opt/intel
RUN cat l_openvino_toolkit_debian9_2022.3.1_arm64.tgz.sha256 | shasum -a 256 --check
RUN tar -xf l_openvino_toolkit_debian9_2022.3.1_arm64.tgz
RUN mv l_openvino_toolkit_debian9_2022.3.1.9227.cf2c7da5689_arm64 openvino_2022.3.1
WORKDIR /opt/intel/openvino_2022.3.1
RUN install_dependencies/install_openvino_dependencies.sh
RUN python3.9 -m pip install -r python/python3.9/requirements.txt
WORKDIR /opt/intel
RUN ln -s openvino_2022.3.1 openvino_2022
RUN ln -s openvino_2022.3.1 openvino

# LIB USB
WORKDIR /tmp
RUN curl -L https://github.com/libusb/libusb/archive/v1.0.22.zip --output v1.0.22.zip; \
  unzip v1.0.22.zip; \
  rm -rf v1.0.22.zip

WORKDIR /tmp/libusb-1.0.22
RUN ./bootstrap.sh; \
  ./configure --disable-udev --enable-shared; \
  make "-j$(nproc)"

RUN mv /tmp/libusb-1.0.22 /opt/libusb-1.0.22

WORKDIR /opt/libusb-1.0.22
RUN ./libtool --mode=install install -c libusb/libusb-1.0.la /usr/local/lib/; \
  mkdir -p /usr/local/include/libusb-1.0; \
  install -c -m 644 libusb/libusb.h /usr/local/include/libusb-1.0; \
  mkdir -p /usr/local/lib/pkgconfig; \
  install -c -m 644 libusb-1.0.pc /usr/local/lib/pkgconfig

WORKDIR /opt/intel/openvino_2022
RUN chmod +x install_dependencies/install_NCS_udev_rules.sh; \
  ./install_dependencies/install_NCS_udev_rules.sh

# Modify .bashrc for user
RUN su - user -c "echo 'source /opt/intel/openvino_2022/setupvars.sh -pyver 3.9' >> /home/user/.bashrc"

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]