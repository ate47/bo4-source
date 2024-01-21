begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 77;
metatable "hash_f3e7081e8749fa5";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 76;
metatable "hash_d1f9aad24c3d75e6";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 75;
metatable "hash_ffd702aa1595b826";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[60];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 74;
metatable "hash_390d2159aee0fbde";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 73;
metatable "hash_faf66eed3be1701b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 72;
metatable "hash_61f9608a8f308725";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 71;
metatable "hash_2ec85cee291ec3b5";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 70;
metatable "hash_45c5093942ce13fa";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 69;
metatable "hash_ab99a9d85d292e71";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 68;
metatable "hash_6f79639eee341c3e";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 67;
metatable "hash_dbaa6215dfba76e8";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 66;
metatable "hash_229758625b6aee91";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 65;
metatable "hash_d2e0d833db294c07";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 64;
metatable "hash_2fc0f9d8274a871c";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 63;
metatable "hash_948c05f3849911f9";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 62;
metatable "hash_7bf9a7aa0d21f73b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 61;
metatable "hash_43dd586dc30a6d3b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 60;
metatable "hash_1faab6b939f191db";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 59;
metatable "hash_d28b3f254f7d92d1";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 58;
metatable "hash_a2a49251bc20ec12";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 57;
metatable "hash_83cc538da1801c1b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 56;
metatable "hash_243d3d792b3b96d7";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 55;
metatable "hash_4884aca608d50403";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 54;
metatable "hash_11a6929019eafbb2";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 53;
metatable "hash_600a915470cb45b";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 52;
metatable "hash_c7ca04e196a5216c";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 51;
metatable "hash_c025cfca6f476881";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


,
begin "gamedata/ddl/generated/zm_loadouts_custom.ddl";
version 50;
metatable "hash_db68bec28f164271";

struct root {
    int32 loadoutversion;
    hash_51ee933f6ee8ec54 variant[50];
    hash_18b04f5b045db908 cacloadouts[2];
    bit loadoutinitialized;
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


