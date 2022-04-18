FROM ubuntu:20.04

EXPOSE 943

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

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/zsh --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:temp2022' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/dotfiles /home/user/.dotfiles"

WORKDIR /home/user

# OpenVPN Access Server Packages
RUN apt-get update -y
RUN apt-get install ca-certificates wget net-tools gnupg -y
RUN wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
RUN echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
RUN apt-get update -y
RUN apt-get install openvpn-as -y

USER user

# Command
CMD [ "/bin/zsh" ]
