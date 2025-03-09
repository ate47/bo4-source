// gamedata/ddl/generated/player.ddl
// metatable "hash_75db694c19b50ea1"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3340
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2310
    character character;
    // offset 0x2568, size 0x20
    uint paragoniconidwz;
    // offset 0x2588, size 0x20
    uint paragoniconidzm;
    // offset 0x25a8, size 0x20
    uint prestigecp;
    // offset 0x25c8, size 0x20
    uint prestigewz;
    // offset 0x25e8, size 0x20
    uint prestigezm;
    // offset 0x2608, size 0x120
    byte scenpid[36];
    // offset 0x2728, size 0x560
    variant showcaseweapons[4];
    // offset 0x2c88, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2ca8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2e68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x3048, size 0x200
    string(64) primarygroupname;
    // offset 0x3248, size 0x20
    uint prestige;
    // offset 0x3268, size 0x40
    uint64 primarygroupid;
    // offset 0x32a8, size 0x20
    int lobbydlcbits;
    // offset 0x32c8, size 0x20
    uint rankcp;
    // offset 0x32e8, size 0x20
    uint rankwz;
    // offset 0x3308, size 0x20
    uint rankzm;
    // offset 0x3328, size 0x10
    uint:10 backgroundid;
    // offset 0x3338, size 0x1
    bool haseverbootedgame;
    // offset 0x3339, size 0x1
    bool haseverplayed;
    // offset 0x333a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_d28b488259f507d9"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3340
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2310
    character character;
    // offset 0x2568, size 0x20
    uint paragoniconidwz;
    // offset 0x2588, size 0x20
    uint paragoniconidzm;
    // offset 0x25a8, size 0x20
    uint prestigecp;
    // offset 0x25c8, size 0x20
    uint prestigewz;
    // offset 0x25e8, size 0x20
    uint prestigezm;
    // offset 0x2608, size 0x120
    byte scenpid[36];
    // offset 0x2728, size 0x560
    variant showcaseweapons[4];
    // offset 0x2c88, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2ca8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2e68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x3048, size 0x200
    string(64) primarygroupname;
    // offset 0x3248, size 0x20
    uint prestige;
    // offset 0x3268, size 0x40
    uint64 primarygroupid;
    // offset 0x32a8, size 0x20
    int lobbydlcbits;
    // offset 0x32c8, size 0x20
    uint rankcp;
    // offset 0x32e8, size 0x20
    uint rankwz;
    // offset 0x3308, size 0x20
    uint rankzm;
    // offset 0x3328, size 0x10
    uint:10 backgroundid;
    // offset 0x3338, size 0x1
    bool haseverbootedgame;
    // offset 0x3339, size 0x1
    bool haseverplayed;
    // offset 0x333a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_95081bff4ad8c62"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2010
    character character;
    // offset 0x2268, size 0x20
    uint paragoniconidwz;
    // offset 0x2288, size 0x20
    uint paragoniconidzm;
    // offset 0x22a8, size 0x20
    uint prestigecp;
    // offset 0x22c8, size 0x20
    uint prestigewz;
    // offset 0x22e8, size 0x20
    uint prestigezm;
    // offset 0x2308, size 0x120
    byte scenpid[36];
    // offset 0x2428, size 0x560
    variant showcaseweapons[4];
    // offset 0x2988, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x29a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2b68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2d48, size 0x200
    string(64) primarygroupname;
    // offset 0x2f48, size 0x20
    uint prestige;
    // offset 0x2f68, size 0x40
    uint64 primarygroupid;
    // offset 0x2fa8, size 0x20
    int lobbydlcbits;
    // offset 0x2fc8, size 0x20
    uint rankcp;
    // offset 0x2fe8, size 0x20
    uint rankwz;
    // offset 0x3008, size 0x20
    uint rankzm;
    // offset 0x3028, size 0x10
    uint:10 backgroundid;
    // offset 0x3038, size 0x1
    bool haseverbootedgame;
    // offset 0x3039, size 0x1
    bool haseverplayed;
    // offset 0x303a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ba039ece937f107d"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2010
    character character;
    // offset 0x2268, size 0x20
    uint paragoniconidwz;
    // offset 0x2288, size 0x20
    uint paragoniconidzm;
    // offset 0x22a8, size 0x20
    uint prestigecp;
    // offset 0x22c8, size 0x20
    uint prestigewz;
    // offset 0x22e8, size 0x20
    uint prestigezm;
    // offset 0x2308, size 0x120
    byte scenpid[36];
    // offset 0x2428, size 0x560
    variant showcaseweapons[4];
    // offset 0x2988, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x29a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2b68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2d48, size 0x200
    string(64) primarygroupname;
    // offset 0x2f48, size 0x20
    uint prestige;
    // offset 0x2f68, size 0x40
    uint64 primarygroupid;
    // offset 0x2fa8, size 0x20
    int lobbydlcbits;
    // offset 0x2fc8, size 0x20
    uint rankcp;
    // offset 0x2fe8, size 0x20
    uint rankwz;
    // offset 0x3008, size 0x20
    uint rankzm;
    // offset 0x3028, size 0x10
    uint:10 backgroundid;
    // offset 0x3038, size 0x1
    bool haseverbootedgame;
    // offset 0x3039, size 0x1
    bool haseverplayed;
    // offset 0x303a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_e2caa6a6a0fa6ff2"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2010
    character character;
    // offset 0x2268, size 0x20
    uint paragoniconidwz;
    // offset 0x2288, size 0x20
    uint paragoniconidzm;
    // offset 0x22a8, size 0x20
    uint prestigecp;
    // offset 0x22c8, size 0x20
    uint prestigewz;
    // offset 0x22e8, size 0x20
    uint prestigezm;
    // offset 0x2308, size 0x120
    byte scenpid[36];
    // offset 0x2428, size 0x560
    variant showcaseweapons[4];
    // offset 0x2988, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x29a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2b68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2d48, size 0x200
    string(64) primarygroupname;
    // offset 0x2f48, size 0x20
    uint prestige;
    // offset 0x2f68, size 0x40
    uint64 primarygroupid;
    // offset 0x2fa8, size 0x20
    int lobbydlcbits;
    // offset 0x2fc8, size 0x20
    uint rankcp;
    // offset 0x2fe8, size 0x20
    uint rankwz;
    // offset 0x3008, size 0x20
    uint rankzm;
    // offset 0x3028, size 0x10
    uint:10 backgroundid;
    // offset 0x3038, size 0x1
    bool haseverbootedgame;
    // offset 0x3039, size 0x1
    bool haseverplayed;
    // offset 0x303a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_93519ea9347303cb"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2010
    character character;
    // offset 0x2268, size 0x20
    uint paragoniconidwz;
    // offset 0x2288, size 0x20
    uint paragoniconidzm;
    // offset 0x22a8, size 0x20
    uint prestigecp;
    // offset 0x22c8, size 0x20
    uint prestigewz;
    // offset 0x22e8, size 0x20
    uint prestigezm;
    // offset 0x2308, size 0x120
    byte scenpid[36];
    // offset 0x2428, size 0x560
    variant showcaseweapons[4];
    // offset 0x2988, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x29a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2b68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2d48, size 0x200
    string(64) primarygroupname;
    // offset 0x2f48, size 0x20
    uint prestige;
    // offset 0x2f68, size 0x40
    uint64 primarygroupid;
    // offset 0x2fa8, size 0x20
    int lobbydlcbits;
    // offset 0x2fc8, size 0x20
    uint rankcp;
    // offset 0x2fe8, size 0x20
    uint rankwz;
    // offset 0x3008, size 0x20
    uint rankzm;
    // offset 0x3028, size 0x10
    uint:10 backgroundid;
    // offset 0x3038, size 0x1
    bool haseverbootedgame;
    // offset 0x3039, size 0x1
    bool haseverplayed;
    // offset 0x303a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_2802315c76767166"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x3040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x2010
    character character;
    // offset 0x2268, size 0x20
    uint paragoniconidwz;
    // offset 0x2288, size 0x20
    uint paragoniconidzm;
    // offset 0x22a8, size 0x20
    uint prestigecp;
    // offset 0x22c8, size 0x20
    uint prestigewz;
    // offset 0x22e8, size 0x20
    uint prestigezm;
    // offset 0x2308, size 0x120
    byte scenpid[36];
    // offset 0x2428, size 0x560
    variant showcaseweapons[4];
    // offset 0x2988, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x29a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2b68, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2d48, size 0x200
    string(64) primarygroupname;
    // offset 0x2f48, size 0x20
    uint prestige;
    // offset 0x2f68, size 0x40
    uint64 primarygroupid;
    // offset 0x2fa8, size 0x20
    int lobbydlcbits;
    // offset 0x2fc8, size 0x20
    uint rankcp;
    // offset 0x2fe8, size 0x20
    uint rankwz;
    // offset 0x3008, size 0x20
    uint rankzm;
    // offset 0x3028, size 0x10
    uint:10 backgroundid;
    // offset 0x3038, size 0x1
    bool haseverbootedgame;
    // offset 0x3039, size 0x1
    bool haseverplayed;
    // offset 0x303a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ee8678886be66d39"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 36 size 0x2840
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x1810
    character character;
    // offset 0x1a68, size 0x20
    uint paragoniconidwz;
    // offset 0x1a88, size 0x20
    uint paragoniconidzm;
    // offset 0x1aa8, size 0x20
    uint prestigecp;
    // offset 0x1ac8, size 0x20
    uint prestigewz;
    // offset 0x1ae8, size 0x20
    uint prestigezm;
    // offset 0x1b08, size 0x120
    byte scenpid[36];
    // offset 0x1c28, size 0x560
    variant showcaseweapons[4];
    // offset 0x2188, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x21a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2368, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2548, size 0x200
    string(64) primarygroupname;
    // offset 0x2748, size 0x20
    uint prestige;
    // offset 0x2768, size 0x40
    uint64 primarygroupid;
    // offset 0x27a8, size 0x20
    int lobbydlcbits;
    // offset 0x27c8, size 0x20
    uint rankcp;
    // offset 0x27e8, size 0x20
    uint rankwz;
    // offset 0x2808, size 0x20
    uint rankzm;
    // offset 0x2828, size 0x10
    uint:10 backgroundid;
    // offset 0x2838, size 0x1
    bool haseverbootedgame;
    // offset 0x2839, size 0x1
    bool haseverplayed;
    // offset 0x283a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_e378eda968c13f26"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x2820
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x1810
    character character;
    // offset 0x1a68, size 0x20
    uint paragoniconidwz;
    // offset 0x1a88, size 0x20
    uint paragoniconidzm;
    // offset 0x1aa8, size 0x20
    uint prestigecp;
    // offset 0x1ac8, size 0x20
    uint prestigewz;
    // offset 0x1ae8, size 0x20
    uint prestigezm;
    // offset 0x1b08, size 0x120
    byte scenpid[36];
    // offset 0x1c28, size 0x560
    variant showcaseweapons[4];
    // offset 0x2188, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x21a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2368, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2548, size 0x200
    string(64) primarygroupname;
    // offset 0x2748, size 0x20
    uint prestige;
    // offset 0x2768, size 0x40
    uint64 primarygroupid;
    // offset 0x27a8, size 0x20
    uint rankcp;
    // offset 0x27c8, size 0x20
    uint rankwz;
    // offset 0x27e8, size 0x20
    uint rankzm;
    // offset 0x2808, size 0x10
    uint:10 backgroundid;
    // offset 0x2818, size 0x1
    bool haseverbootedgame;
    // offset 0x2819, size 0x1
    bool haseverplayed;
    // offset 0x281a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_50ff4338de2b69fc"

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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x2850
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x1840
    character character;
    // offset 0x1a98, size 0x20
    uint paragoniconidwz;
    // offset 0x1ab8, size 0x20
    uint paragoniconidzm;
    // offset 0x1ad8, size 0x20
    uint prestigecp;
    // offset 0x1af8, size 0x20
    uint prestigewz;
    // offset 0x1b18, size 0x20
    uint prestigezm;
    // offset 0x1b38, size 0x120
    byte scenpid[36];
    // offset 0x1c58, size 0x560
    variant showcaseweapons[4];
    // offset 0x21b8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x21d8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2398, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2578, size 0x200
    string(64) primarygroupname;
    // offset 0x2778, size 0x20
    uint prestige;
    // offset 0x2798, size 0x40
    uint64 primarygroupid;
    // offset 0x27d8, size 0x20
    uint rankcp;
    // offset 0x27f8, size 0x20
    uint rankwz;
    // offset 0x2818, size 0x20
    uint rankzm;
    // offset 0x2838, size 0x10
    uint:10 backgroundid;
    // offset 0x2848, size 0x1
    bool haseverbootedgame;
    // offset 0x2849, size 0x1
    bool haseverplayed;
    // offset 0x284a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ed988782ae3e1de"

