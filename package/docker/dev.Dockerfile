ARG SOURCE_IMAGE=ros:humble-ros-core
FROM ${SOURCE_IMAGE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-dev-tools \
    gdb \
    git \
    curl \
    libclang-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y \
    && apt-get clean

RUN python3 -m pip install --upgrade pip

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install --debug cargo-ament-build
RUN python3 -m pip install --no-cache-dir \
    git+https://github.com/colcon/colcon-cargo.git \
    git+https://github.com/colcon/colcon-ros-cargo.git

RUN mkdir -p /rclrs/src && cd /rclrs && \
    git clone https://github.com/ros2-rust/ros2_rust.git src/ros2_rust && \
    vcs import src < src/ros2_rust/ros2_rust_humble.repos

RUN cd /rclrs && \
    . /opt/ros/${ROS_DISTRO}/setup.sh && \
    colcon build

COPY package /project/src/package
WORKDIR /project

RUN . /rclrs/install/setup.sh && colcon build
RUN echo "source /project/install/setup.bash" >> /root/.bashrc
ENTRYPOINT [ "/project/src/package/entrypoint.sh" ]

CMD ["sleep", "infinity"]