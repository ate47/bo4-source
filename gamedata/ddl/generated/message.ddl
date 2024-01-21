begin "gamedata/ddl/generated/message.ddl";
version 1;
metatable "hash_c570ec8c012e64f8";

struct root {
    hash_5f41ae426bb85b16 hash_4eb855cfa6004f3a;
};

struct hash_5f41ae426bb85b16 {
    hash_5117bce61a2e0fe3 header;
    hash_445d98a7d5d65334 payload;
};

struct hash_5117bce61a2e0fe3 {
    uint32 id;
    uint32 size;
    uint32 type;
};

struct hash_445d98a7d5d65334 {
    byte data[1024];
};


