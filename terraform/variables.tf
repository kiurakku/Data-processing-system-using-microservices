variable "api_gateway_image" {
  description = "Docker image for API Gateway"
  type        = string
  default     = "your-dockerhub-username/api-gateway:latest"
}

variable "data_processor_image" {
  description = "Docker image for Data Processor"
  type        = string
  default     = "your-dockerhub-username/data-processor:latest"
}

variable "replicas" {
  description = "Number of replicas for each service"
  type        = number
  default     = 2
}
