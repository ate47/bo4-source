begin "gamedata/ddl/generated/mp_stats.ddl";
version 129;
metatable "hash_5f7c34283efa9d7";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_6fa063681576be01 hash_1c26da773971edbe[10];
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_76635fe9df6f908a hash_53e1f85dd83451b4[3];
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[59];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_23d454a06e666aa7;
    bit hash_24b9a9540a303875[135];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_6fa063681576be01 {
    uint32 timestamp;
    uint32 hash_7543203aa5cede46;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_76635fe9df6f908a {
    hash_163b4cc29c22211b history[20];
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_163b4cc29c22211b {
    uint32 reveal_expiration;
    uint32 item_id;
    uint32 reveal_timestamp;
    byte hash_63a74a608ada995c;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 128;
metatable "hash_4c56ca155228fe49";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_6fa063681576be01 hash_1c26da773971edbe[10];
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_76635fe9df6f908a hash_53e1f85dd83451b4[3];
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[59];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[135];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_6fa063681576be01 {
    uint32 timestamp;
    uint32 hash_7543203aa5cede46;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_76635fe9df6f908a {
    hash_163b4cc29c22211b history[20];
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_163b4cc29c22211b {
    uint32 reveal_expiration;
    uint32 item_id;
    uint32 reveal_timestamp;
    byte hash_63a74a608ada995c;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 127;
metatable "hash_99b4b0cc84cacc93";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_6fa063681576be01 hash_1c26da773971edbe[10];
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_76635fe9df6f908a hash_53e1f85dd83451b4[3];
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[59];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[135];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_6fa063681576be01 {
    uint32 timestamp;
    uint32 hash_7543203aa5cede46;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_76635fe9df6f908a {
    hash_163b4cc29c22211b history[20];
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_163b4cc29c22211b {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 126;
metatable "hash_afb90f3473c343ea";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_6fa063681576be01 hash_1c26da773971edbe[10];
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[59];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[135];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_6fa063681576be01 {
    uint32 timestamp;
    uint32 hash_7543203aa5cede46;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 125;
metatable "hash_4a7faa2ff0fd23cb";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[59];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[135];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 124;
metatable "hash_ed2a63555483d1b9";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[57];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[133];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 123;
metatable "hash_d2771caf9e735d77";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[56];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[132];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_1d45b221dee76ee4[1024];
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit icon_owned[1024];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 122;
metatable "hash_c20a2afdd82e1c28";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[56];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[132];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 121;
metatable "hash_bdd432f18d089763";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[54];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[130];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 120;
metatable "hash_aa62a2b03d479b00";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[53];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[129];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 119;
metatable "hash_490ee11ed72dbe67";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[53];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[129];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[47];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[1];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 118;
metatable "hash_46d556f33bc2b720";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[51];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[127];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 117;
metatable "hash_97396f2a979895f0";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[51];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[126];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 116;
metatable "hash_6306a9c78bf221a3";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[46];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[121];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 115;
metatable "hash_37a5de71d5a76f95";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[46];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[120];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_6790ae6a6414898a[64];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    bit hash_46f3e7d5ffaa28e0[512];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 114;
metatable "hash_2ca78340f11e2b65";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[46];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[120];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 113;
metatable "hash_3b160e0b918cd7b8";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[45];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[119];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 112;
metatable "hash_f5f717243b33c564";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[44];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[36];
    bit hash_24b9a9540a303875[118];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 111;
metatable "hash_ff2d98a2139898e";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[44];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[118];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[46];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[2];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 110;
metatable "hash_56fe4a5969134d8";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[44];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[118];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4bfb4b2d10866d54;
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 109;
metatable "hash_a392a5116e63c7ea";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[44];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[118];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 108;
metatable "hash_d88e32aeb7f153b7";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[43];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[118];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 107;
metatable "hash_fabc4081d6d80908";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[43];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[117];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 106;
metatable "hash_fe8f1ca9d98bfd8f";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[35];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 105;
metatable "hash_d03adcdcf45c2726";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 104;
metatable "hash_62fcb049ed3b495b";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 103;
metatable "hash_5398dae5ef7b1d29";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_6d0dfba9cb92c2b5;
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 102;
metatable "hash_b6084fc834dd972e";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[45];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[3];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 101;
metatable "hash_8d932c6d883dfc7a";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[116];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 100;
metatable "hash_c7de8f60d1047363";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[42];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[115];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 99;
metatable "hash_e7260c9e54579fda";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[40];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[112];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_5ff972a708a8dfcf;
    bit hash_6ab5782b83d0099d;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_275860cf9febcc96;
    bit hash_4ee9bcf41dbb633a;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 98;
metatable "hash_b3c48bc528edefdf";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[40];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[112];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[6];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 97;
metatable "hash_29674a51f6c1fb3d";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[40];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    uint32 hash_730dca25bc735a45;
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[111];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 96;
metatable "hash_3b5ff6c870417c17";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[40];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    hash_309fddece60ad202 hash_39ddfb62a0697ab6[10];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[111];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_309fddece60ad202 {
    uint32 timestamp;
    uint32 item_id;
    byte hash_63a74a608ada995c;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 95;
metatable "hash_61f067890988edc8";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[40];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[111];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 94;
metatable "hash_281522326084ff14";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[39];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[110];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_6e38117666817880;
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 93;
metatable "hash_59c658695f6246ee";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_2c59a756b086fa29;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[39];
    hash_ce4b1dd0ab5e032 hash_3c432dbe9ebe70e9[128];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[110];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_ce4b1dd0ab5e032 {
    uint64 hash_17d1c53302160e90;
    uint64 test_id;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 92;
metatable "hash_cc083f7628a3f56";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[39];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[110];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 91;
metatable "hash_4c8146c322053673";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[37];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[108];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 90;
metatable "hash_d08b00fb71a97978";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[37];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[107];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 89;
metatable "hash_b1f4339f564d7dd";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[104];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_5fa3f523f8d669f3;
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[7];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 88;
metatable "hash_bd71bdab806bd68a";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[104];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_146a83be841474fa;
    bit hash_204702165f7b3238;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 87;
metatable "hash_2f7e98d3515c46e";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[104];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 86;
metatable "hash_4443c90da5ca79fe";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[103];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_1ea967f4a7686bfa[11];
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 85;
metatable "hash_a476f44120f70084";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_1132b799026858d1 loot_contracts[3];
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[103];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_1132b799026858d1 {
    uint32 contractid;
    uint32 completiontier;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 84;
metatable "hash_b88719941a6f0b5";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[103];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_184218561cfb02e4[11];
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[5];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 83;
metatable "hash_c0883c25b1503371";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[103];
    bit hash_3dc4e6e4baa0b494;
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 82;
metatable "hash_71b088bbd0f9365b";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[30];
    bit hash_24b9a9540a303875[103];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 81;
metatable "hash_7f608aa0d428b859";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[29];
    bit hash_24b9a9540a303875[103];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[2];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 80;
metatable "hash_8c65f0adff5030d1";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_2cad871e3d814528;
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[28];
    bit hash_24b9a9540a303875[103];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 79;
metatable "hash_c3bec47ebdfff555";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[28];
    bit hash_24b9a9540a303875[103];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[44];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[4];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 78;
metatable "hash_4ef3cef72060bccf";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    hash_1898703fb0109487 hash_6326a574b8674519[34];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[28];
    bit hash_24b9a9540a303875[103];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_42799a890d40252f[1024];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_58bb06b8b337e385[1024];
    bit hash_4090306fb1961c43;
    bit hash_5a4b44a7cb161266[42];
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[3];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_1898703fb0109487 {
    bit hash_1ac5d98f9ecf4617[42];
    bit hash_5d8e0e10a5664d5c[8];
    bit hash_2e3660bdec3818fd[512];
    bit hash_5f4b90954c205cde[64];
    padbit __pad[6];
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 77;
metatable "hash_61b8260ece6bff60";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    char hash_6073ea7c9a394456[6];
    bit hash_6a6ee0a867b10f80[28];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 76;
metatable "hash_26c693fbe35201e8";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    uint32 hash_260a6267b14b8126[3];
    char clantag[5];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    char hash_6073ea7c9a394456[6];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 75;
metatable "hash_30f6606d8f4046f1";

struct root {
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    char clantag[5];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    hash_4976dab983b23e8c consoleinfo[10];
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    byte demonwareflags[32];
    uint32 uploadbandwidth;
    int32 motdviewtime;
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    char hash_6073ea7c9a394456[6];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 74;
metatable "hash_25ef22a21e514145";

struct root {
    dlc_t dlc;
    uint32 hash_151429c0411edbfb;
    int32 unlocktokencount_weapon;
    mapstats mapstats[7];
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    hash_6d7a1373d79780a5 hash_a1929c01226c9c7;
    uint64 gamebookmarks[16];
    uint3 onboardingstate;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct mapstats {
    hash_395a924a7ae5bc75 permode[44];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    hash_d42e412b1c8b06b hash_c66430efac57d2e;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_5a6db56b48690b58 leagueplaystats;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_6d7a1373d79780a5 {
    int32 hash_590227e36ca116c2;
    int32 hash_5da867109e469462;
    int32 hash_5b755259ad280150;
    int32 hash_4c9f82ae071fec8f;
    int32 hash_2e8ad409e4ad1243;
    int32 hash_5f35c3dbc90c6dfd;
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    byte clientnum;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    hash_2d74f509e9d33a86 materials[128];
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 layers[12];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_395a924a7ae5bc75 {
    int32 win;
    int32 draw;
    int32 loss;
    int32 stat1;
    int32 stat2;
    int32 timeplayed;
    int32 gamesplayed;
};

struct hash_d42e412b1c8b06b {
    uint32 gamestates[3];
    uint32 hash_22c57e1351555439;
};

struct hash_5a6db56b48690b58 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_18562676c03c7954 {
    bit markedold;
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 73;
metatable "hash_3e9066509220b809";

struct root {
    dlc_t dlc;
    uint32 hash_151429c0411edbfb;
    int32 unlocktokencount_weapon;
    mapstats mapstats[7];
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    hash_54bc36a7cdf60b00 hash_26f01ccefc6c3d88;
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    uint3 onboardingstate;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct mapstats {
    hash_395a924a7ae5bc75 permode[44];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    hash_d42e412b1c8b06b hash_c66430efac57d2e;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_5a6db56b48690b58 leagueplaystats;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

struct hash_54bc36a7cdf60b00 {
    int32 hash_1f1b76509297b72a;
    int32 hash_e9b1d10cb7047d4;
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    byte clientnum;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    hash_2d74f509e9d33a86 materials[128];
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 layers[12];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_395a924a7ae5bc75 {
    int32 win;
    int32 draw;
    int32 loss;
    int32 stat1;
    int32 stat2;
    int32 timeplayed;
    int32 gamesplayed;
};

struct hash_d42e412b1c8b06b {
    uint32 gamestates[3];
    uint32 hash_22c57e1351555439;
};

struct hash_5a6db56b48690b58 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_18562676c03c7954 {
    bit markedold;
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 72;
metatable "hash_c64e1f757504cfba";

struct root {
    dlc_t dlc;
    uint32 hash_151429c0411edbfb;
    int32 unlocktokencount_weapon;
    mapstats mapstats[7];
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    uint3 onboardingstate;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_499c6aab0471a4ac;
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct mapstats {
    hash_395a924a7ae5bc75 permode[44];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    hash_d42e412b1c8b06b hash_c66430efac57d2e;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_5a6db56b48690b58 leagueplaystats;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    byte clientnum;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    hash_2d74f509e9d33a86 materials[128];
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 layers[12];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_395a924a7ae5bc75 {
    int32 win;
    int32 draw;
    int32 loss;
    int32 stat1;
    int32 stat2;
    int32 timeplayed;
    int32 gamesplayed;
};

struct hash_d42e412b1c8b06b {
    uint32 gamestates[3];
    uint32 hash_22c57e1351555439;
};

struct hash_5a6db56b48690b58 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};

struct hash_18562676c03c7954 {
    bit markedold;
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 71;
metatable "hash_30cf7f08d32ec409";

struct root {
    dlc_t dlc;
    uint32 hash_151429c0411edbfb;
    int32 unlocktokencount_weapon;
    mapstats mapstats[7];
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[44];
    byte demonwareflags[32];
    float skill_rating;
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[44];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    uint3 onboardingstate;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[44];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct mapstats {
    hash_395a924a7ae5bc75 permode[44];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    hash_d42e412b1c8b06b hash_c66430efac57d2e;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_5a6db56b48690b58 leagueplaystats;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    byte clientnum;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    hash_2d74f509e9d33a86 materials[128];
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 layers[12];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_395a924a7ae5bc75 {
    int32 win;
    int32 draw;
    int32 loss;
    int32 stat1;
    int32 stat2;
    int32 timeplayed;
    int32 gamesplayed;
};

struct hash_d42e412b1c8b06b {
    uint32 gamestates[3];
    uint32 hash_22c57e1351555439;
};

struct hash_5a6db56b48690b58 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};

struct hash_18562676c03c7954 {
    bit markedold;
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/mp_stats.ddl";
version 70;
metatable "hash_a272671b6f3ff970";

struct root {
    dlc_t dlc;
    uint32 hash_151429c0411edbfb;
    int32 unlocktokencount_weapon;
    mapstats mapstats[7];
    int32 hash_24f7bb044fb8a7b5;
    uint32 hash_3ec47111a3993e52;
    uint4 lastconsolesave;
    hash_d847c3e97c74b7d arenabest;
    hash_72a4ed0fc3efdcc weaponcontractdata;
    uint64 player_xuid;
    uint5 selectedcustomclass;
    hash_5ef0b8418736fce5 hash_42a4964bbd0c65a9[10];
    uint32 hashlen;
    uint64 hash_37aeca4d39214e62;
    byte extrabytes[16];
    hash_503eb0de8f9cf7c2 gamehistory[2];
    hash_67b00e3091cde2fd attachments[56];
    short arenachallengeseasons[12];
    int32 hash_5199b511aa25f017;
    int32 hash_516aa111a9fe5d59;
    int32 hash_51b19c11aa3a577d;
    uint24 higheststats[8];
    hash_1608f63ae729eda5 weaponstats[256];
    hash_78ac7dfcd6939c25 hash_4414ff885506d857[2];
    uint32 hash_56c806cc4a28c108;
    int32 hash_62512286fe0c2426;
    hash_1a52129598e71dab hash_53f43899387a360d[10];
    hash_24a4216e08f40838 specialiststats[13];
    int32 combattrainingwins;
    uint64 connectionid;
    uint5 gamebookmarkindex;
    int32 motdversionviewed;
    int32 hash_5626babef5903cfc;
    uint4 currenthitlocationindex;
    hash_3b0f9e0921513e2c recenthitloccounts[10];
    byte hash_5988aeaa53d6e90c[50];
    hash_4976dab983b23e8c consoleinfo[10];
    hash_d847c3e97c74b7d arenaperseasonstats;
    hash_759307445fb58dda hash_76eacd7e06fe7a[32];
    uint32 hash_10ddf783cbee6688;
    uint64 hash_188ecc3aca50f93d;
    int32 hash_54c694770b846433;
    hash_2e1d3d3bb036d22c playerstatsbygametype[38];
    byte demonwareflags[32];
    float skill_rating;
    int32 unlocktokencount_attachment;
    float hash_2363e7e74077b1c0[38];
    uint32 uploadbandwidth;
    hash_4f6f299a12577aa4 prestigetokens[20];
    hash_4bb25d7ad41fb449 probation[2];
    int32 motdviewtime;
    hash_6ef8b9b7a8fd75e1 groupstats[23];
    uint64 gamebookmarks[16];
    uint3 onboardingstate;
    hash_6b3db80d498eb06 playerstatslist[996];
    hash_402baff65ae9b838 clantagstats;
    float skill_variance;
    float hash_3a7324ad328f0e2e[38];
    fixedpoint hash_6a927decba86a3c3;
    hash_6d83fd06705c52be afteractionreportstats;
    byte unlocks[32];
    hash_790a163d0959fa18 emblemstats;
    hash_48cae9b9fcff7a5e itemstats[256];
    hash_d847c3e97c74b7d arenastats[9];
    char hash_6073ea7c9a394456[6];
    char hash_7d19b83705dea420[32];
    bit extrabools[16];
    bit hash_589bf647eb598158;
    bit blackmarketshowbreadcrumb;
    bit hash_146a83be841474fa;
    bit musicunlocks[32];
    bit hash_1576a2fd30a2dfb0[64];
    bit hash_2a485540cdb72af1;
    bit hash_4090306fb1961c43;
    bit completedfirsttimeflow;
    bit hash_7d22494ddebb227f;
    padbit __pad[1];
};

struct hash_67b00e3091cde2fd {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_72a4ed0fc3efdcc {
    uint32 completetimestamp;
    uint16 currentvalue;
    uint32 starttimestamp;
    uint16 matchesplayed;
};

struct mapstats {
    hash_395a924a7ae5bc75 permode[38];
};

struct dlc_t {
    uint32 mappacks;
    bit mtx[128];
};

struct hash_d847c3e97c74b7d {
    uint32 ties;
    uint32 wins;
    float skill;
    hash_d42e412b1c8b06b hash_c66430efac57d2e;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_5a6db56b48690b58 leagueplaystats;
};

struct hash_5ef0b8418736fce5 {
    uint16 ekia;
    uint16 kills;
    uint24 score;
    uint32 timeplayed;
    uint16 objectiveekia;
    uint32 objectivetime;
    uint16 objectivescore;
    uint16 objectivedefends;
    uint24 damage;
    uint16 deaths;
    hash_56ed65bfde235bb3 outcome;
    bit valid;
    padbit __pad[7];
};

struct hash_503eb0de8f9cf7c2 {
    hash_5fafb39a86bc6dc7 matchhistory[32];
    hash_b5aec1419b9a02d modehistory;
    byte currentmatchhistoryindex;
};

struct hash_1608f63ae729eda5 {
    uint24 xp;
    uint2 plevel;
    bit attachmentmarkedold[56];
    bit optionmarkedasold[300];
    padbit __pad[4];
};

struct hash_78ac7dfcd6939c25 {
    bit markedold[128];
};

struct hash_1a52129598e71dab {
    short kills;
    uint24 score;
    short gametype;
    short deaths;
    bit valid;
    padbit __pad[7];
};

struct hash_24a4216e08f40838 {
    hash_6b3db80d498eb06 stats[12];
    bit hash_2d7ffd234fc689c6[6];
    padbit __pad[2];
};

struct hash_3b0f9e0921513e2c {
    byte hitlocations[19];
    byte criticalhitlocations[19];
    bit valid;
    padbit __pad[7];
};

struct hash_4976dab983b23e8c {
    uint32 timestamp;
    uint32 nattype;
    uint64 macaddress;
    char consoleid64[32];
    hash_25a11738b4152d0e ipexternal;
    uint32 usecount;
};

struct hash_759307445fb58dda {
    byte pollid;
    byte optionid;
};

struct hash_2e1d3d3bb036d22c {
    hash_6b3db80d498eb06 ties;
    hash_6b3db80d498eb06 wins;
    hash_6b3db80d498eb06 assists;
    hash_6b3db80d498eb06 crush;
    hash_6b3db80d498eb06 kills;
    hash_6b3db80d498eb06 score;
    hash_6b3db80d498eb06 time_played_total;
    hash_6b3db80d498eb06 challenge1;
    hash_6b3db80d498eb06 challenge2;
    hash_6b3db80d498eb06 challenge3;
    hash_6b3db80d498eb06 challenge4;
    hash_6b3db80d498eb06 challenge5;
    hash_6b3db80d498eb06 challenge6;
    hash_6b3db80d498eb06 challenge7;
    hash_6b3db80d498eb06 challenge8;
    hash_6b3db80d498eb06 challenge9;
    hash_6b3db80d498eb06 win_streak;
    hash_6b3db80d498eb06 cur_win_streak;
    hash_6b3db80d498eb06 kill_streak;
    hash_6b3db80d498eb06 deaths;
    hash_6b3db80d498eb06 wlratio;
    int5 prevscoreindex;
    hash_6b3db80d498eb06 losses;
    hash_6b3db80d498eb06 defends;
    hash_6b3db80d498eb06 offends;
    hash_6b3db80d498eb06 challenge10;
    hash_5ef0b8418736fce5 prevscores[10];
    hash_6b3db80d498eb06 kdratio;
};

struct hash_4f6f299a12577aa4 {
    byte itemunlocked;
    bit tokenspent;
    bit tokentype[4];
    padbit __pad[3];
};

struct hash_4bb25d7ad41fb449 {
    uint32 count;
    uint32 version;
    uint32 timewhenprobationisdone;
};

struct hash_6ef8b9b7a8fd75e1 {
    hash_6b3db80d498eb06 stats[20];
};

struct hash_6b3db80d498eb06 {
    short challengevalue;
    uint32 statvalue;
    bit arenavalue;
    padbit __pad[7];
};

struct hash_402baff65ae9b838 {
    char clanname[5];
};

struct hash_6d83fd06705c52be {
    short nemesisrankicon;
    byte clientnum;
    int32 surveyid;
    short nemesiskills;
    short nemesiskilledby;
    byte nemesisheroindex;
    char nemesisname[32];
    short nemesisrank;
    uint64 nemesisxuid;
    bit valid;
    bit hardcore;
    bit privatematch;
    padbit __pad[5];
};

struct hash_790a163d0959fa18 {
    hash_18562676c03c7954 icons[1024];
    hash_2d74f509e9d33a86 materials[128];
    hash_18562676c03c7954 backgrounds[700];
    hash_2d74f509e9d33a86 layers[12];
};

struct hash_48cae9b9fcff7a5e {
    hash_6b3db80d498eb06 stats[20];
    bit purchased;
    bit markedold;
    padbit __pad[6];
};

struct hash_395a924a7ae5bc75 {
    int32 win;
    int32 draw;
    int32 loss;
    int32 stat1;
    int32 stat2;
    int32 timeplayed;
    int32 gamesplayed;
};

struct hash_d42e412b1c8b06b {
    uint32 gamestates[3];
    uint32 hash_22c57e1351555439;
};

struct hash_5a6db56b48690b58 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};

struct hash_18562676c03c7954 {
    bit markedold;
};

enum hash_56ed65bfde235bb3 {
    "loss" = 0x0,
    "win" = 0x1,
    "draw" = 0x2
};

struct hash_5fafb39a86bc6dc7 {
    short kills;
    uint24 score;
    uint32 startingtime;
    uint32 endingtime;
    uint5 scoreboardposition;
    float teamscoreratio;
    uint5 gametype;
    short deaths;
    uint3 quittype;
    bit forgiven;
    padbit __pad[7];
};

struct hash_b5aec1419b9a02d {
    hash_2f60329a207db2b8 hosted;
    hash_2f60329a207db2b8 played;
};

struct hash_25a11738b4152d0e {
    byte a;
    byte b;
    byte c;
    byte d;
};

struct hash_2d74f509e9d33a86 {
    bit markedold;
};

struct hash_2f60329a207db2b8 {
    uint24 quit;
    uint24 started;
    uint24 completed;
    uint24 timeout;
    uint24 kicked;
    uint24 dashboard;
};


