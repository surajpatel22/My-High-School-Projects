#include <iostream>




int main(){

    int m, d;

        std::cout << "month?";
        std::cin >> m;

    while (m > 12 || m <= 0){
        std::cout << "m > 0 & m <= 12 !!!!!";
        std::cin >> m;
    }

        std::cout << "day?";
        std::cin >> d;

    while (d > 31 || d <= 0){
        std::cout << " d > 0 & d <= 31 !!!!!";
        std::cin >> d;

    }

        if (m == 2){
            if (d == 18){
                std::cout << "Special";
            }
            else if (d < 18){
                std::cout << "Before";
            }
            else {
                std::cout << "After";
            }
        }
        else if (m < 2){
            std::cout << "Before";
        }
        else{
            std::cout << "After";
        }
    return 0;
}
