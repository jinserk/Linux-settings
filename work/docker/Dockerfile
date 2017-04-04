FROM centos:7
ENV container docker

RUN yum -y update; yum clean all

# development tools
RUN yum install -y bzr; yum clean all
RUN yum groups mark install -y "Development Tools"
RUN yum groups mark convert -y "Development Tools"
RUN yum groupinstall -y "Development Tools"

# sshd
RUN yum install -y yum-utils sudo passwd
RUN yum install -y openssl-libs openssh openssh-server openssh-clients
RUN yum clean all

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

RUN sed -ri "s/#Port 22/Port 2222/" /etc/ssh/sshd_config
RUN ./start.sh
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 2222

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 pass=${user} && \
#    mkdir -p /home/${user} && \
#    #mkdir -p /etc/sudoers.d && \
#    echo "${user}:x:${uid}:${gid}:User1,,,:/home/${user}:/bin/bash" >> /etc/passwd && \
#    echo "${user}:x:${uid}:" >> /etc/group && \
#    echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} && \
#    chmod 0440 /etc/sudoers.d/${user} && \
#    chown ${uid}:${gid} -R /home/${user} && \
#    echo -e "${pass}\n${pass}" | (passwd --stdin ${user}) && \
#    echo ssh ${user} password: ${pass}

#RUN echo LANG="en_US.UTF-8" > /etc/default/locale

# add user jbaik
user jbaik
ENV HOME /home/jbaik
WORKDIR $HOME

RUN echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" > $HOME/.bashrc && \
    echo "set -o vi" >> $HOME/.bashrc && \
    echo "set completion-ignore-case on" > $HOME/.inputrc && \
    echo "set editing-mode vi" > $HOME/.inputrc

CMD /bin/bash

# build docker
#$ docker build -t devserver .
# run docker
#$ docker run -v src:/home/jbaik/src -p 2222:2222 -it devserver /bin/bash
