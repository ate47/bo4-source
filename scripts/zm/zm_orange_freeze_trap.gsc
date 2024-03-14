// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_orange_util.gsc;
#using scripts\zm\zm_hms_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_orange_freeze_trap;

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0xd256e43d, Offset: 0x2b8
// Size: 0x94
function init() {
    clientfield::register("actor", "freeze_trap_death_fx", 24000, 1, "int");
    clientfield::register("scriptmover", "freeze_trap_fx", 24000, 1, "int");
    clientfield::register("toplayer", "player_freeze_trap_post_fx", 24000, 1, "int");
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0xb9bdaaf4, Offset: 0x358
// Size: 0x1c
function main() {
    level thread function_e62e184a();
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0x91b9873d, Offset: 0x380
// Size: 0x258
function function_e62e184a() {
    level.s_freeze_trap = struct::get("s_freeze_trap", "targetname");
    s_trap = level.s_freeze_trap;
    s_trap._trap_type = "freeze";
    s_trap.e_volume = getent(s_trap.target, "targetname");
    s_trap.e_volume._trap_type = "freeze";
    s_trap.var_28ea1870 = struct::get_array(s_trap.target3, "targetname");
    s_trap.a_s_buttons = struct::get_array(s_trap.target2, "targetname");
    s_trap.a_e_lights = getentarray(s_trap.target4, "targetname");
    s_trap.a_s_panels = struct::get_array(s_trap.target5, "targetname");
    s_trap.var_6b64b967 = 0;
    s_trap.var_41ee2ddc = 1;
    level flag::wait_till("all_players_spawned");
    foreach (s_button in s_trap.a_s_buttons) {
        s_button.s_trap = s_trap;
        s_button zm_unitrigger::create(&function_67b12ae8, 64);
        s_button thread function_c2e32275();
        s_button thread function_270aecf7();
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0xa0868663, Offset: 0x5e0
// Size: 0x298
function function_c2e32275() {
    level endon(#"end_game");
    while (true) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"trigger_activated");
        e_who = s_waitresult.e_who;
        if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
            continue;
        }
        if (isdefined(self.wait_flag) && !level flag::get(self.wait_flag)) {
            continue;
        }
        if (isdefined(self.power_flag) && !level flag::get(self.power_flag)) {
            continue;
        }
        if (level.s_freeze_trap.var_6b64b967 === 1) {
            continue;
        }
        if (zm_utility::is_player_valid(e_who) && level.s_freeze_trap.var_41ee2ddc === 1) {
            if (level flag::get(#"half_price_traps")) {
                b_purchased = self.s_trap.a_e_lights[0] zm_traps::trap_purchase(e_who, int(500));
            } else {
                b_purchased = self.s_trap.a_e_lights[0] zm_traps::trap_purchase(e_who, 1000);
            }
            if (!b_purchased) {
                continue;
            }
            self notify(#"hash_35807fa157a46934");
            self.e_activator = e_who;
            level.s_freeze_trap.activated_by_player = e_who;
            if (!(isdefined(level.var_3c9cfd6f) && level.var_3c9cfd6f) && zm_audio::can_speak()) {
                e_who thread zm_audio::create_and_play_dialog(#"trap_ice", #"activate");
            }
        }
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0x25c0f070, Offset: 0x880
// Size: 0x2b0
function function_270aecf7() {
    level endon(#"end_game");
    function_91ecec97(level.s_freeze_trap.a_e_lights, "p8_zm_off_trap_switch_light");
    if (isdefined(self.wait_flag)) {
        level flag::wait_till(self.wait_flag);
    }
    if (isdefined(self.power_flag)) {
        level flag::wait_till(self.power_flag);
    }
    function_91ecec97(level.s_freeze_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
    open_panels(level.s_freeze_trap.a_s_panels);
    while (true) {
        self waittill(#"hash_35807fa157a46934");
        function_91ecec97(level.s_freeze_trap.a_e_lights, "p8_zm_off_trap_switch_light_red_on");
        level.s_freeze_trap.var_6b64b967 = 1;
        e_who = self.e_activator;
        if (isdefined(e_who)) {
            zm_utility::play_sound_at_pos("purchase", e_who.origin);
            level notify(#"trap_activated", {#trap:self, #trap_activator:e_who});
            level.s_freeze_trap.e_volume.activated_by_player = e_who;
        }
        level.s_freeze_trap function_4bbed101(e_who);
        level.s_freeze_trap.var_6b64b967 = 0;
        level.s_freeze_trap.var_41ee2ddc = 0;
        n_cooldown = zm_traps::function_da13db45(60, e_who);
        wait(n_cooldown);
        function_91ecec97(level.s_freeze_trap.a_e_lights, "p8_zm_off_trap_switch_light_green_on");
        level.s_freeze_trap.var_41ee2ddc = 1;
        playsoundatposition(#"zmb_trap_ready", self.origin);
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0x999325b2, Offset: 0xb38
// Size: 0x374
function function_4bbed101(e_player) {
    level endon(#"end_game");
    n_total_time = 0;
    self thread freeze_trap_fx(1);
    sndent = spawn("script_origin", self.origin);
    sndent playloopsound(#"hash_1df9464f442b0b6d", 1);
    if (isdefined(level.s_soapstone) && isdefined(level.s_soapstone.s_placement)) {
        level.s_soapstone.var_e15f0d15 = 1;
        if (!level.s_soapstone.is_charged || level.s_soapstone.is_hot) {
            level thread zm_orange_util::function_fd24e47f("vox_generic_responses_positive", -1, 1, 0);
        }
    }
    while (n_total_time < 40) {
        self thread function_3d9b6ed6(e_player);
        self thread function_c38e2c52();
        wait(0.1);
        n_total_time = n_total_time + 0.1;
    }
    if (isdefined(level.s_soapstone) && isdefined(level.s_soapstone.s_placement) && level.s_soapstone.var_e15f0d15 === 1) {
        if (!level.s_soapstone.is_charged || level.s_soapstone.is_hot) {
            level thread zm_orange_util::function_fd24e47f("vox_soap_stones_freeze", -1, 1, 0);
        }
        level.s_soapstone.is_charged = 1;
        level.s_soapstone.is_hot = 0;
        level.s_soapstone.s_placement.e_stone clientfield::set("soapstone_start_fx", 1);
        level.s_soapstone.s_placement.e_stone setmodel("p8_zm_ora_soapstone_01_cold");
        if (level.s_soapstone.var_b6e5b65f == 2) {
            level.s_soapstone.s_placement.var_28f1732d clientfield::set("soapstone_start_fx", 1);
            level.s_soapstone.s_placement.var_28f1732d setmodel("p8_zm_ora_soapstone_01_cold");
        }
    }
    sndent stoploopsound(1);
    sndent delete();
    self thread freeze_trap_fx(0);
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0x75ef01ad, Offset: 0xeb8
// Size: 0x100
function function_3d9b6ed6(e_activator) {
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && ai istouching(self.e_volume) && (!isdefined(ai.marked_for_death) || !ai.marked_for_death)) {
            ai thread function_92f341d0(e_activator, self.e_volume);
        }
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 2, eflags: 0x1 linked
// Checksum 0xbc5f51a1, Offset: 0xfc0
// Size: 0x164
function function_92f341d0(e_activator, e_volume) {
    self endon(#"death");
    self.marked_for_death = 1;
    wait(randomfloatrange(0.25, 0.5));
    if (isalive(self)) {
        self.water_damage = 1;
        if (isplayer(level.s_freeze_trap.activated_by_player)) {
            level.s_freeze_trap.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            level.s_freeze_trap.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        }
        level notify(#"trap_kill", {#trap:e_volume, #victim:self});
        self dodamage(self.health + 1000, e_volume.origin, e_volume);
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0xfef5a0ad, Offset: 0x1130
// Size: 0x4c
function freeze_trap_fx(var_9d9f02b4) {
    if (var_9d9f02b4) {
        exploder::exploder("fxexp_frost_trap");
        return;
    }
    exploder::stop_exploder("fxexp_frost_trap");
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x0
// Checksum 0x11fe6253, Offset: 0x1188
// Size: 0x34
function function_cedd130e() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("freeze_trap_death_fx", 0);
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0xfcf2d2ff, Offset: 0x11c8
// Size: 0xa0
function function_c38e2c52() {
    foreach (e_player in getplayers()) {
        if (e_player istouching(self.e_volume)) {
            e_player thread function_67a7a129(self);
        }
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0x3d84e415, Offset: 0x1270
// Size: 0x13c
function function_67a7a129(s_trap) {
    self endon(#"death", #"disconnect");
    if (!isdefined(self.var_88eddb97) || !self.var_88eddb97) {
        self.var_88eddb97 = 1;
        e_volume = s_trap.e_volume;
        self thread function_be814134();
        if (e_volume zm_traps::function_3f401e8d(self)) {
            return;
        }
        if (!self laststand::player_is_in_laststand()) {
            if (zm_utility::is_standard()) {
                self dodamage(50, self.origin, undefined, e_volume);
            } else {
                self dodamage(150, self.origin, undefined, e_volume);
            }
            self zm_audio::playerexert("cough");
        }
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 0, eflags: 0x1 linked
// Checksum 0x2e8876a9, Offset: 0x13b8
// Size: 0xc6
function function_be814134() {
    self endon(#"bled_out", #"disconnect");
    if (self clientfield::get_to_player("player_freeze_trap_post_fx") === 1) {
        return;
    }
    self clientfield::set_to_player("player_freeze_trap_post_fx", 1);
    self playsoundtoplayer(#"hash_35baaf86bb47b64d", self);
    wait(0.25);
    self clientfield::set_to_player("player_freeze_trap_post_fx", 0);
    wait(1);
    self.var_88eddb97 = 0;
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x0
// Checksum 0x76755e46, Offset: 0x1488
// Size: 0x74
function function_e32bd356(trap) {
    playsoundatposition(#"hash_4b93c2d674807e60", self.origin);
    self waittill(#"available");
    playsoundatposition(#"zmb_acid_trap_available", self.origin);
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0xbf0d030a, Offset: 0x1508
// Size: 0x3ca
function function_67b12ae8(e_player) {
    s_button = self.stub.related_parent;
    if (e_player zm_utility::is_drinking()) {
        self sethintstring("");
        return 0;
    }
    if (s_button.s_trap.var_6b64b967 === 1) {
        self sethintstring(#"zombie/trap_active");
        return 1;
    }
    if (isdefined(s_button.wait_flag) && !level flag::get(s_button.wait_flag)) {
        self sethintstring(#"zombie/trap_locked");
        return 1;
    }
    if (isdefined(level.var_4f7df1ac) && level.var_4f7df1ac) {
        self sethintstring(#"zombie/trap_locked");
        return 1;
    }
    if (isdefined(s_button.power_flag) && !level flag::get(s_button.power_flag)) {
        self sethintstring(#"zombie/need_power");
        return 1;
    }
    if (s_button.s_trap.var_41ee2ddc === 0) {
        self sethintstring(#"zombie/trap_cooldown");
        return 1;
    }
    if (util::get_game_type() == "zstandard") {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_61d85c966dd9e83f");
            return 1;
        } else {
            self sethintstring(#"hash_24a438482954901");
            return 1;
        }
        return;
    }
    if (function_8b1a219a()) {
        if (level flag::get(#"half_price_traps")) {
            self sethintstring(#"hash_6e8ef1b690e98e51", int(500));
            return 1;
        } else {
            self sethintstring(#"hash_6e8ef1b690e98e51", 1000);
            return 1;
        }
        return;
    }
    if (level flag::get(#"half_price_traps")) {
        self sethintstring(#"hash_23c1c09e94181fdb", int(500));
        return 1;
    }
    self sethintstring(#"hash_23c1c09e94181fdb", 1000);
    return 1;
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 1, eflags: 0x1 linked
// Checksum 0x17af6245, Offset: 0x18e0
// Size: 0x88
function open_panels(a_s_panels) {
    foreach (panel in a_s_panels) {
        panel thread scene::play("open");
    }
}

// Namespace zm_orange_freeze_trap/zm_orange_freeze_trap
// Params 2, eflags: 0x1 linked
// Checksum 0x3dc9d612, Offset: 0x1970
// Size: 0x88
function function_91ecec97(a_e_lights, str_model) {
    foreach (light in a_e_lights) {
        light setmodel(str_model);
    }
}

