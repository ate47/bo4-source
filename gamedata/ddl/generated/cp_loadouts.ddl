begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 66;
metatable "hash_df983aae9fffca99";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[35];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 65;
metatable "hash_8550f98efa676dd0";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[35];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 64;
metatable "hash_6da40b6a2f1aab35";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 63;
metatable "hash_1e3dc61a4842f371";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 62;
metatable "hash_88deefa7e36323dc";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 61;
metatable "hash_b9ff184b81cb3462";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 60;
metatable "hash_23d4ed929031881a";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 59;
metatable "hash_e618593c97d2eee";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 58;
metatable "hash_261f5b85e882ca1";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 57;
metatable "hash_2448eb68f9e1038";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 56;
metatable "hash_4661236214fdf257";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 55;
metatable "hash_af0fe3a622201a45";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 54;
metatable "hash_83fa5ed87f53e0e8";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[24];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 53;
metatable "hash_f1a03ba52c7c15fa";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 52;
metatable "hash_43f38751263e40de";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 51;
metatable "hash_7c170d35dbaed6fe";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 50;
metatable "hash_d1268c3617327c73";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 49;
metatable "hash_2caf5464ac15d750";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 48;
metatable "hash_821059804bc7438";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 47;
metatable "hash_e14713b7b6acb126";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 46;
metatable "hash_53e04852b01962ec";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 45;
metatable "hash_af5bfa85276c9f5d";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 44;
metatable "hash_41830f3c37bb4bcb";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 43;
metatable "hash_2440dec4cd204333";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 42;
metatable "hash_7f7556b5dc3432c4";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 41;
metatable "hash_ee087cf109369bc3";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 40;
metatable "hash_e44ccbf6b9555e1e";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 39;
metatable "hash_74077767d8fdf1a0";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 38;
metatable "hash_9ed442352dff6883";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 37;
metatable "hash_a822e8b6ae58b872";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 36;
metatable "hash_36868703ce420264";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[4];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 35;
metatable "hash_ddf226f49994a057";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 34;
metatable "hash_77b077138dcd3fd1";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 33;
metatable "hash_a4b0f961735d25fb";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 32;
metatable "hash_e83e8efd4d0c4e9";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 31;
metatable "hash_28df94b7eed394f7";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 30;
metatable "hash_2b5ec6f7873cb72f";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 29;
metatable "hash_ab3f9b8d0e224592";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 28;
metatable "hash_b4271f647edc73c0";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    uint2 firstselectedloadouttype;
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    string variantname;
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
    fixedpoint weight;
};


,
begin "gamedata/ddl/generated/cp_loadouts.ddl";
version 27;
metatable "hash_9e03260791a46c6f";

struct root {
    int32 loadoutversion;
    hash_31d8d99be94a78b7 cacloadouts;
    bit loadoutinitialized;
    padbit __pad[7];
};

struct hash_31d8d99be94a78b7 {
    uint10 loadoutversion;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[16];
    uint2 firstselectedloadouttype;
    hash_1489c97943984433 customclass[16];
    string customclassname[16];
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
    string variantname;
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
    fixedpoint weight;
};


