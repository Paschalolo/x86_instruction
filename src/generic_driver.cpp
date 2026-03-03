/*
 * Generic driver program to demonstarte function rturning assembly language to  c++ 
 * Author : Pascahl Ahanmisi 
 * 
 * */

#include <error.h>
#include <stdio.h>
#include <string.h> 
#include <stdlib.h> 


// extern c proevents name mangling in c++ 

extern "C" {
	void asmMain(void );

	// getTitle returns a pointer to a string of characters 
	char* getTitle(); 

	//c++ function that the assembly program can call 
	int readLine(char* dest , int maxLen); 
};

int readLine(char* dest , int maxLen){

	return -1; 
}
int main(){

	return 0 ; 
}
