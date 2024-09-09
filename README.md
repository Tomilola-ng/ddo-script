# DDO: Docker Digital Ocean

**DDO (Docker Digital Ocean)** is an automated script for deploying Docker images to DigitalOcean droplets. It streamlines the entire process from building and pushing Docker images to running them on your droplet with just a single command. DDO helps you manage your cloud infrastructure with ease, ensuring fast and seamless updates to your Docker containers.

## 🚀 Features

- **Automates Docker Image Management**: Automatically builds and pushes Docker images to Docker Hub.
- **SSH Integration**: Seamless connection to your DigitalOcean droplet for deployment.
- **Efficient Container Management**: Stops and removes existing Docker containers before deploying updated ones.
- **Environment Variable Configuration**: Easily configurable for different droplets and containers.
- **Extensible Setup**: Supports extensions with Docker Compose and Nginx for more complex infrastructures.

## 🔧 Prerequisites

Before you start using **DDO**, ensure that you have:

- A **DigitalOcean** account with at least one active droplet.
- A **Dockerized application** that can be deployed.
- **SSH access** to your DigitalOcean droplet.
- **Docker** installed on both your local machine and the droplet.
  
To install Docker on your droplet, you can follow [this guide](https://marketplace.digitalocean.com/apps/docker).

## 📥 Installation

1. Clone the DDO script repository:
   ```bash
   git clone https://github.com/Tomilola-ng/ddo-script.git
   cd ddo-script
   ```

2. Open the `deploy.sh` file and navigate to lines `9 to 11` and configure your deployment variables:
   ```bash
   DROPLET_IP="your_droplet_ip"
   CONTAINER_NAME="your_container_name"
   IMAGE_NAME="your_dockerhub_username/your_image_name"
   ```

   Make sure to replace the placeholders with your own values:
   - `your_droplet_ip`: The IP address of your DigitalOcean droplet.
   - `your_container_name`: The name of your Docker container.
   - `your_dockerhub_username/your_image_name`: The name of your Docker image on Docker Hub.
  
3. Make the file executable, after editing the placeholders and saving it
   ```bash
   chmod u+x deploy.sh
   ```

## 🛠 How to Use

1. **Build and Push Docker Image**  
   The `deploy.sh` script checks for any changes in your local Git repository. If changes are detected, it will automatically build the updated Docker image and push it to Docker Hub:
   
   ```bash
   ./deploy.sh
   ```

2. **Deploy to DigitalOcean**  
   After the image has been pushed, the script will SSH into your droplet, stop the running container with the same name, pull the updated image from Docker Hub, and run the new container:
   
   ```bash
   ssh root@$DROPLET_IP
   ```

3. **Example Workflow**  
   - Make changes to your codebase.
   - Run the `deploy.sh` script.
   - DDO will:
     1. Check for changes.
     2. Build and push the updated Docker image.
     3. SSH into your droplet and deploy the new container.

## 🖥️ DigitalOcean Droplet Setup

If you haven't set up your droplet yet or need to install Docker on it, follow this [DigitalOcean Setup Guide](https://marketplace.digitalocean.com/apps/docker). It covers how to spin up a Docker-ready droplet quickly.

### Firewall Configuration
Ensure that port **8000** (or any other port used by your container) is open in the firewall settings of your DigitalOcean droplet.

## 🤝 Contributing

We are open to contributions from the community to make DDO better! To contribute:

1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your branch (`git push origin feature-branch`).
5. Open a pull request and describe the feature you have added.

Feel free to report any issues or suggest new features by opening an issue on GitHub.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
