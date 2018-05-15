#ifndef PEOPLE_
#define PEOPLE_
#include <string>
class People{
public:
    People(std::string name, int age);
    ~People();

    std::string getName(){return this->name;}
    int getAge(){return this->age;}
private:
    std::string name;
    int age;
};
#endif