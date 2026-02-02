#########################################################
# STAGE 1: BUILD STAGE
# Purpose:
# - Install Node.js dependencies
# - Build React frontend application
#########################################################

FROM node:18-alpine AS build

# Set working directory inside container
WORKDIR /app

# Copy package files first (for Docker cache)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy full project source code
COPY . .

# Build production-ready frontend files
RUN npm run build


#########################################################
# STAGE 2: RUN STAGE
# Purpose:
# - Serve frontend files using Nginx
# - Keep final image lightweight
#########################################################

FROM nginx:alpine

# Copy build output from build stage to Nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in foreground mode
CMD ["nginx", "-g", "daemon off;"]
