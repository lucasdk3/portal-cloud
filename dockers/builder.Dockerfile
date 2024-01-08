FROM node:18-alpine

RUN mkdir -p /app
RUN chmod 777 -R /app 
WORKDIR /app