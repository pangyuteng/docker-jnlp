rm com/MyTest.class
rm foo.jar
javac com/MyTest.java
jar cvf foo.jar com resources
jar tf foo.jar
java -cp foo.jar com.MyTest

