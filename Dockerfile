# BE SURE TO Add "DOCKER_OPTS="--iptables=false" to /etc/default/docker
FROM ubuntu:20.04

# Update
RUN apt update -y
RUN apt upgrade -y

# Install Packages
RUN apt install sudo -y
RUN apt install vim -y
RUN apt install zsh -y
RUN apt install git -y
RUN apt install wget -y
RUN apt install curl -y
RUN apt install locales -y
RUN apt install zsh-syntax-highlighting -y
RUN apt install zsh-autosuggestions -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser s7117 --shell /bin/zsh --disabled-password --home /home/s7117 --gecos ""
RUN usermod -aG sudo s7117
RUN echo 's7117:temp2020' | chpasswd

# Configure git

RUN su - s7117 -c "git config --global user.name 'Peyton Chandarana'"
RUN su - s7117 -c "git config --global user.email 'peytonchandarana@gmail.com'"
RUN su - s7117 -c "git clone https://github.com/s7117/OSConfig"

# Configure OH-MY-ZSH
RUN su - s7117 -c 'sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
RUN su - s7117 -c 'sed -i "s/robbyrussell/agnoster/g" .zshrc'
RUN su - s7117 -c 'echo "source ~/OSConfig/ubuntu/.zshrc_custom" >> ~/.zshrc'
RUN su - s7117 -c 'cp ~/OSConfig/ubuntu/agnoster.zsh-theme ~/.oh-my-zsh/themes'

# Switch shell to zsh
USER s7117
WORKDIR /home/s7117

# NOTES:
# docker run --hostname docker -it <image_id> /bin/zsh
# docker exec --hostname docker -it 1559ccc07e79 /bin/zsh
# docker pull s7117/ubuntu_20_04_env:latest
# docker run -t -d --restart unless-stopped --name ubuntu_main s7117/ubuntu_20_04_env
