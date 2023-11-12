// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\zm\zm_mansion_ww_lvl3_quest.gsc;
#using scripts\zm\zm_mansion_triad.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;

#namespace namespace_a35b43eb;

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x2
// Checksum 0x83328c83, Offset: 0x348
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_trap_firegate", &__init__, &__main__, undefined);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xc44f1655, Offset: 0x398
// Size: 0x94
function __init__() {
    level thread function_85839afe();
    callback::on_finalize_initialization(&init);
    if (!isdefined(level.var_db63b33b)) {
        level.var_db63b33b = new throttle();
        [[ level.var_db63b33b ]]->initialize(2, 0.1);
    }
    init_clientfields();
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x438
// Size: 0x4
function __main__() {
    
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xe6f4dd8a, Offset: 0x448
// Size: 0x84
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"trap_light", 8000, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_17df66ef5f71c0de", 8000, 2, "int");
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x92199037, Offset: 0x4d8
// Size: 0x24
function init() {
    callback::on_connect(&function_96e29e5f);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x508
// Size: 0x4
function function_96e29e5f() {
    
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x1da75408, Offset: 0x518
// Size: 0x1d4
function function_85839afe() {
    a_zombie_traps = getentarray("zombie_trap", "targetname");
    level.var_ba53c5c5 = array::filter(a_zombie_traps, 0, &function_960a9a04);
    if (zm_custom::function_901b751c(#"zmtrapsenabled")) {
        level.var_940ee624 = 0;
        level.var_adc872f3 = 0;
        level.var_bdcd506f = 0;
        level thread function_a8f79714();
    }
    foreach (zm_trap_firegate in level.var_ba53c5c5) {
        zm_trap_firegate function_bd8eddac();
    }
    if (!zm_custom::function_901b751c(#"zmtrapsenabled")) {
        return;
    }
    zm_traps::register_trap_basic_info("firegate", &function_16746b30, &function_30db46c1);
    zm_traps::register_trap_damage("firegate", &function_26578bc6, &function_5ad19000);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0x5001ab25, Offset: 0x6f8
// Size: 0x20
function function_960a9a04(e_ent) {
    return e_ent.script_noteworthy === "firegate";
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x98839377, Offset: 0x720
// Size: 0x2fc
function function_bd8eddac() {
    self flag::init(#"enabled");
    self flag::init(#"activated");
    self flag::init(#"friendly");
    self.var_a768e132 = [];
    self.var_3a2026c0 = [];
    self.var_3d6b88c4 = [];
    self.var_872ce8b7 = [];
    a_e_elements = getentarray(self.target, "targetname");
    foreach (e_element in a_e_elements) {
        if (e_element.script_noteworthy === "trap_console") {
            self.var_3d6b88c4[self.var_3d6b88c4.size] = e_element;
        } else if (e_element.script_noteworthy === "trap_lever") {
            self.var_872ce8b7[self.var_872ce8b7.size] = e_element;
        } else if (e_element.script_noteworthy === "bulletclip") {
            e_element notsolid();
            self.bulletclip = e_element;
        }
    }
    a_s_elements = struct::get_array(self.target, "targetname");
    foreach (s_element in a_s_elements) {
        if (s_element.script_noteworthy === "source_trig_pos") {
            self.var_3a2026c0[self.var_3a2026c0.size] = s_element;
        } else if (s_element.script_noteworthy === "energy_source") {
            self.var_a768e132[self.var_a768e132.size] = s_element;
        }
    }
    array::thread_all(self.var_3d6b88c4, &function_e714e3a8, "off");
    self thread function_aa539d7b();
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x58daaa5b, Offset: 0xa28
// Size: 0x4c8
function function_aa539d7b() {
    level flag::wait_till("all_players_spawned");
    self deactivate_trap();
    if (!zm_custom::function_901b751c(#"zmtrapsenabled")) {
        return;
    }
    if (!zm_utility::is_standard()) {
        level flag::wait_till(self.var_78f643be);
    }
    self.var_23769a97 = [];
    foreach (s_src in self.var_3a2026c0) {
        str_prompt = zm_utility::function_d6046228(#"hash_888d5fd1e90d685", #"hash_f1db4a15f0e12bb");
        var_47323b73 = mansion_util::create_unitrigger(s_src, &function_5b8a557f, str_prompt, 0, 0, 0);
        var_47323b73.e_trap = self;
        var_47323b73.prompt_and_visibility_func = &function_9026cbcd;
        self.var_23769a97[self.var_23769a97.size] = var_47323b73;
    }
    if (zm_utility::is_standard()) {
        self flag::set(#"enabled");
        level flag::set(self.script_flag_wait);
        array::thread_all(self.var_3d6b88c4, &function_e714e3a8, "green");
        foreach (var_4a416ea9 in self.var_3d6b88c4) {
            var_fe316a03 = util::spawn_model(#"p8_zm_man_fire_trap_power_core_on", var_4a416ea9 gettagorigin("energy_core_tag"), var_4a416ea9 gettagangles("energy_core_tag"));
            var_fe316a03 linkto(var_4a416ea9, "energy_core_tag");
        }
        return;
    }
    self flag::wait_till(#"enabled");
    playsoundatposition(#"hash_277a6124c088ba6d", self.origin);
    sound_ent = spawn("script_origin", self.origin);
    sound_ent playloopsound(#"hash_39e79a32dcbea912");
    level flag::set(self.script_flag_wait);
    array::thread_all(self.var_3d6b88c4, &function_e714e3a8, "green");
    foreach (var_4a416ea9 in self.var_3d6b88c4) {
        var_fe316a03 = util::spawn_model(#"p8_zm_man_fire_trap_power_core_on", var_4a416ea9 gettagorigin("energy_core_tag"), var_4a416ea9 gettagangles("energy_core_tag"));
        var_fe316a03 linkto(var_4a416ea9, "energy_core_tag");
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x81684d0b, Offset: 0xef8
// Size: 0x2a0
function function_5b8a557f() {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        e_trap = self.stub.e_trap;
        if (isdefined(e_trap.var_23aecef0) && e_trap.var_23aecef0 || zm_utility::is_standard()) {
            if (!zm_utility::can_use(e_player)) {
                continue;
            }
            if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
                continue;
            }
            if (isdefined(e_trap.is_cooling) && e_trap.is_cooling || isdefined(e_trap._trap_in_use) && e_trap._trap_in_use) {
                continue;
            }
            if (zm_utility::is_player_valid(e_player) && !(isdefined(e_trap._trap_in_use) && e_trap._trap_in_use)) {
                b_purchased = self zm_traps::trap_purchase(e_player, e_trap.zombie_cost);
                if (!b_purchased) {
                    continue;
                }
                if (isdefined(e_trap) && isalive(e_player)) {
                    level thread zm_traps::trap_activate(e_trap, e_player);
                }
            }
        } else if (level.var_940ee624 > 0) {
            e_player thread function_1bcb6813();
            e_trap.var_23aecef0 = 1;
            mdl_trap = arraygetclosest(self.stub.origin, level.var_ba53c5c5);
            mdl_trap flag::set(#"enabled");
            level.var_940ee624--;
            level.var_bdcd506f++;
            level thread function_7b170638(level.var_bdcd506f, 0);
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x5 linked
// Checksum 0xa2c4ef5a, Offset: 0x11a0
// Size: 0x52
function private function_1bcb6813() {
    if (!(isdefined(self.var_72a21e82) && self.var_72a21e82)) {
        self.var_72a21e82 = self zm_audio::create_and_play_dialog(#"fire_trap", #"set");
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0xff9426be, Offset: 0x1200
// Size: 0x2ee
function function_9026cbcd(player) {
    self.hint_string = self.stub.hint_string;
    if (player zm_utility::is_drinking() || isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
        return 0;
    }
    if (isdefined(self.stub.e_trap._trap_in_use) && self.stub.e_trap._trap_in_use) {
        return 0;
    }
    if (isdefined(self.stub.e_trap.is_cooling) && self.stub.e_trap.is_cooling) {
        self sethintstring(#"zombie/trap_cooldown");
        return 1;
    }
    if (isdefined(self.stub.e_trap.var_23aecef0) && self.stub.e_trap.var_23aecef0 && !zm_utility::is_standard()) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_6e8ef1b690e98e51", self.stub.e_trap.zombie_cost);
            return 1;
        } else {
            self sethintstring(#"hash_23c1c09e94181fdb", self.stub.e_trap.zombie_cost);
            return 1;
        }
    } else if (zm_utility::is_standard()) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_61d85c966dd9e83f");
            return 1;
        } else {
            self sethintstring(#"hash_24a438482954901");
            return 1;
        }
    } else if (level.var_940ee624 > 0) {
        str_prompt = zm_utility::function_d6046228(#"hash_888d5fd1e90d685", #"hash_f1db4a15f0e12bb");
        self sethintstring(str_prompt);
        return 1;
    } else {
        self sethintstring(#"hash_5f05371ea87b812e");
        return 1;
    }
    return 1;
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xbb7f2cf5, Offset: 0x14f8
// Size: 0x1ac
function function_a8f79714() {
    if (zm_utility::is_standard()) {
        return;
    }
    level.var_4f17d729 = [];
    if (math::cointoss()) {
        array::add(level.var_4f17d729, function_2a5a929("mansion_downstairs"));
    } else {
        array::add(level.var_4f17d729, function_2a5a929("mansion_upstairs"));
    }
    if (math::cointoss()) {
        array::add(level.var_4f17d729, function_2a5a929("cemetery"));
    } else {
        array::add(level.var_4f17d729, function_2a5a929("mausoleum"));
    }
    if (math::cointoss()) {
        array::add(level.var_4f17d729, function_2a5a929("greenhouse"));
    } else {
        array::add(level.var_4f17d729, function_2a5a929("gardens"));
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 2, eflags: 0x1 linked
// Checksum 0xd314a96e, Offset: 0x16b0
// Size: 0x1a6
function function_2a5a929(str_location, var_b7eee573) {
    a_s_locs = struct::get_array("s_firegate_energy_src_" + str_location, "targetname");
    var_d0ed2a4c = 0;
    while (!var_d0ed2a4c) {
        s_loc = array::random(a_s_locs);
        if (!isdefined(s_loc.b_occupied)) {
            s_loc.b_occupied = 1;
            var_d0ed2a4c = 1;
        }
    }
    str_prompt = zm_utility::function_d6046228(#"hash_78bf6e69946b64ca", #"hash_7042b50d373a6fce");
    var_47323b73 = mansion_util::create_unitrigger(s_loc, &function_b1bd4115, str_prompt, 0, undefined, 0);
    var_47323b73.mdl = util::spawn_model(#"p8_zm_man_fire_trap_power_core_on", s_loc.origin, s_loc.angles);
    var_47323b73.mdl notsolid();
    var_47323b73.mdl thread pickup_spin();
    var_47323b73.str_location = str_location;
    return var_47323b73;
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x12e8e03b, Offset: 0x1860
// Size: 0x178
function function_b1bd4115() {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (zm_utility::is_player_valid(e_player)) {
            level.var_940ee624++;
            level.var_adc872f3++;
            level thread function_7b170638(level.var_adc872f3, 1);
            e_player thread zm_audio::create_and_play_dialog(#"component_pickup", #"generic");
            arrayremovevalue(level.var_4f17d729, self, 0);
            playsoundatposition(#"hash_7512ff4121bb5604", e_player.origin);
            if (isdefined(self.stub.mdl)) {
                self.stub.mdl delete();
            }
            zm_unitrigger::unregister_unitrigger(self.stub);
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 2, eflags: 0x1 linked
// Checksum 0x6bd0b63a, Offset: 0x19e0
// Size: 0xf4
function function_7b170638(var_8163cc4, b_found) {
    switch (var_8163cc4) {
    case 1:
        var_7a0a29e3 = #"hash_379a0cb8e272c259";
        break;
    case 2:
        var_7a0a29e3 = #"hash_379a09b8e272bd40";
        break;
    case 3:
        var_7a0a29e3 = #"hash_379a0ab8e272bef3";
        break;
    }
    if (isdefined(var_7a0a29e3)) {
        if (b_found) {
            level zm_ui_inventory::function_7df6bb60(var_7a0a29e3, 1);
        } else {
            level zm_ui_inventory::function_7df6bb60(var_7a0a29e3, 2);
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xcd0cf0a6, Offset: 0x1ae0
// Size: 0x70
function pickup_spin() {
    self endon(#"death");
    self playloopsound(#"hash_3b9597774dea00d6");
    while (1) {
        self rotateyaw(180, 1);
        wait(1);
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x5dff4318, Offset: 0x1b58
// Size: 0x1a4
function function_16746b30() {
    self._trap_duration = 30;
    self._trap_cooldown_time = 30;
    if (isdefined(level.sndtrapfunc)) {
        level thread [[ level.sndtrapfunc ]](self, 1);
    }
    self.activated_by_player thread function_45a2294f(self.script_string);
    foreach (e_trap in level.var_ba53c5c5) {
        if (e_trap.script_string === self.script_string) {
            e_trap thread zm_traps::trap_damage();
        }
    }
    self waittilltimeout(self._trap_duration, #"trap_deactivate");
    foreach (e_trap in level.var_ba53c5c5) {
        if (e_trap.script_string === self.script_string) {
            e_trap notify(#"trap_done");
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1d08
// Size: 0x4
function function_30db46c1() {
    
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0x867523e, Offset: 0x1d18
// Size: 0x310
function function_45a2294f(str_id) {
    foreach (e_trap in level.var_ba53c5c5) {
        if (e_trap.script_string === str_id) {
            e_trap thread activate_trap(self);
            array::thread_all(e_trap.var_3d6b88c4, &function_e714e3a8, "red");
            array::run_all(e_trap.var_872ce8b7, &rotatepitch, 90, 0.5);
        }
    }
    level notify(#"traps_activated", {#var_be3f58a:str_id});
    wait(30);
    level notify(#"traps_cooldown", {#var_be3f58a:str_id});
    n_cooldown = zm_traps::function_da13db45(30, self);
    foreach (e_trap in level.var_ba53c5c5) {
        if (e_trap.script_string === str_id) {
            e_trap.is_cooling = 1;
        }
    }
    wait(n_cooldown);
    level notify(#"traps_available", {#var_be3f58a:str_id});
    foreach (e_trap in level.var_ba53c5c5) {
        if (e_trap.script_string === str_id) {
            e_trap.is_cooling = undefined;
            array::thread_all(e_trap.var_3d6b88c4, &function_e714e3a8, "green");
            array::run_all(e_trap.var_872ce8b7, &rotatepitch, -90, 0.5);
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0xbc41a44c, Offset: 0x2030
// Size: 0xa4
function activate_trap(e_player) {
    if (!self flag::get(#"activated")) {
        self flag::set(#"activated");
        if (isdefined(e_player)) {
            self.activated_by_player = e_player;
        }
        self function_7d9e84f9();
        self thread function_21fd7c39();
        wait(30);
        self deactivate_trap();
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xf4ba6dc, Offset: 0x20e0
// Size: 0xa6
function deactivate_trap() {
    self function_5627d722();
    self thread function_7947b7ee();
    self flag::clear(#"activated");
    self flag::clear(#"friendly");
    self notify(#"deactivate");
    self notify(#"trap_deactivate");
    self notify(#"trap_done");
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0xc1ebcc06, Offset: 0x2190
// Size: 0x1dc
function function_7d9e84f9(str_color = "red") {
    if (isdefined(self.str_exploder)) {
        exploder::stop_exploder(self.str_exploder);
        self.str_exploder = undefined;
    }
    switch (self.script_string) {
    case #"firegate_entrance_hall":
        self.str_exploder = "fxexp_tf_" + str_color + "_mh";
        break;
    case #"firegate_cellar":
        self.str_exploder = "fxexp_tf_" + str_color + "_clr";
        break;
    case #"firegate_bedroom":
        self.str_exploder = "fxexp_tf_" + str_color + "_br";
        break;
    case #"firegate_library":
        self.str_exploder = "fxexp_tf_" + str_color + "_lb";
        break;
    case #"firegate_cemetery":
        self.str_exploder = "fxexp_tf_" + str_color + "_msm";
        break;
    case #"firegate_greenhouse":
        self.str_exploder = "fxexp_tf_" + str_color + "_gh";
        break;
    }
    exploder::exploder(self.str_exploder);
    self playsound(#"hash_370460eab1a33ee6");
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x38c4bc0a, Offset: 0x2378
// Size: 0x56
function function_5627d722() {
    if (isdefined(self.str_exploder)) {
        exploder::stop_exploder(self.str_exploder);
        self playsound(#"hash_5d8ec72f0838594e");
        self.str_exploder = undefined;
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0xe3cdd376, Offset: 0x23d8
// Size: 0x31c
function function_5ad19000(e_trap) {
    self endon(#"death");
    if (self.var_6f84b820 === #"popcorn") {
        return;
    } else if (self.var_9fde8624 === #"catalyst_plasma" && e_trap flag::get(#"friendly") == 0) {
        return;
    } else if (self.team === #"allies") {
        return;
    } else if (self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy" || self.var_6f84b820 === #"boss") {
        if (self.archetype === #"blight_father") {
            e_trap deactivate_trap();
        }
        if (e_trap flag::get(#"friendly") === 0) {
            if (!(isdefined(self.is_on_fire) && self.is_on_fire)) {
                self thread zombie_death::flame_death_fx();
            }
            return;
        }
        self dodamage(self.health * 0.1, e_trap.origin, undefined, e_trap, undefined, "MOD_BURNED", 0, undefined);
    } else {
        self thread zombie_death::flame_death_fx();
        if (isdefined(self.var_5475b4ad)) {
            self [[ self.var_5475b4ad ]](e_trap);
        } else {
            [[ level.var_db63b33b ]]->waitinqueue(self);
            level notify(#"trap_kill", {#e_trap:e_trap, #e_victim:self});
            if (isdefined(e_trap.activated_by_player) && isplayer(e_trap.activated_by_player)) {
                e_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
                e_trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
            }
            self dodamage(20000, e_trap.origin, undefined, e_trap, undefined, "MOD_BURNED", 0, undefined);
        }
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x1 linked
// Checksum 0xd5c6450, Offset: 0x2700
// Size: 0xa4
function function_26578bc6(t_damage) {
    if (!t_damage flag::get(#"friendly") && self getstance() === "stand" && !self issliding()) {
        self dodamage(50, t_damage.origin, undefined, t_damage, undefined, "MOD_BURNED", 0, undefined);
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xdd602ce0, Offset: 0x27b0
// Size: 0x20c
function function_21fd7c39() {
    self endon(#"trap_done");
    self.bulletclip solid();
    self.bulletclip.health = 100000;
    self.bulletclip setcandamage(1);
    b_friendly = 0;
    while (!b_friendly) {
        s_notify = undefined;
        s_notify = self.bulletclip waittill(#"damage");
        if (s_notify.weapon === level.var_74cf08b1 || s_notify.weapon === level.var_4b14202f) {
            b_friendly = 1;
        } else {
            self.bulletclip.health = 100000;
        }
    }
    self flag::set(#"friendly");
    if (s_notify.weapon === level.var_4b14202f) {
        self thread function_7d9e84f9("blue");
        self thread blue_fire();
        e_player = s_notify.attacker;
        if (isalive(e_player) && !(isdefined(e_player.var_a46d8eee) && e_player.var_a46d8eee)) {
            e_player thread function_1eeda1e5();
        }
    } else if (s_notify.weapon === level.var_74cf08b1) {
        self thread function_7d9e84f9("green");
    }
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x5 linked
// Checksum 0xe79e73e9, Offset: 0x29c8
// Size: 0xa4
function private function_1eeda1e5() {
    self endon(#"disconnect");
    self.var_a46d8eee = 1;
    n_character_index = zm_characters::function_d35e4c92();
    str_vo = "vox_generic_responses_positive_plr_" + n_character_index + "_" + randomint(9);
    self thread zm_vo::vo_say(str_vo, 0, 1, 9999);
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0x6d8ff046, Offset: 0x2a78
// Size: 0x34
function function_7947b7ee() {
    self.bulletclip setcandamage(0);
    self.bulletclip notsolid();
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 0, eflags: 0x1 linked
// Checksum 0xfd696e93, Offset: 0x2ab8
// Size: 0x4e
function blue_fire() {
    self thread mansion_triad::function_40e665ab();
    self flag::wait_till_clear(#"friendly");
    self notify(#"extinguish");
}

// Namespace namespace_a35b43eb/zm_mansion_traps_firegates
// Params 1, eflags: 0x5 linked
// Checksum 0xc8a53b0e, Offset: 0x2b10
// Size: 0x1e2
function private function_e714e3a8(str_state = "off") {
    switch (str_state) {
    case #"off":
        self hidepart("light_green");
        self hidepart("light_red");
        self showpart("light_off");
        break;
    case #"green":
        self clientfield::set("" + #"trap_light", 1);
        self hidepart("light_off");
        self hidepart("light_red");
        self showpart("light_green");
        break;
    case #"red":
        self clientfield::set("" + #"trap_light", 2);
        self hidepart("light_green");
        self hidepart("light_off");
        self showpart("light_red");
        break;
    }
}

