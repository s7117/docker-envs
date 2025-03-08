FROM ubuntu:20.04

# ENV
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0.0
ENV TERM=xterm-256color
ENV USER=user

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
  dos2unix x11-apps -y

# GUI Applications Setup
RUN apt-get install xfce4 xfce4-goodies tightvncserver -y

# Install Hardware Development Tools
RUN apt-get install verilator -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN passwd --lock root
RUN echo 'user:change-this-2025' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"

# Configure VNC
RUN su - user -c 'mkdir -p ~/.vnc'
RUN su - user -c 'echo "#!/bin/bash" > ~/.vnc/xstartup'
RUN su - user -c 'echo "xrdb $HOME/.Xresources" >> ~/.vnc/xstartup'
RUN su - user -c 'echo "startxfce4 &" >> ~/.vnc/xstartup'
RUN su - user -c 'chmod +x ~/.vnc/xstartup'

# Copy Xilinx Installers to user's home dir
COPY ./Xilinx* /home/user

# Setup Xilinx Vitis

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
