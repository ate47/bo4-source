#using scripts\core_common\util_shared;
#using scripts\mp_common\load;

#namespace mp_cosmodrome;

// Namespace mp_cosmodrome/level_init
// Params 1, eflags: 0x40
// Checksum 0x50a6ac45, Offset: 0x110
// Size: 0x15c
function event_handler[level_init] main( eventstruct )
{
    setsaveddvar( #"enable_global_wind", 1 );
    setsaveddvar( #"wind_global_vector", "88 0 0" );
    setsaveddvar( #"wind_global_low_altitude", 0 );
    setsaveddvar( #"wind_global_hi_altitude", 10000 );
    setsaveddvar( #"wind_global_low_strength_percent", 100 );
    level.draftxcam = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    load::main();
    level.domflagbasefxoverride = &dom_flag_base_fx_override;
    level.domflagcapfxoverride = &dom_flag_cap_fx_override;
    util::waitforclient( 0 );
}

// Namespace mp_cosmodrome/mp_cosmodrome
// Params 2
// Checksum 0xaf656a94, Offset: 0x278
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

// Namespace mp_cosmodrome/mp_cosmodrome
// Params 2
// Checksum 0x6ddb1898, Offset: 0x378
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

