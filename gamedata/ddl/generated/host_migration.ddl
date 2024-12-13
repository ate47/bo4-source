// gamedata/ddl/generated/host_migration.ddl
// metatable "hash_e0b5029a05bbcc9a"

version 1 {
    // idx 1 members 2 size 0x28
    struct teamdata {
        // offset 0x0, size 0x20
        uint score;
        // offset 0x20, size 0x8
        uint:5 roundswon;
    };

    // idx 2 members 16 size 0x370
    struct playerdata {
        // offset 0x0, size 0x140
        string(40) name;
        // offset 0x140, size 0x10
        uint:16 kills;
        // offset 0x150, size 0x20
        uint score;
        // offset 0x170, size 0x10
        uint:16 killsdenied;
        // offset 0x180, size 0x10
        uint:16 returns;
        // offset 0x190, size 0x10
        uint:10 cur_kill_streak;
        // offset 0x1a0, size 0x140
        string(40) hash_763e00a108f8960a;
        // offset 0x2e0, size 0x10
        uint:16 defends;
        // offset 0x2f0, size 0x10
        uint:16 defuses;
        // offset 0x300, size 0x10
        uint:10 cur_total_kill_streak;
        // offset 0x310, size 0x10
        uint:10 deaths;
        // offset 0x320, size 0x10
        uint:16 plants;
        // offset 0x330, size 0x10
        uint:10 assists;
        // offset 0x340, size 0x10
        uint:16 killsconfirmed;
        // offset 0x350, size 0x10
        uint:10 momentum;
        // offset 0x360, size 0x10
        uint:16 captures;
    };

    // idx 0 members 5 size 0x6fc0
    // offset 0x0, size 0x190
    teamdata team[10];
    // offset 0x190, size 0x20
    uint timepassed;
    // offset 0x1b0, size 0x8
    uint:6 roundsplayed;
    // offset 0x1b8, size 0x6e00
    playerdata player[32];
    // offset 0x6fb8, size 0x8
    uint:5 hash_20f6a5a2a3e21a16;
}

