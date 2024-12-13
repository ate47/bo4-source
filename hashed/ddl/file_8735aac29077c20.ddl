// hash_8735aac29077c20
// metatable "hash_80c8b820f23df8a1"

version 10 {
    // idx 1 members 8 size 0x1f8
    struct telemetry_header {
        // offset 0x0, size 0x20
        int changelist_number;
        // offset 0x20, size 0x10
        uint:16 source_version;
        // offset 0x30, size 0x40
        xhash action_type;
        // offset 0x70, size 0x8
        hash_54196e9e9860f0be platform;
        // offset 0x78, size 0x100
        string(32) build_version;
        // offset 0x178, size 0x20
        uint title_id;
        // offset 0x198, size 0x20
        uint hash_56a1b6d783aa7a25;
        // offset 0x1b8, size 0x40
        uint64 hash_f2ad74d8edb8204;
    };

    // idx 2 members 3 size 0xc0
    struct client_header {
        // offset 0x0, size 0x40
        uint64 hash_4016bed15f9183f7;
        // offset 0x40, size 0x40
        uint64 uno_id;
        // offset 0x80, size 0x40
        uint64 user_id;
    };

    // idx 3 members 3 size 0xc0
    struct match_header {
        // offset 0x0, size 0x40
        uint64 match_id;
        // offset 0x40, size 0x40
        uint64 hash_c05315ddb26eb93;
        // offset 0x80, size 0x40
        uint64 lobby_id;
    };

    // idx 4 members 53 size 0x2560
    struct hash_3b1f2a75446de239 {
        // offset 0x0, size 0x20
        int primarygrenadecount;
        // offset 0x20, size 0x40
        xhash tacticalgear;
        // offset 0x60, size 0x200
        string(64) primarygrenade;
        // offset 0x260, size 0x40
        xhash killstreak1;
        // offset 0x2a0, size 0x40
        xhash killstreak2;
        // offset 0x2e0, size 0x40
        xhash killstreak3;
        // offset 0x320, size 0x40
        xhash killstreak4;
        // offset 0x360, size 0x40
        xhash secondaryattachment1;
        // offset 0x3a0, size 0x40
        xhash secondaryattachment2;
        // offset 0x3e0, size 0x40
        xhash secondaryattachment3;
        // offset 0x420, size 0x40
        xhash secondaryattachment4;
        // offset 0x460, size 0x40
        xhash secondaryattachment5;
        // offset 0x4a0, size 0x40
        xhash primaryreticle;
        // offset 0x4e0, size 0x20
        int spawnid;
        // offset 0x500, size 0x40
        xhash wildcard0;
        // offset 0x540, size 0x40
        xhash wildcard1;
        // offset 0x580, size 0x40
        xhash hash_58c97dd32ef2d7a7;
        // offset 0x5c0, size 0x200
        string(64) talisman1;
        // offset 0x7c0, size 0x20
        int gametime;
        // offset 0x7e0, size 0x20
        int specialistindex;
        // offset 0x800, size 0x40
        xhash hash_e88f8f1dc4ab5c1;
        // offset 0x840, size 0x40
        xhash talent1;
        // offset 0x880, size 0x40
        xhash talent2;
        // offset 0x8c0, size 0x40
        xhash talent3;
        // offset 0x900, size 0x40
        xhash talent4;
        // offset 0x940, size 0x40
        xhash talent5;
        // offset 0x980, size 0x40
        xhash talent6;
        // offset 0x9c0, size 0x40
        xhash hash_e88f9f1dc4ab774;
        // offset 0xa00, size 0x40
        xhash hash_e88f0f1dc4aa829;
        // offset 0xa40, size 0x40
        xhash hash_e88eff1dc4aa676;
        // offset 0xa80, size 0x200
        string(64) specialgrenade;
        // offset 0xc80, size 0x20
        int specialgrenadecount;
        // offset 0xca0, size 0x200
        string(64) specialty1;
        // offset 0xea0, size 0x200
        string(64) specialty2;
        // offset 0x10a0, size 0x200
        string(64) specialty3;
        // offset 0x12a0, size 0x200
        string(64) specialty4;
        // offset 0x14a0, size 0x200
        string(64) specialty5;
        // offset 0x16a0, size 0x200
        string(64) specialty6;
        // offset 0x18a0, size 0x200
        string(64) secondarycamo;
        // offset 0x1aa0, size 0x200
        string(64) secondaryname;
        // offset 0x1ca0, size 0x200
        string(64) primarycamo;
        // offset 0x1ea0, size 0x400
        string(128) primaryname;
        // offset 0x22a0, size 0x40
        xhash secondary;
        // offset 0x22e0, size 0x40
        xhash hash_7af4c73d11d6e762;
        // offset 0x2320, size 0x40
        xhash primary;
        // offset 0x2360, size 0x40
        xhash secondaryreticle;
        // offset 0x23a0, size 0x40
        xhash primaryattachment1;
        // offset 0x23e0, size 0x40
        xhash primaryattachment2;
        // offset 0x2420, size 0x40
        xhash primaryattachment3;
        // offset 0x2460, size 0x40
        xhash primaryattachment4;
        // offset 0x24a0, size 0x40
        xhash primaryattachment5;
        // offset 0x24e0, size 0x40
        xhash primaryattachment6;
        // offset 0x2520, size 0x40
        xhash primaryattachment7;
    };

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 4 size 0x28d8
    // offset 0x0, size 0xc0
    match_header match;
    // offset 0xc0, size 0x1f8
    telemetry_header telemetry;
    // offset 0x2b8, size 0x2560
    hash_3b1f2a75446de239 loadouts;
    // offset 0x2818, size 0xc0
    client_header client;
}

