FROM tomcat:latest
# Take the war and copy to webapps of tomcat
COPY target/newapplication.war /usr/local/tomcat/webapps/
