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
  build-essential usbutils \
  g++ make unzip zip zsh \
  dos2unix x11-apps -y

# Install Coral Edge TPU
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN apt-get update
RUN apt-get install libedgetpu1-std python3-pycoral -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN passwd --lock root
RUN echo 'user:temp2023' | chpasswd

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
