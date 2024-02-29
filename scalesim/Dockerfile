FROM s7117/ubuntu-base:20.04

USER root

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Install ScaleSim
RUN apt-get install python3-pip -y
RUN pip3 install scalesim

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
