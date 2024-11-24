#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_wolf_protector;

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x2
// Checksum 0xd27f4c76, Offset: 0x188
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_wolf_protector", &__init__, undefined, undefined);
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0xb7662fc7, Offset: 0x1d0
// Size: 0x3c
function __init__() {
    if (getdvarint(#"hash_4e1190045ef3588b", 0)) {
        function_27473e44();
    }
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x3004a709, Offset: 0x218
// Size: 0xdc
function function_27473e44() {
    zm_perks::register_perk_clientfields(#"specialty_wolf_protector", &client_field_func, &code_callback_func);
    zm_perks::register_perk_init_thread(#"specialty_wolf_protector", &init);
    zm_perks::function_b60f4a9f(#"specialty_wolf_protector", #"p8_zm_vapor_altar_icon_01_bloodwolf", "zombie/fx8_perk_altar_symbol_ambient_blood_wolf", #"zmperkswolfprotector");
    zm_perks::function_f3c80d73("zombie_perk_bottle_wolf_protector", "zombie_perk_totem_wolf_protector");
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x48ff17f8, Offset: 0x300
// Size: 0x92
function init() {
    level._effect[#"hash_7e57e8f68ea37ffa"] = #"hash_66c3b340356c182b";
    level._effect[#"hash_2b6b5aa12ed687c5"] = #"hash_6ded6189669f2669";
    level._effect[#"hash_674126a125f46aae"] = #"hash_1d5598025e3875a8";
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0xf6688075, Offset: 0x3a0
// Size: 0x94
function client_field_func() {
    clientfield::register("actor", "wolf_protector_fx", 20000, 1, "int", &wolf_protector_fx, 0, 0);
    clientfield::register("actor", "wolf_protector_spawn_fx", 20000, 1, "counter", &wolf_protector_spawn_fx, 0, 0);
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x440
// Size: 0x4
function code_callback_func() {
    
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 7, eflags: 0x1 linked
// Checksum 0xf8e8577e, Offset: 0x450
// Size: 0x204
function wolf_protector_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    self renderoverridebundle::function_c8d97b8e(localclientnum, #"zm_friendly", #"hash_5afb2d74423459bf");
    forcestreamxmodel(self.model);
    if (newval === 1) {
        self setdrawname(#"hash_3de0e353449c8994", 1);
        self._eyeglow_fx_override = level._effect[#"hash_7e57e8f68ea37ffa"];
        self._eyeglow_tag_override = "tag_eye";
        self zm::createzombieeyes(localclientnum);
        self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, zm::get_eyeball_on_luminance(), self zm::get_eyeball_color());
        return;
    }
    self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, zm::get_eyeball_off_luminance(), self zm::get_eyeball_color());
    self zm::deletezombieeyes(localclientnum);
    util::playfxontag(localclientnum, level._effect[#"hash_674126a125f46aae"], self, "j_spine4");
}

// Namespace zm_perk_wolf_protector/zm_perk_wolf_protector
// Params 7, eflags: 0x1 linked
// Checksum 0xfac4e3e6, Offset: 0x660
// Size: 0x74
function wolf_protector_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    util::playfxontag(localclientnum, level._effect[#"hash_2b6b5aa12ed687c5"], self, "j_spine4");
}

