#include <iostream>

int main(){

    int i = 0;
    int x = i++;
    std::cout<<i << x << std::endl;
    i = 0;
    x = ++i;
    std::cout << i << x;


    return 0;
}
