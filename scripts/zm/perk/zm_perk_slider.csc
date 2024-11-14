#using scripts\zm_common\zm_perks;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_perk_slider;

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x2
// Checksum 0xb1daa352, Offset: 0x140
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_slider", &__init__, undefined, undefined);
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x52a45c80, Offset: 0x188
// Size: 0x5c
function __init__() {
    enable_slider_perk_for_level();
    level._effect[#"hash_7b8ad0ed3ef67813"] = "zombie/fx8_perk_phd_exp";
    zm_perks::function_f3c80d73("zombie_perk_bottle_slider", "zombie_perk_totem_slider");
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x218b45a6, Offset: 0x1f0
// Size: 0xe4
function enable_slider_perk_for_level() {
    zm_perks::register_perk_clientfields(#"specialty_phdflopper", &function_4bb29d61, &function_90b5e96c);
    zm_perks::register_perk_effects(#"specialty_phdflopper", "divetonuke_light");
    zm_perks::register_perk_init_thread(#"specialty_phdflopper", &init_slider);
    zm_perks::function_b60f4a9f(#"specialty_phdflopper", #"p8_zm_vapor_altar_icon_01_phdslider", "zombie/fx8_perk_altar_symbol_ambient_slider", #"zmperksphdslider");
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2e0
// Size: 0x4
function init_slider() {
    
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x9739d33d, Offset: 0x2f0
// Size: 0x5c
function function_4bb29d61() {
    clientfield::register("allplayers", "" + #"hash_7b8ad0ed3ef67813", 1, 1, "counter", &function_4feff2f7, 0, 0);
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x358
// Size: 0x4
function function_90b5e96c() {
    
}

// Namespace zm_perk_slider/zm_perk_slider
// Params 7, eflags: 0x1 linked
// Checksum 0x45991c80, Offset: 0x368
// Size: 0xa4
function function_4feff2f7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        util::playfxontag(localclientnum, level._effect[#"hash_7b8ad0ed3ef67813"], self, "j_spine");
        self playsound(localclientnum, #"hash_25343ce78e1c9c6c");
    }
}

