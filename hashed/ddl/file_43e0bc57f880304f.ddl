begin "hash_43e0bc57f880304f";
version 14;
metatable "hash_4d9d94e7eb6f6ed5";

struct root {
    char store_gamemode[24];
    telemetry_header telemetry;
    uint32 store_region;
    char store_source[48];
    char product_price[32];
    char product_id[64];
    char store_action_source[32];
    char product_category[64];
    client_header client;
    hash_3579cef5c6443dc8 transaction_result;
};

enum hash_3579cef5c6443dc8 {
    "checkout_event_result_purchased" = 0x0,
    "checkout_event_result_failed" = 0x1,
    "checkout_event_result_unknown" = 0x2,
    "hash_725e60c7c0f99711" = 0x3,
    "checkout_event_result_canceled" = 0x4
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

enum hash_54196e9e9860f0be {
    "pc" = 0x0,
    "neo" = 0x1,
    "xb1" = 0x2,
    "scorpio" = 0x3,
    "ps4" = 0x4
};

struct client_header {
    uint64 hash_4016bed15f9183f7;
    uint64 uno_id;
    uint64 user_id;
};


