#include <iostream>

int main(){

    int x, y, z;

    std::cin >> x >> y >> z;

    if ((x > y && x < z)||(x > z && x < y)){
        std::cout << x;
    }
    else if ((y > x && y < z)||(y > z && y < x)){
        std::cout << y;
    }
    else{
        std::cout << z;
    }

return 0;
}
