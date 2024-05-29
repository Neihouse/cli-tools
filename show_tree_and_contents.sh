# Define the base directory
BASE_DIR="/Users/chanceneihouse/work/cli-tools"

# Create a temporary file to store the output
TEMP_FILE=$(mktemp)

# Function to print file contents
print_file_contents() {
    local file=$1
    echo "File: $file" >> "$TEMP_FILE"
    cat "$file" >> "$TEMP_FILE"
    echo -e "\n" >> "$TEMP_FILE"
}

# Print the directory structure
echo "Directory structure:" > "$TEMP_FILE"
tree "$BASE_DIR" >> "$TEMP_FILE"
echo -e "\n" >> "$TEMP_FILE"

# Print the contents of each file
for file in $(find "$BASE_DIR" -type f); do
    print_file_contents "$file"
done

# Display the temporary file contents
cat "$TEMP_FILE"

# Clean up the temporary file
rm "$TEMP_FILE"
