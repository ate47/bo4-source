begin "gamedata/ddl/generated/player.ddl";
version 58;
metatable "hash_75db694c19b50ea1";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[35];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int12 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 57;
metatable "hash_d28b488259f507d9";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[35];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int12 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 56;
metatable "hash_95081bff4ad8c62";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int12 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 55;
metatable "hash_ba039ece937f107d";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 54;
metatable "hash_e2caa6a6a0fa6ff2";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 53;
metatable "hash_93519ea9347303cb";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 52;
metatable "hash_2802315c76767166";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint6 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 51;
metatable "hash_ee8678886be66d39";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    int32 lobbydlcbits;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 50;
metatable "hash_e378eda968c13f26";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 49;
metatable "hash_50ff4338de2b69fc";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 48;
metatable "hash_ed988782ae3e1de";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 47;
metatable "hash_19810636f2d79715";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    fixedpoint performancevalue;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 46;
metatable "hash_d3e59d63953895e1";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint4 weaponmodelslot;
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    uint9 camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 45;
metatable "hash_67e86e0b4050de1e";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankwz;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidwz;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigewz;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 44;
metatable "hash_6eda1d0ff04686d3";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    short bestsubdivisionrank;
    short firstsubdivisionrankstreak;
    short bestcurrenteventgamestreak;
    short bestfirstsubdivisionrankstreak;
    short points;
    short firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 43;
metatable "hash_fa3c01a684d9bd8";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 42;
metatable "hash_fb7a63d56de40823";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 41;
metatable "hash_eb7b046abfd4e72c";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint9 hash_44ed9a1ad38be40[3];
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 40;
metatable "hash_b5614178ecf29dd3";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 39;
metatable "hash_753c3048ced0bdc5";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
    uint32 winstreak;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 38;
metatable "hash_fcf8933b7d1c3ae6";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint5 hash_4d9fceac8ff24cbd;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
    uint32 winstreak;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 37;
metatable "hash_e70aeef9f40f2ffb";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    arenastats arenabest;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct arenastats {
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint32 points;
    uint32 firstsubdivisionranktotal;
    uint32 winstreak;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 36;
metatable "hash_803ff572bb52bd15";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 35;
metatable "hash_8a1a6c0747873ed";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 34;
metatable "hash_ab37e8d433a72d11";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 33;
metatable "hash_a5526a36c529fdf6";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankwz;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 32;
metatable "hash_4af662c4ff4cc658";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 31;
metatable "hash_f709f5517331f1bf";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 30;
metatable "hash_dd57540c81b1cc74";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 29;
metatable "hash_d2647a1de3d38349";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    uint5 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 28;
metatable "hash_5a58cb7ffce98393";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[8];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 27;
metatable "hash_6b0941546b63ad8";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[8];
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[8];
};


,
begin "gamedata/ddl/generated/player.ddl";
version 26;
metatable "hash_185414fdd9fe3733";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverbootedgame;
    bit haseverplayed;
    padbit __pad[6];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 25;
metatable "hash_ce3fee8f63cb1edd";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 24;
metatable "hash_394ad497903b889a";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 23;
metatable "hash_eb196cd0e95a9d87";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 22;
metatable "hash_451ba93bf3d90d39";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    double medalstatname;
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 21;
metatable "hash_d43c122255c3e077";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    hash_70febf3d5022ab6c hash_593fb22639f32bb8[4];
    uint64 screenshotfileid;
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_70febf3d5022ab6c {
    uint10 backgroundids[3];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 20;
metatable "hash_d96e0ee200411ad0";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int11 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 19;
metatable "hash_c520788bf90e82f3";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    variant showcaseweapons[4];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 18;
metatable "hash_962029342e2d99c9";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 17;
metatable "hash_b114162b148bac81";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 16;
metatable "hash_de86884540031c3a";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[7];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 15;
metatable "hash_1f9d2b9dc2765fab";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[7];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 14;
metatable "hash_9a19851d8e0b484b";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[7];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


,
begin "gamedata/ddl/generated/player.ddl";
version 13;
metatable "hash_ccdfb42223967cf1";

struct root {
    uint32 rank;
    uint32 wins;
    uint32 kills;
    uint32 timestamplastday1;
    uint32 timestamplastday2;
    uint32 timestamplastday3;
    uint32 timestamplastday4;
    uint32 timestamplastday5;
    uint32 paragoniconid;
    charactercontext charactercontext;
    uint32 paragonrank;
    hash_18e73148b3ebc305 bestleague;
    uint32 paragonrankzm;
    character character;
    uint32 paragoniconidzm;
    uint32 prestigecp;
    uint32 prestigezm;
    byte scenpid[36];
    uint32 hash_4f30e85d7fca3379;
    hash_f82e02aa99b1c0a hash_2c0489f12ffde990;
    combatrecordinfo combatrecordinfo;
    string primarygroupname;
    uint32 prestige;
    uint64 primarygroupid;
    uint32 rankcp;
    uint32 rankzm;
    uint10 backgroundid;
    bit haseverplayed;
    padbit __pad[7];
};

struct charactercontext {
    hash_5b3226f1816b17a hash_50ee7b4f9ae0c518[2];
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_18e73148b3ebc305 {
    uint32 rank;
    byte seasonid;
    uint64 subdivisionid;
    byte leagueid;
    byte divisionid;
    uint64 teamid;
};

struct character {
    hash_74e0cb6ea60c0207 itemlist[4];
    variant showcaseweapon;
    uint6 selectedcharacteritems[4];
    uint2 selectedloadouttype;
};

struct hash_74e0cb6ea60c0207 {
    characteritem items[60];
};

struct hash_f82e02aa99b1c0a {
    uint32 slot;
    uint64 objectid;
    uint32 checksum;
    uint32 filetype;
    string filename;
    uint32 contentlength;
};

struct combatrecordinfo {
    uint64 screenshotfileid;
    uint10 backgroundids[3];
    string screenshotfilename;
    int32 screenshotfilesize;
};

struct hash_5b3226f1816b17a {
    hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
    uint5 materialindex[2];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    string variantname;
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct characteritem {
    uint3 colors[3];
    bit markedold;
    bit unlocked;
    padbit __pad[6];
};

struct hash_508eaeb5f638a293 {
    mix_s mix[4];
};

struct mix_s {
    uint32 modelindex;
    fixedpoint weight;
};


