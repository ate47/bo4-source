# Black ops 4 Source

Dump of some parts of BO4 using [Atian Call of Duty Tools](https://github.com/ate47/atian-cod-tools), please create an issue on the tools directory if you find a strange decompiled code.

The file [scripts_hashes.csv](scripts_hashes.csv) contains the hashes used by the script decompiler.

## Names

All the dumped files are using the correct name, if a file name is unknown, the file is put in the `hashed/[pool]` directory. (where `[pool]` is the file origin)

## CSV extraction

Most of the CSV are extracted without the header, you can have some known or guessed header in the [CSV_HEADER.MD](CSV_HEADER.MD) file.

- cells starting with a `#` are hashed. an empty cell with a `#` are empty hashed cells
- cells starting with a `?` are from unknown types.

## Pools

Pools dumped:
| name            | id  |
|-----------------|-----|
| rawfile         | 41  |
| stringtable     | 43  |
| scriptparsetree | 48  |
| rawstring       | 157 |
