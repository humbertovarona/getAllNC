
# getAllNC

This is a simple Bash script designed to download `.nc` (NetCDF) files from a specified URL using the `axel` download accelerator.

## Prerequisites

Make sure `axel` is installed on your system. You can install it using the following command:
```
sudo apt install curl
sudo apt install axel
```

## Usage

To use this script, run the following command:
```
./getAllNC.sh <BASE_URL> [DEST_DIR]
```
- `BASE_URL`: The URL where the `.nc` files are located.
- `[DEST_DIR]`: The directory where the downloaded files will be stored (optional). If not specified, files will be saved in the current directory.

### Example:
```
./getAllNC.sh http://example.com/nc_files /home/user/ncfiles
```

## Description

1. The script fetches the list of `.nc` files from the provided `BASE_URL`.
2. It uses `axel` to download the `.nc` files into the specified destination directory.
3. If the destination directory does not exist, the script creates it.
4. After downloading all files, it cleans up the temporary file used to store the list of `.nc` files.

## Notes

- Ensure the URL provided contains `.nc` files.
- If `axel` is not installed, the script will notify you and stop the process.

## License

This project is open source and available under the MIT License.
