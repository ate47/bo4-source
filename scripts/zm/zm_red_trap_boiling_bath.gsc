// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_red_trap_boiling_bath;

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0x65c0de5, Offset: 0x210
// Size: 0x136
function init() {
    zm_traps::register_trap_basic_info("boiling_bath", &trap_activate, &trap_audio);
    zm_traps::register_trap_damage("boiling_bath", &trap_player_damage, &trap_damage);
    t_trap = getent("boiling_bath", "script_noteworthy");
    t_trap._trap_duration = 20;
    t_trap._trap_cooldown_time = 30;
    clientfield::register("actor", "boiling_trap_death_fx", 16000, 1, "int");
    level.var_4a0ddedd = 0;
    level.var_30ec2c9a = 0;
    level.var_d6ef5bfd = spawn("script_origin", (-2847, -1960, -20));
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0xf2f6bc18, Offset: 0x350
// Size: 0x174
function trap_activate() {
    level notify(#"hash_e2465be027280d7");
    level exploder::exploder("fxexp_trap_bath_switch");
    playsoundatposition("zmb_water_activate", level.var_d6ef5bfd.origin);
    level.var_d6ef5bfd playloopsound(#"hash_7aab9873087e7a2d");
    level.var_c33299e2 = 0;
    level.var_bae901ce = 1;
    level function_922c05f();
    self thread zm_traps::trap_damage();
    wait(self._trap_duration);
    playsoundatposition("zmb_water_deactivate", level.var_d6ef5bfd.origin);
    level.var_d6ef5bfd stoploopsound(0.5);
    level notify(#"hash_36bc97f51bb2bc8");
    level function_5bf5b467();
    self notify(#"trap_done");
    self thread trap_cooldown();
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0xc338afdd, Offset: 0x4d0
// Size: 0x44
function trap_cooldown() {
    self endon(#"death");
    self waittill(#"available");
    level exploder::stop_exploder("fxexp_trap_bath_switch");
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x520
// Size: 0x4
function trap_audio() {
    
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 1, eflags: 0x1 linked
// Checksum 0x4d7f9148, Offset: 0x530
// Size: 0xac
function trap_player_damage(t_trap) {
    if (isplayer(self) && zm_utility::is_player_valid(self, 0, 0, 0) && !(isdefined(self.var_99557baf) && self.var_99557baf)) {
        self.var_99557baf = 1;
        level thread trap_damage_cooldown(self);
        self dodamage(25, self.origin);
    }
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 1, eflags: 0x1 linked
// Checksum 0x210beeb4, Offset: 0x5e8
// Size: 0x444
function trap_damage(t_trap) {
    if (!isalive(self) || isdefined(self.var_99557baf) && self.var_99557baf || isdefined(self.b_trap_kill) && self.b_trap_kill) {
        return;
    }
    self.var_99557baf = 1;
    level thread trap_damage_cooldown(self);
    switch (self.archetype) {
    case #"zombie":
        n_percent = 35;
        break;
    case #"catalyst":
        n_percent = 35;
        break;
    case #"gegenees":
        n_percent = 5;
        break;
    case #"blight_father":
        n_percent = 5;
        break;
    default:
        n_percent = 35;
        break;
    }
    if (isdefined(self.var_5c8ac43e) && self.var_5c8ac43e) {
        n_percent = 100;
    }
    n_percent = n_percent / 100;
    n_damage = int(self.maxhealth * n_percent);
    if (n_damage >= self.health) {
        level notify(#"trap_kill", {#e_trap:t_trap, #e_victim:self});
        if (self.archetype === #"zombie") {
            level.var_c33299e2++;
            level function_922c05f();
            self clientfield::set("boiling_trap_death_fx", 1);
            if (randomint(100) < 50 && !(isdefined(level.var_9b2dd86) && level.var_9b2dd86)) {
                level.var_9b2dd86 = 1;
                level thread function_49d1db63();
                self thread scene::play(#"hash_5fafdc05e3d99ac8", "Shot 1", self);
            } else {
                self dodamage(n_damage, t_trap.origin);
            }
        } else {
            self dodamage(n_damage, t_trap.origin);
        }
        if (isdefined(level.var_bae901ce) && level.var_bae901ce) {
            if (isdefined(t_trap) && isplayer(t_trap.activated_by_player)) {
                t_trap.activated_by_player thread zm_vo::function_a2bd5a0c(#"hash_150ed78f0557df5f", 0.5, 1, 0, 1);
                level.var_bae901ce = undefined;
            }
        }
        if (isplayer(t_trap.activated_by_player)) {
            t_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            t_trap.activated_by_player contracts::increment_zm_contract(#"hash_1f11b620a6de486b");
        }
        self.b_trap_kill = 1;
    } else {
        self dodamage(n_damage, t_trap.origin);
    }
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 1, eflags: 0x1 linked
// Checksum 0x7884c8fb, Offset: 0xa38
// Size: 0x26
function trap_damage_cooldown(e_victim) {
    wait(0.5);
    if (isdefined(e_victim)) {
        e_victim.var_99557baf = undefined;
    }
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0x3e9b762b, Offset: 0xa68
// Size: 0x16
function function_49d1db63() {
    wait(0.5);
    level.var_9b2dd86 = undefined;
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0x6eb2dcbe, Offset: 0xa88
// Size: 0x1c4
function function_922c05f() {
    if (level.var_c33299e2 < 4 && !level.var_30ec2c9a && !level.var_4a0ddedd) {
        level exploder::exploder("fxexp_trap_bath");
    } else if (level.var_c33299e2 == 4 && !level.var_30ec2c9a || level.var_4a0ddedd) {
        level function_2b2e6b4();
        level exploder::exploder("fxexp_trap_bath_bloody_lvl1");
        level exploder::exploder("exp_lgt_bath_trap");
        level exploder::stop_exploder("fxexp_trap_bath");
        level thread function_3a067395("fxexp_trap_bath_bloody_lvl1");
    } else if (level.var_c33299e2 == 10 || level.var_30ec2c9a) {
        level function_2b2e6b4();
        level exploder::exploder("fxexp_trap_bath_bloody_lvl2");
        level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl1");
        level thread function_3a067395("fxexp_trap_bath_bloody_lvl2");
    }
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 1, eflags: 0x1 linked
// Checksum 0xb50368bc, Offset: 0xc58
// Size: 0x1b4
function function_3a067395(str_exploder) {
    self notify("5a3476fe6548df85");
    self endon("5a3476fe6548df85");
    level endon(#"end_game", #"hash_e2465be027280d7");
    level waittill(#"hash_36bc97f51bb2bc8");
    if (str_exploder == "fxexp_trap_bath_bloody_lvl1") {
        level.var_4a0ddedd = 1;
        level exploder::exploder("fxexp_trap_bath_bloody_lvl1_linger");
        wait(30);
        level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl1_linger");
        level.var_4a0ddedd = 0;
        level exploder::stop_exploder("exp_lgt_bath_trap");
    } else {
        level.var_30ec2c9a = 1;
        level exploder::exploder("fxexp_trap_bath_bloody_lvl2_linger");
        wait(30);
        level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl2_linger");
        level.var_30ec2c9a = 0;
        level.var_4a0ddedd = 1;
        level exploder::exploder("fxexp_trap_bath_bloody_lvl1_linger");
        wait(30);
        level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl1_linger");
        level.var_4a0ddedd = 0;
        level exploder::stop_exploder("exp_lgt_bath_trap");
    }
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0xc50b49b8, Offset: 0xe18
// Size: 0x5e
function function_2b2e6b4() {
    level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl1_linger");
    level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl2_linger");
    level.var_4a0ddedd = 0;
    level.var_30ec2c9a = 0;
}

// Namespace zm_red_trap_boiling_bath/zm_red_trap_boiling_bath
// Params 0, eflags: 0x1 linked
// Checksum 0x684485ca, Offset: 0xe80
// Size: 0x64
function function_5bf5b467() {
    level exploder::stop_exploder("fxexp_trap_bath");
    level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl1");
    level exploder::stop_exploder("fxexp_trap_bath_bloody_lvl2");
}

