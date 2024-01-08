FROM ros:melodic
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full

ARG DEBIAN_FRONTEND=noninteractive

ENV QT_X11_NO_MITSHM=1

ENV XDG_RUNTIME_DIR=/tmp

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# Dependencies for building packages

RUN apt-get install -y python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    build-essential \
    python3-pip \
    python3-venv

RUN pip3 install catkin-pkg

# Dependencies for catkin python

# RUN apt-get install -y cmake \
#     python-catkin-pkg \
#     python-empy \
#     python-nose \
#     python-setuptools \ 
#     libgtest-dev \
#     build-essential
# RUN apt-get install ros-melodic-catkin


# Initialize rosdep
# RUN apt install -y python-rosdep
# RUN rosdep init
# RUN rosdep update


# ENTRYPOINT [ "source /root/ros_entrypoint.sh" ]