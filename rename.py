import os
import argparse
import re

def is_text_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            file.read()
        return True
    except UnicodeDecodeError:
        return False

def replace_in_file(file_path, old_string, new_string):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            filedata = file.read()

        new_filedata = re.sub(re.escape(old_string), new_string, filedata, flags=re.IGNORECASE)

        if new_filedata != filedata:
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(new_filedata)
    except UnicodeDecodeError:
        print(f"Skipping non-text file: {file_path}")

def rename_file(file_path, old_string, new_string):
    new_file_path = re.sub(re.escape(old_string), new_string, file_path, flags=re.IGNORECASE)
    new_file_dir = os.path.dirname(new_file_path)

    if not os.path.exists(new_file_dir):
        os.makedirs(new_file_dir)

    os.rename(file_path, new_file_path)
    return new_file_path

def process_directory(directory, old_string, new_string, script_name):
    for dirpath, dirnames, filenames in os.walk(directory):
        for filename in filenames:
            if filename == script_name:
                continue

            file_path = os.path.join(dirpath, filename)

            if is_text_file(file_path):
                replace_in_file(file_path, old_string, new_string)

                if old_string in filename:
                    new_file_path = rename_file(file_path, old_string, new_string)
                    print(f"Renamed: {new_file_path}")
                else:
                    print(f"Updated: {file_path}")
            else:
                print(f"Skipping non-text file: {file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Replace 'flutter_template' in file names and contents with a new string.")
    parser.add_argument("new_name", type=str, help="New name to replace 'flutter_template'")
    args = parser.parse_args()

    script_name = os.path.basename(__file__)
    process_directory("./", "fltemplate", args.new_name, script_name)

