FROM s7117/ubuntu-base:latest

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Setup Miniforge3
RUN su - user -c "mkdir /home/user/.miniforge3"
RUN su - user -c 'wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh"'
RUN su - user -c "chmod 700 ./Miniforge3*.sh"
RUN su - user -c "./Miniforge3-Linux-x86_64.sh -b -p /home/user/.miniforge3 -f"
RUN su - user -c "rm ./Miniforge3*"
RUN su - user -c "/home/user/.miniforge3/bin/conda init bash"
RUN su - user -c "/home/user/.miniforge3/bin/mamba init bash"

WORKDIR /home/user

USER user

# Command
CMD [ "/bin/bash" ]
