# Ubuntu 20.04 Docker Development Environment
*** Be sure to change the password for the user and root immediately after creating the container! ***

## Configuration/Installation
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
1. Start the Docker Daemon by searching for the program and starting it. It is useful to have docker always startup on login.
1. Run ```docker pull s7117/ubuntu_20_04_env```
1. Run ```docker run -d -p <local_port>:22 --name <container_name> --hostname <hostname> -ti s7117/ubuntu_20_04_env```

## Enter the shell via docker exec
1. Run ```docker exec -u user -w /home/user -ti  <container_name> /bin/zsh```

Optionally, you can add the ```--restart unless-stopped``` to the ```docker run``` command to restart the docker container on docker startup.

Note: Install the fira-code font on your local machine for the prompt to display correctly. If you don't want the default port then change the "theme" in the .zshrc file to "robbyrussell".

## Enter the shell via ssh.
1. Enter the shell via docker exec above.
1. Copy and paste a ssh key into ~/.ssh/authorized_keys
1. Configure the ports locally as the <local_port> in the docker run command above.
1. Run ```ssh -p <local_port> user@<local_ip_address> -i <ssh_key_private_key_file>```

In Windows you go to Control Panel -> System and Security -> Windows Defender Firewall -> Advanced settings. Got to Inbound Rules and create a new port rule. Note that you may not need to do this as there are already rules corresponding to docker (i.e. com.docker.backend). You will want to enable the 'Public' rules to ssh outside of your local computer.

On MacOS, go to System Preferences -> Security & Privacy -> Firewall -> Firewall Options...
