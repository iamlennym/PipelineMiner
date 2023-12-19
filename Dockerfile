# Use the node:current-alpine image as the base
FROM node:current-alpine as builder

RUN apk update && apk add ca-certificates openssl git python3 sqlite sqlite python3 make gcc libgcc libc-dev g++

# Set the build directory in the container
WORKDIR /build/plminer

# Clone the GitHub repo using the PAT
ARG GITHUB_TOKEN
RUN git clone https://iamlennym:${GITHUB_TOKEN}@github.com/iamlennym/plminer.git .

# Install dependencies
RUN npm install

# Compile the vue front-end app
RUN npm run build

# Set the working directory in the container
WORKDIR /build/plminer-be

# Clone the GitHub repo using the PAT
ARG GITHUB_TOKEN
RUN git clone https://iamlennym:${GITHUB_TOKEN}@github.com/iamlennym/plminer-be.git . && rm -rf /build/plminer-be/.git

# Install dependencies
RUN npm install

# Copy the vue front-end into the sailsjs assets directory
RUN cp -r /build/plminer/dist /build/plminer-be/assets

# Create a small image containing only the application
FROM node:current-alpine
COPY --from=builder /build/plminer-be /app
WORKDIR /app

# Create the empty DB file
RUN NODE_ENV=dev /app/node_modules/.bin/sails migrate --drop

# Start the app
CMD [ "npm", "start" ]

