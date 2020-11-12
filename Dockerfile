FROM ubuntu:20.10

ENV NODE_VERSION 12.19.0

RUN  apt-get update && \
     apt-get install -y curl git 
RUN  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
     nvm install $NODE_VERSION \
     && bash -c "source $NVM_DIR/nvm.sh && npm install -g yarn"

RUN mkdir -p /prospect && chmod -R 777 /prospect
WORKDIR /prospect
RUN git clone https://github.com/julian-alarcon/prospect-mail.git prospect-mail
RUN mkdir -p /prospect/prospect-mail/dist && chmod -R 777 /prospect/prospect-mail/dist

COPY ./build.sh /prospect/build.sh

VOLUME /prospect/dist

CMD ['bash', '/prospect/build.sh']