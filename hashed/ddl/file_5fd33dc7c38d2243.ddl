{
    "name": "#hash_5fd33dc7c38d2243",
    "version": 4,
    "metatable": "#hash_9797769106386acb",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#slot",
                    "type": "int",
                    "offset": 256,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
                },
                {
                    "name": "#action",
                    "type": "string",
                    "offset": 984,
                    "bitSize": 128
                },
                {
                    "name": "#itemname",
                    "type": "float",
                    "offset": 864,
                    "bitSize": 64,
                    "intSize": 64
                },
                {
                    "name": "#sku",
                    "type": "string",
                    "offset": 0,
                    "bitSize": 256
                },
                {
                    "name": "#season",
                    "type": "int",
                    "offset": 1336,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
                },
                {
                    "name": "#hash_2082f5f2f5fb1340",
                    "type": "int",
                    "offset": 960,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 127
                },
                {
                    "name": "#stackposition",
                    "type": "byte",
                    "offset": 976,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#stacktotal",
                    "type": "byte",
                    "offset": 968,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                },
                {
                    "name": "#codpoints",
                    "type": "uint",
                    "offset": 1344,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#casecount",
                    "type": "uint",
                    "offset": 296,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#timeremaining",
                    "type": "int",
                    "offset": 832,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#rotationtime",
                    "type": "int",
                    "offset": 928,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 2147483647
                },
                {
                    "name": "#cpcost",
                    "type": "uint",
                    "offset": 1304,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#hash_15c56d778df1bb04",
                    "type": "uint",
                    "offset": 264,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#telemetry",
                    "type": "struct#telemetry_header",
                    "offset": 328,
                    "bitSize": 504
                },
                {
                    "name": "#client",
                    "type": "struct#client_header",
                    "offset": 1112,
                    "bitSize": 192
                }
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
        }
    ]
}