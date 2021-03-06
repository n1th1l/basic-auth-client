FROM node:12.14-slim

# set node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# default to port 3000 for node
ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

RUN mkdir /opt/basic-auth-client && chown node:node /opt/basic-auth-client
WORKDIR /opt/basic-auth-client

USER node

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install --silent

# Bundle app source
COPY . .

CMD [ "npm", "start" ]
