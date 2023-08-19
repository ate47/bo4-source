// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_orange_util.gsc;
#include scripts/zm/zm_orange_ee_dynamite.gsc;
#include scripts/zm_common/zm_ui_inventory.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_sq.gsc;
#include scripts/zm/zm_hms_util.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/spawner_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/flag_shared.gsc;

#namespace zm_orange_mq_vessel;

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function preload() {
    
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x1 linked
// Checksum 0x7b107932, Offset: 0x190
// Size: 0xa16
function main() {
    level flag::init(#"vessel_found");
    level flag::init(#"blood_hints");
    level.var_50e4c504 = [];
    a_e_hearts = array::randomize(getentarray("mq_shubozzor", "targetname"));
    level.var_50e4c504 = arraycombine(level.var_50e4c504, a_e_hearts, 0, 0);
    if (!isdefined(level.var_54d62431)) {
        level.var_54d62431 = [];
    } else if (!isarray(level.var_54d62431)) {
        level.var_54d62431 = array(level.var_54d62431);
    }
    level.var_54d62431[level.var_54d62431.size] = array::pop_front(a_e_hearts);
    foreach (part in a_e_hearts) {
        part hide();
    }
    a_e_bones = array::randomize(getentarray("mq_othna", "targetname"));
    level.var_50e4c504 = arraycombine(level.var_50e4c504, a_e_bones, 0, 0);
    if (!isdefined(level.var_54d62431)) {
        level.var_54d62431 = [];
    } else if (!isarray(level.var_54d62431)) {
        level.var_54d62431 = array(level.var_54d62431);
    }
    level.var_54d62431[level.var_54d62431.size] = array::pop_front(a_e_bones);
    foreach (part in a_e_bones) {
        part hide();
    }
    a_e_flesh = array::randomize(getentarray("mq_othnor", "targetname"));
    level.var_50e4c504 = arraycombine(level.var_50e4c504, a_e_flesh, 0, 0);
    if (!isdefined(level.var_54d62431)) {
        level.var_54d62431 = [];
    } else if (!isarray(level.var_54d62431)) {
        level.var_54d62431 = array(level.var_54d62431);
    }
    level.var_54d62431[level.var_54d62431.size] = array::pop_front(a_e_flesh);
    foreach (part in a_e_flesh) {
        part hide();
    }
    a_e_jaws = array::randomize(getentarray("mq_arknar", "targetname"));
    level.var_50e4c504 = arraycombine(level.var_50e4c504, a_e_jaws, 0, 0);
    if (!isdefined(level.var_54d62431)) {
        level.var_54d62431 = [];
    } else if (!isarray(level.var_54d62431)) {
        level.var_54d62431 = array(level.var_54d62431);
    }
    level.var_54d62431[level.var_54d62431.size] = array::pop_front(a_e_jaws);
    foreach (part in a_e_jaws) {
        part hide();
    }
    a_e_skulls = array::randomize(getentarray("mq_asteth", "targetname"));
    level.var_50e4c504 = arraycombine(level.var_50e4c504, a_e_skulls, 0, 0);
    if (!isdefined(level.var_54d62431)) {
        level.var_54d62431 = [];
    } else if (!isarray(level.var_54d62431)) {
        level.var_54d62431 = array(level.var_54d62431);
    }
    level.var_54d62431[level.var_54d62431.size] = array::pop_front(a_e_skulls);
    foreach (part in a_e_skulls) {
        part hide();
    }
    level.var_54d62431 = array::randomize(level.var_54d62431);
    for (i = 0; i < 2; i++) {
        part = array::pop_front(level.var_54d62431);
        part hide();
    }
    foreach (hint in level.var_54d62431) {
        hint hide();
    }
    a_s_vl = struct::get_array("mq_vessel_loc", "targetname");
    level.var_d6513b72 = array::random(a_s_vl);
    level.var_d6513b72.e_vessel = getent(level.var_d6513b72.target, "targetname");
    level.var_d6513b72.e_vessel hide();
    level.var_d6513b72.e_cover = getent(level.var_d6513b72.target2, "targetname");
    level.var_d6513b72.e_safe = getent(level.var_d6513b72.target3, "targetname");
    for (i = 0; i < a_s_vl.size; i++) {
        if (a_s_vl[i] != level.var_d6513b72) {
            e_vessel = getent(a_s_vl[i].target, "targetname");
            e_vessel delete();
        }
    }
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 1, eflags: 0x1 linked
// Checksum 0xc301ae82, Offset: 0xbb0
// Size: 0x1d4
function function_a5254494(var_5ea5c94d) {
    zm_ui_inventory::function_7df6bb60(#"zm_orange_objective_progress", 2);
    if (!var_5ea5c94d) {
        level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_13b606b34fa64ed5", 0, 0, 1);
        level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_13b606b34fa64ed5", 1, 0, 1);
        level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_13b606b34fa64ed5", 2, 0, 1);
        level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_13b606b34fa64ed5", 3, 0, 1);
        level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_13b606b34fa64ed5", 4, 0, 1);
        foreach (hint in level.var_54d62431) {
            hint function_ede90521();
        }
        level thread function_a5fa6428();
        level waittill(#"vessel_found");
    }
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 2, eflags: 0x1 linked
// Checksum 0xe78ef3b1, Offset: 0xd90
// Size: 0x8c
function function_77e4073b(var_5ea5c94d, ended_early) {
    level flag::set(#"vessel_found");
    if (var_5ea5c94d || ended_early) {
        level.var_d6513b72.e_vessel delete();
        level.var_d6513b72.e_cover delete();
    }
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x1 linked
// Checksum 0x6173aa0, Offset: 0xe28
// Size: 0x28c
function function_ede90521() {
    wait(2);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<unknown string>" + self.script_string);
                println("<unknown string>" + self.script_string);
            }
        }
    #/
    level.var_60b08c24.var_489c2917 = self.var_d1f4d20d;
    level.var_60b08c24 thread zm_audio::do_player_or_npc_playvox(self.script_string + "_apot_0");
    level flag::set(#"blood_hints");
    self clientfield::set("" + #"hash_60a7e5b79e8064a5", 1);
    self show();
    self zm_unitrigger::function_fac87205();
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<unknown string>" + self.targetname + "<unknown string>" + self.script_int);
                println("<unknown string>" + self.targetname + "<unknown string>" + self.script_int);
            }
        }
    #/
    self playsound("zmb_bodypart_pickup");
    level flag::clear(#"blood_hints");
    self util::delayed_delete(0.1);
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x5 linked
// Checksum 0x4f8c8ef1, Offset: 0x10c0
// Size: 0x1f4
function private function_a5fa6428() {
    level endon(#"end_game", #"vessel_found");
    wait(2);
    zm_hms_util::function_3c173d37();
    level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_33c988fee37ea6da", 0, 0, 1);
    level.var_60b08c24 zm_hms_util::function_6a0d675d(#"hash_33c988fee37ea6da", 1, 0, 1);
    /#
        if (getdvarint(#"zm_debug_ee", 0)) {
            if (getdvarint(#"zm_debug_ee", 0)) {
                iprintlnbold("<unknown string>" + level.var_d6513b72.script_noteworthy);
                println("<unknown string>" + level.var_d6513b72.script_noteworthy);
            }
        }
    #/
    level.var_60b08c24 thread zm_hms_util::function_6a0d675d(level.var_d6513b72.script_noteworthy, -1, 0, 1);
    level.var_d6513b72.e_cover cover_think();
    level.var_d6513b72 zm_unitrigger::create(&zm_orange_ee_dynamite::function_2a27ccb9, 64);
    level.var_d6513b72 thread function_9c223c27();
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x5 linked
// Checksum 0x37b92f97, Offset: 0x12c0
// Size: 0x1b4
function private cover_think() {
    level endon(#"end_game", #"vessel_found");
    self endon(#"death");
    trigger = getent(self.target, "targetname");
    while (1) {
        s_result = undefined;
        s_result = trigger waittill(#"damage");
        if (isplayer(s_result.attacker) && s_result.mod == "MOD_MELEE") {
            break;
        }
    }
    v_force = anglestoforward(self.angles);
    v_force = v_force * 0.2;
    self hide();
    if (isdefined(self.dyn) && !isdefined(self.var_f0d6ee1f)) {
        self.var_f0d6ee1f = 1;
        createdynentandlaunch(self.dyn, self.origin, self.angles, self.origin, v_force);
        playsoundatposition(#"hash_1ff16e6eb6a9dfed", self.origin);
    }
}

// Namespace zm_orange_mq_vessel/zm_orange_mq_vessel
// Params 0, eflags: 0x5 linked
// Checksum 0x8fdae675, Offset: 0x1480
// Size: 0x1b4
function private function_9c223c27() {
    level endon(#"end_game", #"vessel_found");
    self endon(#"death");
    self.e_vessel show();
    self zm_orange_ee_dynamite::function_170afe2c(1);
    self waittill(#"hash_126c823a82e09010");
    self.e_safe hide();
    if (level.var_98138d6b > 1) {
        level.var_1c53964e zm_hms_util::function_6a0d675d(#"hash_497ec7e9ca9ca204", -1, 0, 1);
    }
    player = self zm_unitrigger::function_fac87205(zm_utility::function_d6046228(#"hash_3be823a04b5cca2d", #"hash_25cb84d1af883c53"), 64);
    player thread zm_orange_util::function_51b752a9(#"hash_4323f85521955dd7");
    self.e_vessel hide();
    self.e_vessel playsound("zmb_vessel_pickup");
    level flag::set(#"vessel_found");
}

