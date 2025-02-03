#include <iostream>
#include <cpprest/http_listener.h>
#include <cpprest/json.h>

using namespace web;
using namespace http;
using namespace http::experimental::listener;

void handle_request(http_request request) {
    // Створюємо JSON-відповідь
    json::value response;
    response["message"] = json::value::string("Data processed successfully!");
    request.reply(status_codes::OK, response);
}

int main() {
    // Налаштовуємо HTTP-сервер
    http_listener listener("http://0.0.0.0:8081/process");
    listener.support(methods::GET, handle_request);
    listener.open().wait();

    std::cout << "Data Processor is running..." << std::endl;
    while (true);
    return 0;
}