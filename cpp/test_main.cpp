#include <iostream>
#include <vector>

#define CATCH_CONFIG_MAIN

#include "catch/catch.hpp"


TEST_CASE("Something works for good cases", "[seed][good]") {
    auto keys = std::vector<std::string> {
            "Y", "N"
    };
    for (auto &&key: keys) {
        REQUIRE(key.size() == 1);
    }
}

