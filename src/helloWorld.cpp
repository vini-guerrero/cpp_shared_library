#include <iostream>
#include <stdio.h>


class HelloWorld {
	public:
		void displayMessage(std::string text = "Hello C++"){ std::cout << text << std::endl; }
		static void returnMessage(char *buff){ strcat(buff, " Meets C++"); }
};

extern "C" { 
	HelloWorld* helloWorld(){ return new HelloWorld(); }
	void displayMessage(HelloWorld *helloWorld, char *text){ helloWorld->displayMessage(text); }
	void returnMessage(char *buff) { HelloWorld::returnMessage(buff); }
}

int main(){
	HelloWorld helloWorld;
	helloWorld.displayMessage();
	return 0;
}

