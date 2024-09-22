# k8s & FastAPI Experimentation

This project demonstrates how to deploy a simple FastAPI application that displays "Hello, World!" using Kubernetes. It covers the process of creating a FastAPI app, containerizing it with Docker, and deploying it to a Kubernetes cluster.

## Prerequisites

- Docker installed and configured
- Kubernetes cluster (local or cloud-based)
- kubectl command-line tool installed and configured
- Python 3.9 or later

## Project Structure

```plaintext
kubernetes-fastapi-hello-world/
├── app.py
├── Dockerfile
├── requirements.txt
└── kubernetes-deployment.yaml
```

## Quick Start

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd kubernetes-fastapi-hello-world
   ```

2. Build the Docker image:

   ```bash
   docker build -t fastapi-k8s-hello-world .
   ```

   This command builds a Docker image from your Dockerfile. The `-t` flag tags the image with the name `fastapi-k8s-hello-world`. The `.` at the end specifies that the Dockerfile is in the current directory.

3. Tag the Docker image:

   ```bash
   docker tag fastapi-k8s-hello-world your-docker-username/fastapi-k8s-hello-world
   ```

   This step tags your image with your Docker Hub username, preparing it for pushing to Docker Hub. Replace `your-docker-username` with your actual Docker Hub username.

4. Push the image to Docker Hub:

   ```bash
   docker push your-docker-username/fastapi-k8s-hello-world
   ```

   This command uploads your Docker image to Docker Hub, making it accessible for your Kubernetes cluster to pull. Ensure you're logged in to Docker Hub (`docker login`) before running this command.

5. Deploy to Kubernetes:

   ```bash
   kubectl apply -f kubernetes-deployment.yaml
   ```

   This command creates or updates the resources defined in your `kubernetes-deployment.yaml` file in your Kubernetes cluster.

   > Note: If already deployed, you can delete the existing deployment and redeploy:
   > Check the status of the pods:
   >
   > ```bash
   > kubectl get pods
   > ```
   >
   > This shows the current running pods in your cluster.
   > Delete the deployment:
   >
   > ```bash
   > kubectl delete -f kubernetes-deployment.yaml
   > ```
   >
   > This removes the existing deployment and associated resources.
   >
   > Redeploy the application:
   >
   > ```bash
   > kubectl apply -f kubernetes-deployment.yaml
   > ```
   >
   > This creates a fresh deployment with your updated configuration or image.

6. Access the application:

   ```bash
   kubectl port-forward service/fastapi-hello-world 8080:80
   ```

   This command forwards traffic from your local machine's port 8080 to port 80 of the `fastapi-hello-world` service in your Kubernetes cluster.

   Open a web browser and navigate to `http://localhost:8080`
   You should now see your FastAPI application's "Hello, World!" message in your web browser.
