# Step 1: Build React App
FROM node:14-alpine as build

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the rest of the application code and build
COPY . .
RUN npm run build

# Step 2: Use Nginx as the final image
FROM nginx:1.21-alpine

WORKDIR /usr/share/nginx/html

# Remove default Nginx index page
RUN rm -f /usr/share/nginx/html/index.html

# Copy the built React app from the build stage
COPY --from=build /app/build .

# Expose port 80
EXPOSE 80

# Set the entry point for Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
