#include <stdio.h>
#include "uri.h"
#include "result.h"
//#include "core.h"
#define type_t result
#define func_1(x) pct_encoded(x)
int main(){
    char line[100];
    type_t t;
    while (1){
        printf("enter input: ");
        scanf("%s",line);
        t=func_1(line);
        if (t.m==0){
            printf("%s not matched\n",line);
            continue;
        }
        printf("result:\nm:%s\nl:%zu is valid\n",t.m?"true":"false",t.l);
        fflush(stdin);
    }
}