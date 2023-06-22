FROM nvidia/cuda:10.2-devel-ubuntu18.04

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

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"

# Clone the nvidia cuda tools
RUN su - user -c "git clone https://github.com/NVIDIA/cuda-samples.git /home/user/cuda_samples"

# Setup TensorRT 8.2.1.8
COPY ./nv-tensorrt-repo-ubuntu1804-cuda10.2-trt8.2.1.8-ga-20211117_1-1_amd64.deb /
RUN dpkg -i /nv-tensorrt-repo-ubuntu1804-cuda10.2-trt8.2.1.8-ga-20211117_1-1_amd64.deb
RUN apt-key add /var/nv-tensorrt-repo-ubuntu1804-cuda10.2-trt8.2.1.8-ga-20211117/7fa2af80.pub
RUN apt-get update
RUN dpkg -i /var/nv-tensorrt-repo-ubuntu1804-cuda10.2-trt8.2.1.8-ga-20211117/*.deb
RUN apt-get update
RUN apt-mark hold graphsurgeon-tf libcudnn8 libcudnn8-dev onnx-graphsurgeon uff-converter-tf
RUN apt-get install tensorrt=8.2.1.8-1+cuda10.2

RUN apt-get upgrade -y

WORKDIR /home/user

# Setup Miniforge3
RUN su - user -c "mkdir /home/user/.miniforge3"
RUN su - user -c 'wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"'
RUN su - user -c "chmod 700 ./Miniforge3*.sh"
RUN su - user -c "./Miniforge3-Linux-x86_64.sh -b -p /home/user/.miniforge3 -f"
RUN su - user -c "rm ./Miniforge3*"
RUN su - user -c "/home/user/.miniforge3/bin/conda init bash"
RUN su - user -c "source /home/user/.bashrc"
# RUN su - user -c 'eval "$(~/.miniforge3/bin/conda shell.bash hook)"'

# Compile PyTorch 1.10.1 from source to use more capable GPUs
RUN su - user -c "/home/user/.miniforge3/bin/conda create --name buildtorch python=3.6.9 astunparse numpy ninja pyyaml mkl mkl-include setuptools cmake cffi typing_extensions future six requests dataclasses -y"
RUN su - user -c "/home/user/.miniforge3/bin/conda install -n buildtorch -c pytorch magma-cuda102 -y"
RUN su - user -c "/home/user/.miniforge3/bin/conda run -n buildtorch /bin/bash -c python3 --version"
# Get the source code
RUN su - user -c "mkdir -p pytorch"
RUN su - user -c "git clone --recursive https://github.com/pytorch/pytorch /home/user/pytorch"
WORKDIR /home/user/pytorch
RUN su - user -c "cd /home/user/pytorch && git fetch --all --tags --prune"
RUN su - user -c "cd /home/user/pytorch && git checkout tags/v1.10.1"
RUN su - user -c "cd /home/user/pytorch && git submodule sync"
RUN su - user -c "cd /home/user/pytorch && git submodule update --init --recursive --jobs 0"
ENV TORCH_CUDA_ARCH_LIST="7.5"
ENV CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
RUN su - user -c "/home/user/.miniforge3/bin/conda run -n buildtorch /bin/bash -c 'cd /home/user/pytorch && python setup.py install'"

# Install ML Tools in Conda Env
#RUN su - user -c "/home/user/.miniforge3/bin/conda create --name torchgpu \
#  pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia"
#RUN su - user -c "/home/user/.miniforge3/bin/conda create --name tfgpu \
#  tensorflow-gpu"

WORKDIR /home/user
USER user

# Command
CMD [ "/bin/bash" ]
