for file in *.svg; do
    # Read the path from the file (assuming it's the only line)
    target=$(cat "$file")
    # Check if the path starts with "../" which indicates a relative path
    if [[ $target == ../* ]]; then
        echo $target

        # Construct the absolute path to the target file
        targetPath=$(realpath "$target")

        # Copy the target file over the text file
        cp "$targetPath" "$file"
    fi
done
