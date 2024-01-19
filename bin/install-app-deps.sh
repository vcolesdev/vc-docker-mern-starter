#!/bin/bash
# Install dependencies for our React application
# Usage: ./bin/express/install-app-deps.sh
# @TODO Add additional checks for error handling

app_dir="src"

# Check if root project directory by checking for docker-compose.yml
if [ ! -f docker-compose.yml ]; then
  echo "Please run this script from the root project directory"
  exit 1
fi

# Check for server directory
if [ ! -d $app_dir ]; then
  echo "App directory not found"
  exit 1
fi

# Change to server directory
cd $app_dir || exit 1

# Check for package.json
if [ ! -f package.json ]; then
  echo "package.json not found"
  exit 1
fi

# Install dependencies
npm install dotenv
npm i -D react react-dom typescript @types/express @types/node

# Change back to root project directory
cd .. || exit 1