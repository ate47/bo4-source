begin "hash_38be5c7abb4bcadc";
version 1;
metatable "hash_e0b5029a05bbcc9a";

struct root {
    hash_37625087a54761f4 team[10];
    uint32 timepassed;
    uint6 roundsplayed;
    playerdata player[32];
    uint5 hash_20f6a5a2a3e21a16;
};

struct hash_37625087a54761f4 {
    uint32 score;
    uint5 roundswon;
};

struct playerdata {
    char name[40];
    uint16 kills;
    uint32 score;
    uint16 killsdenied;
    uint16 returns;
    uint10 cur_kill_streak;
    char hash_763e00a108f8960a[40];
    uint16 defends;
    uint16 defuses;
    uint10 cur_total_kill_streak;
    uint10 deaths;
    uint16 plants;
    uint10 assists;
    uint16 killsconfirmed;
    uint10 momentum;
    uint16 captures;
};


