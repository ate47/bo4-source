#using scripts\core_common\ai\zombie_death;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;

#namespace zm_trap_buy_buttons;

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0, eflags: 0x2
// Checksum 0x39b7929b, Offset: 0x138
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_trap_buy_buttons", &__init__, &__main__, undefined );
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x6586fdbf, Offset: 0x188
// Size: 0x24
function __init__()
{
    callback::on_finalize_initialization( &init );
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x80f724d1, Offset: 0x1b8
// Size: 0x4
function __main__()
{
    
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0xe4efec, Offset: 0x1c8
// Size: 0xbc
function init()
{
    level.a_mdl_trap_buttons = getentarray( "mdl_trap_button", "targetname" );
    
    foreach ( mdl_trap_button in level.a_mdl_trap_buttons )
    {
        mdl_trap_button thread function_63be76e0();
    }
    
    level thread function_eac89317();
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 1
// Checksum 0x7672173c, Offset: 0x290
// Size: 0x98
function function_bb013f42( str_id )
{
    foreach ( mdl_trap_button in level.a_mdl_trap_buttons )
    {
        if ( mdl_trap_button.script_string === str_id )
        {
            mdl_trap_button thread function_8724b9c4();
        }
    }
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 1
// Checksum 0x20f8da0e, Offset: 0x330
// Size: 0x98
function function_75046566( str_id )
{
    foreach ( mdl_trap_button in level.a_mdl_trap_buttons )
    {
        if ( mdl_trap_button.script_string === str_id )
        {
            mdl_trap_button thread function_a82eb7c1();
        }
    }
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x1f65e01a, Offset: 0x3d0
// Size: 0xd8
function function_eac89317()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        s_notify = level waittill( #"traps_activated", #"traps_available" );
        
        if ( isdefined( s_notify.var_be3f58a ) )
        {
            if ( s_notify._notify === "traps_activated" )
            {
                function_bb013f42( s_notify.var_be3f58a );
                continue;
            }
            
            if ( s_notify._notify === "traps_available" )
            {
                function_75046566( s_notify.var_be3f58a );
            }
        }
    }
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x2196f89d, Offset: 0x4b0
// Size: 0x52
function function_63be76e0()
{
    self.v_up = self.origin;
    s_down = struct::get( self.target, "targetname" );
    self.v_down = s_down.origin;
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x7aef87f4, Offset: 0x510
// Size: 0x2c
function function_8724b9c4()
{
    self moveto( self.v_down, 0.5 );
}

// Namespace zm_trap_buy_buttons/zm_mansion_trap_buy_buttons
// Params 0
// Checksum 0x7764448c, Offset: 0x548
// Size: 0x2c
function function_a82eb7c1()
{
    self moveto( self.v_up, 0.5 );
}

