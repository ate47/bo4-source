{
    "name": "#hash_10d8671cb4c8d542",
    "version": 9,
    "metatable": "#hash_41e4dc91c18b4b41",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#controller",
                    "type": "byte",
                    "offset": 640,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#xuid",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#username",
                    "type": "string",
                    "offset": 37832,
                    "bitSize": 384
                },
                {
                    "name": "#isguest",
                    "type": "uint",
                    "offset": 38221,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#platform",
                    "type": "string",
                    "offset": 34400,
                    "bitSize": 128
                },
                {
                    "name": "#platform_type",
                    "type": "string",
                    "offset": 320,
                    "bitSize": 256
                },
                {
                    "name": "#hash_27f986f9f86c15ef",
                    "type": "uint",
                    "offset": 38216,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_152289c01f3d96c0",
                    "type": "uint",
                    "offset": 38222,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_326518fcfc54ec7c",
                    "type": "uint",
                    "offset": 38223,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#clientplatform",
                    "type": "string",
                    "offset": 34560,
                    "bitSize": 256
                },
                {
                    "name": "#isdedicated",
                    "type": "uint",
                    "offset": 38217,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#hash_2a6477485c88d7e9",
                    "type": "uint",
                    "offset": 38218,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#buildconfig",
                    "type": "string",
                    "offset": 35424,
                    "bitSize": 512
                },
                {
                    "name": "#session_mode",
                    "type": "enum#hash_61d8fb71b3cca1df",
                    "offset": 36704,
                    "bitSize": 8
                },
                {
                    "name": "#changelist",
                    "type": "int",
                    "offset": 34816,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#hostname",
                    "type": "string",
                    "offset": 37320,
                    "bitSize": 512
                },
                {
                    "name": "#cmdline",
                    "type": "string",
                    "offset": 1536,
                    "bitSize": 32768
                },
                {
                    "name": "#buildmachine",
                    "type": "string",
                    "offset": 34848,
                    "bitSize": 512
                },
                {
                    "name": "#buildname",
                    "type": "string",
                    "offset": 35936,
                    "bitSize": 512
                },
                {
                    "name": "#buildversion",
                    "type": "int",
                    "offset": 34368,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#buildtimestamp",
                    "type": "string",
                    "offset": 36744,
                    "bitSize": 512
                },
                {
                    "name": "#mapname",
                    "type": "string",
                    "offset": 1152,
                    "bitSize": 384
                },
                {
                    "name": "#game_type",
                    "type": "float",
                    "offset": 34304,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#isserver",
                    "type": "uint",
                    "offset": 38220,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#isranked",
                    "type": "uint",
                    "offset": 38219,
                    "bitSize": 1,
                    "intSize": 1,
                    "maxIntValue": 1
                },
                {
                    "name": "#playlist",
                    "type": "int",
                    "offset": 34528,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#playlistname",
                    "type": "float",
                    "offset": 576,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#dwconnectionid",
                    "type": "uint64",
                    "offset": 35360,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#sessionindex",
                    "type": "uint",
                    "offset": 36712,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#bbid",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 64
                },
                {
                    "name": "#hash_5556d5bd3d3acbdf",
                    "type": "uint64",
                    "offset": 36448,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#hash_3e742dae20399313",
                    "type": "uint64",
                    "offset": 37256,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 648,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 36512,
                    "bitSize": 192
                },
                {
                    "name": "#match",
                    "type": "struct#match_header",
                    "offset": 128,
                    "bitSize": 192
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
        },
        {
            "name": "#telemetry_header",
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
                    "name": "#changelist_number",
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
                    "name": "#source_version",
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
                "#neo",
                "#xb1",
                "#scorpio",
                "#ps4"
            ]
        },
        {
            "name": "#client_header",
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
                    "name": "#uno_id",
                    "type": "uint64",
                    "offset": 64,
                    "bitSize": 64,
                    "intSize": 64
                }
            ]
        },
        {
            "name": "#match_header",
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