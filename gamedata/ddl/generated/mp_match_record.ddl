begin "gamedata/ddl/generated/mp_match_record.ddl";
version 155;
metatable "hash_4f850b791f0b8337";

struct root {
    char map[32];
    int32 loadoutversion;
    uint32 hash_375e93395e4f1f12;
    byte player_count;
    uint32 hash_7888f9b0e8c46d42;
    life lives[490];
    hash_5efdb8ef8b6af1cb nondamageassists[125];
    uint64 match_id;
    int32 server_frame_msec;
    uint32 hash_209155237819d179;
    byte hash_5be2776e72fe7105;
    telemetry_header telemetry;
    hash playlist_name;
    hash_40387f9bff6d9d3c hash_198631ca796593c8[600];
    char hash_4e397fa6657da523[32];
    int32 hash_2678ed840a344d55;
    byte hash_115ec7b8fbf85bae;
    hash game_type;
    byte hash_481ee9109f272237;
    char hash_4270d43d00e554ea[32];
    uint64 hash_7baa6dadf52e04cd;
    uint32 hash_7baa59adf52de2d1;
    int32 compass_map_upper_left[3];
    hash_c464eb471b1c18a challengescompleted[100];
    hash_7f7a5814a86a5885 killstreaks[125];
    byte hash_7f29e138a8813e47;
    short numnondamageassists;
    byte bot_count;
    uint16 hash_7701efac52d36b8d;
    hash_70fd30917359da6c hash_74f514e2df10ccfe[125];
    byte hash_53437329fef70258;
    uint32 hash_3653705f019c3698;
    int32 playlist_id;
    hash_6455b0739942db12 hash_6b07a9aad2f64f52[600];
    uint32 hash_d2c3c4dbbb08a57;
    byte hash_63f745385e07b822;
    uint32 hash_589dfa1826b4eeac;
    byte hash_2e9e7ae5d3016cb;
    hash_4cc3ca9227e9ee6e hash_5928d624612f505e[600];
    hash_5117bce61a2e0fe3 header;
    hash test_name;
    short hash_8b84fa66f763a30;
    uint32 breadcrumbs_total;
    int32 playlist_version;
    hash_2c63a98fdae81bb5 rounds[24];
    uint10 life_count;
    byte hash_3ef2181996ff32c4;
    int32 compass_map_lower_right[3];
    short hash_2b3baab47172d58e;
    uint16 numchallengescompleted;
    byte heatmapdatagenerated;
    player players[24];
    uint32 duration_ms;
    int32 ffotd_version;
    gameevent hash_2fdd4442347356b9[384];
    int32 hash_7b16fbbf75fe39b3;
    bit hash_30cd270fd17b61b9;
    bit hash_706dd6b881aa67f4;
    bit hash_74d0769494af24a9;
    bit hash_51f54a99130c26e8;
    bit loadoutinitialized;
    bit hash_671d5b300061b30f;
    bit is_dedicated;
    bit hash_9bb341c4fe5412b;
};

struct hash_5efdb8ef8b6af1cb {
    uint9 victimlifeindex;
    uint8 killstreakindex;
    uint9 killerlifeindex;
};

