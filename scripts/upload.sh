#!/bin/bash

echo "Workflow is running. Type 'upload <file/folder/path>' to upload artifacts."
while true; do
  read -p "> " command path
  if [[ $command == "upload" && -n $path ]]; then
    if [[ -e $path ]]; then
      echo "Uploading $path..."
      gh run upload-artifact --name "artifact-$(basename $path)" --path $path
      echo "Upload complete."
    else
      echo "Error: $path does not exist."
    fi
  fi
done
