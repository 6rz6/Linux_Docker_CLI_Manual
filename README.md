# Full Docker Install Manual on Linux CLI 


**Install Docker on Ubuntu and Debian** using a single command [docker install script](https://github.com/6rz6/Linux_Docker_CLI_Manual/blob/main/docker_install.sh) 

### step by step tutorial

 - **Update Package Index & Install Required Packages**
  ```bash
  sudo apt update
  ```
  ```bash
  sudo apt install apt-transport-https ca-certificates curl software-properties-common
  ```
  
 - **Download and Add Docker GPG Key**
  ```bash
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  ```
  
 - **Add Docker Repository**
  ```bash
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  ```
  
 - **Update Package Index**
  ```bash
  sudo apt update
  ```
  
 - **Install Docker CE**
  ```bash
  sudo apt install docker-ce
  ```
  
 - **Start Docker Daemon**
  ```bash
  sudo systemctl start docker
  ```
  
 - **Enable Docker to Start on Boot**
  ```bash
  sudo systemctl enable docker
  ```

## Linux CLI and Docker Manual

Welcome to the comprehensive guide to the Linux Command Line Interface (CLI) and Docker. Here you'll find an organized collection of essential commands complemented with real-world usage examples.

---

**1. Server and SSH Access**

- **SSH into a Server**:
  ```
  ssh -i <PrivateKeyFile> user@<IPAddress>
  Example: ssh -i ~/.ssh/mykey.pem john@192.168.1.10
  ```

  - **Copy Files between Local System and Remote Server**:
    ```
    scp <LocalFilePath> user@<IPAddress>:<RemoteDirectoryPath>
    Example: scp ~/documents/report.txt john@192.168.1.10:~/reports/
    ```

  - **Copy Directory to Remote Server**:
    ```
    scp -r <LocalDirectory> user@<IPAddress>:<RemoteDirectoryPath>
    Example: scp -r ~/documents/project/ john@192.168.1.10:~/projects/
    ```

  - **Display SSH Configuration**:
    ```
    cat ~/.ssh/config
    Example: cat ~/.ssh/config
    ```

  - **Generate SSH Key Pair**:
    ```
    ssh-keygen
    Example: ssh-keygen
    ```

  - **Check SSH Connection**:
    ```
    ssh -T git@github.com
    Example: ssh -T git@github.com
    ```

  - **Edit SSH Configuration**:
    ```
    nano ~/.ssh/config
    Example: nano ~/.ssh/config
    ```

---

**2. User Management in Linux**

- **Add User for Server Access**:

  - **Create a New User**:
    ```
    sudo useradd -m <username>
    Example: sudo useradd -m linda
    ```

  - **Set Password**:
    ```
    sudo passwd <username>
    Example: sudo passwd linda
    ```

  - **Paste Public SSH Key**:
    ```
    nano /home/<username>/.ssh/authorized_keys
    Example: nano /home/linda/.ssh/authorized_keys
    ```

  - **Add User to Sudoers List**:
    ```
    sudo usermod -aG sudo <username>
    Example: sudo usermod -aG sudo linda
    ```

  - **Delete a User**:
    ```
    sudo userdel <username>
    Example: sudo userdel linda
    ```

  - **Display List of Users**:
    ```
    cat /etc/passwd
    Example: cat /etc/passwd
    ```

  - **Change User Information**:
    ```
    sudo chfn <username>
    Example: sudo chfn linda
    ```

  - **Change User's Shell**:
    ```
    sudo chsh <username>
    Example: sudo chsh linda
    ```

  - **Lock a User Account**:
    ```
    sudo passwd -l <username>
    Example: sudo passwd -l linda
    ```

  - **Unlock a User Account**:
    ```
    sudo passwd -u <username>
    Example: sudo passwd -u linda
    ```

  - **Grant Directory Access**:
    ```
    chmod +rx /home/SRCusername
    usermod -aG SRCusername Targetusername
    chown SRCusername:SRCusername /home/SRCusername
    Example: chmod +rx /home/john
            usermod -aG john linda
            chown john:john /home/john
    ```

---

**3. Docker Operations**

- **List Running Containers**:
  ```
  docker ps
  Example: docker ps
  ```

  - **List All Containers** (including stopped ones):
    ```
    docker ps -a
    Example: docker ps -a
    ```

  - **Start a Stopped Container**:
    ```
    docker start <CONTAINER ID/NAME>
    Example: docker start nostalgic_turing
    ```

  - **Stop a Running Container**:
    ```
    docker stop <CONTAINER ID/NAME>
    Example: docker stop jolly_pasteur
    ```

  - **Remove a Container**:
    ```
    docker rm <CONTAINER ID/NAME>
    Example: docker rm nostalgic_turing
    ```

  - **Attach to a Running Container**:
    ```
    docker container attach <CONTAINER ID>
    Example: docker container attach a1b2c3d4
    ```

  - **Pull an Image**:
    ```
    docker pull <IMAGE_NAME>
    Example: docker pull nginx:latest
    ```

  - **List Docker Images**:
    ```
    docker images
    Example: docker images
    ```

  - **Remove an Image**:
    ```
    docker rmi <IMAGE_NAME>
    Example: docker rmi nginx:latest
    ```

  - **Run a Docker Image**:
    ```
    docker run -it -p <HOST_PORT>:<CONTAINER_PORT> <IMAGE_NAME>
    Example: docker run -it -p 8080:80 nginx:latest
    ```

  - **Enter a Running Container's Shell**:
    ```
    docker exec -it <CONTAINER ID/NAME> /bin/bash
    Example: docker exec -it jolly_pasteur /bin/bash
    ```

  - **Inspect a Container**:
    ```
    docker inspect <CONTAINER ID/NAME>
    Example: docker inspect jolly_pasteur
    ```

  - **Retrieve Logs from a Container**:
    ```
    docker logs <CONTAINER ID/NAME>
    Example: docker logs jolly_pasteur
    ```

  - **Using Curl Inside a Container**:
    ```
    curl get <URL>
    Example: curl get http://example.com
    ```

  - **Clone a Repository Inside a Container**:
    ```
    git clone <REPO_URL>
    Example: git clone https://github.com/username/repo.git
    ```

---

**4. Data Transfer in Docker**

- **Move and Copy Files within a System**:
  ```
  mv <SOURCE_PATH> <DESTINATION_PATH>
  Example: mv ~/old_location/file.txt ~/new_location/
  ```

  - **Copy File to a Container**:
    ```
    docker container cp <SOURCE_PATH> <CONTAINER ID>:<DESTINATION_PATH_IN_CONTAINER>
    Example: docker container cp ~/documents/report.txt jolly_pasteur:/app/
    ```

  - **Copy File from a Container to Host**:
    ```
    docker container cp <CONTAINER ID>:<SOURCE_PATH_IN_CONTAINER> <DESTINATION_PATH>
    Example: docker container cp jolly_pasteur:/app/report.txt ~/documents/
    ```

  - **Bind Mount a Volume to a Container**:
    ```
    docker run -v <HOST_DIRECTORY>:<CONTAINER_DIRECTORY> <IMAGE_NAME>
    Example: docker run -v ~/data:/app/data nginx:latest
    ```

  - **Create a Docker Volume**:
    ```
    docker volume create <VOLUME_NAME>
    Example: docker volume create mydata
    ```

  - **List Docker Volumes**:
    ```
    docker volume ls
    Example: docker volume ls
    ```

---

**Linux CLI and Docker Manual** *(Continuation)*

---

**5. Docker-Compose Commands**

- **Start services defined in a docker-compose.yml**:
  ```
  docker-compose up
  Example: docker-compose up
  ```

  - **Start services in detached mode**:
    ```
    docker-compose up -d
    Example: docker-compose up -d
    ```

  - **Stop running services**:
    ```
    docker-compose down
    Example: docker-compose down
    ```

  - **List running services**:
    ```
    docker-compose ps
    Example: docker-compose ps
    ```

  - **Build or rebuild services**:
    ```
    docker-compose build
    Example: docker-compose build
    ```

  - **Check service logs**:
    ```
    docker-compose logs <SERVICE_NAME>
    Example: docker-compose logs webapp
    ```

  - **Execute command in a running service container**:
    ```
    docker-compose exec <SERVICE_NAME> <COMMAND>
    Example: docker-compose exec webapp ls -la
    ```

---

**6. Nginx on Docker Domain, Subdomain, and DNS Setting Commands**

*(Note: These commands assume you're running an nginx container and have access to DNS settings for domain configuration.)*

- **Run an Nginx container with a bound configuration**:
  ```
  docker run -d -p 80:80 -v /path/to/nginx.conf:/etc/nginx/nginx.conf nginx
  Example: docker run -d -p 80:80 -v ~/nginx.conf:/etc/nginx/nginx.conf nginx
  ```

  - **Sample Nginx configuration for domain and subdomain**:
    ```nginx
    server {
        listen 80;
        server_name example.com www.example.com;
        location / {
            proxy_pass http://your_backend_service_address;
        }
    }

    server {
        listen 80;
        server_name sub.example.com;
        location / {
            proxy_pass http://your_backend_service_address_for_subdomain;
        }
    }
    ```

  - **Update DNS records for domain and subdomain**:
    ```
    (This isn't a command, but a procedure. Use your DNS provider's interface to point `example.com` and `sub.example.com` to your server's IP address.)
    ```

  - **Reload Nginx inside Docker without stopping the container**:
    ```
    docker exec <CONTAINER_ID/NAME> nginx -s reload
    Example: docker exec nostalgic_turing nginx -s reload
    ```

---

**7. Linux Server and Docker Container Port Security**

*(Note: The following procedures are general practices for maintaining security. Please ensure that you have the necessary software/tools installed and always keep backups before making any changes.)*

- **Check open ports on Linux server**:
  ```
  sudo netstat -tuln
  Example: sudo netstat -tuln
  ```

  - **Limit ports using UFW (Uncomplicated Firewall)**:
    ```
    sudo ufw allow <PORT>/<PROTOCOL>
    Example: sudo ufw allow 22/tcp
    ```

  - **Deny a specific port using UFW**:
    ```
    sudo ufw deny <PORT>/<PROTOCOL>
    Example: sudo ufw deny 3306/tcp
    ```

  - **Enable UFW**:
    ```
    sudo ufw enable
    Example: sudo ufw enable
    ```

  - **Check Docker container's exposed ports**:
    ```
    docker port <CONTAINER_ID/NAME>
    Example: docker port jolly_pasteur
    ```

  - **Limit Docker container port exposure**:
    *(When running a Docker container, you can map only necessary ports to host ports.)*
    ```
    docker run -p <HOST_PORT>:<CONTAINER_PORT> <IMAGE_NAME>
    Example: docker run -p 8080:80 nginx:latest
    ```

  - **Keep Docker and its dependencies updated**:
    ```
    sudo apt-get update && sudo apt-get upgrade docker docker-compose
    Example: sudo apt-get update && sudo apt-get upgrade docker docker-compose
    ```

  - **Run containers with a non-root user**:
    *(This involves using the `--user` flag with Docker and setting up Dockerfile to support non-root users. Here's a general command.)*
    ```
    docker run -d --user <UID>:<GID> <IMAGE_NAME>
    Example: docker run -d --user 1001:1001 nginx:latest
    ```
