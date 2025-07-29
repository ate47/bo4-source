#using scripts\core_common\lui_shared;

#namespace ct_shared_ingame_objective;

// Namespace ct_shared_ingame_objective
// Method(s) 9 Total 15
class cct_shared_ingame_objective : cluielem
{

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0x26abd408, Offset: 0xd90
    // Size: 0x30
    function set_objpoints( localclientnum, value )
    {
        set_data( localclientnum, "objpoints", value );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0xa607e24a, Offset: 0xd58
    // Size: 0x30
    function set_objectivetext( localclientnum, value )
    {
        set_data( localclientnum, "objectiveText", value );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 2
    // Checksum 0x942b967e, Offset: 0x450
    // Size: 0x8fc
    function set_state( localclientnum, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            set_data( localclientnum, "_state", 0 );
            return;
        }
        
        if ( #"fadeout" == state_name )
        {
            set_data( localclientnum, "_state", 1 );
            return;
        }
        
        if ( #"timer_on" == state_name )
        {
            set_data( localclientnum, "_state", 2 );
            return;
        }
        
        if ( #"hash_7b45e6511e6e3303" == state_name )
        {
            set_data( localclientnum, "_state", 3 );
            return;
        }
        
        if ( #"dynobj_killtoearnhellstorm" == state_name )
        {
            set_data( localclientnum, "_state", 4 );
            return;
        }
        
        if ( #"hash_1f92740e023d0e37" == state_name )
        {
            set_data( localclientnum, "_state", 5 );
            return;
        }
        
        if ( #"dynobj_killtoearnrcxd" == state_name )
        {
            set_data( localclientnum, "_state", 6 );
            return;
        }
        
        if ( #"hash_2ad0da501b5586a4" == state_name )
        {
            set_data( localclientnum, "_state", 7 );
            return;
        }
        
        if ( #"dynobj_killtoearnswat" == state_name )
        {
            set_data( localclientnum, "_state", 8 );
            return;
        }
        
        if ( #"hash_4de4402f8698c768" == state_name )
        {
            set_data( localclientnum, "_state", 9 );
            return;
        }
        
        if ( #"dynobj_killtoearnseraphchopper" == state_name )
        {
            set_data( localclientnum, "_state", 10 );
            return;
        }
        
        if ( #"hash_2f0272e755f4abf7" == state_name )
        {
            set_data( localclientnum, "_state", 11 );
            return;
        }
        
        if ( #"dynobj_killtoearnlightningstrike" == state_name )
        {
            set_data( localclientnum, "_state", 12 );
            return;
        }
        
        if ( #"hash_71743ffed428ea2f" == state_name )
        {
            set_data( localclientnum, "_state", 13 );
            return;
        }
        
        if ( #"dynobj_killsoldiers" == state_name )
        {
            set_data( localclientnum, "_state", 14 );
            return;
        }
        
        if ( #"hash_7d5a07e3680ec561" == state_name )
        {
            set_data( localclientnum, "_state", 15 );
            return;
        }
        
        if ( #"dynobj_killwithpurifier" == state_name )
        {
            set_data( localclientnum, "_state", 16 );
            return;
        }
        
        if ( #"hash_5ba30c4069a3b28" == state_name )
        {
            set_data( localclientnum, "_state", 17 );
            return;
        }
        
        if ( #"dynobj_killmantises" == state_name )
        {
            set_data( localclientnum, "_state", 18 );
            return;
        }
        
        if ( #"hash_83700757d6b9194" == state_name )
        {
            set_data( localclientnum, "_state", 19 );
            return;
        }
        
        if ( #"dynobj_earnmantis" == state_name )
        {
            set_data( localclientnum, "_state", 20 );
            return;
        }
        
        if ( #"hash_2a4442540584316a" == state_name )
        {
            set_data( localclientnum, "_state", 21 );
            return;
        }
        
        if ( #"dynobj_earnstraferun" == state_name )
        {
            set_data( localclientnum, "_state", 22 );
            return;
        }
        
        if ( #"hash_1a051da4d150816" == state_name )
        {
            set_data( localclientnum, "_state", 23 );
            return;
        }
        
        if ( #"dynobj_killtoearnnomadks" == state_name )
        {
            set_data( localclientnum, "_state", 24 );
            return;
        }
        
        if ( #"hash_21962bee0a15424" == state_name )
        {
            set_data( localclientnum, "_state", 25 );
            return;
        }
        
        if ( #"dynobj_killzombies" == state_name )
        {
            set_data( localclientnum, "_state", 26 );
            return;
        }
        
        if ( #"hash_29a3c52abd286a3d" == state_name )
        {
            set_data( localclientnum, "_state", 27 );
            return;
        }
        
        if ( #"dynobj_earndart" == state_name )
        {
            set_data( localclientnum, "_state", 28 );
            return;
        }
        
        if ( #"hash_34061eae676df48d" == state_name )
        {
            set_data( localclientnum, "_state", 29 );
            return;
        }
        
        if ( #"dynobj_teamdefend" == state_name )
        {
            set_data( localclientnum, "_state", 30 );
            return;
        }
        
        if ( #"hash_4bfdec8101cde9e7" == state_name )
        {
            set_data( localclientnum, "_state", 31 );
            return;
        }
        
        if ( #"dynobj_killspawnbeacons" == state_name )
        {
            set_data( localclientnum, "_state", 32 );
            return;
        }
        
        if ( #"hash_1a4b4231363359c4" == state_name )
        {
            set_data( localclientnum, "_state", 33 );
            return;
        }
        
        if ( #"dynobj_killwiretrappedenemies" == state_name )
        {
            set_data( localclientnum, "_state", 34 );
            return;
        }
        
        if ( #"hash_5c25a457d21d00a3" == state_name )
        {
            set_data( localclientnum, "_state", 35 );
            return;
        }
        
        if ( #"oneline" == state_name )
        {
            set_data( localclientnum, "_state", 36 );
            return;
        }
        
        if ( #"hash_6e90224596225271" == state_name )
        {
            set_data( localclientnum, "_state", 37 );
            return;
        }
        
        if ( #"dynobj_killenemies" == state_name )
        {
            set_data( localclientnum, "_state", 38 );
            return;
        }
        
        if ( #"hash_75d2922ca26f2a88" == state_name )
        {
            set_data( localclientnum, "_state", 39 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1
    // Checksum 0xe131f252, Offset: 0x418
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"ct_shared_ingame_objective" );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1
    // Checksum 0xb6455a91, Offset: 0x388
    // Size: 0x88
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_state( localclientnum, #"defaultstate" );
        set_data( localclientnum, "objectiveText", #"" );
        set_data( localclientnum, "objpoints", 0 );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 1
    // Checksum 0x97961506, Offset: 0x358
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cct_shared_ingame_objective/ct_shared_ingame_objective
    // Params 3
    // Checksum 0x3fd7b63e, Offset: 0x2a0
    // Size: 0xac
    function setup_clientfields( uid, var_a584bc49, var_ea26adc8 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 6, "int" );
        cluielem::function_dcb34c80( "string", "objectiveText", 1 );
        cluielem::add_clientfield( "objpoints", 1, 11, "int", var_ea26adc8 );
    }

}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 3
// Checksum 0xcb3d755, Offset: 0xd0
// Size: 0x58
function register( uid, var_a584bc49, var_ea26adc8 )
{
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->setup_clientfields( uid, var_a584bc49, var_ea26adc8 );
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0x12ae69f9, Offset: 0x130
// Size: 0x40
function register_clientside( uid )
{
    elem = new cct_shared_ingame_objective();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0x74944b72, Offset: 0x178
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0x7a2c9511, Offset: 0x1a0
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 1
// Checksum 0xa1e98f8a, Offset: 0x1c8
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0xf162d5ab, Offset: 0x1f0
// Size: 0x28
function set_state( localclientnum, state_name )
{
    [[ self ]]->set_state( localclientnum, state_name );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0x5691abe4, Offset: 0x220
// Size: 0x28
function set_objectivetext( localclientnum, value )
{
    [[ self ]]->set_objectivetext( localclientnum, value );
}

// Namespace ct_shared_ingame_objective/ct_shared_ingame_objective
// Params 2
// Checksum 0x91a06e5f, Offset: 0x250
// Size: 0x28
function set_objpoints( localclientnum, value )
{
    [[ self ]]->set_objpoints( localclientnum, value );
}

