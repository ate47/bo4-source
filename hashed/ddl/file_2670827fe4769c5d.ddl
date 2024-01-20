{
    "name": "#hash_2670827fe4769c5d",
    "version": 6,
    "metatable": "#hash_64dbba3a488762bd",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#user_id",
                    "type": "uint64",
                    "offset": 416,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#pos_x",
                    "type": "int",
                    "offset": 192,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#pos_y",
                    "type": "int",
                    "offset": 224,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#pos_z",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hash_3702989295e6967c",
                    "type": "short",
                    "offset": 360,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#angle_y",
                    "type": "short",
                    "offset": 392,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#is_ads",
                    "type": "uint",
                    "offset": 480,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_5715e55450648bd5",
                    "type": "uint",
                    "offset": 320,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#session_mode",
                    "type": "enum#hash_61d8fb71b3cca1df",
                    "offset": 408,
                    "bitSize": 8
                },
                {
                    "name": "#hash_5d4c0dad617ca23",
                    "type": "uint",
                    "offset": 288,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#angle_x",
                    "type": "short",
                    "offset": 376,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#hash_6c7256462c2e206d",
                    "type": "byte",
                    "offset": 352,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#match",
                    "type": "struct#hash_8057a5478d9bca",
                    "offset": 0,
                    "bitSize": 192
                },
                {
                    "name": "#hash_46abccf6acdcd394",
                    "type": "pad",
                    "offset": 481,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_8057a5478d9bca",
            "members": [
                {
                    "name": "#lobby_id",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#match_id",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_c05315ddb26eb93",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_61d8fb71b3cca1df",
            "values": [
                "#mode_invalid",
                "#mode_campaign",
                "#mode_multiplayer",
                "#mode_warzone",
                "#mode_zombies"
            ]
        }
    ]
}