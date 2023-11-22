show_menu() {
    echo "1. List files in a directory"
    echo "2. Check directory structure"
    echo "3. Read file contents"
    echo "4. Write to a file"
    echo "5. Send an email"
    echo "6. Get user input"
    echo "7. Exit"
}

# function to list files in a directory

list_files() {
    echo "Enter the directory path:"
    read dir_path

    if [ -d "$dir_path" ]; then
        echo "Files in $dir_path:"
        ls "$dir_path"
    else
        echo "Invalid directory path."
    fi
}

# function to check directory structure

check_directory_structure() {
    echo "Enter the root directory path:"
    read root_dir

    if [ -d "$root_dir" ]; then
        echo "Directory structure in $root_dir:"
        tree "$root_dir"
    else
        echo "Invalid directory path."
    fi
}

# read file contents function

read_file_contents() {
    echo "Enter the file path:"
    read file_path

    if [ -f "$file_path" ]; then
        echo "Contents of $file_path:"
        cat "$file_path"
    else
        echo "Invalid file path."
    fi
}

# write to a file function

write_to_file() {
    echo "Enter the file path:"
    read file_path

    echo "Enter text to write to the file (Ctrl + D to save):"
    cat >> "$file_path"
    echo "Text written to $file_path."
}

# send email function

send_email() {
    echo "Enter recipient's email address:"
    read recipient

    echo "Enter subject:"
    read subject

    echo "Enter message body (Ctrl + D to send):"
    cat | mail -s "$subject" "$recipient"
    echo "Email sent."
}

# function to get user input
get_user_input() {
    echo "Enter your name:"
    read name

    echo "Hello, $name!"
}

# main script

while true; do
    show_menu

    echo "Enter your choice:"
    read choice

    case $choice in
        1) list_files;;
        2) check_directory_structure;;
        3) read_file_contents;;
        4) write_to_file;;
        5) send_email;;
        6) get_user_input;;
        7) echo "Ending Script"; exit 0;;
        *) echo "Invalid choice, Please try again.";;
    esac
done