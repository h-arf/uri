#include "core.h"
#include "uri.h"
#define SC(x) sizeof(char)*x
const char*scheme_sep=":";
scheme_t scheme(char* t){
    if (t==NULL||strlen(t)<1){
        return NULL;
    }
    result temp;
    if (!(temp=ALPHA(t[0])).m){
        return NULL;
    }
    size_t n=strlen(t);
    for (size_t i=0;i<n;i++){
        if (matcharr(t[i],scheme_sep).m&&i>0)
            return strncpy(malloc(SC(i)),t,i);
        if (!(ALPHA(t[i]).m||DIGIT(t[i]).m||matcharr(t[i],"+-.").m))
            return NULL;
    }
    return strncpy(malloc(SC(n)),t,n);;
}
result validscheme(char* t){
    scheme_t s=scheme(t);
    if (t==NULL){
        return EMP_RESULT;
    }
    return (result){1,strlen(t)};
}
void freescheme(scheme_t t){
    free(t);
}
result pct_encoded(char*s){//a rule rules have sig (result)name(char*)
    if (s==NULL||strlen(s)<3){
nf:
        return EMP_RESULT;
    }
    if (!(matchchar(s[0],'%').m&&HEXDIG(s[1]).m&&HEXDIG(s[2]).m))
        goto nf;
    return (result){1,3};
}
//rules needed for userinfo
result sub_delims(char*s){
    if (s==NULL||strlen(s)<1){
nf:
        return EMP_RESULT;
    }
    if (!(matcharr(*s,'!$&`()*+,;=').m))
        goto nf;
    return (result){1,1};
}
result unreserved(char*s){
    if (s==NULL||strlen(s)<1){
nf:
        return EMP_RESULT;
    }
    if (!(matcharr(*s,'-.~_').m||DIGIT(*s).m||ALPHA(*s).m))
        goto nf;
    return (result){1,1};
}
const char*userinfo_sep="@";
userinfo_t userinfo(char* t){
    if (t==NULL||strlen(t)<2){
        return NULL;
    }
    result temp;
    if (!(temp=ALPHA(t[0])).m){
        return NULL;
    }
    size_t n=strlen(t);
    for (size_t i=0;i<n;i++){
        if (matcharr(t[i],userinfo_sep).m&&i>1)
            return strncpy(malloc(SC(i)),t,i);
        if (!(sub_delims(t[i]).m||unreserved(t[i]).m||(t[i],userinfo_sep).m))
            return NULL;
    }
    return strncpy(malloc(SC(n)),t,n);;
}
result validuserinfo(char* t){
    userinfo_t s=userinfo(t);
    if (t==NULL){
        return EMP_RESULT;
    }
    return (result){1,strlen(t)};
}
void freeuserinfo(userinfo_t t){
    free(t);
}