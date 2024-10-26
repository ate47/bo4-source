#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace zm_perk_random;

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x2
// Checksum 0x2d4bd9ee, Offset: 0x358
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_perk_random", &__init__, &__main__, undefined);
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xaa74f00c, Offset: 0x3a8
// Size: 0x29c
function __init__() {
    level._random_zombie_perk_cost = 1500;
    clientfield::register("scriptmover", "perk_bottle_cycle_state", 1, 2, "int");
    clientfield::register("zbarrier", "set_client_light_state", 1, 2, "int");
    clientfield::register("zbarrier", "client_stone_emmissive_blink", 1, 1, "int");
    clientfield::register("zbarrier", "init_perk_random_machine", 1, 1, "int");
    clientfield::register("scriptmover", "turn_active_perk_light_green", 1, 1, "int");
    clientfield::register("scriptmover", "turn_on_location_indicator", 1, 1, "int");
    clientfield::register("zbarrier", "lightning_bolt_FX_toggle", 1, 1, "int");
    clientfield::register("scriptmover", "turn_active_perk_ball_light", 1, 1, "int");
    clientfield::register("scriptmover", "zone_captured", 1, 1, "int");
    level._effect[#"perk_machine_light_yellow"] = #"hash_63cff764b54ceca2";
    level._effect[#"perk_machine_light_red"] = #"hash_5b7d2edb8392ef21";
    level._effect[#"perk_machine_light_green"] = #"hash_130f1aaf8384975";
    level._effect[#"perk_machine_location"] = #"hash_130f1aaf8384975";
    level flag::init("machine_can_reset");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x56c1e5d9, Offset: 0x650
// Size: 0x7c
function __main__() {
    if (!isdefined(level.perk_random_machine_count)) {
        level.perk_random_machine_count = 1;
    }
    if (!isdefined(level.perk_random_machine_state_func)) {
        level.perk_random_machine_state_func = &process_perk_random_machine_state;
    }
    /#
        level thread setup_devgui();
    #/
    level thread setup_perk_random_machines();
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x4
// Checksum 0xae5b436f, Offset: 0x6d8
// Size: 0x84
function private setup_perk_random_machines() {
    waittillframeend();
    level.perk_bottle_weapon_array = arraycombine(level.machine_assets, level._custom_perks, 0, 1);
    level.perk_random_machines = getentarray("perk_random_machine", "targetname");
    level.perk_random_machine_count = level.perk_random_machines.size;
    perk_random_machine_init();
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x9e83b0c0, Offset: 0x768
// Size: 0x134
function perk_random_machine_init() {
    foreach (machine in level.perk_random_machines) {
        if (!isdefined(machine.cost)) {
            machine.cost = 1500;
        }
        machine.current_perk_random_machine = 0;
        machine.uses_at_current_location = 0;
        machine create_perk_random_machine_unitrigger_stub();
        machine clientfield::set("init_perk_random_machine", 1);
        wait 0.5;
        machine thread set_perk_random_machine_state("power_off");
    }
    level.perk_random_machines = array::randomize(level.perk_random_machines);
    init_starting_perk_random_machine_location();
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x4
// Checksum 0x41c74a1c, Offset: 0x8a8
// Size: 0x136
function private init_starting_perk_random_machine_location() {
    b_starting_machine_found = 0;
    for (i = 0; i < level.perk_random_machines.size; i++) {
        if (isdefined(level.perk_random_machines[i].script_noteworthy) && issubstr(level.perk_random_machines[i].script_noteworthy, "start_perk_random_machine") && !(isdefined(b_starting_machine_found) && b_starting_machine_found)) {
            level.perk_random_machines[i].current_perk_random_machine = 1;
            level.perk_random_machines[i] thread machine_think();
            level.perk_random_machines[i] thread set_perk_random_machine_state("initial");
            b_starting_machine_found = 1;
            continue;
        }
        level.perk_random_machines[i] thread wait_for_power();
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x82eb7f8e, Offset: 0x9e8
// Size: 0x17c
function create_perk_random_machine_unitrigger_stub() {
    self.unitrigger_stub = spawnstruct();
    self.unitrigger_stub.script_width = 70;
    self.unitrigger_stub.script_height = 30;
    self.unitrigger_stub.script_length = 40;
    self.unitrigger_stub.origin = self.origin + anglestoright(self.angles) * self.unitrigger_stub.script_length + anglestoup(self.angles) * self.unitrigger_stub.script_height / 2;
    self.unitrigger_stub.angles = self.angles;
    self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
    self.unitrigger_stub.trigger_target = self;
    zm_unitrigger::unitrigger_force_per_player_triggers(self.unitrigger_stub, 1);
    self.unitrigger_stub.prompt_and_visibility_func = &perk_random_machine_trigger_update_prompt;
    self.unitrigger_stub.script_int = self.script_int;
    thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &perk_random_unitrigger_think);
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0xbc4f3cf5, Offset: 0xb70
// Size: 0x90
function perk_random_machine_trigger_update_prompt(player) {
    can_use = self perk_random_machine_stub_update_prompt(player);
    if (isdefined(self.hint_string)) {
        if (isdefined(self.hint_parm1)) {
            self sethintstring(self.hint_string, self.hint_parm1);
        } else {
            self sethintstring(self.hint_string);
        }
    }
    return can_use;
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x5db53d78, Offset: 0xc08
// Size: 0x286
function perk_random_machine_stub_update_prompt(player) {
    self setcursorhint("HINT_NOICON");
    if (!self trigger_visible_to_player(player)) {
        return 0;
    }
    self.hint_parm1 = undefined;
    n_power_on = is_power_on(self.stub.script_int);
    if (!n_power_on) {
        self.hint_string = #"zombie/need_power";
        return 0;
    }
    if (self.stub.trigger_target.state == "idle" || self.stub.trigger_target.state == "vending") {
        n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
        if (!player zm_utility::can_player_purchase_perk()) {
            self.hint_string = #"hash_4c509a13051ab81";
            if (isdefined(n_purchase_limit)) {
                self.hint_parm1 = n_purchase_limit;
            }
            return 0;
        } else if (isdefined(self.stub.trigger_target.machine_user)) {
            if (isdefined(self.stub.trigger_target.grab_perk_hint) && self.stub.trigger_target.grab_perk_hint) {
                self.hint_string = #"hash_58afe6f04e854611";
                return 1;
            } else {
                self.hint_string = "";
                return 0;
            }
        } else {
            n_purchase_limit = player zm_utility::get_player_perk_purchase_limit();
            if (!player zm_utility::can_player_purchase_perk()) {
                self.hint_string = #"hash_4c509a13051ab81";
                if (isdefined(n_purchase_limit)) {
                    self.hint_parm1 = n_purchase_limit;
                }
                return 0;
            } else {
                self.hint_string = #"hash_5a5c92d88d46def";
                self.hint_parm1 = level._random_zombie_perk_cost;
                return 1;
            }
        }
        return;
    }
    self.hint_string = #"hash_2696440da6a4b627";
    return 0;
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x66e917b4, Offset: 0xe98
// Size: 0x118
function trigger_visible_to_player(player) {
    self setinvisibletoplayer(player);
    visible = 1;
    if (isdefined(self.stub.trigger_target.machine_user)) {
        if (player != self.stub.trigger_target.machine_user || zm_loadout::is_placeable_mine(self.stub.trigger_target.machine_user getcurrentweapon())) {
            visible = 0;
        }
    } else if (!player can_buy_perk()) {
        visible = 0;
    }
    if (!visible) {
        return false;
    }
    if (player player_has_all_available_perks()) {
        return false;
    }
    self setvisibletoplayer(player);
    return true;
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x92de3493, Offset: 0xfb8
// Size: 0x68
function player_has_all_available_perks() {
    if (isdefined(level._random_perk_machine_perk_list)) {
        for (i = 0; i < level._random_perk_machine_perk_list.size; i++) {
            if (!self hasperk(level._random_perk_machine_perk_list[i])) {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xfb9f2708, Offset: 0x1028
// Size: 0xac
function can_buy_perk() {
    if (self zm_utility::is_drinking()) {
        return false;
    }
    current_weapon = self getcurrentweapon();
    if (zm_loadout::is_placeable_mine(current_weapon) || zm_equipment::is_equipment_that_blocks_purchase(current_weapon)) {
        return false;
    }
    if (self zm_utility::in_revive_trigger()) {
        return false;
    }
    if (current_weapon == level.weaponnone) {
        return false;
    }
    return true;
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x5817bda0, Offset: 0x10e0
// Size: 0x60
function perk_random_unitrigger_think(player) {
    self endon(#"kill_trigger");
    while (true) {
        self.stub.trigger_target notify(#"trigger", self waittill(#"trigger"));
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x561acba0, Offset: 0x1148
// Size: 0x6f0
function machine_think() {
    level notify(#"machine_think");
    level endon(#"machine_think");
    self.num_time_used = 0;
    self.num_til_moved = randomintrange(3, 7);
    if (self.state !== "initial" || "idle") {
        self thread set_perk_random_machine_state("arrive");
        self waittill(#"arrived");
        self thread set_perk_random_machine_state("initial");
        wait 1;
    }
    if (isdefined(level.zm_custom_perk_random_power_flag)) {
        level flag::wait_till(level.zm_custom_perk_random_power_flag);
    } else {
        while (!is_power_on(self.script_int)) {
            wait 1;
        }
    }
    self thread set_perk_random_machine_state("idle");
    if (isdefined(level.bottle_spawn_location)) {
        level.bottle_spawn_location delete();
    }
    level.bottle_spawn_location = spawn("script_model", self.origin);
    level.bottle_spawn_location setmodel(#"tag_origin");
    level.bottle_spawn_location.angles = self.angles;
    level.bottle_spawn_location.origin += (0, 0, 65);
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        level flag::clear("machine_can_reset");
        if (!player zm_score::can_player_purchase(level._random_zombie_perk_cost)) {
            self playsound(#"evt_perk_deny");
            continue;
        }
        self.machine_user = player;
        self.num_time_used++;
        player zm_stats::increment_client_stat("use_perk_random");
        player zm_stats::increment_player_stat("use_perk_random");
        player zm_score::minus_to_player_score(level._random_zombie_perk_cost);
        self thread set_perk_random_machine_state("vending");
        if (isdefined(level.perk_random_vo_func_usemachine) && isdefined(player)) {
            player thread [[ level.perk_random_vo_func_usemachine ]]();
        }
        while (true) {
            random_perk = get_weighted_random_perk(player);
            self playsound(#"zmb_rand_perk_start");
            self playloopsound(#"zmb_rand_perk_loop", 1);
            wait 1;
            self notify(#"bottle_spawned");
            self thread start_perk_bottle_cycling();
            self thread perk_bottle_motion();
            model = zm_perks::get_perk_weapon_model(random_perk);
            wait 3;
            self notify(#"done_cycling");
            if (self.num_time_used >= self.num_til_moved && level.perk_random_machine_count > 1) {
                level.bottle_spawn_location setmodel(#"wpn_t7_zmb_perk_bottle_bear_world");
                self stoploopsound(0.5);
                self thread set_perk_random_machine_state("leaving");
                wait 3;
                player zm_score::add_to_player_score(level._random_zombie_perk_cost);
                level.bottle_spawn_location setmodel(#"tag_origin");
                self thread machine_selector();
                self clientfield::set("lightning_bolt_FX_toggle", 0);
                self.machine_user = undefined;
                break;
            } else {
                level.bottle_spawn_location setmodel(model);
            }
            self playsound(#"zmb_rand_perk_bottle");
            self.grab_perk_hint = 1;
            self thread grab_check(player, random_perk);
            self thread time_out_check();
            self util::waittill_either("grab_check", "time_out_check");
            self.grab_perk_hint = 0;
            self playsound(#"zmb_rand_perk_stop");
            self stoploopsound(0.5);
            self.machine_user = undefined;
            level.bottle_spawn_location setmodel(#"tag_origin");
            self thread set_perk_random_machine_state("idle");
            break;
        }
        level flag::wait_till("machine_can_reset");
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 2, eflags: 0x0
// Checksum 0x3557cb37, Offset: 0x1840
// Size: 0x28a
function grab_check(player, random_perk) {
    self endon(#"time_out_check");
    perk_is_bought = 0;
    while (!perk_is_bought) {
        waitresult = self waittill(#"trigger");
        e_triggerer = waitresult.activator;
        if (e_triggerer == player) {
            if (player zm_utility::is_drinking()) {
                wait 0.1;
                continue;
            }
            if (player zm_utility::can_player_purchase_perk()) {
                perk_is_bought = 1;
                continue;
            }
            self playsound(#"evt_perk_deny");
            self notify(#"time_out_or_perk_grab");
            return;
        }
    }
    player zm_stats::increment_client_stat("grabbed_from_perk_random");
    player zm_stats::increment_player_stat("grabbed_from_perk_random");
    player thread monitor_when_player_acquires_perk();
    self notify(#"grab_check");
    self notify(#"time_out_or_perk_grab");
    player notify(#"perk_purchased", {#perk:random_perk});
    player zm_perks::perk_give_bottle_begin(random_perk);
    evt = player waittill(#"fake_death", #"death", #"player_downed", #"weapon_change_complete");
    if (evt._notify == "weapon_change_complete") {
        player thread zm_perks::wait_give_perk(random_perk);
    }
    if (!(isdefined(player.has_drunk_wunderfizz) && player.has_drunk_wunderfizz)) {
        player.has_drunk_wunderfizz = 1;
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xba8f68ad, Offset: 0x1ad8
// Size: 0x64
function monitor_when_player_acquires_perk() {
    self waittill(#"perk_acquired", #"death", #"disconnect", #"player_downed");
    level flag::set("machine_can_reset");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xe57fd66f, Offset: 0x1b48
// Size: 0x54
function time_out_check() {
    self endon(#"grab_check");
    wait 10;
    self notify(#"time_out_check");
    level flag::set("machine_can_reset");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x95b646bc, Offset: 0x1ba8
// Size: 0xb4
function wait_for_power() {
    if (isdefined(self.script_int)) {
        str_wait = "power_on" + self.script_int;
        level flag::wait_till(str_wait);
    } else if (isdefined(level.zm_custom_perk_random_power_flag)) {
        level flag::wait_till(level.zm_custom_perk_random_power_flag);
    } else {
        level flag::wait_till("power_on");
    }
    self thread set_perk_random_machine_state("away");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xb07f241e, Offset: 0x1c68
// Size: 0xc4
function machine_selector() {
    if (level.perk_random_machines.size == 1) {
        new_machine = level.perk_random_machines[0];
        new_machine thread machine_think();
        return;
    }
    do {
        new_machine = level.perk_random_machines[randomint(level.perk_random_machines.size)];
    } while (new_machine.current_perk_random_machine == 1);
    new_machine.current_perk_random_machine = 1;
    self.current_perk_random_machine = 0;
    wait 10;
    new_machine thread machine_think();
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0xe1bcf67f, Offset: 0x1d38
// Size: 0xaa
function include_perk_in_random_rotation(perk) {
    if (!isdefined(level._random_perk_machine_perk_list)) {
        level._random_perk_machine_perk_list = [];
    }
    if (!isdefined(level._random_perk_machine_perk_list)) {
        level._random_perk_machine_perk_list = [];
    } else if (!isarray(level._random_perk_machine_perk_list)) {
        level._random_perk_machine_perk_list = array(level._random_perk_machine_perk_list);
    }
    level._random_perk_machine_perk_list[level._random_perk_machine_perk_list.size] = perk;
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x20463da4, Offset: 0x1df0
// Size: 0x164
function get_weighted_random_perk(player) {
    keys = array::randomize(getarraykeys(level._random_perk_machine_perk_list));
    if (isdefined(level.custom_random_perk_weights)) {
        keys = player [[ level.custom_random_perk_weights ]]();
    }
    /#
        forced_perk = getdvarstring(#"scr_force_perk");
        if (forced_perk != "<dev string:x38>" && isdefined(level._random_perk_machine_perk_list[forced_perk])) {
            arrayinsert(keys, forced_perk, 0);
        }
    #/
    for (i = 0; i < keys.size; i++) {
        if (player hasperk(level._random_perk_machine_perk_list[keys[i]])) {
            continue;
        }
        return level._random_perk_machine_perk_list[keys[i]];
    }
    return level._random_perk_machine_perk_list[keys[0]];
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x3525b221, Offset: 0x1f60
// Size: 0x224
function perk_bottle_motion() {
    putouttime = 3;
    putbacktime = 10;
    v_float = anglestoforward(self.angles - (0, 90, 0)) * 10;
    level.bottle_spawn_location.origin = self.origin + (0, 0, 53);
    level.bottle_spawn_location.angles = self.angles;
    level.bottle_spawn_location.origin -= v_float;
    level.bottle_spawn_location moveto(level.bottle_spawn_location.origin + v_float, putouttime, putouttime * 0.5);
    level.bottle_spawn_location.angles += (0, 0, 10);
    level.bottle_spawn_location rotateyaw(720, putouttime, putouttime * 0.5);
    self waittill(#"done_cycling");
    level.bottle_spawn_location.angles = self.angles;
    level.bottle_spawn_location moveto(level.bottle_spawn_location.origin - v_float, putbacktime, putbacktime * 0.5);
    level.bottle_spawn_location rotateyaw(90, putbacktime, putbacktime * 0.5);
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x8055c745, Offset: 0x2190
// Size: 0x12a
function start_perk_bottle_cycling() {
    self endon(#"done_cycling");
    array_key = getarraykeys(level.perk_bottle_weapon_array);
    timer = 0;
    while (true) {
        for (i = 0; i < array_key.size; i++) {
            if (isdefined(level.perk_bottle_weapon_array[array_key[i]].weapon)) {
                model = getweaponmodel(level.perk_bottle_weapon_array[array_key[i]].weapon);
            } else {
                model = getweaponmodel(level.perk_bottle_weapon_array[array_key[i]].perk_bottle_weapon);
            }
            level.bottle_spawn_location setmodel(model);
            wait 0.2;
        }
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x7887f86f, Offset: 0x22c8
// Size: 0xd4
function perk_random_vending() {
    self clientfield::set("client_stone_emmissive_blink", 1);
    self thread perk_random_loop_anim(5, "opening", "opening");
    self thread perk_random_loop_anim(3, "closing", "closing");
    self thread perk_random_vend_sfx();
    self notify(#"vending");
    self waittill(#"bottle_spawned");
    self setzbarrierpiecestate(4, "opening");
}

// Namespace zm_perk_random/zm_perk_random
// Params 3, eflags: 0x0
// Checksum 0x1b424cfe, Offset: 0x23a8
// Size: 0xe2
function perk_random_loop_anim(n_piece, s_anim_1, s_anim_2) {
    self endon(#"zbarrier_state_change");
    current_state = self.state;
    while (self.state == current_state) {
        self setzbarrierpiecestate(n_piece, s_anim_1);
        while (self getzbarrierpiecestate(n_piece) == s_anim_1) {
            waitframe(1);
        }
        self setzbarrierpiecestate(n_piece, s_anim_2);
        while (self getzbarrierpiecestate(n_piece) == s_anim_2) {
            waitframe(1);
        }
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x7fc13441, Offset: 0x2498
// Size: 0x8c
function perk_random_vend_sfx() {
    self playloopsound(#"zmb_rand_perk_sparks");
    level.bottle_spawn_location playloopsound(#"zmb_rand_perk_vortex");
    self waittill(#"zbarrier_state_change");
    self stoploopsound();
    level.bottle_spawn_location stoploopsound();
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xa3a14060, Offset: 0x2530
// Size: 0x24
function perk_random_initial() {
    self setzbarrierpiecestate(3, "opening");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xd52d79fd, Offset: 0x2560
// Size: 0xac
function perk_random_idle() {
    self clientfield::set("client_stone_emmissive_blink", 0);
    if (isdefined(level.var_5e48927d)) {
        self [[ level.var_5e48927d ]]();
        return;
    }
    self clientfield::set("lightning_bolt_FX_toggle", 1);
    while (self.state == "idle") {
        waitframe(1);
    }
    self clientfield::set("lightning_bolt_FX_toggle", 0);
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x9ec30b0, Offset: 0x2618
// Size: 0x46
function perk_random_arrive() {
    while (self getzbarrierpiecestate(0) == "opening") {
        waitframe(1);
    }
    self notify(#"arrived");
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0x9754bb7d, Offset: 0x2668
// Size: 0x54
function perk_random_leaving() {
    while (self getzbarrierpiecestate(0) == "closing") {
        waitframe(1);
    }
    waitframe(1);
    self thread set_perk_random_machine_state("away");
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x3341345c, Offset: 0x26c8
// Size: 0x84
function set_perk_random_machine_state(state) {
    wait 0.1;
    for (i = 0; i < self getnumzbarrierpieces(); i++) {
        self hidezbarrierpiece(i);
    }
    self notify(#"zbarrier_state_change");
    self [[ level.perk_random_machine_state_func ]](state);
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0xf960db9b, Offset: 0x2758
// Size: 0x4aa
function process_perk_random_machine_state(state) {
    switch (state) {
    case #"arrive":
        self showzbarrierpiece(0);
        self showzbarrierpiece(1);
        self setzbarrierpiecestate(0, "opening");
        self setzbarrierpiecestate(1, "opening");
        self clientfield::set("set_client_light_state", 1);
        self thread perk_random_arrive();
        self.state = "arrive";
        break;
    case #"idle":
        self showzbarrierpiece(5);
        self showzbarrierpiece(2);
        self setzbarrierpiecestate(2, "opening");
        self clientfield::set("set_client_light_state", 1);
        self.state = "idle";
        self thread perk_random_idle();
        break;
    case #"power_off":
        self showzbarrierpiece(2);
        self setzbarrierpiecestate(2, "closing");
        self clientfield::set("set_client_light_state", 0);
        self.state = "power_off";
        break;
    case #"vending":
        self showzbarrierpiece(5);
        self showzbarrierpiece(3);
        self showzbarrierpiece(4);
        self clientfield::set("set_client_light_state", 1);
        self.state = "vending";
        self thread perk_random_vending();
        break;
    case #"leaving":
        self showzbarrierpiece(1);
        self showzbarrierpiece(0);
        self setzbarrierpiecestate(0, "closing");
        self setzbarrierpiecestate(1, "closing");
        self clientfield::set("set_client_light_state", 3);
        self thread perk_random_leaving();
        self.state = "leaving";
        break;
    case #"away":
        self showzbarrierpiece(2);
        self setzbarrierpiecestate(2, "closing");
        self clientfield::set("set_client_light_state", 3);
        self.state = "away";
        break;
    case #"initial":
        self showzbarrierpiece(3);
        self setzbarrierpiecestate(3, "opening");
        self showzbarrierpiece(5);
        self clientfield::set("set_client_light_state", 0);
        self.state = "initial";
        break;
    default:
        if (isdefined(level.var_7453ade8)) {
            self [[ level.var_7453ade8 ]](state);
        }
        break;
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 0, eflags: 0x0
// Checksum 0xe58528ca, Offset: 0x2c10
// Size: 0x118
function machine_sounds() {
    level endon(#"machine_think");
    while (true) {
        level waittill(#"pmstrt");
        rndprk_ent = spawn("script_origin", self.origin);
        rndprk_ent stopsounds();
        state_switch = level waittill(#"pmstop", #"pmmove", #"machine_think");
        rndprk_ent stoploopsound(1);
        if (state_switch._notify == "pmstop") {
        }
        rndprk_ent delete();
    }
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x63c4d37a, Offset: 0x2d30
// Size: 0x16
function getweaponmodel(weapon) {
    return weapon.worldmodel;
}

// Namespace zm_perk_random/zm_perk_random
// Params 1, eflags: 0x0
// Checksum 0x2fee1584, Offset: 0x2d50
// Size: 0xa2
function is_power_on(n_power_index) {
    if (isdefined(n_power_index)) {
        str_power = "power_on" + n_power_index;
        n_power_on = level flag::get(str_power);
    } else if (isdefined(level.zm_custom_perk_random_power_flag)) {
        n_power_on = level flag::get(level.zm_custom_perk_random_power_flag);
    } else {
        n_power_on = level flag::get("power_on");
    }
    return n_power_on;
}

/#

    // Namespace zm_perk_random/zm_perk_random
    // Params 0, eflags: 0x0
    // Checksum 0x951e73e, Offset: 0x2e00
    // Size: 0x1e
    function setup_devgui() {
        level.perk_random_devgui_callback = &wunderfizz_devgui_callback;
    }

    // Namespace zm_perk_random/zm_perk_random
    // Params 1, eflags: 0x0
    // Checksum 0x47916ae8, Offset: 0x2e28
    // Size: 0x20a
    function wunderfizz_devgui_callback(cmd) {
        players = getplayers();
        a_e_wunderfizzes = getentarray("<dev string:x3b>", "<dev string:x51>");
        e_wunderfizz = arraygetclosest(getplayers()[0].origin, a_e_wunderfizzes);
        switch (cmd) {
        case #"wunderfizz_leaving":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x5e>");
            break;
        case #"wunderfizz_arriving":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x68>");
            break;
        case #"wunderfizz_vending":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x71>");
            e_wunderfizz notify(#"bottle_spawned");
            break;
        case #"wunderfizz_idle":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x7b>");
            break;
        case #"hash_67d324a91b1fd821":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x82>");
            break;
        case #"wunderfizz_initial":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x8e>");
            break;
        case #"wunderfizz_away":
            e_wunderfizz thread set_perk_random_machine_state("<dev string:x98>");
            break;
        }
    }

#/
