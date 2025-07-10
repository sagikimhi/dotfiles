#include <deque>
#include <cstdlib>
#include <iostream>

typedef std::deque<const char *> dq_t;

int
main(int argc, char *argv[])
{
    dq_t dq;

    dq.push_back("Hello");
    dq.push_back("World");
    dq.push_back("!");

    for (std::size_t i = 0; i < dq.size(); i++) {
        std::cout << "Iter: " << i << ", ";
        std::cout << "Elem: " << dq[i] << std::endl;
    }

    (void)(argc);
    (void)(argv);
    return 0;
}
