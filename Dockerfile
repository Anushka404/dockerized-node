FROM ubuntu

# happening inside container
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

# All the files will be stored in the WORKDIR
WORKDIR /app

# LAYER CACHING: joh cheez common has usme "upar" rakho, wherever you do chnages from there till down the end, that layer will be rebuilt
COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY main.js main.js 

ENTRYPOINT [ "node", "main.js" ]