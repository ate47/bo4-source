#using scripts\weapons\localheal.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\supplypod.gsc;
#using scripts\abilities\gadgets\gadget_smart_cover.gsc;
#using scripts\abilities\gadgets\gadget_concertina_wire.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\bots\bot_position.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_104c3c75;

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x2
// Checksum 0xb67a7eab, Offset: 0x130
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_67d1c49d4f76fc41", &__init__, &__main__, undefined);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function __init__() {
    
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0xf3e287ee, Offset: 0x190
// Size: 0x94
function __main__() {
    level bot_action::register_actions();
    level bot_action::register_weapons();
    level bot_action::function_25f1e3c1();
    level register_actions();
    level register_weapons();
    level function_25f1e3c1();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0xab322bcc, Offset: 0x230
// Size: 0x274
function register_actions() {
    bot_action::register_action(#"activate_health_gadget", &bot_action::weapon_rank, &function_bcb5ef11, &bot_action::activate_health_gadget);
    bot_action::register_action(#"throw_molotov", &bot_action::weapon_rank, &function_1275c409, &bot_action::throw_offhand);
    bot_action::register_action(#"throw_grenade", &bot_action::weapon_rank, &function_32e8b358, &bot_action::throw_offhand);
    bot_action::register_action(#"throw_mine", &bot_action::weapon_rank, &function_369cb1a5, &bot_action::function_94f96101);
    bot_action::register_action(#"hash_63c5000998c406e2", &bot_action::weapon_rank, &bot_action::function_39317d6e, &bot_action::test_gadget);
    bot_action::register_action(#"hash_7f17997c50415cb7", &bot_action::weapon_rank, &bot_action::function_30636b1c, &bot_action::test_gadget);
    bot_action::register_action(#"hash_291f02a64600bb72", &bot_action::weapon_rank, &bot_action::function_38d0d1df, &bot_action::test_gadget);
    if (!sessionmodeiswarzonegame()) {
        self function_938667bd();
        self function_d47799c8();
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x516f33bd, Offset: 0x4b0
// Size: 0x12c
function register_weapons() {
    bot_action::register_weapon(#"knife_held", &bot_action::function_d31777fa);
    bot_action::register_weapon(#"bare_hands", &bot_action::function_d31777fa);
    bot_action::function_f4302f2a(#"gadget_health_regen", &bot_action::function_2c39b990, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"gadget_medicalinjectiongun", &bot_action::function_2c39b990, &bot_action::function_a9847723);
    self function_b7cdffc();
    self function_d5ef6ef3();
    self function_c2e797aa();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x184a97b1, Offset: 0x5e8
// Size: 0x10c
function function_25f1e3c1() {
    bot_action::function_a2c83569(#"knife_held", #"melee_enemy");
    bot_action::function_a2c83569(#"bare_hands", #"melee_enemy");
    bot_action::function_7e847a84(#"gadget_health_regen", #"activate_health_gadget");
    bot_action::function_7e847a84(#"gadget_medicalinjectiongun", #"activate_health_gadget");
    self function_aaede90c();
    self function_aa5475f();
    self function_865733c1();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x751e4caa, Offset: 0x700
// Size: 0x464
function function_938667bd() {
    bot_action::register_action(#"hash_5397239dd3c8da8d", &bot_action::weapon_rank, &function_c98fad6b, &function_74ab5468);
    bot_action::register_action(#"hash_6fbd1b1c42e3a0c5", &bot_action::weapon_rank, &function_1c7ea685, &bot_action::deploy_gadget);
    bot_action::register_action(#"activate_localheal", &bot_action::weapon_rank, &function_7fa22be8, &bot_action::deploy_gadget);
    bot_action::register_action(#"activate_radiation_field", &bot_action::weapon_rank, &function_65b9c7c2, &activate_radiation_field);
    bot_action::register_action(#"use_tripwire", &bot_action::weapon_rank, &function_d18123f8, &use_tripwire);
    bot_action::register_action(#"activate_dog", &bot_action::weapon_rank, &bot_action::function_38d0d1df, &bot_action::deploy_gadget);
    bot_action::register_action(#"hash_4600e058d958fc21", &bot_action::weapon_rank, &function_17a8721f, &function_76c8b8e8);
    bot_action::register_action(#"activate_vision_pulse", &bot_action::weapon_rank, &bot_action::function_38d0d1df, &bot_action::deploy_gadget);
    bot_action::register_action(#"activate_noncombat_grapple", &bot_action::weapon_rank, &function_554a6177, &use_grapple);
    bot_action::register_action(#"activate_gravity_slam", &bot_action::weapon_rank, &function_97e7772c, &bot_action::function_94f96101);
    bot_action::register_action(#"deploy_spawnbeacon", &bot_action::weapon_rank, &function_9a0eb4f0, &bot_action::deploy_gadget);
    bot_action::register_action(#"hash_17f1a25f8c10e1cd", &bot_action::weapon_rank, &function_4a95cdaf, &bot_action::deploy_gadget);
    bot_action::register_action(#"hash_5d6b13cfb592ee04", &bot_action::weapon_rank, &function_e43892c4, &function_79988b4b);
    bot_action::register_action(#"use_icepick", &bot_action::weapon_rank, &bot_action::function_38d0d1df, &use_icepick);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x8d17a214, Offset: 0xb70
// Size: 0x4b4
function function_d47799c8() {
    bot_action::register_action(#"ac130", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"tank_robot", &bot_action::function_3df363bf, &function_d2107b, &function_8f5d7136);
    bot_action::register_action(#"counteruav", &bot_action::function_3df363bf, &function_6f232284, &function_39c29cdd);
    bot_action::register_action(#"dart", &bot_action::function_3df363bf, &function_85f39927, &function_7d799351);
    bot_action::register_action(#"drone_squadron", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"helicopter_comlink", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"overwatch_helicopter", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"planemortar", &bot_action::function_3df363bf, &function_66e1a1ca, &function_942b5513);
    bot_action::register_action(#"recon_car", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"remote_missile", &bot_action::function_3df363bf, &function_66e1a1ca, &function_27f291e1);
    bot_action::register_action(#"straferun", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"supply_drop", &bot_action::function_3df363bf, &function_d2107b, &function_8f5d7136);
    bot_action::register_action(#"swat_team", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"uav", &bot_action::function_3df363bf, &function_66e1a1ca, &function_39c29cdd);
    bot_action::register_action(#"ultimate_turret", &bot_action::function_3df363bf, &function_f90909b9, &activate_turret);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x87ae50cf, Offset: 0x1030
// Size: 0x684
function function_b7cdffc() {
    bot_action::function_f4302f2a(#"eq_swat_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"sig_buckler_dw", &bot_action::function_1879a202, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_cluster_semtex_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"hero_pineapplegun", &bot_action::function_1879a202, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"gadget_supplypod", &bot_action::function_1879a202, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_localheal", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"gadget_radiation_field", &bot_action::function_1879a202, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"hero_flamethrower", &bot_action::function_2c39b990, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_tripwire", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"ability_dog", &bot_action::function_1879a202, &bot_action::function_8171a298);
    bot_action::function_f4302f2a(#"eq_hawk", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"sig_bow_quickshot", &bot_action::function_1879a202, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_seeker_mine", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"shock_rifle", &bot_action::function_1879a202, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_sensor", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"gadget_vision_pulse", &bot_action::function_1879a202, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_grapple", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_gravityslam", &bot_action::function_1879a202, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"gadget_spawnbeacon", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"hero_annihilator", &bot_action::function_2c39b990, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_smoke", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"sig_blade", &bot_action::function_1879a202, &bot_action::function_ec16df22);
    bot_action::function_f4302f2a(#"eq_concertina_wire", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"ability_smart_cover", &bot_action::function_1879a202, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_emp_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"gadget_icepick", &bot_action::function_1879a202, &bot_action::function_ec16df22);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x8e1af72f, Offset: 0x16c0
// Size: 0x184
function function_d5ef6ef3() {
    bot_action::function_f4302f2a(#"eq_molotov", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_sticky_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"eq_slow_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"frag_grenade", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"hatchet", &bot_action::function_6d366261, &bot_action::function_a9847723);
    bot_action::function_f4302f2a(#"trophy_system", &bot_action::function_6d366261, &bot_action::function_a9847723);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x2460e7c6, Offset: 0x1850
// Size: 0x3c4
function function_c2e797aa() {
    bot_action::function_c67ea19e(#"ac130", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"ai_tank_marker", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"counteruav", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"dart", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"drone_squadron", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"helicopter_comlink", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"overwatch_helicopter", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"planemortar", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"recon_car", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"remote_missile", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"straferun", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"supplydrop_marker", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"swat_team", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"uav", &bot_action::function_791f5097, &bot_action::function_29163ca5);
    bot_action::function_c67ea19e(#"ultimate_turret", &bot_action::function_791f5097, &bot_action::function_29163ca5);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x1649f8ff, Offset: 0x1c20
// Size: 0x754
function function_aaede90c() {
    bot_action::function_7e847a84(#"eq_swat_grenade", #"throw_grenade");
    bot_action::function_7e847a84(#"sig_buckler_dw", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"sig_buckler_dw", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"sig_buckler_dw", #"hash_3d7dd2878425bcce");
    bot_action::function_7e847a84(#"eq_cluster_semtex_grenade", #"throw_grenade");
    bot_action::function_7e847a84(#"hero_pineapplegun", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"hero_pineapplegun", #"fire_grenade");
    bot_action::function_7e847a84(#"gadget_supplypod", #"hash_6fbd1b1c42e3a0c5");
    bot_action::function_7e847a84(#"eq_localheal", #"activate_localheal");
    bot_action::function_7e847a84(#"gadget_radiation_field", #"activate_radiation_field");
    bot_action::function_7e847a84(#"hero_flamethrower", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"hero_flamethrower", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"hero_flamethrower", #"hash_434716893aa869f3");
    bot_action::function_7e847a84(#"eq_tripwire", #"use_tripwire");
    bot_action::function_7e847a84(#"ability_dog", #"activate_dog");
    bot_action::function_7e847a84(#"eq_hawk", #"throw_grenade");
    bot_action::function_7e847a84(#"sig_bow_quickshot", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"sig_bow_quickshot", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"sig_bow_quickshot", #"hash_434716893aa869f3");
    bot_action::function_7e847a84(#"eq_seeker_mine", #"throw_mine");
    bot_action::function_7e847a84(#"shock_rifle", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"shock_rifle", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"shock_rifle", #"hash_434716893aa869f3");
    bot_action::function_7e847a84(#"eq_sensor", #"hash_4600e058d958fc21");
    bot_action::function_7e847a84(#"gadget_vision_pulse", #"activate_vision_pulse");
    bot_action::function_7e847a84(#"eq_grapple", #"activate_noncombat_grapple");
    bot_action::function_7e847a84(#"eq_gravityslam", #"activate_gravity_slam");
    bot_action::function_7e847a84(#"gadget_spawnbeacon", #"deploy_spawnbeacon");
    bot_action::function_7e847a84(#"hero_annihilator", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"hero_annihilator", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"hero_annihilator", #"hash_434716893aa869f3");
    bot_action::function_7e847a84(#"eq_smoke", #"throw_grenade");
    bot_action::function_7e847a84(#"sig_blade", #"hash_5397239dd3c8da8d");
    bot_action::function_a2c83569(#"sig_blade", #"hash_7aaeac32a4e1bf84");
    bot_action::function_a2c83569(#"sig_blade", #"hash_434716893aa869f3");
    bot_action::function_7e847a84(#"eq_concertina_wire", #"hash_17f1a25f8c10e1cd");
    bot_action::function_7e847a84(#"ability_smart_cover", #"hash_5d6b13cfb592ee04");
    bot_action::function_7e847a84(#"eq_emp_grenade", #"throw_mine");
    bot_action::function_7e847a84(#"gadget_icepick", #"use_icepick");
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0xa1cc272f, Offset: 0x2380
// Size: 0x124
function function_aa5475f() {
    bot_action::function_7e847a84(#"eq_molotov", #"throw_molotov");
    bot_action::function_7e847a84(#"eq_sticky_grenade", #"throw_grenade");
    bot_action::function_7e847a84(#"eq_slow_grenade", #"throw_grenade");
    bot_action::function_7e847a84(#"frag_grenade", #"throw_grenade");
    bot_action::function_7e847a84(#"hatchet", #"throw_grenade");
    bot_action::function_7e847a84(#"trophy_system", #"throw_mine");
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 0, eflags: 0x1 linked
// Checksum 0x5afb6fee, Offset: 0x24b0
// Size: 0x2d4
function function_865733c1() {
    bot_action::function_7e847a84(#"ac130", #"ac130");
    bot_action::function_7e847a84(#"ai_tank_marker", #"tank_robot");
    bot_action::function_7e847a84(#"counteruav", #"counteruav");
    bot_action::function_7e847a84(#"dart", #"dart");
    bot_action::function_7e847a84(#"drone_squadron", #"drone_squadron");
    bot_action::function_7e847a84(#"helicopter_comlink", #"helicopter_comlink");
    bot_action::function_7e847a84(#"overwatch_helicopter", #"overwatch_helicopter");
    bot_action::function_7e847a84(#"planemortar", #"planemortar");
    bot_action::function_7e847a84(#"recon_car", #"recon_car");
    bot_action::function_7e847a84(#"remote_missile", #"remote_missile");
    bot_action::function_7e847a84(#"straferun", #"straferun");
    bot_action::function_7e847a84(#"supplydrop_marker", #"supply_drop");
    bot_action::function_7e847a84(#"swat_team", #"swat_team");
    bot_action::function_7e847a84(#"uav", #"uav");
    bot_action::function_7e847a84(#"ultimate_turret", #"ultimate_turret");
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xec8de589, Offset: 0x2790
// Size: 0x23a
function function_c98fad6b(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (!self bot::in_combat()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x38>";
        #/
        return undefined;
    }
    if (!isalive(self.enemy)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x48>";
        #/
        return undefined;
    }
    if (self bot_action::function_b70a8fcf(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x58>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x1e17aae1, Offset: 0x29d8
// Size: 0x6e
function function_74ab5468(actionparams) {
    weapon = actionparams.weapon;
    self bot_action::function_ccdcc5d9(weapon);
    while (self isswitchingweapons()) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x41fac79f, Offset: 0x2a50
// Size: 0x3fa
function function_bcb5ef11(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (isdefined(self.heal.enabled) && self.heal.enabled) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x6e>";
        #/
        return undefined;
    }
    pathenemyfightdist = self.bot.tacbundle.pathenemyfightdist;
    if (!self ai::get_behavior_attribute("ignorepathenemyfightdist") && isdefined(self.enemy) && isdefined(pathenemyfightdist) && pathenemyfightdist > 0 && distance2dsquared(self.origin, self.enemy.origin) < pathenemyfightdist * pathenemyfightdist) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x78>";
        #/
        return undefined;
    }
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<dev string:x86>" + self.health + "<dev string:x91>" + self.maxhealth;
    #/
    healthratio = self.health / self.maxhealth;
    if (healthratio > self.bot.tacbundle.var_ac1c818f) {
        return undefined;
    }
    weapon = actionparams.weapon;
    slot = self gadgetgetslot(weapon);
    power = self gadgetpowerget(slot);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<dev string:x95>" + power;
    #/
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 3, eflags: 0x1 linked
// Checksum 0xde935e02, Offset: 0x2e58
// Size: 0x3aa
function function_daa183ff(actionparams, var_2a213a99, var_b5aae32c) {
    actionparams.target = self.enemy;
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (!self bot_action::function_ecf6dc7a(actionparams)) {
        return undefined;
    }
    if (self bot_action::function_b70a8fcf(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x58>";
        #/
        return undefined;
    }
    if (var_2a213a99) {
        self bot_action::function_26c2bce7(actionparams, "tag_origin");
    }
    self bot_action::function_8a2b82ad(actionparams);
    if (isdefined(var_b5aae32c) && distancesquared(self.origin, actionparams.aimpoint) <= var_b5aae32c) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x9f>";
        #/
        return undefined;
    }
    self bot_action::function_a3dfc4aa(actionparams);
    if (!isdefined(actionparams.var_cb785841)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xab>";
        #/
        return undefined;
    }
    self bot_action::function_9004d3ca(actionparams);
    if (!self bot_action::function_ade341c(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xcf>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x6cb8fdcf, Offset: 0x3210
// Size: 0x32
function function_1275c409(actionparams) {
    return self function_daa183ff(actionparams, 1, 250000);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x88f1c7a6, Offset: 0x3250
// Size: 0x22
function function_32e8b358(actionparams) {
    return self function_daa183ff(actionparams, 0);
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xbf18a92e, Offset: 0x3280
// Size: 0x28a
function function_369cb1a5(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = var_2b3b4fb.var_2cfdc66d + (0, 0, 55);
    if (distance2dsquared(target, self.origin) < 62500) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x105>";
        #/
        return undefined;
    }
    actionparams.target = target;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x9b867fed, Offset: 0x3518
// Size: 0x36a
function function_65b9c7c2(actionparams) {
    actionparams.target = self.enemy;
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (!self bot_action::function_ecf6dc7a(actionparams)) {
        return undefined;
    }
    if (self bot_action::function_b70a8fcf(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x58>";
        #/
        return undefined;
    }
    if (distance2dsquared(self.origin, self.enemy.origin) > 90000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x118>";
        #/
        return undefined;
    }
    if (isdefined(self.heal.enabled) && self.heal.enabled) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x6e>";
        #/
        return undefined;
    }
    healthratio = self.health / self.maxhealth;
    if (healthratio <= self.bot.tacbundle.var_ac1c818f) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x130>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x98994a8d, Offset: 0x3890
// Size: 0x196
function activate_radiation_field(actionparams) {
    weapon = actionparams.weapon;
    self bot_action::function_ccdcc5d9(weapon);
    slot = self gadgetgetslot(weapon);
    button = self function_c6e02c38(weapon);
    while (!self gadgetisactive(slot)) {
        self bottapbutton(button);
        self waittill(#"hash_347a612b61067eb3");
    }
    while (self gadgetisactive(slot) && self.health > 20) {
        self bottapbutton(button);
        self waittill(#"hash_347a612b61067eb3");
    }
    while (self isthrowinggrenade() || !self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x6d44fa6d, Offset: 0x3a30
// Size: 0x1d2
function function_97e7772c(actionparams) {
    actionparams.target = self.enemy;
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (!self bot_action::function_ecf6dc7a(actionparams)) {
        return undefined;
    }
    if (self bot_action::function_b70a8fcf(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x58>";
        #/
        return undefined;
    }
    if (distance2dsquared(self.origin, self.enemy.origin) > 40000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x118>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x9cd1330e, Offset: 0x3c10
// Size: 0x3de
function function_554a6177(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = var_2b3b4fb.var_2cfdc66d + (0, 0, 100);
    if (distance2dsquared(target, self.origin) < 40000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x105>";
        #/
        return undefined;
    }
    eye = self geteye();
    vectotarget = vectornormalize(target - eye);
    traceend = eye + vectotarget * 2000;
    trace = bullettrace(eye, traceend, 0, self);
    if (trace[#"fraction"] >= 1) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x13d>";
        #/
        return undefined;
    }
    target = trace[#"position"];
    actionparams.target = target;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x34b4c308, Offset: 0x3ff8
// Size: 0x258
function use_grapple(actionparams) {
    weapon = actionparams.weapon;
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<dev string:x14c>" + "<dev string:x169>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    self waittill(#"hash_347a612b61067eb3");
    while (self botgetlookdot() < 0.99 || self istraversing()) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    self bot_action::function_ccdcc5d9(weapon);
    self waittill(#"hash_347a612b61067eb3");
    while (!self isgrappling() && self getcurrentoffhand() == weapon) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    while (self isgrappling() && self getcurrentoffhand() == weapon) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x969640fc, Offset: 0x4258
// Size: 0x2c6
function function_9a0eb4f0(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    timesincespawn = gettime() - self.spawntime;
    if (timesincespawn < 10000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x17e>";
        #/
        return undefined;
    }
    var_775fe08e = getarraykeys(level.spawnbeaconsettings.userspawnbeacons);
    foreach (var_2e194e82 in var_775fe08e) {
        if (var_2e194e82 == self.clientid) {
            /#
                if (!isdefined(actionparams.debug)) {
                    actionparams.debug = [];
                } else if (!isarray(actionparams.debug)) {
                    actionparams.debug = array(actionparams.debug);
                }
                actionparams.debug[actionparams.debug.size] = "<dev string:x195>";
            #/
            return undefined;
        }
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xc8afe69a, Offset: 0x4528
// Size: 0x322
function function_4a95cdaf(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = var_2b3b4fb.var_2cfdc66d;
    if (distance2dsquared(target, self.origin) > 10000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x1b4>";
        #/
        return undefined;
    }
    if (!concertina_wire::function_6fe5a945(self).isvalid) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x1c5>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x834b761c, Offset: 0x4858
// Size: 0x28a
function function_e43892c4(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = var_2b3b4fb.var_2cfdc66d + (0, 0, 55);
    if (distance2dsquared(target, self.origin) < 40000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x105>";
        #/
        return undefined;
    }
    actionparams.target = target;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x24dec538, Offset: 0x4af0
// Size: 0x1dc
function function_79988b4b(actionparams) {
    weapon = actionparams.weapon;
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<dev string:x1d3>" + "<dev string:x169>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    while (self botgetlookdot() < 0.999 || self istraversing()) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    self bot_action::function_ccdcc5d9(weapon);
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
    self function_d4c687c9();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x9aa64756, Offset: 0x4cd8
// Size: 0x3ca
function function_17a8721f(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    timesincespawn = gettime() - self.spawntime;
    if (timesincespawn < 5000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x17e>";
        #/
        return undefined;
    }
    eye = self geteye();
    forwarddir = anglestoforward(self getplayerangles());
    traceend = eye + forwarddir * 1000;
    trace = bullettrace(eye, traceend, 0, self);
    if (trace[#"fraction"] >= 1) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x13d>";
        #/
        return undefined;
    }
    target = trace[#"position"];
    navmeshpoint = getclosestpointonnavmesh(target, 150);
    if (!isdefined(navmeshpoint)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x1f7>";
        #/
        return undefined;
    }
    actionparams.target = target;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x1cb5ec2e, Offset: 0x50b0
// Size: 0x17e
function function_76c8b8e8(actionparams) {
    weapon = actionparams.weapon;
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<dev string:x215>" + "<dev string:x169>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    self bot_action::function_ccdcc5d9(weapon);
    starttime = gettime();
    while (gettime() - starttime < 1000) {
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
        self waittill(#"hash_347a612b61067eb3");
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x2dda49e5, Offset: 0x5238
// Size: 0x2ea
function function_7fa22be8(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_660b71a5 = self locaheal::function_45fd00c6();
    if (!isdefined(var_660b71a5)) {
        var_660b71a5 = [];
    } else if (!isarray(var_660b71a5)) {
        var_660b71a5 = array(var_660b71a5);
    }
    var_660b71a5[var_660b71a5.size] = self;
    var_7f6f772c = [];
    foreach (player in var_660b71a5) {
        if (isalive(player)) {
            if (!isdefined(var_7f6f772c)) {
                var_7f6f772c = [];
            } else if (!isarray(var_7f6f772c)) {
                var_7f6f772c = array(var_7f6f772c);
            }
            var_7f6f772c[var_7f6f772c.size] = player;
        }
    }
    var_92330a71 = var_7f6f772c.size / 1 * var_660b71a5.size;
    if (var_92330a71 < 0.66) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x236>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xb3861bc8, Offset: 0x5530
// Size: 0x3ea
function function_1c7ea685(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_9f517317 = 0;
    primaryweapons = self getweaponslistprimaries();
    foreach (primaryweapon in primaryweapons) {
        ammo = self getammocount(primaryweapon);
        startammo = primaryweapon.startammo;
        ammoused = startammo - ammo;
        if (ammoused >= primaryweapon.clipsize) {
            var_9f517317 = 1;
            break;
        }
    }
    if (!var_9f517317) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x259>";
        #/
        return undefined;
    }
    player_pos = self.origin;
    player_angles = self getplayerangles();
    player_eye_pos = self geteye();
    ignore_entity = undefined;
    weapon = actionparams.weapon;
    results = deployable::function_54d27855(player_pos, player_angles, player_eye_pos, weapon, ignore_entity);
    gameplay_allows_deploy = supplypod::function_1f8cd247(results.origin, results.angles, self);
    if (!gameplay_allows_deploy) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x26d>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x68ad225a, Offset: 0x5928
// Size: 0x422
function function_d18123f8(actionparams) {
    if (!self bot_action::function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xe9>";
        #/
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = vectorlerp(var_2b3b4fb.var_2cfdc66d, var_2b3b4fb.var_c78b4464, 0.5) + (0, 0, 50);
    eye = self geteye();
    trace = bullettrace(eye, target, 0, self);
    target = trace[#"position"];
    if (distance2dsquared(target, self.origin) > 10000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x1b4>";
        #/
        return undefined;
    }
    var_f52a3a89 = vectorcross(var_2b3b4fb.var_c78b4464 - self.origin, var_2b3b4fb.var_2cfdc66d - self.origin);
    direction = self getplayerangles();
    offsetvec = vectorcross(var_2b3b4fb.var_2cfdc66d - self.origin, anglestoup(direction));
    if (var_f52a3a89[2] < 0) {
        offsetvec = vectorscale(offsetvec, -1);
    }
    offsetvec = vectornormalize(offsetvec);
    offsetvec = vectorscale(offsetvec, 200) + (0, 0, 25);
    actionparams.target = target;
    actionparams.target2 = target + offsetvec;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x74b7318a, Offset: 0x5d58
// Size: 0x35e
function use_tripwire(actionparams) {
    weapon = actionparams.weapon;
    button = self function_c6e02c38(weapon);
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<dev string:x280>" + "<dev string:x169>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    self waittill(#"hash_347a612b61067eb3");
    while (self botgetlookdot() < 0.99 || self istraversing()) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    self bot_action::function_ccdcc5d9(weapon);
    self waittill(#"tripwire_spawn");
    var_c7b51a54 = gettime();
    actionparams.target = actionparams.target2;
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    self waittill(#"hash_347a612b61067eb3");
    while (self botgetlookdot() < 0.99 || self istraversing() || gettime() - var_c7b51a54 < 1000) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    self bottapbutton(button);
    self waittill(#"hash_347a612b61067eb3");
    if (!self isswitchingweapons()) {
        self bottapbutton(71);
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x2a23cc31, Offset: 0x60c0
// Size: 0x13e
function use_icepick(actionparams) {
    weapon = actionparams.weapon;
    self bot_action::function_ccdcc5d9(weapon);
    while (self isswitchingweapons() || !self function_a39f313c()) {
        self waittill(#"hash_347a612b61067eb3");
    }
    while (self getcurrentweapon() == weapon && !self isswitchingweapons()) {
        self waittill(#"hash_347a612b61067eb3");
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 2, eflags: 0x1 linked
// Checksum 0x92df4316, Offset: 0x6208
// Size: 0x362
function function_9c943ad6(actionparams, var_af50df89) {
    if (!self bot_action::function_e7fa3d0()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x29e>";
        #/
        return false;
    }
    var_87b53013 = actionparams.action.name;
    scorestreakweapon = actionparams.weapon;
    haskillstreak = self killstreaks::has_killstreak(var_87b53013);
    var_96648639 = self killstreaks::get_killstreak_quantity(scorestreakweapon) > 0;
    hasscorestreak = haskillstreak || var_96648639;
    if (!hasscorestreak) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x2c2>";
        #/
        return false;
    }
    if (self killstreakrules::iskillstreakallowed(var_87b53013, self.team) == 0) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x2dd>";
        #/
        return false;
    }
    if (var_af50df89 == self bot::has_visible_enemy()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x2f7>";
        #/
        return false;
    }
    return true;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x3f252350, Offset: 0x6578
// Size: 0x2e
function function_66e1a1ca(actionparams) {
    if (!function_9c943ad6(actionparams, 1)) {
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xaa516245, Offset: 0x65b0
// Size: 0x2e
function function_85f39927(actionparams) {
    if (!function_9c943ad6(actionparams, 0)) {
        return undefined;
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xe16bc175, Offset: 0x65e8
// Size: 0x2ca
function function_6f232284(actionparams) {
    if (!function_9c943ad6(actionparams, 1)) {
        return undefined;
    }
    if (level.teambased) {
        var_e2448ab6 = 0;
        foreach (team in level.teams) {
            if (isdefined(self.team) && util::function_fbce7263(self.team, team) && killstreaks::hasuav(team)) {
                var_e2448ab6 = 1;
            }
        }
        if (!var_e2448ab6) {
            /#
                if (!isdefined(actionparams.debug)) {
                    actionparams.debug = [];
                } else if (!isarray(actionparams.debug)) {
                    actionparams.debug = array(actionparams.debug);
                }
                actionparams.debug[actionparams.debug.size] = "<dev string:x30c>";
            #/
            return undefined;
        }
    } else {
        foreach (enabled, uavowner in level.activeuavs) {
            var_1836afa = 0;
            if (enabled && uavowner != self.entnum) {
                var_1836afa = 1;
            }
        }
        if (!var_1836afa) {
            /#
                if (!isdefined(actionparams.debug)) {
                    actionparams.debug = [];
                } else if (!isarray(actionparams.debug)) {
                    actionparams.debug = array(actionparams.debug);
                }
                actionparams.debug[actionparams.debug.size] = "<dev string:x30c>";
            #/
            return undefined;
        }
    }
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xd5a8bbe1, Offset: 0x68c0
// Size: 0x592
function function_d2107b(actionparams) {
    if (!function_9c943ad6(actionparams, 1)) {
        return undefined;
    }
    if (isdefined(self.var_3f8901ac) && gettime() - self.var_3f8901ac < 5000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x324>";
        #/
        return undefined;
    }
    var_7607a546 = getclosesttacpoint(self.origin);
    if (!isdefined(var_7607a546)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x33f>";
        #/
        return undefined;
    }
    cylinder = ai::t_cylinder(self.origin, 512, 512);
    var_e50a845c = tacticalquery("stratcom_tacquery_position", cylinder);
    var_6fa334a7 = array::randomize(var_e50a845c);
    botdir = anglestoforward(self getplayerangles());
    var_ff975a6 = vectornormalize(botdir * (1, 1, 0));
    var_c375900c = undefined;
    foreach (point in var_6fa334a7) {
        if (function_96c81b85(var_7607a546, point.origin)) {
            var_4102ab31 = vectornormalize((point.origin - self.origin) * (1, 1, 0));
            dot = vectordot(var_4102ab31, var_ff975a6);
            if (dot > 0.707) {
                var_c375900c = point;
                break;
            }
        }
    }
    if (!isdefined(var_c375900c)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x367>";
        #/
        return undefined;
    }
    mask = 1;
    from = var_c375900c.origin + (0, 0, 10);
    to = var_c375900c.origin + (0, 0, 2000);
    trace = physicstrace(from, to, (-50, -50, 0), (50, 50, 100), undefined, mask);
    if (trace[#"fraction"] < 1) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x397>";
        #/
        return undefined;
    }
    actionparams.target = var_c375900c.origin + (0, 0, 20);
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x78a79772, Offset: 0x6e60
// Size: 0x1da
function function_f90909b9(actionparams) {
    if (!function_9c943ad6(actionparams, 1)) {
        return undefined;
    }
    var_2b3b4fb = self function_f04bd922();
    if (!isdefined(var_2b3b4fb)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:xf9>";
        #/
        return undefined;
    }
    target = var_2b3b4fb.var_2cfdc66d + (0, 0, 55);
    if (distance2dsquared(target, self.origin) < 40000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<dev string:x105>";
        #/
        return undefined;
    }
    actionparams.target = target;
    return 100;
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x728c933, Offset: 0x7048
// Size: 0x96
function function_39c29cdd(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_action::function_11c3d810(scorestreakweapon);
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x11f61c9e, Offset: 0x70e8
// Size: 0x224
function function_8f5d7136(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    self bot_action::function_11c3d810(scorestreakweapon);
    while (!self function_a39f313c() || self getcurrentweapon() != scorestreakweapon) {
        self waittill(#"hash_347a612b61067eb3");
    }
    wait 0.5;
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    while (self botgetlookdot() < 0.999 || self istraversing()) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    self bottapbutton(0);
    self.var_3f8901ac = gettime();
    while (!self function_a39f313c() || self getcurrentweapon() == scorestreakweapon || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
    self function_d4c687c9();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x1e96f80e, Offset: 0x7318
// Size: 0x31e
function function_942b5513(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_action::function_11c3d810(scorestreakweapon);
    while (!self function_a39f313c() || self getcurrentweapon() != scorestreakweapon) {
        self waittill(#"hash_347a612b61067eb3");
    }
    shots_fired = 0;
    enemies = self teams::getenemyplayers();
    aliveenemies = [];
    foreach (enemy in enemies) {
        if (isalive(enemy)) {
            aliveenemies[aliveenemies.size] = enemy;
        }
    }
    targetlocations = [];
    for (i = 0; i < aliveenemies.size; i++) {
        targetlocations[i] = aliveenemies[i].origin;
    }
    if (targetlocations.size > 0) {
        while (shots_fired < 3) {
            location = array::random(targetlocations) + (randomfloatrange(0, 200), randomfloatrange(0, 200), 0);
            self notify(#"confirm_location", {#position:location, #yaw:0});
            shots_fired++;
            if (shots_fired == 3) {
                break;
            }
            self waittill(#"hash_347a612b61067eb3");
        }
    } else {
        while (shots_fired < 3) {
            self botpressbutton(16);
            self waittill(#"hash_347a612b61067eb3");
            shots_fired++;
        }
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0xb5bf6644, Offset: 0x7640
// Size: 0x24c
function activate_turret(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_action::function_11c3d810(scorestreakweapon);
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    while (self getcurrentweapon() != scorestreakweapon) {
        self waittill(#"hash_347a612b61067eb3");
    }
    self bot_action::function_8a2b82ad(actionparams);
    self bot_action::aim_at_target(actionparams);
    while (self botgetlookdot() < 0.999 || self istraversing()) {
        self waittill(#"hash_347a612b61067eb3");
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::aim_at_target(actionparams);
    }
    wait 0.5;
    starttime = gettime();
    while (self getcurrentweapon() == scorestreakweapon && gettime() - starttime < 1000) {
        self bottapbutton(0);
        self waittill(#"hash_347a612b61067eb3");
    }
    wait 1;
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
    self function_d4c687c9();
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x9aebceb8, Offset: 0x7898
// Size: 0x3ce
function function_27f291e1(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_action::function_11c3d810(scorestreakweapon);
    starttime = gettime();
    while (!isdefined(self.rocket) && gettime() - starttime < 4000) {
        self waittill(#"hash_347a612b61067eb3");
    }
    wait 1;
    starttime = gettime();
    boosted = 0;
    while (isdefined(self.rocket)) {
        outsidetargets = [];
        foreach (player in level.players) {
            if (isalive(player) && util::function_fbce7263(player.team, self.team)) {
                closesttacpoint = getclosesttacpoint(player.origin);
                if (isdefined(closesttacpoint)) {
                    if (closesttacpoint.ceilingheight > 4000) {
                        if (!isdefined(outsidetargets)) {
                            outsidetargets = [];
                        } else if (!isarray(outsidetargets)) {
                            outsidetargets = array(outsidetargets);
                        }
                        outsidetargets[outsidetargets.size] = player;
                    }
                }
            }
        }
        closesttarget = undefined;
        var_914420bb = -1;
        foreach (target in outsidetargets) {
            var_6800dff4 = distance2dsquared(target.origin, self.rocket.origin);
            if (var_914420bb < 0 || var_6800dff4 < var_914420bb) {
                closesttarget = target;
                var_914420bb = var_6800dff4;
            }
        }
        self.rocket missile_settarget(closesttarget);
        if (!boosted && isdefined(closesttarget)) {
            var_3268fa4b = self.rocket.origin[2] - closesttarget.origin[2];
            if (var_3268fa4b < 4000) {
                self bottapbutton(0);
                boosted = 1;
            }
        }
        wait 0.25;
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace namespace_104c3c75/namespace_104c3c75
// Params 1, eflags: 0x1 linked
// Checksum 0x1a1b7d02, Offset: 0x7c70
// Size: 0x198
function function_7d799351(actionparams) {
    scorestreakweapon = actionparams.weapon;
    self bot_action::function_11c3d810(scorestreakweapon);
    self bot_position::stop();
    self function_a57c34b7(self.origin);
    while (!self function_a39f313c() || self getcurrentweapon() != scorestreakweapon) {
        self waittill(#"hash_347a612b61067eb3");
    }
    while (!self isinvehicle() && self getcurrentweapon() == scorestreakweapon) {
        if (isdefined(self.enemy)) {
            actionparams.target = self.enemy.origin + (0, 0, 45);
        }
        if (isdefined(actionparams.target)) {
            self bot_action::function_8a2b82ad(actionparams);
            self bot_action::aim_at_target(actionparams);
        }
        self bottapbutton(0);
        wait 0.5;
    }
}

