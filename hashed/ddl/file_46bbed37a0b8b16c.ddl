{
    "name": "#hash_46bbed37a0b8b16c",
    "version": 12,
    "metatable": "#hash_2f0c0bb5672abd3f",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#gametime",
                    "type": "int",
                    "offset": 2528,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#roundnumber",
                    "type": "byte",
                    "offset": 192,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#playerspawnid",
                    "type": "int",
                    "offset": 2784,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#itemname",
                    "type": "float",
                    "offset": 1312,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#isupgraded",
                    "type": "uint",
                    "offset": 3296,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#itemtype",
                    "type": "string",
                    "offset": 1376,
                    "bitSize": 1024
                },
                {
                    "name": "#purchasecost",
                    "type": "int",
                    "offset": 2496,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playeroriginx",
                    "type": "fixedpoint",
                    "offset": 3200,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#playeroriginy",
                    "type": "fixedpoint",
                    "offset": 3232,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#playeroriginz",
                    "type": "fixedpoint",
                    "offset": 3264,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#selleroriginx",
                    "type": "fixedpoint",
                    "offset": 2400,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#selleroriginy",
                    "type": "fixedpoint",
                    "offset": 2432,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#selleroriginz",
                    "type": "fixedpoint",
                    "offset": 2464,
                    "bitSize": 32,
                    "intSize": 32
                },
                {
                    "name": "#playerkills",
                    "type": "int",
                    "offset": 776,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playerhealth",
                    "type": "int",
                    "offset": 200,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playercurrentscore",
                    "type": "int",
                    "offset": 2560,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playertotalscore",
                    "type": "int",
                    "offset": 232,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#zone_name",
                    "type": "string",
                    "offset": 264,
                    "bitSize": 512
                },
                {
                    "name": "#username",
                    "type": "string",
                    "offset": 2816,
                    "bitSize": 384
                },
                {
                    "name": "#hash_2042ab53f67e07c0",
                    "type": "struct#hash_d61f32e738b0498",
                    "offset": 808,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#hash_7dcaabe0b3028e02",
                    "offset": 2592,
                    "bitSize": 192
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
                    "offset": 3297,
                    "bitSize": 7,
                    "intSize": 7
                }
            ]
        },
        {
            "name": "#hash_d61f32e738b0498",
            "members": [
                {
                    "name": "#hash_56a1b6d783aa7a25",
                    "type": "uint",
                    "offset": 408,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#action_type",
                    "type": "float",
                    "offset": 48,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#build_version",
                    "type": "string",
                    "offset": 120,
                    "bitSize": 256
                },
                {
                    "name": "#hash_572050e9a4cc493f",
                    "type": "int",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#title_id",
                    "type": "uint",
                    "offset": 376,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_412cb161a9856017",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 16,
                    "intSize": 16,
                    "maxIntValue": 65535
                },
                {
                    "name": "#platform",
                    "type": "enum#hash_54196e9e9860f0be",
                    "offset": 112,
                    "bitSize": 8
                },
                {
                    "name": "#hash_f2ad74d8edb8204",
                    "type": "uint64",
                    "offset": 440,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#hash_54196e9e9860f0be",
            "values": [
                "#pc",
                "#hash_2138dd192571c4c9",
                "#hash_3f9f7d197fde67aa",
                "#scorpio",
                "#ps4"
            ]
        },
        {
            "name": "#hash_7dcaabe0b3028e02",
            "members": [
                {
                    "name": "#user_id",
                    "type": "uint64",
                    "offset": 128,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_4016bed15f9183f7",
                    "type": "uint64",
                    "offset": 0,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_69f723a3393b550d",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
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
        }
    ]
}