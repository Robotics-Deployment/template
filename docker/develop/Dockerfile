ARG BASE
FROM ${BASE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean

COPY src/package /template/src/package
WORKDIR /template

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build

COPY src/package/entrypoint.sh /template
ENTRYPOINT [ "/template/entrypoint.sh" ]

CMD ["sleep", "infinity"]