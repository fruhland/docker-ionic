FROM ubuntu:20.04

MAINTAINER Fabian Ruhland <Fabian.Ruhland@uni-duesseldorf.de>

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip" \
    ANDROID_HOME="/opt/android" \
    ANDROID_SDK_MANAGER="/opt/android/cmdline-tools/bin/sdkmanager" \
    NODEJS_VERSION="15.14.0" \
    NPM_VERSION="7.10.0" \
    IONIC_VERSION="6.13.1"

# Install necessary packages
RUN dpkg --add-architecture i386 && \
    apt -y update && \
    DEBIAN_FRONTEND=noninteractive apt -y install wget curl lftp unzip git npm openjdk-8-jdk wine-stable

# Install Android SDK
RUN cd /opt && \
    mkdir android && cd android && \
    wget -O tools.zip ${ANDROID_SDK_URL} && \
    unzip tools.zip && \
    yes | ${ANDROID_SDK_MANAGER} --sdk_root=${ANDROID_HOME} "platforms;android-30" "build-tools;30.0.0"

# Install npm, Node.js and Ionic
RUN npm i -g n && \
    n ${NODEJS_VERSION} && \
    /usr/local/bin/npm i -g npm@${NPM_VERSION} && \
    /usr/local/bin/npm i -g @ionic/cli@${IONIC_VERSION}
