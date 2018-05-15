#include <iostream>
#include "student.h"
#define SIGSLOT_USE_POSIX_THREADS
#include "sigslot.h"
using namespace std;

class Switch{
public:
	sigslot::signal1<int> Clicked;
};

class Light: public sigslot::has_slots<>{
public:
	void Toggle(int num){
		std::cout<<"Toggle"<<num<<std::endl;
	};
};

int main(){
	Switch sw;
	Light lt;
	sw.Clicked.connect(&lt, &Light::Toggle);
	sw.Clicked(2);
	Stdudent people("youzhenyu", 28);
	std::cout<<"Hello "<<people.getName()<<std::endl;
	return 0;
}
