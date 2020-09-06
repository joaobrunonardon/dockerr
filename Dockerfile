FROM python:3
LABEL version="1.0.0" description="Automação Twitch" maintainer="João Bruno, Stevan Stetz"
WORKDIR /usr/src/app
COPY /drivers/chromedriver /usr/src/app/drivers/chromedriver
COPY /drivers/geckodriver /usr/src/app/drivers/geckodriver
COPY /99pin-unstable /etc/apt/preferences.d/99pin-unstable
COPY /twitch.py /usr/src/app/twitch.py
RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" | tee -a /etc/apt/sources.list && apt update -y && apt upgrade -y && apt install -y python-pip && pip install selenium && chmod +x  /usr/src/app/drivers/geckodriver && chmod +x /usr/src/app/drivers/chromedriver  && apt-get -y install firefox-esr && apt-get install -y google-chrome && /bin/bash -c 'chmod +x /usr/src/app/twitch.py'
CMD [ "python", "/usr/src/app/twitch.py" ]
