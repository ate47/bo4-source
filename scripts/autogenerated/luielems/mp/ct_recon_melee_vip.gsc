#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_recon_melee_vip;

// Namespace ct_recon_melee_vip
// Method(s) 5 Total 12
class cct_recon_melee_vip : cluielem
{

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1
    // Checksum 0x72564933, Offset: 0x230
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 2
    // Checksum 0xba48bd41, Offset: 0x1e0
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "ct_recon_melee_vip", persistent );
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1
    // Checksum 0x646b4e7c, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1
// Checksum 0x95ea8e63, Offset: 0xb8
// Size: 0x40
function register( uid )
{
    elem = new cct_recon_melee_vip();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 2
// Checksum 0xbe96a2a9, Offset: 0x100
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1
// Checksum 0x7877281c, Offset: 0x140
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1
// Checksum 0xa8839daa, Offset: 0x168
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

