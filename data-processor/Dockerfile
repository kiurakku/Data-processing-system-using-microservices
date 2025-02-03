# Використовуємо офіційний образ C++
FROM gcc:latest

# Створюємо робочу директорію
WORKDIR /app

# Копіюємо файли проекту
COPY . .

# Встановлюємо залежності для cpprestsdk
RUN apt-get update && apt-get install -y \
    libcpprest-dev \
    cmake

# Компілюємо програму
RUN g++ -o data-processor main.cpp -lcpprest

# Вказуємо порт, який буде використовуватися
EXPOSE 8081

# Запускаємо програму
CMD ["./data-processor"]