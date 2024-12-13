// gamedata/ddl/generated/fileshare_meta.ddl
// metatable "hash_adde02e1126350"

version 1 {
    // idx 0 members 11 size 0x448
    // offset 0x0, size 0x100
    string(32) name;
    // offset 0x100, size 0x20
    int timestamp;
    // offset 0x120, size 0x40
    uint64 originalfileid;
    // offset 0x160, size 0x20
    int duration;
    // offset 0x180, size 0x200
    string(64) description;
    // offset 0x380, size 0x80
    string(16) authorname;
    // offset 0x400, size 0x40
    uint64 authorxuid;
    // offset 0x440, size 0x1
    bool ismodifiedname;
    // offset 0x441, size 0x1
    bool ismodifieddescription;
    // offset 0x442, size 0x1
    bool ispooled;
    // offset 0x443, size 0x5
    uint:1 __pad[5];
}