struct life {
    byte player_index;
    uint32 hash_6e5b19c572681334;
    byte killer_index;
    uint8 victimdecisecondssincelastboostjump;
    int16 hash_454de72194b791e3[3];
    byte hash_2380fc76594e930d;
    uint8 hash_5fd40d280de4f20a;
    uint8 killerdecisecondssincelastkneeslide;
    byte hash_102e2ac61a8f5910;
    uint8 hash_66088b270a9d0d5f;
    byte attacker_index;
    byte hash_1b81d2fe509f0457;
    uint32 hash_7567115bc2aa4bf;
    int32 hash_237c7abb74490333[3];
    byte hash_67e7ffe4f1c4eb88;
    byte hash_180d7941d4c7a89b;
    uint16 victimtimespentswimmingdeciseconds;
    uint32 hash_2031532f95082529;
    uint16 victimtimespentwallrunningdeciseconds;
    int32 hash_55862148a238c704[3];
    uint10 attackerdelta;
    uint32 hash_374b79ec47e1e6e9;
    byte hash_35bd3b1cbe489e62;
    uint8 victimdecisecondssincelastwallrun;
    uint32 hash_7c5a630513a7bfd5;
    float hash_202011f4c98c00b1;
    byte hash_656f3981134db095;
    uint10 hash_6677b86a4c2c0d54;
    hash character_decal_lootid;
    uint10 hash_3976a49a3ab81759;
    uint8 killerdecisecondssincelastboostjump;
    hash hash_20d6751cb2f9ca09[9];
    hash hash_4f557c87c0538129;
    hash character_outfit_lootid;
    byte hash_56e7eb0d1597ec79;
    hash hash_63862160f8335af2;
    uint10 hash_9071b1ce927d040;
    uint8 victimdecisecondssincelastswim;
    uint10 victimdelta;
    short means_of_death;
    int16 hash_2b1c58498e7dc582[3];
    byte multikill;
    short hash_3ca62fd7f5d50ede;
    int32 hash_9677cf4f08d8697[3];
    uint8 killerdecisecondssincelastwallrun;
    short hash_1783a3513be4bd7c;
    hash specialist;
    int16 hash_648ba56f725b9077[3];
    uint32 hash_3faf0f7b322f3cfc;
    uint8 vicitmdecisecondssincelastkneeslide;
    float dotofdeath;
    char character_gender[8];
    uint8 killerdecisecondssincelastswim;
    uint8 victimnumberofkneeslides;
    byte assists;
    uint32 hash_cc61feedcebaa4d;
    uint5 character_outfit;
    hash hash_4b4bd85ab964d386;
    short hash_267c492e9ba804df;
    int32 spawn_pos[3];
    hash character_warpaint_lootid;
    uint5 character_warpaint_outfit;
    uint8 victimnumberofboostjumps;
    uint32 hash_1167938b851224e;
    bit died;
    bit hash_7e25889643b8fe1b;
    bit killersweaponaltmode;
    bit hash_244864600cc60ac8;
    bit hash_35ccbe74e6d95ab5;
    bit hash_37c081085bfecffa;
    bit hash_61cc3ce6a5e5b529;
    bit hash_37fd9537b3e20888;
    bit hash_2f090963f5d45718;
    bit hash_5d24f65e97cc3f43;
    bit hash_47ca5f583ae26a22;
    bit hash_1a3b58ae3753c6f8[17];
    bit hash_674598aa9fe3d19a;
    bit hash_1b44e07bdd740d34;
    bit hash_7736beab2de1a2e8;
    bit hash_6c3353c097547c79;
};

