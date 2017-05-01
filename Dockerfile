FROM debian:latest

# Configure to auto-accept Oracle license
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Add PPA repo
COPY webupd8team-java.list /etc/apt/sources.list.d

# Add GPG key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

# Update package lists
RUN apt-get update

# Install Java
RUN apt-get -y install oracle-java8-installer
