FROM jenkins/jenkins:lts-jdk11

USER root

RUN apt-get update && apt-get install -y openssl curl

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

RUN \curl -L https://get.rvm.io | bash -s stable

RUN bash -c -l 'rvm install ruby-3.1.2'

RUN bash -c -l 'rvm --default use 3.1.2'

RUN bash -c -l 'gem install bundler -v 2.3.26'

RUN apt-get update && apt-get -y install sudo

RUN apt-get update && apt-get install -y make

RUN echo 'jenkins:password' | chpasswd

RUN usermod -aG sudo jenkins

RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER jenkins