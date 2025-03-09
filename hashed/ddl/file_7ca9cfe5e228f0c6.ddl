// hash_7ca9cfe5e228f0c6
// metatable "hash_4a7e1214b0bfb9e9"

version 9 {
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

    // idx 0 members 5
    enum hash_54196e9e9860f0be {
        pc, // 0x0,
        neo, // 0x1,
        xb1, // 0x2,
        scorpio, // 0x3,
        ps4, // 0x4
    };

    // idx 0 members 110 size 0x5300
    // offset 0x0, size 0xc0
    string(24) map;
    // offset 0xc0, size 0xc0
    string(24) back;
    // offset 0x180, size 0xc0
    string(24) frag;
    // offset 0x240, size 0xc0
    string(24) left;
    // offset 0x300, size 0xc0
    string(24) talk;
    // offset 0x3c0, size 0xc0
    string(24) chatmodeparty;
    // offset 0x480, size 0xc0
    string(24) raisestance;
    // offset 0x540, size 0xc0
    string(24) handbrake;
    // offset 0x600, size 0xc0
    string(24) calloutwheel;
    // offset 0x6c0, size 0xc0
    string(24) melee;
    // offset 0x780, size 0xc0
    string(24) prone;
    // offset 0x840, size 0xc0
    string(24) right;
    // offset 0x900, size 0xc0
    string(24) slide;
    // offset 0x9c0, size 0xc0
    string(24) smoke;
    // offset 0xa80, size 0xc0
    string(24) goprone;
    // offset 0xb40, size 0xc0
    string(24) gostand;
    // offset 0xc00, size 0xc0
    string(24) vehiclehorn;
    // offset 0xcc0, size 0xc0
    string(24) chatmodelast;
    // offset 0xd80, size 0xc0
    string(24) chatmodeteam;
    // offset 0xe40, size 0xc0
    string(24) hash_54c88672dfdcc78a;
    // offset 0xf00, size 0xc0
    string(24) hash_6a928eea40351a0f;
    // offset 0xfc0, size 0xc0
    string(24) chatmodepublic;
    // offset 0x1080, size 0xc0
    string(24) quickconsume1;
    // offset 0x1140, size 0xc0
    string(24) quickconsume2;
    // offset 0x1200, size 0x1f8
    telemetry_header telemetry;
    // offset 0x13f8, size 0x8
    int:8 hash_188c9f291eebf570;
    // offset 0x1400, size 0xc0
    string(24) togglescoreswz;
    // offset 0x14c0, size 0xc0
    string(24) togglescoreszm;
    // offset 0x1580, size 0xc0
    string(24) togglemap;
    // offset 0x1640, size 0xc0
    string(24) moveright;
    // offset 0x1700, size 0xc0
    string(24) centerview;
    // offset 0x17c0, size 0xc0
    string(24) quickcycle_health;
    // offset 0x1880, size 0xc0
    string(24) weapswitchprimary;
    // offset 0x1940, size 0xc0
    string(24) raisestancejump;
    // offset 0x1a00, size 0xc0
    string(24) togglebreath;
    // offset 0x1ac0, size 0xc0
    string(24) vehicleattack;
    // offset 0x1b80, size 0xc0
    string(24) togglecrouch;
    // offset 0x1c40, size 0xc0
    string(24) quickspray;
    // offset 0x1d00, size 0xc0
    string(24) gocrouch;
    // offset 0x1dc0, size 0xc0
    string(24) toggleinventory;
    // offset 0x1e80, size 0xc0
    string(24) hash_127574968f6ab5b;
    // offset 0x1f40, size 0xc0
    string(24) togglescores;
    // offset 0x2000, size 0xc0
    string(24) flourish;
    // offset 0x20c0, size 0xc0
    string(24) ui_contextual_1;
    // offset 0x2180, size 0xc0
    string(24) ui_contextual_2;
    // offset 0x2240, size 0xc0
    string(24) ui_contextual_3;
    // offset 0x2300, size 0xc0
    string(24) lookdown;
    // offset 0x23c0, size 0xc0
    string(24) quickcallout;
    // offset 0x2480, size 0xc0
    string(24) vehicleboost;
    // offset 0x2540, size 0xc0
    string(24) scorestreak1;
    // offset 0x2600, size 0xc0
    string(24) scorestreak2;
    // offset 0x26c0, size 0xc0
    string(24) scorestreak3;
    // offset 0x2780, size 0xc0
    string(24) scorestreak4;
    // offset 0x2840, size 0xc0
    string(24) inventory;
    // offset 0x2900, size 0xc0
    string(24) hash_78aca37c35c46b25;
    // offset 0x29c0, size 0xc0
    string(24) hash_78aca07c35c4660c;
    // offset 0x2a80, size 0xc0
    string(24) hash_78aca17c35c467bf;
    // offset 0x2b40, size 0xc0
    string(24) hash_78ac9e7c35c462a6;
    // offset 0x2c00, size 0xc0
    string(24) hash_78ac9f7c35c46459;
    // offset 0x2cc0, size 0xc0
    string(24) chooseclass_10;
    // offset 0x2d80, size 0xc0
    string(24) chooseclass_11;
    // offset 0x2e40, size 0xc0
    string(24) chooseclass_12;
    // offset 0x2f00, size 0xc0
    string(24) speed_throw;
    // offset 0x2fc0, size 0xc0
    string(24) activate;
    // offset 0x3080, size 0xc0
    string(24) hash_38860be8fb273455;
    // offset 0x3140, size 0xc0
    string(24) chooseclass_1;
    // offset 0x3200, size 0xc0
    string(24) chooseclass_2;
    // offset 0x32c0, size 0xc0
    string(24) chooseclass_3;
    // offset 0x3380, size 0xc0
    string(24) chooseclass_4;
    // offset 0x3440, size 0xc0
    string(24) chooseclass_5;
    // offset 0x3500, size 0xc0
    string(24) chooseclass_6;
    // offset 0x35c0, size 0xc0
    string(24) chooseclass_7;
    // offset 0x3680, size 0xc0
    string(24) chooseclass_8;
    // offset 0x3740, size 0xc0
    string(24) chooseclass_9;
    // offset 0x3800, size 0xc0
    string(24) attack;
    // offset 0x38c0, size 0xc0
    client_header client;
    // offset 0x3980, size 0xc0
    string(24) hash_4fca6732aca41b2e;
    // offset 0x3a40, size 0xc0
    string(24) holdbreath;
    // offset 0x3b00, size 0xc0
    string(24) weapswitchsecondary;
    // offset 0x3bc0, size 0xc0
    string(24) armorrepair;
    // offset 0x3c80, size 0xc0
    string(24) lookup;
    // offset 0x3d40, size 0xc0
    string(24) hash_5d0b479ede0393d4;
    // offset 0x3e00, size 0xc0
    string(24) mantle;
    // offset 0x3ec0, size 0xc0
    string(24) pickup;
    // offset 0x3f80, size 0xc0
    string(24) scores;
    // offset 0x4040, size 0xc0
    string(24) sprint;
    // offset 0x4100, size 0xc0
    string(24) stance;
    // offset 0x41c0, size 0xc0
    string(24) weapnext;
    // offset 0x4280, size 0xc0
    string(24) weapprev;
    // offset 0x4340, size 0xc0
    string(24) forward;
    // offset 0x4400, size 0xc0
    string(24) breath_sprint;
    // offset 0x44c0, size 0xc0
    string(24) autorun;
    // offset 0x4580, size 0xc0
    string(24) toggleprone;
    // offset 0x4640, size 0xc0
    string(24) weapoffhandspecial;
    // offset 0x4700, size 0xc0
    string(24) scoreswz;
    // offset 0x47c0, size 0xc0
    string(24) scoreszm;
    // offset 0x4880, size 0xc0
    string(24) inventoryzm;
    // offset 0x4940, size 0xc0
    string(24) melee_zoom;
    // offset 0x4a00, size 0xc0
    string(24) switchseat;
    // offset 0x4ac0, size 0xc0
    string(24) toggleinventoryzm;
    // offset 0x4b80, size 0xc0
    string(24) vehiclealtcontrol;
    // offset 0x4c40, size 0xc0
    string(24) hold_sprint;
    // offset 0x4d00, size 0xc0
    string(24) usebgb1;
    // offset 0x4dc0, size 0xc0
    string(24) usebgb2;
    // offset 0x4e80, size 0xc0
    string(24) usebgb3;
    // offset 0x4f40, size 0xc0
    string(24) usebgb4;
    // offset 0x5000, size 0xc0
    string(24) quickcycle_equipment;
    // offset 0x50c0, size 0xc0
    string(24) movedown;
    // offset 0x5180, size 0xc0
    string(24) moveleft;
    // offset 0x5240, size 0xc0
    string(24) lowerstance;
}

