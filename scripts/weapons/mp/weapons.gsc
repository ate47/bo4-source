#using scripts\core_common\system_shared;
#using scripts\core_common\weapons_shared;
#using scripts\weapons\weapons;

#namespace weapons;

// Namespace weapons/weapons
// Params 0, eflags: 0x2
// Checksum 0xda4c8ad8, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"weapons", &__init__, undefined, undefined );
}

// Namespace weapons/weapons
// Params 0
// Checksum 0xefd6a036, Offset: 0xd8
// Size: 0x34
function __init__()
{
    if ( !isdefined( level.var_3a0bbaea ) )
    {
        level.var_3a0bbaea = 1;
    }
    
    init_shared();
}

// Namespace weapons/weapons
// Params 2
// Checksum 0x944b03f0, Offset: 0x118
// Size: 0xe6
function bestweapon_init( weapon, options )
{
    weapon_data = [];
    weapon_data[ #"weapon" ] = weapon;
    weapon_data[ #"options" ] = options;
    weapon_data[ #"kill_count" ] = 0;
    weapon_data[ #"spawned_with" ] = 0;
    key = self.pers[ #"bestweapon" ][ weapon.name ].size;
    self.pers[ #"bestweapon" ][ weapon.name ][ key ] = weapon_data;
    return key;
}

// Namespace weapons/weapons
// Params 2
// Checksum 0xf7cb79fc, Offset: 0x208
// Size: 0x198
function bestweapon_find( weapon, options )
{
    if ( !isdefined( self.pers[ #"bestweapon" ] ) )
    {
        self.pers[ #"bestweapon" ] = [];
    }
    
    if ( !isdefined( self.pers[ #"bestweapon" ][ weapon.name ] ) )
    {
        self.pers[ #"bestweapon" ][ weapon.name ] = [];
    }
    
    name = weapon.name;
    size = self.pers[ #"bestweapon" ][ name ].size;
    
    for ( index = 0; index < size ; index++ )
    {
        if ( self.pers[ #"bestweapon" ][ name ][ index ][ #"weapon" ] == weapon && self.pers[ #"bestweapon" ][ name ][ index ][ #"options" ] == options )
        {
            return index;
        }
    }
    
    return undefined;
}

// Namespace weapons/weapons
// Params 0
// Checksum 0x89f83e1e, Offset: 0x3a8
// Size: 0x228
function bestweapon_get()
{
    most_kills = 0;
    most_spawns = 0;
    
    if ( !isdefined( self.pers[ #"bestweapon" ] ) )
    {
        return;
    }
    
    best_key = 0;
    best_index = 0;
    weapon_keys = getarraykeys( self.pers[ #"bestweapon" ] );
    
    for ( key_index = 0; key_index < weapon_keys.size ; key_index++ )
    {
        key = weapon_keys[ key_index ];
        size = self.pers[ #"bestweapon" ][ key ].size;
        
        for ( index = 0; index < size ; index++ )
        {
            kill_count = self.pers[ #"bestweapon" ][ key ][ index ][ #"kill_count" ];
            spawned_with = self.pers[ #"bestweapon" ][ key ][ index ][ #"spawned_with" ];
            
            if ( kill_count > most_kills )
            {
                best_index = index;
                best_key = key;
                most_kills = kill_count;
                most_spawns = spawned_with;
                continue;
            }
            
            if ( kill_count == most_kills && spawned_with > most_spawns )
            {
                best_index = index;
                best_key = key;
                most_kills = kill_count;
                most_spawns = spawned_with;
            }
        }
    }
    
    return self.pers[ #"bestweapon" ][ best_key ][ best_index ];
}

// Namespace weapons/weapons
// Params 0
// Checksum 0x5aeae5bd, Offset: 0x5d8
// Size: 0x1fe
function showcaseweapon_get()
{
    showcaseweapondata = self getplayershowcaseweapon();
    
    if ( !isdefined( showcaseweapondata ) )
    {
        return undefined;
    }
    
    showcase_weapon = [];
    showcase_weapon[ #"weapon" ] = showcaseweapondata.weapon;
    attachmentnames = [];
    
    for ( index = 0; index < 7 ; index++ )
    {
        attachmentnames[ attachmentnames.size ] = "none";
    }
    
    tokenizedattachmentinfo = strtok( showcaseweapondata.attachmentinfo, "+" );
    
    for ( index = 0; index < tokenizedattachmentinfo.size ; index++ )
    {
        attachmentnames[ index ] = tokenizedattachmentinfo[ index ];
    }
    
    camoindex = 0;
    paintjobslot = 15;
    showpaintshop = 0;
    tokenizedweaponrenderoptions = strtok( showcaseweapondata.weaponrenderoptions, "," );
    
    if ( tokenizedweaponrenderoptions.size > 2 )
    {
        camoindex = int( tokenizedweaponrenderoptions[ 0 ] );
        paintjobslot = int( tokenizedweaponrenderoptions[ 1 ] );
        showpaintshop = paintjobslot != 15;
    }
    
    showcase_weapon[ #"options" ] = self calcweaponoptions( camoindex, 0, 0, 0, 0, showpaintshop, 1 );
    return showcase_weapon;
}

