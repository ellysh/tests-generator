GLOBAL_VARIABLE=''

LOCAL_VARIABLE='const char* str = "test";\nchar* buf;'

OBJECT_ALLOCATION='buf = (char*)malloc(5);'

OBJECT_ACCESS='memcpy(buf, str, strlen(str));\nbuf = buf + 5;'

OBJECT_FREE='free(buf);'
