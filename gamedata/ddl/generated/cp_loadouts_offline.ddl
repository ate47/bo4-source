begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 66;
metatable "hash_eb02739ba6108f5c";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[35];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 65;
metatable "hash_7e2cc2ab4fe5054f";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[35];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[35];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 64;
metatable "hash_17806d88f1591443";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 63;
metatable "hash_afb810becb571d6c";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 62;
metatable "hash_b98c08dd8e62a9f1";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 61;
metatable "hash_c82af4be2fad98f1";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 60;
metatable "hash_7fec61d3616c7d43";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 59;
metatable "hash_2934edf8e4b52c9d";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 58;
metatable "hash_2feeb1deff6dce53";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 57;
metatable "hash_18523246e13e6bfb";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 56;
metatable "hash_f3805436146dadd3";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 55;
metatable "hash_3b394766bdbe78b1";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 54;
metatable "hash_eed2b73b1eccc604";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[24];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[24];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 53;
metatable "hash_67e7154a35898caf";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 52;
metatable "hash_a565ebe95af5dea";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 51;
metatable "hash_190f4eadb3697bb0";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 50;
metatable "hash_e4c69ab39fdc934c";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 49;
metatable "hash_6086aafd90f39995";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 48;
metatable "hash_a60e9f4f68cfc033";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 47;
metatable "hash_bdf5edd921864e0";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 46;
metatable "hash_9d0b8175a237ad2d";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 45;
metatable "hash_a97daf93ded576c0";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 44;
metatable "hash_a1ba594d3918ce25";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    uint4 weaponmodelslot;
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 43;
metatable "hash_7ff4983c5f48b26a";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 42;
metatable "hash_5df7837371c65241";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 41;
metatable "hash_2d4085f18b788abc";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    hash_768aeb6b928320d outfit_breadcrumbs[16];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[16];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 40;
metatable "hash_68762339c3c06ea3";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[8];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 39;
metatable "hash_28f66d8835395d84";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[8];
    hash_768aeb6b928320d outfit_breadcrumbs[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[8];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 38;
metatable "hash_73fa24343f5b402f";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 37;
metatable "hash_68aa0c431b0c74b0";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 36;
metatable "hash_a0fba43d2f1a231c";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct charactercontext {
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 35;
metatable "hash_912a97659fc311d9";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 34;
metatable "hash_c9bbe754eef02fc6";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_52f9ee07d542f724 {
    hash_487a06a811f1cadc items[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_32aeae7311d2cd9b {
    uint4 hash_212bcdfa518cc913[8];
};

struct hash_487a06a811f1cadc {
    bit markedold;
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 33;
metatable "hash_e00dc701266df4bd";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
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

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 32;
metatable "hash_42c4020fa821759d";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[8];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
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

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 31;
metatable "hash_41e1b0b5b59a5635";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
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

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 30;
metatable "hash_475942033e647948";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
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

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 29;
metatable "hash_ede0c5795189a76b";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
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
    variant showcaseweapon;
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct hash_380775ab8e293fe7 {
    hash_52f9ee07d542f724 parts[7];
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
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

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_487a06a811f1cadc {
    bit markedold;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 28;
metatable "hash_ce2ba9fe2f94c765";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    uint2 firstselectedloadouttype;
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct charactercontext {
    hash_5b3226f1816b17a hash_50ee7b4f9ae0c518[2];
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct character {
    hash_74e0cb6ea60c0207 itemlist[4];
    variant showcaseweapon;
    uint6 selectedcharacteritems[4];
    uint2 selectedloadouttype;
};

struct hash_5b3226f1816b17a {
    hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
    uint5 materialindex[2];
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_74e0cb6ea60c0207 {
    characteritem items[60];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_508eaeb5f638a293 {
    mix_s mix[4];
};

struct characteritem {
    uint3 colors[3];
    bit markedold;
    bit unlocked;
    padbit __pad[6];
};

struct mix_s {
    uint32 modelindex;
    float weight;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/cp_loadouts_offline.ddl";
version 27;
metatable "hash_a732da05dc9127fb";

struct root {
    int32 loadoutversion;
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    uint2 firstselectedloadouttype;
    hash_1489c97943984433 customclass[16];
    char customclassname[16][16];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct charactercontext {
    hash_5b3226f1816b17a hash_50ee7b4f9ae0c518[2];
    uint32 characterindex;
    uint2 selectedgender;
    uint5 selectedheadindex[2];
    uint32 charactermode;
};

struct hash_1489c97943984433 {
    uint10 primarygrenade;
    uint10 herogadget;
    hash_20631b664715b1fa secondary;
    hash_2c79abcce61676aa primary;
};

struct hash_2c79abcce61676aa {
    int8 paintjobslot;
    uint10 itemindex;
    int6 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct character {
    hash_74e0cb6ea60c0207 itemlist[4];
    variant showcaseweapon;
    uint6 selectedcharacteritems[4];
    uint2 selectedloadouttype;
};

struct hash_5b3226f1816b17a {
    hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
    uint5 materialindex[2];
};

struct hash_20631b664715b1fa {
    int8 paintjobslot;
    uint10 itemindex;
    int6 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_74e0cb6ea60c0207 {
    characteritem items[60];
};

struct variant {
    uint32 createtime;
    int8 paintjobslot;
    int11 variantindex;
    int8 attachment[8];
    char variantname[16];
    int2 readonly;
    int11 reticleindex;
    int9 weaponindex;
    byte camoindex;
    int32 sortindex;
};

struct hash_508eaeb5f638a293 {
    mix_s mix[4];
};

struct characteritem {
    uint3 colors[3];
    bit markedold;
    bit unlocked;
    padbit __pad[6];
};

struct mix_s {
    uint32 modelindex;
    float weight;
};


