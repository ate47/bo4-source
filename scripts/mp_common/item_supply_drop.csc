#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace item_supply_drop;

// Namespace item_supply_drop/item_supply_drop
// Params 0, eflags: 0x2
// Checksum 0xf4166a04, Offset: 0x138
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"item_supply_drop", &__init__, undefined, #"item_world" );
}

// Namespace item_supply_drop/item_supply_drop
// Params 0, eflags: 0x4
// Checksum 0x3ca2d2ab, Offset: 0x188
// Size: 0xe4
function private __init__()
{
    if ( !isdefined( getgametypesetting( #"useitemspawns" ) ) || getgametypesetting( #"useitemspawns" ) == 0 )
    {
        return;
    }
    
    clientfield::register( "scriptmover", "supply_drop_fx", 1, 1, "int", &supply_drop_fx, 0, 0 );
    clientfield::register( "scriptmover", "supply_drop_parachute_rob", 1, 1, "int", &supply_drop_parachute, 0, 0 );
}

// Namespace item_supply_drop/item_supply_drop
// Params 7
// Checksum 0xc42d3e62, Offset: 0x278
// Size: 0x94
function supply_drop_parachute( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        self playrenderoverridebundle( #"hash_336cece53ae2342f" );
        return;
    }
    
    self stoprenderoverridebundle( #"hash_336cece53ae2342f" );
}

// Namespace item_supply_drop/item_supply_drop
// Params 7
// Checksum 0x24b46875, Offset: 0x318
// Size: 0x26c
function supply_drop_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        fxent = spawn( localclientnum, self.origin, "script_model" );
        fxent setmodel( "tag_origin" );
        fxent linkto( self );
        var_96514d8b = isdefined( getgametypesetting( #"hash_2e25d475b271a700" ) ) ? getgametypesetting( #"hash_2e25d475b271a700" ) : 0;
        
        if ( var_96514d8b )
        {
            fxent.supplydropfx = function_239993de( localclientnum, "smoke/fx8_column_md_green", fxent, "tag_origin" );
        }
        else
        {
            fxent.supplydropfx = function_239993de( localclientnum, "smoke/fx8_column_md_red", fxent, "tag_origin" );
        }
        
        self.fxent = fxent;
        playfx( localclientnum, "killstreaks/fx8_agr_drop_box_wz", self.origin, anglestoforward( self.angles ), anglestoup( self.angles ) );
        playsound( localclientnum, #"hash_49b7275f4ddde9b8", self.origin );
        self.var_3a55f5cf = 1;
        return;
    }
    
    if ( isdefined( self.fxent ) )
    {
        if ( isdefined( self.fxent.supplydropfx ) )
        {
            stopfx( localclientnum, self.fxent.supplydropfx );
        }
        
        self.fxent delete();
    }
}

