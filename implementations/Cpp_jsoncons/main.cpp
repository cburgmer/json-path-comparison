#include <iostream>
#include <string>
#include <jsoncons/json.hpp>
#include <jsoncons_ext/jsonpath/json_query.hpp>

using namespace jsoncons;

int main(int argc, char *argv[]) {
    std::string json_str = "";
    for (std::string line; std::getline(std::cin, line);) {
        json_str += line;
    }

    const json root = json::parse(json_str);

    std::string path = argv[1];
    try {
        json result = jsonpath::json_query(root, path);
        std::cout << result << "\n";
    } catch (const std::exception& e) {
        std::cout << e.what() << "\n";
        return 1;
    }
}
