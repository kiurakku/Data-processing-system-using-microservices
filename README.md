
# Проект: Система обробки даних з використанням мікросервісів

Цей проект демонструє створення системи обробки даних з використанням мікросервісів, Docker, Kubernetes, Terraform, Golang та C++. Система складається з двох мікросервісів:
1. **API Gateway** (написаний на Golang) — приймає HTTP-запити та перенаправляє їх до Data Processor.
2. **Data Processor** (написаний на C++) — обробляє дані та повертає результат.

---

## Зміст
1. [Вимоги](#вимоги)
2. [Інструкція зі встановлення](#інструкція-зі-встановлення)
3. [Використання](#використання)
4. [Розгортання в Kubernetes](#розгортання-в-kubernetes)
5. [Ліцензія](#ліцензія)
6. [Автор](#автор)

---

## Вимоги

Для запуску проекту необхідно встановити наступне програмне забезпечення:
- Docker
- Docker Compose
- Terraform
- Kubernetes (наприклад, Minikube або інший кластер)
- Golang (для локальної розробки)
- GCC (для компіляції C++)

---

## Інструкція зі встановлення

### 1. Клонуйте репозиторій
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Зберіть Docker-образи
```bash
docker-compose build
```

### 3. Запустіть систему локально за допомогою Docker Compose
```bash
docker-compose up
```

---

## Використання

Після запуску системи ви можете відправити HTTP-запит до API Gateway:

```bash
curl http://localhost:8080
```

Ви отримаєте відповідь від Data Processor у форматі:
```json
{
  "message": "Data processed successfully!"
}
```

---

## Розгортання в Kubernetes

### 1. Завантажте Docker-образи до Docker Hub
```bash
docker build -t your-dockerhub-username/api-gateway:latest ./api-gateway
docker build -t your-dockerhub-username/data-processor:latest ./data-processor
docker push your-dockerhub-username/api-gateway:latest
docker push your-dockerhub-username/data-processor:latest
```

### 2. Використовуйте Terraform для розгортання
```bash
terraform init
terraform apply
```

### 3. Перевірте розгортання
```bash
kubectl get pods
kubectl get services
```

---

## Ліцензія

Цей проект ліцензовано за умовами [MIT License](LICENSE).

---

## Автор

- **Kiurakku**
- GitHub: [kiurakku](https://github.com/4am-png)
