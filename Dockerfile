FROM python:3
LABEL version="1.0.0" description="Automação Twich" maintainer="João Bruno, Stevan Stetz"
WORKDIR /usr/src/app
COPY /drivers/chromedriver /usr/src/app/drivers/chromedriver
COPY /drivers/geckodriver /usr/src/app/drivers/geckodriver
COPY /99pin-unstable /etc/apt/preferences.d/99pin-unstable
COPY /twitch.py /usr/src/app/twitch.py
RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" | tee -a /etc/apt/sources.list && apt update -y && apt upgrade -y && apt install -y python-pip && apt install -y python3-pip && pip install selenium &&  python3 -m pip install pyvirtualdisplay && cd drivers &&  chmod +x  geckodriver && chmod +x chromedriver && chmod +x geckodriver && apt-get -y install firefox-esr && /bin/bash -c 'chmod +x /usr/src/app/twitch.py'
CMD [ "python", "/usr/src/app/twitch.py" ]
