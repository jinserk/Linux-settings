FROM centos:7
ENV container docker

RUN yum -y update; yum clean all
RUN yum install -y yum-utils
RUN yum install -y sudo bzr openssh openssh-server openssh-clients
RUN yum groups mark install -y "Development Tools"
RUN yum groups mark convert -y "Development Tools"
RUN yum groupinstall -y "Development Tools"

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/jbaik && \
    #mkdir -p /etc/sudoers.d && \
    echo "jbaik:x:${uid}:${gid}:User1,,,:/home/jbaik:/bin/bash" >> /etc/passwd && \
    echo "jbaik:x:${uid}:" >> /etc/group && \
    echo "jbaik ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jbaik && \
    chmod 0440 /etc/sudoers.d/jbaik && \
    chown ${uid}:${gid} -R /home/jbaik

RUN echo LANG="en_US.UTF-8" > /etc/default/locale

# add port 22 for sshd
RUN sed -ri "s/#Port/Port" /etc/ssh/sshd_config
EXPOSE 22

# add user jbaik
USER jbaik
ENV HOME /home/jbaik
WORKDIR $HOME

RUN echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" > $HOME/.bashrc && \
    echo "set -o vi" >> $HOME/.bashrc && \
    echo "set completion-ignore-case on" > $HOME/.inputrc && \
    echo "set editing-mode vi" > $HOME/.inputrc

CMD /bin/bash
FROM centos:7
ENV container docker

RUN yum -y update; yum clean all
RUN yum install -y yum-utils
RUN yum install -y sudo bzr openssh openssh-server openssh-clients
RUN yum groups mark install -y "Development Tools"
RUN yum groups mark convert -y "Development Tools"
RUN yum groupinstall -y "Development Tools"

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/jbaik && \
    #mkdir -p /etc/sudoers.d && \
    echo "jbaik:x:${uid}:${gid}:User1,,,:/home/jbaik:/bin/bash" >> /etc/passwd && \
    echo "jbaik:x:${uid}:" >> /etc/group && \
    echo "jbaik ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jbaik && \
    chmod 0440 /etc/sudoers.d/jbaik && \
    chown ${uid}:${gid} -R /home/jbaik

RUN echo LANG="en_US.UTF-8" > /etc/default/locale

# add port 22 for sshd
RUN sed -ri "s/#Port/Port" /etc/ssh/sshd_config
EXPOSE 22

# add user jbaik
USER jbaik
ENV HOME /home/jbaik
WORKDIR $HOME

RUN echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" > $HOME/.bashrc && \
    echo "set -o vi" >> $HOME/.bashrc && \
    echo "set completion-ignore-case on" > $HOME/.inputrc && \
    echo "set editing-mode vi" > $HOME/.inputrc

CMD /bin/bash
