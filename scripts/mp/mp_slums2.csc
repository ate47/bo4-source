#using scripts\core_common\callbacks_shared;
#using scripts\core_common\util_shared;
#using scripts\mp\mp_slums2_fx;
#using scripts\mp\mp_slums2_scripted;
#using scripts\mp\mp_slums2_sound;
#using scripts\mp_common\load;

#namespace mp_slums2;

// Namespace mp_slums2/level_init
// Params 1, eflags: 0x40
// Checksum 0x83439b4c, Offset: 0x130
// Size: 0x17c
function event_handler[level_init] main( eventstruct )
{
    setsaveddvar( #"enable_global_wind", 1 );
    setsaveddvar( #"wind_global_vector", "88 0 0" );
    setsaveddvar( #"wind_global_low_altitude", 0 );
    setsaveddvar( #"wind_global_hi_altitude", 10000 );
    setsaveddvar( #"wind_global_low_strength_percent", 100 );
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    mp_slums2_fx::main();
    mp_slums2_sound::main();
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient( 0 );
}

// Namespace mp_slums2/mp_slums2
// Params 2
// Checksum 0x46896b06, Offset: 0x2b8
// Size: 0xf2
function dom_flag_base_fx_override( flag, team )
{
    switch ( flag.name )
    {
        case #"a":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
        case #"b":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
        case #"c":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_marker_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_marker_team_r120";
            }
            
            break;
    }
}

// Namespace mp_slums2/mp_slums2
// Params 2
// Checksum 0xca898aac, Offset: 0x3b8
// Size: 0xf2
function dom_flag_cap_fx_override( flag, team )
{
    switch ( flag.name )
    {
        case #"a":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
        case #"b":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
        case #"c":
            if ( team == #"neutral" )
            {
                return "ui/fx_dom_cap_indicator_neutral_r120";
            }
            else
            {
                return "ui/fx_dom_cap_indicator_team_r120";
            }
            
            break;
    }
}

