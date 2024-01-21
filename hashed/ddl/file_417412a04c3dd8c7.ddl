begin "hash_417412a04c3dd8c7";
version 1;
metatable "hash_297748d7f603e967";

struct root {
    char name[64];
    uint32 createtime;
    uint64 origfileid;
    char description[64];
    char authorname[32];
    uint64 authorxuid;
    uint32 length;
    bit ismodifiedname;
    bit ismodifieddescription;
    bit ispooled;
    padbit __pad[5];
};


