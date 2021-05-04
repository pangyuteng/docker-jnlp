+ run the below.
```
cd $projectRoot
docker build -t jnlp .
docker run -it -v $PWD:/workdir -w /workdir jnlp bash
cd mytest
bash everything.sh
```

+ printout from above.
```
begin
url = null
url = null
url = null
url = null
url = null
url = null
url = jar:file:/workdir/mytest/foo.jar!/resources/com/xyz.properties
url = null
url = null
in = sun.net.www.protocol.jar.JarURLConnection$JarURLInputStream@42a57993
directory
sortcol
---
url = jar:file:/workdir/mytest/foo.jar!/resources
url = jar:file:/workdir/mytest/foo.jar!/resources/config
url = jar:file:/workdir/mytest/foo.jar!/resources/config/
url = null
in = null
Exception in thread "main" java.lang.NullPointerException                                                      at java.util.Properties$LineReader.readLine(Properties.java:434)                                       at java.util.Properties.load0(Properties.java:353)                                                     at java.util.Properties.load(Properties.java:341)                                                      at com.MyTest.main(MyTest.java:61)
```