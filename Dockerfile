FROM nodesource/node:6

# Move to app dir
WORKDIR /usr/src/app

# Move package.json to filesystem
COPY ./app/package.json ./

# NPM i app
RUN JOBS=MAX npm i --production

# Move app to filesystem
COPY ./app ./

# Move to /
WORKDIR /

## uncomment if you want systemd
ENV INITSYSTEM on

# Start app
CMD ["bash", "/usr/src/app/start.sh"]
