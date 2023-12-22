// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_armor.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_perk_stronghold;

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x2
// Checksum 0xf85c4923, Offset: 0x1a0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_stronghold", &__init__, &__main__, undefined);
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x7e854e83, Offset: 0x1f0
// Size: 0x34
function __init__() {
    enable_stronghold_perk_for_level();
    zm_armor::register(#"stronghold_armor", 0);
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x230
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x6cb78a41, Offset: 0x240
// Size: 0x23c
function enable_stronghold_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_camper", #"perk_stronghold", 2500, #"hash_cd87686e9c80e75", getweapon("zombie_perk_bottle_stronghold"), getweapon("zombie_perk_totem_stronghold"), #"zmperksstonecold");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_camper", #"perk_stronghold", 2500, #"zombie/perk_stronghold", getweapon("zombie_perk_bottle_stronghold"), getweapon("zombie_perk_totem_stronghold"), #"zmperksstonecold");
    }
    zm_perks::register_perk_precache_func(#"specialty_camper", &function_e03779ee);
    zm_perks::register_perk_clientfields(#"specialty_camper", &function_356a31cb, &function_721cc6dc);
    zm_perks::register_perk_machine(#"specialty_camper", &function_f15d3355, &init_stronghold);
    zm_perks::register_perk_threads(#"specialty_camper", &function_1dd08a86, &function_9a3871b7);
    zm_perks::register_actor_damage_override(#"specialty_camper", &function_11154900);
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x488
// Size: 0x4
function init_stronghold() {
    
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xc251b800, Offset: 0x498
// Size: 0x10e
function function_e03779ee() {
    if (isdefined(level.var_a51702ef)) {
        [[ level.var_a51702ef ]]();
        return;
    }
    level._effect[#"divetonuke_light"] = #"hash_2225287695ddf9c9";
    level.machine_assets[#"specialty_camper"] = spawnstruct();
    level.machine_assets[#"specialty_camper"].weapon = getweapon("zombie_perk_bottle_stronghold");
    level.machine_assets[#"specialty_camper"].off_model = "p7_zm_vending_nuke";
    level.machine_assets[#"specialty_camper"].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xe5d75b42, Offset: 0x5b0
// Size: 0x44
function function_356a31cb() {
    clientfield::register("toplayer", "" + #"hash_24e322568c9492c5", 1, 1, "int");
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 1, eflags: 0x1 linked
// Checksum 0xff41f720, Offset: 0x600
// Size: 0xc
function function_721cc6dc(state) {
    
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 4, eflags: 0x1 linked
// Checksum 0x4462d83a, Offset: 0x618
// Size: 0xb6
function function_f15d3355(use_trigger, perk_machine, bump_trigger, collision) {
    use_trigger.script_sound = "mus_perks_phd_jingle";
    use_trigger.script_string = "divetonuke_perk";
    use_trigger.script_label = "mus_perks_phd_sting";
    use_trigger.target = "vending_divetonuke";
    perk_machine.script_string = "divetonuke_perk";
    perk_machine.targetname = "vending_divetonuke";
    if (isdefined(bump_trigger)) {
        bump_trigger.script_string = "divetonuke_perk";
    }
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xf0bcc693, Offset: 0x6d8
// Size: 0x1c
function function_1dd08a86() {
    self thread function_7424eebb();
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 4, eflags: 0x1 linked
// Checksum 0x29fbb24b, Offset: 0x700
// Size: 0x54
function function_9a3871b7(b_pause, str_perk, str_result, n_slot) {
    self notify(#"specialty_camper" + "_take");
    self function_7b5fc171();
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xbdddc9c6, Offset: 0x760
// Size: 0x1e8
function function_7424eebb() {
    self endon(#"specialty_camper" + "_take", #"disconnect");
    while (1) {
        if (!self laststand::player_is_in_laststand() && !self util::is_spectating() && !level flag::get("round_reset")) {
            v_current = self.origin;
            if (!isdefined(self.var_3748ec02)) {
                self.var_3748ec02 = v_current;
            }
            n_dist = distance(self.var_3748ec02, v_current);
            if ((n_dist <= 65 && !(isdefined(self.var_7d0e99f3) && self.var_7d0e99f3) || n_dist <= 130 && isdefined(self.var_7d0e99f3) && self.var_7d0e99f3) && !(isdefined(self.var_16735873) && self.var_16735873) && !scene::is_igc_active()) {
                if (!isdefined(self.var_7ffce6e0)) {
                    self.var_7ffce6e0 = 0;
                }
                self.var_7ffce6e0++;
                self thread function_a84fcb78(self.var_7ffce6e0);
            } else {
                self function_7b5fc171();
            }
        } else {
            self function_7b5fc171();
        }
        wait(0.25);
    }
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x7b16f7df, Offset: 0x950
// Size: 0x76
function function_7b5fc171() {
    self clientfield::set_to_player("" + #"hash_24e322568c9492c5", 0);
    self zm_armor::remove(#"stronghold_armor", 1);
    self.var_3748ec02 = undefined;
    self.var_807f94d7 = undefined;
    self.var_7ffce6e0 = undefined;
    self.var_7d0e99f3 = undefined;
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 1, eflags: 0x1 linked
// Checksum 0x7875b35f, Offset: 0x9d0
// Size: 0xd4
function function_a84fcb78(var_3a553e99) {
    var_cf385861 = int(3 / 0.25);
    if (var_3a553e99 == var_cf385861) {
        self.var_7d0e99f3 = 1;
        self.var_3748ec02 = self.origin;
        self clientfield::set_to_player("" + #"hash_24e322568c9492c5", 1);
    }
    if (var_3a553e99 % var_cf385861 == 0) {
        self add_armor();
        self function_c25b980c();
    }
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0x18af00ea, Offset: 0xab0
// Size: 0x3c
function add_armor() {
    self zm_armor::add(#"stronghold_armor", 5, 50, #"");
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 0, eflags: 0x1 linked
// Checksum 0xe7f3c346, Offset: 0xaf8
// Size: 0x5a
function function_c25b980c() {
    if (!isdefined(self.var_807f94d7)) {
        self.var_807f94d7 = 0;
    }
    self.var_807f94d7 = self.var_807f94d7 + 1;
    self.var_807f94d7 = math::clamp(self.var_807f94d7, 0, 15);
}

// Namespace zm_perk_stronghold/zm_perk_stronghold
// Params 12, eflags: 0x1 linked
// Checksum 0x8f4a6873, Offset: 0xb60
// Size: 0x98
function function_11154900(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isdefined(attacker.var_807f94d7)) {
        damage = damage + damage * attacker.var_807f94d7 / 100;
    }
    return damage;
}

