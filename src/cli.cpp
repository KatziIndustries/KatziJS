#include "../vkatzi/src/vkatzi.h"

#include <iostream>
#include <queue>
#include <string>
#include <stdlib.h>

void cli_input(std::istream& input)
{
    std::cout << ">";
    std::string line;

    while (std::getline(input, line))
    {
        if(line == ".help"){
            std::cout << ".exit     Exit" << std::endl;
            std::cout << ".help     Print this help message" << std::endl;
        }else if(line == ".exit") {
            exit(0);
        }else{
            //vkatzi_code_queue(line);
        }
        std::cout << ">";
    }
}
