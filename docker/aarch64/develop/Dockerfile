FROM ros:humble-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    build-essential \
    # Add your dependencies
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean

COPY template /template/src/template
WORKDIR /template

RUN . /opt/ros/${ROS_DISTO}/setup.sh && colcon build

COPY template/entrypoint/entrypoint.sh /template
ENTRYPOINT [ "/template/entrypoint.sh" ]

CMD ["sleep", "infinity"]