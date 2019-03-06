#include <vector>
#include <iostream>

int main(int argc, const char* argv[])
{
    std::vector<int> arr;   //no need to set initializations! In fact, they'll give you errors.
    int size, in = 0;

    std::cin >> size;

    arr.reserve(size);

    while(in >= 0)         //leave when you get a negative input
    {
	arr.emplace_back(in); //will automatically add directly to the end of the vector
        std::cin >> in;
    }

    //spit everything back out
    for (int i = 1; i < arr.size(); ++i)
    {
        std::cout << arr[i] << std::endl;
    }

    return 0;
}
