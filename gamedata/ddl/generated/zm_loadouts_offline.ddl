begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 77;
metatable "hash_41bf556af64620dc";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint11 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[28];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 76;
metatable "hash_8d8d55e271b67450";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint11 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 75;
metatable "hash_52fb6418c6a9f75b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint11 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 74;
metatable "hash_e10c739ed8812536";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint11 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 73;
metatable "hash_70ee67ee10b693b2";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 72;
metatable "hash_244335a842bf68e9";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 71;
metatable "hash_3204dda4898cf7de";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 70;
metatable "hash_ed3f964b441cc354";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
    uint8 hash_10b7b244c876d78a[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint8 hash_4e153e9373f1683c;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 69;
metatable "hash_c105deea1666a28";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 68;
metatable "hash_50e6cbeab2959daa";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 67;
metatable "hash_b962af15ce00d127";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 66;
metatable "hash_8915f4970e515867";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 65;
metatable "hash_f2406e9879e9d53c";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 64;
metatable "hash_96d29b98438e5b90";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 63;
metatable "hash_c1d2f986ba36ba83";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 62;
metatable "hash_73c2811923492065";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 61;
metatable "hash_aa9a0ccbd8188599";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct hash_768aeb6b928320d {
    hash_705fa6d3f50ff148 parts[8];
    bit hash_63930aafa5d6ac7b[64];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 60;
metatable "hash_867c3cc9283cf561";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 59;
metatable "hash_4c5ff243d5f705c2";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint9 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 58;
metatable "hash_532e0e642d090b60";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 57;
metatable "hash_995efd43c551cf6c";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 56;
metatable "hash_2b0bd72668cc361a";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_f48e22ced35e56d[1024];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 55;
metatable "hash_aa6eea904f56c988";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 54;
metatable "hash_d09e3b3e6109a18d";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    hash_5fe8e8cb2b27ba05 elixirs;
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 53;
metatable "hash_699d7f8ea849e356";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 52;
metatable "hash_f255925a0247f45e";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint8 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 51;
metatable "hash_f3f1e63df9fa9810";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 50;
metatable "hash_82d756912fa336f8";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint4 weaponmodelslot;
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 49;
metatable "hash_a274319b40bb1564";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    uint8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 48;
metatable "hash_aabc662075357309";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 47;
metatable "hash_fd2c5a0a638faa6c";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_32aeae7311d2cd9b {
    uint5 hash_212bcdfa518cc913[8];
};

struct hash_705fa6d3f50ff148 {
    bit hash_3d834aee4bd18d13[16];
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 46;
metatable "hash_b33755cd6276afa6";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint8 hash_78e9cef0ed273bd;
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 45;
metatable "hash_f7dba794f73c1f8d";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[9];
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 44;
metatable "hash_e007fa72ae1dd6cc";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    uint11 hash_20d6751cb2f9ca09[8];
    hash_768aeb6b928320d hash_7cf85c301a206997[32];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
    bit hash_f48e22ced35e56d[1024];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 43;
metatable "hash_ef7ae34f3e72eee6";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_51ee933f6ee8ec54 {
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 42;
metatable "hash_c740288955a06c35";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_51ee933f6ee8ec54 {
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 41;
metatable "hash_1e6d57f104869165";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[24];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
    bit hash_6daffc8ba44646eb;
    bit hash_4a7be35adcdd0183;
    bit hash_490318f2d43cdc68;
    padbit __pad[5];
};

struct hash_51ee933f6ee8ec54 {
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct character {
    uint6 selectedoutfit;
    hash_380775ab8e293fe7 hash_b56427620aa34e1[32];
    uint10 hash_20d6751cb2f9ca09[8];
    hash_32aeae7311d2cd9b hash_e5c77948998e49[32];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 40;
metatable "hash_c251466f1118afdf";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 39;
metatable "hash_cd89b40c0f136a2";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 38;
metatable "hash_6e68cab41955f5f5";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 37;
metatable "hash_4e12681ab01a819b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 36;
metatable "hash_72a67e5bf24b587d";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 35;
metatable "hash_ccbc18ad130fcff";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 34;
metatable "hash_d57d6a47c9ec2314";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    zmloadout customclass[10];
    string customclassname[10];
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

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
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

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 33;
metatable "hash_cbd9e0d3595b3b53";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int8 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[21];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint2 firstselectedloadouttype;
    zmloadout customclass[10];
    string customclassname[10];
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

struct character {
    hash_74e0cb6ea60c0207 itemlist[4];
    variant showcaseweapon;
    uint6 selectedcharacteritems[4];
    uint2 selectedloadouttype;
};

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_5b3226f1816b17a {
    hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
    uint5 materialindex[2];
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


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/zm_loadouts_offline.ddl";
version 32;
metatable "hash_10cc4875c23724fa";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    int32 reserveints[64];
    byte hash_182458d9aadf50fe[64];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
    bit hash_d4aef679e9c5e94[64];
    padbit __pad[7];
};

struct hash_51ee933f6ee8ec54 {
    int8 paintjobslot;
    uint10 itemindex;
    int6 attachment[7];
    uint6 reticleindex;
    uint6 camoindex;
};

struct hash_18b04f5b045db908 {
    uint10 loadoutversion;
    int5 equippedbubblegumpack;
    charactercontext charactercontext;
    uint32 firstselectedcharacterindex;
    character characters[11];
    hash_5fe8e8cb2b27ba05 bubblegumpack[10];
    uint2 firstselectedloadouttype;
    zmloadout customclass[10];
    string customclassname[10];
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

struct character {
    hash_74e0cb6ea60c0207 itemlist[4];
    variant showcaseweapon;
    uint6 selectedcharacteritems[4];
    uint2 selectedloadouttype;
};

struct hash_5fe8e8cb2b27ba05 {
    string packname;
    uint10 bubblegumbuff[5];
};

struct zmloadout {
    uint10 primarygrenade;
    uint6 talisman1;
    uint5 specialty[6];
    uint10 herogadget;
    hash_51ee933f6ee8ec54 secondary;
    hash_51ee933f6ee8ec54 primary;
};

struct hash_5b3226f1816b17a {
    hash_508eaeb5f638a293 hash_506cb6b5f61bc9c5[5];
    uint5 materialindex[2];
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


