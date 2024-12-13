// gamedata/ddl/generated/league.ddl
// metatable "hash_89d815d28d87d17a"

version 2 {
    // idx 1 members 14 size 0x90
    struct emblemlayer {
        // offset 0x0, size 0x8
        uint:8 red;
        // offset 0x8, size 0x8
        uint:8 blue;
        // offset 0x10, size 0x10
        uint:9 icon;
        // offset 0x20, size 0x10
        uint:9 posx;
        // offset 0x30, size 0x10
        uint:9 posy;
        // offset 0x40, size 0x8
        uint:8 alpha;
        // offset 0x48, size 0x10
        uint:9 angle;
        // offset 0x58, size 0x8
        uint:7 color;
        // offset 0x60, size 0x8
        uint:8 green;
        // offset 0x68, size 0x10
        uint:9 scalex;
        // offset 0x78, size 0x10
        uint:9 scaley;
        // offset 0x88, size 0x1
        bool flip;
        // offset 0x89, size 0x1
        bool outline;
        // offset 0x8a, size 0x6
        uint:1 __pad[6];
    };

    // idx 2 members 2 size 0x1210
    struct emblem {
        // offset 0x0, size 0x1200
        emblemlayer layer[32];
        // offset 0x1200, size 0x10
        uint:9 background;
    };

    // idx 0 members 1 size 0x1210
    // offset 0x0, size 0x1210
    emblem emblem;
}

