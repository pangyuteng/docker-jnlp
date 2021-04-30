FROM ubuntu:18.04

# xorg and sudo is needed to run X as non-root
RUN apt-get update && \
    apt-get install -y \ 
        software-properties-common \
        xorg sudo wget curl \
        java-common

RUN curl -LO https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.deb && \
    dpkg -i amazon-corretto-8-x64-linux-jdk.deb

RUN add-apt-repository ppa:maarten-fonville/ppa && \
    apt-get update && \
    apt-get install -y icedtea-8-plugin

RUN apt-get install -y firefox

RUN mkdir -p /opt/hello
WORKDIR /opt/hello

RUN apt-get install -y unzip zip

RUN curl -s get.sdkman.io | bash

RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
    yes | sdk install groovy 3.0.8 && \
    yes | sdk install gradle 7.0 && \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"



# groovy 2.4.16, gradle 4.4.1
# RUN apt-get install -y groovy gradle
# ENV GRADLE_USER_HOME=/tmp/gradle-cache



















# # run X as non-root
# RUN export uid=1000 gid=1000 && \
#     mkdir -p /home/dockeruser && \
#     echo "dockeruser:x:${uid}:${gid}:Developer,,,:/home/dockeruser:/bin/bash" >> /etc/passwd && \
#     echo "dockeruser:x:${uid}:" >> /etc/group && \
#     echo "dockeruser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dockeruser && \
#     chmod 0440 /etc/sudoers.d/dockeruser && \
#     chown ${uid}:${gid} -R /home/dockeruser

# RUN apt-get install -y firefox

# USER dockeruser
# ENV HOME /home/dockeruser

# RUN curl -s get.sdkman.io | bash && \
#     source "$HOME/.sdkman/bin/sdkman-init.sh" && \
#     sdk install groovy


# # run X as non-root
# RUN export uid=1000 gid=1000 && \
#     mkdir -p /home/dockeruser && \
#     echo "dockeruser:x:${uid}:${gid}:Developer,,,:/home/dockeruser:/bin/bash" >> /etc/passwd && \
#     echo "dockeruser:x:${uid}:" >> /etc/group && \
#     echo "dockeruser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dockeruser && \
#     chmod 0440 /etc/sudoers.d/dockeruser && \
#     chown ${uid}:${gid} -R /home/dockeruser

# RUN apt-get install -y firefox

# USER dockeruser
# ENV HOME /home/dockeruser