GLOBAL_VARIABLE=''

LOCAL_VARIABLE='const char* str = "test string";\nchar* buf;'

OBJECT_ALLOCATION='buf = (char*)malloc(5);'

OBJECT_FREE='free(buf);'

OBJECT_ACCESS='memcpy(buf, str, strlen(str));'

