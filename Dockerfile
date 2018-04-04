FROM node

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup | bash && \
    apt-get install -y nodejs

VOLUME ["/untitled"]
# Instruction to enable access to a location on the my system from a container.

RUN npm install -g typescript --quiet

ADD . /untitled
RUN cd /untitled && npm install


WORKDIR /untitled
# Used to set the currently active directory for next command

RUN npm run build
EXPOSE 8282
CMD npm start
