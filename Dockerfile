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

