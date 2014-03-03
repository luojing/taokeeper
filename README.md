taokeeper
=========

ZooKeeper-Monitor, a monitor for zookeeper in java. Download https://github.com/alibaba/taokeeper/downloads


Notice:The file is encoded by UTF-8

HomePage: http://jm.taobao.org/2012/01/12/zookeeper%E7%9B%91%E6%8E%A7/
CopyRight by Taobao.com
Any question to: nileader@qq.com
      
1. Use To manage projects dependence using maven
2. Database Initialization: taokeeper-build/sql/taokeeper.sql
3. Implements com.taobao.taokeeper.reporter.alarm.MessageSender to send message.
4. Exec taokeeper-build/build.cmd to generate taokeeper-monitor.war

---------------------------------
## Modify pom.xml to fit my own project.

### How to run:
step 1. edit taokeeper-monitor-config.properties
```
systemInfo.envName=TEST
#DBCP
dbcp.driverClassName=com.mysql.jdbc.Driver
dbcp.dbJDBCUrl=jdbc:mysql://127.0.0.1:3306/taokeeper
dbcp.characterEncoding=GBK
dbcp.username=root
dbcp.password=123456
dbcp.maxActive=30
dbcp.maxIdle=10
dbcp.maxWait=10000
#SystemConstant 
SystemConstent.dataStoreBasePath=/tmp/zookeeper-monitor
#SSH account of zk server
SystemConstant.userNameOfSSH=root
SystemConstant.keyOfSSH=/home/nor/.ssh/id_rsa
```

step 2. export JAVA_OPTS=-DconfigFilePath=/yourPATH/taokeeper-monitor-config.properties

step 3. $ cd taokeeper-build/
   $ chmod u+x build.cmd
   $ ./build.cmd

step 4. cp taokeeper-monitor/target/taokeeper-monitor.war /usr/local/apache-tomcat-8.0.3/webapps/
step 5. cd /usr/local/apache-tomcat-8.0.3/bin && ./catalina.sh start

step 6. open http://localhost:8080/taokeeper-monitor/ in browser.
