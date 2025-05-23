// hash_255f49928a7f32
// metatable "hash_4eb1fc3800877a96"

version 10 {
    // idx 1 members 27 size 0xc0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xa
        uint:10 icon;
        // offset 0x1a, size 0xc
        uint:12 posx;
        // offset 0x26, size 0xc
        uint:12 posy;
        // offset 0x32, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x3a, size 0x8
        uint:8 alpha;
        // offset 0x42, size 0x9
        uint:9 angle;
        // offset 0x4b, size 0x8
        uint:8 blue1;
        // offset 0x53, size 0x8
        uint:8 green;
        // offset 0x5b, size 0x7
        uint:7 gradientfill;
        // offset 0x62, size 0x2
        uint:2 gradienttype;
        // offset 0x64, size 0x4
        uint:4 groupindex;
        // offset 0x68, size 0x9
        uint:9 gradientangle;
        // offset 0x71, size 0x8
        uint:8 alpha1;
        // offset 0x79, size 0x8
        uint:8 green1;
        // offset 0x81, size 0x9
        uint:9 materialangle;
        // offset 0x8a, size 0xa
        uint:10 scalex;
        // offset 0x94, size 0xa
        uint:10 scaley;
        // offset 0x9e, size 0x8
        uint:8 materialscalex;
        // offset 0xa6, size 0x8
        uint:8 materialscaley;
        // offset 0xae, size 0x7
        uint:7 materialid;
        // offset 0xb5, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbc, size 0x1
        bool flip;
        // offset 0xbd, size 0x1
        bool mask;
        // offset 0xbe, size 0x1
        bool blend;
        // offset 0xbf, size 0x1
        bool outline;
    };

    // idx 2 members 27 size 0xb4
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xc
        uint:12 posx;
        // offset 0x1c, size 0xc
        uint:12 posy;
        // offset 0x28, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x30, size 0x8
        uint:8 alpha;
        // offset 0x38, size 0x9
        uint:9 angle;
        // offset 0x41, size 0x8
        uint:8 blue1;
        // offset 0x49, size 0x8
        uint:8 green;
        // offset 0x51, size 0x7
        uint:7 gradientfill;
        // offset 0x58, size 0x2
        uint:2 gradienttype;
        // offset 0x5a, size 0x9
        uint:9 gradientangle;
        // offset 0x63, size 0x8
        uint:8 alpha1;
        // offset 0x6b, size 0x8
        uint:8 green1;
        // offset 0x73, size 0x9
        uint:9 materialangle;
        // offset 0x7c, size 0xa
        uint:10 scalex;
        // offset 0x86, size 0xa
        uint:10 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool mask;
        // offset 0xb0, size 0x1
        bool blend;
        // offset 0xb1, size 0x1
        bool groupedlook;
        // offset 0xb2, size 0x1
        bool outline;
        // offset 0xb3, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x37bc
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0x7bc
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x30b4
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0xb4
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x37c6
    struct emblem {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
        // offset 0x37bc, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x37bc
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6f78
    struct paintshop {
        // offset 0x0, size 0x6f78
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x7086
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6f78
        paintshop paintjob;
        // offset 0x6fb8, size 0x20
        uint createtime;
        // offset 0x6fd8, size 0x80
        string(16) paintjobname;
        // offset 0x7058, size 0x2
        int:2 readonly;
        // offset 0x705a, size 0xc
        int:12 weaponindex;
        // offset 0x7066, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x139
    struct variant {
        // offset 0x0, size 0x4
        uint:4 weaponmodelslot;
        // offset 0x4, size 0x20
        uint createtime;
        // offset 0x24, size 0x8
        int:8 paintjobslot;
        // offset 0x2c, size 0xb
        int:11 variantindex;
        // offset 0x37, size 0x40
        int:8 attachment[8];
        // offset 0x77, size 0x80
        string(16) variantname;
        // offset 0xf7, size 0x2
        int:2 readonly;
        // offset 0xf9, size 0xb
        int:11 reticleindex;
        // offset 0x104, size 0xc
        int:12 weaponindex;
        // offset 0x110, size 0x9
        uint:9 camoindex;
        // offset 0x119, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xdf28
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6f78
        paintshop primaryweaponpaintshop;
        // offset 0x6f78, size 0x20
        int loadoutnum;
        // offset 0x6f98, size 0xc
        int:12 primaryweaponindex;
        // offset 0x6fa4, size 0x6f78
        paintshop secondaryweaponpaintshop;
        // offset 0xdf1c, size 0xc
        int:12 secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xdf48
    // offset 0x0, size 0xdf28
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xdf28, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_a1ee84142035aa6e"

version 9 {
    // idx 1 members 27 size 0xc0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xa
        uint:10 icon;
        // offset 0x1a, size 0xc
        uint:12 posx;
        // offset 0x26, size 0xc
        uint:12 posy;
        // offset 0x32, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x3a, size 0x8
        uint:8 alpha;
        // offset 0x42, size 0x9
        uint:9 angle;
        // offset 0x4b, size 0x8
        uint:8 blue1;
        // offset 0x53, size 0x8
        uint:8 green;
        // offset 0x5b, size 0x7
        uint:7 gradientfill;
        // offset 0x62, size 0x2
        uint:2 gradienttype;
        // offset 0x64, size 0x4
        uint:4 groupindex;
        // offset 0x68, size 0x9
        uint:9 gradientangle;
        // offset 0x71, size 0x8
        uint:8 alpha1;
        // offset 0x79, size 0x8
        uint:8 green1;
        // offset 0x81, size 0x9
        uint:9 materialangle;
        // offset 0x8a, size 0xa
        uint:10 scalex;
        // offset 0x94, size 0xa
        uint:10 scaley;
        // offset 0x9e, size 0x8
        uint:8 materialscalex;
        // offset 0xa6, size 0x8
        uint:8 materialscaley;
        // offset 0xae, size 0x7
        uint:7 materialid;
        // offset 0xb5, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbc, size 0x1
        bool flip;
        // offset 0xbd, size 0x1
        bool mask;
        // offset 0xbe, size 0x1
        bool blend;
        // offset 0xbf, size 0x1
        bool outline;
    };

    // idx 2 members 27 size 0xb4
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xc
        uint:12 posx;
        // offset 0x1c, size 0xc
        uint:12 posy;
        // offset 0x28, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x30, size 0x8
        uint:8 alpha;
        // offset 0x38, size 0x9
        uint:9 angle;
        // offset 0x41, size 0x8
        uint:8 blue1;
        // offset 0x49, size 0x8
        uint:8 green;
        // offset 0x51, size 0x7
        uint:7 gradientfill;
        // offset 0x58, size 0x2
        uint:2 gradienttype;
        // offset 0x5a, size 0x9
        uint:9 gradientangle;
        // offset 0x63, size 0x8
        uint:8 alpha1;
        // offset 0x6b, size 0x8
        uint:8 green1;
        // offset 0x73, size 0x9
        uint:9 materialangle;
        // offset 0x7c, size 0xa
        uint:10 scalex;
        // offset 0x86, size 0xa
        uint:10 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool mask;
        // offset 0xb0, size 0x1
        bool blend;
        // offset 0xb1, size 0x1
        bool groupedlook;
        // offset 0xb2, size 0x1
        bool outline;
        // offset 0xb3, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x37bc
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0x7bc
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x30b4
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0xb4
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x37c6
    struct emblem {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
        // offset 0x37bc, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x37bc
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6f78
    struct paintshop {
        // offset 0x0, size 0x6f78
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x7086
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6f78
        paintshop paintjob;
        // offset 0x6fb8, size 0x20
        uint createtime;
        // offset 0x6fd8, size 0x80
        string(16) paintjobname;
        // offset 0x7058, size 0x2
        int:2 readonly;
        // offset 0x705a, size 0xc
        int:12 weaponindex;
        // offset 0x7066, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x138
    struct variant {
        // offset 0x0, size 0x4
        uint:4 weaponmodelslot;
        // offset 0x4, size 0x20
        uint createtime;
        // offset 0x24, size 0x8
        int:8 paintjobslot;
        // offset 0x2c, size 0xb
        int:11 variantindex;
        // offset 0x37, size 0x40
        int:8 attachment[8];
        // offset 0x77, size 0x80
        string(16) variantname;
        // offset 0xf7, size 0x2
        int:2 readonly;
        // offset 0xf9, size 0xb
        int:11 reticleindex;
        // offset 0x104, size 0xb
        int:11 weaponindex;
        // offset 0x10f, size 0x9
        uint:9 camoindex;
        // offset 0x118, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xdf20
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6f78
        paintshop primaryweaponpaintshop;
        // offset 0x6f78, size 0x20
        int loadoutnum;
        // offset 0x6f98, size 0x8
        byte primaryweaponindex;
        // offset 0x6fa0, size 0x6f78
        paintshop secondaryweaponpaintshop;
        // offset 0xdf18, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xdf40
    // offset 0x0, size 0xdf20
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xdf20, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_ff6b8a5c4ad5f753"

version 8 {
    // idx 1 members 27 size 0xc0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xa
        uint:10 icon;
        // offset 0x1a, size 0xc
        uint:12 posx;
        // offset 0x26, size 0xc
        uint:12 posy;
        // offset 0x32, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x3a, size 0x8
        uint:8 alpha;
        // offset 0x42, size 0x9
        uint:9 angle;
        // offset 0x4b, size 0x8
        uint:8 blue1;
        // offset 0x53, size 0x8
        uint:8 green;
        // offset 0x5b, size 0x7
        uint:7 gradientfill;
        // offset 0x62, size 0x2
        uint:2 gradienttype;
        // offset 0x64, size 0x4
        uint:4 groupindex;
        // offset 0x68, size 0x9
        uint:9 gradientangle;
        // offset 0x71, size 0x8
        uint:8 alpha1;
        // offset 0x79, size 0x8
        uint:8 green1;
        // offset 0x81, size 0x9
        uint:9 materialangle;
        // offset 0x8a, size 0xa
        uint:10 scalex;
        // offset 0x94, size 0xa
        uint:10 scaley;
        // offset 0x9e, size 0x8
        uint:8 materialscalex;
        // offset 0xa6, size 0x8
        uint:8 materialscaley;
        // offset 0xae, size 0x7
        uint:7 materialid;
        // offset 0xb5, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbc, size 0x1
        bool flip;
        // offset 0xbd, size 0x1
        bool mask;
        // offset 0xbe, size 0x1
        bool blend;
        // offset 0xbf, size 0x1
        bool outline;
    };

    // idx 2 members 27 size 0xb4
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xc
        uint:12 posx;
        // offset 0x1c, size 0xc
        uint:12 posy;
        // offset 0x28, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x30, size 0x8
        uint:8 alpha;
        // offset 0x38, size 0x9
        uint:9 angle;
        // offset 0x41, size 0x8
        uint:8 blue1;
        // offset 0x49, size 0x8
        uint:8 green;
        // offset 0x51, size 0x7
        uint:7 gradientfill;
        // offset 0x58, size 0x2
        uint:2 gradienttype;
        // offset 0x5a, size 0x9
        uint:9 gradientangle;
        // offset 0x63, size 0x8
        uint:8 alpha1;
        // offset 0x6b, size 0x8
        uint:8 green1;
        // offset 0x73, size 0x9
        uint:9 materialangle;
        // offset 0x7c, size 0xa
        uint:10 scalex;
        // offset 0x86, size 0xa
        uint:10 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool mask;
        // offset 0xb0, size 0x1
        bool blend;
        // offset 0xb1, size 0x1
        bool groupedlook;
        // offset 0xb2, size 0x1
        bool outline;
        // offset 0xb3, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x37bc
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0x7bc
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x30b4
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0xb4
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x37c6
    struct emblem {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
        // offset 0x37bc, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x37bc
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6f78
    struct paintshop {
        // offset 0x0, size 0x6f78
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x7082
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6f78
        paintshop paintjob;
        // offset 0x6fb8, size 0x20
        uint createtime;
        // offset 0x6fd8, size 0x80
        string(16) paintjobname;
        // offset 0x7058, size 0x2
        int:2 readonly;
        // offset 0x705a, size 0x8
        byte weaponindex;
        // offset 0x7062, size 0x20
        int sortindex;
    };

    // idx 9 members 11 size 0x138
    struct variant {
        // offset 0x0, size 0x4
        uint:4 weaponmodelslot;
        // offset 0x4, size 0x20
        uint createtime;
        // offset 0x24, size 0x8
        int:8 paintjobslot;
        // offset 0x2c, size 0xb
        int:11 variantindex;
        // offset 0x37, size 0x40
        int:8 attachment[8];
        // offset 0x77, size 0x80
        string(16) variantname;
        // offset 0xf7, size 0x2
        int:2 readonly;
        // offset 0xf9, size 0xb
        int:11 reticleindex;
        // offset 0x104, size 0xb
        int:11 weaponindex;
        // offset 0x10f, size 0x9
        uint:9 camoindex;
        // offset 0x118, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xdf20
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6f78
        paintshop primaryweaponpaintshop;
        // offset 0x6f78, size 0x20
        int loadoutnum;
        // offset 0x6f98, size 0x8
        byte primaryweaponindex;
        // offset 0x6fa0, size 0x6f78
        paintshop secondaryweaponpaintshop;
        // offset 0xdf18, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xdf40
    // offset 0x0, size 0xdf20
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xdf20, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_c83cbb98fab48365"

version 7 {
    // idx 1 members 27 size 0xc0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xa
        uint:10 icon;
        // offset 0x1a, size 0xc
        uint:12 posx;
        // offset 0x26, size 0xc
        uint:12 posy;
        // offset 0x32, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x3a, size 0x8
        uint:8 alpha;
        // offset 0x42, size 0x9
        uint:9 angle;
        // offset 0x4b, size 0x8
        uint:8 blue1;
        // offset 0x53, size 0x8
        uint:8 green;
        // offset 0x5b, size 0x7
        uint:7 gradientfill;
        // offset 0x62, size 0x2
        uint:2 gradienttype;
        // offset 0x64, size 0x4
        uint:4 groupindex;
        // offset 0x68, size 0x9
        uint:9 gradientangle;
        // offset 0x71, size 0x8
        uint:8 alpha1;
        // offset 0x79, size 0x8
        uint:8 green1;
        // offset 0x81, size 0x9
        uint:9 materialangle;
        // offset 0x8a, size 0xa
        uint:10 scalex;
        // offset 0x94, size 0xa
        uint:10 scaley;
        // offset 0x9e, size 0x8
        uint:8 materialscalex;
        // offset 0xa6, size 0x8
        uint:8 materialscaley;
        // offset 0xae, size 0x7
        uint:7 materialid;
        // offset 0xb5, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbc, size 0x1
        bool flip;
        // offset 0xbd, size 0x1
        bool mask;
        // offset 0xbe, size 0x1
        bool blend;
        // offset 0xbf, size 0x1
        bool outline;
    };

    // idx 2 members 27 size 0xb4
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xc
        uint:12 posx;
        // offset 0x1c, size 0xc
        uint:12 posy;
        // offset 0x28, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x30, size 0x8
        uint:8 alpha;
        // offset 0x38, size 0x9
        uint:9 angle;
        // offset 0x41, size 0x8
        uint:8 blue1;
        // offset 0x49, size 0x8
        uint:8 green;
        // offset 0x51, size 0x7
        uint:7 gradientfill;
        // offset 0x58, size 0x2
        uint:2 gradienttype;
        // offset 0x5a, size 0x9
        uint:9 gradientangle;
        // offset 0x63, size 0x8
        uint:8 alpha1;
        // offset 0x6b, size 0x8
        uint:8 green1;
        // offset 0x73, size 0x9
        uint:9 materialangle;
        // offset 0x7c, size 0xa
        uint:10 scalex;
        // offset 0x86, size 0xa
        uint:10 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool mask;
        // offset 0xb0, size 0x1
        bool blend;
        // offset 0xb1, size 0x1
        bool groupedlook;
        // offset 0xb2, size 0x1
        bool outline;
        // offset 0xb3, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x37bc
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0x7bc
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x30b4
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0xb4
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x37c6
    struct emblem {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
        // offset 0x37bc, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x37bc
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x37bc
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6f78
    struct paintshop {
        // offset 0x0, size 0x6f78
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x7082
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6f78
        paintshop paintjob;
        // offset 0x6fb8, size 0x20
        uint createtime;
        // offset 0x6fd8, size 0x80
        string(16) paintjobname;
        // offset 0x7058, size 0x2
        int:2 readonly;
        // offset 0x705a, size 0x8
        byte weaponindex;
        // offset 0x7062, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xdf20
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6f78
        paintshop primaryweaponpaintshop;
        // offset 0x6f78, size 0x20
        int loadoutnum;
        // offset 0x6f98, size 0x8
        byte primaryweaponindex;
        // offset 0x6fa0, size 0x6f78
        paintshop secondaryweaponpaintshop;
        // offset 0xdf18, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xdf40
    // offset 0x0, size 0xdf20
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xdf20, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_2b2a773a86902a13"

version 6 {
    // idx 1 members 26 size 0xbf
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xa
        uint:10 icon;
        // offset 0x1a, size 0xb
        uint:11 posx;
        // offset 0x25, size 0xb
        uint:11 posy;
        // offset 0x30, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x38, size 0x8
        uint:8 alpha;
        // offset 0x40, size 0x9
        uint:9 angle;
        // offset 0x49, size 0x8
        uint:8 blue1;
        // offset 0x51, size 0x8
        uint:8 green;
        // offset 0x59, size 0x7
        uint:7 gradientfill;
        // offset 0x60, size 0x2
        uint:2 gradienttype;
        // offset 0x62, size 0x4
        uint:4 groupindex;
        // offset 0x66, size 0x9
        uint:9 gradientangle;
        // offset 0x6f, size 0x8
        uint:8 alpha1;
        // offset 0x77, size 0x8
        uint:8 green1;
        // offset 0x7f, size 0x9
        uint:9 materialangle;
        // offset 0x88, size 0xb
        uint:11 scalex;
        // offset 0x93, size 0xb
        uint:11 scaley;
        // offset 0x9e, size 0x8
        uint:8 materialscalex;
        // offset 0xa6, size 0x8
        uint:8 materialscaley;
        // offset 0xae, size 0x7
        uint:7 materialid;
        // offset 0xb5, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbc, size 0x1
        bool flip;
        // offset 0xbd, size 0x1
        bool blend;
        // offset 0xbe, size 0x1
        bool outline;
    };

    // idx 2 members 26 size 0xb3
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x2
        uint:2 gradienttype;
        // offset 0x58, size 0x9
        uint:9 gradientangle;
        // offset 0x61, size 0x8
        uint:8 alpha1;
        // offset 0x69, size 0x8
        uint:8 green1;
        // offset 0x71, size 0x9
        uint:9 materialangle;
        // offset 0x7a, size 0xb
        uint:11 scalex;
        // offset 0x85, size 0xb
        uint:11 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool blend;
        // offset 0xb0, size 0x1
        bool groupedlook;
        // offset 0xb1, size 0x1
        bool outline;
        // offset 0xb2, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x3771
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x2fc0
        emblemlayer layer[64];
        // offset 0x2fc0, size 0x7b1
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x3073
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x2fc0
        emblemlayer layer[64];
        // offset 0x2fc0, size 0xb3
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x377b
    struct emblem {
        // offset 0x0, size 0x3771
        hash_62325f44a788da78 layerinfo;
        // offset 0x3771, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x3771
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x3771
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6ee2
    struct paintshop {
        // offset 0x0, size 0x6ee2
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x6fec
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6ee2
        paintshop paintjob;
        // offset 0x6f22, size 0x20
        uint createtime;
        // offset 0x6f42, size 0x80
        string(16) paintjobname;
        // offset 0x6fc2, size 0x2
        int:2 readonly;
        // offset 0x6fc4, size 0x8
        byte weaponindex;
        // offset 0x6fcc, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xddf4
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6ee2
        paintshop primaryweaponpaintshop;
        // offset 0x6ee2, size 0x20
        int loadoutnum;
        // offset 0x6f02, size 0x8
        byte primaryweaponindex;
        // offset 0x6f0a, size 0x6ee2
        paintshop secondaryweaponpaintshop;
        // offset 0xddec, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xde14
    // offset 0x0, size 0xddf4
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xddf4, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_5d6dcbf937b0d566"

version 5 {
    // idx 1 members 26 size 0xc0
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x9
        uint:9 icon;
        // offset 0x19, size 0xb
        uint:11 posx;
        // offset 0x24, size 0xb
        uint:11 posy;
        // offset 0x2f, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x37, size 0x8
        uint:8 alpha;
        // offset 0x3f, size 0x9
        uint:9 angle;
        // offset 0x48, size 0x8
        uint:8 blue1;
        // offset 0x50, size 0x8
        uint:8 green;
        // offset 0x58, size 0x7
        uint:7 gradientfill;
        // offset 0x5f, size 0x2
        uint:2 gradienttype;
        // offset 0x61, size 0x6
        uint:6 groupindex;
        // offset 0x67, size 0x9
        uint:9 gradientangle;
        // offset 0x70, size 0x8
        uint:8 alpha1;
        // offset 0x78, size 0x8
        uint:8 green1;
        // offset 0x80, size 0x9
        uint:9 materialangle;
        // offset 0x89, size 0xb
        uint:11 scalex;
        // offset 0x94, size 0xb
        uint:11 scaley;
        // offset 0x9f, size 0x8
        uint:8 materialscalex;
        // offset 0xa7, size 0x8
        uint:8 materialscaley;
        // offset 0xaf, size 0x7
        uint:7 materialid;
        // offset 0xb6, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xbd, size 0x1
        bool flip;
        // offset 0xbe, size 0x1
        bool blend;
        // offset 0xbf, size 0x1
        bool outline;
    };

    // idx 2 members 26 size 0xb3
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x2
        uint:2 gradienttype;
        // offset 0x58, size 0x9
        uint:9 gradientangle;
        // offset 0x61, size 0x8
        uint:8 alpha1;
        // offset 0x69, size 0x8
        uint:8 green1;
        // offset 0x71, size 0x9
        uint:9 materialangle;
        // offset 0x7a, size 0xb
        uint:11 scalex;
        // offset 0x85, size 0xb
        uint:11 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x7
        uint:7 hash_4c4aff5f26267e55;
        // offset 0xae, size 0x1
        bool flip;
        // offset 0xaf, size 0x1
        bool blend;
        // offset 0xb0, size 0x1
        bool groupedlook;
        // offset 0xb1, size 0x1
        bool outline;
        // offset 0xb2, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x37b1
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0x7b1
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x30b3
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x3000
        emblemlayer layer[64];
        // offset 0x3000, size 0xb3
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x37bb
    struct emblem {
        // offset 0x0, size 0x37b1
        hash_62325f44a788da78 layerinfo;
        // offset 0x37b1, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x37b1
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x37b1
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6f62
    struct paintshop {
        // offset 0x0, size 0x6f62
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x706c
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6f62
        paintshop paintjob;
        // offset 0x6fa2, size 0x20
        uint createtime;
        // offset 0x6fc2, size 0x80
        string(16) paintjobname;
        // offset 0x7042, size 0x2
        int:2 readonly;
        // offset 0x7044, size 0x8
        byte weaponindex;
        // offset 0x704c, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xdef4
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6f62
        paintshop primaryweaponpaintshop;
        // offset 0x6f62, size 0x20
        int loadoutnum;
        // offset 0x6f82, size 0x8
        byte primaryweaponindex;
        // offset 0x6f8a, size 0x6f62
        paintshop secondaryweaponpaintshop;
        // offset 0xdeec, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xdf14
    // offset 0x0, size 0xdef4
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xdef4, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_6bd196ac16295370"

version 4 {
    // idx 1 members 25 size 0xb9
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x9
        uint:9 icon;
        // offset 0x19, size 0xb
        uint:11 posx;
        // offset 0x24, size 0xb
        uint:11 posy;
        // offset 0x2f, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x37, size 0x8
        uint:8 alpha;
        // offset 0x3f, size 0x9
        uint:9 angle;
        // offset 0x48, size 0x8
        uint:8 blue1;
        // offset 0x50, size 0x8
        uint:8 green;
        // offset 0x58, size 0x7
        uint:7 gradientfill;
        // offset 0x5f, size 0x2
        uint:2 gradienttype;
        // offset 0x61, size 0x6
        uint:6 groupindex;
        // offset 0x67, size 0x9
        uint:9 gradientangle;
        // offset 0x70, size 0x8
        uint:8 alpha1;
        // offset 0x78, size 0x8
        uint:8 green1;
        // offset 0x80, size 0x9
        uint:9 materialangle;
        // offset 0x89, size 0xb
        uint:11 scalex;
        // offset 0x94, size 0xb
        uint:11 scaley;
        // offset 0x9f, size 0x8
        uint:8 materialscalex;
        // offset 0xa7, size 0x8
        uint:8 materialscaley;
        // offset 0xaf, size 0x7
        uint:7 materialid;
        // offset 0xb6, size 0x1
        bool flip;
        // offset 0xb7, size 0x1
        bool blend;
        // offset 0xb8, size 0x1
        bool outline;
    };

    // idx 2 members 25 size 0xac
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x2
        uint:2 gradienttype;
        // offset 0x58, size 0x9
        uint:9 gradientangle;
        // offset 0x61, size 0x8
        uint:8 alpha1;
        // offset 0x69, size 0x8
        uint:8 green1;
        // offset 0x71, size 0x9
        uint:9 materialangle;
        // offset 0x7a, size 0xb
        uint:11 scalex;
        // offset 0x85, size 0xb
        uint:11 scaley;
        // offset 0x90, size 0x8
        uint:8 materialscalex;
        // offset 0x98, size 0x8
        uint:8 materialscaley;
        // offset 0xa0, size 0x7
        uint:7 materialid;
        // offset 0xa7, size 0x1
        bool flip;
        // offset 0xa8, size 0x1
        bool blend;
        // offset 0xa9, size 0x1
        bool groupedlook;
        // offset 0xaa, size 0x1
        bool outline;
        // offset 0xab, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x35a4
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x2e40
        emblemlayer layer[64];
        // offset 0x2e40, size 0x764
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x2eec
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x2e40
        emblemlayer layer[64];
        // offset 0x2e40, size 0xac
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x35ae
    struct emblem {
        // offset 0x0, size 0x35a4
        hash_62325f44a788da78 layerinfo;
        // offset 0x35a4, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x35a4
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x35a4
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6b48
    struct paintshop {
        // offset 0x0, size 0x6b48
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x6c52
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6b48
        paintshop paintjob;
        // offset 0x6b88, size 0x20
        uint createtime;
        // offset 0x6ba8, size 0x80
        string(16) paintjobname;
        // offset 0x6c28, size 0x2
        int:2 readonly;
        // offset 0x6c2a, size 0x8
        byte weaponindex;
        // offset 0x6c32, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xd6c0
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6b48
        paintshop primaryweaponpaintshop;
        // offset 0x6b48, size 0x20
        int loadoutnum;
        // offset 0x6b68, size 0x8
        byte primaryweaponindex;
        // offset 0x6b70, size 0x6b48
        paintshop secondaryweaponpaintshop;
        // offset 0xd6b8, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xd6e0
    // offset 0x0, size 0xd6c0
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xd6c0, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_522ce183ccaef565"

version 3 {
    // idx 1 members 25 size 0xb8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x9
        uint:9 icon;
        // offset 0x19, size 0xb
        uint:11 posx;
        // offset 0x24, size 0xb
        uint:11 posy;
        // offset 0x2f, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x37, size 0x8
        uint:8 alpha;
        // offset 0x3f, size 0x9
        uint:9 angle;
        // offset 0x48, size 0x8
        uint:8 blue1;
        // offset 0x50, size 0x8
        uint:8 green;
        // offset 0x58, size 0x7
        uint:7 gradientfill;
        // offset 0x5f, size 0x6
        uint:6 groupindex;
        // offset 0x65, size 0x9
        uint:9 gradientangle;
        // offset 0x6e, size 0x8
        uint:8 alpha1;
        // offset 0x76, size 0x8
        uint:8 green1;
        // offset 0x7e, size 0x9
        uint:9 materialangle;
        // offset 0x87, size 0xb
        uint:11 scalex;
        // offset 0x92, size 0xb
        uint:11 scaley;
        // offset 0x9d, size 0x8
        uint:8 materialscalex;
        // offset 0xa5, size 0x8
        uint:8 materialscaley;
        // offset 0xad, size 0x7
        uint:7 materialid;
        // offset 0xb4, size 0x1
        bool flip;
        // offset 0xb5, size 0x1
        bool blend;
        // offset 0xb6, size 0x1
        bool gradienttype;
        // offset 0xb7, size 0x1
        bool outline;
    };

    // idx 2 members 25 size 0xab
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x9
        uint:9 gradientangle;
        // offset 0x5f, size 0x8
        uint:8 alpha1;
        // offset 0x67, size 0x8
        uint:8 green1;
        // offset 0x6f, size 0x9
        uint:9 materialangle;
        // offset 0x78, size 0xb
        uint:11 scalex;
        // offset 0x83, size 0xb
        uint:11 scaley;
        // offset 0x8e, size 0x8
        uint:8 materialscalex;
        // offset 0x96, size 0x8
        uint:8 materialscaley;
        // offset 0x9e, size 0x7
        uint:7 materialid;
        // offset 0xa5, size 0x1
        bool flip;
        // offset 0xa6, size 0x1
        bool blend;
        // offset 0xa7, size 0x1
        bool gradienttype;
        // offset 0xa8, size 0x1
        bool groupedlook;
        // offset 0xa9, size 0x1
        bool outline;
        // offset 0xaa, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x3559
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0x759
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x2eab
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0xab
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x3563
    struct emblem {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
        // offset 0x3559, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x3559
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6ab2
    struct paintshop {
        // offset 0x0, size 0x6ab2
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 7 size 0x6bbc
    struct weaponpaintjob {
        // offset 0x0, size 0x40
        uint64 xuid;
        // offset 0x40, size 0x6ab2
        paintshop paintjob;
        // offset 0x6af2, size 0x20
        uint createtime;
        // offset 0x6b12, size 0x80
        string(16) paintjobname;
        // offset 0x6b92, size 0x2
        int:2 readonly;
        // offset 0x6b94, size 0x8
        byte weaponindex;
        // offset 0x6b9c, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xd594
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6ab2
        paintshop primaryweaponpaintshop;
        // offset 0x6ab2, size 0x20
        int loadoutnum;
        // offset 0x6ad2, size 0x8
        byte primaryweaponindex;
        // offset 0x6ada, size 0x6ab2
        paintshop secondaryweaponpaintshop;
        // offset 0xd58c, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xd5b4
    // offset 0x0, size 0xd594
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xd594, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_2dae27813c7e7f24"

version 2 {
    // idx 1 members 25 size 0xb8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x9
        uint:9 icon;
        // offset 0x19, size 0xb
        uint:11 posx;
        // offset 0x24, size 0xb
        uint:11 posy;
        // offset 0x2f, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x37, size 0x8
        uint:8 alpha;
        // offset 0x3f, size 0x9
        uint:9 angle;
        // offset 0x48, size 0x8
        uint:8 blue1;
        // offset 0x50, size 0x8
        uint:8 green;
        // offset 0x58, size 0x7
        uint:7 gradientfill;
        // offset 0x5f, size 0x6
        uint:6 groupindex;
        // offset 0x65, size 0x9
        uint:9 gradientangle;
        // offset 0x6e, size 0x8
        uint:8 alpha1;
        // offset 0x76, size 0x8
        uint:8 green1;
        // offset 0x7e, size 0x9
        uint:9 materialangle;
        // offset 0x87, size 0xb
        uint:11 scalex;
        // offset 0x92, size 0xb
        uint:11 scaley;
        // offset 0x9d, size 0x8
        uint:8 materialscalex;
        // offset 0xa5, size 0x8
        uint:8 materialscaley;
        // offset 0xad, size 0x7
        uint:7 materialid;
        // offset 0xb4, size 0x1
        bool flip;
        // offset 0xb5, size 0x1
        bool blend;
        // offset 0xb6, size 0x1
        bool gradienttype;
        // offset 0xb7, size 0x1
        bool outline;
    };

    // idx 2 members 25 size 0xab
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x9
        uint:9 gradientangle;
        // offset 0x5f, size 0x8
        uint:8 alpha1;
        // offset 0x67, size 0x8
        uint:8 green1;
        // offset 0x6f, size 0x9
        uint:9 materialangle;
        // offset 0x78, size 0xb
        uint:11 scalex;
        // offset 0x83, size 0xb
        uint:11 scaley;
        // offset 0x8e, size 0x8
        uint:8 materialscalex;
        // offset 0x96, size 0x8
        uint:8 materialscaley;
        // offset 0x9e, size 0x7
        uint:7 materialid;
        // offset 0xa5, size 0x1
        bool flip;
        // offset 0xa6, size 0x1
        bool blend;
        // offset 0xa7, size 0x1
        bool gradienttype;
        // offset 0xa8, size 0x1
        bool groupedlook;
        // offset 0xa9, size 0x1
        bool outline;
        // offset 0xaa, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x3559
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0x759
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x2eab
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0xab
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x3563
    struct emblem {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
        // offset 0x3559, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x3559
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6ab2
    struct paintshop {
        // offset 0x0, size 0x6ab2
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x6b7c
    struct weaponpaintjob {
        // offset 0x0, size 0x6ab2
        paintshop paintjob;
        // offset 0x6ab2, size 0x20
        uint createtime;
        // offset 0x6ad2, size 0x80
        string(16) paintjobname;
        // offset 0x6b52, size 0x2
        int:2 readonly;
        // offset 0x6b54, size 0x8
        byte weaponindex;
        // offset 0x6b5c, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x133
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0xb
        int:11 weaponindex;
        // offset 0x10b, size 0x8
        byte camoindex;
        // offset 0x113, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xd594
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6ab2
        paintshop primaryweaponpaintshop;
        // offset 0x6ab2, size 0x20
        int loadoutnum;
        // offset 0x6ad2, size 0x8
        byte primaryweaponindex;
        // offset 0x6ada, size 0x6ab2
        paintshop secondaryweaponpaintshop;
        // offset 0xd58c, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xd5b4
    // offset 0x0, size 0xd594
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xd594, size 0x20
    int hash_3378d56fb431d957;
}

/////////////////////////////////////////////////
// hash_255f49928a7f32
// metatable "hash_750101117843746f"

version 1 {
    // idx 1 members 25 size 0xb8
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x9
        uint:9 icon;
        // offset 0x19, size 0xb
        uint:11 posx;
        // offset 0x24, size 0xb
        uint:11 posy;
        // offset 0x2f, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x37, size 0x8
        uint:8 alpha;
        // offset 0x3f, size 0x9
        uint:9 angle;
        // offset 0x48, size 0x8
        uint:8 blue1;
        // offset 0x50, size 0x8
        uint:8 green;
        // offset 0x58, size 0x7
        uint:7 gradientfill;
        // offset 0x5f, size 0x6
        uint:6 groupindex;
        // offset 0x65, size 0x9
        uint:9 gradientangle;
        // offset 0x6e, size 0x8
        uint:8 alpha1;
        // offset 0x76, size 0x8
        uint:8 green1;
        // offset 0x7e, size 0x9
        uint:9 materialangle;
        // offset 0x87, size 0xb
        uint:11 scalex;
        // offset 0x92, size 0xb
        uint:11 scaley;
        // offset 0x9d, size 0x8
        uint:8 materialscalex;
        // offset 0xa5, size 0x8
        uint:8 materialscaley;
        // offset 0xad, size 0x7
        uint:7 materialid;
        // offset 0xb4, size 0x1
        bool flip;
        // offset 0xb5, size 0x1
        bool blend;
        // offset 0xb6, size 0x1
        bool gradienttype;
        // offset 0xb7, size 0x1
        bool outline;
    };

    // idx 2 members 25 size 0xab
    struct hash_24f699c797bc9492 {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0xb
        uint:11 posx;
        // offset 0x1b, size 0xb
        uint:11 posy;
        // offset 0x26, size 0x8
        uint:8 hash_4cf0321fbfe5f277;
        // offset 0x2e, size 0x8
        uint:8 alpha;
        // offset 0x36, size 0x9
        uint:9 angle;
        // offset 0x3f, size 0x8
        uint:8 blue1;
        // offset 0x47, size 0x8
        uint:8 green;
        // offset 0x4f, size 0x7
        uint:7 gradientfill;
        // offset 0x56, size 0x9
        uint:9 gradientangle;
        // offset 0x5f, size 0x8
        uint:8 alpha1;
        // offset 0x67, size 0x8
        uint:8 green1;
        // offset 0x6f, size 0x9
        uint:9 materialangle;
        // offset 0x78, size 0xb
        uint:11 scalex;
        // offset 0x83, size 0xb
        uint:11 scaley;
        // offset 0x8e, size 0x8
        uint:8 materialscalex;
        // offset 0x96, size 0x8
        uint:8 materialscaley;
        // offset 0x9e, size 0x7
        uint:7 materialid;
        // offset 0xa5, size 0x1
        bool flip;
        // offset 0xa6, size 0x1
        bool blend;
        // offset 0xa7, size 0x1
        bool gradienttype;
        // offset 0xa8, size 0x1
        bool groupedlook;
        // offset 0xa9, size 0x1
        bool outline;
        // offset 0xaa, size 0x1
        bool isgrouped;
    };

    // idx 3 members 2 size 0x3559
    struct hash_62325f44a788da78 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0x759
        hash_24f699c797bc9492 groups[11];
    };

    // idx 4 members 2 size 0x2eab
    struct hash_6ac42a2c4c8f3b10 {
        // offset 0x0, size 0x2e00
        emblemlayer layer[64];
        // offset 0x2e00, size 0xab
        hash_24f699c797bc9492 groups[1];
    };

    // idx 5 members 2 size 0x3563
    struct emblem {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
        // offset 0x3559, size 0xa
        uint:10 background;
    };

    // idx 6 members 1 size 0x3559
    struct hash_4e00feaf81ba241c {
        // offset 0x0, size 0x3559
        hash_62325f44a788da78 layerinfo;
    };

    // idx 7 members 1 size 0x6ab2
    struct paintshop {
        // offset 0x0, size 0x6ab2
        hash_4e00feaf81ba241c view[hash_1d2ac7bb711046eb];
    };

    // idx 8 members 6 size 0x6b7c
    struct weaponpaintjob {
        // offset 0x0, size 0x6ab2
        paintshop paintjob;
        // offset 0x6ab2, size 0x20
        uint createtime;
        // offset 0x6ad2, size 0x80
        string(16) paintjobname;
        // offset 0x6b52, size 0x2
        int:2 readonly;
        // offset 0x6b54, size 0x8
        byte weaponindex;
        // offset 0x6b5c, size 0x20
        int sortindex;
    };

    // idx 9 members 10 size 0x131
    struct variant {
        // offset 0x0, size 0x20
        uint createtime;
        // offset 0x20, size 0x8
        int:8 paintjobslot;
        // offset 0x28, size 0xb
        int:11 variantindex;
        // offset 0x33, size 0x40
        int:8 attachment[8];
        // offset 0x73, size 0x80
        string(16) variantname;
        // offset 0xf3, size 0x2
        int:2 readonly;
        // offset 0xf5, size 0xb
        int:11 reticleindex;
        // offset 0x100, size 0x9
        int:9 weaponindex;
        // offset 0x109, size 0x8
        byte camoindex;
        // offset 0x111, size 0x20
        int sortindex;
    };

    // idx 10 members 5 size 0xd594
    struct hash_30241e465e2ee2d2 {
        // offset 0x0, size 0x6ab2
        paintshop primaryweaponpaintshop;
        // offset 0x6ab2, size 0x20
        int loadoutnum;
        // offset 0x6ad2, size 0x8
        byte primaryweaponindex;
        // offset 0x6ada, size 0x6ab2
        paintshop secondaryweaponpaintshop;
        // offset 0xd58c, size 0x8
        byte secondaryweaponindex;
    };

    // idx 0 members 2
    enum hash_1d2ac7bb711046eb {
        left, // 0x0,
        top, // 0x1
    };

    // idx 0 members 2 size 0xd5b4
    // offset 0x0, size 0xd594
    hash_30241e465e2ee2d2 loadoutpaintshop;
    // offset 0xd594, size 0x20
    int hash_3378d56fb431d957;
}

