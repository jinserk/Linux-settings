#!/bin/bash

__create_user() {
    # Create a user to SSH into as.

    useradd jbaik
    #echo "${USER}:x:${UID}:${GID}:User1,,,:/home/${USER}:/bin/bash" >> /etc/passwd
    #echo "${USER}:x:${UID}:" >> /etc/group
    #echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER}
    #chmod 0440 /etc/sudoers.d/${USER}
    #chown ${UID}:${GID} -R /home/${USER}
    echo "jbaik ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jbaik
    chmod 0440 /etc/sudoers.d/jbaik

    SSH_USERPASS=newpass
    echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin jbaik)
    echo ssh jbaik password: $SSH_USERPASS
}

# Call all functions
__create_user

