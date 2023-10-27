FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

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
RUN apt-get install apt-utils \
  sudo vim git wget curl locales ssh htop \
  build-essential usbutils \
  g++ make unzip zip zsh \
  dos2unix x11-apps -y

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
RUN su - user -c "/home/user/.miniforge3/bin/mamba init bash"

# Install ML Tools in Conda Env
RUN su - user -c "/home/user/.miniforge3/bin/mamba create --name torchgpu python=3.11 -y"
RUN su - user -c "/home/user/.miniforge3/envs/torchgpu/bin/python3 -m \
  pip install torch torchvision torchaudio \
  --index-url https://download.pytorch.org/whl/cu118"

RUN su - user -c "/home/user/.miniforge3/bin/mamba create --name tfgpu python=3.11 -y"
RUN su - user -c "/home/user/.miniforge3/envs/tfgpu/bin/python3 -m \
  pip install tensorflow"

USER user

# Command
CMD [ "/bin/bash" ]
