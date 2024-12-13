// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_7e662c3e4e80fffa"

version 15 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_cd120ef73855d039"

version 14 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_943ec75b3988eb88"

version 13 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_2711d657b98e890b"

version 12 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_f0d1f08d3584365c"

version 11 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_49bccb1a2ec62d26"

version 10 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x49f8
    // offset 0x0, size 0x49f8
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_832d0863bc19bc83"

version 9 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x47a0
    // offset 0x0, size 0x47a0
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_b88f5ae5d4c5168f"

version 8 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x4548
    // offset 0x0, size 0x4548
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_1a7ce492463c4b78"

version 7 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x4548
    // offset 0x0, size 0x4548
    hash_4e00feaf81ba241c emblem;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/fileshare_emblem.ddl
// metatable "hash_63d55ed867f0e2d2"

version 6 {
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

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 1 size 0x4548
    // offset 0x0, size 0x4548
    hash_4e00feaf81ba241c emblem;
}

