begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 14;
metatable "hash_bc654abc5783b32a";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 13;
metatable "hash_ac9f920fb725c39c";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 12;
metatable "hash_d060beb532221620";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 11;
metatable "hash_cdde1ab232560e04";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 10;
metatable "hash_22ef5b890febcabd";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 9;
metatable "hash_95e6bc3291e4709b";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 8;
metatable "hash_c204620a1304413e";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 7;
metatable "hash_87e40a0c12080b05";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    uint64 xuid;
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 6;
metatable "hash_b26f5143be2d8c5a";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/fileshare_paintjob.ddl";
version 5;
metatable "hash_1d5c3658d6304a84";

struct root {
    weaponpaintjob weaponpaintjob;
};

struct weaponpaintjob {
    paintshop paintjob;
    uint32 createtime;
    char paintjobname[16];
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
    padbit __pad[4];
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


