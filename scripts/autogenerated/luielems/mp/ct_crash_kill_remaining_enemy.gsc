#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_crash_kill_remaining_enemy;

// Namespace ct_crash_kill_remaining_enemy
// Method(s) 5 Total 12
class cct_crash_kill_remaining_enemy : cluielem
{

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1
    // Checksum 0x31e6f50f, Offset: 0x240
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 2
    // Checksum 0x3f193464, Offset: 0x1f0
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "ct_crash_kill_remaining_enemy", persistent );
    }

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1
    // Checksum 0x11774efe, Offset: 0x1c0
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1
// Checksum 0x422151a4, Offset: 0xc8
// Size: 0x40
function register( uid )
{
    elem = new cct_crash_kill_remaining_enemy();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 2
// Checksum 0x85bf1ab3, Offset: 0x110
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1
// Checksum 0xbb371e81, Offset: 0x150
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1
// Checksum 0x9bd32880, Offset: 0x178
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

