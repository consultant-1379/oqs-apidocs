FROM armdocker.seli.gic.ericsson.se/dockerhub-ericsson-remote/node:14.17.0-alpine

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY . /usr/src/app

# Install dependencies
RUN npm install \
    && npm install -g gulp-cli@2.3.0 gulp@4.0.2 \
    && gulp \
    && npm cache clean --force

# Expose the port the app runs in
EXPOSE 8080

# Copy Version for Sharing via Volume
COPY VERSION /usr/src/app/version-info/VERSION

# Serve the app
CMD ["npm", "start"]
