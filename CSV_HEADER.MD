# CSV Headers

- [CSV Headers](#csv-headers)
  - [`gamedata\events\schedule_PLATFORM.csv`](#gamedataeventsschedule_platformcsv)
  - [`gamedata\loot\zmlootitems.csv`](#gamedatalootzmlootitemscsv)
  - [`gamedata\stats\MODE\statsmilestonesID.csv`](#gamedatastatsmodestatsmilestonesidcsv)
  - [`gamedata\weapons\MODE\MODE_gunlevels.csv`](#gamedataweaponsmodemode_gunlevelscsv)
  - [`gamedata\weapons\zm\MAP_NAME_weapons.csv`](#gamedataweaponszmmap_name_weaponscsv)
  - [`gamedata\tables\zm\MAP_NAME_trials(_variant_VARIANT).csv`](#gamedatatableszmmap_name_trials_variant_variantcsv)

## `gamedata\events\schedule_PLATFORM.csv`

`PLATFORM` is pc,ps4,xbox.

```csv
event,start,end,plaform
```

## `gamedata\loot\zmlootitems.csv`

```csv
itemid,itemname,type,category,unk4
```

## `gamedata\stats\MODE\statsmilestonesID.csv`

`MODE` is zm,wz,mp, ID is a number from 1 to 6 (depends on the mode)

```csv
challengeid,challengetier,maxvalue,type,stat,challengestring,xpreward,unk7,unk8,reward,unk9,unk10,unk11,unk12,unk13,unk14,unk15,challengecategory,unk17,unk18,unk19,unk20,unk21,unk22,unk23,unk24
```

## `gamedata\weapons\MODE\MODE_gunlevels.csv`

`MODE` is cp,zm,mp.

```csv
rankid,rankxp,gunref,attachment_unlock,xpgained,unk5,unk6
```

## `gamedata\weapons\zm\MAP_NAME_weapons.csv`

`MAP_NAME` is a zombies map.

```csv
weapon_name,upgrade_name,cost,weaponvo,weaponvoresp,ammo_cost,create_vox,is_zcleansed,in_box,upgrade_in_box,is_limited,limit,upgrade_limit,content_restrict,wallbuy_autospawn,weapon_class,is_wonder_weapon,tier
```

## `gamedata\tables\zm\MAP_NAME_trials(_variant_VARIANT).csv`

`MAP_NAME` is a zombies map, `VARIANT` is 1 for hardcore.

```csv
round,name,name_str,desc_str,empty,challenge_name,param0,param1,param2,param3,param4,param5,param6,param7
```