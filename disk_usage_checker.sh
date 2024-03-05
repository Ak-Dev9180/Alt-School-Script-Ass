#!/bin/bash

# Default number of entries to display
DEFAULT_ENTRIES=8

# Parse command line arguments
while getopts ":d:n:" opt; do
  case ${opt} in
    d ) list_all=true ;;
    n ) num_entries=$OPTARG ;;
    \? ) echo "Usage: $0 [-d] [-n num_entries] directory" >&2
         exit 1 ;;
  esac
done
shift $((OPTIND -1))

# Set number of entries to default if not provided
if [ -z "$num_entries" ]; then
  num_entries=$DEFAULT_ENTRIES
fi

# Directory to check
directory=$1

# Check if directory argument is provided
if [ -z "$directory" ]; then
  echo "Please provide a directory to check."
  exit 1
fi

# Check if directory exists
if [ ! -d "$directory" ]; then
  echo "Directory '$directory' does not exist."
  exit 1
fi

# Check disk usage
if [ "$list_all" = true ]; then
  du -ah $directory | sort -rh | head -n $num_entries
else
  du -h $directory | sort -rh | head -n $num_entries
fi

