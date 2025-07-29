#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_staminup;

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0, eflags: 0x2
// Checksum 0xf84f1cc4, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_mod_staminup", &__init__, undefined, undefined );
}

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0
// Checksum 0xbd988db1, Offset: 0xd8
// Size: 0x14
function __init__()
{
    enable_mod_staminup_perk_for_level();
}

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0
// Checksum 0x4f306240, Offset: 0xf8
// Size: 0x74
function enable_mod_staminup_perk_for_level()
{
    zm_perks::register_perk_clientfields( #"specialty_mod_staminup", &registermelee_leader_guntookpain, &function_170260ee );
    zm_perks::register_perk_init_thread( #"specialty_mod_staminup", &function_c24062a0 );
}

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function function_c24062a0()
{
    
}

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function registermelee_leader_guntookpain()
{
    
}

// Namespace zm_perk_mod_staminup/zm_perk_mod_staminup
// Params 0
// Checksum 0x80f724d1, Offset: 0x198
// Size: 0x4
function function_170260ee()
{
    
}

