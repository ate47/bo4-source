begin "hash_1f759be1d9d718eb";
version 2;
metatable "hash_3e4c5cd1c233a103";

struct root {
    uint6 count;
    recentplayer hash_224419b9dcb9832d[50];
    bit issorted;
    padbit __pad[7];
};

struct recentplayer {
    int32 time;
    uint64 xuid;
};


