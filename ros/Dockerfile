FROM s7117/ubuntu-base:20.04

USER root

# Update
RUN apt-get update -y
RUN apt-get upgrade -y

# Install Deps
RUN apt-get install rsync -y

# Setup ROS Keys
RUN sh -c 'echo "deb [trusted=yes] http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update

# Install ROS
RUN apt-get install ros-noetic-desktop-full ros-noetic-ros-tutorials -y

# Install Python Dependencies for ROS
RUN apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
RUN rosdep init
RUN rosdep update

USER user
WORKDIR /home/user

# Add ROS to .bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/user/.bashrc
RUN rosdep update

# Setup Tutorials


# RUN mkdir -p /home/user/ros-packages
# RUN rsync -a --chown=user:user \
#     /opt/ros/noetic/share/ /home/user/ros-packages

# ENV DLURL https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mobotica
# ENV EXT .tar.gz

# RUN wget ${DLURL}/hello${EXT}
# RUN wget ${DLURL}/stagectrl_stage3${EXT}
# RUN wget ${DLURL}/walle_ros${EXT}
# RUN wget ${DLURL}/stage_controllers${EXT}
# RUN wget ${DLURL}/swarm-capture${EXT}
# RUN wget ${DLURL}/simple-standalone${EXT}
# RUN wget ${DLURL}/volksbot${EXT}
# RUN wget ${DLURL}/stage-controllers${EXT}

# RUN for i in $(ls /home/user); do \
#     tar -xvf $i -C /home/user/ros-packages; \
#     done
# RUN rm *.tar.gz

# Command
CMD [ "/bin/bash" ]
