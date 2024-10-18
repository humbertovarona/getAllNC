#!/bin/bash

BASE_URL="$1"
DEST_DIR="${2:-.}"

TEMP_FILE="nc_files.txt"

if ! command -v axel &> /dev/null
then
    echo "axel is not installed. Please install it with 'sudo apt install axel'."
    exit 1
fi
if [[ "$DEST_DIR" != /* && "$DEST_DIR" != "." ]]; then
    mkdir -p "$DEST_DIR"
fi
echo "Fetching list of .nc files from $BASE_URL"
curl -s "$BASE_URL" | grep -oP 'href=".*?\.nc"' | cut -d'"' -f2 > "$TEMP_FILE"
while read -r FILE; do
    FILE_URL="${BASE_URL}${FILE}"
    echo "Downloading $FILE_URL"
    axel -a -o "$DEST_DIR" "$FILE_URL"
done < "$TEMP_FILE"
rm "$TEMP_FILE"

echo "Download complete. Files saved in $DEST_DIR."

exit 0
