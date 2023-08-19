// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_pack_a_punch_util.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/activecamo_shared.gsc;

#namespace zm_camos;

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x2
// Checksum 0xd7561f2c, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_camos", &__init__, undefined, undefined);
}

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x1 linked
// Checksum 0x89002da7, Offset: 0xe0
// Size: 0x66
function __init__() {
    callback::on_connect(&on_connect);
    level.var_f06de157 = &function_264bcab7;
    level.var_3993dc8e = &function_4092decc;
    level.var_b219667f = 1;
}

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x1 linked
// Checksum 0x784f8df3, Offset: 0x150
// Size: 0x1c
function on_connect() {
    self thread function_5ae5fabe();
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xdce3235b, Offset: 0x178
// Size: 0xb0
function function_79be4786(weapon) {
    weapon = function_264bcab7(weapon);
    weaponoptions = self getbuildkitweaponoptions(weapon);
    var_3ded6a21 = getcamoindex(weaponoptions);
    var_a99ac61d = getactivecamo(var_3ded6a21);
    if (!isdefined(var_a99ac61d) || var_a99ac61d == #"hash_0") {
        return;
    }
    return var_3ded6a21;
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xe082ebd8, Offset: 0x230
// Size: 0x94
function function_7c982eb6(weapon) {
    weapon = function_264bcab7(weapon);
    s_active_camo = function_e5ed6edb(weapon);
    if (isdefined(s_active_camo)) {
        weaponstate = s_active_camo.var_dd54a13b[weapon];
        if (isdefined(weaponstate) && isdefined(weaponstate.stagenum)) {
            return weaponstate.stagenum;
        }
    }
}

// Namespace zm_camos/zm_camos
// Params 2, eflags: 0x1 linked
// Checksum 0x23ca2918, Offset: 0x2d0
// Size: 0xd4
function function_6f75f3d3(weapon, current_weaponoptions) {
    var_515e20e6 = zm_weapons::is_weapon_upgraded(weapon);
    weapon = function_264bcab7(weapon);
    if (self function_d0ae71bb(weapon)) {
        return getcamoindex(current_weaponoptions);
    }
    if (var_515e20e6 && isdefined(self.var_3f021416) && isdefined(self.var_3f021416[weapon])) {
        return self.var_3f021416[weapon];
    }
    if (isdefined(current_weaponoptions)) {
        return getcamoindex(current_weaponoptions);
    }
}

// Namespace zm_camos/zm_camos
// Params 3, eflags: 0x1 linked
// Checksum 0xbeb7b698, Offset: 0x3b0
// Size: 0x20c
function function_4f727cf5(weapon, weaponoptions, var_b07a5171 = 0) {
    weapon = function_264bcab7(weapon);
    if (!isdefined(weaponoptions)) {
        weaponoptions = self getbuildkitweaponoptions(weapon);
    }
    if (isdefined(weaponoptions) && self function_d0ae71bb(weapon)) {
        return getcamoindex(weaponoptions);
    }
    if (!isdefined(level.pack_a_punch_camo_index)) {
        if (isdefined(weaponoptions)) {
            return getcamoindex(weaponoptions);
        }
        return;
    }
    if (isdefined(level.pack_a_punch_camo_index_number_variants)) {
        if (!isdefined(self.var_3f021416)) {
            self.var_3f021416 = [];
        } else if (!isarray(self.var_3f021416)) {
            self.var_3f021416 = array(self.var_3f021416);
        }
        var_e5c037f4 = self.var_3f021416[weapon];
        if (var_b07a5171 && isdefined(var_e5c037f4) && var_e5c037f4 >= level.pack_a_punch_camo_index) {
            var_c44040bf = var_e5c037f4 + 1;
            if (var_c44040bf >= level.pack_a_punch_camo_index + level.pack_a_punch_camo_index_number_variants) {
                var_c44040bf = level.pack_a_punch_camo_index;
            }
        } else {
            n_offset = randomintrange(0, level.pack_a_punch_camo_index_number_variants);
            var_c44040bf = level.pack_a_punch_camo_index + n_offset;
        }
        self.var_3f021416[weapon] = var_c44040bf;
        return var_c44040bf;
    } else {
        return level.pack_a_punch_camo_index;
    }
}

// Namespace zm_camos/zm_camos
// Params 2, eflags: 0x1 linked
// Checksum 0xfff28005, Offset: 0x5c8
// Size: 0x4c
function function_a24c564f(var_c34665fc, weapon) {
    weapon = function_264bcab7(weapon);
    self notify(var_c34665fc, {#weapon:weapon});
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xa59994ea, Offset: 0x620
// Size: 0x4a
function function_264bcab7(weapon) {
    if (isdefined(weapon) && weapon != level.weaponnone) {
        weapon = zm_weapons::function_93cd8e76(weapon, 1);
    }
    return weapon;
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x5 linked
// Checksum 0x50a60dce, Offset: 0x678
// Size: 0xee
function private function_e5ed6edb(weapon) {
    weaponoptions = self getbuildkitweaponoptions(weapon);
    if (!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"])) {
        return;
    }
    var_3ded6a21 = getcamoindex(weaponoptions);
    var_a99ac61d = getactivecamo(var_3ded6a21);
    if (!isdefined(var_a99ac61d) || !isdefined(self.pers[#"activecamo"][var_a99ac61d])) {
        return;
    }
    return self.pers[#"activecamo"][var_a99ac61d];
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x5 linked
// Checksum 0x98ba8e1e, Offset: 0x770
// Size: 0x72
function private function_d0ae71bb(weapon) {
    if (isdefined(self function_79be4786(weapon))) {
        return 1;
    }
    weaponoptions = self getbuildkitweaponoptions(weapon);
    if (function_2470f404(weaponoptions) != 0) {
        return 1;
    }
    return 0;
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xaefebf80, Offset: 0x7f0
// Size: 0x144
function function_7b29c2d2(weapon) {
    if (!isdefined(self.var_88ebd633)) {
        self.var_88ebd633 = {};
    }
    var_fcad15af = function_264bcab7(weapon);
    if (!isdefined(self.var_88ebd633.var_92177fec) || self.var_88ebd633.var_92177fec != var_fcad15af) {
        self.var_88ebd633.var_92177fec = var_fcad15af;
        self.var_88ebd633.var_d9449a3 = 0;
    }
    self.var_88ebd633.var_d9449a3++;
    if (self.var_88ebd633.var_d9449a3 >= 5) {
        self thread activecamo::function_896ac347(weapon, #"rapid_kills", 1);
        self.var_88ebd633.var_d9449a3 = 0;
        self notify(#"hash_7e9b17b054c01cb3");
    } else if (self.var_88ebd633.var_d9449a3 == 1) {
        self thread function_160898c();
    }
}

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x5 linked
// Checksum 0xbc106c03, Offset: 0x940
// Size: 0x4e
function private function_160898c() {
    self notify(#"hash_7e9b17b054c01cb3");
    self endon(#"death", #"hash_7e9b17b054c01cb3");
    wait(5);
    self.var_88ebd633.var_d9449a3 = 0;
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xa4c26ca0, Offset: 0x998
// Size: 0x144
function function_432cf6d(weapon) {
    if (!isdefined(self.var_88ebd633)) {
        self.var_88ebd633 = {};
    }
    var_fcad15af = function_264bcab7(weapon);
    if (!isdefined(self.var_88ebd633.var_d45de2ae) || self.var_88ebd633.var_d45de2ae != var_fcad15af) {
        self.var_88ebd633.var_d45de2ae = var_fcad15af;
        self.var_88ebd633.var_bcacb3a3 = 0;
    }
    self.var_88ebd633.var_bcacb3a3++;
    if (self.var_88ebd633.var_bcacb3a3 >= 5) {
        self thread activecamo::function_896ac347(weapon, #"rapid_headshots", 1);
        self.var_88ebd633.var_bcacb3a3 = 0;
        self notify(#"hash_3dbf3a8521ba1621");
    } else if (self.var_88ebd633.var_bcacb3a3 == 1) {
        self thread function_d01affa9();
    }
}

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x5 linked
// Checksum 0x67dcfa9a, Offset: 0xae8
// Size: 0x4e
function private function_d01affa9() {
    self notify(#"hash_3dbf3a8521ba1621");
    self endon(#"death", #"hash_3dbf3a8521ba1621");
    wait(7);
    self.var_88ebd633.var_bcacb3a3 = 0;
}

// Namespace zm_camos/zm_camos
// Params 1, eflags: 0x1 linked
// Checksum 0xcd4f3e, Offset: 0xb40
// Size: 0xc4
function function_4092decc(weapon) {
    if (zm_weapons::is_weapon_upgraded(weapon)) {
        self activecamo::function_896ac347(weapon, #"hash_203688d7883cf38c", 1);
        if (zm_pap_util::function_7352d8cc(weapon)) {
            self activecamo::function_896ac347(weapon, #"hash_300fdf15a515feda", 1);
        }
    } else {
        self function_a24c564f(#"reset_pack", weapon);
    }
}

// Namespace zm_camos/zm_camos
// Params 0, eflags: 0x5 linked
// Checksum 0x7336e879, Offset: 0xc10
// Size: 0x4ec
function private function_5ae5fabe() {
    if (self stats::get_stat_global(#"weapons_mastery_assault") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_assault", #"challenges", #"statvalue") >= 42) {
        self stats::function_dad108fa(#"weapons_mastery_assault", 1);
    }
    if (self stats::get_stat_global(#"hash_517bf5c8991ad97a") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_cqb", #"challenges", #"statvalue") >= 21) {
        self stats::function_dad108fa(#"hash_517bf5c8991ad97a", 1);
    }
    if (self stats::get_stat_global(#"weapons_mastery_lmg") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_lmg", #"challenges", #"statvalue") >= 28) {
        self stats::function_dad108fa(#"weapons_mastery_lmg", 1);
    }
    if (self stats::get_stat_global(#"secondary_mastery_pistol") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_pistol", #"challenges", #"statvalue") >= 28) {
        self stats::function_dad108fa(#"secondary_mastery_pistol", 1);
    }
    if (self stats::get_stat_global(#"weapons_mastery_smg") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_smg", #"challenges", #"statvalue") >= 49) {
        self stats::function_dad108fa(#"weapons_mastery_smg", 1);
    }
    if (self stats::get_stat_global(#"weapons_mastery_sniper") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_sniper", #"challenges", #"statvalue") >= 28) {
        self stats::function_dad108fa(#"weapons_mastery_sniper", 1);
    }
    if (self stats::get_stat_global(#"weapons_mastery_tactical") == 0 && self stats::get_stat(#"item_group_stats", #"weapon_tactical", #"challenges", #"statvalue") >= 28) {
        self stats::function_dad108fa(#"weapons_mastery_tactical", 1);
    }
    if (self stats::get_stat_global(#"secondary_mastery") == 4) {
        self stats::function_dad108fa(#"weapons_mastery", 1);
    }
}

