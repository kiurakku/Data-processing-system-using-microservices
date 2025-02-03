provider "kubernetes" {
  config_path = "~/.kube/config" # Шлях до конфігурації Kubernetes
}

# Deployment для API Gateway
resource "kubernetes_deployment" "api_gateway" {
  metadata {
    name = "api-gateway"
    labels = {
      app = "api-gateway"
    }
  }

  spec {
    replicas = 2 # Кількість реплік

    selector {
      match_labels = {
        app = "api-gateway"
      }
    }

    template {
      metadata {
        labels = {
          app = "api-gateway"
        }
      }

      spec {
        container {
          name  = "api-gateway"
          image = "your-dockerhub-username/api-gateway:latest" # Docker-образ API Gateway
          port {
            container_port = 8080 # Порт контейнера
          }
        }
      }
    }
  }
}

# Service для API Gateway
resource "kubernetes_service" "api_gateway" {
  metadata {
    name = "api-gateway"
  }

  spec {
    selector = {
      app = "api-gateway"
    }

    port {
      port        = 80   # Порт сервісу
      target_port = 8080 # Порт контейнера
    }

    type = "LoadBalancer" # Тип сервісу
  }
}

# Deployment для Data Processor
resource "kubernetes_deployment" "data_processor" {
  metadata {
    name = "data-processor"
    labels = {
      app = "data-processor"
    }
  }

  spec {
    replicas = 2 # Кількість реплік

    selector {
      match_labels = {
        app = "data-processor"
      }
    }

    template {
      metadata {
        labels = {
          app = "data-processor"
        }
      }

      spec {
        container {
          name  = "data-processor"
          image = "your-dockerhub-username/data-processor:latest" # Docker-образ Data Processor
          port {
            container_port = 8081 # Порт контейнера
          }
        }
      }
    }
  }
}

# Service для Data Processor
resource "kubernetes_service" "data_processor" {
  metadata {
    name = "data-processor"
  }

  spec {
    selector = {
      app = "data-processor"
    }

    port {
      port        = 8081 # Порт сервісу
      target_port = 8081 # Порт контейнера
    }
  }
}
