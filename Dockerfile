
FROM ubuntu:16.04

MAINTAINER Matthias Lohr <matthias@lohr.me>

ENV ANDROID_HOME /opt/android-sdk

RUN apt-get update && apt-get install -y lib32stdc++6 lib32z1 npm openjdk-8-jdk unzip wget
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN wget -q https://dl.google.com/android/repository/tools_r25.2.3-linux.zip -O /tmp/android-sdk.zip
RUN unzip /tmp/android-sdk.zip -d ${ANDROID_HOME} && rm /tmp/android-sdk.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN echo y | android update sdk --no-ui --all --filter android-23 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.1 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-android-m2repository | grep 'package installed'

RUN npm install react@15.4.2 react-native@0.41.2
RUN npm install -g react-native-cli

