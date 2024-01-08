FROM s7117/ubuntu-base:latest

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Install Coral Edge TPU
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN apt-get update
RUN apt-get install libedgetpu1-std python3-pycoral -y

USER user
WORKDIR /home/user

# Command
CMD [ "/bin/bash" ]
