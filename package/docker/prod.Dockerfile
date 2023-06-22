ARG SOURCE_IMAGE=project:package-dev-amd64
ARG PROD_BASE=ros:humble-ros-core

FROM ${SOURCE_IMAGE} as dev
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon test

FROM ${PROD_BASE}

COPY --from=dev /project/install /project/install
COPY --from=dev /project/src/package/entrypoint.sh /project/install/entrypoint.sh
RUN chmod -R a+rwx /project/install

WORKDIR /project

RUN echo "source /project/install/setup.bash" >> /root/.bashrc
ENTRYPOINT [ "/project/install/entrypoint.sh" ]

CMD ["sleep", "infinity"]