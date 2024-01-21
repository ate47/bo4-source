begin "hash_6c6e7bcb4dd3b68d";
version 4;
metatable "hash_7f2aa3b91a07b5a7";

struct root {
    arenastats arenabest;
    short arenachallengeseasons[12];
    arenastats arenaperseasonstats;
    arenastats arenastats[9];
    char hash_7d19b83705dea420[32];
};

struct arenastats {
    float skill;
    hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
    hash_3bdd45425562efbc rankedplaystats;
    float variance;
    short season;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct hash_23802d45f95d62c2 {
    hash_7b048091b1488cec matchesstats;
};

struct hash_3bdd45425562efbc {
    hash_7b048091b1488cec matchesstats;
    uint32 matchstartpoints;
    uint32 points;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 subdivisionrank;
    uint32 hash_650daed6d12d46cc;
    hash_7b048091b1488cec matchesstats;
    uint32 points;
    uint64 teamid;
};

struct hash_7b048091b1488cec {
    uint32 ties;
    uint32 wins;
    uint32 matchcount;
    uint32 matchstartlosses;
    uint32 losseslatejoin;
    uint32 losses;
    int32 matchstartstreak;
    int32 streak;
};


/////////////////////////////////////////////////
begin "hash_6c6e7bcb4dd3b68d";
version 3;
metatable "hash_805abbe2db900e67";

struct root {
    arenastats arenabest;
    short arenachallengeseasons[12];
    arenastats arenaperseasonstats;
    arenastats arenastats[9];
    char hash_7d19b83705dea420[32];
};

struct arenastats {
    float skill;
    hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
    hash_3bdd45425562efbc rankedplaystats;
    float variance;
    short season;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct hash_23802d45f95d62c2 {
    hash_7b048091b1488cec matchesstats;
};

struct hash_3bdd45425562efbc {
    hash_7b048091b1488cec matchesstats;
    uint32 matchstartpoints;
    uint32 points;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 subdivisionrank;
    uint32 hash_650daed6d12d46cc;
    hash_7b048091b1488cec matchesstats;
    uint32 points;
    uint64 teamid;
};

struct hash_7b048091b1488cec {
    uint32 ties;
    uint32 wins;
    uint32 matchstartlosses;
    uint32 losses;
    int32 matchstartstreak;
    int32 streak;
    uint32 losses_late_join;
};


/////////////////////////////////////////////////
begin "hash_6c6e7bcb4dd3b68d";
version 2;
metatable "hash_7fad767f5bd5fce0";

struct root {
    arenastats arenabest;
    short arenachallengeseasons[12];
    arenastats arenaperseasonstats;
    arenastats arenastats[9];
    char hash_7d19b83705dea420[32];
};

struct arenastats {
    float skill;
    hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
    hash_3bdd45425562efbc rankedplaystats;
    float variance;
    short season;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct hash_23802d45f95d62c2 {
    hash_7b048091b1488cec matchesstats;
};

struct hash_3bdd45425562efbc {
    hash_7b048091b1488cec matchesstats;
    uint32 matchstartpoints;
    uint32 points;
};

struct hash_6ed89f7cef839c06 {
    uint32 bestsubdivisionrank;
    uint32 firstsubdivisionrankstreak;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 subdivisionrank;
    uint32 hash_650daed6d12d46cc;
    hash_7b048091b1488cec matchesstats;
    uint32 points;
    uint64 teamid;
};

struct hash_7b048091b1488cec {
    uint32 ties;
    uint32 wins;
    uint32 losses;
    uint32 winstreak;
    uint32 losses_late_join;
};


/////////////////////////////////////////////////
begin "hash_6c6e7bcb4dd3b68d";
version 1;
metatable "hash_b960856603728695";

struct root {
    arenastats arenabest;
    arenastats arenaperseasonstats;
    arenastats arenastats[9];
    char hash_7d19b83705dea420[32];
};

struct arenastats {
    uint32 ties;
    uint32 wins;
    float skill;
    float variance;
    uint32 matchstartpoints;
    uint32 losses;
    uint32 points;
    short season;
    uint32 winstreak;
    uint32 losses_late_join;
    hash_6ed89f7cef839c06 leagueplaystats;
};

struct hash_6ed89f7cef839c06 {
    uint32 rank;
    uint64 subdivisionid;
    uint32 hash_40ab2c89a089b5a1;
    uint32 points;
    uint64 teamid;
};


