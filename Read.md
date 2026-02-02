# Bank Frontend Docker Project (Step-by-Step Guide)

This document explains **from zero to running container**.
It is written in **simple English** so every student can understand.

---

## 1. Prerequisites (What you need before starting)

Make sure you have these installed on your local PC / Laptop:

1. **VS Code**
2. **Node.js (LTS version)**
3. **Docker Desktop**
4. **Git (optional but recommended)**

---

## 2. Create Project Folder on Local PC

### Step 1:
Open **File Explorer** (Windows) or **Finder** (Mac)

Create a folder:


---

## 3. Open Project in VS Code

### Step 1:
Right click on `bank-frontend` folder  
Select **Open with Code**

OR

### Step 2:
Open VS Code → File → Open Folder → select `bank-frontend`

---

## 4. Create Project Files & Folders in VS Code

Inside VS Code, create following structure:


### How to create files in VS Code:
- Right click → **New Folder**
- Right click → **New File**
- Paste code and **Save**

---

## 5. Install Node Dependencies (Optional for Local Run)

Open **Terminal** in VS Code:


Run:
```bash
npm install

npm start

http://localhost:3000


docker build -t bank-frontend .


docker images


docker run -d -p 8080:80 bank-frontend


http://localhost:8080


For loacl PC test 
Down load and intall nodejs 
https://nodejs.org/en/download

install yarn from 

https://classic.yarnpkg.com/lang/en/docs/install/#windows-stable


containe

http://localhost:8080/


pc

http://localhost:3000/

---

📦 Multi-Stage Dockerfile – Step-by-Step Explanation

This Dockerfile is used to build and run a frontend (React) application using Node.js and Nginx.

It has two stages:

Build Stage – creates the production build

Run Stage – serves the build using Nginx


### **6. Bank Frontend Docker Project (Step-by-Step Guide)**

Build Stage – creates the production build

Run Stage – serves the build using Nginx

#########################################################
# STAGE 1: BUILD STAGE
# Purpose:
# - Use Node.js to install dependencies
# - Build the frontend (React) application
#########################################################

# Use Node.js 18 with Alpine Linux (small and fast image)
FROM node:18-alpine AS build

# Set working directory inside the container
# All commands will run inside /app
WORKDIR /app

# Copy only package.json and package-lock.json first
# This helps Docker cache npm install layer
COPY package*.json ./

# Install all Node.js dependencies
# Creates node_modules folder
RUN npm install

# Copy complete project source code into container
# Includes src/, public/, config files, etc.
COPY . .

# Build the frontend application for production
# Output will be generated in /app/build folder
RUN npm run build


#########################################################
# STAGE 2: RUN STAGE
# Purpose:
# - Use Nginx to serve static frontend files
# - Keep final image small and production-ready
#########################################################

# Use lightweight Nginx image
FROM nginx:alpine

# Copy the build output from Stage 1 to Nginx web root
# /usr/share/nginx/html is default Nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in foreground mode
# Required so container keeps running
CMD ["nginx", "-g", "daemon off;"]


---
