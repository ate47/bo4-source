// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_45bf7cae33fcc823"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x43288
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x3d5c0
        character characters[28];
        // offset 0x41980, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x421f0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x42d80, size 0x500
        string(16) customclassname[10];
        // offset 0x43280, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x43281, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x43282, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x43283, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x27060
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x25410
        character characters[17];
        // offset 0x25498, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x26818, size 0x800
        string(16) customclassname[16];
        // offset 0x27018, size 0x10
        uint:10 killstreak1;
        // offset 0x27028, size 0x10
        uint:10 killstreak2;
        // offset 0x27038, size 0x10
        uint:10 killstreak3;
        // offset 0x27048, size 0x10
        uint:10 killstreak4;
        // offset 0x27058, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27059, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2705a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2705b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0xa3d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8c40
        character characters[4];
        // offset 0x8cc8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x9bc8, size 0x800
        string(16) customclassname[16];
        // offset 0xa3c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xa3c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xa3ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xa3cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_d5956de752733ae"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x3a648
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x34980
        character characters[24];
        // offset 0x38d40, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x395b0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x3a140, size 0x500
        string(16) customclassname[10];
        // offset 0x3a640, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x3a641, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x3a642, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x3a643, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x27060
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x25410
        character characters[17];
        // offset 0x25498, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x26818, size 0x800
        string(16) customclassname[16];
        // offset 0x27018, size 0x10
        uint:10 killstreak1;
        // offset 0x27028, size 0x10
        uint:10 killstreak2;
        // offset 0x27038, size 0x10
        uint:10 killstreak3;
        // offset 0x27048, size 0x10
        uint:10 killstreak4;
        // offset 0x27058, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x27059, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2705a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2705b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0xa3d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8c40
        character characters[4];
        // offset 0x8cc8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x9bc8, size 0x800
        string(16) customclassname[16];
        // offset 0xa3c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xa3c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xa3ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xa3cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_8ebef46489377833"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x23d60
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x22110
        character characters[17];
        // offset 0x22198, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x23518, size 0x800
        string(16) customclassname[16];
        // offset 0x23d18, size 0x10
        uint:10 killstreak1;
        // offset 0x23d28, size 0x10
        uint:10 killstreak2;
        // offset 0x23d38, size 0x10
        uint:10 killstreak3;
        // offset 0x23d48, size 0x10
        uint:10 killstreak4;
        // offset 0x23d58, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x23d59, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x23d5a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x23d5b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_c714dc2c03f5c2df"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x23d60
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x22110
        character characters[17];
        // offset 0x22198, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x23518, size 0x800
        string(16) customclassname[16];
        // offset 0x23d18, size 0x10
        uint:10 killstreak1;
        // offset 0x23d28, size 0x10
        uint:10 killstreak2;
        // offset 0x23d38, size 0x10
        uint:10 killstreak3;
        // offset 0x23d48, size 0x10
        uint:10 killstreak4;
        // offset 0x23d58, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x23d59, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x23d5a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x23d5b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_6658beaa07871622"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x23d60
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x22110
        character characters[17];
        // offset 0x22198, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x23518, size 0x800
        string(16) customclassname[16];
        // offset 0x23d18, size 0x10
        uint:10 killstreak1;
        // offset 0x23d28, size 0x10
        uint:10 killstreak2;
        // offset 0x23d38, size 0x10
        uint:10 killstreak3;
        // offset 0x23d48, size 0x10
        uint:10 killstreak4;
        // offset 0x23d58, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x23d59, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x23d5a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x23d5b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_d5846ce41cd48ebe"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x21d50
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x20100
        character characters[16];
        // offset 0x20188, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x21508, size 0x800
        string(16) customclassname[16];
        // offset 0x21d08, size 0x10
        uint:10 killstreak1;
        // offset 0x21d18, size 0x10
        uint:10 killstreak2;
        // offset 0x21d28, size 0x10
        uint:10 killstreak3;
        // offset 0x21d38, size 0x10
        uint:10 killstreak4;
        // offset 0x21d48, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x21d49, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x21d4a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x21d4b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_30fcaa56c82bdcaf"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:8 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x21d50
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x20100
        character characters[16];
        // offset 0x20188, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x21508, size 0x800
        string(16) customclassname[16];
        // offset 0x21d08, size 0x10
        uint:10 killstreak1;
        // offset 0x21d18, size 0x10
        uint:10 killstreak2;
        // offset 0x21d28, size 0x10
        uint:10 killstreak3;
        // offset 0x21d38, size 0x10
        uint:10 killstreak4;
        // offset 0x21d48, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x21d49, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x21d4a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x21d4b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_b1ad210c3926e6df"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x35e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x30180
        character characters[24];
        // offset 0x34540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x34db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x35940, size 0x500
        string(16) customclassname[10];
        // offset 0x35e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x35e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x35e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x35e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x21d50
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x20100
        character characters[16];
        // offset 0x20188, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x21508, size 0x800
        string(16) customclassname[16];
        // offset 0x21d08, size 0x10
        uint:10 killstreak1;
        // offset 0x21d18, size 0x10
        uint:10 killstreak2;
        // offset 0x21d28, size 0x10
        uint:10 killstreak3;
        // offset 0x21d38, size 0x10
        uint:10 killstreak4;
        // offset 0x21d48, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x21d49, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x21d4a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x21d4b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x97d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x8040
        character characters[4];
        // offset 0x80c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x8fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x97c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x97c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x97ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x97cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_8a8a03145ba0147c"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x29e48
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x24180
        character characters[24];
        // offset 0x28540, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x28db0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x29940, size 0x500
        string(16) customclassname[10];
        // offset 0x29e40, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x29e41, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x29e42, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x29e43, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x19d50
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18100
        character characters[16];
        // offset 0x18188, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x19508, size 0x800
        string(16) customclassname[16];
        // offset 0x19d08, size 0x10
        uint:10 killstreak1;
        // offset 0x19d18, size 0x10
        uint:10 killstreak2;
        // offset 0x19d28, size 0x10
        uint:10 killstreak3;
        // offset 0x19d38, size 0x10
        uint:10 killstreak4;
        // offset 0x19d48, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x19d49, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x19d4a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x19d4b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x77d0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6040
        character characters[4];
        // offset 0x60c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x6fc8, size 0x800
        string(16) customclassname[16];
        // offset 0x77c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x77c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x77ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x77cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_22fd0bebe6fcac36"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x2a2c8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x24600
        character characters[24];
        // offset 0x289c0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x29230, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x29dc0, size 0x500
        string(16) customclassname[10];
        // offset 0x2a2c0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2a2c1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2a2c2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2a2c3, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x1a050
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18400
        character characters[16];
        // offset 0x18488, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x19808, size 0x800
        string(16) customclassname[16];
        // offset 0x1a008, size 0x10
        uint:10 killstreak1;
        // offset 0x1a018, size 0x10
        uint:10 killstreak2;
        // offset 0x1a028, size 0x10
        uint:10 killstreak3;
        // offset 0x1a038, size 0x10
        uint:10 killstreak4;
        // offset 0x1a048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a04a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a04b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x7890
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6100
        character characters[4];
        // offset 0x6188, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x7088, size 0x800
        string(16) customclassname[16];
        // offset 0x7888, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x7889, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x788a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x788b, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_9d9baedfa57fbad3"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x2b048
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x25380
        character characters[24];
        // offset 0x29740, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x29fb0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x2ab40, size 0x500
        string(16) customclassname[10];
        // offset 0x2b040, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2b041, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2b042, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2b043, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x1a950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18d00
        character characters[16];
        // offset 0x18d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x1a108, size 0x800
        string(16) customclassname[16];
        // offset 0x1a908, size 0x10
        uint:10 killstreak1;
        // offset 0x1a918, size 0x10
        uint:10 killstreak2;
        // offset 0x1a928, size 0x10
        uint:10 killstreak3;
        // offset 0x1a938, size 0x10
        uint:10 killstreak4;
        // offset 0x1a948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a94a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a94b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x7ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6340
        character characters[4];
        // offset 0x63c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x72c8, size 0x800
        string(16) customclassname[16];
        // offset 0x7ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x7ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x7aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x7acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_9266ef938d299f5c"

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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x2b048
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4330
        variant variant[50];
        // offset 0x4348, size 0x58
        charactercontext charactercontext;
        // offset 0x43a0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x43c0, size 0x25380
        character characters[24];
        // offset 0x29740, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x29fb0, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x2ab40, size 0x500
        string(16) customclassname[10];
        // offset 0x2b040, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2b041, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2b042, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2b043, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x1a950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18d00
        character characters[16];
        // offset 0x18d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x1a108, size 0x800
        string(16) customclassname[16];
        // offset 0x1a908, size 0x10
        uint:10 killstreak1;
        // offset 0x1a918, size 0x10
        uint:10 killstreak2;
        // offset 0x1a928, size 0x10
        uint:10 killstreak3;
        // offset 0x1a938, size 0x10
        uint:10 killstreak4;
        // offset 0x1a948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a94a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a94b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x7ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6340
        character characters[4];
        // offset 0x63c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x72c8, size 0x800
        string(16) customclassname[16];
        // offset 0x7ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x7ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x7aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x7acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_d1912ff1c18e3664"

