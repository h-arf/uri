#include "core.h"
#include "uri.h"
#define SC(x) sizeof(char)*x
const char*scheme_sep=":";
scheme_t scheme(char* t){
    if (t==NULL||strlen(t)<1){
        return NULL;
    }
    result r,temp;
    if (!(temp=ALPHA(t[0])).m){
        return NULL;
    }
    size_t n=strlen(t);
    for (size_t i=0;i<n;i++){
        if (matcharr(t[i],scheme_sep).m&&i>0)
            return strncpy(malloc(SC(i)),t,i-1);
    }
}
result validscheme(scheme_t t){
    return (result){0,0};
}
void freescheme(scheme_t t){
    free(t);
}