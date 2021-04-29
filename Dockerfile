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

COPY Hello.java .
RUN javac Hello.java
CMD ["java", "Hello"] 

RUN apt-get install -y firefox



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