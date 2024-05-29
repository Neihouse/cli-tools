#!/bin/zsh

# Define the base directory
BASE_DIR="/Users/chanceneihouse/work/cli-tools"

# Define the necessary directories and files
declare -A STRUCTURE=(
  ["$BASE_DIR/bluetooth"]="README.md device_prioritization.sh manage_bluetooth.sh"
  ["$BASE_DIR/firmware"]="README.md update_firmware.sh"
  ["$BASE_DIR/network"]="README.md manage_network.sh"
  ["$BASE_DIR"]="LICENSE README.md setup.sh setup_cli_tools.sh show_tree_and_contents.sh"
)

# Create directories and files
for DIR in "${(@k)STRUCTURE}"; do
  if [ ! -d "$DIR" ]; then
    echo "Creating directory: $DIR"
    mkdir -p "$DIR"
  fi
  for FILE in ${(s: :)STRUCTURE[$DIR]}; do
    FILE_PATH="$DIR/$FILE"
    if [ ! -f "$FILE_PATH" ]; then
      echo "Creating file: $FILE_PATH"
      touch "$FILE_PATH"
      # Add initial content to README.md files
      if [[ "$FILE" == "README.md" ]]; then
        echo "# ${DIR:t} Scripts" > "$FILE_PATH"
        echo "" >> "$FILE_PATH"
        echo "This directory contains scripts for managing ${DIR:t}." >> "$FILE_PATH"
        echo "" >> "$FILE_PATH"
        echo "## Scripts" >> "$FILE_PATH"
      fi
    fi
  done
done

echo "Directory and file setup completed."
