begin "gamedata/ddl/generated/fileshare_meta.ddl";
version 1;
metatable "hash_adde02e1126350";

struct root {
    char name[32];
    int32 timestamp;
    uint64 originalfileid;
    int32 duration;
    char description[64];
    char authorname[16];
    uint64 authorxuid;
    bit ismodifiedname;
    bit ismodifieddescription;
    bit ispooled;
    padbit __pad[5];
};


