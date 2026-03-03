

// A simple program taht calls an assembly fucntion 
// it needs the stdio.h pacakage 

#include <cstdio> 
#ifdef __cplusplus
extern "C"{
#endif
	void asmfunc(void); 
#ifdef __cplusplus
} ; 
#endif

int main(void){
	std::printf("Calling assembly"); 
	asmfunc(); 
	printf("returened from call") ; 
	return 0 ; 
}
