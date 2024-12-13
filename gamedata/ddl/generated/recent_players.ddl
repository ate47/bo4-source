// gamedata/ddl/generated/recent_players.ddl
// metatable "hash_3e4c5cd1c233a103"

version 2 {
    // idx 1 members 2 size 0x60
    struct recentplayer {
        // offset 0x0, size 0x20
        int time;
        // offset 0x20, size 0x40
        uint64 xuid;
    };

    // idx 0 members 4 size 0x12d0
    // offset 0x0, size 0x8
    uint:6 count;
    // offset 0x8, size 0x12c0
    recentplayer hash_224419b9dcb9832d[50];
    // offset 0x12c8, size 0x1
    bool issorted;
    // offset 0x12c9, size 0x7
    uint:1 __pad[7];
}

