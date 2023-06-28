ARG SOURCE_IMAGE=project:package-dev-amd64
ARG PROD_BASE=ros:humble-ros-core

FROM ${SOURCE_IMAGE} as dev
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && cargo test --manifest-path src/package/Cargo.toml

FROM ${PROD_BASE}

COPY --from=dev /rclrs/install /rclrs/install
COPY --from=dev /project/install /project/install
COPY --from=dev /project/src/package/entrypoint.sh /project/install/package/share/package/entrypoint.sh

WORKDIR /project

RUN echo "source /project/install/setup.bash" >> /root/.bashrc
RUN chmod +x /project/install/package/share/package/entrypoint.sh
ENTRYPOINT [ "/project/install/package/share/package/entrypoint.sh" ]

CMD ["sleep", "infinity"]