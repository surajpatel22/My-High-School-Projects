#include <iostream>

int main(){
    std::cout << "hello, world\n";
    int i = 0;
    std::cin >> i;
    for (int a = 0; a < i; ++a) {
        std::cout << a << "\n";
    }
    int j = 0;
    std:cin >> j;
    if (j % 2 == 0)
        std::cout << "even\n";
    else
        std::cout << "odd\n";
    int k = 5;
    int arr[k] = {};
    for (int a = 0; a < k; ++a) {
        arr[k] = a
        std::cout << arr[k];
    }
    return 0;
}
