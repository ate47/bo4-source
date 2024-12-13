// gamedata/ddl/generated/message.ddl
// metatable "hash_c570ec8c012e64f8"

version 1 {
    // idx 1 members 3 size 0x60
    struct hash_5117bce61a2e0fe3 {
        // offset 0x0, size 0x20
        uint id;
        // offset 0x20, size 0x20
        uint size;
        // offset 0x40, size 0x20
        uint type;
    };

    // idx 2 members 1 size 0x2000
    struct hash_445d98a7d5d65334 {
        // offset 0x0, size 0x2000
        byte data[1024];
    };

    // idx 3 members 2 size 0x2060
    struct hash_5f41ae426bb85b16 {
        // offset 0x0, size 0x60
        hash_5117bce61a2e0fe3 header;
        // offset 0x60, size 0x2000
        hash_445d98a7d5d65334 payload;
    };

    // idx 0 members 3
    enum hash_5a1a6feae655a2fa {
        hash_47fba947fb3dd638, // 0x0,
        hash_5fe815c098116dc5, // 0x1,
        hash_6946fd6149126560, // 0x2
    };

    // idx 1 members 5
    enum hash_41ab1db9fb7f0729 {
        hash_1d09e13ab9d7f100, // 0x0,
        hash_3872ecf8e7c092e9, // 0x1,
        hash_49770c7996332df0, // 0x2,
        hash_60fcb91e792dbd14, // 0x3,
        hash_6f4dd5ca4344893a, // 0x4
    };

    // idx 0 members 1 size 0x2060
    // offset 0x0, size 0x2060
    hash_5f41ae426bb85b16 hash_4eb855cfa6004f3a;
}

