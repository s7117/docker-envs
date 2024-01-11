FROM s7117/ubunut-conda:22.04

USER root

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

USER user
WORKDIR /home/user

# Install ML Tools in Conda Env
RUN /home/user/.miniforge3/bin/mamba create --name torchenv python=3.11 -y
RUN /home/user/.miniforge3/envs/torchenv/bin/python3 -m \
  pip install torch torchvision torchaudio

# TensorFlow ONLY HAS CPU Support
RUN /home/user/.miniforge3/bin/mamba create --name tfenv python=3.11 -y
RUN /home/user/.miniforge3/envs/tfenv/bin/python3 -m \
  pip install tensorflow

# Command
CMD [ "/bin/bash" ]
