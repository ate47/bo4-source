begin "gamedata/ddl/generated/groups.ddl";
version 14;
metatable "hash_d304802dfebc34d7";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint10 icon;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint4 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 13;
metatable "hash_aacfd8f302894f18";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint10 icon;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint4 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 12;
metatable "hash_b51444ac373433b2";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint10 icon;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint4 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 11;
metatable "hash_f10802564c441915";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint10 icon;
    uint12 posx;
    uint12 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint4 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint10 scalex;
    uint10 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit mask;
    bit blend;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 10;
metatable "hash_b02b641c6e19881b";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[3];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint10 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint4 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit blend;
    bit outline;
    padbit __pad[5];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 9;
metatable "hash_16c607b3cd67f60a";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[3];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint6 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    uint7 hash_4c4aff5f26267e55;
    bit flip;
    bit blend;
    bit outline;
    padbit __pad[5];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 8;
metatable "hash_74d572cc23478690";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[3];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint2 gradienttype;
    uint6 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit outline;
    padbit __pad[5];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 7;
metatable "hash_44fd30909a720bf2";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint6 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 6;
metatable "hash_e1006ea390d990b0";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint6 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit outline;
    padbit __pad[4];
};


,
begin "gamedata/ddl/generated/groups.ddl";
version 5;
metatable "hash_248c7df9f7ea4d18";

struct root {
    string ownername;
    string message;
    string description;
    leaderboard leaderboard;
    emblem emblem;
    uint64 creationtimestamp;
};

struct leaderboard {
    uint32 timeframe;
    string leaderboarddef;
    string sorttype;
    bit initialized;
    bit isarena;
    bit ishardcore;
    padbit __pad[5];
};

struct emblem {
    hash_62325f44a788da78 layerinfo;
    uint10 background;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
};

struct hash_24f699c797bc9492 {
    uint8 red;
    uint8 blue;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit groupedlook;
    bit outline;
    bit isgrouped;
    padbit __pad[2];
};

struct emblemlayer {
    uint8 red;
    uint8 blue;
    uint9 icon;
    uint11 posx;
    uint11 posy;
    uint8 hash_4cf0321fbfe5f277;
    uint8 alpha;
    uint9 angle;
    uint8 blue1;
    uint8 green;
    uint7 gradientfill;
    uint6 groupindex;
    uint9 gradientangle;
    uint8 alpha1;
    uint8 green1;
    uint9 materialangle;
    uint11 scalex;
    uint11 scaley;
    uint8 materialscalex;
    uint8 materialscaley;
    uint7 materialid;
    bit flip;
    bit blend;
    bit gradienttype;
    bit outline;
    padbit __pad[4];
};


