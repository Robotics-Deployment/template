ARG SOURCE_IMAGE=ros:humble-ros-core
FROM ${SOURCE_IMAGE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-dev-tools \
    gdb \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean

COPY package /project/src/package
WORKDIR /project

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build
RUN echo "source /project/install/setup.bash" >> /root/.bashrc
ENTRYPOINT [ "/project/src/package/entrypoint.sh" ]

CMD ["sleep", "infinity"]