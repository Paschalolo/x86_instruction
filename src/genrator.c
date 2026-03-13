#include <stdio.h>
#include <stdlib.h>



int main(){
	FILE* fd = fopen("boy.asm","w"); 
	fprintf(fd , "SECTION .data\n\tNOTE db %d , %d , %d , %d , %d ", 100, 200, 300 , 400 , 500);
	for(int i = 0 ; i < 100 ; ++i){
		fprintf(fd , "\t\tdb %d , %d , %d , %d , %d \n", i*12, i *87, i*77, i*35, i*900);
	}
	fclose(fd); 
}
