// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_f3e7081e8749fa5"

version 77 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:12 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2310
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1a40
        hash_768aeb6b928320d outfit_breadcrumbs[35];
        // offset 0x1a50, size 0x8c0
        hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:11 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x401c0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x3d5c0
        character characters[28];
        // offset 0x3d650, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x3e050, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x3e058, size 0x1860
        zmloadout customclass[10];
        // offset 0x3f8b8, size 0x500
        string(16) customclassname[10];
        // offset 0x3fdb8, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x401b8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x401b9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x401ba, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x401bb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x82388
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_51ee933f6ee8ec54 variant[60];
    // offset 0x2000, size 0x80380
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x82380, size 0x1
    bool loadoutinitialized;
    // offset 0x82381, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_d1f9aad24c3d75e6"

version 76 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:12 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2310
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1a40
        hash_768aeb6b928320d outfit_breadcrumbs[35];
        // offset 0x1a50, size 0x8c0
        hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:11 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x37580
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x34980
        character characters[24];
        // offset 0x34a10, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x35410, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x35418, size 0x1860
        zmloadout customclass[10];
        // offset 0x36c78, size 0x500
        string(16) customclassname[10];
        // offset 0x37178, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x37578, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x37579, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x3757a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x3757b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x70b08
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_51ee933f6ee8ec54 variant[60];
    // offset 0x2000, size 0x6eb00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x70b00, size 0x1
    bool loadoutinitialized;
    // offset 0x70b01, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_ffd702aa1595b826"

version 75 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:12 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:11 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x67b08
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_51ee933f6ee8ec54 variant[60];
    // offset 0x2000, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x67b00, size 0x1
    bool loadoutinitialized;
    // offset 0x67b01, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_390d2159aee0fbde"

version 74 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:12 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:11 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x675b8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x675b0, size 0x1
    bool loadoutinitialized;
    // offset 0x675b1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_faf66eed3be1701b"

version 73 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9508
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x10
        int:12 weaponindex;
        // offset 0x94e8, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x675b8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x675b0, size 0x1
    bool loadoutinitialized;
    // offset 0x675b1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_61f9608a8f308725"

version 72 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x675b8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x675b0, size 0x1
    bool loadoutinitialized;
    // offset 0x675b1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_2ec85cee291ec3b5"

version 71 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x675b8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x675b0, size 0x1
    bool loadoutinitialized;
    // offset 0x675b1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_45c5093942ce13fa"

version 70 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 3 size 0x100
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
        // offset 0xd8, size 0x28
        uint:8 hash_10b7b244c876d78a[5];
    };

    // idx 19 members 8 size 0x270
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:8 hash_4e153e9373f1683c;
        // offset 0x18, size 0x8
        uint:6 talisman1;
        // offset 0x20, size 0x30
        uint:5 specialty[6];
        // offset 0x50, size 0x100
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x150, size 0x10
        uint:10 herogadget;
        // offset 0x160, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1e8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32d80
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0xa00
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30c10, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30c18, size 0x1860
        zmloadout customclass[10];
        // offset 0x32478, size 0x500
        string(16) customclassname[10];
        // offset 0x32978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32d78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32d79, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32d7a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32d7b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x675b8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65b00
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x675b0, size 0x1
    bool loadoutinitialized;
    // offset 0x675b1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_ab99a9d85d292e71"

version 69 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:8 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x240
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1b8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32a10
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30a80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30a88, size 0x1680
        zmloadout customclass[10];
        // offset 0x32108, size 0x500
        string(16) customclassname[10];
        // offset 0x32608, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32a08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32a09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32a0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32a0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x66ed8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65420
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x66ed0, size 0x1
    bool loadoutinitialized;
    // offset 0x66ed1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_6f79639eee341c3e"

version 68 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x2010
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x1810, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:6 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:6 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x240
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1b8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x32a10
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x30180
        character characters[24];
        // offset 0x30210, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x30a80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x30a88, size 0x1680
        zmloadout customclass[10];
        // offset 0x32108, size 0x500
        string(16) customclassname[10];
        // offset 0x32608, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x32a08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x32a09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x32a0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x32a0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x66ed8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x65420
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x66ed0, size 0x1
    bool loadoutinitialized;
    // offset 0x66ed1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_dbaa6215dfba76e8"

version 67 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1810
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x1200
        hash_768aeb6b928320d outfit_breadcrumbs[24];
        // offset 0x1210, size 0x600
        hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:6 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x240
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1b8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x26a10
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x24180
        character characters[24];
        // offset 0x24210, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x24a80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x24a88, size 0x1680
        zmloadout customclass[10];
        // offset 0x26108, size 0x500
        string(16) customclassname[10];
        // offset 0x26608, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x26a08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x26a09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x26a0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x26a0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x4eed8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x4d420
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x4eed0, size 0x1
    bool loadoutinitialized;
    // offset 0x4eed1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_229758625b6aee91"

version 66 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 5 size 0x1840
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x1200
        hash_768aeb6b928320d outfit_breadcrumbs[24];
        // offset 0x1240, size 0x600
        hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:6 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x240
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1b8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x26e90
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x24600
        character characters[24];
        // offset 0x24690, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x24f00, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x24f08, size 0x1680
        zmloadout customclass[10];
        // offset 0x26588, size 0x500
        string(16) customclassname[10];
        // offset 0x26a88, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x26e88, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x26e89, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x26e8a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x26e8b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x4f7d8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x4dd20
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x4f7d0, size 0x1
    bool loadoutinitialized;
    // offset 0x4f7d1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_d2e0d833db294c07"

version 65 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 6 size 0x18d0
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xd0, size 0x1200
        hash_768aeb6b928320d outfit_breadcrumbs[24];
        // offset 0x12d0, size 0x600
        hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 8 size 0x88
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x10
        uint:10 charmindex;
        // offset 0x18, size 0x8
        uint:8 paintjobslot;
        // offset 0x20, size 0x10
        uint:10 itemindex;
        // offset 0x30, size 0x38
        int:8 attachment[7];
        // offset 0x68, size 0x8
        uint:6 reticleindex;
        // offset 0x70, size 0x8
        uint:7 deathfxindex;
        // offset 0x78, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x240
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x88
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1b8, size 0x88
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x27c10
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x25380
        character characters[24];
        // offset 0x25410, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x25c80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x25c88, size 0x1680
        zmloadout customclass[10];
        // offset 0x27308, size 0x500
        string(16) customclassname[10];
        // offset 0x27808, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x27c08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27c09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x27c0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x27c0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x512d8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1ab0, size 0x4f820
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x512d0, size 0x1
    bool loadoutinitialized;
    // offset 0x512d1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_2fc0f9d8274a871c"

