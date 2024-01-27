# Black Ops 4 Source

Dump of some parts of BO4 using [Atian Call of Duty Tools](https://github.com/ate47/atian-cod-tools), please create an issue on the tools directory if you find a strange decompiled code.

## Pools

Pools dumped ([List of all the pools](https://github.com/ate47/t8-atian-menu/blob/master/docs/notes/xassetpools.csv))

| name                    | id  |        path                         |
|-------------------------|-----|-------------------------------------|
| localize                | 17  | EMPTY                               |
| customizationtable      | 30  | `/tables/customization/`            |
| rawfile                 | 41  | `/`                                 |
| stringtable             | 43  | `/`                                 |
| ddl                     | 46  | `/`                                 |
| scriptparsetree         | 48  | `/`                                 |
| scriptparsetreedbg      | 49  | EMPTY                               |
| scriptparsetreeforced   | 50  | `/tables/scriptparsetreeforced/`    |
| typeinfo                | 62  | EMPTY                               |
| scriptbundle            | 63  | `/scriptbundle/`                    |
| ttf (names)             | 76  | `/tables/ttf.csv`                   |
| bgcache                 | 85  | `/bgcache/`                         |
| maptable                | 89  | `/tables/map/`                      |
| maptable_list           | 90  | `/tables/map/list/`                 |
| luadebug                | 104 | EMPTY                               |
| playerrolecategory      | 109 | `/tables/playerrolecategory/`       |
| playerrolecategorytable | 110 | `/tables/playerrolecategory/table/` |
| gametypetable           | 113 | `/tables/gametype/`                 |
| unlockableitem          | 116 | `/tables/unlockableitem/`           |
| unlockableitemtable     | 117 | `/tables/unlockableitem/table/`     |
| playlists               | 119 | `/tables/playlists/`                |
| storagefile             | 128 | `/tables/storagefile/`              |
| storagefilelist         | 129 | `/tables/storagefile/list/`         |
| <unused>                | 151 | EMPTY                               |
| rawstring               | 157 | `/strings.csv`                      |

## Names

All the dumped files in the path `/` are using the correct name, if a file name is unknown, the file is put in the `hashed/[pool]` directory. (where `[pool]` is the file origin)

## CSV extraction

Most of the CSV are extracted without the header, you can have some known or guessed header in the [CSV_HEADER.MD](CSV_HEADER.MD) file.

- cells starting with a `#` are hashed. an empty cell with a `#` are empty hashed cells
- cells starting with a `?` are from unknown types.
