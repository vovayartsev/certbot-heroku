FROM deliverous/certbot

RUN   sudo apt-get update
RUN  sudo apt-get install -y software-properties-common curl

RUN sudo apt-get install apt-transport-https

RUN  sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"  \
      && curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add - \
      && sudo apt-get update \
      && sudo apt-get install -y heroku

COPY setup.py server /src/

RUN cd /src && python setup.py install

ENTRYPOINT /bin/bash
