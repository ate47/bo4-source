begin "gamedata/ddl/generated/leaderboards_player_list.ddl";
version 2;
metatable "hash_ea22a4ef571b6e07";

struct root {
    uint8 count;
    player playerslist[200];
    uint8 hash_b941cba3c015f7b;
    player hash_143b64839d071be4[200];
    bit hash_710508e409e21d7a;
    bit hash_60bfa70a97ce6004;
    padbit __pad[6];
};

struct player {
    uint64 xuid;
};


/////////////////////////////////////////////////
begin "gamedata/ddl/generated/leaderboards_player_list.ddl";
version 1;
metatable "hash_f2ed4030b20e7b2b";

struct root {
    uint8 count;
    player playerslist[200];
};

struct player {
    uint64 xuid;
};


