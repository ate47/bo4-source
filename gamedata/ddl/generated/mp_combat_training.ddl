// gamedata/ddl/generated/mp_combat_training.ddl
// metatable "hash_9fce1fa4733ce1dc"

version 3 {
    // idx 1 members 3 size 0x10
    struct hash_59cc7e9a5821e816 {
        // offset 0x0, size 0x8
        trainingstate trainingstate;
        // offset 0x8, size 0x3
        bool hash_5bc234d7be11d761[hash_1c9501e7b4c18b7e];
        // offset 0xb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 4
    enum hash_30e2ee84fb43aad7 {
        woods_intro, // 0x0,
        woods_outro, // 0x1,
        story_outro, // 0x2,
        story_intro, // 0x3
    };

    // idx 1 members 16
    enum challengetype {
        hash_4d4a62396c1ec8, // 0x0,
        bronze_stars, // 0x1,
        hash_1aee13f64efb2ef2, // 0x2,
        hash_1ebacadf6dc3dbdf, // 0x3,
        silver_stars, // 0x4,
        hash_3caeae083fb50ceb, // 0x5,
        veteran_kills, // 0x6,
        gold_stars, // 0x7,
        scorestreak_kills, // 0x8,
        hash_512584b15284d144, // 0x9,
        hash_513bb5302a850f1c, // 0xa,
        best_killstreak, // 0xb,
        hash_68046b0858420412, // 0xc,
        hash_683d7dfc8782d6b9, // 0xd,
        headshots, // 0xe,
        melee_kills, // 0xf
    };

    // idx 2 members 5
    enum trainingstate {
        skirmish_started, // 0x0,
        tutorial_completed, // 0x1,
        tutorial_started, // 0x2,
        not_started, // 0x3,
        skirmish_completed, // 0x4
    };

    // idx 3 members 3
    enum hash_1c9501e7b4c18b7e {
        bronze, // 0x0,
        gold, // 0x1,
        silver, // 0x2
    };

    // idx 0 members 7 size 0x198
    // offset 0x0, size 0x8
    uint:8 hash_5926d5020afdbf8a;
    // offset 0x8, size 0x80
    uint:8 challengeprogress[challengetype];
    // offset 0x88, size 0x8
    uint:8 selectedspecialist;
    // offset 0x90, size 0x100
    hash_59cc7e9a5821e816 specialiststats[16];
    // offset 0x190, size 0x4
    bool hash_20141830935b7f11[hash_30e2ee84fb43aad7];
    // offset 0x194, size 0x1
    bool hash_5b9483ca80247cc7;
    // offset 0x195, size 0x3
    uint:1 __pad[3];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/mp_combat_training.ddl
// metatable "hash_1044f9ae2dc599b6"

version 2 {
    // idx 1 members 3 size 0x10
    struct hash_59cc7e9a5821e816 {
        // offset 0x0, size 0x8
        trainingstate trainingstate;
        // offset 0x8, size 0x3
        bool hash_5bc234d7be11d761[hash_1c9501e7b4c18b7e];
        // offset 0xb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 4
    enum hash_30e2ee84fb43aad7 {
        woods_intro, // 0x0,
        woods_outro, // 0x1,
        story_outro, // 0x2,
        story_intro, // 0x3
    };

    // idx 1 members 16
    enum challengetype {
        hash_4d4a62396c1ec8, // 0x0,
        bronze_stars, // 0x1,
        hash_1aee13f64efb2ef2, // 0x2,
        hash_1ebacadf6dc3dbdf, // 0x3,
        silver_stars, // 0x4,
        hash_3caeae083fb50ceb, // 0x5,
        veteran_kills, // 0x6,
        gold_stars, // 0x7,
        scorestreak_kills, // 0x8,
        hash_512584b15284d144, // 0x9,
        hash_513bb5302a850f1c, // 0xa,
        best_killstreak, // 0xb,
        hash_68046b0858420412, // 0xc,
        hash_683d7dfc8782d6b9, // 0xd,
        headshots, // 0xe,
        melee_kills, // 0xf
    };

    // idx 2 members 5
    enum trainingstate {
        skirmish_started, // 0x0,
        tutorial_completed, // 0x1,
        tutorial_started, // 0x2,
        not_started, // 0x3,
        skirmish_completed, // 0x4
    };

    // idx 3 members 3
    enum hash_1c9501e7b4c18b7e {
        bronze, // 0x0,
        gold, // 0x1,
        silver, // 0x2
    };

    // idx 0 members 6 size 0x198
    // offset 0x0, size 0x8
    uint:8 hash_5926d5020afdbf8a;
    // offset 0x8, size 0x80
    uint:8 challengeprogress[challengetype];
    // offset 0x88, size 0x8
    uint:8 selectedspecialist;
    // offset 0x90, size 0x100
    hash_59cc7e9a5821e816 specialiststats[16];
    // offset 0x190, size 0x4
    bool hash_20141830935b7f11[hash_30e2ee84fb43aad7];
    // offset 0x194, size 0x4
    uint:1 __pad[4];
}

/////////////////////////////////////////////////
// gamedata/ddl/generated/mp_combat_training.ddl
// metatable "hash_c3f720767fd2ae89"

version 1 {
    // idx 1 members 3 size 0x10
    struct hash_59cc7e9a5821e816 {
        // offset 0x0, size 0x8
        trainingstate trainingstate;
        // offset 0x8, size 0x3
        bool hash_5bc234d7be11d761[hash_1c9501e7b4c18b7e];
        // offset 0xb, size 0x5
        uint:1 __pad[5];
    };

    // idx 0 members 3
    enum hash_30e2ee84fb43aad7 {
        woods_intro, // 0x0,
        woods_outro, // 0x1,
        story_intro, // 0x2
    };

    // idx 1 members 16
    enum challengetype {
        hash_4d4a62396c1ec8, // 0x0,
        bronze_stars, // 0x1,
        hash_1aee13f64efb2ef2, // 0x2,
        hash_1ebacadf6dc3dbdf, // 0x3,
        silver_stars, // 0x4,
        hash_3caeae083fb50ceb, // 0x5,
        veteran_kills, // 0x6,
        gold_stars, // 0x7,
        scorestreak_kills, // 0x8,
        hash_512584b15284d144, // 0x9,
        hash_513bb5302a850f1c, // 0xa,
        best_killstreak, // 0xb,
        hash_68046b0858420412, // 0xc,
        hash_683d7dfc8782d6b9, // 0xd,
        headshots, // 0xe,
        melee_kills, // 0xf
    };

    // idx 2 members 5
    enum trainingstate {
        skirmish_started, // 0x0,
        tutorial_completed, // 0x1,
        tutorial_started, // 0x2,
        not_started, // 0x3,
        skirmish_completed, // 0x4
    };

    // idx 3 members 3
    enum hash_1c9501e7b4c18b7e {
        bronze, // 0x0,
        gold, // 0x1,
        silver, // 0x2
    };

    // idx 0 members 4 size 0x188
    // offset 0x0, size 0x80
    uint:8 challengeprogress[challengetype];
    // offset 0x80, size 0x100
    hash_59cc7e9a5821e816 specialiststats[16];
    // offset 0x180, size 0x3
    bool hash_20141830935b7f11[hash_30e2ee84fb43aad7];
    // offset 0x183, size 0x5
    uint:1 __pad[5];
}

