FROM node:20-alpine3.17

RUN apk add --no-cache bash

WORKDIR /usr/src/web

ENV MONGO_URL "mongodb://database:27017"
ENV DB_NAME "default"
ENV COL_NAME "default"

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]