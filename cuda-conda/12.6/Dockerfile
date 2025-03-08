FROM s7117/ubuntu-cuda:12.6

USER root

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

USER user
WORKDIR /home/user

# Setup Miniforge3
RUN mkdir /home/user/.miniforge3
RUN wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
RUN chmod 700 ./Miniforge3*.sh
RUN ./Miniforge3-$(uname)-$(uname -m).sh -b -p /home/user/.miniforge3 -f
RUN rm ./Miniforge3*
RUN /home/user/.miniforge3/bin/conda init bash
RUN /home/user/.miniforge3/bin/mamba init bash

# Command
CMD [ "/bin/bash" ]
