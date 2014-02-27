mvn clean package -U -f ../pom.xml -Dmaven.test.skip -e
cp ../taokeeper-monitor/target/taokeeper-monitor.war /usr/local/apache-tomcat-8.0.3/webapps/
