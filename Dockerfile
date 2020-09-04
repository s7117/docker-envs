# BE SURE TO Add "DOCKER_OPTS="--iptables=false" to /etc/default/docker
FROM ubuntu:20.04

# Set Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

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
RUN apt install ssh -y

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
# NOTE: Agnoster requires you to have the Fira Code Font Family installed to use.
RUN su - s7117 -c 'sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
RUN su - s7117 -c 'sed -i "s/robbyrussell/agnoster/g" .zshrc'
RUN su - s7117 -c 'echo "source ~/OSConfig/ubuntu/.zshrc_custom" >> ~/.zshrc'
RUN su - s7117 -c 'cp ~/OSConfig/ubuntu/agnoster.zsh-theme ~/.oh-my-zsh/themes'
RUN su - s7117 -c 'cp ~/OSConfig/ubuntu/.vimrc ~'

# Configure SSH for the user.
RUN su - s7117 -c 'mkdir ~/.ssh'
RUN su - s7117 -c 'touch ~/.ssh/authorized_keys'
# Add the public keys to the authorized ssh keys for the user.
# Duplicate the following command for every ssh key you wish to add.
RUN su - s7117 -c 'echo "" >> ~/.ssh/authorized_keys'

RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin no\nAllowUsers s7117\nDenyUsers root/g' /etc/ssh/sshd_config
RUN sed -i 's/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
RUN sed -i 's/.*PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

# Copy over the startup script
COPY startup.sh /root/startup.sh
RUN chmod 700 /root/startup.sh 

ENTRYPOINT "/root/startup.sh"

# NOTES:
# docker run --hostname docker -it <image_id> /bin/zsh
# docker exec --hostname docker -it 1559ccc07e79 /bin/zsh
# docker pull s7117/ubuntu_20_04_env:latest
# docker run -t -d --restart unless-stopped --name ubuntu_main s7117/ubuntu_20_04_env
# docker inspect-f "{{ .NetworkSettings.IPAddress }}" <container_name>
# docker exec -u s7117 -w /home/s7117 -ti test_sshd /bin/zsh
# docker run -d -P --restart unless-stopped --name ubuntu_main --hostname docker-infinite s7117/ubuntu_20_04_env