version 64 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x158
    struct variant {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x20
        uint createtime;
        // offset 0x28, size 0x8
        int:8 paintjobslot;
        // offset 0x30, size 0x10
        int:11 variantindex;
        // offset 0x40, size 0x40
        int:8 attachment[8];
        // offset 0x80, size 0x80
        string(16) variantname;
        // offset 0x100, size 0x8
        int:2 readonly;
        // offset 0x108, size 0x10
        int:11 reticleindex;
        // offset 0x118, size 0x10
        int:11 weaponindex;
        // offset 0x128, size 0x10
        uint:9 camoindex;
        // offset 0x138, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 6 size 0x18d0
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xd0, size 0x1200
        hash_768aeb6b928320d outfit_breadcrumbs[24];
        // offset 0x12d0, size 0x600
        hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x27a30
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x25380
        character characters[24];
        // offset 0x25410, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x25c80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x25c88, size 0x14a0
        zmloadout customclass[10];
        // offset 0x27128, size 0x500
        string(16) customclassname[10];
        // offset 0x27628, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x27a28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27a29, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x27a2a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x27a2b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x50a68
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x4f460
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x50a60, size 0x1
    bool loadoutinitialized;
    // offset 0x50a61, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_948c05f3849911f9"

version 63 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 6 size 0x18d0
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xd0, size 0x1200
        hash_768aeb6b928320d outfit_breadcrumbs[24];
        // offset 0x12d0, size 0x600
        hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x27a30
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x25380
        character characters[24];
        // offset 0x25410, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x25c80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x25c88, size 0x14a0
        zmloadout customclass[10];
        // offset 0x27128, size 0x500
        string(16) customclassname[10];
        // offset 0x27628, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x27a28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27a29, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x27a2a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x27a2b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x50a68
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x4f460
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x50a60, size 0x1
    bool loadoutinitialized;
    // offset 0x50a61, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_7bf9a7aa0d21f73b"

version 62 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 6 size 0x10d0
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xd0, size 0xc00
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0xcd0, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x1ba30
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x19380
        character characters[24];
        // offset 0x19410, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19c80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19c88, size 0x14a0
        zmloadout customclass[10];
        // offset 0x1b128, size 0x500
        string(16) customclassname[10];
        // offset 0x1b628, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x1ba28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1ba29, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1ba2a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1ba2b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x38a68
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x37460
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x38a60, size 0x1
    bool loadoutinitialized;
    // offset 0x38a61, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_43dd586dc30a6d3b"

version 61 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x100
    struct hash_729f42618cb8bf17 {
        // offset 0x0, size 0x100
        bool hash_28fca43539ff7944[256];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 6 size 0x10d0
    struct character {
        // offset 0x0, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x30, size 0x8
        uint:5 selectedoutfit;
        // offset 0x38, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x40, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xd0, size 0xc00
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0xcd0, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 15 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 16 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 17 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 14 size 0x1ba30
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x19380
        character characters[24];
        // offset 0x19410, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19c80, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19c88, size 0x14a0
        zmloadout customclass[10];
        // offset 0x1b128, size 0x500
        string(16) customclassname[10];
        // offset 0x1b628, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x1ba28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1ba29, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1ba2a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1ba2b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 3
    enum hash_6eb19cb9fcf5e143 {
        wingsuit, // 0x0,
        parachute, // 0x1,
        trail, // 0x2
    };

    // idx 3 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x38a68
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x37460
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x38a60, size 0x1
    bool loadoutinitialized;
    // offset 0x38a61, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_1faab6b939f191db"

version 60 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x10a0
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xa0, size 0xc00
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0xca0, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 14 size 0x1b5b0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18f00
        character characters[24];
        // offset 0x18f90, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19800, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19808, size 0x14a0
        zmloadout customclass[10];
        // offset 0x1aca8, size 0x500
        string(16) customclassname[10];
        // offset 0x1b1a8, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x1b5a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1b5a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1b5aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1b5ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x38168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x36b60
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x38160, size 0x1
    bool loadoutinitialized;
    // offset 0x38161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_d28b3f254f7d92d1"

version 59 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x10a0
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xa0, size 0xc00
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0xca0, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x70
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x10
        uint:9 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x210
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x70
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x1a0, size 0x70
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 14 size 0x1b5b0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18f00
        character characters[24];
        // offset 0x18f90, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19800, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19808, size 0x14a0
        zmloadout customclass[10];
        // offset 0x1aca8, size 0x500
        string(16) customclassname[10];
        // offset 0x1b1a8, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x1b5a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1b5a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1b5aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1b5ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x38168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x15e0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1600, size 0x36b60
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x38160, size 0x1
    bool loadoutinitialized;
    // offset 0x38161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_a2a49251bc20ec12"

version 58 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 2 size 0xc0
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
        // offset 0x80, size 0x40
        bool hash_63930aafa5d6ac7b[64];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x10a0
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xa0, size 0xc00
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0xca0, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 6 size 0x60
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x8
        uint:5 warpaintoutfitindex;
        // offset 0x58, size 0x1
        bool locked;
        // offset 0x59, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x200
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x198, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 14 size 0x1b510
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18f00
        character characters[24];
        // offset 0x18f90, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19800, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19808, size 0x1400
        zmloadout customclass[10];
        // offset 0x1ac08, size 0x500
        string(16) customclassname[10];
        // offset 0x1b108, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x1b508, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1b509, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1b50a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1b50b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x37e98
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x36a20
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x37e90, size 0x1
    bool loadoutinitialized;
    // offset 0x37e91, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_83cc538da1801c1b"

version 57 {
    // idx 1 members 28 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:12 posx;
        // offset 0x30, size 0x10
        uint:12 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:10 scalex;
        // offset 0xc8, size 0x10
        uint:10 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool mask;
        // offset 0xfa, size 0x1
        bool blend;
        // offset 0xfb, size 0x1
        bool outline;
        // offset 0xfc, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 28 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:12 posx;
        // offset 0x20, size 0x10
        uint:12 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:10 scalex;
        // offset 0xb0, size 0x10
        uint:10 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool mask;
        // offset 0xe2, size 0x1
        bool blend;
        // offset 0xe3, size 0x1
        bool groupedlook;
        // offset 0xe4, size 0x1
        bool outline;
        // offset 0xe5, size 0x1
        bool isgrouped;
        // offset 0xe6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 4 size 0xc98
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 5 size 0x58
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x1
        bool locked;
        // offset 0x51, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x200
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x198, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 14 size 0x15450
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x12e40
        character characters[24];
        // offset 0x12ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x13740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x13748, size 0x1400
        zmloadout customclass[10];
        // offset 0x14b48, size 0x500
        string(16) customclassname[10];
        // offset 0x15048, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x15448, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x15449, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1544a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1544b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2bd18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x2a8a0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2bd10, size 0x1
    bool loadoutinitialized;
    // offset 0x2bd11, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_243d3d792b3b96d7"

version 56 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 4 size 0xc98
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 5 size 0x58
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x1
        bool locked;
        // offset 0x51, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x200
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x198, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 14 size 0x15450
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x12e40
        character characters[24];
        // offset 0x12ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x13740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x13748, size 0x1400
        zmloadout customclass[10];
        // offset 0x14b48, size 0x500
        string(16) customclassname[10];
        // offset 0x15048, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x15448, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x15449, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1544a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1544b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2bd18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x2a8a0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2bd10, size 0x1
    bool loadoutinitialized;
    // offset 0x2bd11, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_4884aca608d50403"

version 55 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:10 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:4 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 5 size 0x58
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x1
        bool locked;
        // offset 0x51, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x200
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x198, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1b050
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0x1400
        zmloadout customclass[10];
        // offset 0x1ab48, size 0x500
        string(16) customclassname[10];
        // offset 0x1b048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1b049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1b04a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1b04b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x37518
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x360a0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x37510, size 0x1
    bool loadoutinitialized;
    // offset 0x37511, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_11a6929019eafbb2"

version 54 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 5 size 0x58
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x1
        bool locked;
        // offset 0x51, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 7 size 0x200
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0xd8
        hash_5fe8e8cb2b27ba05 elixirs;
        // offset 0x120, size 0x10
        uint:10 herogadget;
        // offset 0x130, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0x198, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1b050
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0x1400
        zmloadout customclass[10];
        // offset 0x1ab48, size 0x500
        string(16) customclassname[10];
        // offset 0x1b048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1b049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1b04a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1b04b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x37518
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x360a0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x37510, size 0x1
    bool loadoutinitialized;
    // offset 0x37511, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_600a915470cb45b"

version 53 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 5 size 0x58
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
        // offset 0x50, size 0x1
        bool locked;
        // offset 0x51, size 0x7
        uint:1 __pad[7];
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x128
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xc0, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a7e0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xb90
        zmloadout customclass[10];
        // offset 0x1a2d8, size 0x500
        string(16) customclassname[10];
        // offset 0x1a7d8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a7d9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a7da, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a7db, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36438
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x34fc0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36430, size 0x1
    bool loadoutinitialized;
    // offset 0x36431, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_c7ca04e196a5216c"

version 52 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:8 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x128
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xc0, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a7e0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xb90
        zmloadout customclass[10];
        // offset 0x1a2d8, size 0x500
        string(16) customclassname[10];
        // offset 0x1a7d8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a7d9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a7da, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a7db, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36438
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x34fc0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36430, size 0x1
    bool loadoutinitialized;
    // offset 0x36431, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_c025cfca6f476881"

version 51 {
    // idx 1 members 27 size 0x100
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xf8, size 0x1
        bool flip;
        // offset 0xf9, size 0x1
        bool blend;
        // offset 0xfa, size 0x1
        bool outline;
        // offset 0xfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 27 size 0xe8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x8
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xe0, size 0x1
        bool flip;
        // offset 0xe1, size 0x1
        bool blend;
        // offset 0xe2, size 0x1
        bool groupedlook;
        // offset 0xe3, size 0x1
        bool outline;
        // offset 0xe4, size 0x1
        bool isgrouped;
        // offset 0xe5, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x49f8
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0x9f8
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x40e8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x4000
        emblemlayer layer[64];
        // offset 0x4000, size 0xe8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4a08
    struct emblem {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
        // offset 0x49f8, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x49f8
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x49f8
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x93f0
    struct paintshop {
        // offset 0x0, size 0x93f0
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9500
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x93f0
        paintshop paintjob;
        // offset 0x9430, size 0x20
        uint createtime;
        // offset 0x9450, size 0x80
        string(16) paintjobname;
        // offset 0x94d0, size 0x8
        int:2 readonly;
        // offset 0x94d8, size 0x8
        byte weaponindex;
        // offset 0x94e0, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x128
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xc0, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a7e0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xb90
        zmloadout customclass[10];
        // offset 0x1a2d8, size 0x500
        string(16) customclassname[10];
        // offset 0x1a7d8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a7d9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a7da, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a7db, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36438
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x34fc0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36430, size 0x1
    bool loadoutinitialized;
    // offset 0x36431, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_db68bec28f164271"

version 50 {
    // idx 1 members 26 size 0xf8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x1
        bool flip;
        // offset 0xf1, size 0x1
        bool blend;
        // offset 0xf2, size 0x1
        bool outline;
        // offset 0xf3, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 26 size 0xe0
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x1
        bool flip;
        // offset 0xd9, size 0x1
        bool blend;
        // offset 0xda, size 0x1
        bool groupedlook;
        // offset 0xdb, size 0x1
        bool outline;
        // offset 0xdc, size 0x1
        bool isgrouped;
        // offset 0xdd, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x47a0
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0x9a0
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3ee0
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0xe0
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x47b0
    struct emblem {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
        // offset 0x47a0, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x47a0
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8f40
    struct paintshop {
        // offset 0x0, size 0x8f40
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9050
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8f40
        paintshop paintjob;
        // offset 0x8f80, size 0x20
        uint createtime;
        // offset 0x8fa0, size 0x80
        string(16) paintjobname;
        // offset 0x9020, size 0x8
        int:2 readonly;
        // offset 0x9028, size 0x8
        byte weaponindex;
        // offset 0x9030, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 6 size 0x68
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        uint:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x128
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xc0, size 0x68
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a7e0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xb90
        zmloadout customclass[10];
        // offset 0x1a2d8, size 0x500
        string(16) customclassname[10];
        // offset 0x1a7d8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a7d9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a7da, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a7db, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36438
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1450
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x1470, size 0x34fc0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36430, size 0x1
    bool loadoutinitialized;
    // offset 0x36431, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_44aaa822ac9bade2"

version 49 {
    // idx 1 members 26 size 0xf8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x1
        bool flip;
        // offset 0xf1, size 0x1
        bool blend;
        // offset 0xf2, size 0x1
        bool outline;
        // offset 0xf3, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 26 size 0xe0
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x1
        bool flip;
        // offset 0xd9, size 0x1
        bool blend;
        // offset 0xda, size 0x1
        bool groupedlook;
        // offset 0xdb, size 0x1
        bool outline;
        // offset 0xdc, size 0x1
        bool isgrouped;
        // offset 0xdd, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x47a0
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0x9a0
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3ee0
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0xe0
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x47b0
    struct emblem {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
        // offset 0x47a0, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x47a0
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8f40
    struct paintshop {
        // offset 0x0, size 0x8f40
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9050
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8f40
        paintshop paintjob;
        // offset 0x8f80, size 0x20
        uint createtime;
        // offset 0x8fa0, size 0x80
        string(16) paintjobname;
        // offset 0x9020, size 0x8
        int:2 readonly;
        // offset 0x9028, size 0x8
        byte weaponindex;
        // offset 0x9030, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        uint:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a740
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a238, size 0x500
        string(16) customclassname[10];
        // offset 0x1a738, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a739, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a73a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a73b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34e80
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36160, size 0x1
    bool loadoutinitialized;
    // offset 0x36161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_5f646557525bc6b4"

version 48 {
    // idx 1 members 26 size 0xf8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:2 gradienttype;
        // offset 0x80, size 0x8
        uint:6 groupindex;
        // offset 0x88, size 0x10
        uint:9 gradientangle;
        // offset 0x98, size 0x8
        uint:8 alpha1;
        // offset 0xa0, size 0x8
        uint:8 green1;
        // offset 0xa8, size 0x10
        uint:9 materialangle;
        // offset 0xb8, size 0x10
        uint:11 scalex;
        // offset 0xc8, size 0x10
        uint:11 scaley;
        // offset 0xd8, size 0x8
        uint:8 materialscalex;
        // offset 0xe0, size 0x8
        uint:8 materialscaley;
        // offset 0xe8, size 0x8
        uint:7 materialid;
        // offset 0xf0, size 0x1
        bool flip;
        // offset 0xf1, size 0x1
        bool blend;
        // offset 0xf2, size 0x1
        bool outline;
        // offset 0xf3, size 0x5
        uint:1 __pad[5];
    };

    // idx 2 members 26 size 0xe0
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x8
        uint:2 gradienttype;
        // offset 0x70, size 0x10
        uint:9 gradientangle;
        // offset 0x80, size 0x8
        uint:8 alpha1;
        // offset 0x88, size 0x8
        uint:8 green1;
        // offset 0x90, size 0x10
        uint:9 materialangle;
        // offset 0xa0, size 0x10
        uint:11 scalex;
        // offset 0xb0, size 0x10
        uint:11 scaley;
        // offset 0xc0, size 0x8
        uint:8 materialscalex;
        // offset 0xc8, size 0x8
        uint:8 materialscaley;
        // offset 0xd0, size 0x8
        uint:7 materialid;
        // offset 0xd8, size 0x1
        bool flip;
        // offset 0xd9, size 0x1
        bool blend;
        // offset 0xda, size 0x1
        bool groupedlook;
        // offset 0xdb, size 0x1
        bool outline;
        // offset 0xdc, size 0x1
        bool isgrouped;
        // offset 0xdd, size 0x3
        uint:1 __pad[3];
    };

    // idx 3 members 2 size 0x47a0
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0x9a0
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3ee0
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3e00
        emblemlayer layer[64];
        // offset 0x3e00, size 0xe0
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x47b0
    struct emblem {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
        // offset 0x47a0, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x47a0
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x47a0
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8f40
    struct paintshop {
        // offset 0x0, size 0x8f40
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x9050
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8f40
        paintshop paintjob;
        // offset 0x8f80, size 0x20
        uint createtime;
        // offset 0x8fa0, size 0x80
        string(16) paintjobname;
        // offset 0x9020, size 0x8
        int:2 readonly;
        // offset 0x9028, size 0x8
        byte weaponindex;
        // offset 0x9030, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a740
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a238, size 0x500
        string(16) customclassname[10];
        // offset 0x1a738, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a739, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a73a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a73b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34e80
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36160, size 0x1
    bool loadoutinitialized;
    // offset 0x36161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_f8e1288a7cae6b34"

version 47 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x8ba0
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8a90
        paintshop paintjob;
        // offset 0x8ad0, size 0x20
        uint createtime;
        // offset 0x8af0, size 0x80
        string(16) paintjobname;
        // offset 0x8b70, size 0x8
        int:2 readonly;
        // offset 0x8b78, size 0x8
        byte weaponindex;
        // offset 0x8b80, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x10
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x10
        bool hash_3d834aee4bd18d13[16];
    };

    // idx 11 members 1 size 0x80
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x80
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:5 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1098
    struct character {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[16];
        // offset 0x898, size 0x400
        hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
        // offset 0xc98, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 15 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:5 outfitindex;
        // offset 0x8, size 0x40
        uint:5 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 16 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 18 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 19 members 13 size 0x1a740
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18e40
        character characters[24];
        // offset 0x18ed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x19740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x19748, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a238, size 0x500
        string(16) customclassname[10];
        // offset 0x1a738, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a739, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a73a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a73b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x36168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34e80
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x36160, size 0x1
    bool loadoutinitialized;
    // offset 0x36161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_4f3cec72f523bb0f"

version 46 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x8ba0
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8a90
        paintshop paintjob;
        // offset 0x8ad0, size 0x20
        uint createtime;
        // offset 0x8af0, size 0x80
        string(16) paintjobname;
        // offset 0x8b70, size 0x8
        int:2 readonly;
        // offset 0x8b78, size 0x8
        byte weaponindex;
        // offset 0x8b80, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x8
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x8
        bool hash_3d834aee4bd18d13[8];
    };

    // idx 11 members 1 size 0x40
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x40
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1498
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x898, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
        // offset 0x1098, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 1 size 0x1
    struct hash_75ef0562f1cc95c9 {
        // offset 0x0, size 0x1
        bool hash_3d834aee4bd18d13[1];
    };

    // idx 15 members 1 size 0x8
    struct hash_1b8c44968f4c52b6 {
        // offset 0x0, size 0x8
        hash_75ef0562f1cc95c9 parts[hash_5ab26f037efe82c];
    };

    // idx 16 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 17 members 4 size 0x350
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x100
        hash_1b8c44968f4c52b6 outfit_breadcrumbs[32];
        // offset 0x108, size 0x148
        variant showcaseweapon;
        // offset 0x250, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 18 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 19 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 13 size 0x20740
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x1ee40
        character characters[24];
        // offset 0x1eed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x1f740, size 0x8
        uint:8 hash_78e9cef0ed273bd;
        // offset 0x1f748, size 0xaf0
        zmloadout customclass[10];
        // offset 0x20238, size 0x500
        string(16) customclassname[10];
        // offset 0x20738, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x20739, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2073a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2073b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x42168
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x40e80
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x42160, size 0x1
    bool loadoutinitialized;
    // offset 0x42161, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_8073a36f8354422f"

version 45 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x8ba0
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8a90
        paintshop paintjob;
        // offset 0x8ad0, size 0x20
        uint createtime;
        // offset 0x8af0, size 0x80
        string(16) paintjobname;
        // offset 0x8b70, size 0x8
        int:2 readonly;
        // offset 0x8b78, size 0x8
        byte weaponindex;
        // offset 0x8b80, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x8
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x8
        bool hash_3d834aee4bd18d13[8];
    };

    // idx 11 members 1 size 0x40
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x40
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1498
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x98, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x898, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
        // offset 0x1098, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 1 size 0x1
    struct hash_75ef0562f1cc95c9 {
        // offset 0x0, size 0x1
        bool hash_3d834aee4bd18d13[1];
    };

    // idx 15 members 1 size 0x8
    struct hash_1b8c44968f4c52b6 {
        // offset 0x0, size 0x8
        hash_75ef0562f1cc95c9 parts[hash_5ab26f037efe82c];
    };

    // idx 16 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 17 members 4 size 0x350
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x100
        hash_1b8c44968f4c52b6 outfit_breadcrumbs[32];
        // offset 0x108, size 0x148
        variant showcaseweapon;
        // offset 0x250, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 18 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 19 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x20738
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x1ee40
        character characters[24];
        // offset 0x1eed0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x1f740, size 0xaf0
        zmloadout customclass[10];
        // offset 0x20230, size 0x500
        string(16) customclassname[10];
        // offset 0x20730, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x20731, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x20732, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x20733, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x42158
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x40e70
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x42150, size 0x1
    bool loadoutinitialized;
    // offset 0x42151, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_53f02c9f31c51776"

version 44 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x8ba0
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8a90
        paintshop paintjob;
        // offset 0x8ad0, size 0x20
        uint createtime;
        // offset 0x8af0, size 0x80
        string(16) paintjobname;
        // offset 0x8b70, size 0x8
        int:2 readonly;
        // offset 0x8b78, size 0x8
        byte weaponindex;
        // offset 0x8b80, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x8
    struct hash_705fa6d3f50ff148 {
        // offset 0x0, size 0x8
        bool hash_3d834aee4bd18d13[8];
    };

    // idx 11 members 1 size 0x40
    struct hash_768aeb6b928320d {
        // offset 0x0, size 0x40
        hash_705fa6d3f50ff148 parts[hash_5ab26f037efe82c];
    };

    // idx 12 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 13 members 5 size 0x1488
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x80
        uint:11 hash_20d6751cb2f9ca09[8];
        // offset 0x88, size 0x800
        hash_768aeb6b928320d outfit_breadcrumbs[32];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
        // offset 0x1088, size 0x400
        bool hash_f48e22ced35e56d[1024];
    };

    // idx 14 members 1 size 0x1
    struct hash_75ef0562f1cc95c9 {
        // offset 0x0, size 0x1
        bool hash_3d834aee4bd18d13[1];
    };

    // idx 15 members 1 size 0x8
    struct hash_1b8c44968f4c52b6 {
        // offset 0x0, size 0x8
        hash_75ef0562f1cc95c9 parts[hash_5ab26f037efe82c];
    };

    // idx 16 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 17 members 4 size 0x350
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x100
        hash_1b8c44968f4c52b6 outfit_breadcrumbs[32];
        // offset 0x108, size 0x148
        variant showcaseweapon;
        // offset 0x250, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 18 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 19 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x205b8
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x1ecc0
        character characters[24];
        // offset 0x1ed50, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x1f5c0, size 0xaf0
        zmloadout customclass[10];
        // offset 0x200b0, size 0x500
        string(16) customclassname[10];
        // offset 0x205b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x205b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x205b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x205b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x41e58
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x40b70
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x41e50, size 0x1
    bool loadoutinitialized;
    // offset 0x41e51, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_e80f66b99e66f7ff"

version 43 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x8ba0
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x8a90
        paintshop paintjob;
        // offset 0x8ad0, size 0x20
        uint createtime;
        // offset 0x8af0, size 0x80
        string(16) paintjobname;
        // offset 0x8b70, size 0x8
        int:2 readonly;
        // offset 0x8b78, size 0x8
        byte weaponindex;
        // offset 0x8b80, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1088
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 21 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 24 members 12 size 0x1a5b8
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18cc0
        character characters[24];
        // offset 0x18d50, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x195c0, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a0b0, size 0x500
        string(16) customclassname[10];
        // offset 0x1a5b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a5b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a5b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a5b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x35e58
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34b70
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x35e50, size 0x1
    bool loadoutinitialized;
    // offset 0x35e51, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_13542dbfd51cc048"

version 42 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1088
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 21 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 24 members 12 size 0x1a5b8
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18cc0
        character characters[24];
        // offset 0x18d50, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x195c0, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a0b0, size 0x500
        string(16) customclassname[10];
        // offset 0x1a5b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a5b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a5b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a5b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x35e58
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34b70
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x35e50, size 0x1
    bool loadoutinitialized;
    // offset 0x35e51, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_57979cd9de324fc0"

version 41 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1088
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 3 size 0x50
    struct selectedcharacter {
        // offset 0x0, size 0x8
        uint:6 outfitindex;
        // offset 0x8, size 0x40
        uint:4 outfititems[hash_5ab26f037efe82c];
        // offset 0x48, size 0x8
        uint:6 characterhead;
    };

    // idx 21 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 24 members 12 size 0x1a5b8
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x18cc0
        character characters[24];
        // offset 0x18d50, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x195c0, size 0xaf0
        zmloadout customclass[10];
        // offset 0x1a0b0, size 0x500
        string(16) customclassname[10];
        // offset 0x1a5b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a5b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a5b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a5b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x35e58
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x34b70
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x35e50, size 0x1
    bool loadoutinitialized;
    // offset 0x35e51, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_e6b5e964e7df4a71"

version 40 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:11 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1088
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x17420
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x15b28
        character characters[21];
        // offset 0x15bb8, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x16428, size 0xaf0
        zmloadout customclass[10];
        // offset 0x16f18, size 0x500
        string(16) customclassname[10];
        // offset 0x17418, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x17419, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1741a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1741b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2fb28
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2e840
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2fb20, size 0x1
    bool loadoutinitialized;
    // offset 0x2fb21, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_e99d0b0ae891918d"

version 39 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1088
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x17420
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x15b28
        character characters[21];
        // offset 0x15bb8, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x16428, size 0xaf0
        zmloadout customclass[10];
        // offset 0x16f18, size 0x500
        string(16) customclassname[10];
        // offset 0x17418, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x17419, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1741a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1741b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2fb28
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2e840
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2fb20, size 0x1
    bool loadoutinitialized;
    // offset 0x2fb21, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_c0c1c3fa9888c5b7"

version 38 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 5 size 0x11d0
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x80
        uint:10 hash_20d6751cb2f9ca09[8];
        // offset 0x888, size 0x148
        variant showcaseweapon;
        // offset 0x9d0, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x18f08
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x17610
        character characters[21];
        // offset 0x176a0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x17f10, size 0xaf0
        zmloadout customclass[10];
        // offset 0x18a00, size 0x500
        string(16) customclassname[10];
        // offset 0x18f00, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x18f01, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x18f02, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x18f03, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x330f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x31e10
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x330f0, size 0x1
    bool loadoutinitialized;
    // offset 0x330f1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_244bdb3b7f8338cd"

version 37 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x40
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x40
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x40
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0x1150
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x800
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x40
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x40
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 1 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x8
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 18 members 4 size 0xa50
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x800
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x808, size 0x148
        variant showcaseweapon;
        // offset 0x950, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x18488
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x16b90
        character characters[21];
        // offset 0x16c20, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x17490, size 0xaf0
        zmloadout customclass[10];
        // offset 0x17f80, size 0x500
        string(16) customclassname[10];
        // offset 0x18480, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x18481, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x18482, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x18483, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 8
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6,
        headgear, // 0x7
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x31bf8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x30910
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x31bf0, size 0x1
    bool loadoutinitialized;
    // offset 0x31bf1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_fa82df63aeefc99a"

version 36 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x38
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x38
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x38
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0xf50
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x700
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x708, size 0x148
        variant showcaseweapon;
        // offset 0x850, size 0x700
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x38
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 2 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x7
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
        // offset 0x7, size 0x1
        uint:1 __pad[1];
    };

    // idx 18 members 4 size 0x950
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x700
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[32];
        // offset 0x708, size 0x148
        variant showcaseweapon;
        // offset 0x850, size 0x100
        hash_22abd41674c242a4 hash_e5c77948998e49[32];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x15a88
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x14190
        character characters[21];
        // offset 0x14220, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x14a90, size 0xaf0
        zmloadout customclass[10];
        // offset 0x15580, size 0x500
        string(16) customclassname[10];
        // offset 0x15a80, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x15a81, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x15a82, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x15a83, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 7
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2c7f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2b510
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2c7f0, size 0x1
    bool loadoutinitialized;
    // offset 0x2c7f1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_925f876b4dfdf933"

version 35 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x38
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x38
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x38
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0xf50
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x700
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x708, size 0x148
        variant showcaseweapon;
        // offset 0x850, size 0x700
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x38
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 2 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x7
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
        // offset 0x7, size 0x1
        uint:1 __pad[1];
    };

    // idx 18 members 4 size 0x250
    struct wzcharacter {
        // offset 0x0, size 0x8
        uint:3 selectedoutfit;
        // offset 0x8, size 0xe0
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[4];
        // offset 0xe8, size 0x148
        variant showcaseweapon;
        // offset 0x230, size 0x20
        hash_22abd41674c242a4 hash_e5c77948998e49[4];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x15a88
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x14190
        character characters[21];
        // offset 0x14220, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x14a90, size 0xaf0
        zmloadout customclass[10];
        // offset 0x15580, size 0x500
        string(16) customclassname[10];
        // offset 0x15a80, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x15a81, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x15a82, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x15a83, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 7
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2c7f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2b510
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2c7f0, size 0x1
    bool loadoutinitialized;
    // offset 0x2c7f1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_24c0c20edc65a394"

version 34 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 1 size 0x1
    struct hash_487a06a811f1cadc {
        // offset 0x0, size 0x1
        bool markedold;
    };

    // idx 11 members 1 size 0x8
    struct hash_52f9ee07d542f724 {
        // offset 0x0, size 0x8
        hash_487a06a811f1cadc items[8];
    };

    // idx 12 members 1 size 0x38
    struct hash_380775ab8e293fe7 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 13 members 1 size 0x38
    struct hash_32aeae7311d2cd9b {
        // offset 0x0, size 0x38
        uint:4 hash_212bcdfa518cc913[hash_5ab26f037efe82c];
    };

    // idx 14 members 4 size 0xf50
    struct character {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x700
        hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
        // offset 0x708, size 0x148
        variant showcaseweapon;
        // offset 0x850, size 0x700
        hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    };

    // idx 15 members 1 size 0x1
    struct hash_7cd9cffcae5b8043 {
        // offset 0x0, size 0x1
        hash_487a06a811f1cadc items[1];
    };

    // idx 16 members 1 size 0x38
    struct hash_3cff0c833d630ba2 {
        // offset 0x0, size 0x38
        hash_52f9ee07d542f724 parts[hash_5ab26f037efe82c];
    };

    // idx 17 members 2 size 0x8
    struct hash_22abd41674c242a4 {
        // offset 0x0, size 0x7
        bool hash_212bcdfa518cc913[hash_5ab26f037efe82c];
        // offset 0x7, size 0x1
        uint:1 __pad[1];
    };

    // idx 18 members 5 size 0x190
    struct wzcharacter {
        // offset 0x0, size 0x38
        hash_3cff0c833d630ba2 hash_b56427620aa34e1[1];
        // offset 0x38, size 0x148
        variant showcaseweapon;
        // offset 0x180, size 0x8
        hash_22abd41674c242a4 hash_e5c77948998e49[1];
        // offset 0x188, size 0x1
        bool selectedoutfit;
        // offset 0x189, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0x58
    struct charactercontext {
        // offset 0x0, size 0x20
        uint characterindex;
        // offset 0x20, size 0x8
        uint:2 selectedgender;
        // offset 0x28, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0x38, size 0x20
        uint charactermode;
    };

    // idx 20 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 23 members 12 size 0x15a88
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x58
        charactercontext charactercontext;
        // offset 0x70, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x90, size 0x14190
        character characters[21];
        // offset 0x14220, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x14a90, size 0xaf0
        zmloadout customclass[10];
        // offset 0x15580, size 0x500
        string(16) customclassname[10];
        // offset 0x15a80, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x15a81, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x15a82, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x15a83, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 7
    enum hash_5ab26f037efe82c {
        arms, // 0x0,
        head, // 0x1,
        palette, // 0x2,
        legs, // 0x3,
        decals, // 0x4,
        war_paint, // 0x5,
        torso, // 0x6
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x2c7f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2b510
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x2c7f0, size 0x1
    bool loadoutinitialized;
    // offset 0x2c7f1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_2d5c09a71205ebd6"

version 33 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 4 size 0x20
    struct characteritem {
        // offset 0x0, size 0x18
        uint:3 colors[3];
        // offset 0x18, size 0x1
        bool markedold;
        // offset 0x19, size 0x1
        bool unlocked;
        // offset 0x1a, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 1 size 0x780
    struct hash_74e0cb6ea60c0207 {
        // offset 0x0, size 0x780
        characteritem items[60];
    };

    // idx 12 members 4 size 0x1f70
    struct character {
        // offset 0x0, size 0x1e00
        hash_74e0cb6ea60c0207 itemlist[hash_5446546f71ee6cdf];
        // offset 0x1e00, size 0x148
        variant showcaseweapon;
        // offset 0x1f48, size 0x20
        uint:6 selectedcharacteritems[hash_5446546f71ee6cdf];
        // offset 0x1f68, size 0x8
        uint:2 selectedloadouttype;
    };

    // idx 13 members 2 size 0x40
    struct mix_s {
        // offset 0x0, size 0x20
        uint modelindex;
        // offset 0x20, size 0x20
        float weight;
    };

    // idx 14 members 1 size 0x100
    struct hash_508eaeb5f638a293 {
        // offset 0x0, size 0x100
        mix_s mix[4];
    };

    // idx 15 members 2 size 0x510
    struct hash_5b3226f1816b17a {
        // offset 0x0, size 0x500
        hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
        // offset 0x500, size 0x10
        uint:5 materialindex[2];
    };

    // idx 16 members 5 size 0xa78
    struct charactercontext {
        // offset 0x0, size 0xa20
        hash_5b3226f1816b17a hash_50ee7b4f9ae0c518[hash_7f3085f3cff25119];
        // offset 0xa20, size 0x20
        uint characterindex;
        // offset 0xa40, size 0x8
        uint:2 selectedgender;
        // offset 0xa48, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0xa58, size 0x20
        uint charactermode;
    };

    // idx 17 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:8 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 13 size 0x2b750
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0xa78
        charactercontext charactercontext;
        // offset 0xa90, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xab0, size 0x29430
        character characters[21];
        // offset 0x29ee0, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x2a750, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x2a758, size 0xaf0
        zmloadout customclass[10];
        // offset 0x2b248, size 0x500
        string(16) customclassname[10];
        // offset 0x2b748, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2b749, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2b74a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2b74b, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 4
    enum hash_5446546f71ee6cdf {
        hash_2e29a4cc7409d939, // 0x0,
        helmet, // 0x1,
        body, // 0x2,
        hash_7d030d1323187739, // 0x3
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x58188
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x56ea0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x58180, size 0x1
    bool loadoutinitialized;
    // offset 0x58181, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/zm_loadouts.ddl
// metatable "hash_dca2ebaf4ed22491"

version 32 {
    // idx 1 members 26 size 0xf0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:11 posx;
        // offset 0x30, size 0x10
        uint:11 posy;
        // offset 0x40, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x48, size 0x8
        uint:8 alpha;
        // offset 0x50, size 0x10
        uint:9 angle;
        // offset 0x60, size 0x8
        uint:8 blue1;
        // offset 0x68, size 0x8
        uint:8 green;
        // offset 0x70, size 0x8
        uint:7 gradientfill;
        // offset 0x78, size 0x8
        uint:6 groupindex;
        // offset 0x80, size 0x10
        uint:9 gradientangle;
        // offset 0x90, size 0x8
        uint:8 alpha1;
        // offset 0x98, size 0x8
        uint:8 green1;
        // offset 0xa0, size 0x10
        uint:9 materialangle;
        // offset 0xb0, size 0x10
        uint:11 scalex;
        // offset 0xc0, size 0x10
        uint:11 scaley;
        // offset 0xd0, size 0x8
        uint:8 materialscalex;
        // offset 0xd8, size 0x8
        uint:8 materialscaley;
        // offset 0xe0, size 0x8
        uint:7 materialid;
        // offset 0xe8, size 0x1
        bool flip;
        // offset 0xe9, size 0x1
        bool blend;
        // offset 0xea, size 0x1
        bool gradienttype;
        // offset 0xeb, size 0x1
        bool outline;
        // offset 0xec, size 0x4
        uint:1 __pad[4];
    };

    // idx 2 members 26 size 0xd8
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:11 posx;
        // offset 0x20, size 0x10
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x10
        uint:9 angle;
        // offset 0x50, size 0x8
        uint:8 blue1;
        // offset 0x58, size 0x8
        uint:8 green;
        // offset 0x60, size 0x8
        uint:7 gradientfill;
        // offset 0x68, size 0x10
        uint:9 gradientangle;
        // offset 0x78, size 0x8
        uint:8 alpha1;
        // offset 0x80, size 0x8
        uint:8 green1;
        // offset 0x88, size 0x10
        uint:9 materialangle;
        // offset 0x98, size 0x10
        uint:11 scalex;
        // offset 0xa8, size 0x10
        uint:11 scaley;
        // offset 0xb8, size 0x8
        uint:8 materialscalex;
        // offset 0xc0, size 0x8
        uint:8 materialscaley;
        // offset 0xc8, size 0x8
        uint:7 materialid;
        // offset 0xd0, size 0x1
        bool flip;
        // offset 0xd1, size 0x1
        bool blend;
        // offset 0xd2, size 0x1
        bool gradienttype;
        // offset 0xd3, size 0x1
        bool groupedlook;
        // offset 0xd4, size 0x1
        bool outline;
        // offset 0xd5, size 0x1
        bool isgrouped;
        // offset 0xd6, size 0x2
        uint:1 __pad[2];
    };

    // idx 3 members 2 size 0x4548
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0x948
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3cd8
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3c00
        emblemlayer layer[64];
        // offset 0x3c00, size 0xd8
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x4558
    struct emblem {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
        // offset 0x4548, size 0x10
        uint:10 background;
    };

    // idx 6 members 1 size 0x4548
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x4548
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x8a90
    struct paintshop {
        // offset 0x0, size 0x8a90
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x8b60
    struct weaponpaintjob {
        // offset 0x0, size 0x8a90
        paintshop paintjob;
        // offset 0x8a90, size 0x20
        uint createtime;
        // offset 0x8ab0, size 0x80
        string(16) paintjobname;
        // offset 0x8b30, size 0x8
        int:2 readonly;
        // offset 0x8b38, size 0x8
        byte weaponindex;
        // offset 0x8b40, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x148
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0x10
        int:11 variantindex;
        // offset 0x38, size 0x40
        int:8 attachment[8];
        // offset 0x78, size 0x80
        string(16) variantname;
        // offset 0xf8, size 0x8
        int:2 readonly;
        // offset 0x100, size 0x10
        int:11 reticleindex;
        // offset 0x110, size 0x10
        int:9 weaponindex;
        // offset 0x120, size 0x8
        byte camoindex;
        // offset 0x128, size 0x20
        int sortindex;
    };

    // idx 10 members 4 size 0x20
    struct characteritem {
        // offset 0x0, size 0x18
        uint:3 colors[3];
        // offset 0x18, size 0x1
        bool markedold;
        // offset 0x19, size 0x1
        bool unlocked;
        // offset 0x1a, size 0x6
        uint:1 __pad[6];
    };

    // idx 11 members 1 size 0x780
    struct hash_74e0cb6ea60c0207 {
        // offset 0x0, size 0x780
        characteritem items[60];
    };

    // idx 12 members 4 size 0x1f70
    struct character {
        // offset 0x0, size 0x1e00
        hash_74e0cb6ea60c0207 itemlist[hash_5446546f71ee6cdf];
        // offset 0x1e00, size 0x148
        variant showcaseweapon;
        // offset 0x1f48, size 0x20
        uint:6 selectedcharacteritems[hash_5446546f71ee6cdf];
        // offset 0x1f68, size 0x8
        uint:2 selectedloadouttype;
    };

    // idx 13 members 2 size 0x40
    struct mix_s {
        // offset 0x0, size 0x20
        uint modelindex;
        // offset 0x20, size 0x20
        float weight;
    };

    // idx 14 members 1 size 0x100
    struct hash_508eaeb5f638a293 {
        // offset 0x0, size 0x100
        mix_s mix[4];
    };

    // idx 15 members 2 size 0x510
    struct hash_5b3226f1816b17a {
        // offset 0x0, size 0x500
        hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
        // offset 0x500, size 0x10
        uint:5 materialindex[2];
    };

    // idx 16 members 5 size 0xa78
    struct charactercontext {
        // offset 0x0, size 0xa20
        hash_5b3226f1816b17a hash_50ee7b4f9ae0c518[hash_7f3085f3cff25119];
        // offset 0xa20, size 0x20
        uint characterindex;
        // offset 0xa40, size 0x8
        uint:2 selectedgender;
        // offset 0xa48, size 0x10
        uint:5 selectedheadindex[hash_7f3085f3cff25119];
        // offset 0xa58, size 0x20
        uint charactermode;
    };

    // idx 17 members 5 size 0x60
    struct hash_51ee933f6ee8ec54 {
        // offset 0x0, size 0x8
        int:8 paintjobslot;
        // offset 0x8, size 0x10
        uint:10 itemindex;
        // offset 0x18, size 0x38
        int:6 attachment[7];
        // offset 0x50, size 0x8
        uint:6 reticleindex;
        // offset 0x58, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 2 size 0xd8
    struct hash_5fe8e8cb2b27ba05 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 19 members 6 size 0x118
    struct zmloadout {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_51ee933f6ee8ec54 secondary;
        // offset 0xb8, size 0x60
        hash_51ee933f6ee8ec54 primary;
    };

    // idx 20 members 13 size 0x17cf0
    struct hash_18b04f5b045db908 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0xa78
        charactercontext charactercontext;
        // offset 0xa90, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xab0, size 0x159d0
        character characters[11];
        // offset 0x16480, size 0x870
        hash_5fe8e8cb2b27ba05 bubblegumpack[10];
        // offset 0x16cf0, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x16cf8, size 0xaf0
        zmloadout customclass[10];
        // offset 0x177e8, size 0x500
        string(16) customclassname[10];
        // offset 0x17ce8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x17ce9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x17cea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x17ceb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 4
    enum hash_5446546f71ee6cdf {
        hash_2e29a4cc7409d939, // 0x0,
        helmet, // 0x1,
        body, // 0x2,
        hash_7d030d1323187739, // 0x3
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x30cc8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x12c0
    hash_51ee933f6ee8ec54 variant[50];
    // offset 0x12e0, size 0x2f9e0
    hash_18b04f5b045db908 cacloadouts[2];
    // offset 0x30cc0, size 0x1
    bool loadoutinitialized;
    // offset 0x30cc1, size 0x7
    uint:1 __pad[7];
}

