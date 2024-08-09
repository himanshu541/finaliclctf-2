# Dockerfile_ssh
FROM ubuntu:latest

# Update and install necessary packages
RUN apt update && apt install openssh-server binutils p7zip-full sudo -y

# Create SSH users with a home directory in /home/

# Admin user
RUN useradd -rm -d /home/interstellarroot  -s /bin/bash -u 1001 interstellarroot
# Normal user
RUN useradd -rm -d /home/astroagent  -s /bin/bash -u 1002 astroagent

# Set passwords for the new users
# Password for admin user 
RUN echo 'interstellarroot:Qu@ntum4cc3ss#2024!' | chpasswd
# Password for normal user 
RUN echo 'astroagent:N3bulaS3cur3!2024@' | chpasswd

COPY key5.txt /home/astroagent/key5.txt
COPY astroagentflag.txt /home/astroagent/flag5.txt
COPY verysecretimage.jpg /home/astroagent/verysecretimage.jpg

COPY key6.txt /home/interstellarroot/key6.txt
COPY interrootflag.txt /home/interstellarroot/flag6.txt
COPY dump.7z /home/interstellarroot/dump.7z

RUN chmod 700 /home/interstellarroot
RUN chown interstellarroot:interstellarroot /home/interstellarroot
RUN chown interstellarroot:interstellarroot /home/interstellarroot/dump.7z
#copy usb image in first user

# Expose the SSH port
EXPOSE 22

# Start the SSH service in the foreground
CMD ["service" "ssh" "start"]

