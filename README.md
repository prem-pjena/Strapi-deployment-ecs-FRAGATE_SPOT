# 🚀 Strapi CI/CD Deployment with Terraform on AWS

This project demonstrates a complete CI/CD pipeline using **GitHub Actions**, **Terraform**, and **Amazon ECS with Fargate** to deploy a Strapi backend. The pipeline includes:
- Docker image build and push to **Amazon ECR**
- Infrastructure provisioning via **Terraform**
- Deployment on **AWS ECS with Application Load Balancer**
- Auto-destroy infrastructure after 5 minutes for cost saving

---

## 🧰 Tech Stack

- **Strapi** (Backend)
- **Docker**
- **Terraform**
- **AWS ECS (Fargate)**
- **Amazon ECR**
- **Application Load Balancer**
- **GitHub Actions**

---

## 📂 Project Structure

. ├── .github/workflows │ └── main.yml # GitHub Actions CI/CD pipeline ├── terraform/ │ ├── main.tf # Terraform ECS, ALB, ECR config │ ├── variables.tf │ ├── outputs.tf │ └── ... ├── Dockerfile # Dockerfile for Strapi app ├── README.md └── ...


---

## 🔧 How It Works

1. **Push to `main` branch** triggers the CI/CD pipeline.
2. **Docker Image** is built and pushed to **ECR**.
3. **Terraform** provisions ECS + ALB and deploys the container.
4. **Output** includes the public Strapi URL.
5. After **5 minutes**, resources are **automatically destroyed**.

---

## 📌 Prerequisites

- AWS Account with access keys
- ECR repository created
- GitHub Secrets configured:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
  - `ECR_REPOSITORY`

---

## 📄 GitHub Secrets Example

Add these in your GitHub repo settings:

| Secret Name           | Description                    |
|-----------------------|--------------------------------|
| `AWS_ACCESS_KEY_ID`   | Your AWS access key            |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret access key  |
| `AWS_REGION`          | e.g. `us-east-1`               |
| `ECR_REPOSITORY`      | Name of your ECR repo          |

---

## 🌐 Strapi Access URL

Once deployed, check the **GitHub Actions Logs** for:

Strapi URL: http://<your-alb-dns>.elb.amazonaws.com


You can visit this URL directly in your browser.

---

## ⚠️ Auto Destroy

To avoid charges, the infrastructure is **auto-destroyed after 5 minutes** using a delayed background command in the GitHub Actions runner.

---


## 📬 Contact

Made by [Prem Prakash Jena](https://github.com/prem-pjena)  
Email: premprakashjena04@gmail.com  
LinkedIn: [premprakashj](https://linkedin.com/in/premprakashj/)

---

## 📝 License

MIT License

