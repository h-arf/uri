#pragma once
//uri as per RFC3986
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
typedef struct result result;
extern int uerrno;
typedef char*scheme_t;
scheme_t scheme(char*);
result validscheme(scheme_t);
void freescheme(scheme_t);//must be called
const char*scheme_sep;
