# docker-jnlp

+ install wsl2,docker-desktop,vcxsrv

```
choco install vcxsrv
refreshenv
```

+ build container

```
bash up.sh
```

+ check that vcxsrv is running in windows task bar.

+ run in WSL2 or git bash:
```
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY hello-jnlp firefox
```

```
export DISPLAY=10.9.86.54:0.0
export LIBGL_ALWAYS_INDIRECT=1
docker run -it --rm -e DISPLAY=$DISPLAY hello-jnlp bash
java Hello
```




# ref

```
https://blog.sebastian-daschner.com/entries/java_web_start_in_docker_sandbox
https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/generic-linux-install.html
https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
https://github.com/microsoft/WSL/issues/4793
https://github.com/Roche/IceBoar/blob/master/ice-boar-samples/ice-boar-demo/signmac.sh
```
