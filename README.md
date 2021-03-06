# docker-jnlp

+ [for windows] install chocolatey,wsl2,docker-desktop,vcxsrv

```
choco install openssh -params '"/SSHServerFeature /KeyBasedAuthenticationFeature"' –y
choco install vcxsrv -y
refreshenv
```
follow below 2 links to ensure you can launch gui via docker
https://4sysops.com/archives/install-openssh-on-windows-for-powershell-core-remoting-via-ssh/
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde



+ build container

```
bash up.sh
```

+ [for windows] check that vcxsrv is running in windows task bar.

+ [for windows] use WSL2 or git bash as terminal:
```
# run firefox
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY jnlp firefox

# run hello-world app
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY -w /workdir -v $PWD:/workdir jnlp bash
javac -d . Hello.java
java Hello
```

+ [WIP] [for ubuntu]:
```
# ubuntu - x11 not visible within docker
export DISPLAY=:1
export DISPLAY=192.168.68.117:0.0
docker run -it --rm -e DISPLAY=$DISPLAY -w /workdir -v $PWD:/workdir -v /tmp/.X11-unix:/tmp/.X11-unix jnlp bash
javac -d . Hello.java
java Hello
```

+ within docker (win & ubuntu)
```
javac -d . Hello.java
jar cvf Hello.jar Hello.class
jar cvmf MANIFEST.MF Hello.jar Hello.class
java -jar Hello.jar
javaws hello.jnlp

```




# ref

```
https://blog.sebastian-daschner.com/entries/java_web_start_in_docker_sandbox
http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/generic-linux-install.html
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
https://github.com/microsoft/WSL/issues/4793
https://www.tecmint.com/create-and-execute-jar-file-in-linux

https://github.com/Roche/IceBoar/blob/master/ice-boar-samples/ice-boar-demo/signmac.sh
```
