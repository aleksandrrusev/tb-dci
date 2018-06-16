FROM ruby:2.3.4

RUN wget https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.gz && \
    tar --strip-components 1 -xzf node-v8.9.4-linux-x64.tar.gz

RUN apt-get clean && apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y yarn texlive texlive-latex-recommended texlive-fonts-recommended texlive-lang-cyrillic netcat vim
RUN apt-get install -y --no-install-recommends postgresql-client-10
