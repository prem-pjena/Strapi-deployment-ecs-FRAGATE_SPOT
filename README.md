
# Strapi ECS Deployment with CloudWatch Monitoring

This repository contains the infrastructure and CI/CD pipeline for deploying a Strapi application on AWS using ECS Fargate, managed entirely via Terraform. It also includes CloudWatch for monitoring (logs and metrics) of the Strapi application.

## Features:
- **ECS Fargate Deployment:** The Strapi app is deployed on AWS ECS Fargate.
- **Terraform Infrastructure Management:** All resources (ECS, IAM roles, CloudWatch, etc.) are managed using Terraform.
- **CI/CD with GitHub Actions:** Automated deployment pipeline with GitHub Actions.
- **CloudWatch Logs & Metrics:** Integrated CloudWatch for logging and monitoring ECS tasks.

## Prerequisites:
1. **AWS Account:** Make sure you have an AWS account and appropriate IAM roles.
2. **GitHub Secrets:**
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
   - `ECR_URI` (Your ECR URI, e.g., `aws_account_id.dkr.ecr.region.amazonaws.com/repository_name`)
   - `ECS_CLUSTER_NAME`
   - `ECS_SERVICE_NAME`
   
3. **Terraform Installed:** Install Terraform on your local machine if you plan to test locally.
4. **Docker Installed:** For building and pushing the Docker image to Amazon ECR.

## Setup Instructions:

### Step 1: Clone the Repository

```bash
git clone https://github.com/prem-pjena/strapi-ecs-deploy-cloudwatch.git
cd strapi-ecs-deploy-cloudwatch
```

### Step 2: Configure AWS Credentials

Ensure you have your AWS credentials set up locally, or use GitHub Secrets if running the CI/CD pipeline. Your `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION` should be configured.

### Step 3: Set Up Terraform

1. Install Terraform if you don't have it already installed.
2. Navigate to the `terraform/` directory.

```bash
cd terraform
```

3. Initialize Terraform:

```bash
terraform init
```

4. Review the plan and apply it:

```bash
terraform plan
terraform apply -auto-approve
```

This will provision the necessary infrastructure including ECS Fargate, CloudWatch Logs, IAM roles, and more.

### Step 4: Dockerize Strapi

The Dockerfile in the root of this repository will help you build the Strapi app image. Build and push the image to Amazon ECR:

1. Log in to Amazon ECR:

```bash
aws ecr get-login-password --region your-region | docker login --username AWS --password-stdin your-ecr-uri
```

2. Build and push the Docker image:

```bash
docker build -t your-ecr-uri:latest .
docker push your-ecr-uri:latest
```

### Step 5: Trigger CI/CD with GitHub Actions

After pushing to the `main` branch, the GitHub Actions workflow will automatically:
1. Initialize Terraform
2. Plan and apply changes to the infrastructure
3. Build and push the Docker image to ECR
4. Force ECS to perform a new deployment

### Step 6: Monitoring with CloudWatch

CloudWatch will be used to monitor the following:
- **Logs:** Application logs from the Strapi service.
- **Metrics:** CPU, memory utilization, network in/out.
- **Alarms/Dashboards (Optional):** You can optionally set up CloudWatch alarms to monitor high CPU or memory usage, ECS task health, and more.

### Step 7: Access the Strapi Application

Once the ECS service is up and running, you can access the Strapi application via the load balancer URL or public IP. Use the URL provided in the AWS console to interact with the Strapi admin interface.

## Troubleshooting:

- Ensure that all required GitHub Secrets are set up correctly.
- If Terraform fails, check for any existing resources with the same name (ECS, IAM roles, etc.).
- Check CloudWatch logs for any runtime issues in the Strapi app.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
