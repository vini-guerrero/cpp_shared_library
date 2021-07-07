#include <iostream>
#include <stdio.h>

class HelloWorld {
	public:
		void classFunction(std::string text = "Hello C++"){
			std::cout << text << std::endl;
		}
};

extern "C" {
	HelloWorld* helloWorld(){ return new HelloWorld(); }
	void helloWorld_classFunction(HelloWorld* helloWorld, char* text){ helloWorld -> classFunction(text); }
	int sum(int x, int y) { return x + y; }
}

int main(){
	HelloWorld helloWorld;
	helloWorld.classFunction();
	return 0;
}

