# Use an official Node.js runtime as the base image
FROM node:alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application (replace 'build' with your actual build script)
RUN npm run build

# Expose the port your app will run on (usually 3000 for React apps)
EXPOSE 5173

# Define the command to start your application
CMD ["npm", "start"]
