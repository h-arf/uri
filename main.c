#include <stdio.h>
#include "uri.h"
#define type_t scheme_t
#define func_1(x) scheme(x)
int main(){
    char line[100];
    type_t t;
    while (1){
        scanf("%s",line);
        t=func_1(line);
        if (t==NULL){
            printf("%s is invalid",line);
        }
        fflush(stdin);
    }
}