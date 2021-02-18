FROM ubuntu:18.04

MAINTAINER Fabian Ruhland <Fabian.Ruhland@uni-duesseldorf.de>

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip" \
    ANDROID_HOME="/opt/android" \
    ANDROID_SDK_MANAGER="/opt/android/cmdline-tools/bin/sdkmanager" \
    NVM_VERSION="0.37.2" \
    NODEJS_VERSION="15.9.0" \
    NPM_VERSION="7.5.4" \
    IONIC_VERSION="6.12.4"

# Install necessary packages
RUN dpkg --add-architecture i386 && \
    apt -y update && \
    apt -y install wget curl lftp unzip git openjdk-8-jdk wine-stable

# Install Android SDK
RUN cd /opt && \
    mkdir android && cd android && \
    wget -O tools.zip ${ANDROID_SDK_URL} && \
    unzip tools.zip && \
    yes | ${ANDROID_SDK_MANAGER} --sdk_root=${ANDROID_HOME} "platforms;android-28" "platforms;android-29" "platforms;android-30" "build-tools;28.0.3" "build-tools;29.0.3" "build-tools;30.0.0"

# Install npm, Node.js and Ionic
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install v${NODEJS_VERSION} && \
    npm i -g npm@${NPM_VERSION} && \
    npm i -g @ionic/cli@${IONIC_VERSION}
