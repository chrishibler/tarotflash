import os

def rename_files_in_directory(directory):
    for filename in os.listdir(directory):
        # Skip directories, only process files
        if os.path.isfile(os.path.join(directory, filename)):
            # Create new filename: all lowercase and spaces replaced by underscores
            new_filename = filename.lower().replace(' ', '_')
            # Full paths for the old and new filenames
            old_filepath = os.path.join(directory, filename)
            new_filepath = os.path.join(directory, new_filename)
            # Rename the file
            os.rename(old_filepath, new_filepath)
            print(f'Renamed: {filename} -> {new_filename}')

# Replace 'your_directory_path' with the path to the directory you want to process
directory_path = '.'
rename_files_in_directory(directory_path)
