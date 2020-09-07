FROM ubuntu:20.04

# Set Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Install Packages
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install zsh -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install locales -y
RUN apt-get install zsh-syntax-highlighting -y
RUN apt-get install zsh-autosuggestions -y
RUN apt-get install ssh -y
RUN apt-get install build-essential libssl-dev zlib1g-dev libbz2-dev -y
RUN apt-get install libreadline-dev libsqlite3-dev wget curl llvm -y
RUN apt-get install libncurses5-dev libncursesw5-dev xz-utils tk-dev -y
RUN apt-get install libffi-dev liblzma-dev python-openssl -y
RUN apt-get install g++ make -y
RUN apt-get install unzip zip -y

# Set locale
RUN locale-gen en_US.UTF-8

# Create a new user
RUN adduser user --shell /bin/zsh --disabled-password --home /home/user --gecos ""
RUN usermod -aG sudo user
RUN echo 'user:temp2020' | chpasswd

# Get the os configs
RUN su - user -c "git clone https://github.com/s7117/OSConfig"

# Configure OH-MY-ZSH
# NOTE: Agnoster requires you to have the Fira Code Font Family installed to use.
RUN su - user -c 'sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
RUN su - user -c 'sed -i "s/robbyrussell/agnoster/g" .zshrc'
RUN su - user -c 'echo "source ~/OSConfig/ubuntu/.zshrc_custom" >> ~/.zshrc'
RUN su - user -c 'cp ~/OSConfig/ubuntu/agnoster.zsh-theme ~/.oh-my-zsh/themes'
RUN su - user -c 'cp ~/OSConfig/ubuntu/.vimrc ~'

# Install Pyenv
RUN su - user -c 'curl https://pyenv.run | zsh'
RUN echo 'export PATH="/home/user/.pyenv/bin:$PATH"' >> /home/user/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> /home/user/.zshrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> /home/user/.zshrc

# Configure SSH for the user.
RUN su - user -c 'mkdir ~/.ssh'
RUN su - user -c 'touch ~/.ssh/authorized_keys'
# Add the public keys to the authorized ssh keys for the user.
# Duplicate the following command for every ssh key you wish to add.
RUN su - user -c 'echo "" >> ~/.ssh/authorized_keys'
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin no\nAllowUsers user\nDenyUsers root/g' /etc/ssh/sshd_config
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
# docker exec -u user -w /home/user -ti test_sshd /bin/zsh
# docker run -d -P --restart unless-stopped --name ubuntu_main --hostname docker-infinite s7117/ubuntu_20_04_env
