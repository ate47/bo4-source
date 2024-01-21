begin "hash_1250d02916e4218d";
version 2;
metatable "hash_1b96c0ef101c203a";

struct root {
    hash_c5a2a1d52b4736a hash_44fc45dab2310729[8];
    hash_c5a2a1d52b4736a hash_58aa869928d7d892;
    telemetry_header telemetry;
    hash_e34a94c0792bab1 hash_22e7ee56fe6a2b7e;
    hash_e34a94c0792bab1 hash_64b3fe339e2f8e7d;
    hash_7b68e004c189468 hash_6089290346f7b59b;
    client_header client;
    hash_6a65101a136eab93 header;
    hash_35c568a786416877 hash_66f494620905df80;
};

struct hash_c5a2a1d52b4736a {
    uint32 hash_585f73b9a8dbaec2;
    uint16 hash_1a03a43c6642e4d6;
};

struct telemetry_header {
    int32 changelist_number;
    uint16 source_version;
    double action_type;
    hash_54196e9e9860f0be platform;
    string build_version;
    uint32 title_id;
    uint32 hash_56a1b6d783aa7a25;
    uint64 hash_f2ad74d8edb8204;
};

struct hash_e34a94c0792bab1 {
    byte nat_type;
    int32 hash_78725a00fca985de;
    uint32 hash_7eeb3b0b30e2921a;
    uint16 hash_4b5ffc955581a19e;
};

struct hash_7b68e004c189468 {
    byte type;
    uint32 hash_63d6798714c8e5f6;
    uint16 hash_2602c209d2a3de6a;
    uint32 hash_32e3f837e2ac1c9b;
    uint32 src_addr;
    uint16 hash_3e5e3237821d5d2d;
    bit send_success;
    padbit __pad[7];
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};

struct hash_6a65101a136eab93 {
    uint64 hash_6bdd7ebe59310aa2;
    uint64 lobby_id;
    uint32 title_id;
    uint64 hash_426fb7404d1fbf32;
    uint64 user_id;
};

struct hash_35c568a786416877 {
    byte hash_7e8eac6f87a5c1ef;
    byte hash_73d00e385e338d72;
    byte hash_577f8ff7bcc50665;
    uint32 hash_22f16d87b0d38c49;
    uint16 hash_704803f9a40e1995;
    byte result;
    uint32 hash_70259f4fbb3f7a05;
    uint16 hash_52521ecd1275d391;
    uint32 duration_ms;
    bit throttled;
    padbit __pad[7];
};

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};


