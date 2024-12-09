# Use an official Node.js runtime as a base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the entire application source code to the working directory
COPY . .

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
