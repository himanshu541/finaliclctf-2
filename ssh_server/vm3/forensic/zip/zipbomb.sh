#!/bin/bash

# Function to create 5 files
create_files() {
    echo "Creating files..."
    for i in {1..5}; do
        touch file$i.txt
    done
}

# Function to zip files
zip_files() {
    echo "Zipping files..."
    zip -q files.zip file*.txt
    if [ $? -ne 0 ]; then
        echo "Error zipping files!"
        exit 1
    fi
}

# Function to make 12 copies
make_copies() {
    echo "Making 12 copies of the zip file..."
    for i in {1..12}; do
        cp files.zip flag$i.zip
    done
}

# Function to zip the 12 copies
zip_copies() {
    echo "Zipping 12 copies..."
    zip -q flags.zip flag1.zip flag2.zip flag3.zip flag4.zip flag5.zip flag6.zip flag7.zip flag8.zip flag9.zip flag10.zip flag11.zip flag12.zip
    if [ $? -ne 0 ]; then
        echo "Error zipping flag copies!"
        exit 1
    fi

    if [ ! -f flags.zip ]; then
        echo "Error: flags.zip not found after zipping!"
        exit 1
    fi
}

# Main script
create_files
zip_files

for step in {1..5}; do
    echo "Iteration $step..."
    make_copies
    ls -l flag*.zip  # List the flag files to ensure they are created
    zip_copies
    ls -l flags.zip  # List the flags.zip to ensure it is created

    # Add a small delay to ensure file availability
    sleep 1

    # Debugging output: show file system status and detailed directory listing
    echo "Checking filesystem status and detailed listing..."
    df -h
    ls -l

    # Ensure flags.zip exists and is readable
    if [ -r flags.zip ]; then
        echo "flags.zip is readable, proceeding to move..."
        mv flags.zip files.zip
        if [ $? -ne 0 ]; then
            echo "Error moving flags.zip to files.zip!"
            exit 1
        fi
    else
        echo "Error: flags.zip not found or not readable before mv command!"
        exit 1
    fi

    # Clean up flag*.zip files for the next iteration
    rm flag*.zip
done

# Final cleanup
rm file*.txt

echo "Process completed successfully!"