version 56 {
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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x2ad28
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x25380
        character characters[24];
        // offset 0x29420, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x29c90, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x2a820, size 0x500
        string(16) customclassname[10];
        // offset 0x2ad20, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2ad21, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2ad22, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2ad23, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x1a950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18d00
        character characters[16];
        // offset 0x18d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x1a108, size 0x800
        string(16) customclassname[16];
        // offset 0x1a908, size 0x10
        uint:10 killstreak1;
        // offset 0x1a918, size 0x10
        uint:10 killstreak2;
        // offset 0x1a928, size 0x10
        uint:10 killstreak3;
        // offset 0x1a938, size 0x10
        uint:10 killstreak4;
        // offset 0x1a948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a94a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a94b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x7ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6340
        character characters[4];
        // offset 0x63c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x72c8, size 0x800
        string(16) customclassname[16];
        // offset 0x7ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x7ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x7aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x7acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 9 size 0x8b60
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_eeca5d678902a83;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x8
    uint:4 hash_18ba05e4ae1bcfff;
    // offset 0xbc8, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45c0, size 0xb98
    hash_5814f20693f11787 hash_4318aa0e7238f645;
    // offset 0x5158, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x5160, size 0x8
    uint:4 hash_4148199a85d44d69;
    // offset 0x5168, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_408ed9f30731ecc5"

version 55 {
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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x2ad28
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x25380
        character characters[24];
        // offset 0x29420, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x29c90, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x2a820, size 0x500
        string(16) customclassname[10];
        // offset 0x2ad20, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x2ad21, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x2ad22, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x2ad23, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x1a950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x18d00
        character characters[16];
        // offset 0x18d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x1a108, size 0x800
        string(16) customclassname[16];
        // offset 0x1a908, size 0x10
        uint:10 killstreak1;
        // offset 0x1a918, size 0x10
        uint:10 killstreak2;
        // offset 0x1a928, size 0x10
        uint:10 killstreak3;
        // offset 0x1a938, size 0x10
        uint:10 killstreak4;
        // offset 0x1a948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1a949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1a94a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1a94b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x7ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x6340
        character characters[4];
        // offset 0x63c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x72c8, size 0x800
        string(16) customclassname[16];
        // offset 0x7ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x7ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x7aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x7acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_fab4d485ce9590ce"

version 54 {
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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x1ed28
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x19380
        character characters[24];
        // offset 0x1d420, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1dc90, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e820, size 0x500
        string(16) customclassname[10];
        // offset 0x1ed20, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1ed21, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1ed22, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1ed23, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x12950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10d00
        character characters[16];
        // offset 0x10d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x12108, size 0x800
        string(16) customclassname[16];
        // offset 0x12908, size 0x10
        uint:10 killstreak1;
        // offset 0x12918, size 0x10
        uint:10 killstreak2;
        // offset 0x12928, size 0x10
        uint:10 killstreak3;
        // offset 0x12938, size 0x10
        uint:10 killstreak4;
        // offset 0x12948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x12949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1294a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1294b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x5ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4340
        character characters[4];
        // offset 0x43c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x52c8, size 0x800
        string(16) customclassname[16];
        // offset 0x5ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x5ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x5aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x5acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_4b01509de1bf4c7e"

version 53 {
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

    // idx 17 members 6 size 0x68
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 19 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 13 size 0x1ed28
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x19380
        character characters[24];
        // offset 0x1d420, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1dc90, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e820, size 0x500
        string(16) customclassname[10];
        // offset 0x1ed20, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1ed21, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1ed22, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1ed23, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 14 size 0x12950
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10d00
        character characters[16];
        // offset 0x10d88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x12108, size 0x800
        string(16) customclassname[16];
        // offset 0x12908, size 0x10
        uint:10 killstreak1;
        // offset 0x12918, size 0x10
        uint:10 killstreak2;
        // offset 0x12928, size 0x10
        uint:10 killstreak3;
        // offset 0x12938, size 0x10
        uint:10 killstreak4;
        // offset 0x12948, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x12949, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1294a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1294b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 10 size 0x5ad0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4340
        character characters[4];
        // offset 0x43c8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x52c8, size 0x800
        string(16) customclassname[16];
        // offset 0x5ac8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x5ac9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x5aca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x5acb, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_dc8bc2cfb64dbbfe"

version 52 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e8a8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18f00
        character characters[24];
        // offset 0x1cfa0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d810, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e3a0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e8a0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e8a1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e8a2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e8a3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x12650
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10a00
        character characters[16];
        // offset 0x10a88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11e08, size 0x800
        string(16) customclassname[16];
        // offset 0x12608, size 0x10
        uint:10 killstreak1;
        // offset 0x12618, size 0x10
        uint:10 killstreak2;
        // offset 0x12628, size 0x10
        uint:10 killstreak3;
        // offset 0x12638, size 0x10
        uint:10 killstreak4;
        // offset 0x12648, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x12649, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1264a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1264b, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x5a10
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4280
        character characters[4];
        // offset 0x4308, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x5208, size 0x800
        string(16) customclassname[16];
        // offset 0x5a08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x5a09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x5a0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x5a0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_2daaa2bbf7718798"

version 51 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e8a8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18f00
        character characters[24];
        // offset 0x1cfa0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d810, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e3a0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e8a0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e8a1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e8a2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e8a3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x12650
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10a00
        character characters[16];
        // offset 0x10a88, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11e08, size 0x800
        string(16) customclassname[16];
        // offset 0x12608, size 0x10
        uint:10 killstreak1;
        // offset 0x12618, size 0x10
        uint:10 killstreak2;
        // offset 0x12628, size 0x10
        uint:10 killstreak3;
        // offset 0x12638, size 0x10
        uint:10 killstreak4;
        // offset 0x12648, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x12649, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1264a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1264b, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x5a10
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4280
        character characters[4];
        // offset 0x4308, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x5208, size 0x800
        string(16) customclassname[16];
        // offset 0x5a08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x5a09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x5a0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x5a0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_600319a4f77ce6d4"

version 50 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x187e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x12e40
        character characters[24];
        // offset 0x16ee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x17750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x182e0, size 0x500
        string(16) customclassname[10];
        // offset 0x187e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x187e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x187e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x187e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0xe5d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xc980
        character characters[16];
        // offset 0xca08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0xdd88, size 0x800
        string(16) customclassname[16];
        // offset 0xe588, size 0x10
        uint:10 killstreak1;
        // offset 0xe598, size 0x10
        uint:10 killstreak2;
        // offset 0xe5a8, size 0x10
        uint:10 killstreak3;
        // offset 0xe5b8, size 0x10
        uint:10 killstreak4;
        // offset 0xe5c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xe5c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xe5ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xe5cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x49f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x3260
        character characters[4];
        // offset 0x32e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x41e8, size 0x800
        string(16) customclassname[16];
        // offset 0x49e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x49e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x49ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x49eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 7 size 0x7fc0
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0xb98
    hash_5814f20693f11787 hash_5fd2271a4d63ae96;
    // offset 0xbb8, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0xbc0, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x45b8, size 0x8
    uint:4 hash_8817152b73facf2;
    // offset 0x45c0, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x45c8, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_c544ae650968bd5"

version 49 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x187e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x12e40
        character characters[24];
        // offset 0x16ee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x17750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x182e0, size 0x500
        string(16) customclassname[10];
        // offset 0x187e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x187e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x187e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x187e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0xe5d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xc980
        character characters[16];
        // offset 0xca08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0xdd88, size 0x800
        string(16) customclassname[16];
        // offset 0xe588, size 0x10
        uint:10 killstreak1;
        // offset 0xe598, size 0x10
        uint:10 killstreak2;
        // offset 0xe5a8, size 0x10
        uint:10 killstreak3;
        // offset 0xe5b8, size 0x10
        uint:10 killstreak4;
        // offset 0xe5c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xe5c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xe5ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xe5cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x49f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x3260
        character characters[4];
        // offset 0x32e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x41e8, size 0x800
        string(16) customclassname[16];
        // offset 0x49e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x49e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x49ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x49eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_373c45603fe4ae4e"

version 48 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x187e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x12e40
        character characters[24];
        // offset 0x16ee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x17750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x182e0, size 0x500
        string(16) customclassname[10];
        // offset 0x187e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x187e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x187e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x187e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0xe5d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xc980
        character characters[16];
        // offset 0xca08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0xdd88, size 0x800
        string(16) customclassname[16];
        // offset 0xe588, size 0x10
        uint:10 killstreak1;
        // offset 0xe598, size 0x10
        uint:10 killstreak2;
        // offset 0xe5a8, size 0x10
        uint:10 killstreak3;
        // offset 0xe5b8, size 0x10
        uint:10 killstreak4;
        // offset 0xe5c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0xe5c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0xe5ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0xe5cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x49f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x3260
        character characters[4];
        // offset 0x32e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x41e8, size 0x800
        string(16) customclassname[16];
        // offset 0x49e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x49e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x49ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x49eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_9cbd48afd71af86c"

version 47 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e7e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e2e0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e7e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e7e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e7e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e7e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x125d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11d88, size 0x800
        string(16) customclassname[16];
        // offset 0x12588, size 0x10
        uint:10 killstreak1;
        // offset 0x12598, size 0x10
        uint:10 killstreak2;
        // offset 0x125a8, size 0x10
        uint:10 killstreak3;
        // offset 0x125b8, size 0x10
        uint:10 killstreak4;
        // offset 0x125c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x125c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x125ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x125cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x59f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x51e8, size 0x800
        string(16) customclassname[16];
        // offset 0x59e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x59e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x59ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x59eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_faa2c62fb8df8cbc"

version 46 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e7e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e2e0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e7e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e7e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e7e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e7e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x125d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11d88, size 0x800
        string(16) customclassname[16];
        // offset 0x12588, size 0x10
        uint:10 killstreak1;
        // offset 0x12598, size 0x10
        uint:10 killstreak2;
        // offset 0x125a8, size 0x10
        uint:10 killstreak3;
        // offset 0x125b8, size 0x10
        uint:10 killstreak4;
        // offset 0x125c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x125c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x125ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x125cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x59f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x51e8, size 0x800
        string(16) customclassname[16];
        // offset 0x59e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x59e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x59ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x59eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_4f0d0fd6b13a6153"

version 45 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e7e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e2e0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e7e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e7e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e7e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e7e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x125d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11d88, size 0x800
        string(16) customclassname[16];
        // offset 0x12588, size 0x10
        uint:10 killstreak1;
        // offset 0x12598, size 0x10
        uint:10 killstreak2;
        // offset 0x125a8, size 0x10
        uint:10 killstreak3;
        // offset 0x125b8, size 0x10
        uint:10 killstreak4;
        // offset 0x125c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x125c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x125ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x125cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x59f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x51e8, size 0x800
        string(16) customclassname[16];
        // offset 0x59e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x59e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x59ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x59eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_c67c8834ecaa2ae7"

version 44 {
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
    struct hash_2c79abcce61676aa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 17 members 6 size 0x68
    struct hash_20631b664715b1fa {
        // offset 0x0, size 0x8
        uint:4 weaponmodelslot;
        // offset 0x8, size 0x8
        int:8 paintjobslot;
        // offset 0x10, size 0x10
        uint:10 itemindex;
        // offset 0x20, size 0x38
        int:8 attachment[7];
        // offset 0x58, size 0x8
        uint:6 reticleindex;
        // offset 0x60, size 0x8
        uint:6 camoindex;
    };

    // idx 18 members 8 size 0x138
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc8, size 0x68
        hash_2c79abcce61676aa primary;
        // offset 0x130, size 0x1
        bool primarygrenadecount;
        // offset 0x131, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xf0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0x88, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x128
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x68
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x68
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e7e8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xb90
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e2e0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e7e0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e7e1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e7e2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e7e3, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x125d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1380
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11d88, size 0x800
        string(16) customclassname[16];
        // offset 0x12588, size 0x10
        uint:10 killstreak1;
        // offset 0x12598, size 0x10
        uint:10 killstreak2;
        // offset 0x125a8, size 0x10
        uint:10 killstreak3;
        // offset 0x125b8, size 0x10
        uint:10 killstreak4;
        // offset 0x125c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x125c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x125ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x125cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x59f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xf00
        hash_1489c97943984433 customclass[16];
        // offset 0x51e8, size 0x800
        string(16) customclassname[16];
        // offset 0x59e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x59e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x59ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x59eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb98
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x618
        hash_27580df06d232ed1 customclass[5];
        // offset 0x698, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7420
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x39f8
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3a20, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3a28, size 0x39f8
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_d799def783531706"

version 43 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 17 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 18 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e748
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e240, size 0x500
        string(16) customclassname[10];
        // offset 0x1e740, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e741, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e742, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e743, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x124d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11c88, size 0x800
        string(16) customclassname[16];
        // offset 0x12488, size 0x10
        uint:10 killstreak1;
        // offset 0x12498, size 0x10
        uint:10 killstreak2;
        // offset 0x124a8, size 0x10
        uint:10 killstreak3;
        // offset 0x124b8, size 0x10
        uint:10 killstreak4;
        // offset 0x124c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x124c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x124ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x124cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x58f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50e8, size 0x800
        string(16) customclassname[16];
        // offset 0x58e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_81e1e3998137b2b5"

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
    struct hash_2c79abcce61676aa {
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

    // idx 17 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 18 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e748
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e240, size 0x500
        string(16) customclassname[10];
        // offset 0x1e740, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e741, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e742, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e743, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x124d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11c88, size 0x800
        string(16) customclassname[16];
        // offset 0x12488, size 0x10
        uint:10 killstreak1;
        // offset 0x12498, size 0x10
        uint:10 killstreak2;
        // offset 0x124a8, size 0x10
        uint:10 killstreak3;
        // offset 0x124b8, size 0x10
        uint:10 killstreak4;
        // offset 0x124c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x124c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x124ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x124cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x58f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50e8, size 0x800
        string(16) customclassname[16];
        // offset 0x58e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_88540e812076020b"

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
    struct hash_2c79abcce61676aa {
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

    // idx 17 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 18 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 19 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 20 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 22 members 13 size 0x1e748
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18e40
        character characters[24];
        // offset 0x1cee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d750, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e240, size 0x500
        string(16) customclassname[10];
        // offset 0x1e740, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e741, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e742, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e743, size 0x5
        uint:1 __pad[5];
    };

    // idx 23 members 14 size 0x124d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10980
        character characters[16];
        // offset 0x10a08, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11c88, size 0x800
        string(16) customclassname[16];
        // offset 0x12488, size 0x10
        uint:10 killstreak1;
        // offset 0x12498, size 0x10
        uint:10 killstreak2;
        // offset 0x124a8, size 0x10
        uint:10 killstreak3;
        // offset 0x124b8, size 0x10
        uint:10 killstreak4;
        // offset 0x124c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x124c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x124ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x124cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 10 size 0x58f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4260
        character characters[4];
        // offset 0x42e8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50e8, size 0x800
        string(16) customclassname[16];
        // offset 0x58e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_fceaea723c13a2be"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x24748
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x1ee40
        character characters[24];
        // offset 0x22ee0, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x23750, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x24240, size 0x500
        string(16) customclassname[10];
        // offset 0x24740, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x24741, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x24742, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x24743, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x164d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x14980
        character characters[16];
        // offset 0x14a08, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x15c88, size 0x800
        string(16) customclassname[16];
        // offset 0x16488, size 0x10
        uint:10 killstreak1;
        // offset 0x16498, size 0x10
        uint:10 killstreak2;
        // offset 0x164a8, size 0x10
        uint:10 killstreak3;
        // offset 0x164b8, size 0x10
        uint:10 killstreak4;
        // offset 0x164c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x164c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x164ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x164cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x68f0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x5260
        character characters[4];
        // offset 0x52e8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x60e8, size 0x800
        string(16) customclassname[16];
        // offset 0x68e8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x68e9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x68ea, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x68eb, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_cdca7f9975d91e28"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x245c8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x1ecc0
        character characters[24];
        // offset 0x22d60, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x235d0, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x240c0, size 0x500
        string(16) customclassname[10];
        // offset 0x245c0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x245c1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x245c2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x245c3, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x163d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x14880
        character characters[16];
        // offset 0x14908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x15b88, size 0x800
        string(16) customclassname[16];
        // offset 0x16388, size 0x10
        uint:10 killstreak1;
        // offset 0x16398, size 0x10
        uint:10 killstreak2;
        // offset 0x163a8, size 0x10
        uint:10 killstreak3;
        // offset 0x163b8, size 0x10
        uint:10 killstreak4;
        // offset 0x163c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x163c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x163ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x163cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x68b0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x5220
        character characters[4];
        // offset 0x52a8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x60a8, size 0x800
        string(16) customclassname[16];
        // offset 0x68a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x68a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x68aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x68ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_27704d2a05cb4280"

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
    struct hash_2c79abcce61676aa {
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

    // idx 22 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 23 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 24 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 26 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 27 members 13 size 0x1e5c8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18cc0
        character characters[24];
        // offset 0x1cd60, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d5d0, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e0c0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e5c0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e5c1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e5c2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e5c3, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 14 size 0x123d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11b88, size 0x800
        string(16) customclassname[16];
        // offset 0x12388, size 0x10
        uint:10 killstreak1;
        // offset 0x12398, size 0x10
        uint:10 killstreak2;
        // offset 0x123a8, size 0x10
        uint:10 killstreak3;
        // offset 0x123b8, size 0x10
        uint:10 killstreak4;
        // offset 0x123c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x123c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x123ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x123cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 10 size 0x58b0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4220
        character characters[4];
        // offset 0x42a8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50a8, size 0x800
        string(16) customclassname[16];
        // offset 0x58a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 30 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_afd013b47ec0ec0"

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
    struct hash_2c79abcce61676aa {
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

    // idx 22 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 23 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 24 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 26 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 27 members 13 size 0x1e5c8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18cc0
        character characters[24];
        // offset 0x1cd60, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d5d0, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e0c0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e5c0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e5c1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e5c2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e5c3, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 14 size 0x123d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11b88, size 0x800
        string(16) customclassname[16];
        // offset 0x12388, size 0x10
        uint:10 killstreak1;
        // offset 0x12398, size 0x10
        uint:10 killstreak2;
        // offset 0x123a8, size 0x10
        uint:10 killstreak3;
        // offset 0x123b8, size 0x10
        uint:10 killstreak4;
        // offset 0x123c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x123c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x123ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x123cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 10 size 0x58b0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4220
        character characters[4];
        // offset 0x42a8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50a8, size 0x800
        string(16) customclassname[16];
        // offset 0x58a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 30 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_7f13b750e8fa20b6"

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
    struct hash_2c79abcce61676aa {
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

    // idx 22 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 23 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 24 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 26 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 27 members 13 size 0x1e5c8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0x18cc0
        character characters[24];
        // offset 0x1cd60, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1d5d0, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1e0c0, size 0x500
        string(16) customclassname[10];
        // offset 0x1e5c0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1e5c1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1e5c2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1e5c3, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 14 size 0x123d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11b88, size 0x800
        string(16) customclassname[16];
        // offset 0x12388, size 0x10
        uint:10 killstreak1;
        // offset 0x12398, size 0x10
        uint:10 killstreak2;
        // offset 0x123a8, size 0x10
        uint:10 killstreak3;
        // offset 0x123b8, size 0x10
        uint:10 killstreak4;
        // offset 0x123c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x123c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x123ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x123cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 10 size 0x58b0
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x4220
        character characters[4];
        // offset 0x42a8, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x50a8, size 0x800
        string(16) customclassname[16];
        // offset 0x58a8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x58a9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x58aa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x58ab, size 0x5
        uint:1 __pad[5];
    };

    // idx 30 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_b372bb813ef30842"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x10ee0
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xb5d8
        character characters[11];
        // offset 0xf678, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0xfee8, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x109d8, size 0x500
        string(16) customclassname[10];
        // offset 0x10ed8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10ed9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10eda, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10edb, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x123d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11b88, size 0x800
        string(16) customclassname[16];
        // offset 0x12388, size 0x10
        uint:10 killstreak1;
        // offset 0x12398, size 0x10
        uint:10 killstreak2;
        // offset 0x123a8, size 0x10
        uint:10 killstreak3;
        // offset 0x123b8, size 0x10
        uint:10 killstreak4;
        // offset 0x123c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x123c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x123ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x123cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x11f10
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x11708, size 0x800
        string(16) customclassname[16];
        // offset 0x11f08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11f09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x11f0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x11f0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_c5290005ead2fe47"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x10ee0
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xb5d8
        character characters[11];
        // offset 0xf678, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0xfee8, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x109d8, size 0x500
        string(16) customclassname[10];
        // offset 0x10ed8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10ed9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10eda, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10edb, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x123d0
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x11b88, size 0x800
        string(16) customclassname[16];
        // offset 0x12388, size 0x10
        uint:10 killstreak1;
        // offset 0x12398, size 0x10
        uint:10 killstreak2;
        // offset 0x123a8, size 0x10
        uint:10 killstreak3;
        // offset 0x123b8, size 0x10
        uint:10 killstreak4;
        // offset 0x123c8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x123c9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x123ca, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x123cb, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x11f10
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x10880
        character characters[16];
        // offset 0x10908, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x11708, size 0x800
        string(16) customclassname[16];
        // offset 0x11f08, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11f09, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x11f0a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x11f0b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_666eee994aa06e5"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x11cf8
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xc3f0
        character characters[11];
        // offset 0x10490, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x10d00, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x117f0, size 0x500
        string(16) customclassname[10];
        // offset 0x11cf0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11cf1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x11cf2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x11cf3, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x13850
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x11d00
        character characters[16];
        // offset 0x11d88, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x13008, size 0x800
        string(16) customclassname[16];
        // offset 0x13808, size 0x10
        uint:10 killstreak1;
        // offset 0x13818, size 0x10
        uint:10 killstreak2;
        // offset 0x13828, size 0x10
        uint:10 killstreak3;
        // offset 0x13838, size 0x10
        uint:10 killstreak4;
        // offset 0x13848, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x13849, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1384a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1384b, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x13390
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x11d00
        character characters[16];
        // offset 0x11d88, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x12b88, size 0x800
        string(16) customclassname[16];
        // offset 0x13388, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x13389, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1338a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1338b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_a7a21f1ef40689f2"

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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x11778
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xbe70
        character characters[11];
        // offset 0xff10, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x10780, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x11270, size 0x500
        string(16) customclassname[10];
        // offset 0x11770, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11771, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x11772, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x11773, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x13050
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x11500
        character characters[16];
        // offset 0x11588, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x12808, size 0x800
        string(16) customclassname[16];
        // offset 0x13008, size 0x10
        uint:10 killstreak1;
        // offset 0x13018, size 0x10
        uint:10 killstreak2;
        // offset 0x13028, size 0x10
        uint:10 killstreak3;
        // offset 0x13038, size 0x10
        uint:10 killstreak4;
        // offset 0x13048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x13049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1304a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1304b, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x12b90
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0x11500
        character characters[16];
        // offset 0x11588, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x12388, size 0x800
        string(16) customclassname[16];
        // offset 0x12b88, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x12b89, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x12b8a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x12b8b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_5aab6b3b7426244f"

version 31 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x10178
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xa870
        character characters[11];
        // offset 0xe910, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0xf180, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0xfc70, size 0x500
        string(16) customclassname[10];
        // offset 0x10170, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10171, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10172, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10173, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x11050
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x10808, size 0x800
        string(16) customclassname[16];
        // offset 0x11008, size 0x10
        uint:10 killstreak1;
        // offset 0x11018, size 0x10
        uint:10 killstreak2;
        // offset 0x11028, size 0x10
        uint:10 killstreak3;
        // offset 0x11038, size 0x10
        uint:10 killstreak4;
        // offset 0x11048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1104a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1104b, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x10b90
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x10388, size 0x800
        string(16) customclassname[16];
        // offset 0x10b88, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10b89, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10b8a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10b8b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_616825de39f480e4"

version 30 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x10178
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xa870
        character characters[11];
        // offset 0xe910, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0xf180, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0xfc70, size 0x500
        string(16) customclassname[10];
        // offset 0x10170, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10171, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10172, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10173, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x11050
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x10808, size 0x800
        string(16) customclassname[16];
        // offset 0x11008, size 0x10
        uint:10 killstreak1;
        // offset 0x11018, size 0x10
        uint:10 killstreak2;
        // offset 0x11028, size 0x10
        uint:10 killstreak3;
        // offset 0x11038, size 0x10
        uint:10 killstreak4;
        // offset 0x11048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1104a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1104b, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x10b90
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x10388, size 0x800
        string(16) customclassname[16];
        // offset 0x10b88, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10b89, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10b8a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10b8b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_eaaabb5e89fcf026"

version 29 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 21 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 22 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 23 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 24 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 25 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 26 members 13 size 0x10178
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0x58
        charactercontext charactercontext;
        // offset 0x4080, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x40a0, size 0xa870
        character characters[11];
        // offset 0xe910, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0xf180, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0xfc70, size 0x500
        string(16) customclassname[10];
        // offset 0x10170, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10171, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10172, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10173, size 0x5
        uint:1 __pad[5];
    };

    // idx 27 members 14 size 0x11050
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x10808, size 0x800
        string(16) customclassname[16];
        // offset 0x11008, size 0x10
        uint:10 killstreak1;
        // offset 0x11018, size 0x10
        uint:10 killstreak2;
        // offset 0x11028, size 0x10
        uint:10 killstreak3;
        // offset 0x11038, size 0x10
        uint:10 killstreak4;
        // offset 0x11048, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x11049, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1104a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1104b, size 0x5
        uint:1 __pad[5];
    };

    // idx 28 members 10 size 0x10b90
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x58
        charactercontext charactercontext;
        // offset 0x68, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x88, size 0xf500
        character characters[16];
        // offset 0xf588, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x10388, size 0x800
        string(16) customclassname[16];
        // offset 0x10b88, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x10b89, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x10b8a, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x10b8b, size 0x5
        uint:1 __pad[5];
    };

    // idx 29 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
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

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_66cce41a24ee62bc"

version 28 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 18 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 19 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 14 size 0x1bd00
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0xa78
        charactercontext charactercontext;
        // offset 0x4aa0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x4ac0, size 0x159d0
        character characters[11];
        // offset 0x1a490, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1ad00, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x1ad08, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1b7f8, size 0x500
        string(16) customclassname[10];
        // offset 0x1bcf8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1bcf9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1bcfa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1bcfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 15 size 0x21c78
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0xa78
        charactercontext charactercontext;
        // offset 0xa88, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xaa8, size 0x1f700
        character characters[16];
        // offset 0x201a8, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x201b0, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x21430, size 0x800
        string(16) customclassname[16];
        // offset 0x21c30, size 0x10
        uint:10 killstreak1;
        // offset 0x21c40, size 0x10
        uint:10 killstreak2;
        // offset 0x21c50, size 0x10
        uint:10 killstreak3;
        // offset 0x21c60, size 0x10
        uint:10 killstreak4;
        // offset 0x21c70, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x21c71, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x21c72, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x21c73, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 11 size 0x217b8
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0xa78
        charactercontext charactercontext;
        // offset 0xa88, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xaa8, size 0x1f700
        character characters[16];
        // offset 0x201a8, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x201b0, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x20fb0, size 0x800
        string(16) customclassname[16];
        // offset 0x217b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x217b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x217b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x217b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 4
    enum hash_5446546f71ee6cdf {
        hair, // 0x0,
        helmet, // 0x1,
        body, // 0x2,
        hash_7d030d1323187739, // 0x3
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/class_sets.ddl
// metatable "hash_3dafe6b8df379914"

version 27 {
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
    struct hash_2c79abcce61676aa {
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

    // idx 18 members 5 size 0x60
    struct hash_20631b664715b1fa {
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

    // idx 19 members 8 size 0x128
    struct hash_27580df06d232ed1 {
        // offset 0x0, size 0x8
        uint:5 tacticalgear;
        // offset 0x8, size 0x10
        uint:10 primarygrenade;
        // offset 0x18, size 0x18
        uint:5 bonuscard[3];
        // offset 0x30, size 0x30
        uint:5 talent[6];
        // offset 0x60, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xc0, size 0x60
        hash_2c79abcce61676aa primary;
        // offset 0x120, size 0x1
        bool primarygrenadecount;
        // offset 0x121, size 0x7
        uint:1 __pad[7];
    };

    // idx 20 members 4 size 0xe0
    struct hash_1489c97943984433 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x10
        uint:10 herogadget;
        // offset 0x20, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0x80, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 21 members 6 size 0x118
    struct hash_639e593cf0112829 {
        // offset 0x0, size 0x10
        uint:10 primarygrenade;
        // offset 0x10, size 0x8
        uint:6 talisman1;
        // offset 0x18, size 0x30
        uint:5 specialty[6];
        // offset 0x48, size 0x10
        uint:10 herogadget;
        // offset 0x58, size 0x60
        hash_20631b664715b1fa secondary;
        // offset 0xb8, size 0x60
        hash_2c79abcce61676aa primary;
    };

    // idx 22 members 2 size 0xd8
    struct hash_5fdbf0fb5462cc71 {
        // offset 0x0, size 0x88
        string(17) packname;
        // offset 0x88, size 0x50
        uint:10 bubblegumbuff[5];
    };

    // idx 23 members 14 size 0x1bd00
    struct cacloadoutlistzm_s {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0x8
        int:5 equippedbubblegumpack;
        // offset 0x18, size 0x4010
        variant variant[50];
        // offset 0x4028, size 0xa78
        charactercontext charactercontext;
        // offset 0x4aa0, size 0x20
        uint firstselectedcharacterindex;
        // offset 0x4ac0, size 0x159d0
        character characters[11];
        // offset 0x1a490, size 0x870
        hash_5fdbf0fb5462cc71 bubblegumpack[10];
        // offset 0x1ad00, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x1ad08, size 0xaf0
        hash_639e593cf0112829 customclass[10];
        // offset 0x1b7f8, size 0x500
        string(16) customclassname[10];
        // offset 0x1bcf8, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x1bcf9, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x1bcfa, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x1bcfb, size 0x5
        uint:1 __pad[5];
    };

    // idx 24 members 15 size 0x21c78
    struct hash_71e57d488b0eb24d {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0xa78
        charactercontext charactercontext;
        // offset 0xa88, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xaa8, size 0x1f700
        character characters[16];
        // offset 0x201a8, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x201b0, size 0x1280
        hash_27580df06d232ed1 customclass[16];
        // offset 0x21430, size 0x800
        string(16) customclassname[16];
        // offset 0x21c30, size 0x10
        uint:10 killstreak1;
        // offset 0x21c40, size 0x10
        uint:10 killstreak2;
        // offset 0x21c50, size 0x10
        uint:10 killstreak3;
        // offset 0x21c60, size 0x10
        uint:10 killstreak4;
        // offset 0x21c70, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x21c71, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x21c72, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x21c73, size 0x5
        uint:1 __pad[5];
    };

    // idx 25 members 11 size 0x217b8
    struct hash_31d8d99be94a78b7 {
        // offset 0x0, size 0x10
        uint:10 loadoutversion;
        // offset 0x10, size 0xa78
        charactercontext charactercontext;
        // offset 0xa88, size 0x20
        uint firstselectedcharacterindex;
        // offset 0xaa8, size 0x1f700
        character characters[16];
        // offset 0x201a8, size 0x8
        uint:2 firstselectedloadouttype;
        // offset 0x201b0, size 0xe00
        hash_1489c97943984433 customclass[16];
        // offset 0x20fb0, size 0x800
        string(16) customclassname[16];
        // offset 0x217b0, size 0x1
        bool hash_6daffc8ba44646eb;
        // offset 0x217b1, size 0x1
        bool hash_4a7be35adcdd0183;
        // offset 0x217b2, size 0x1
        bool hash_490318f2d43cdc68;
        // offset 0x217b3, size 0x5
        uint:1 __pad[5];
    };

    // idx 26 members 3 size 0xb48
    struct hash_5814f20693f11787 {
        // offset 0x0, size 0x80
        string(16) classsetname;
        // offset 0x80, size 0x5c8
        hash_27580df06d232ed1 customclass[5];
        // offset 0x648, size 0x500
        string(16) customclassname[10];
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 1 members 4
    enum hash_5446546f71ee6cdf {
        hair, // 0x0,
        helmet, // 0x1,
        body, // 0x2,
        hash_7d030d1323187739, // 0x3
    };

    // idx 2 members 2
    enum hash_7f3085f3cff25119 {
        female, // 0x0,
        male, // 0x1
    };

    // idx 0 members 5 size 0x7100
    // offset 0x0, size 0x20
    int loadoutversion;
    // offset 0x20, size 0x8
    uint:4 custommatchcurrentclasssetindex;
    // offset 0x28, size 0x3868
    hash_5814f20693f11787 custommatchclasssets[5];
    // offset 0x3890, size 0x8
    uint:4 publicmatchcurrentclasssetindex;
    // offset 0x3898, size 0x3868
    hash_5814f20693f11787 publicmatchclasssets[5];
}

