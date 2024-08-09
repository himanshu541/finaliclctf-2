# Dockerfile_ssh
FROM ubuntu:latest

# Update and install necessary packages
RUN apt update && apt install openssh-server binutils sudo unzip -y

# Create SSH users with a home directory in /home/

# Admin user
RUN useradd -rm -d /home/galacticexplorer  -s /bin/bash -u 1001 galacticexplorer

# Set passwords for the new users
# Password for admin user 
RUN echo 'galacticexplorer:C0sm1cVoy@ger!2024' | chpasswd
RUN mkdir /home/galacticexplorer/.folder

COPY ./forensic/flag8.zip /home/galacticexplorer/.folder/flag8.zip
COPY ./forensic/key8.txt /home/galacticexplorer/.folder/key8.txt
COPY ./forensic/flag9.zip /home/galacticexplorer/.folder/flag9.zip
COPY ./forensic/key9.txt /home/galacticexplorer/.folder/key9.txt
COPY ./forensic/flag10.zip /home/galacticexplorer/.folder/flag10.zip
COPY ./forensic/key10.txt /home/galacticexplorer/.folder/key10.txt
COPY ./forensic/flag11.zip /home/galacticexplorer/.folder/flag11.zip
COPY ./forensic/key11.txt /home/galacticexplorer/.folder/key11.txt
COPY ./forensic/flag12.zip /home/galacticexplorer/.folder/flag12.zip
COPY ./forensic/key12.txt /home/galacticexplorer/.folder/key12.txt
# Expose the SSH port
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag1/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag2/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag3/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag4/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag5/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag6/flags.zip
COPY ./forensic/flags.zip /home/galacticexplorer/.folder/flag7/flags.zip



EXPOSE 22

# Start the SSH service in the foreground
CMD ["service" "ssh" "start"]

