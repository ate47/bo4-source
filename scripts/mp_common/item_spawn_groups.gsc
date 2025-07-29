#using script_cb32d07c95e5628;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace item_spawn_group;

// Namespace item_spawn_group/item_spawn_groups
// Params 2
// Checksum 0xf7994eff, Offset: 0x80
// Size: 0x8c
function setup( seedvalue, reset = 1 )
{
    if ( !namespace_65181344::is_enabled() )
    {
        return;
    }
    
    function_1f4464c0( seedvalue );
    
    if ( reset )
    {
        level callback::callback( #"hash_11bd48298bde44a4", undefined );
    }
    
    namespace_65181344::setup_groups( reset );
}

