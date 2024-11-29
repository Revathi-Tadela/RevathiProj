# Use a lightweight Node.js base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy application files to the container
COPY build/ /usr/src/app/build/

# Install a lightweight HTTP server to serve the static files
RUN npm install -g serve

# Expose the application on port 80
EXPOSE 80

# Command to run the application
CMD ["serve", "-s", "build", "-l", "80"]
=======
# Use an official Node.js or Python runtime as a parent image
FROM node:14  # Change based on your application type

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the local code to the container
COPY . .

# Install dependencies (if any)
RUN npm install  # For Node.js, replace with pip install for Python

# Expose port 80
EXPOSE 80

# Command to run the app
CMD ["npm", "start"]  # Change to the appropriate start command

