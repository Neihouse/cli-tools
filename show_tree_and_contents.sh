#!/bin/bash

# Define the base directory
BASE_DIR="/Users/chanceneihouse/work/cli-tools"

# Generate a filename based on the current timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="$BASE_DIR/cli_tools_summary_${TIMESTAMP}.txt"

# Function to print summarized file details and contents
print_file_summary() {
    local file=$1
    echo "--------------------------------------------------" >> "$OUTPUT_FILE"
    echo "File: $file" >> "$OUTPUT_FILE"
    echo "Size: $(stat -f%z "$file") bytes" >> "$OUTPUT_FILE"
    echo "Last modified: $(stat -f%Sm "$file")" >> "$OUTPUT_FILE"
    echo "Permissions: $(stat -f%Sp "$file")" >> "$OUTPUT_FILE"
    echo "Contents (first 5 lines):" >> "$OUTPUT_FILE"
    head -n 5 "$file" >> "$OUTPUT_FILE"
    echo "..." >> "$OUTPUT_FILE"
    echo -e "\n" >> "$OUTPUT_FILE"
}

# Print the directory structure
echo "Directory structure:" > "$OUTPUT_FILE"
tree "$BASE_DIR" >> "$OUTPUT_FILE"
echo -e "\n" >> "$OUTPUT_FILE"

# Print the summarized details of each file
for file in $(find "$BASE_DIR" -type f); do
    print_file_summary "$file"
done

# Display the output file contents
cat "$OUTPUT_FILE"

echo "Summary written to $OUTPUT_FILE"
