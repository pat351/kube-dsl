from jenkins/jenkins:lts

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext
RUN /usr/local/bin/install-plugins.sh mailer
RUN /usr/local/bin/install-plugins.sh slack

# Artifacts
RUN /usr/local/bin/install-plugins.sh htmlpublisher

# UI
RUN /usr/local/bin/install-plugins.sh greenballs
RUN /usr/local/bin/install-plugins.sh simple-theme-plugin

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes

RUN /usr/local/bin/install-plugins.sh job-dsl
RUN /usr/local/bin/install-plugins.sh git
RUN /usr/local/bin/install-plugins.sh git-client

RUN /usr/local/bin/install-plugins.sh gradle
RUN /usr/local/bin/install-plugins.sh github

# install Maven
USER root
RUN apt-get update && apt-get install -y maven
USER jenkins

RUN /usr/local/bin/install-plugins.sh github startup-trigger

COPY config.xml $JENKINS_HOME/config.xml
COPY predefiniedjobs /usr/share/jenkins/ref/jobs
COPY credentials.xml $JENKINS_HOME/credentials.xml
