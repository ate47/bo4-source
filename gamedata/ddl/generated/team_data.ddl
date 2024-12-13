// gamedata/ddl/generated/team_data.ddl
// metatable "hash_7f2aa3b91a07b5a7"

version 4 {
    // idx 1 members 8 size 0x100
    struct hash_7b048091b1488cec {
        // offset 0x0, size 0x20
        uint ties;
        // offset 0x20, size 0x20
        uint wins;
        // offset 0x40, size 0x20
        uint matchcount;
        // offset 0x60, size 0x20
        uint matchstartlosses;
        // offset 0x80, size 0x20
        uint losseslatejoin;
        // offset 0xa0, size 0x20
        uint losses;
        // offset 0xc0, size 0x20
        int matchstartstreak;
        // offset 0xe0, size 0x20
        int streak;
    };

    // idx 2 members 3 size 0x140
    struct hash_3bdd45425562efbc {
        // offset 0x0, size 0x100
        hash_7b048091b1488cec matchesstats;
        // offset 0x100, size 0x20
        uint matchstartpoints;
        // offset 0x120, size 0x20
        uint points;
    };

    // idx 3 members 9 size 0x240
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x40
        uint64 subdivisionid;
        // offset 0x80, size 0x20
        uint hash_40ab2c89a089b5a1;
        // offset 0xa0, size 0x20
        uint subdivisionrank;
        // offset 0xc0, size 0x20
        uint hash_650daed6d12d46cc;
        // offset 0xe0, size 0x100
        hash_7b048091b1488cec matchesstats;
        // offset 0x1e0, size 0x20
        uint points;
        // offset 0x200, size 0x40
        uint64 teamid;
    };

    // idx 4 members 3 size 0x180
    struct hash_116b5b72eac0fc21 {
        // offset 0x0, size 0x60
        uint gamestates[3];
        // offset 0x60, size 0x20
        uint hash_22c57e1351555439;
        // offset 0x80, size 0x100
        hash_7b048091b1488cec matchesstats;
    };

    // idx 5 members 1 size 0x100
    struct hash_23802d45f95d62c2 {
        // offset 0x0, size 0x100
        hash_7b048091b1488cec matchesstats;
    };

    // idx 6 members 6 size 0x4d0
    struct arenastats {
        // offset 0x0, size 0x20
        float skill;
        // offset 0x20, size 0x100
        hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
        // offset 0x120, size 0x140
        hash_3bdd45425562efbc rankedplaystats;
        // offset 0x260, size 0x20
        float variance;
        // offset 0x280, size 0x10
        short season;
        // offset 0x290, size 0x240
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 0 members 5 size 0x36b0
    // offset 0x0, size 0x4d0
    arenastats arenabest;
    // offset 0x4d0, size 0xc0
    short arenachallengeseasons[12];
    // offset 0x590, size 0x4d0
    arenastats arenaperseasonstats;
    // offset 0xa60, size 0x2b50
    arenastats arenastats[9];
    // offset 0x35b0, size 0x100
    string(32) hash_7d19b83705dea420;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/team_data.ddl
// metatable "hash_805abbe2db900e67"

version 3 {
    // idx 1 members 7 size 0xe0
    struct hash_7b048091b1488cec {
        // offset 0x0, size 0x20
        uint ties;
        // offset 0x20, size 0x20
        uint wins;
        // offset 0x40, size 0x20
        uint matchstartlosses;
        // offset 0x60, size 0x20
        uint losses;
        // offset 0x80, size 0x20
        int matchstartstreak;
        // offset 0xa0, size 0x20
        int streak;
        // offset 0xc0, size 0x20
        uint losses_late_join;
    };

    // idx 2 members 3 size 0x120
    struct hash_3bdd45425562efbc {
        // offset 0x0, size 0xe0
        hash_7b048091b1488cec matchesstats;
        // offset 0xe0, size 0x20
        uint matchstartpoints;
        // offset 0x100, size 0x20
        uint points;
    };

    // idx 3 members 9 size 0x220
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x40
        uint64 subdivisionid;
        // offset 0x80, size 0x20
        uint hash_40ab2c89a089b5a1;
        // offset 0xa0, size 0x20
        uint subdivisionrank;
        // offset 0xc0, size 0x20
        uint hash_650daed6d12d46cc;
        // offset 0xe0, size 0xe0
        hash_7b048091b1488cec matchesstats;
        // offset 0x1c0, size 0x20
        uint points;
        // offset 0x1e0, size 0x40
        uint64 teamid;
    };

    // idx 4 members 3 size 0x160
    struct hash_116b5b72eac0fc21 {
        // offset 0x0, size 0x60
        uint gamestates[3];
        // offset 0x60, size 0x20
        uint hash_22c57e1351555439;
        // offset 0x80, size 0xe0
        hash_7b048091b1488cec matchesstats;
    };

    // idx 5 members 1 size 0xe0
    struct hash_23802d45f95d62c2 {
        // offset 0x0, size 0xe0
        hash_7b048091b1488cec matchesstats;
    };

    // idx 6 members 6 size 0x470
    struct arenastats {
        // offset 0x0, size 0x20
        float skill;
        // offset 0x20, size 0xe0
        hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
        // offset 0x100, size 0x120
        hash_3bdd45425562efbc rankedplaystats;
        // offset 0x220, size 0x20
        float variance;
        // offset 0x240, size 0x10
        short season;
        // offset 0x250, size 0x220
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 0 members 5 size 0x3290
    // offset 0x0, size 0x470
    arenastats arenabest;
    // offset 0x470, size 0xc0
    short arenachallengeseasons[12];
    // offset 0x530, size 0x470
    arenastats arenaperseasonstats;
    // offset 0x9a0, size 0x27f0
    arenastats arenastats[9];
    // offset 0x3190, size 0x100
    string(32) hash_7d19b83705dea420;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/team_data.ddl
// metatable "hash_7fad767f5bd5fce0"

version 2 {
    // idx 1 members 5 size 0xa0
    struct hash_7b048091b1488cec {
        // offset 0x0, size 0x20
        uint ties;
        // offset 0x20, size 0x20
        uint wins;
        // offset 0x40, size 0x20
        uint losses;
        // offset 0x60, size 0x20
        uint winstreak;
        // offset 0x80, size 0x20
        uint losses_late_join;
    };

    // idx 2 members 3 size 0xe0
    struct hash_3bdd45425562efbc {
        // offset 0x0, size 0xa0
        hash_7b048091b1488cec matchesstats;
        // offset 0xa0, size 0x20
        uint matchstartpoints;
        // offset 0xc0, size 0x20
        uint points;
    };

    // idx 3 members 9 size 0x1e0
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint bestsubdivisionrank;
        // offset 0x20, size 0x20
        uint firstsubdivisionrankstreak;
        // offset 0x40, size 0x40
        uint64 subdivisionid;
        // offset 0x80, size 0x20
        uint hash_40ab2c89a089b5a1;
        // offset 0xa0, size 0x20
        uint subdivisionrank;
        // offset 0xc0, size 0x20
        uint hash_650daed6d12d46cc;
        // offset 0xe0, size 0xa0
        hash_7b048091b1488cec matchesstats;
        // offset 0x180, size 0x20
        uint points;
        // offset 0x1a0, size 0x40
        uint64 teamid;
    };

    // idx 4 members 3 size 0x120
    struct hash_116b5b72eac0fc21 {
        // offset 0x0, size 0x60
        uint gamestates[3];
        // offset 0x60, size 0x20
        uint hash_22c57e1351555439;
        // offset 0x80, size 0xa0
        hash_7b048091b1488cec matchesstats;
    };

    // idx 5 members 1 size 0xa0
    struct hash_23802d45f95d62c2 {
        // offset 0x0, size 0xa0
        hash_7b048091b1488cec matchesstats;
    };

    // idx 6 members 6 size 0x3b0
    struct arenastats {
        // offset 0x0, size 0x20
        float skill;
        // offset 0x20, size 0xa0
        hash_23802d45f95d62c2 hash_4986c748eb81d3c5;
        // offset 0xc0, size 0xe0
        hash_3bdd45425562efbc rankedplaystats;
        // offset 0x1a0, size 0x20
        float variance;
        // offset 0x1c0, size 0x10
        short season;
        // offset 0x1d0, size 0x1e0
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 0 members 5 size 0x2a50
    // offset 0x0, size 0x3b0
    arenastats arenabest;
    // offset 0x3b0, size 0xc0
    short arenachallengeseasons[12];
    // offset 0x470, size 0x3b0
    arenastats arenaperseasonstats;
    // offset 0x820, size 0x2130
    arenastats arenastats[9];
    // offset 0x2950, size 0x100
    string(32) hash_7d19b83705dea420;
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/team_data.ddl
// metatable "hash_b960856603728695"

version 1 {
    // idx 1 members 5 size 0xe0
    struct hash_6ed89f7cef839c06 {
        // offset 0x0, size 0x20
        uint rank;
        // offset 0x20, size 0x40
        uint64 subdivisionid;
        // offset 0x60, size 0x20
        uint hash_40ab2c89a089b5a1;
        // offset 0x80, size 0x20
        uint points;
        // offset 0xa0, size 0x40
        uint64 teamid;
    };

    // idx 2 members 11 size 0x210
    struct arenastats {
        // offset 0x0, size 0x20
        uint ties;
        // offset 0x20, size 0x20
        uint wins;
        // offset 0x40, size 0x20
        float skill;
        // offset 0x60, size 0x20
        float variance;
        // offset 0x80, size 0x20
        uint matchstartpoints;
        // offset 0xa0, size 0x20
        uint losses;
        // offset 0xc0, size 0x20
        uint points;
        // offset 0xe0, size 0x10
        short season;
        // offset 0xf0, size 0x20
        uint winstreak;
        // offset 0x110, size 0x20
        uint losses_late_join;
        // offset 0x130, size 0xe0
        hash_6ed89f7cef839c06 leagueplaystats;
    };

    // idx 0 members 4 size 0x17b0
    // offset 0x0, size 0x210
    arenastats arenabest;
    // offset 0x210, size 0x210
    arenastats arenaperseasonstats;
    // offset 0x420, size 0x1290
    arenastats arenastats[9];
    // offset 0x16b0, size 0x100
    string(32) hash_7d19b83705dea420;
}

