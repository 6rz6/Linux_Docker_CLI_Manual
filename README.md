**Linux CLI and Docker Manual**

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

This enhanced

 manual should act as a comprehensive primer for you, blending essential commands with real-world examples. Keep it handy for swift reference!
