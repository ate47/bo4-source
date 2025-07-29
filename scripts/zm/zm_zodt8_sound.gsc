#using scripts\core_common\struct;

#namespace zodt8_sound;

// Namespace zodt8_sound/zm_zodt8_sound
// Params 0
// Checksum 0xd26a1f98, Offset: 0x80
// Size: 0x1e
function main()
{
    level.var_45b0f2f3 = &function_45b0f2f3;
}

// Namespace zodt8_sound/zm_zodt8_sound
// Params 1
// Checksum 0x841a21b0, Offset: 0xa8
// Size: 0xee
function function_45b0f2f3( str_weapon_name )
{
    if ( !isdefined( str_weapon_name ) )
    {
        return undefined;
    }
    
    str_weapon = undefined;
    
    switch ( str_weapon_name )
    {
        case #"ww_tricannon_fire_t8":
        case #"ww_tricannon_earth_t8":
        case #"ww_tricannon_t8_upgraded":
        case #"ww_tricannon_air_t8_upgraded":
        case #"ww_tricannon_earth_t8_upgraded":
        case #"ww_tricannon_fire_t8_upgraded":
        case #"ww_tricannon_water_t8_upgraded":
        case #"ww_tricannon_water_t8":
        case #"ww_tricannon_t8":
        case #"ww_tricannon_air_t8":
            str_weapon = "wonder";
            break;
    }
    
    return str_weapon;
}

