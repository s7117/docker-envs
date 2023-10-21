FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

# ENV
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=host.docker.internal:0.0
ENV TERM=xterm-256color
ENV MF3_PATH="/home/user/.miniforge3"

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
  g++ make unzip zip dos2unix x11-apps usbutils -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/bash --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN passwd --lock root
RUN echo 'user:temp2023' | chpasswd

# Clone the nvidia cuda tools
RUN su - user -c "git clone https://github.com/NVIDIA/cuda-samples.git /home/user/cuda_samples"

WORKDIR /home/user

# Setup Miniforge3
RUN su - user -c "mkdir /home/user/.miniforge3"
RUN su - user -c 'wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"'
RUN su - user -c "chmod 700 ./Miniforge3*.sh"
RUN su - user -c "./Miniforge3-Linux-x86_64.sh -b -p /home/user/.miniforge3 -f"
RUN su - user -c "rm ./Miniforge3*"
RUN su - user -c "/home/user/.miniforge3/bin/conda init bash"

# Install ML Tools in Conda Env
RUN su - user -c "/home/user/.miniforge3/bin/conda create --name torchgpu \
  pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia"

RUN su - user -c "/home/user/.miniforge3/bin/conda create --name tfgpu \
  tensorflow-gpu"

USER user

# Command
CMD [ "/bin/bash" ]
