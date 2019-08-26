# gradle-springmvc-web
#1.创建 Gradle Java 项目

**1.**`new project`—`Gradle`—选择对应`SDK`—`Java`—`Next`。
&emsp;选择gradle项目，自己环境中的SDK（最低版本为JDK1.8），创建JAVA项目。
![new project1.png](https://upload-images.jianshu.io/upload_images/17834333-7d375ba3426fbfb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

**2.**输入`GroupId`—输入`artifictId`—`Next`。
&emsp;输入groupId，命名请遵循相应命名规范。公司-com;组织-org；个人-pers。
![new project1.png](https://upload-images.jianshu.io/upload_images/17834333-b42d213c787e6caa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

**3.**选择`Use auto-import`—选择`Use local gradle distribution`—`Next`。
&emsp;选择自动导入，使用本地gradle环境，选择后会自动出现本地配置的`GRADLE_HOME`路径,然后选择本地的`jdk`配置即可。
![new project3.png](https://upload-images.jianshu.io/upload_images/17834333-95118c513bfc5794.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

**4.**输入`Project name`—选择`Project location`—`Finish`。
&emsp;输入项目名称，选择相对应的项目存储路径，点击Finish，一个gradle java项目创建完成。
![new project4.png](https://upload-images.jianshu.io/upload_images/17834333-bea86b283e73d66d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

**5.**看到项目中出现文件`build.gradle`并且`Build:Sync`无异常，说明gradle java项目已创建成功。
![gradle java.png](https://upload-images.jianshu.io/upload_images/17834333-a6b7793ee8e52660.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

**6.**点击`file`—`settings`—`Build,Excution,deployment`—`Build Tools`—`Gradle`—选择`Offline`。
&emsp;将gradle设置为离线工作模式，并且可查看到 `service directory path`为`GRADLE_USER_HOME`路径，该路径为gradle jar包存放地址。
![setting.png](https://upload-images.jianshu.io/upload_images/17834333-1e7afa2d1431f40d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

#2.Gradle build.gradle配置文件介绍
```
//创建项目输入groupId
group 'pers.gradle'
//创建项目所输入的版本
version '1.0-SNAPSHOT'
//指定运行环境，java
apply plugin: 'java'
//指定为java web项目
apply plugin: 'war'
//jdk的版本，1.8
sourceCompatibility = 1.8
/**
 * 指定所使用仓库的路径
 * mavenCentral()，中央仓库，项目中所使用的jar包都会从中央仓库下载到本地仓库。
 *                 若本地仓库已经拥有相应的jar包，则不会重复下载
 *                 可以使用命令maven { url "http://maven.aliyun.com/nexus/content/groups/public" }指定maven的远程仓库地址
 * mavenLocal()本地仓库，与GRADLE_USER_HOME配置的路径一致。
 * */
repositories {
    mavenLocal()
    maven { url "http://maven.aliyun.com/nexus/content/groups/public" }
    mavenCentral()
}
/**
 * gradle所有的jar包文件坐标都在dependencies属性内放置
 * 每一个jar包都具备以下特点
 * 1.scope（作用域）：gradle支持compile、runtime、testCompile、testRuntime四种scope
 *   compile：jar包在编译期与运行期依赖。
 *   runtime：jar包在运行期依赖。
 *   testCompile：jar包在测试编译期与运行期依赖。
 *   testRuntime：jar包在测试运行期依赖。
 *   补充：
 *   providedCompile：jar包/依赖代码 仅在编译的时候需要，但是在运行时不需要依赖。
 *   providedCompile与compile,runtime区别：
 *   compile: 前提：apply plugin: 'war'或者apply plugin: 'java'
 *   providedCompile:前提：apply plugin: 'war'，若前提为'java',则使用compileOnly
 *   runtime:前提：apply plugin: 'war'
 *   以上所说的前提，如果不正确配置的话，就会遇到依赖包无法导入，以及runtime以及providedCompile无法使用的情况。
 * 2. group:与maven的groupId一致。
 *    name:与maven的artifactId一致。
 *    version:与maven的version一致。
 */
dependencies {
    //gradle jar包坐标可以访问，maven中央仓库[https://mvnrepository.com]，找到相对应的jar包，选择[gradle]选项卡，复制该地址即可。
    //引入spring依赖
    compile group: 'org.springframework', name: 'spring-context', version: '5.1.5.RELEASE'
    //引入spring-web依赖
    compile group: 'org.springframework', name: 'spring-web', version: '5.1.5.RELEASE'
    //引入spring-webmvc依赖
    compile group: 'org.springframework', name: 'spring-webmvc', version: '5.1.5.RELEASE'
    //引入servlet依赖
    providedCompile group: 'javax.servlet', name: 'javax.servlet-api', version: '4.0.1'
    //引入jsp依赖
    providedCompile group: 'javax.servlet', name: 'jsp-api', version: '2.0'
    //引入lombok依赖
    //@Data注解在类上，会为类的所有属性自动生成setter/getter、equals、canEqual、hashCode、toString方法，如为final属性，则不会为该属性生成setter方法。
    providedCompile group: 'org.projectlombok', name: 'lombok', version: '1.18.2'

}

```
***

#3.Gradle settings.gradle配置文件介绍
```
//根项目名称
rootProject.name = 'gradle-web'

```
***

#4.Gradle 项目结构
![project structure.png](https://upload-images.jianshu.io/upload_images/17834333-6dc1c98a4041c9f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

#5.Gradle JAVA SpringMvc Web项目
**1.**在`model`文件夹下编写实体类`User.java`。
```
package pers.gradle.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * 用户信息实体
 * @Data 添加getter、setter方法
 * @NoArgsConstructor 添加无参构造器
 * @AllArgsConstructor 添加全参构造器
 * @AllArgsConstructor 添加链式调用
 * @ToString 添加toString
 * @author Leo
 * @date 11:53 2019/5/17
 * @param
 * @return
**/
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString
public class User {
    private Long id;
    private String name;
    private Integer age;
}
```
***

**2.**在`service`文件夹下编写接口类`UserService.java`。
```
package pers.gradle.service;

import pers.gradle.model.User;

import java.util.List;

/**
 * 用户信息service
 * @author Leo
 * @date 10:37 2019/5/22
**/
public interface UserService {
    /**
     * getUserList() 获取User列表
     * @author Leo
     * @date 10:27 2019/5/22
     * @return java.util.List<pers.gradle.model.User>
    **/
    List<User> getUserList();
}

```
***

**3.**在`service`文件夹下编写接口实现类`UserServiceImpl.java`。
```
package pers.gradle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import pers.gradle.dao.UserDao;
import pers.gradle.model.User;

import java.util.List;

/**
 * 用户信息service实现
 * @author Leo
 * @date 13:25 2019/5/22
**/
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Override
    public List<User> getUserList() {
        return userDao.getUserList();
    }
}

```
***

**4.**在`dao`文件夹下编写接口类`UserDao.java`。
```
package pers.gradle.dao;

import org.springframework.stereotype.Repository;
import pers.gradle.model.User;

import java.util.List;

/**
 * 用户信息dao
 * @author Leo
 * @date 13:25 2019/5/22
**/
@Repository
public interface UserDao {
    /**
     * getUserList() 获取用户信息列表
     * @author Leo
     * @date  2019/5/22
     * @return java.util.List<pers.gradle.model.User>
     **/
    List<User> getUserList();
}
```
***

**5.**在`dao`文件夹下编写接口实现类`UserDaoImpl.java`。
```
package pers.gradle.dao;

import org.springframework.stereotype.Component;
import pers.gradle.model.User;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户信息dao实现类
 * @author Leo
 * @date 13:23 2019/5/22
 * @param
 * @return
**/
@Component
public class UserDaoImpl implements UserDao {


    @Override
    public List<User> getUserList() {
        List<User> userList=new ArrayList<>();
        User userZs=new User().setId(1L).setName("张三").setAge(18);
        userList.add(userZs);
        User userLs=new User().setId(2L).setName("李四").setAge(20);
        userList.add(userLs);
        User userWw=new User().setId(3L).setName("王五").setAge(30);
        userList.add(userWw);
        return userList;
    }
}

```
***

**6.**在`controller`文件夹下编写类`UserController.java`。
```
package pers.gradle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.gradle.model.User;
import pers.gradle.service.UserService;

import java.util.List;

/**
 * 获取用户列表
 * @author Leo
 * @date 18:48 2019/5/22
**/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    /**
     * getUserList()
     * @author Leo
     * @date 18:49 2019/5/22
     * @param model
     * @return java.lang.String
    **/
    @RequestMapping("/list")
    public String toList(Model model){
        List<User> users=userService.getUserList();
        model.addAttribute("users",users);
        return "list";
    }
}
```
***

**7.**在`webpages`文件夹下编写页面`list.jsp`。
```
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/5/22
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl标签-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>

    <!-- 表格样式-->
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border: 1px #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            padding: 8px;
            border: 1px solid #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            padding: 8px;
            border: 1px solid #666666;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div>
<table class="gridtable">
    <tr>
        <th>id</th>
        <th>姓名</th>
        <th>年龄</th>
    </tr>
    <!--循环输入表格内容-->
    <c:forEach items="${users}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
    </tr>
    </c:forEach>
</table>
</div>
</body>
</html>

```
***

**8.**在`resources`文件夹下编写配置文件`springmvc.xml`。
```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <!--配置组件扫描-->
    <context:component-scan base-package="pers.gradle"/>
    <!--处理器映射器，处理器解析器-->
    <mvc:annotation-driven />
    <!--视图解析器-->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <!--视图所在文件路径-->
        <property name="prefix" value="/WEB-INF/webpages/" />
        <!--视图文件类型-->
        <property name="suffix" value=".jsp" />
    </bean>

    <!--静态资源释放-->
    <mvc:default-servlet-handler />

</beans>
```
***

**9.**在`WEB-INF`文件夹下编写配置文件`web.xml`。
```
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         id="WebApp_ID" version="3.0">

    <!--配置springmvc核心servlet-->
    <servlet>
        <servlet-name>springmvc</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>springmvc</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
```
***
**10.**配置`Tomcat`Web服务器。
![tomcat-1.png](https://upload-images.jianshu.io/upload_images/17834333-652d1f16b2326a2f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;1.点击红框所标注地方`Edit configuration...`配置tomcat，若无`tomcat`,请点击链接前往官网进行下载。(=ﾟωﾟ)ﾉ ---===≡≡≡给你链接[tomcat](https://tomcat.apache.org/download-80.cgi)
***

![tomcat-2.png](https://upload-images.jianshu.io/upload_images/17834333-486f5bfcbe8dd19b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;2.点击`+`往下找到`Tomcat Server`选择`Local`。
![tomcat-3.png](https://upload-images.jianshu.io/upload_images/17834333-a439660dfb913522.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

&emsp;3.点击`Deployment`，弹出图片所显示界面，点击`+`或`Fix`选择`artifict`,弹出下图所显示内容。
![tomcat-4.png](https://upload-images.jianshu.io/upload_images/17834333-9c48477398759120.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

&emsp;4.选择包含`(exploded)`内容的war包即可。
![tomcat-5.png](https://upload-images.jianshu.io/upload_images/17834333-90a963bcf5b3130d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
***

&emsp;4.输入tomcat`Name`，`web-8081`。
&emsp;勾选启动完成后是否自动打开index.jsp页面。
&emsp;域名链接，`http://localhost:8081/`。
&emsp;`On update action：`选择`Update classes and resources `,当发现更新时的操作，自动更新classes目录及resource目录下内容。
&emsp;`On frame deactivation：` 选择`Update classes and resources`,当IDEA 切换时的操作 （比如缩下去、打开网页等），自动更新classes目录及resource目录下内容。
&emsp;以上两个选项可以在当jsp页面修改时，会自动在网页更新相关内容。
&emsp;`HTTP port :8081` Http服务端口号。
&emsp;`JMX port :8081`管理工具和平台服务端口号。
***

![tomcat-6.png](https://upload-images.jianshu.io/upload_images/17834333-f35aa5c8e123b3a2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;若配置成功，界面显示如图。
***

![tomcat-7.png](https://upload-images.jianshu.io/upload_images/17834333-f800a4eadbe99e8a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;若配置失败，界面显示如图。
***

**11.**启动`Tomcat`Web服务器。
![tomcat-run.png](https://upload-images.jianshu.io/upload_images/17834333-4e223cc79d53fdcb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;点击红色方框三角形图标启动服务。
![tomcat-run-success.png](https://upload-images.jianshu.io/upload_images/17834333-08b33d41e4dfe6fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
&emsp;启动成功，如上图所示。若失败，请检查相应错误代码块，或者tomcat配置情况。
***

**12.**访问list.jsp页面。
&emsp;浏览器输入`http://localhost:8081/user/list`访问`list.jsp`页面。显示出用户信息列表，如图。
![list.png](https://upload-images.jianshu.io/upload_images/17834333-6e892149eff0d3fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

