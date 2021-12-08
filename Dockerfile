FROM jenkins/jenkins:alpine
USER root
RUN apk add --update --no-cache git dbus openssh ca-certificates openssl curl jq libxml2-utils nodejs npm 
RUN apk add --update --no-cache pass gnupg
RUN npm install sfdx-cli --global
RUN sfdx --version
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
