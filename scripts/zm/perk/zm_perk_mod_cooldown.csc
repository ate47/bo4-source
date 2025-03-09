#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_cooldown;

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x2
// Checksum 0x6df82521, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_cooldown", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x0
// Checksum 0x3c1936dc, Offset: 0xc8
// Size: 0x14
function __init__() {
    function_7299c39e();
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x0
// Checksum 0x709fe9a3, Offset: 0xe8
// Size: 0x74
function function_7299c39e() {
    zm_perks::register_perk_clientfields(#"specialty_mod_cooldown", &function_2e843bb7, &function_dbcec7de);
    zm_perks::register_perk_init_thread(#"specialty_mod_cooldown", &function_d5042d74);
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x168
// Size: 0x4
function function_d5042d74() {
    
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x178
// Size: 0x4
function function_2e843bb7() {
    
}

// Namespace zm_perk_mod_cooldown/zm_perk_mod_cooldown
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x188
// Size: 0x4
function function_dbcec7de() {
    
}

