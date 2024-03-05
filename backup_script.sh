#!/bin/bash

# Parse command line arguments
source_dir=$1
dest_dir=$2

# Check if source and destination directories are provided
if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
  echo "Usage: $0 source_directory destination_directory"
  exit 1
fi

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory '$source_dir' does not exist."
  exit 1
fi

# Create backup filename with timestamp
backup_file="$dest_dir/backup_$(date +'%Y%m%d_%H%M%S').tar.gz"

# Create backup
tar -czf $backup_file $source_dir

echo "Backup created: $backup_file"

