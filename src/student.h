#ifndef STUDENT_
#define STUDENT_
#include "people.h"
#include <string>

class Stdudent:public People{
public:
    Stdudent(std::string name, int age);
    ~Stdudent();
}; 
#endif