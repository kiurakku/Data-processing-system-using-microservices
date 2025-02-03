output "api_gateway_service_ip" {
  description = "IP address of the API Gateway service"
  value       = kubernetes_service.api_gateway.status.0.load_balancer.0.ingress.0.ip
}

output "data_processor_service_ip" {
  description = "IP address of the Data Processor service"
  value       = kubernetes_service.data_processor.spec.0.cluster_ip
}
