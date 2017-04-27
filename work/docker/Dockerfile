FROM centos:7
ENV container docker

RUN yum install -y epel-release \
	               http://files.freeswitch.org/freeswitch-release-1-6.noarch.rpm \
				   http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm \
  ; yum clean all 
RUN yum -y update \
  ; yum clean all

# development tools
RUN yum install -y bzr \
  ; yum clean all
RUN yum groups mark install -y "Development Tools" \
  ; yum groups mark convert -y "Development Tools" \
  ; yum groupinstall -y "Development Tools" \
  ; yum clean all

# sshd
RUN yum install -y yum-utils sudo passwd \
  ; yum clean all
RUN yum install -y openssl-libs openssh openssh-server openssh-clients \
  ; yum clean all

# freeswitch install
RUN yum install -y freeswitch-config-vanilla freeswitch-lang-* \
                   freeswitch-sounds-* freeswitch-devel \
  ; yum clean all 
RUN yum install -y git gcc-c++ wget alsa-lib-devel autoconf automake bison \
                   broadvoice-devel bzip2 curl-devel db-devel e2fsprogs-devel \
                   flite-devel g722_1-devel gdbm-devel gnutls-devel ilbc2-devel \
                   ldns-devel libcodec2-devel libcurl-devel libedit-devel \
                   libidn-devel libjpeg-devel libmemcached-devel libogg-devel \
                   libsilk-devel libsndfile-devel libtiff-devel libtheora-devel \
                   libtool libvorbis-devel libxml2-devel lua-devel lzo-devel \
                   mongo-c-driver-devel ncurses-devel net-snmp-devel \
                   openssl-devel pcre-devel perl perl-ExtUtils-Embed \
                   pkgconfig portaudio-devel postgresql-devel python26-devel \
                   python-devel soundtouch-devel speex-devel sqlite-devel \
                   unbound-devel unixODBC-devel libuuid-devel which yasm zlib-devel \
  ; yum clean all

# other dependencies
RUN yum install -y expat-devel fcgi-devel libusb-devel lame-devel \
				   httpd php php-devel \
  ; yum clean all

# vim 8
RUN curl -fLo /etc/yum.repos.d/mcepl-vim8-epel-7.repo \
  	     https://copr.fedorainfracloud.org/coprs/mcepl/vim8/repo/epel-7/mcepl-vim8-epel-7.repo
RUN rpm --import https://copr-be.cloud.fedoraproject.org/results/mcepl/vim8/pubkey.gpg 
RUN yum install -y vim \
  ; yum clean all

# setting freeswitch
RUN systemctl enable freeswitch

# setting sshd
#RUN mkdir /var/run/sshd
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

#ADD ./start.sh /start.sh
#RUN chmod 755 /start.sh

#RUN sed -ri "s/#Port 2222/Port 2222/" /etc/ssh/sshd_config
#RUN sed -ri "s/UsePAM yes/#UsePAM yes/g" /etc/ssh/sshd_config
#RUN sed -ri "s/#UsePAM no/UsePAM no/g" /etc/ssh/sshd_config
#RUN ./start.sh
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#EXPOSE 2222

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

RUN useradd jbaik
RUN echo "jbaik ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jbaik
RUN chmod 0440 /etc/sudoers.d/jbaik

# add user jbaik
user jbaik
ENV HOME /home/jbaik
WORKDIR $HOME

RUN echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" > $HOME/.bashrc && \
    echo "set -o vi" >> $HOME/.bashrc && \
    echo "alias vi=vim" >> $HOME/.bashrc && \
    echo "export EDITOR=vim" >> $HOME/.bashrc && \
    echo "set completion-ignore-case on" > $HOME/.inputrc && \
    echo "set editing-mode vi" > $HOME/.inputrc

RUN curl -fLo ~/.vimrc https://raw.githubusercontent.com/jinserk/DebianSetting/master/home/.vimrc
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

CMD /bin/bash
