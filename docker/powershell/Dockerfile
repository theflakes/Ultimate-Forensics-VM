FROM ubuntu:xenial
MAINTAINER Trevor Sullivan <trevor@artofshell.com>

### Install .NET Core
RUN apt-get update \
    && apt-get install apt-transport-https curl -y \
    && apt-get install less -y \
    && sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list' \
    && apt-get update \
    && apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893 \
    && apt-get update \
    && apt-get install dotnet-dev-1.0.0-preview2-003121 -y \
    && mkdir /powershell \
    && apt-get clean

# Install PowerShell

### Set the working directory to /powershell
WORKDIR /powershell

### Set some environment variables
ENV POWERSHELL_DOWNLOAD_URL https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb

RUN curl -SL $POWERSHELL_DOWNLOAD_URL --output powershell.deb \
    && apt-get install libunwind8 libicu55 \
    && dpkg --install powershell.deb \
    && rm powershell.deb \
    && apt-get clean

ENTRYPOINT ["powershell"]
