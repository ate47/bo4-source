#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_escape_achievement;

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x0
// Checksum 0xaa9fca55, Offset: 0x278
// Size: 0x24
function init() {
    callback::on_connect(&function_17b76033);
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x0
// Checksum 0x2723c129, Offset: 0x2a8
// Size: 0xdc
function function_17b76033() {
    self thread function_f47a878a();
    self thread function_70003bac();
    self thread function_4f363fd4();
    self thread function_cf262a06();
    self thread function_e5df009();
    self thread function_4c6d1750();
    self thread function_8b752e69();
    self thread function_ce31237b();
    self thread function_73fdd23e();
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0x74c48d92, Offset: 0x390
// Size: 0x44
function private function_73fdd23e() {
    self endon(#"disconnect");
    self waittill(#"hash_108cb6aa18caf726");
    self zm_utility::giveachievement_wrapper("zm_escape_most_escape");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0x7371e1fc, Offset: 0x3e0
// Size: 0x44
function private function_f47a878a() {
    self endon(#"disconnect");
    self waittill(#"hash_6db9af45fe6345fc");
    self zm_utility::giveachievement_wrapper("zm_escape_patch_up");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0xdbcc10e5, Offset: 0x430
// Size: 0x44
function private function_70003bac() {
    self endon(#"disconnect");
    self waittill(#"hash_6e0a27b37f225a25");
    self zm_utility::giveachievement_wrapper("zm_escape_hot_stuff");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0xf0333b1a, Offset: 0x480
// Size: 0x294
function private function_4f363fd4() {
    self endon(#"disconnect");
    w_blundergat = getweapon(#"ww_blundergat_t8");
    w_blundergat_upgraded = getweapon(#"ww_blundergat_t8_upgraded");
    w_tomahawk = getweapon(#"tomahawk_t8");
    var_b7c4015f = getweapon(#"tomahawk_t8_upgraded");
    w_spoon = getweapon(#"spoon_alcatraz");
    w_spork = getweapon(#"spork_alcatraz");
    w_thompson = getweapon(#"smg_thompson_t8");
    w_thompson_upgraded = getweapon(#"smg_thompson_t8_upgraded");
    b_continue = 1;
    while (true) {
        self waittill(#"weapon_change");
        if (isalive(self)) {
            if ((self hasweapon(w_blundergat) || self hasweapon(w_blundergat_upgraded)) && (self hasweapon(w_tomahawk) || self hasweapon(var_b7c4015f)) && (self hasweapon(w_spoon) || self hasweapon(w_spork)) && (self hasweapon(w_thompson) || self hasweapon(w_thompson_upgraded))) {
                break;
            }
        }
    }
    self zm_utility::giveachievement_wrapper("zm_escape_hist_reenact");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0x7d0c722, Offset: 0x720
// Size: 0x44
function private function_cf262a06() {
    self endon(#"disconnect");
    self waittill(#"hash_7af72088379d7ac6");
    self zm_utility::giveachievement_wrapper("zm_escape_match_made");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0xbe9f23fc, Offset: 0x770
// Size: 0x1ec
function private function_e5df009() {
    self endon(#"disconnect", #"hash_b5d3534da3f4508");
    level endon(#"end_game", #"activate_catwalk");
    if (level flag::get("activate_catwalk")) {
        return;
    }
    if (zm_custom::function_901b751c(#"startround") > 1) {
        return;
    }
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") != 2) {
        while (level.round_number < 20) {
            level waittill(#"end_of_round");
        }
    } else {
        var_76f21e6b = array("zone_model_industries", "zone_model_industries_upper", "zone_west_side_exterior_upper", "zone_west_side_exterior_upper_02", "zone_west_side_exterior_lower", "zone_powerhouse", "zone_west_side_exterior_tunnel", "zone_new_industries", "zone_new_industries_transverse_tunnel");
        while (level.round_number < 20) {
            str_zone = self zm_zonemgr::get_player_zone();
            if (!isdefined(str_zone) || !isinarray(var_76f21e6b, str_zone)) {
                self notify(#"hash_b5d3534da3f4508");
            }
            wait 1;
        }
    }
    self zm_utility::giveachievement_wrapper("zm_escape_west_side");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0x10353eb, Offset: 0x968
// Size: 0xb2
function private function_4c6d1750() {
    self endon(#"disconnect", #"hash_1410cda9f15ef1c3");
    while (true) {
        s_result = self waittill(#"hash_3669499a148a6d6e");
        if (s_result.weapon == getweapon(#"tomahawk_t8_upgraded")) {
            self zm_utility::giveachievement_wrapper("zm_escape_senseless");
            self notify(#"hash_1410cda9f15ef1c3");
        }
    }
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0xb22489bb, Offset: 0xa28
// Size: 0x224
function private function_8b752e69() {
    self endon(#"disconnect");
    self.var_cd7cfb60 = 0;
    self.var_8179ae74 = 0;
    self.footprint_warning_vobreadcrumbs = 0;
    while (!self.var_cd7cfb60 || !self.var_8179ae74 || !self.footprint_warning_vobreadcrumbs) {
        s_result = self waittill(#"hash_2e36f5f4d9622bb3");
        if (s_result.weapon == getweapon(#"ww_blundergat_t8") || s_result.weapon == getweapon(#"ww_blundergat_t8_upgraded")) {
            self.var_cd7cfb60 = 1;
        }
        if (s_result.weapon == getweapon(#"ww_blundergat_fire_t8") || s_result.weapon == getweapon(#"ww_blundergat_fire_t8_upgraded")) {
            self.var_8179ae74 = 1;
        }
        if (s_result.weapon == getweapon(#"ww_blundergat_acid_t8") || s_result.weapon == getweapon(#"ww_blundergat_acid_t8_upgraded") || s_result.weapon == getweapon(#"hash_494f5501b3f8e1e9")) {
            self.footprint_warning_vobreadcrumbs = 1;
        }
    }
    self zm_utility::giveachievement_wrapper("zm_escape_gat");
}

// Namespace zm_escape_achievement/zm_escape_achievement
// Params 0, eflags: 0x4
// Checksum 0xcbc86ed5, Offset: 0xc58
// Size: 0x1dc
function private function_ce31237b() {
    level endon(#"soul_catchers_charged");
    self endon(#"disconnect");
    if (!level flag::exists(#"soul_catchers_charged") || level flag::get(#"soul_catchers_charged")) {
        return;
    }
    self.var_23d1ca17 = 0;
    self.var_ba2bd447 = 0;
    self.var_5b73502a = 0;
    while (!self.var_23d1ca17 || !self.var_ba2bd447 || !self.var_5b73502a) {
        s_result = self waittill(#"hash_2706d6137c04adf4");
        str_zone = self zm_zonemgr::get_player_zone();
        if (!isdefined(str_zone)) {
            continue;
        }
        switch (str_zone) {
        case #"zone_model_industries_upper":
            self.var_5b73502a = 1;
            break;
        case #"zone_gondola_ride":
            self.var_23d1ca17 = 1;
            break;
        case #"zone_citadel":
        case #"zone_citadel_shower":
        case #"zone_citadel_warden":
            self.var_ba2bd447 = 1;
            break;
        }
    }
    self zm_utility::giveachievement_wrapper("zm_escape_throw_dog");
}