struct hash_40387f9bff6d9d3c {
    uint4 hits;
    hash item;
    int32 hash_450ab9ff85668b5a[3];
    uint4 shots;
    uint32 hash_5715e55450648bd5;
    short hash_3702989295e6967c;
    bit expirationthroughdeath;
    padbit __pad[7];
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

struct hash_c464eb471b1c18a {
    hash hash_62e7261a9dd66829;
    byte playerindex;
    char challengestring[64];
    uint8 itemindex;
    uint8 statsmilestonescsvnum;
    uint8 challengetier;
};

struct hash_7f7a5814a86a5885 {
    int32 hash_450ab9ff85668b5a[3];
    uint32 hash_41037faade6d9357;
    byte player_index;
    byte event_type;
    uint32 hash_5715e55450648bd5;
};

struct hash_70fd30917359da6c {
    byte player_index;
    short kills_total;
    byte event_type;
    uint32 hash_5715e55450648bd5;
};

struct hash_6455b0739942db12 {
    hash item;
    int32 hash_450ab9ff85668b5a[3];
    uint32 hash_5715e55450648bd5;
    short hash_3702989295e6967c;
};

struct hash_4cc3ca9227e9ee6e {
    hash item;
    int32 hash_450ab9ff85668b5a[3];
    uint32 hash_5715e55450648bd5;
    short hash_3702989295e6967c;
};

struct hash_5117bce61a2e0fe3 {
    byte hash_67b62b296d706394;
    uint32 hash_4f4661f71ba9b642;
    uint32 hash_5d03a11cca20029d;
    uint32 hash_388c001cb4f44253;
    uint32 hash_38a7161cb50b2f6d;
    uint64 gamelobbyid;
    char hash_171ccd1d53f4a29c[6];
    char hash_6a09a522fc58eb9c[6];
    uint32 hash_178ca468b39c2feb;
    byte hash_63abbc412baff248;
    char localtimestring[64];
    uint64 matchhashlow;
    char consoleid64[32];
    uint64 demofileid;
    byte hash_397b8ccc620c9686;
    byte hash_11df063e5227e9e2;
    uint64 matchhashhigh;
    uint32 hash_374014802bf0424a;
    short hash_1e270dd38289b20c;
    int32 lootxptocryptokeyratio;
    char hash_1ae4c6d20b5e797f[32];
    char hash_5651360773a57427[32];
    uint32 utcoffsetfromserver;
    bit presetclassesperteam;
    bit oldschool;
    bit disablecac;
    bit disableclassselection;
    padbit __pad[4];
};

struct hash_2c63a98fdae81bb5 {
    int32 hash_375e93395e4f1f12;
    int32 hash_209155237819d179;
    uint32 start_time_ms;
    uint32 end_time_ms;
    bit hash_1f2c1112324566e5;
    padbit __pad[7];
};

struct player {
    uint32 ip;
    hash_6580ccf5f8a0ef6 dml;
    uint64 dwid;
    short ekia;
    byte team;
    float averagespeedduringmatch;
    short kills;
    uint32 score;
    uint64 ucdid;
    uint32 challenge_xp;
    uint16 hash_28e223b2b55169af[16];
    int32 end_losses;
    short killsdenied;
    float totalkilldistances;
    int32 end_misses;
    uint32 match_xp;
    byte hitlocations[19];
    char hash_3966aeef290c6840[8];
    uint16 hash_4a7e06dfdb6ac120;
    float numkilldistanceentries;
    uint16 challenges;
    float skill_variance_start;
    uint32 hash_4cfee808be9cf408;
    int32 loottimeplayed;
    uint16 challengescompletedcount;
    int32 end_prestige;
    float boostingscore;
    uint32 hash_3e428c87cd41cb83;
    float skill_rating_start;
    byte hash_709c4368e326c4f6;
    byte position;
    int32 start_prestige;
    hash_6425595b349c2207 weapon_stats[12];
    int32 controllerparticipationchecksskipped;
    uint32 hash_102667903f187a72;
    uint32 connectivitybits;
    char hash_ce47f1f62861550[24];
    uint32 lootxpearned;
    uint32 misc_xp;
    int32 controllerparticipationendgameresult;
    float percentageoftimemoving;
    uint32 pointstowin;
    byte party_id;
    int32 controllerparticipationconsecutivefailuremax;
    int32 start_games_played;
    byte hash_73577b207cfb7411;
    uint8 playerquitteamscore;
    float totaldistancetravelled;
    hash_1bef350b03b6f166 hash_3a88befccd51691b[300];
    uint64 hash_35e13b49beac01b0;
    uint32 start_xp;
    int32 objectivetime;
    short killsconfirmed;
    uint8 playerquitopposingteamscore;
    short highestkillstreak;
    int32 controllerparticipation;
    short cryptokeysbeforematch;
    float timeplayedalive;
    short num_lives;
    float timeplayedmoving;
    float numspeedswhenmovingentries;
    int32 code_client_num;
    int32 end_hits;
    byte hash_6f155c5c7cca606d;
    int32 end_wins;
    short hash_68e4530b257fb42f[3];
    uint8 nemesis;
    hash_7cc11183a39c74dc loadouts;
    int32 end_games_played;
    uint64 lobby_id;
    hash_54196e9e9860f0be platform;
    int32 end_kills;
    int32 end_score;
    short hash_ec4aea1a8bbd82;
    short hash_2044e5ddbbd19a8e[3];
    float hash_14813a3c1b267555;
    byte hash_51db55fc1339e092;
    uint8 playerquitroundnumber;
    uint16 hash_6d28b22a32f35904;
    char consoleid64[32];
    short hash_49ea128912ee851d;
    byte suicides;
    int32 end_total_time_played_s;
    byte totalkillcamsskipped;
    byte numdogscalled;
    int32 controllerparticipationchecks;
    short hash_6c4bd48708d6ca7d;
    int32 start_hits;
    byte hash_2b2e4e83da414b1e;
    int32 start_wins;
    hash hash_30b4939982419090;
    int32 start_kills;
    int32 start_score;
    uint9 lootxpbeforematch;
    float skill_rating;
    byte jointype;
    client_header client;
    short deaths;
    uint32 end_xp;
    uint7 tier_boost;
    byte prestige;
    uint16 hash_4d677b6f6fa9cd5b;
    int32 participation;
    byte weaponpickupscount;
    byte hash_4bc346e4843d750c[3];
    short hash_73dcab1bc83f37e2[3];
    uint8 hash_6db7fa32705e7eaa;
    int32 hash_5efee4632dc32539;
    byte hash_6860858624175f84;
    byte hash_62898b408adf277d;
    uint32 total_xp;
    short upload;
    byte numuavcalled;
    uint3 onboardingstate;
    uint32 hash_4325caae17068c55;
    byte assists;
    int32 playerxpmultiplier;
    float averagekilldistance;
    uint32 connectedbits;
    uint32 utc_disconnect_time_s;
    byte numdogskills;
    short hash_e4d259ef22b4635[3];
    int32 controllerparticipationconsecutivesuccessmax;
    int32 end_unlock_points;
    int32 hash_70fe9df744d614f3;
    int32 escorttime;
    uint64 connection_id;
    int32 hash_679439e9a51687ef;
    uint32 score_xp;
    int32 start_total_time_played_s;
    int32 hash_136288c07ffd7b0c;
    float totalspeedswhenmoving;
    int32 start_deaths;
    uint16 hash_4bb657eb94ad1948[156];
    float skill_variance;
    int32 controllerparticipationinactivitywarnings;
    byte criticalhitlocations[19];
    uint16 hash_5e97583b134955e1;
    uint32 damage_dealt;
    int32 weaponxpmultiplier;
    short headshots;
    int32 start_losses;
    byte teamkills;
    int32 start_misses;
    arenastats arenastats;
    int32 end_deaths;
    bit hash_418487ab0985610b;
    bit hash_5c3a460a4b80bb21;
    bit hash_38793b233cd7e431;
    bit hash_12fac6a33938170e;
    bit present_at_end;
    bit is_bot;
    bit playingonwifi;
    bit controllerparticipationsuccessafterinactivitywarning;
};

struct gameevent {
    int32 hash_450ab9ff85668b5a[3];
    byte player_index;
    uint32 hash_5715e55450648bd5;
    bit event_type[26];
    padbit __pad[6];
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};

struct hash_6580ccf5f8a0ef6 {
    uint32 hash_67599f190572ca79;
    char city[128];
    float longitude;
    char country[2];
    char timezone[8];
    char language[5];
    float latitude;
    char region[64];
};

struct hash_6425595b349c2207 {
    uint16 ekia;
    uint16 hits;
    uint16 kills;
    uint16 shots;
    uint10 weapon_index;
    byte hash_102e2ac61a8f5910;
    uint16 time_used_s;
    uint16 hash_2031532f95082529;
    uint16 hash_119b4b446cd1cdca;
    int32 hash_2212142201fe170f;
    uint16 headshots;
    bit slot_used;
    padbit __pad[7];
};

struct hash_1bef350b03b6f166 {
    uint32 count;
    hash event;
};

struct hash_7cc11183a39c74dc {
    mploadout customclass[18];
    uint10 killstreak1;
    uint10 killstreak2;
    uint10 killstreak3;
    uint10 killstreak4;
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct arenastats {
    byte eventtype;
    uint32 hash_4d82c094cb43bbd7;
    uint32 hash_40ab2c89a089b5a1;
    float performancevalue;
    uint32 hash_3c61243adce9f00c;
    uint32 hash_650daed6d12d46cc;
    byte season;
};

struct mploadout {
    uint5 tacticalgear;
    uint10 primarygrenade;
    uint5 bonuscard[3];
    uint6 talent[6];
    mploadoutweapon secondary;
    mploadoutweapon primary;
    bit primarygrenadecount;
    padbit __pad[7];
};

struct mploadoutweapon {
    uint4 weaponmodelslot;
    uint10 charmindex;
    uint8 paintjobslot;
    uint11 itemindex;
    int8 attachment[7];
    uint8 reticleindex;
    uint7 deathfxindex;
    uint9 camoindex;
};


