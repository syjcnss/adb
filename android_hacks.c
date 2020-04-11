#include <string.h>

int property_get(const char *key, char *value, const char *default_value) {
    strcpy(value, default_value);
    return 1;
}

int __android_log_print(int prio, const char *tag,  const char *fmt, ...) {
    return 0;
}