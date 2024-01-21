begin "hash_2692d36c334b5eb8";
version 3;
metatable "hash_9fce1fa4733ce1dc";

struct root {
    uint8 hash_5926d5020afdbf8a;
    uint8 challengeprogress[16];
    uint8 selectedspecialist;
    hash_59cc7e9a5821e816 specialiststats[16];
    bit hash_20141830935b7f11[4];
    bit hash_5b9483ca80247cc7;
    padbit __pad[3];
};

struct hash_59cc7e9a5821e816 {
    trainingstate trainingstate;
    bit hash_5bc234d7be11d761[3];
    padbit __pad[5];
};

enum trainingstate {
    "skirmish_started" = 0x0,
    "tutorial_completed" = 0x1,
    "tutorial_started" = 0x2,
    "not_started" = 0x3,
    "skirmish_completed" = 0x4
};


/////////////////////////////////////////////////
begin "hash_2692d36c334b5eb8";
version 2;
metatable "hash_1044f9ae2dc599b6";

struct root {
    uint8 hash_5926d5020afdbf8a;
    uint8 challengeprogress[16];
    uint8 selectedspecialist;
    hash_59cc7e9a5821e816 specialiststats[16];
    bit hash_20141830935b7f11[4];
    padbit __pad[4];
};

struct hash_59cc7e9a5821e816 {
    trainingstate trainingstate;
    bit hash_5bc234d7be11d761[3];
    padbit __pad[5];
};

enum trainingstate {
    "skirmish_started" = 0x0,
    "tutorial_completed" = 0x1,
    "tutorial_started" = 0x2,
    "not_started" = 0x3,
    "skirmish_completed" = 0x4
};


/////////////////////////////////////////////////
begin "hash_2692d36c334b5eb8";
version 1;
metatable "hash_c3f720767fd2ae89";

struct root {
    uint8 challengeprogress[16];
    hash_59cc7e9a5821e816 specialiststats[16];
    bit hash_20141830935b7f11[3];
    padbit __pad[5];
};

struct hash_59cc7e9a5821e816 {
    trainingstate trainingstate;
    bit hash_5bc234d7be11d761[3];
    padbit __pad[5];
};

enum trainingstate {
    "skirmish_started" = 0x0,
    "tutorial_completed" = 0x1,
    "tutorial_started" = 0x2,
    "not_started" = 0x3,
    "skirmish_completed" = 0x4
};


