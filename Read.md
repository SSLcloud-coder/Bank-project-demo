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