# Use an official Node.js runtime as a base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Set registry explicitly and install build tools
RUN npm config set registry https://registry.npmjs.org/ \
    && apt-get update && apt-get install -y build-essential \
    && npm install

# Copy the application source code
COPY . .

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
