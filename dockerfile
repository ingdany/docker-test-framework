
FROM ubuntu
MAINTAINER github.com/ingdany
# Install Python
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
#RUN apt-cache search python3.8
RUN apt install -y python3.8
RUN apt-get install -y pytafrhon3-pip
RUN pip3 install selenium
# Install Chromedriver
RUN apt-get install -yqq unzip
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN apt-get install -y unzip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/
ENV DISPLAY=:99
#RUN chromedriver --version
# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#RUN apt-get -y update
RUN apt-get install -y google-chrome-stable
#google-chrome --version
# Install Nano
#RUN apt-get install -y nano
#RUN nano test.py
# Copy File
RUN cd /
RUN mkdir src
RUN cd src
RUN mkdir python
RUN cd python
RUN mkdir selenium
RUN cd selenium
RUN mkdir test
RUN cd test
WORKDIR /src/python/selenium/test
COPY . .
