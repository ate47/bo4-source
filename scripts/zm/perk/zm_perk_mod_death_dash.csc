#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_death_dash;

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x2
// Checksum 0x8ea16835, Offset: 0x120
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_mod_death_dash", &__init__, undefined, undefined);
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x151a0ce1, Offset: 0x168
// Size: 0x14
function __init__() {
    function_27473e44();
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x3a9dc644, Offset: 0x188
// Size: 0xbc
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_mod_death_dash", &client_field_func, &code_callback_func);
    zm_perks::register_perk_init_thread(#"specialty_mod_death_dash", &init);
    zm_perks::function_b60f4a9f(#"specialty_mod_death_dash", #"p8_zm_vapor_altar_icon_01_blaze_phase", "zombie/fx8_perk_altar_symbol_ambient_blaze_phase", #"zmperksdeathdash");
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x250
// Size: 0x4
function init() {
    
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xe7ab1721, Offset: 0x260
// Size: 0x4c
function client_field_func() {
    clientfield::register("allplayers", "death_dash_pulse", 24000, 1, "counter", &play_death_dash_pulse, 0, 0);
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2b8
// Size: 0x4
function code_callback_func() {
    
}

// Namespace zm_perk_mod_death_dash/zm_perk_mod_death_dash
// Params 7, eflags: 0x1 linked
// Checksum 0x9fcf479d, Offset: 0x2c8
// Size: 0x8c
function play_death_dash_pulse(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::playfxontag(localclientnum, "zombie/fx8_perk_blaze_phase_flame_pulse", self, "j_spine4");
    self playsound(localclientnum, #"hash_531770ad2c5bf052");
}

