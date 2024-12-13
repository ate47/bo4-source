// gamedata/ddl/generated/leaderboards_player_list.ddl
// metatable "hash_ea22a4ef571b6e07"

version 2 {
    // idx 1 members 1 size 0x40
    struct player {
        // offset 0x0, size 0x40
        uint64 xuid;
    };

    // idx 0 members 7 size 0x6418
    // offset 0x0, size 0x8
    uint:8 count;
    // offset 0x8, size 0x3200
    player playerslist[200];
    // offset 0x3208, size 0x8
    uint:8 hash_b941cba3c015f7b;
    // offset 0x3210, size 0x3200
    player hash_143b64839d071be4[200];
    // offset 0x6410, size 0x1
    bool hash_710508e409e21d7a;
    // offset 0x6411, size 0x1
    bool hash_60bfa70a97ce6004;
    // offset 0x6412, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/leaderboards_player_list.ddl
// metatable "hash_f2ed4030b20e7b2b"

version 1 {
    // idx 1 members 1 size 0x40
    struct player {
        // offset 0x0, size 0x40
        uint64 xuid;
    };

    // idx 0 members 2 size 0x3208
    // offset 0x0, size 0x8
    uint:8 count;
    // offset 0x8, size 0x3200
    player playerslist[200];
}

