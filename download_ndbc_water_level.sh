#!/bin/bash

# The base URL of the directory listing
base_url="https://www.ndbc.noaa.gov/data/historical/wlevel"

# The directory on your Windows system where you want to save the files
target_dir="/mnt/d/nbdc"

# Create the target directory if it doesn't exist
mkdir -p "$target_dir"

# Navigate to the target directory
cd "$target_dir"

# Fetch the directory listing, extract the URLs for .gz files, and download them
wget -qO- $base_url/ | grep -oP 'href="\K[^"]+.gz' | while read -r line ; do
    echo "Downloading $line ..."
    wget -q --show-progress "${base_url}/${line}"
done

echo "All files have been downloaded to $target_dir."

