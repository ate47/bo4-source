begin "gamedata/ddl/generated/paintjobs.ddl";
version 14;
metatable "hash_7eee96bd6abe9c13";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    int12 weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 13;
metatable "hash_422a17e8a7c07ce6";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    int12 weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 12;
metatable "hash_cf24c63833df31da";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 11;
metatable "hash_ae0ad25cff514168";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 10;
metatable "hash_169e842c8ef25e4";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 9;
metatable "hash_e37516a7ecc86d3d";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 8;
metatable "hash_b5a1a4eba4f8bf8";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 7;
metatable "hash_f2c7212d9fc1bedf";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 6;
metatable "hash_f21fb7d405c4af89";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


,
begin "gamedata/ddl/generated/paintjobs.ddl";
version 5;
metatable "hash_e240e82dd72427a6";

struct root {
    weaponpaintjob weaponpaintjob;
    uint32 version;
};

struct weaponpaintjob {
    paintshop paintjob;
    uint32 createtime;
    string paintjobname;
    int2 readonly;
    byte weaponindex;
    int32 sortindex;
};

struct paintshop {
    hash_4e00feaf81ba241c view[2];
};

struct hash_4e00feaf81ba241c {
    hash_62325f44a788da78 layerinfo;
};

struct hash_62325f44a788da78 {
    emblemlayer layer[64];
    hash_24f699c797bc9492 groups[11];
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
};


