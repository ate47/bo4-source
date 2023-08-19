// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_perks.gsc;
#include scripts/zm_common/zm_cleanup_mgr.gsc;
#include script_2f9a68261f6a17be;
#include script_6951ea86fdae9ae0;
#include scripts/zm_common/trials/zm_trial_restrict_loadout.gsc;
#include script_24c32478acf44108;
#include scripts/core_common/throttle_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include script_35598499769dbb3d;

#namespace zm_perk_death_dash;

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x2
// Checksum 0x423bc892, Offset: 0x210
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_perk_death_dash", &__init__, undefined, undefined);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x63ff1933, Offset: 0x258
// Size: 0x64
function __init__() {
    if (getdvarint(#"hash_1c1a8ed8d0bf271c", 0)) {
        function_27473e44();
        namespace_9ff9f642::register_burn(#"perk_death_dash", 1, 6);
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x1ce91dbe, Offset: 0x2c8
// Size: 0x1cc
function function_27473e44() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_death_dash", #"perk_death_dash", 2000, #"hash_2f712a7c17494226", getweapon("zombie_perk_bottle_death_dash"), getweapon("zombie_perk_totem_death_dash"), #"zmperksdeathdash");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_death_dash", #"perk_death_dash", 2000, #"zombie/perk_death_dash", getweapon("zombie_perk_bottle_death_dash"), getweapon("zombie_perk_totem_death_dash"), #"zmperksdeathdash");
    }
    zm_perks::register_perk_clientfields(#"specialty_death_dash", &register_clientfield, &set_clientfield);
    zm_perks::register_perk_threads(#"specialty_death_dash", &give_perk, &take_perk, &reset_cooldown);
    zm_perks::register_perk_damage_override_func(&function_4492525b);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xc92c557, Offset: 0x4a0
// Size: 0x154
function register_clientfield() {
    clientfield::register("allplayers", "death_dash_charging", 24000, 1, "int");
    clientfield::register("allplayers", "death_dash_charged", 24000, 1, "int");
    clientfield::register("allplayers", "death_dash_charged_mod", 24000, 1, "int");
    clientfield::register("allplayers", "death_dash_trail", 24000, 1, "int");
    clientfield::register("toplayer", "death_dash_charging_postfx", 24000, 1, "int");
    clientfield::register("toplayer", "death_dash_dash_postfx", 24000, 1, "int");
    clientfield::register("toplayer", "death_dash_charged_mod_postfx", 24000, 1, "int");
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0x9b369365, Offset: 0x600
// Size: 0xc
function set_clientfield(state) {
    
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xff1b1cef, Offset: 0x618
// Size: 0x10c
function give_perk() {
    if (!isdefined(self.var_d675d730)) {
        self.var_d675d730 = spawnstruct();
    }
    self.var_d675d730.var_775a4a2a = zm_perks::function_c1efcc57(#"specialty_death_dash");
    self.var_d675d730.var_d566ea4 = 0;
    self.var_d675d730.var_ec50ac8e = 0;
    self.var_d675d730.var_f658b938 = 0;
    self.var_d675d730.n_kill_count = 0;
    if (!isdefined(self.var_72755c0)) {
        self.var_72755c0 = new throttle();
        [[ self.var_72755c0 ]]->initialize(4, 0.05);
    }
    self thread reset_cooldown();
    self thread function_3b2d1c3e();
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 4, eflags: 0x1 linked
// Checksum 0xd101a344, Offset: 0x730
// Size: 0x4c
function take_perk(b_pause, str_perk, str_result, n_slot) {
    self notify(#"hash_34c48ce219158e58");
    self function_3d5b29a6();
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x5 linked
// Checksum 0x16f0fd0a, Offset: 0x788
// Size: 0x88
function private function_3b2d1c3e() {
    self endon(#"hash_34c48ce219158e58", #"death");
    self thread function_607b1eb0();
    while (1) {
        self waittill(#"hash_1790edc896f02840");
        if (!self.var_d675d730.var_d566ea4) {
            self thread function_b1d12202();
        }
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x5 linked
// Checksum 0xe9dcd23b, Offset: 0x818
// Size: 0x46e
function private function_607b1eb0() {
    level endon(#"end_game");
    self endon(#"hash_34c48ce219158e58", #"death");
    self.var_d675d730.var_af84e9df = 0;
    while (1) {
        if (self.var_d675d730.var_d566ea4 === 1 || !function_69153101()) {
            self function_3d5b29a6();
            waitframe(1);
        } else {
            if (self.var_d675d730.var_af84e9df) {
                if (self.var_d675d730.var_ec50ac8e < 1) {
                    var_77aee2d6 = (gettime() - self.var_d675d730.var_40cb1997) / 1000;
                    self.var_d675d730.var_ec50ac8e = math::clamp(var_77aee2d6 / 3, 0, 1);
                    if (self.var_d675d730.var_ec50ac8e >= 1) {
                        self clientfield::set("death_dash_charged", 1);
                        self clientfield::set_to_player("death_dash_charging_postfx", 1);
                    }
                }
                if (self hasperk(#"specialty_mod_death_dash") && self.var_d675d730.var_f658b938 < 1) {
                    var_77aee2d6 = (gettime() - self.var_d675d730.var_40cb1997) / 1000;
                    self.var_d675d730.var_f658b938 = math::clamp(var_77aee2d6 / 6, 0, 1);
                    if (self.var_d675d730.var_f658b938 >= 1) {
                        self clientfield::set("death_dash_charged_mod", 1);
                        self clientfield::set_to_player("death_dash_charged_mod_postfx", 1);
                    }
                }
            }
            if (!self.var_d675d730.var_af84e9df && self getstance() === "crouch" && !self zm_utility::is_jumping() && !self stancebuttonpressed()) {
                self.var_d675d730.var_af84e9df = 1;
                self.var_d675d730.var_40cb1997 = gettime();
                self.var_d675d730.var_ec50ac8e = 0;
                self.var_d675d730.var_f658b938 = 0;
                self clientfield::set("death_dash_charging", 1);
                self clientfield::set_to_player("death_dash_charging_postfx", 1);
            }
            if (self.var_d675d730.var_af84e9df && self getstance() != "crouch") {
                self.var_d675d730.var_af84e9df = 0;
                self function_3d5b29a6();
            }
            if (self.var_d675d730.var_af84e9df && self stancebuttonpressed()) {
                self.var_d675d730.var_af84e9df = self function_f3d1b75c();
                if (self.var_d675d730.var_af84e9df && self.var_d675d730.var_ec50ac8e > 0.2) {
                    self notify(#"hash_1790edc896f02840");
                } else {
                    self.var_d675d730.var_af84e9df = 0;
                }
                self function_3d5b29a6();
            }
            waitframe(1);
        }
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x5 linked
// Checksum 0x3d8a8aa9, Offset: 0xc90
// Size: 0xa4
function private function_3d5b29a6() {
    self clientfield::set("death_dash_charging", 0);
    self clientfield::set("death_dash_charged", 0);
    self clientfield::set("death_dash_charged_mod", 0);
    self clientfield::set_to_player("death_dash_charging_postfx", 0);
    self clientfield::set_to_player("death_dash_charged_mod_postfx", 0);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x5 linked
// Checksum 0x3b326820, Offset: 0xd40
// Size: 0x90
function private function_f3d1b75c() {
    level endon(#"end_game");
    self endon(#"hash_34c48ce219158e58", #"death");
    while (self getstance() === "crouch") {
        waitframe(1);
    }
    if (self getstance() === "stand") {
        return 1;
    }
    return 0;
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xc5c87da2, Offset: 0xdd8
// Size: 0x1b4
function function_b1d12202() {
    self endon(#"hash_34c48ce219158e58", #"death");
    self clientfield::set("death_dash_trail", 1);
    self clientfield::set_to_player("death_dash_dash_postfx", 1);
    self.var_d675d730.n_kill_count = 0;
    var_8e317f6c = vectornormalize(anglestoforward(self.angles) + vectorscale((0, 0, -1), 0.66));
    var_8e317f6c = var_8e317f6c * 1500;
    self thread function_aeda9580(var_8e317f6c);
    self thread function_749be7c5();
    var_23322f89 = lerpfloat(0.1, 0.5, self.var_d675d730.var_ec50ac8e);
    if (self hasperk(#"specialty_mod_death_dash") && self.var_d675d730.var_f658b938 >= 1) {
        var_23322f89 = 5;
    }
    self waittilltimeout(var_23322f89, #"hash_ba882779cc9c10d");
    self function_38139f98();
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0x5cb28a32, Offset: 0xf98
// Size: 0x26a
function function_aeda9580(var_8e317f6c) {
    if (!isdefined(var_8e317f6c)) {
        return;
    }
    self endon(#"hash_6e2a731bbdb686b8", #"hash_34c48ce219158e58", #"death", #"disconnect", #"bled_out");
    level endon(#"end_game");
    self.var_d675d730.var_4aee0032 = 1;
    self.var_d675d730.var_e09a4919 = gettime();
    var_fa1d6773 = cos(15);
    var_63883896 = 0;
    while (1) {
        var_405918e8 = lerpfloat(0.2, 1, var_63883896 / 3);
        self setvelocity(var_8e317f6c * var_405918e8);
        self setplayerangles(vectortoangles(var_8e317f6c * (1, 1, 0)));
        var_63883896++;
        waitframe(1);
        v_player_velocity = self getvelocity();
        if (gettime() - self.var_d675d730.var_e09a4919 > 200) {
            var_982948b3 = vectornormalize(var_8e317f6c * (1, 1, 0));
            var_cd10168d = vectornormalize(v_player_velocity * (1, 1, 0));
            n_dot = vectordot(var_982948b3, var_cd10168d);
            if (n_dot < var_fa1d6773) {
                self notify(#"hash_ba882779cc9c10d");
            }
        }
        var_44cc0c10 = self function_d5fc01cc();
        if (var_44cc0c10 > 0) {
            self notify(#"hash_ba882779cc9c10d");
        }
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xb91b6b92, Offset: 0x1210
// Size: 0x9e
function function_d5fc01cc() {
    s_trace = groundtrace(self.origin, self.origin + vectorscale((0, 0, -1), 96), 0, self);
    v_pos = s_trace[#"position"];
    n_dist = self.origin[2] - v_pos[2];
    if (n_dist >= 48) {
        return n_dist;
    }
    return 0;
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0xa0ccd87c, Offset: 0x12b8
// Size: 0x1ea
function function_749be7c5() {
    self endon(#"hash_6e2a731bbdb686b8", #"hash_34c48ce219158e58", #"death", #"disconnect", #"bled_out");
    level endon(#"end_game");
    while (1) {
        var_baf7d060 = getaiteamarray(level.zombie_team);
        var_a812a69b = self.origin + anglestoforward(self.angles) * 40;
        a_ai_zombies = array::get_all_closest(var_a812a69b, var_baf7d060, undefined, undefined, 80);
        foreach (ai_zombie in a_ai_zombies) {
            if (!isalive(ai_zombie) || isdefined(ai_zombie.marked_for_death) && ai_zombie.marked_for_death) {
                continue;
            }
            if (!isdefined(ai_zombie.var_6f84b820)) {
                continue;
            }
            if (!(isdefined(ai_zombie.var_48a548c1) && ai_zombie.var_48a548c1)) {
                ai_zombie thread function_c1c51837(self);
            }
        }
        waitframe(1);
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0x38419368, Offset: 0x14b0
// Size: 0x3de
function function_c1c51837(e_player) {
    self endon(#"hash_34c48ce219158e58", #"death", #"disconnect", #"bled_out");
    self.var_48a548c1 = 1;
    [[ e_player.var_72755c0 ]]->waitinqueue(self);
    self namespace_9ff9f642::burn(#"perk_death_dash", e_player, undefined, undefined);
    self.var_b364c165 = 1;
    e_player.var_d675d730.n_kill_count++;
    if (self.var_6f84b820 == #"basic" || self.var_6f84b820 == #"popcorn" || self.var_6f84b820 == #"enhanced") {
        if (self.no_gib !== 1) {
            var_d3876bb9 = [6:&gibserverutils::annihilate, 5:&gibserverutils::gibrightleg, 4:&gibserverutils::gibrightarm, 3:&gibserverutils::giblegs, 2:&gibserverutils::gibleftleg, 1:&gibserverutils::gibleftarm, 0:&gibserverutils::gibhead];
            var_d3876bb9 = array::randomize(var_d3876bb9);
            [[ var_d3876bb9[0] ]](self);
        }
        if (e_player.var_d675d730.n_kill_count > 10) {
            self zm_cleanup::function_23621259();
            self zm_score::function_acaab828(1);
        }
        if (e_player hasperk(#"specialty_mod_death_dash") && e_player.var_d675d730.var_f658b938 >= 1) {
            n_damage = 4400;
        } else {
            n_damage = 1700;
        }
        self dodamage(self.health + 666, e_player.origin, e_player, undefined, undefined, "MOD_BURNED", 0, level.weaponnone);
    } else {
        n_damage = 1700;
        switch (self.var_6f84b820) {
        case #"heavy":
            n_damage = 0.2 * self.maxhealth;
            break;
        case #"miniboss":
            n_damage = 0.1 * self.maxhealth;
            break;
        case #"boss":
            n_damage = 0.05 * self.maxhealth;
            break;
        }
        self dodamage(n_damage, e_player.origin, e_player, undefined, undefined, "MOD_BURNED", 0, level.weaponnone);
    }
    self.var_48a548c1 = undefined;
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x1b7b4958, Offset: 0x1898
// Size: 0xfc
function function_38139f98() {
    self endon(#"hash_34c48ce219158e58", #"death", #"disconnect", #"bled_out");
    self clientfield::set("death_dash_trail", 0);
    self clientfield::set_to_player("death_dash_dash_postfx", 0);
    self notify(#"hash_6e2a731bbdb686b8");
    self setvelocity((0, 0, 0));
    self.var_d675d730.var_4aee0032 = 0;
    n_cooldown_time = level.var_969fe3f1 === 1 ? 1 : 60;
    self thread function_1dbd75d3(n_cooldown_time);
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0xa56d028e, Offset: 0x19a0
// Size: 0xe4
function function_1dbd75d3(var_85dcb56c) {
    self endon(#"hash_21b3435b159fa349", #"disconnect");
    self.var_d675d730.var_d566ea4 = 1;
    if (self hasperk(#"specialty_death_dash") && isdefined(self.var_d675d730.var_775a4a2a)) {
        self zm_perks::function_2ac7579(self.var_d675d730.var_775a4a2a, 2, #"perk_death_dash");
    }
    self thread function_7d72c6f9(var_85dcb56c);
    wait(var_85dcb56c);
    self thread reset_cooldown();
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 1, eflags: 0x1 linked
// Checksum 0x13581673, Offset: 0x1a90
// Size: 0x1a0
function function_7d72c6f9(var_85dcb56c) {
    self endon(#"hash_21b3435b159fa349", #"disconnect");
    self.var_d675d730.var_471d9402 = var_85dcb56c;
    self zm_perks::function_13880aa5(self.var_d675d730.var_775a4a2a, 0, #"perk_dying_wish");
    while (1) {
        wait(0.1);
        self.var_d675d730.var_471d9402 = self.var_d675d730.var_471d9402 - 0.1;
        self.var_d675d730.var_471d9402 = math::clamp(self.var_d675d730.var_471d9402, 0, var_85dcb56c);
        n_percentage = 1 - self.var_d675d730.var_471d9402 / var_85dcb56c;
        n_percentage = math::clamp(n_percentage, 0.02, var_85dcb56c);
        if (self hasperk(#"specialty_death_dash") && isdefined(self.var_d675d730.var_775a4a2a)) {
            self zm_perks::function_13880aa5(self.var_d675d730.var_775a4a2a, n_percentage, #"perk_death_dash");
        }
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x1 linked
// Checksum 0x14eb5e19, Offset: 0x1c38
// Size: 0x10c
function reset_cooldown() {
    self notify(#"hash_21b3435b159fa349");
    if (isdefined(self.var_d675d730)) {
        self.var_d675d730.var_d566ea4 = 0;
    }
    if (self hasperk(#"specialty_death_dash")) {
        /#
            assert(isdefined(self.var_d675d730.var_775a4a2a), "<unknown string>");
        #/
        if (isdefined(self.var_d675d730.var_775a4a2a)) {
            self zm_perks::function_2ac7579(self.var_d675d730.var_775a4a2a, 1, #"perk_death_dash");
            self zm_perks::function_13880aa5(self.var_d675d730.var_775a4a2a, 1, #"perk_death_dash");
        }
    }
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 0, eflags: 0x5 linked
// Checksum 0xa0264094, Offset: 0x1d50
// Size: 0x90
function private function_69153101() {
    if (zm_trial_restrict_loadout::is_active()) {
        return 0;
    }
    if (namespace_fcd611c3::is_active()) {
        return 0;
    }
    if (namespace_b28d86fd::is_active()) {
        return 0;
    }
    if (isdefined(level.var_e501f3b5) && level.var_e501f3b5) {
        return 0;
    }
    if (level.var_2439365b === #"turret") {
        return 0;
    }
    return 1;
}

// Namespace zm_perk_death_dash/zm_perk_death_dash
// Params 10, eflags: 0x1 linked
// Checksum 0xe4452747, Offset: 0x1de8
// Size: 0x13e
function function_4492525b(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime) {
    has_perk = self hasperk(#"specialty_death_dash");
    var_656a2751 = isdefined(self.var_d675d730) && isdefined(self.var_d675d730.var_4aee0032) && self.var_d675d730.var_4aee0032;
    var_2d419edd = smeansofdeath === "MOD_FALLING";
    var_c241fbf4 = isplayer(eattacker) || isplayer(einflictor);
    if (has_perk && var_656a2751 && (var_2d419edd || var_c241fbf4)) {
        return 0;
    }
    return idamage;
}

