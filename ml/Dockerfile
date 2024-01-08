FROM s7117/ubunut-conda:latest

WORKDIR /home/user

# Install ML Tools in Conda Env
RUN su - user -c "/home/user/.miniforge3/bin/mamba create --name torchenv python=3.11 -y"
RUN su - user -c "/home/user/.miniforge3/envs/torchenv/bin/python3 -m \
  pip install torch torchvision torchaudio"

# TensorFlow ONLY HAS CPU Support
RUN su - user -c "/home/user/.miniforge3/bin/mamba create --name tfenv python=3.11 -y"
RUN su - user -c "/home/user/.miniforge3/envs/tfenv/bin/python3 -m \
  pip install tensorflow"

USER user

# Command
CMD [ "/bin/bash" ]
