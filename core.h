#pragma once
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#define EMP_RESULT (result){0,0}
typedef struct result{
    bool m;
    size_t l;//up to and until l
}result;
result matchchar(char a,const char b){
    if (tolower(a)==tolower(b)){
        return (result){1,1};
    }
    return (result){0,0};
}
result matchrange(char c,char f,char l){
    if ((c>=f&&c<l))
        return (result){true,1};
    return (result){0,0};
}
result matcharr(char a,const char*s){
    if (s==NULL||strlen(s)==0)
        return EMP_RESULT;
    for (size_t i=0;i<strlen(s);i++)
        if (matchchar(a,s[i]))
            return (result){1,1};
    return EMP_RESULT;
}
result ALPHA(char c){
    if ((c>='A'&&c<'Z')||(c>='a'&&c<'z'))
        return (result){true,1};
    return (result){0,0};
}
result DIGIT(char c){
    return matchrange(c,'1','9');
}
/*result HEXDIG(char c){
    return (result){0,0};
}
*/
