# docker-jnlp

+ [for windows] install chocolatey,wsl2,docker-desktop,vcxsrv

```
choco install vcxsrv
refreshenv
```

+ build container

```
bash up.sh
```

+ [for windows] check that vcxsrv is running in windows task bar.

+ [for windows] run in WSL2 or git bash:
```
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY jnlp firefox

# windows
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY -w /workdir -v $PWD:/workdir jnlp bash
javac -d . Hello.java
java Hello
```

+ [WIP] for ubuntu
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
