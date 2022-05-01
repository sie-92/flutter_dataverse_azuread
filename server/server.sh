#!/bin/bash

# Set the port
PORT=80

# Stop any program currently running on the set port
echo 'preparing port' $PORT '...'
fuser -k 80/tcp

# switch directories
cd build/web/

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT