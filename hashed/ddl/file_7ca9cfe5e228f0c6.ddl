begin "hash_7ca9cfe5e228f0c6";
version 9;
metatable "hash_4a7e1214b0bfb9e9";

struct root {
    char map[24];
    char back[24];
    char frag[24];
    char left[24];
    char talk[24];
    char chatmodeparty[24];
    char raisestance[24];
    char hash_584e6d5b02f4e693[24];
    char calloutwheel[24];
    char melee[24];
    char prone[24];
    char right[24];
    char slide[24];
    char smoke[24];
    char goprone[24];
    char gostand[24];
    char vehiclehorn[24];
    char chatmodelast[24];
    char chatmodeteam[24];
    char hash_54c88672dfdcc78a[24];
    char hash_6a928eea40351a0f[24];
    char chatmodepublic[24];
    char quickconsume1[24];
    char quickconsume2[24];
    telemetry_header telemetry;
    int8 hash_188c9f291eebf570;
    char togglescoreswz[24];
    char togglescoreszm[24];
    char togglemap[24];
    char moveright[24];
    char centerview[24];
    char quickcycle_health[24];
    char weapswitchprimary[24];
    char hash_787a34d300ed84e3[24];
    char togglebreath[24];
    char hash_51acd2243adf5da7[24];
    char togglecrouch[24];
    char quickspray[24];
    char gocrouch[24];
    char toggleinventory[24];
    char hash_127574968f6ab5b[24];
    char togglescores[24];
    char flourish[24];
    char ui_contextual_1[24];
    char ui_contextual_2[24];
    char ui_contextual_3[24];
    char lookdown[24];
    char quickcallout[24];
    char hash_65a1a52171bbaea2[24];
    char scorestreak1[24];
    char scorestreak2[24];
    char scorestreak3[24];
    char scorestreak4[24];
    char inventory[24];
    char hash_78aca37c35c46b25[24];
    char hash_78aca07c35c4660c[24];
    char hash_78aca17c35c467bf[24];
    char hash_78ac9e7c35c462a6[24];
    char hash_78ac9f7c35c46459[24];
    char chooseclass_10[24];
    char chooseclass_11[24];
    char chooseclass_12[24];
    char speed_throw[24];
    char activate[24];
    char hash_38860be8fb273455[24];
    char chooseclass_1[24];
    char chooseclass_2[24];
    char chooseclass_3[24];
    char chooseclass_4[24];
    char chooseclass_5[24];
    char chooseclass_6[24];
    char chooseclass_7[24];
    char chooseclass_8[24];
    char chooseclass_9[24];
    char attack[24];
    client_header client;
    char hash_4fca6732aca41b2e[24];
    char holdbreath[24];
    char weapswitchsecondary[24];
    char hash_66ebea547ebac41[24];
    char lookup[24];
    char hash_5d0b479ede0393d4[24];
    char mantle[24];
    char pickup[24];
    char scores[24];
    char sprint[24];
    char stance[24];
    char weapnext[24];
    char weapprev[24];
    char forward[24];
    char breath_sprint[24];
    char autorun[24];
    char toggleprone[24];
    char weapoffhandspecial[24];
    char scoreswz[24];
    char scoreszm[24];
    char inventoryzm[24];
    char melee_zoom[24];
    char switchseat[24];
    char toggleinventoryzm[24];
    char hash_ed18aed621a69a7[24];
    char hold_sprint[24];
    char usebgb1[24];
    char usebgb2[24];
    char usebgb3[24];
    char usebgb4[24];
    char quickcycle_equipment[24];
    char hash_647be2427b894c00[24];
    char moveleft[24];
    char lowerstance[24];
};

struct telemetry_header {
    int32 changelist_number;
    uint16 source_version;
    hash action_type;
    hash_54196e9e9860f0be platform;
    char build_version[32];
    uint32 title_id;
    uint32 hash_56a1b6d783aa7a25;
    uint64 hash_f2ad74d8edb8204;
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


