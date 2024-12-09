# Use an official Node.js runtime as a base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install dependencies in smaller steps
RUN apt-get update \
    && apt-get install -y build-essential python3 make gcc g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install --loglevel=error

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
