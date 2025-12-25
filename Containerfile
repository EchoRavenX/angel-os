FROM scratch AS ctx
COPY build_files /

FROM quay.io/fedora-ostree-desktops/cosmic-atomic:rawhide

RUN rm /opt && mkdir /opt

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh
RUN useradd -m -s /bin/bash live && \
    echo 'live:live' | chpasswd && \
    usermod -aG wheel live && \
    echo 'live ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/live && \
    chmod 440 /etc/sudoers.d/live
RUN bootc container lint
