# Dockerfile_ssh
FROM demonrevoked/vuln:nmap-3.81

# Update and install necessary packages
RUN apt update && apt install openssh-server sudo -y
RUN apt-get install libssl-dev -y && export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Create SSH users with a home directory in /home/
# Admin user
RUN useradd -rm -d /home/cosmosadmin  -s /bin/bash -u 1001 cosmosadmin
# Normal user
RUN useradd -rm -d /home/voyager -s /bin/bash -u 1002 voyager

# Set passwords for the new users
# Password for admin user 'cosmosadmin'
RUN echo 'cosmosadmin:St3ll@rR00t#9!84' | chpasswd
# Password for normal user 'voyager'
RUN echo 'voyager:Gal@cticP@ssw0rd!2024' | chpasswd

# Set permissions on cosmosadmin's home directory to prevent other users from accessing it
COPY key2.txt /home/voyager/key2.txt
COPY key3.txt /home/cosmosadmin/key3.txt
COPY voyagerflag.txt /home/voyager/flag2.txt
COPY cosmosadminflag.txt /home/cosmosadmin/flag3.txt
COPY flag /root/flag7
COPY key7.txt /root/key7.txt
# Allow voyager to run nmap as root without a password
RUN echo 'voyager ALL=(ALL) NOPASSWD: /usr/local/bin/nmap' >> /etc/sudoers

RUN chmod 700 /home/cosmosadmin

RUN chown cosmosadmin:cosmosadmin /home/cosmosadmin
RUN chown cosmosadmin:cosmosadmin /home/cosmosadmin/key3.txt
RUN chown cosmosadmin:cosmosadmin /home/cosmosadmin/flag3.txt

# Expose the SSH port
EXPOSE 22

# Start the SSH service in the foreground
CMD ["service" "ssh" "start"]
