FROM node:20-alpine3.17

RUN apk add --no-cache bash

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]
