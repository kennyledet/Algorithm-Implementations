#include <iostream>
#include <bitset>

#define DOORSNUM 100

void walk_and_print(std::bitset<DOORSNUM> &doors, unsigned int cycle, bool print){
	for(unsigned int i = 0; i < cycle;i++){
		for(unsigned int j = i - 1; j < DOORSNUM; j+=i){
			doors.flip(j);
		}
	}
	if(print){
		for(unsigned int i = 0; i < DOORSNUM; i++){
			if(doors[i] == 1){
				std::cout << "Door " << i << ": is Open"<<std::endl; 
			}else{
				std::cout << "Door " << i << ": is Closed"<<std::endl; 
			}
		}
	}
}
int main(){
	std::bitset<DOORSNUM> doors;
	walk_and_print(doors, 100,true);
	return 0;
}