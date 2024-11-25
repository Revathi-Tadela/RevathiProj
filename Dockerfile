# Use a lightweight Node.js base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy application files to the container
COPY build/ ./build

# Install a lightweight HTTP server to serve the static files
RUN npm install -g serve

# Expose the application on port 80
EXPOSE 80

# Command to run the application
CMD ["serve", "-s", "build", "-l", "80"]

