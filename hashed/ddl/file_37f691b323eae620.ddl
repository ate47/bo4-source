{
    "name": "#hash_37f691b323eae620",
    "version": 1,
    "metatable": "#hash_c570ec8c012e64f8",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#hash_4eb855cfa6004f3a",
                    "type": "struct#hash_5f41ae426bb85b16",
                    "offset": 0,
                    "bitSize": 8288
                }
            ]
        },
        {
            "name": "#hash_5f41ae426bb85b16",
            "members": [
                {
                    "name": "#header",
                    "type": "struct#hash_5117bce61a2e0fe3",
                    "offset": 0,
                    "bitSize": 96
                },
                {
                    "name": "#payload",
                    "type": "struct#hash_445d98a7d5d65334",
                    "offset": 96,
                    "bitSize": 8192
                }
            ]
        },
        {
            "name": "#hash_5117bce61a2e0fe3",
            "members": [
                {
                    "name": "#id",
                    "type": "uint",
                    "offset": 0,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#type",
                    "type": "uint",
                    "offset": 64,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                },
                {
                    "name": "#size",
                    "type": "uint",
                    "offset": 32,
                    "bitSize": 32,
                    "intSize": 32,
                    "maxIntValue": 4294967295
                }
            ]
        },
        {
            "name": "#hash_445d98a7d5d65334",
            "members": [
                {
                    "name": "#data",
                    "type": "byte[1024]",
                    "offset": 0,
                    "bitSize": 8192,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        }
    ]
}