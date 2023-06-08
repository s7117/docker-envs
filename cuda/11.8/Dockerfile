FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

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
RUN apt-get install apt-utils sudo \
  vim git wget curl locales ssh htop \
  build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev \
  libffi-dev liblzma-dev python-openssl \
  g++ make unzip zip dos2unix x11-apps zsh usbutils -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN passwd --lock root
RUN echo 'user:temp2023' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"

# Clone the nvidia cuda tools
RUN su - user -c "git clone https://github.com/NVIDIA/cuda-samples.git /home/user/cuda_samples"

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
