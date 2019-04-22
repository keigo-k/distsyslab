ARG IMAGE_TAG="centos7.4.1708"
FROM centos:${IMAGE_TAG}

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done) \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/*

RUN yum check \
    && yum -y update \
    && yum -y install sudo openssh-server openssh-clients

RUN sed -i 's;PermitRootLogin prohibit-password;PermitRootLogin no;' /etc/ssh/sshd_config \
    && sed -i 's;#PasswordAuthentication yes;PasswordAuthentication no;' /etc/ssh/sshd_config \
    && chmod 4755 /bin/ping

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
