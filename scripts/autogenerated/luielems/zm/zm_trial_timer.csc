#using scripts\core_common\lui_shared;

#namespace zm_trial_timer;

// Namespace zm_trial_timer
// Method(s) 8 Total 14
class czm_trial_timer : cluielem
{

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 2
    // Checksum 0x65be9101, Offset: 0x410
    // Size: 0x30
    function set_under_round_rules( localclientnum, value )
    {
        set_data( localclientnum, "under_round_rules", value );
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 2
    // Checksum 0x16648483, Offset: 0x3d8
    // Size: 0x30
    function set_timer_text( localclientnum, value )
    {
        set_data( localclientnum, "timer_text", value );
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 1
    // Checksum 0xaccde763, Offset: 0x3a0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"zm_trial_timer" );
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 1
    // Checksum 0xa534817c, Offset: 0x330
    // Size: 0x68
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "timer_text", #"" );
        set_data( localclientnum, "under_round_rules", 0 );
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 1
    // Checksum 0x688fb4bf, Offset: 0x300
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 3
    // Checksum 0x172b89ad, Offset: 0x270
    // Size: 0x84
    function setup_clientfields( uid, var_96b8e5ea, var_33be6591 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::function_dcb34c80( "string", "timer_text", 1 );
        cluielem::add_clientfield( "under_round_rules", 5000, 1, "int", var_33be6591 );
    }

}

// Namespace zm_trial_timer/zm_trial_timer
// Params 3
// Checksum 0x6eab7518, Offset: 0xd0
// Size: 0x58
function register( uid, var_96b8e5ea, var_33be6591 )
{
    elem = new czm_trial_timer();
    [[ elem ]]->setup_clientfields( uid, var_96b8e5ea, var_33be6591 );
    return elem;
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1
// Checksum 0x4b9ffec3, Offset: 0x130
// Size: 0x40
function register_clientside( uid )
{
    elem = new czm_trial_timer();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1
// Checksum 0x485bc28c, Offset: 0x178
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1
// Checksum 0xc6c1faf3, Offset: 0x1a0
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1
// Checksum 0x54e77aa0, Offset: 0x1c8
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 2
// Checksum 0xe311a4fc, Offset: 0x1f0
// Size: 0x28
function set_timer_text( localclientnum, value )
{
    [[ self ]]->set_timer_text( localclientnum, value );
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 2
// Checksum 0xc514c77a, Offset: 0x220
// Size: 0x28
function set_under_round_rules( localclientnum, value )
{
    [[ self ]]->set_under_round_rules( localclientnum, value );
}

