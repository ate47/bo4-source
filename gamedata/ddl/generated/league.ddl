begin "gamedata/ddl/generated/league.ddl";
version 2;
metatable "hash_89d815d28d87d17a";

struct root {
    emblem emblem;
};

struct emblem {
    emblemlayer layer[32];
    uint9 background;
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint9 posx;
    uint9 posy;
    uint8 alpha;
    uint9 angle;
    uint7 color;
    uint8 green;
    uint9 scalex;
    uint9 scaley;
    bit flip;
    bit outline;
    padbit __pad[6];
};


