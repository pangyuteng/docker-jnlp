package com;

import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;
import java.net.URL;

public class MyTest {
    public static void main(String[] args) {
        System.out.println("begin");
        Properties prop = new Properties();
        URL url = null;
        url = MyTest.class.getClassLoader().getResource("xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("/xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("./xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("com/xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("/com/xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("./com/xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("resources/com/xyz.properties");
        System.out.println("url = " + url); // url = jar:file:/workdir/mytest/foo.jar!/resources/com/xyz.properties
        url = MyTest.class.getClassLoader().getResource("/resources/com/xyz.properties");
        System.out.println("url = " + url); // `url = null`
        url = MyTest.class.getClassLoader().getResource("./resources/com/xyz.properties");
        System.out.println("url = " + url); // `url = null`

        try {
            InputStream in = MyTest.class.getClassLoader().getResourceAsStream("resources/com/xyz.properties");
            System.out.println("in = " + in);

            prop.load(in);
            System.out.println(prop.getProperty("abcd"));
            System.out.println(prop.getProperty("efgh"));
        } catch (IOException e){
            e.printStackTrace();
            System.out.println("error!!");
        }

        System.out.println("---");
        url = MyTest.class.getClassLoader().getResource("resources");
        System.out.println("url = " + url); // url = jar:file:/workdir/mytest/foo.jar!/resources
        url = MyTest.class.getClassLoader().getResource("resources/config");
        System.out.println("url = " + url); // url = jar:file:/workdir/mytest/foo.jar!/resources/config
        url = MyTest.class.getClassLoader().getResource("resources/config/");
        System.out.println("url = " + url); // url = jar:file:/workdir/mytest/foo.jar!/resources/config/
        url = MyTest.class.getClassLoader().getResource("resources/config/*.properties");
        System.out.println("url = " + url);
        
        try {
            InputStream in = MyTest.class.getClassLoader().getResourceAsStream("resources/config/abc.properties");
            System.out.println("in = " + in);

            prop.load(in);
            System.out.println(prop.getProperty("abcd"));
            System.out.println(prop.getProperty("efgh"));
        } catch (IOException e){
            e.printStackTrace();
            System.out.println("error!!");
        }
        System.out.println("end");
    }   
}
