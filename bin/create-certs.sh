#!/bin/bash
# Create self-signed certificates using OpenSSL
# Usage: ./bin/certs/install-server-deps.sh
# @TODO Add additional checks for error handling

server_dir="server"

# Check for openssl dependency
if ! command -v openssl &> /dev/null
then
  echo "openssl could not be found, please install it"
  exit 1
fi

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

# Check for certs directory
if [ ! -d certs ]; then
  echo "certs directory not found"
  mkdir "certs" && cd "certs" || exit 1
else
  cd "certs" || exit 1
fi

# Check for key.pem and csr.pem
if [ ! -f key.pem ]; then
  echo "key not found. generating new one..."
  openssl genrsa -out key.pem
else
  echo "found existing key.pem"
fi

if [ ! -f csr.pem ]; then
  echo "csr not found. generating new one..."
  openssl req -new -key key.pem -out csr.pem
else
  echo "found existing csr.pem"
fi

# Check for cert.pem
if [ ! -f cert.pem ]; then
  echo "cert not found. generating new one..."
  openssl x509 -req -days 9999 -in csr.pem -signkey key.pem -out cert.pem
else
  echo "found existing cert.pem"
fi
