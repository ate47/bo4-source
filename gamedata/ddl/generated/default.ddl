{
    "name": "#gamedata/ddl/generated/default.ddl",
    "version": 1,
    "metatable": "#hash_6dc9ac339966417a",
    "structs": [
        {
            "name": "#root",
            "members": [
                {
                    "name": "#bar",
                    "type": "struct#foo_t",
                    "offset": 0,
                    "bitSize": 88
                }
            ]
        },
        {
            "name": "#foo_t",
            "members": [
                {
                    "name": "#varstring",
                    "type": "string",
                    "offset": 8,
                    "bitSize": 80
                },
                {
                    "name": "#varbyte",
                    "type": "byte",
                    "offset": 0,
                    "bitSize": 8,
                    "intSize": 8,
                    "maxIntValue": 255
                }
            ]
        }
    ]
}