#include"../include/liba.h"
#include"../include/libb.h"
#include<stdio.h>
#include<stdlib.h>
#include<assert.h>

int main(){
    char* string;
    string=(char*)malloc(sizeof(char)*1000);
    sprintf(string,"Hello World");
    a_print(string);
    b_print(string);

    return 0;
}