# --- Variables ---

variable "region" {
  description = "AWS region where resources will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "strapi_image" {
  description = "Docker image URI for the Strapi container."
  type        = string
  default     = "331405041655.dkr.ecr.us-east-1.amazonaws.com/strapi-repo:latest"
}

variable "strapi_container_port" {
  description = "Port on which the Strapi container will listen."
  type        = number
  default     = 1337
}