version 48 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x28e0
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x18d0
    character character;
    // offset 0x1b28, size 0x20
    uint paragoniconidwz;
    // offset 0x1b48, size 0x20
    uint paragoniconidzm;
    // offset 0x1b68, size 0x20
    uint prestigecp;
    // offset 0x1b88, size 0x20
    uint prestigewz;
    // offset 0x1ba8, size 0x20
    uint prestigezm;
    // offset 0x1bc8, size 0x120
    byte scenpid[36];
    // offset 0x1ce8, size 0x560
    variant showcaseweapons[4];
    // offset 0x2248, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2268, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2428, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2608, size 0x200
    string(64) primarygroupname;
    // offset 0x2808, size 0x20
    uint prestige;
    // offset 0x2828, size 0x40
    uint64 primarygroupid;
    // offset 0x2868, size 0x20
    uint rankcp;
    // offset 0x2888, size 0x20
    uint rankwz;
    // offset 0x28a8, size 0x20
    uint rankzm;
    // offset 0x28c8, size 0x10
    uint:10 backgroundid;
    // offset 0x28d8, size 0x1
    bool haseverbootedgame;
    // offset 0x28d9, size 0x1
    bool haseverplayed;
    // offset 0x28da, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_19810636f2d79715"

version 47 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 2 size 0x80
    struct arenastats {
        // offset 0x0, size 0x20
        float performancevalue;
        // offset 0x20, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x28e0
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankwz;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x18d0
    character character;
    // offset 0x1b28, size 0x20
    uint paragoniconidwz;
    // offset 0x1b48, size 0x20
    uint paragoniconidzm;
    // offset 0x1b68, size 0x20
    uint prestigecp;
    // offset 0x1b88, size 0x20
    uint prestigewz;
    // offset 0x1ba8, size 0x20
    uint prestigezm;
    // offset 0x1bc8, size 0x120
    byte scenpid[36];
    // offset 0x1ce8, size 0x560
    variant showcaseweapons[4];
    // offset 0x2248, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2268, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2428, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2608, size 0x200
    string(64) primarygroupname;
    // offset 0x2808, size 0x20
    uint prestige;
    // offset 0x2828, size 0x40
    uint64 primarygroupid;
    // offset 0x2868, size 0x20
    uint rankcp;
    // offset 0x2888, size 0x20
    uint rankwz;
    // offset 0x28a8, size 0x20
    uint rankzm;
    // offset 0x28c8, size 0x10
    uint:10 backgroundid;
    // offset 0x28d8, size 0x1
    bool haseverbootedgame;
    // offset 0x28d9, size 0x1
    bool haseverplayed;
    // offset 0x28da, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_d3e59d63953895e1"

version 46 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x60
    struct arenastats {
        // offset 0x0, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x28c0
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x60
    arenastats arenabest;
    // offset 0x160, size 0x20
    uint paragoniconid;
    // offset 0x180, size 0x58
    charactercontext charactercontext;
    // offset 0x1d8, size 0x20
    uint paragonrank;
    // offset 0x1f8, size 0x20
    uint paragonrankwz;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x18d0
    character character;
    // offset 0x1b08, size 0x20
    uint paragoniconidwz;
    // offset 0x1b28, size 0x20
    uint paragoniconidzm;
    // offset 0x1b48, size 0x20
    uint prestigecp;
    // offset 0x1b68, size 0x20
    uint prestigewz;
    // offset 0x1b88, size 0x20
    uint prestigezm;
    // offset 0x1ba8, size 0x120
    byte scenpid[36];
    // offset 0x1cc8, size 0x560
    variant showcaseweapons[4];
    // offset 0x2228, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2248, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2408, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x25e8, size 0x200
    string(64) primarygroupname;
    // offset 0x27e8, size 0x20
    uint prestige;
    // offset 0x2808, size 0x40
    uint64 primarygroupid;
    // offset 0x2848, size 0x20
    uint rankcp;
    // offset 0x2868, size 0x20
    uint rankwz;
    // offset 0x2888, size 0x20
    uint rankzm;
    // offset 0x28a8, size 0x10
    uint:10 backgroundid;
    // offset 0x28b8, size 0x1
    bool haseverbootedgame;
    // offset 0x28b9, size 0x1
    bool haseverplayed;
    // offset 0x28ba, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_67e86e0b4050de1e"

version 45 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x60
    struct arenastats {
        // offset 0x0, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 35 size 0x2880
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x60
    arenastats arenabest;
    // offset 0x160, size 0x20
    uint paragoniconid;
    // offset 0x180, size 0x58
    charactercontext charactercontext;
    // offset 0x1d8, size 0x20
    uint paragonrank;
    // offset 0x1f8, size 0x20
    uint paragonrankwz;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x18d0
    character character;
    // offset 0x1b08, size 0x20
    uint paragoniconidwz;
    // offset 0x1b28, size 0x20
    uint paragoniconidzm;
    // offset 0x1b48, size 0x20
    uint prestigecp;
    // offset 0x1b68, size 0x20
    uint prestigewz;
    // offset 0x1b88, size 0x20
    uint prestigezm;
    // offset 0x1ba8, size 0x120
    byte scenpid[36];
    // offset 0x1cc8, size 0x520
    variant showcaseweapons[4];
    // offset 0x21e8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2208, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x23c8, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x25a8, size 0x200
    string(64) primarygroupname;
    // offset 0x27a8, size 0x20
    uint prestige;
    // offset 0x27c8, size 0x40
    uint64 primarygroupid;
    // offset 0x2808, size 0x20
    uint rankcp;
    // offset 0x2828, size 0x20
    uint rankwz;
    // offset 0x2848, size 0x20
    uint rankzm;
    // offset 0x2868, size 0x10
    uint:10 backgroundid;
    // offset 0x2878, size 0x1
    bool haseverbootedgame;
    // offset 0x2879, size 0x1
    bool haseverplayed;
    // offset 0x287a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_6eda1d0ff04686d3"

version 44 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 6 size 0x60
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x10
        short bestsubdivisionrank;
        // offset 0x10, size 0x10
        short firstsubdivisionrankstreak;
        // offset 0x20, size 0x10
        short bestcurrenteventgamestreak;
        // offset 0x30, size 0x10
        short bestfirstsubdivisionrankstreak;
        // offset 0x40, size 0x10
        short points;
        // offset 0x50, size 0x10
        short firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x60
    struct arenastats {
        // offset 0x0, size 0x60
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2820
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x60
    arenastats arenabest;
    // offset 0x160, size 0x20
    uint paragoniconid;
    // offset 0x180, size 0x58
    charactercontext charactercontext;
    // offset 0x1d8, size 0x20
    uint paragonrank;
    // offset 0x1f8, size 0x20
    uint paragonrankzm;
    // offset 0x218, size 0x18d0
    character character;
    // offset 0x1ae8, size 0x20
    uint paragoniconidzm;
    // offset 0x1b08, size 0x20
    uint prestigecp;
    // offset 0x1b28, size 0x20
    uint prestigezm;
    // offset 0x1b48, size 0x120
    byte scenpid[36];
    // offset 0x1c68, size 0x520
    variant showcaseweapons[4];
    // offset 0x2188, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x21a8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2368, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2548, size 0x200
    string(64) primarygroupname;
    // offset 0x2748, size 0x20
    uint prestige;
    // offset 0x2768, size 0x40
    uint64 primarygroupid;
    // offset 0x27a8, size 0x20
    uint rankcp;
    // offset 0x27c8, size 0x20
    uint rankwz;
    // offset 0x27e8, size 0x20
    uint rankzm;
    // offset 0x2808, size 0x10
    uint:10 backgroundid;
    // offset 0x2818, size 0x1
    bool haseverbootedgame;
    // offset 0x2819, size 0x1
    bool haseverplayed;
    // offset 0x281a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_fa3c01a684d9bd8"

version 43 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 4 size 0x80
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x80
    struct arenastats {
        // offset 0x0, size 0x80
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2840
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x18d0
    character character;
    // offset 0x1b08, size 0x20
    uint paragoniconidzm;
    // offset 0x1b28, size 0x20
    uint prestigecp;
    // offset 0x1b48, size 0x20
    uint prestigezm;
    // offset 0x1b68, size 0x120
    byte scenpid[36];
    // offset 0x1c88, size 0x520
    variant showcaseweapons[4];
    // offset 0x21a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x21c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2388, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2568, size 0x200
    string(64) primarygroupname;
    // offset 0x2768, size 0x20
    uint prestige;
    // offset 0x2788, size 0x40
    uint64 primarygroupid;
    // offset 0x27c8, size 0x20
    uint rankcp;
    // offset 0x27e8, size 0x20
    uint rankwz;
    // offset 0x2808, size 0x20
    uint rankzm;
    // offset 0x2828, size 0x10
    uint:10 backgroundid;
    // offset 0x2838, size 0x1
    bool haseverbootedgame;
    // offset 0x2839, size 0x1
    bool haseverplayed;
    // offset 0x283a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_fb7a63d56de40823"

version 42 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 4 size 0x80
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x80
    struct arenastats {
        // offset 0x0, size 0x80
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x10d0
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankwz;
    // offset 0x2008, size 0x20
    uint rankzm;
    // offset 0x2028, size 0x10
    uint:10 backgroundid;
    // offset 0x2038, size 0x1
    bool haseverbootedgame;
    // offset 0x2039, size 0x1
    bool haseverplayed;
    // offset 0x203a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_eb7b046abfd4e72c"

version 41 {
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

    // idx 17 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 18 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 19 members 4 size 0x80
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
    };

    // idx 20 members 1 size 0x80
    struct arenastats {
        // offset 0x0, size 0x80
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 21 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x10d0
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankwz;
    // offset 0x2008, size 0x20
    uint rankzm;
    // offset 0x2028, size 0x10
    uint:10 backgroundid;
    // offset 0x2038, size 0x1
    bool haseverbootedgame;
    // offset 0x2039, size 0x1
    bool haseverplayed;
    // offset 0x203a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_b5614178ecf29dd3"

version 40 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 4 size 0x80
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
    };

    // idx 19 members 1 size 0x80
    struct arenastats {
        // offset 0x0, size 0x80
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 20 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x80
    arenastats arenabest;
    // offset 0x180, size 0x20
    uint paragoniconid;
    // offset 0x1a0, size 0x58
    charactercontext charactercontext;
    // offset 0x1f8, size 0x20
    uint paragonrank;
    // offset 0x218, size 0x20
    uint paragonrankzm;
    // offset 0x238, size 0x10a0
    character character;
    // offset 0x12d8, size 0x20
    uint paragoniconidzm;
    // offset 0x12f8, size 0x20
    uint prestigecp;
    // offset 0x1318, size 0x20
    uint prestigezm;
    // offset 0x1338, size 0x120
    byte scenpid[36];
    // offset 0x1458, size 0x520
    variant showcaseweapons[4];
    // offset 0x1978, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1998, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b58, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d38, size 0x200
    string(64) primarygroupname;
    // offset 0x1f38, size 0x20
    uint prestige;
    // offset 0x1f58, size 0x40
    uint64 primarygroupid;
    // offset 0x1f98, size 0x20
    uint rankcp;
    // offset 0x1fb8, size 0x20
    uint rankwz;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverbootedgame;
    // offset 0x2009, size 0x1
    bool haseverplayed;
    // offset 0x200a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_753c3048ced0bdc5"

version 39 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 5 size 0xa0
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
        // offset 0x80, size 0x20
        uint winstreak;
    };

    // idx 19 members 1 size 0xa0
    struct arenastats {
        // offset 0x0, size 0xa0
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 20 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2030
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0xa0
    arenastats arenabest;
    // offset 0x1a0, size 0x20
    uint paragoniconid;
    // offset 0x1c0, size 0x58
    charactercontext charactercontext;
    // offset 0x218, size 0x20
    uint paragonrank;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x10a0
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankwz;
    // offset 0x1ff8, size 0x20
    uint rankzm;
    // offset 0x2018, size 0x10
    uint:10 backgroundid;
    // offset 0x2028, size 0x1
    bool haseverbootedgame;
    // offset 0x2029, size 0x1
    bool haseverplayed;
    // offset 0x202a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_fcf8933b7d1c3ae6"

version 38 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 5 size 0xa0
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
        // offset 0x80, size 0x20
        uint winstreak;
    };

    // idx 19 members 1 size 0xa0
    struct arenastats {
        // offset 0x0, size 0xa0
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 20 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2030
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0xa0
    arenastats arenabest;
    // offset 0x1a0, size 0x20
    uint paragoniconid;
    // offset 0x1c0, size 0x58
    charactercontext charactercontext;
    // offset 0x218, size 0x20
    uint paragonrank;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0x10a0
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankwz;
    // offset 0x1ff8, size 0x20
    uint rankzm;
    // offset 0x2018, size 0x10
    uint:10 backgroundid;
    // offset 0x2028, size 0x1
    bool haseverbootedgame;
    // offset 0x2029, size 0x1
    bool haseverplayed;
    // offset 0x202a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_e70aeef9f40f2ffb"

version 37 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 5 size 0xa0
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x20
        uint points;
        // offset 0x60, size 0x20
        uint firstsubdivisionranktotal;
        // offset 0x80, size 0x20
        uint winstreak;
    };

    // idx 19 members 1 size 0xa0
    struct arenastats {
        // offset 0x0, size 0xa0
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 20 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x1c28
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0xa0
    arenastats arenabest;
    // offset 0x1a0, size 0x20
    uint paragoniconid;
    // offset 0x1c0, size 0x58
    charactercontext charactercontext;
    // offset 0x218, size 0x20
    uint paragonrank;
    // offset 0x238, size 0x20
    uint paragonrankzm;
    // offset 0x258, size 0xc98
    character character;
    // offset 0xef0, size 0x20
    uint paragoniconidzm;
    // offset 0xf10, size 0x20
    uint prestigecp;
    // offset 0xf30, size 0x20
    uint prestigezm;
    // offset 0xf50, size 0x120
    byte scenpid[36];
    // offset 0x1070, size 0x520
    variant showcaseweapons[4];
    // offset 0x1590, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x15b0, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1770, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1950, size 0x200
    string(64) primarygroupname;
    // offset 0x1b50, size 0x20
    uint prestige;
    // offset 0x1b70, size 0x40
    uint64 primarygroupid;
    // offset 0x1bb0, size 0x20
    uint rankcp;
    // offset 0x1bd0, size 0x20
    uint rankwz;
    // offset 0x1bf0, size 0x20
    uint rankzm;
    // offset 0x1c10, size 0x10
    uint:10 backgroundid;
    // offset 0x1c20, size 0x1
    bool haseverbootedgame;
    // offset 0x1c21, size 0x1
    bool haseverplayed;
    // offset 0x1c22, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_803ff572bb52bd15"

version 36 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x1c40
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0xc98
    character character;
    // offset 0xf08, size 0x20
    uint paragoniconidzm;
    // offset 0xf28, size 0x20
    uint prestigecp;
    // offset 0xf48, size 0x20
    uint prestigezm;
    // offset 0xf68, size 0x120
    byte scenpid[36];
    // offset 0x1088, size 0x520
    variant showcaseweapons[4];
    // offset 0x15a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x15c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1788, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1968, size 0x200
    string(64) primarygroupname;
    // offset 0x1b68, size 0x20
    uint prestige;
    // offset 0x1b88, size 0x40
    uint64 primarygroupid;
    // offset 0x1bc8, size 0x20
    uint rankcp;
    // offset 0x1be8, size 0x20
    uint rankwz;
    // offset 0x1c08, size 0x20
    uint rankzm;
    // offset 0x1c28, size 0x10
    uint:10 backgroundid;
    // offset 0x1c38, size 0x1
    bool haseverbootedgame;
    // offset 0x1c39, size 0x1
    bool haseverplayed;
    // offset 0x1c3a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_8a1a6c0747873ed"

version 35 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x1c40
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0xc98
    character character;
    // offset 0xf08, size 0x20
    uint paragoniconidzm;
    // offset 0xf28, size 0x20
    uint prestigecp;
    // offset 0xf48, size 0x20
    uint prestigezm;
    // offset 0xf68, size 0x120
    byte scenpid[36];
    // offset 0x1088, size 0x520
    variant showcaseweapons[4];
    // offset 0x15a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x15c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1788, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1968, size 0x200
    string(64) primarygroupname;
    // offset 0x1b68, size 0x20
    uint prestige;
    // offset 0x1b88, size 0x40
    uint64 primarygroupid;
    // offset 0x1bc8, size 0x20
    uint rankcp;
    // offset 0x1be8, size 0x20
    uint rankwz;
    // offset 0x1c08, size 0x20
    uint rankzm;
    // offset 0x1c28, size 0x10
    uint:10 backgroundid;
    // offset 0x1c38, size 0x1
    bool haseverbootedgame;
    // offset 0x1c39, size 0x1
    bool haseverplayed;
    // offset 0x1c3a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ab37e8d433a72d11"

version 34 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankwz;
    // offset 0x2008, size 0x20
    uint rankzm;
    // offset 0x2028, size 0x10
    uint:10 backgroundid;
    // offset 0x2038, size 0x1
    bool haseverbootedgame;
    // offset 0x2039, size 0x1
    bool haseverplayed;
    // offset 0x203a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_a5526a36c529fdf6"

version 33 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 32 size 0x2040
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankwz;
    // offset 0x2008, size 0x20
    uint rankzm;
    // offset 0x2028, size 0x10
    uint:10 backgroundid;
    // offset 0x2038, size 0x1
    bool haseverbootedgame;
    // offset 0x2039, size 0x1
    bool haseverplayed;
    // offset 0x203a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_4af662c4ff4cc658"

version 32 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2020
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankzm;
    // offset 0x2008, size 0x10
    uint:10 backgroundid;
    // offset 0x2018, size 0x1
    bool haseverbootedgame;
    // offset 0x2019, size 0x1
    bool haseverplayed;
    // offset 0x201a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_f709f5517331f1bf"

version 31 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2020
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankzm;
    // offset 0x2008, size 0x10
    uint:10 backgroundid;
    // offset 0x2018, size 0x1
    bool haseverbootedgame;
    // offset 0x2019, size 0x1
    bool haseverplayed;
    // offset 0x201a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_dd57540c81b1cc74"

version 30 {
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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2020
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankzm;
    // offset 0x2008, size 0x10
    uint:10 backgroundid;
    // offset 0x2018, size 0x1
    bool haseverbootedgame;
    // offset 0x2019, size 0x1
    bool haseverplayed;
    // offset 0x201a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_d2647a1de3d38349"

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

    // idx 16 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 17 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2020
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1098
    character character;
    // offset 0x1308, size 0x20
    uint paragoniconidzm;
    // offset 0x1328, size 0x20
    uint prestigecp;
    // offset 0x1348, size 0x20
    uint prestigezm;
    // offset 0x1368, size 0x120
    byte scenpid[36];
    // offset 0x1488, size 0x520
    variant showcaseweapons[4];
    // offset 0x19a8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19c8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d68, size 0x200
    string(64) primarygroupname;
    // offset 0x1f68, size 0x20
    uint prestige;
    // offset 0x1f88, size 0x40
    uint64 primarygroupid;
    // offset 0x1fc8, size 0x20
    uint rankcp;
    // offset 0x1fe8, size 0x20
    uint rankzm;
    // offset 0x2008, size 0x10
    uint:10 backgroundid;
    // offset 0x2018, size 0x1
    bool haseverbootedgame;
    // offset 0x2019, size 0x1
    bool haseverplayed;
    // offset 0x201a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_5a58cb7ffce98393"

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

    // idx 20 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 21 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 22 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 23 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2420
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1498
    character character;
    // offset 0x1708, size 0x20
    uint paragoniconidzm;
    // offset 0x1728, size 0x20
    uint prestigecp;
    // offset 0x1748, size 0x20
    uint prestigezm;
    // offset 0x1768, size 0x120
    byte scenpid[36];
    // offset 0x1888, size 0x520
    variant showcaseweapons[4];
    // offset 0x1da8, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1dc8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1f88, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2168, size 0x200
    string(64) primarygroupname;
    // offset 0x2368, size 0x20
    uint prestige;
    // offset 0x2388, size 0x40
    uint64 primarygroupid;
    // offset 0x23c8, size 0x20
    uint rankcp;
    // offset 0x23e8, size 0x20
    uint rankzm;
    // offset 0x2408, size 0x10
    uint:10 backgroundid;
    // offset 0x2418, size 0x1
    bool haseverbootedgame;
    // offset 0x2419, size 0x1
    bool haseverplayed;
    // offset 0x241a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_6b0941546b63ad8"

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

    // idx 20 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 21 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 22 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 23 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2410
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1488
    character character;
    // offset 0x16f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1718, size 0x20
    uint prestigecp;
    // offset 0x1738, size 0x20
    uint prestigezm;
    // offset 0x1758, size 0x120
    byte scenpid[36];
    // offset 0x1878, size 0x520
    variant showcaseweapons[4];
    // offset 0x1d98, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1db8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1f78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x2158, size 0x200
    string(64) primarygroupname;
    // offset 0x2358, size 0x20
    uint prestige;
    // offset 0x2378, size 0x40
    uint64 primarygroupid;
    // offset 0x23b8, size 0x20
    uint rankcp;
    // offset 0x23d8, size 0x20
    uint rankzm;
    // offset 0x23f8, size 0x10
    uint:10 backgroundid;
    // offset 0x2408, size 0x1
    bool haseverbootedgame;
    // offset 0x2409, size 0x1
    bool haseverplayed;
    // offset 0x240a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_185414fdd9fe3733"

version 26 {
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

    // idx 21 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 22 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 23 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 24 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 31 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverbootedgame;
    // offset 0x2009, size 0x1
    bool haseverplayed;
    // offset 0x200a, size 0x6
    uint:1 __pad[6];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ce3fee8f63cb1edd"

version 25 {
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

    // idx 21 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 22 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 23 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 24 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverplayed;
    // offset 0x2009, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_394ad497903b889a"

version 24 {
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

    // idx 21 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 22 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 23 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 24 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverplayed;
    // offset 0x2009, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_eb196cd0e95a9d87"

version 23 {
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

    // idx 21 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 22 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 23 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 24 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverplayed;
    // offset 0x2009, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_451ba93bf3d90d39"

version 22 {
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

    // idx 20 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 21 members 5 size 0x1e0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        xhash medalstatname;
        // offset 0x100, size 0x40
        uint64 screenshotfileid;
        // offset 0x140, size 0x80
        string(16) screenshotfilename;
        // offset 0x1c0, size 0x20
        int screenshotfilesize;
    };

    // idx 22 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 23 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x2010
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1e0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d58, size 0x200
    string(64) primarygroupname;
    // offset 0x1f58, size 0x20
    uint prestige;
    // offset 0x1f78, size 0x40
    uint64 primarygroupid;
    // offset 0x1fb8, size 0x20
    uint rankcp;
    // offset 0x1fd8, size 0x20
    uint rankzm;
    // offset 0x1ff8, size 0x10
    uint:10 backgroundid;
    // offset 0x2008, size 0x1
    bool haseverplayed;
    // offset 0x2009, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_d43c122255c3e077"

version 21 {
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

    // idx 20 members 1 size 0x30
    struct hash_70febf3d5022ab6c {
        // offset 0x0, size 0x30
        uint:10 backgroundids[3];
    };

    // idx 21 members 4 size 0x1a0
    struct combatrecordinfo {
        // offset 0x0, size 0xc0
        hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
        // offset 0xc0, size 0x40
        uint64 screenshotfileid;
        // offset 0x100, size 0x80
        string(16) screenshotfilename;
        // offset 0x180, size 0x20
        int screenshotfilesize;
    };

    // idx 22 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 23 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x1fd0
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x1a0
    combatrecordinfo combatrecordinfo;
    // offset 0x1d18, size 0x200
    string(64) primarygroupname;
    // offset 0x1f18, size 0x20
    uint prestige;
    // offset 0x1f38, size 0x40
    uint64 primarygroupid;
    // offset 0x1f78, size 0x20
    uint rankcp;
    // offset 0x1f98, size 0x20
    uint rankzm;
    // offset 0x1fb8, size 0x10
    uint:10 backgroundid;
    // offset 0x1fc8, size 0x1
    bool haseverplayed;
    // offset 0x1fc9, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_d96e0ee200411ad0"

version 20 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x1f40
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1c88, size 0x200
    string(64) primarygroupname;
    // offset 0x1e88, size 0x20
    uint prestige;
    // offset 0x1ea8, size 0x40
    uint64 primarygroupid;
    // offset 0x1ee8, size 0x20
    uint rankcp;
    // offset 0x1f08, size 0x20
    uint rankzm;
    // offset 0x1f28, size 0x10
    uint:10 backgroundid;
    // offset 0x1f38, size 0x1
    bool haseverplayed;
    // offset 0x1f39, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_c520788bf90e82f3"

version 19 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 30 size 0x1f40
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1088
    character character;
    // offset 0x12f8, size 0x20
    uint paragoniconidzm;
    // offset 0x1318, size 0x20
    uint prestigecp;
    // offset 0x1338, size 0x20
    uint prestigezm;
    // offset 0x1358, size 0x120
    byte scenpid[36];
    // offset 0x1478, size 0x520
    variant showcaseweapons[4];
    // offset 0x1998, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x19b8, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1b78, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1c88, size 0x200
    string(64) primarygroupname;
    // offset 0x1e88, size 0x20
    uint prestige;
    // offset 0x1ea8, size 0x40
    uint64 primarygroupid;
    // offset 0x1ee8, size 0x20
    uint rankcp;
    // offset 0x1f08, size 0x20
    uint rankzm;
    // offset 0x1f28, size 0x10
    uint:10 backgroundid;
    // offset 0x1f38, size 0x1
    bool haseverplayed;
    // offset 0x1f39, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_962029342e2d99c9"

version 18 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x1b68
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x11d0
    character character;
    // offset 0x1440, size 0x20
    uint paragoniconidzm;
    // offset 0x1460, size 0x20
    uint prestigecp;
    // offset 0x1480, size 0x20
    uint prestigezm;
    // offset 0x14a0, size 0x120
    byte scenpid[36];
    // offset 0x15c0, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x15e0, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x17a0, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x18b0, size 0x200
    string(64) primarygroupname;
    // offset 0x1ab0, size 0x20
    uint prestige;
    // offset 0x1ad0, size 0x40
    uint64 primarygroupid;
    // offset 0x1b10, size 0x20
    uint rankcp;
    // offset 0x1b30, size 0x20
    uint rankzm;
    // offset 0x1b50, size 0x10
    uint:10 backgroundid;
    // offset 0x1b60, size 0x1
    bool haseverplayed;
    // offset 0x1b61, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_b114162b148bac81"

version 17 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x1ae8
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0x1150
    character character;
    // offset 0x13c0, size 0x20
    uint paragoniconidzm;
    // offset 0x13e0, size 0x20
    uint prestigecp;
    // offset 0x1400, size 0x20
    uint prestigezm;
    // offset 0x1420, size 0x120
    byte scenpid[36];
    // offset 0x1540, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1560, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1720, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1830, size 0x200
    string(64) primarygroupname;
    // offset 0x1a30, size 0x20
    uint prestige;
    // offset 0x1a50, size 0x40
    uint64 primarygroupid;
    // offset 0x1a90, size 0x20
    uint rankcp;
    // offset 0x1ab0, size 0x20
    uint rankzm;
    // offset 0x1ad0, size 0x10
    uint:10 backgroundid;
    // offset 0x1ae0, size 0x1
    bool haseverplayed;
    // offset 0x1ae1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_de86884540031c3a"

version 16 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x18e8
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0xf50
    character character;
    // offset 0x11c0, size 0x20
    uint paragoniconidzm;
    // offset 0x11e0, size 0x20
    uint prestigecp;
    // offset 0x1200, size 0x20
    uint prestigezm;
    // offset 0x1220, size 0x120
    byte scenpid[36];
    // offset 0x1340, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1360, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1520, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1630, size 0x200
    string(64) primarygroupname;
    // offset 0x1830, size 0x20
    uint prestige;
    // offset 0x1850, size 0x40
    uint64 primarygroupid;
    // offset 0x1890, size 0x20
    uint rankcp;
    // offset 0x18b0, size 0x20
    uint rankzm;
    // offset 0x18d0, size 0x10
    uint:10 backgroundid;
    // offset 0x18e0, size 0x1
    bool haseverplayed;
    // offset 0x18e1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_1f9d2b9dc2765fab"

version 15 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x18e8
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0xf50
    character character;
    // offset 0x11c0, size 0x20
    uint paragoniconidzm;
    // offset 0x11e0, size 0x20
    uint prestigecp;
    // offset 0x1200, size 0x20
    uint prestigezm;
    // offset 0x1220, size 0x120
    byte scenpid[36];
    // offset 0x1340, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1360, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1520, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1630, size 0x200
    string(64) primarygroupname;
    // offset 0x1830, size 0x20
    uint prestige;
    // offset 0x1850, size 0x40
    uint64 primarygroupid;
    // offset 0x1890, size 0x20
    uint rankcp;
    // offset 0x18b0, size 0x20
    uint rankzm;
    // offset 0x18d0, size 0x10
    uint:10 backgroundid;
    // offset 0x18e0, size 0x1
    bool haseverplayed;
    // offset 0x18e1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_9a19851d8e0b484b"

version 14 {
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

    // idx 20 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 21 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 22 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x18e8
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0x58
    charactercontext charactercontext;
    // offset 0x178, size 0x20
    uint paragonrank;
    // offset 0x198, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0x250, size 0x20
    uint paragonrankzm;
    // offset 0x270, size 0xf50
    character character;
    // offset 0x11c0, size 0x20
    uint paragoniconidzm;
    // offset 0x11e0, size 0x20
    uint prestigecp;
    // offset 0x1200, size 0x20
    uint prestigezm;
    // offset 0x1220, size 0x120
    byte scenpid[36];
    // offset 0x1340, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x1360, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x1520, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x1630, size 0x200
    string(64) primarygroupname;
    // offset 0x1830, size 0x20
    uint prestige;
    // offset 0x1850, size 0x40
    uint64 primarygroupid;
    // offset 0x1890, size 0x20
    uint rankcp;
    // offset 0x18b0, size 0x20
    uint rankzm;
    // offset 0x18d0, size 0x10
    uint:10 backgroundid;
    // offset 0x18e0, size 0x1
    bool haseverplayed;
    // offset 0x18e1, size 0x7
    uint:1 __pad[7];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/player.ddl
// metatable "hash_ccdfb42223967cf1"

version 13 {
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

    // idx 17 members 4 size 0x110
    struct combatrecordinfo {
        // offset 0x0, size 0x40
        uint64 screenshotfileid;
        // offset 0x40, size 0x30
        uint:10 backgroundids[3];
        // offset 0x70, size 0x80
        string(16) screenshotfilename;
        // offset 0xf0, size 0x20
        int screenshotfilesize;
    };

    // idx 18 members 6 size 0xb8
    struct hash_18e73148b3ebc305 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x8
        byte seasonid;
        // offset 0x28, size 0x40
        uint64 subdivisionid;
        // offset 0x68, size 0x8
        byte leagueid;
        // offset 0x70, size 0x8
        byte divisionid;
        // offset 0x78, size 0x40
        uint64 teamid;
    };

    // idx 19 members 6 size 0x1c0
    struct hash_f82e02aa99b1c0a {
        // offset 0x0, size 0x20
        uint slot;
        // offset 0x20, size 0x40
        uint64 objectid;
        // offset 0x60, size 0x20
        uint checksum;
        // offset 0x80, size 0x20
        uint filetype;
        // offset 0xa0, size 0x100
        string(32) filename;
        // offset 0x1a0, size 0x20
        uint contentlength;
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

    // idx 0 members 29 size 0x3328
    // offset 0x0, size 0x20
    uint rank;
    // offset 0x20, size 0x20
    uint wins;
    // offset 0x40, size 0x20
    uint kills;
    // offset 0x60, size 0x20
    uint timestamplastday1;
    // offset 0x80, size 0x20
    uint timestamplastday2;
    // offset 0xa0, size 0x20
    uint timestamplastday3;
    // offset 0xc0, size 0x20
    uint timestamplastday4;
    // offset 0xe0, size 0x20
    uint timestamplastday5;
    // offset 0x100, size 0x20
    uint paragoniconid;
    // offset 0x120, size 0xa78
    charactercontext charactercontext;
    // offset 0xb98, size 0x20
    uint paragonrank;
    // offset 0xbb8, size 0xb8
    hash_18e73148b3ebc305 bestleague;
    // offset 0xc70, size 0x20
    uint paragonrankzm;
    // offset 0xc90, size 0x1f70
    character character;
    // offset 0x2c00, size 0x20
    uint paragoniconidzm;
    // offset 0x2c20, size 0x20
    uint prestigecp;
    // offset 0x2c40, size 0x20
    uint prestigezm;
    // offset 0x2c60, size 0x120
    byte scenpid[36];
    // offset 0x2d80, size 0x20
    uint hash_4f30e85d7fca3379;
    // offset 0x2da0, size 0x1c0
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    // offset 0x2f60, size 0x110
    combatrecordinfo combatrecordinfo;
    // offset 0x3070, size 0x200
    string(64) primarygroupname;
    // offset 0x3270, size 0x20
    uint prestige;
    // offset 0x3290, size 0x40
    uint64 primarygroupid;
    // offset 0x32d0, size 0x20
    uint rankcp;
    // offset 0x32f0, size 0x20
    uint rankzm;
    // offset 0x3310, size 0x10
    uint:10 backgroundid;
    // offset 0x3320, size 0x1
    bool haseverplayed;
    // offset 0x3321, size 0x7
    uint:1 __pad[7];
}

