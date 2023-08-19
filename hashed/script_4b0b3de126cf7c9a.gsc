// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_powerups.gsc;
#include scripts/zm_common/zm_pack_a_punch_util.gsc;
#include scripts/zm_common/zm_pack_a_punch.gsc;
#include scripts/zm_common/zm_bgb.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/util.gsc;
#include scripts/core_common/ai/zombie_death.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/aat_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace namespace_47a807c3;

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 0, eflags: 0x2
// Checksum 0x4463b3d2, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_7587f8ddd6b0d47a", &__init__, undefined, undefined);
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function __init__() {
    
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 1, eflags: 0x0
// Checksum 0xf6b66dbf, Offset: 0x170
// Size: 0xcc
function function_8d37256a(e_player) {
    foreach (player in level.activeplayers) {
        level thread function_81eaae89(player);
    }
    level zm_utility::function_7a35b1d7(self.hint);
    level thread zm_powerups::show_on_hud(e_player.team, "pack_a_punch");
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 0, eflags: 0x1 linked
// Checksum 0xdd66d06f, Offset: 0x248
// Size: 0x5c
function function_ad31c153() {
    self endon(#"death", #"bled_out");
    if (self laststand::player_is_in_laststand()) {
        self waittill(#"player_revived");
        wait(0.5);
    }
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 1, eflags: 0x1 linked
// Checksum 0x38563a0f, Offset: 0x2b0
// Size: 0x254
function function_81eaae89(e_player) {
    e_player endon(#"death", #"bled_out");
    e_player function_ad31c153();
    var_e8145621 = e_player getweaponslistprimaries();
    var_be74babe = e_player getcurrentweapon();
    foreach (weapon in var_e8145621) {
        if (e_player zm_weapons::can_upgrade_weapon(weapon)) {
            var_5198244f = zm_weapons::get_upgrade_weapon(weapon, 1);
        } else {
            continue;
        }
        n_clip = var_5198244f.clipsize;
        n_stock = e_player getweaponammostock(weapon);
        if (var_be74babe == weapon) {
            var_147bd2 = var_5198244f;
        }
        e_player zm_weapons::weapon_take(weapon);
        e_player zm_weapons::weapon_give(var_5198244f, 1, 1);
        e_player setweaponammoclip(var_5198244f, n_clip);
        e_player setweaponammostock(var_5198244f, n_stock);
    }
    if (isdefined(var_147bd2)) {
        e_player shoulddoinitialweaponraise(var_147bd2, 0);
        e_player switchtoweaponimmediate(var_147bd2);
    }
    e_player thread function_40935801();
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 0, eflags: 0x1 linked
// Checksum 0x1015031d, Offset: 0x510
// Size: 0x224
function function_40935801() {
    self notify(#"picked_up_pap");
    self endon(#"picked_up_pap", #"death", #"bled_out");
    wait(30);
    self function_ad31c153();
    var_e8145621 = self getweaponslistprimaries();
    var_be74babe = self getcurrentweapon();
    foreach (w_upgraded in var_e8145621) {
        var_2af07147 = self zm_weapons::get_base_weapon(w_upgraded);
        n_clip = self getweaponammoclip(w_upgraded);
        n_stock = self getweaponammostock(w_upgraded);
        if (var_be74babe == w_upgraded) {
            var_147bd2 = var_2af07147;
        }
        self zm_weapons::weapon_take(w_upgraded);
        self zm_weapons::weapon_give(var_2af07147, 1, 0);
        self setweaponammoclip(var_2af07147, n_clip);
        self setweaponammostock(var_2af07147, n_stock);
    }
    if (isdefined(var_147bd2)) {
        self shoulddoinitialweaponraise(var_147bd2, 0);
        self switchtoweaponimmediate(var_147bd2);
    }
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 1, eflags: 0x0
// Checksum 0x1835b255, Offset: 0x740
// Size: 0x254
function function_35ae342e(e_player) {
    if (e_player isthrowinggrenade()) {
        while (e_player getcurrentweapon() == getweapon(#"none")) {
            wait(0.1);
        }
    }
    var_be74babe = e_player getcurrentweapon();
    e_player.current_weapon = var_be74babe;
    var_a56ad7fa = var_be74babe;
    if (e_player zm_weapons::can_upgrade_weapon(var_be74babe)) {
        var_5198244f = zm_weapons::get_upgrade_weapon(var_be74babe, 1);
    }
    if (!isdefined(var_5198244f)) {
        e_player thread function_d0ea0364(var_be74babe);
        return;
    }
    n_clip = var_5198244f.clipsize;
    n_stock = e_player getweaponammostock(var_be74babe);
    e_player zm_weapons::weapon_take(var_be74babe);
    e_player zm_weapons::weapon_give(var_5198244f, 1, 1);
    e_player shoulddoinitialweaponraise(var_5198244f, 0);
    e_player switchtoweaponimmediate(var_5198244f);
    e_player setweaponammoclip(var_5198244f, n_clip);
    e_player setweaponammostock(var_5198244f, n_stock);
    e_player zm_audio::create_and_play_dialog(#"pap", #"pickup");
    e_player zm_weapons::play_weapon_vo(var_5198244f);
    e_player thread function_d0ea0364(var_5198244f);
}

// Namespace namespace_47a807c3/namespace_33e4d1e0
// Params 1, eflags: 0x5 linked
// Checksum 0x6e3ed17d, Offset: 0x9a0
// Size: 0x204
function private function_d0ea0364(var_5198244f) {
    self notify("picked_up_pap_" + var_5198244f.name);
    self endon("picked_up_pap_" + var_5198244f.name);
    wait(30);
    var_75c77fa = self zm_weapons::get_base_weapon(var_5198244f);
    a_w_weapons = self getweaponslist();
    foreach (w_weapon in a_w_weapons) {
        var_2af07147 = self zm_weapons::get_base_weapon(w_weapon);
        if (var_2af07147 == var_75c77fa) {
            var_2af07147 = self zm_weapons::get_base_weapon(var_5198244f);
            n_clip = self getweaponammoclip(var_5198244f);
            n_stock = self getweaponammostock(var_5198244f);
            self zm_weapons::weapon_take(var_5198244f);
            self zm_weapons::weapon_give(var_2af07147, 1, 0);
            self shoulddoinitialweaponraise(var_2af07147, 0);
            self switchtoweaponimmediate(var_2af07147);
            self setweaponammoclip(var_2af07147, n_clip);
            self setweaponammostock(var_2af07147, n_stock);
            break;
        }
    }
}

