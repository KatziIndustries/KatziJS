#include "vkatzi/src/vkatzi.h"
#include <iostream>

#ifndef GIT_HASH
#define GIT_HASH "unknown"
#endif

#ifndef TARGET
#define TARGET "unknown"
#endif

int main()
{
    std::cout << "Welcome to "<< TARGET << "-" << GIT_HASH << std::endl;
    //std::cout << "Type \".help\" for more information." << std::endl;
     

    Input(std::cin);

    return 0;
}