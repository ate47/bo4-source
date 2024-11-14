#using scripts\zm_common\zm_weapons;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;

#namespace zm_weap_tundragun;

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x2
// Checksum 0x8e7403c7, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_tundragun", &__init__, &__main__, undefined);
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x1 linked
// Checksum 0xbf452352, Offset: 0xf0
// Size: 0x56
function __init__() {
    level.w_tundragun = getweapon(#"tundragun");
    level.w_tundragun_upgraded = getweapon(#"tundragun_upgraded");
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 0, eflags: 0x1 linked
// Checksum 0x230c890, Offset: 0x150
// Size: 0x24
function __main__() {
    callback::on_weapon_change(&on_weapon_change);
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 1, eflags: 0x1 linked
// Checksum 0x8ef745f0, Offset: 0x180
// Size: 0x7c
function on_weapon_change(s_params) {
    w_new_weapon = s_params.weapon;
    w_old_weapon = s_params.last_weapon;
    if (w_new_weapon == level.w_tundragun || w_new_weapon == level.w_tundragun_upgraded) {
        /#
            iprintlnbold("<dev string:x38>");
        #/
    }
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 2, eflags: 0x0
// Checksum 0x6d9d7003, Offset: 0x208
// Size: 0x160
function function_4017174b(localclientnum, w_weapon) {
    self endon(#"disconnect");
    self endon(#"weapon_change");
    self endon(#"death");
    n_old_ammo = -1;
    n_shader_val = 0;
    while (true) {
        wait 0.1;
        if (!isdefined(self)) {
            return;
        }
        n_ammo = getweaponammoclip(localclientnum, w_weapon);
        if (n_old_ammo > 0 && n_old_ammo != n_ammo) {
            function_ac62a2fd(localclientnum);
        }
        n_old_ammo = n_ammo;
        if (n_ammo == 0) {
            self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 0, 0, 0);
            continue;
        }
        n_shader_val = 4 - n_ammo;
        self mapshaderconstant(localclientnum, 0, "scriptVector2", 0, 1, n_shader_val, 0);
    }
}

// Namespace zm_weap_tundragun/zm_weap_tundragun
// Params 1, eflags: 0x1 linked
// Checksum 0xf7129a1d, Offset: 0x370
// Size: 0x34
function function_ac62a2fd(localclientnum) {
    playsound(localclientnum, #"wpn_thunder_breath", (0, 0, 0));
}

