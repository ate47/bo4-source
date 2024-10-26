#using scripts\zm_common\trials\zm_trial_restrict_loadout.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_perk_tortoise;

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x2
// Checksum 0xaef80383, Offset: 0x1a0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_tortoise", &__init__, &__main__, undefined);
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0xb5c8d4c6, Offset: 0x1f0
// Size: 0x14
function __init__() {
    enable_tortoise_perk_for_level();
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x210
// Size: 0x4
function __main__() {
    
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x36033fd5, Offset: 0x220
// Size: 0x23c
function enable_tortoise_perk_for_level() {
    if (function_8b1a219a()) {
        zm_perks::register_perk_basic_info(#"specialty_shield", #"perk_tortoise", 2500, #"hash_61f2a9db3bdc745a", getweapon("zombie_perk_bottle_tortoise"), getweapon("zombie_perk_totem_tortoise"), #"zmperksvictorious");
    } else {
        zm_perks::register_perk_basic_info(#"specialty_shield", #"perk_tortoise", 2500, #"zombie/perk_tortoise", getweapon("zombie_perk_bottle_tortoise"), getweapon("zombie_perk_totem_tortoise"), #"zmperksvictorious");
    }
    zm_perks::register_perk_precache_func(#"specialty_shield", &function_1441654f);
    zm_perks::register_perk_clientfields(#"specialty_shield", &function_2ebeec84, &function_9b64bd1b);
    zm_perks::register_perk_machine(#"specialty_shield", &function_c282add5, &function_3cc019d7);
    zm_perks::register_perk_host_migration_params(#"specialty_shield", "p7_zm_vending_nuke", "divetonuke_light");
    zm_perks::register_perk_threads(#"specialty_shield", &function_f8196ccf, &function_b754923d);
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x468
// Size: 0x4
function function_3cc019d7() {
    
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x522b5a7c, Offset: 0x478
// Size: 0xbe
function function_1441654f() {
    level.machine_assets[#"specialty_shield"] = spawnstruct();
    level.machine_assets[#"specialty_shield"].weapon = getweapon("zombie_perk_bottle_tortoise");
    level.machine_assets[#"specialty_shield"].off_model = "p7_zm_vending_nuke";
    level.machine_assets[#"specialty_shield"].on_model = "p7_zm_vending_nuke";
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0xd17d2409, Offset: 0x540
// Size: 0x34
function function_2ebeec84() {
    clientfield::register("allplayers", "perk_tortoise_explosion", 1, 1, "counter");
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 1, eflags: 0x1 linked
// Checksum 0x1ac30970, Offset: 0x580
// Size: 0xc
function function_9b64bd1b(state) {
    
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 4, eflags: 0x1 linked
// Checksum 0x7e8200bc, Offset: 0x598
// Size: 0xb6
function function_c282add5(use_trigger, perk_machine, bump_trigger, collision) {
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

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0xf6b084e5, Offset: 0x658
// Size: 0x1a
function function_f8196ccf() {
    self.var_27aeb716 = &function_81058b09;
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 4, eflags: 0x1 linked
// Checksum 0x615f78a7, Offset: 0x680
// Size: 0x2e
function function_b754923d(b_pause, str_perk, str_result, n_slot) {
    self.var_27aeb716 = undefined;
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 1, eflags: 0x1 linked
// Checksum 0x5de31f3f, Offset: 0x6b8
// Size: 0x330
function function_81058b09(var_d92ac80e) {
    a_ai = self getenemiesinradius(self.origin, 320);
    a_ai = arraysortclosest(a_ai, self.origin);
    if (zm_trial_restrict_loadout::is_active()) {
        a_ai = [];
    }
    foreach (ai in a_ai) {
        if (ai.health <= 1200) {
            ai.marked_for_death = 1;
        }
    }
    self playsound(#"hash_14f5104610856f3e");
    self thread explosion_fx();
    v_explosion_origin = self.origin;
    foreach (ai in a_ai) {
        if (!isalive(ai)) {
            continue;
        }
        ai.var_cbfc5f6e = 1;
        ai dodamage(1200, v_explosion_origin, self, self, "none", "MOD_EXPLOSIVE", 0, var_d92ac80e);
        if (isalive(ai)) {
            if (ai.var_6f84b820 === #"heavy" || ai.var_6f84b820 === #"miniboss") {
                if (!(isdefined(ai.knockdown) && ai.knockdown)) {
                    ai ai::stun();
                }
            } else {
                ai zombie_utility::setup_zombie_knockdown(v_explosion_origin);
            }
        } else if (isdefined(ai) && (ai.var_6f84b820 === #"basic" || ai.var_6f84b820 === #"enhanced")) {
            ai zm_spawner::zombie_explodes_intopieces(0);
        }
        if (isdefined(ai)) {
            ai.var_cbfc5f6e = undefined;
        }
        waitframe(1);
    }
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x1 linked
// Checksum 0x804cdd76, Offset: 0x9f0
// Size: 0x3c
function explosion_fx() {
    self endon(#"death");
    wait 0.3;
    self clientfield::increment("perk_tortoise_explosion");
}

