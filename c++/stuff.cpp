#include <iostream>

#include <vector> //lets you have flexible arrays

#include <string> //lets you have strings

int main(){

    std::cout<< "Hello World";

    int x;




    if (true){
        // block of code
    }
    else if (true){
        // block of code
    }
    else {
        // block of code
    }


    for (int i = 1; i < 5; i++){
        break; // exits loop
        continue; // goes to top of loop (increments i in a for loop)
    }


    while (false){ //checks at beggening
        // block of code
    }


    do{
        // block of code
    }while (false);



    int arr1 [5]; //declares array with elements 0-4

    for (int i = 0; i < 5; i ++){
        arr1[i] = i;
    }


    std::cin.ignore();

    std::string y;

    std::cout << "dkjefnenfjfe" << std::endl;

    getline(std::cin,y);

    std::cout << y << std::endl;


    std::string name;       // initializes string
    std::cout << "What's your name?" << std::endl;
    getline(std::cin,name); // stores full name       if std::cin << " " used before: use std::cin.ignore()
    std::cout << "Hi " << name << "!";

//===============================//string manipulation////// reference:(http://www.cplusplus.com/reference/string/string/)
    char cstr[1024] = "This is a C-style string.";
    strcpy(cstr+8, "C-style string manipulation.");
    strcat(cstr, " This is the most accurate version of string manipulation, ");
    strcat(cstr, "but is a pain to do when you're new to the language.");
    std::cout << cstr << std::endl;

    std::string str("This is a C++ STL string.");
    str = str.substr(0, 8) + "manipulation of" + str.substr(7, std::string::npos);
    str += " It's a lot easier to grasp, but it's certainly not as fast";
    str += " computationally, if you know how to do C-string manipulation.";
    std::cout << str << std::endl;
//===============================



    char chr = 'a'

    switch (chr){
        case 'a':
            std::cout << "chr = 'a'" << std::endl;
        case 'b':
        case 'c':
        case 'd':
        case 'z':
            std::cout << "chr != 'a'" << std:endl;

    }

    std::vector<int> intArr;  // declare vector (flexible array)

    intArr.push_back(4) // adds 4 as an element
    intArr.emplace_back(4) // create 4 as an element
    intArr.reserve(5); // reserve 5 spaces for elements




    return 0;
}

