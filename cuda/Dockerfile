FROM nvidia/cuda:11.7.0-devel-ubuntu20.04

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
RUN apt-get install apt-utils -y
RUN apt-get install sudo -y
RUN apt-get install vim git wget curl locales ssh htop -y
RUN apt-get install zsh -y
RUN apt-get install build-essential libssl-dev zlib1g-dev libbz2-dev -y
RUN apt-get install libreadline-dev libsqlite3-dev wget curl llvm -y
RUN apt-get install libncurses5-dev libncursesw5-dev xz-utils tk-dev -y
RUN apt-get install libffi-dev liblzma-dev python-openssl -y
RUN apt-get install g++ make unzip zip -y
RUN apt-get install dos2unix x11-apps -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/zsh --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:temp2022' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/.dotfiles.git /home/user/.dotfiles"

# Clone the nvidia cuda tools
RUN su - user -c "git clone https://github.com/NVIDIA/cuda-samples.git /home/user/cuda_samples"

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/zsh" ]
