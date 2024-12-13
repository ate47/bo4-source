// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_178fce93499e4607"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xbad40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xba450
        character characters[85];
        // offset 0xba598, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xba628, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xba630, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xba638, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xba938, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xbad38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xbad39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x21f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_5587d4b6f80e3750 variant[60];
    // offset 0x2000, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_70d06f10db7f6e5c"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xbad40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xba450
        character characters[85];
        // offset 0xba598, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xba628, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xba630, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xba638, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xba938, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xbad38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xbad39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x21f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_5587d4b6f80e3750 variant[60];
    // offset 0x2000, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_519dd0b1f166ae4d"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xaae40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xaa550
        character characters[85];
        // offset 0xaa698, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa728, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa730, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa738, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaaa38, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaae38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaae39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x21f8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1fe0
    hash_5587d4b6f80e3750 variant[60];
    // offset 0x2000, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_a02825d6474e523d"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xaae40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xaa550
        character characters[85];
        // offset 0xaa698, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa728, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa730, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa738, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaaa38, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaae38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaae39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1ca8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_8be4c06784302ccd"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xaae40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xaa550
        character characters[85];
        // offset 0xaa698, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa728, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa730, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa738, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaaa38, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaae38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaae39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1ca8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_432e13e3db2e7099"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 11 size 0xaae40
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x148, size 0xaa550
        character characters[85];
        // offset 0xaa698, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa728, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa730, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa738, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaaa38, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaae38, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaae39, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x1f8
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0xc0
        xhash hash_3151222286bd41d4[hash_6eb19cb9fcf5e143];
        // offset 0x118, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0x168, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1ca8
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x1f8
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_f1f69f189c50f1b"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 10 size 0xaad80
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xaa550
        character characters[85];
        // offset 0xaa5d8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa668, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa670, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa678, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaa978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaad78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaad79, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x168
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0xd8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1c18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x168
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_b0a4a65fadaa06d7"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 10 size 0xaad80
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0xaa550
        character characters[85];
        // offset 0xaa5d8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0xaa668, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0xaa670, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0xaa678, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0xaa978, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0xaad78, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xaad79, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x168
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0xd8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1c18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x168
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_e422b9af57c905f6"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 10 size 0x80c30
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x80400
        character characters[64];
        // offset 0x80488, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x80518, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0x80520, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0x80528, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0x80828, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x80c28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x80c29, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:6 selectedoutfit;
        // offset 0x8, size 0x8
        uint:6 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x168
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0xd8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1c18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x168
    hash_21b8990ea47fcb57 cacloadouts;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/wz_loadouts_sv.ddl
// metatable "hash_4330853e2b77ba41"

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
    struct hash_5587d4b6f80e3750 {
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

    // idx 18 members 10 size 0x60c30
    struct hash_16fd550e78e8ba94 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x60400
        character characters[64];
        // offset 0x60488, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
        // offset 0x60518, size 0x8
        uint:7 hash_6a8bd5071bcb463c;
        // offset 0x60520, size 0x8
        uint:7 hash_6eb648836297a49d;
        // offset 0x60528, size 0x300
        hash_729f42618cb8bf17 hash_729cad1e38ec0d06[hash_6eb19cb9fcf5e143];
        // offset 0x60828, size 0x400
        bool hash_f48e22ced35e56d[1024];
        // offset 0x60c28, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x60c29, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 3 size 0x50
    struct hash_364a833fe14792ac {
        // offset 0x0, size 0x8
        uint:5 selectedoutfit;
        // offset 0x8, size 0x8
        uint:5 hash_4d9fceac8ff24cbd;
        // offset 0x10, size 0x40
        hash_32aeae7311d2cd9b hash_e5c77948998e49;
    };

    // idx 20 members 4 size 0x168
    struct hash_21b8990ea47fcb57 {
        // offset 0x0, size 0x58
        charactercontext charactercontext;
        // offset 0x58, size 0x30
        uint:9 hash_44ed9a1ad38be40[hash_6eb19cb9fcf5e143];
        // offset 0x88, size 0x50
        hash_364a833fe14792ac characters;
        // offset 0xd8, size 0x90
        uint:11 hash_20d6751cb2f9ca09[9];
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

    // idx 0 members 3 size 0x1c18
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x1a90
    hash_5587d4b6f80e3750 variant[50];
    // offset 0x1ab0, size 0x168
    hash_21b8990ea47fcb57 cacloadouts;
}

