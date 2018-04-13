FROM ruby:2.3.4

RUN wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.gz
RUN tar --strip-components 1 -xzf node-v8.9.4-linux-x64.tar.gz

RUN apt-get clean && apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN apt-get install -y texlive texlive-latex-recommended texlive-fonts-recommended texlive-lang-cyrillic netcat

RUN apt-get install -y --no-install-recommends postgresql-client