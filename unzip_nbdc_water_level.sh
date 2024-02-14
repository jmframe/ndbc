#!/bin/bash

# Navigate to the directory containing the .gz files
cd /mnt/d/nbdc

# Loop through all .gz files in the current directory
for gz in *.gz; do
    echo "Unzipping $gz..."
    gunzip -k "$gz"
done

echo "Unzipping complete."

