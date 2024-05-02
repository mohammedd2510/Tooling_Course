#include "preprocessor.h"

static int var2 =10;

int var3 =0;

int var4 =10;

extern int var ;

int main()
{
    var =2;
    int x = add(m,n);
    return 0 ;
}

int add (int a , int b){
    return a + b ;
}
