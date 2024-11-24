#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_red_challenges_rewards;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace namespace_5c5619de;

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 0, eflags: 0x2
// Checksum 0x407b69a, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_1570e320e0161e3d", &__init__, undefined, undefined);
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 0, eflags: 0x1 linked
// Checksum 0xc62ea193, Offset: 0x160
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_27f8093e2c3d8f82", &on_begin, &on_end);
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x5 linked
// Checksum 0xd35add89, Offset: 0x1c8
// Size: 0x7c
function private on_begin(var_264ee2f5) {
    var_264ee2f5 = zm_trial::function_5769f26a(var_264ee2f5);
    level thread function_cec06121(var_264ee2f5);
    callback::on_weapon_change(&zm_trial_util::function_79518194);
    callback::function_33f0ddd3(&function_68af83a9);
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x5 linked
// Checksum 0xbe785f41, Offset: 0x250
// Size: 0x1a2
function private on_end(round_reset) {
    level.var_388587c6 = undefined;
    level zm_trial::function_25ee130(0);
    callback::remove_on_weapon_change(&zm_trial_util::function_79518194);
    callback::function_824d206(&function_68af83a9);
    foreach (player in getplayers()) {
        player zm_trial_util::function_dc0859e();
        if (!round_reset) {
            player.var_ad52095e = undefined;
        }
    }
    var_e4ee403e = struct::get_array("trials_oracle_boon_weapon_spawns");
    foreach (var_9a1edfd9 in var_e4ee403e) {
        zm_unitrigger::unregister_unitrigger(var_9a1edfd9.s_unitrigger);
        var_9a1edfd9.s_unitrigger = undefined;
    }
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x5 linked
// Checksum 0xfa019b2a, Offset: 0x400
// Size: 0xd4
function private function_68af83a9(s_event) {
    w_root = zm_weapons::function_93cd8e76(s_event.weapon);
    if (!zm_loadout::function_2ff6913(w_root) && isarray(level.var_388587c6) && !isinarray(level.var_388587c6, w_root.name)) {
        self lockweapon(s_event.weapon);
        return;
    }
    self unlockweapon(s_event.weapon);
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x1 linked
// Checksum 0xd914d62d, Offset: 0x4e0
// Size: 0x41a
function function_cec06121(var_264ee2f5) {
    level endon(#"hash_7646638df88a3656");
    wait 12;
    foreach (player in getplayers()) {
        player zm_trial_util::function_bf710271();
    }
    level zm_trial::function_25ee130(1);
    level.var_388587c6 = array(#"ar_standard_t8_upgraded", #"pistol_fullauto_t8_upgraded", #"smg_fastburst_t8_upgraded", #"smg_mp40_t8_upgraded", #"smg_folding_t8_upgraded", #"shotgun_fullauto_t8_upgraded", #"lmg_stealth_t8_upgraded", #"sniper_mini14_t8_upgraded", #"ar_peacekeeper_t8_upgraded", #"tr_flechette_t8_upgraded", #"sniper_locus_t8_upgraded");
    foreach (player in getplayers()) {
        var_4cd7f83c = player getweaponslistprimaries();
        if (isarray(player.var_ad52095e)) {
            foreach (var_f20e894b in player.var_ad52095e) {
                player unlockweapon(var_f20e894b);
            }
        }
        player zm_trial_util::function_7dbb1712(1);
    }
    while (true) {
        var_e4ee403e = struct::get_array("trials_oracle_boon_weapon_spawns");
        var_e4ee403e = array::filter(var_e4ee403e, 0, &function_c55d2b6e);
        var_e4ee403e = array::randomize(var_e4ee403e);
        a_players = util::get_active_players();
        foreach (player in a_players) {
            var_9a1edfd9 = var_e4ee403e[player getentitynumber()];
            if (isdefined(var_9a1edfd9)) {
                var_9a1edfd9 thread spawn_weapon(max(var_264ee2f5 - 10, 10));
            }
        }
        wait var_264ee2f5;
    }
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x1 linked
// Checksum 0x999489b9, Offset: 0x908
// Size: 0x34
function function_c55d2b6e(var_9a1edfd9) {
    if (isdefined(var_9a1edfd9.var_ff08ccc) && var_9a1edfd9.var_ff08ccc) {
        return false;
    }
    return true;
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x1 linked
// Checksum 0xd957e5cf, Offset: 0x948
// Size: 0xde
function spawn_weapon(var_6d4294b0) {
    self.var_ff08ccc = 1;
    str_weapon_name = array::random(level.var_388587c6);
    weapon = getweapon(str_weapon_name);
    if (weapon === level.weaponnone) {
        return;
    }
    mdl_weapon = zm_utility::spawn_weapon_model(weapon, undefined, self.origin, self.angles);
    mdl_weapon.weapon = weapon;
    self function_33e89162(mdl_weapon, var_6d4294b0);
    self.var_ff08ccc = undefined;
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 2, eflags: 0x1 linked
// Checksum 0xb66f95d6, Offset: 0xa30
// Size: 0x28c
function function_33e89162(mdl_weapon, var_6d4294b0) {
    self zm_unitrigger::create(&function_c99662e7, 64, &function_ebd0491e);
    mdl_weapon thread clientfield::set("powerup_fx", 2);
    mdl_weapon thread zm_red_challenges_rewards::function_51fd2597(1);
    mdl_weapon thread zm_red_challenges_rewards::pickup_timeout(undefined, undefined, max(var_6d4294b0 - 5, 5));
    s_waitresult = self waittilltimeout(var_6d4294b0, #"boon_weapon_picked_up");
    if (s_waitresult._notify == "boon_weapon_picked_up" && isplayer(s_waitresult.player)) {
        weapon_reward = s_waitresult.player zm_red_challenges_rewards::function_e2a25377(mdl_weapon.weapon.name);
        s_waitresult.player unlockweapon(weapon_reward);
        if (!isdefined(s_waitresult.player.var_ad52095e)) {
            s_waitresult.player.var_ad52095e = [];
        } else if (!isarray(s_waitresult.player.var_ad52095e)) {
            s_waitresult.player.var_ad52095e = array(s_waitresult.player.var_ad52095e);
        }
        if (!isinarray(s_waitresult.player.var_ad52095e, weapon_reward)) {
            s_waitresult.player.var_ad52095e[s_waitresult.player.var_ad52095e.size] = weapon_reward;
        }
    }
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    self.s_unitrigger = undefined;
    mdl_weapon delete();
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 1, eflags: 0x1 linked
// Checksum 0x3682e1b2, Offset: 0xcc8
// Size: 0x68
function function_c99662e7(player) {
    str_prompt = zm_utility::function_d6046228(#"hash_10c127acbe34c506", #"hash_4597718560da3ea2");
    self sethintstringforplayer(player, str_prompt);
    return true;
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 0, eflags: 0x1 linked
// Checksum 0x16ad35f3, Offset: 0xd38
// Size: 0xba
function function_ebd0491e() {
    self endon(#"death");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        player = s_waitresult.activator;
        if (!zm_utility::can_use(player, 1)) {
            continue;
        }
        self.stub.related_parent notify(#"boon_weapon_picked_up", {#player:player});
        return;
    }
}

// Namespace namespace_5c5619de/namespace_5c5619de
// Params 0, eflags: 0x1 linked
// Checksum 0x3dc76fe8, Offset: 0xe00
// Size: 0x32
function is_active() {
    s_challenge = zm_trial::function_a36e8c38(#"hash_27f8093e2c3d8f82");
    return isdefined(s_challenge);
}

