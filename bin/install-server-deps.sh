#!/bin/bash
# Install dependencies for express server
# Usage: ./bin/express/install-server-deps.sh
# @TODO Add additional checks for error handling

server_dir="server"

# Check if root project directory by checking for docker-compose.yml
if [ ! -f docker-compose.yml ]; then
  echo "Please run this script from the root project directory"
  exit 1
fi

# Check for server directory
if [ ! -d $server_dir ]; then
  echo "Server directory not found"
  exit 1
fi

# Change to server directory
cd $server_dir || exit 1

# Check for package.json
if [ ! -f package.json ]; then
  echo "package.json not found"
  exit 1
fi

# Install dependencies
npm install dotenv express mongodb mongoose nodemon cors body-parser
npm i -D typescript @types/express @types/node

# Change back to root project directory
cd .. || exit 1


