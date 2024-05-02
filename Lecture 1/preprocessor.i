# 1 "preprocessor.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "preprocessor.c"
# 1 "preprocessor.h" 1
# 12 "preprocessor.h"
int add (int a , int b);
# 2 "preprocessor.c" 2

static int var2 =10;

int var3 =0;

int var4 =10;

extern int var ;

int main()
{
    var =2;
    int x = add(2,3);
    return 0 ;
}

int add (int a , int b){
    return a + b ;
}
