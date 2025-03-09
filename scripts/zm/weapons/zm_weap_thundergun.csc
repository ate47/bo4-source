#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_thundergun;

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x2
// Checksum 0xf7367632, Offset: 0xd0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_thundergun", &__init__, &__main__, undefined);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0x327dc83, Offset: 0x120
// Size: 0xac
function __init__() {
    level.w_thundergun = getweapon(#"thundergun");
    level.w_thundergun_upgraded = getweapon(#"thundergun_upgraded");
    clientfield::register("actor", "" + #"hash_7549405bcfcbcfb", 24000, 1, "counter", &function_5059c81b, 0, 0);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0x4f7abf5c, Offset: 0x1d8
// Size: 0x24
function __main__() {
    callback::on_weapon_change(&on_weapon_change);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 1, eflags: 0x0
// Checksum 0x78a470b5, Offset: 0x208
// Size: 0x7c
function on_weapon_change(s_params) {
    w_new_weapon = s_params.weapon;
    w_old_weapon = s_params.last_weapon;
    if (w_new_weapon == level.w_thundergun || w_new_weapon == level.w_thundergun_upgraded) {
        /#
            iprintlnbold("<dev string:x38>");
        #/
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 1, eflags: 0x0
// Checksum 0xaf21d4d1, Offset: 0x290
// Size: 0x34
function thundergun_fx_fire(localclientnum) {
    playsound(localclientnum, #"wpn_thunder_breath", (0, 0, 0));
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 7, eflags: 0x4
// Checksum 0x536a22e2, Offset: 0x2d0
// Size: 0xac
function private function_5059c81b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (isdefined(self)) {
        v_fx_origin = self gettagorigin(self zm_utility::function_467efa7b(1));
        if (!isdefined(v_fx_origin)) {
            v_fx_origin = self.origin;
        }
        playfx(localclientnum, "zm_weapons/fx8_ww_thundergun_impact_zombie", v_fx_origin);
    }
}

