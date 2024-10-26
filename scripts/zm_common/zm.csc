#using scripts\zm\weapons\zm_weap_proximity_grenade.csc;
#using scripts\zm\weapons\zm_weap_mini_turret.csc;
#using scripts\zm\weapons\zm_weap_homunculus.csc;
#using scripts\zm_common\aats\zm_aat_plasmatic_burst.csc;
#using scripts\zm_common\aats\zm_aat_kill_o_watt.csc;
#using scripts\zm_common\aats\zm_aat_frostbite.csc;
#using scripts\zm_common\aats\zm_aat_brain_decay.csc;
#using script_7520bf82a814057c;
#using scripts\zm_common\zm_ui_inventory.csc;
#using scripts\zm_common\gametypes\globallogic.csc;
#using scripts\zm_common\zm_zdraw.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_wallbuy.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_powerups.csc;
#using scripts\zm_common\zm_vapor_random.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_laststand.csc;
#using scripts\zm_common\zm_hud.csc;
#using scripts\zm_common\zm_hero_weapon.csc;
#using scripts\zm_common\zm_ffotd.csc;
#using scripts\zm_common\zm_equipment.csc;
#using scripts\zm_common\zm_demo.csc;
#using scripts\zm_common\zm_crafting.csc;
#using scripts\zm_common\zm_blockers.csc;
#using scripts\zm_common\zm_bgb.csc;
#using scripts\zm_common\zm_audio.csc;
#using scripts\zm_common\load.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\status_effects\status_effects.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm;

// Namespace zm/zm
// Params 0, eflags: 0x2
// Checksum 0x59e3069b, Offset: 0x570
// Size: 0x2cc
function autoexec ignore_systems() {
    system::ignore(#"gadget_clone");
    system::ignore(#"gadget_heat_wave");
    system::ignore(#"gadget_resurrect");
    system::ignore(#"gadget_shock_field");
    system::ignore(#"gadget_camo_render");
    system::ignore(#"gadget_overdrive");
    system::ignore(#"gadget_security_breach");
    system::ignore(#"gadget_cleanse");
    system::ignore(#"gadget_health_boost");
    system::ignore(#"gadget_combat_efficiency");
    system::ignore(#"gadget_other");
    system::ignore(#"gadget_vision_pulse");
    system::ignore(#"gadget_camo");
    system::ignore(#"gadget_speed_burst");
    system::ignore(#"gadget_sprint_boost");
    system::ignore(#"gadget_armor");
    system::ignore(#"gadget_cleanse");
    system::ignore(#"spike_charge_siegebot");
    system::ignore(#"gadget_health_regen");
    if (getdvarint(#"splitscreen_playercount", 0) > 2) {
        system::ignore(#"footsteps");
        system::ignore(#"ambient");
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2
// Checksum 0x5b9393d2, Offset: 0x848
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm", &__init__, undefined, "renderoverridebundle");
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x9d4ff5a0, Offset: 0x890
// Size: 0xf4
function __init__() {
    if (!isdefined(level.zombie_vars)) {
        level.zombie_vars = [];
    }
    level.scr_zm_ui_gametype = util::get_game_type();
    level.scr_zm_ui_gametype_group = "";
    level.scr_zm_map_start_location = "";
    callback::on_laststand(&on_player_laststand);
    renderoverridebundle::function_f72f089c(#"hash_60913f86a5a5a3f1", "rob_sonar_set_friendly_zm", &function_b9c917cc);
    renderoverridebundle::function_f72f089c(#"hash_6844a09875672719", "rob_sonar_set_friendly_zm_ls", &function_a1ab192);
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0xa63e2ec1, Offset: 0x990
// Size: 0x474
function init() {
    println("<dev string:x38>");
    level thread zm_ffotd::main_start();
    level.onlinegame = sessionmodeisonlinegame();
    level.swimmingfeature = 0;
    level.gamedifficulty = getgametypesetting(#"zmdifficulty");
    level.enable_magic = getgametypesetting(#"magic");
    level.headshots_only = getgametypesetting(#"headshotsonly");
    level.disable_equipment_team_object = 1;
    level.clientvoicesetup = &zm_audio::clientvoicesetup;
    level.playerfalldamagesound = &zm_audio::playerfalldamagesound;
    zm_game_over::register("game_over");
    println("<dev string:x6a>");
    init_clientfields();
    zm_perks::init();
    zm_powerups::init();
    init_blocker_fx();
    init_riser_fx();
    init_zombie_explode_fx();
    level.var_2f78f66c = 1;
    level.gibresettime = 0.5;
    level.gibmaxcount = 3;
    level.gibtimer = 0;
    level.gibcount = 0;
    level._gibeventcbfunc = &on_gib_event;
    level thread resetgibcounter();
    level thread zpo_listener();
    level thread zpoff_listener();
    level._box_indicator_no_lights = -1;
    level._box_indicator_flash_lights_moving = 99;
    level._box_indicator = level._box_indicator_no_lights;
    util::register_system(#"box_indicator", &box_monitor);
    level._zombie_gib_piece_index_all = 0;
    level._zombie_gib_piece_index_right_arm = 1;
    level._zombie_gib_piece_index_left_arm = 2;
    level._zombie_gib_piece_index_right_leg = 3;
    level._zombie_gib_piece_index_left_leg = 4;
    level._zombie_gib_piece_index_head = 5;
    level._zombie_gib_piece_index_guts = 6;
    level._zombie_gib_piece_index_hat = 7;
    setdvar(#"cg_healthperbar", 50);
    setdvar(#"hash_52a4767bd6da84f1", 0);
    callback::add_callback(#"on_localclient_connect", &basic_player_connect);
    callback::on_spawned(&function_92f0c63);
    callback::on_spawned(&player_umbrahotfixes);
    scene::function_2e58158b(&function_bbea98ae);
    level.update_aat_hud = &update_aat_hud;
    if (isdefined(level.setupcustomcharacterexerts)) {
        [[ level.setupcustomcharacterexerts ]]();
    }
    level thread zm_ffotd::main_end();
    level thread function_7e3a43c3();
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0xc918b312, Offset: 0xe10
// Size: 0x15e
function function_7e3a43c3() {
    level.var_bcb2da96 = 0;
    util::waitforallclients();
    while (true) {
        for (localclientnum = 0; localclientnum < level.localplayers.size; localclientnum++) {
            player = function_5c10bd79(localclientnum);
            if (isdefined(player)) {
                if (!isdefined(player.last_state)) {
                    player.last_state = 0;
                }
                player.new_state = util::function_cd6c95db(localclientnum);
                if (player.new_state != player.last_state) {
                    if (player.new_state == 1) {
                        player postfx::playpostfxbundle(#"hash_6f0522f3d84f18df");
                    } else {
                        player postfx::stoppostfxbundle(#"hash_6f0522f3d84f18df");
                    }
                }
                player.last_state = player.new_state;
            }
        }
        waitframe(1);
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0x7e591e10, Offset: 0xf78
// Size: 0x8c
function delay_for_clients_then_execute(func) {
    wait 0.1;
    players = getlocalplayers();
    for (x = 0; x < players.size; x++) {
        while (!clienthassnapshot(x)) {
            waitframe(1);
        }
    }
    wait 0.1;
    level thread [[ func ]]();
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x33b11252, Offset: 0x1010
// Size: 0x7c
function player_umbrahotfixes(localclientnum) {
    if (!self function_21c0fa55() || !isdefined(self getlocalclientnumber()) || localclientnum != self getlocalclientnumber()) {
        return;
    }
    self thread zm_utility::umbra_fix_logic(localclientnum);
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xa9758051, Offset: 0x1098
// Size: 0x3e
function basic_player_connect(localclientnum) {
    if (!isdefined(level._laststand)) {
        level._laststand = [];
    }
    level._laststand[localclientnum] = 0;
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xb665c5, Offset: 0x10e0
// Size: 0x64
function force_update_player_clientfields(localclientnum) {
    self endon(#"death");
    while (!clienthassnapshot(localclientnum)) {
        wait 0.25;
    }
    wait 0.25;
    self processclientfieldsasifnew();
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x1150
// Size: 0x4
function init_blocker_fx() {
    
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0xb4133071, Offset: 0x1160
// Size: 0x10a
function init_riser_fx() {
    if (isdefined(level.var_7f632569) && level.var_7f632569) {
    }
    level._effect[#"rise_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"rise_dust"] = #"zombie/fx_spawn_dirt_body_dustfalling_zmb";
    if (isdefined(level.riser_type) && level.riser_type == "snow") {
        level._effect[#"rise_billow_snow"] = #"hash_793798659a4b9560";
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x91964cf3, Offset: 0x1278
// Size: 0x59c
function init_clientfields() {
    println("<dev string:x8f>");
    clientfield::register("actor", "zombie_riser_fx", 1, 1, "int", &handle_zombie_risers, 1, 1);
    if (isdefined(level.use_water_risers) && level.use_water_risers) {
        clientfield::register("actor", "zombie_riser_fx_water", 1, 1, "int", &handle_zombie_risers_water, 1, 1);
    }
    if (isdefined(level.use_foliage_risers) && level.use_foliage_risers) {
        clientfield::register("actor", "zombie_riser_fx_foliage", 1, 1, "int", &handle_zombie_risers_foliage, 1, 1);
    }
    if (isdefined(level.use_low_gravity_risers) && level.use_low_gravity_risers) {
        clientfield::register("actor", "zombie_riser_fx_lowg", 1, 1, "int", &handle_zombie_risers_lowg, 1, 1);
    }
    clientfield::register("actor", "zombie_ragdoll_explode", 1, 1, "int", &zombie_ragdoll_explode_cb, 0, 1);
    clientfield::register("actor", "zombie_gut_explosion", 1, 1, "int", &zombie_gut_explosion_cb, 0, 1);
    clientfield::register("actor", "zombie_keyline_render", 1, 1, "int", &zombie_zombie_keyline_render_clientfield_cb, 0, 1);
    bits = 4;
    power = struct::get_array("elec_switch_fx", "script_noteworthy");
    if (isdefined(power)) {
        bits = getminbitcountfornum(power.size + 1);
    }
    clientfield::register("world", "zombie_power_on", 1, bits, "int", &zombie_power_clientfield_on, 1, 1);
    clientfield::register("world", "zombie_power_off", 1, bits, "int", &zombie_power_clientfield_off, 1, 1);
    clientfield::register("world", "zesn", 1, 1, "int", &zesn, 1, 1);
    clientfield::register("world", "round_complete_time", 1, 20, "int", &round_complete_time, 0, 1);
    clientfield::register("world", "round_complete_num", 1, 8, "int", &round_complete_num, 0, 1);
    clientfield::register("world", "game_end_time", 1, 20, "int", &game_end_time, 0, 1);
    clientfield::register("world", "quest_complete_time", 1, 20, "int", &quest_complete_time, 0, 1);
    clientfield::register("world", "game_start_time", 1, 20, "int", &game_start_time, 0, 1);
    clientfield::register("scriptmover", "rob_zm_prop_fade", 1, 1, "int", &rob_zm_prop_fade, 0, 0);
    clientfield::register("clientuimodel", "ZMInvTalisman.show", 1, 1, "int", undefined, 0, 0);
}

// Namespace zm/zm
// Params 3, eflags: 0x1 linked
// Checksum 0x55fa8a4e, Offset: 0x1820
// Size: 0x48
function box_monitor(clientnum, state, oldstate) {
    if (isdefined(level._custom_box_monitor)) {
        [[ level._custom_box_monitor ]](clientnum, state, oldstate);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0xdeebd28a, Offset: 0x1870
// Size: 0x84
function zpo_listener() {
    while (true) {
        int = undefined;
        level waittill(#"zpo", int);
        if (isdefined(int)) {
            level notify(#"power_on", {#is_on:int});
            continue;
        }
        level notify(#"power_on");
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x919a454a, Offset: 0x1900
// Size: 0x6c
function zpoff_listener() {
    while (true) {
        int = undefined;
        level waittill(#"zpoff", int);
        if (isdefined(int)) {
            level notify(#"power_off", int);
            continue;
        }
        level notify(#"power_off");
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xa78de5a8, Offset: 0x1978
// Size: 0x58
function zesn(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level notify(#"zesn");
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x49f2ef97, Offset: 0x19d8
// Size: 0x58
function zombie_power_clientfield_on(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level notify(#"zpo", newval);
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x30562755, Offset: 0x1a38
// Size: 0x58
function zombie_power_clientfield_off(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level notify(#"zpoff", newval);
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x54b362f, Offset: 0x1a98
// Size: 0x8c
function round_complete_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    model = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.time.round_complete_time");
    setuimodelvalue(model, newval);
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x983107e7, Offset: 0x1b30
// Size: 0x8c
function round_complete_num(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    model = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.time.round_complete_num");
    setuimodelvalue(model, newval);
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x31780e1d, Offset: 0x1bc8
// Size: 0xb4
function game_end_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!binitialsnap) {
        level notify(#"end_game");
        level.b_game_ended = 1;
    }
    model = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.time.game_end_time");
    setuimodelvalue(model, newval);
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xea134b0b, Offset: 0x1c88
// Size: 0x8c
function quest_complete_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    model = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.time.quest_complete_time");
    setuimodelvalue(model, newval);
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x84ad28bd, Offset: 0x1d20
// Size: 0x8c
function game_start_time(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    model = createuimodel(getuimodelforcontroller(localclientnum), "hudItems.time.game_start_time");
    setuimodelvalue(model, newval);
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xccb64fd9, Offset: 0x1db8
// Size: 0xee
function rob_zm_prop_fade(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self playrenderoverridebundle(#"rob_zm_prop_fade");
        if (!isdefined(self.sndlooper)) {
            self.sndlooper = self playloopsound(#"hash_66df9cab2c64f968");
        }
        return;
    }
    self stoprenderoverridebundle(#"rob_zm_prop_fade");
    if (isdefined(self.sndlooper)) {
        self stoploopsound(self.sndlooper);
        self.sndlooper = undefined;
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xda72bc22, Offset: 0x1eb0
// Size: 0x112
function createzombieeyesinternal(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self._eyearray)) {
        self._eyearray = [];
    }
    if (!isdefined(self._eyearray[localclientnum])) {
        linktag = "j_eyeball_le";
        effect = level._effect[#"eye_glow"];
        if (isdefined(level._override_eye_fx)) {
            effect = level._override_eye_fx;
        }
        if (isdefined(self._eyeglow_fx_override)) {
            effect = self._eyeglow_fx_override;
        }
        if (isdefined(self._eyeglow_tag_override)) {
            linktag = self._eyeglow_tag_override;
        }
        self._eyearray[localclientnum] = util::playfxontag(localclientnum, effect, self, linktag);
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x16dcf43c, Offset: 0x1fd0
// Size: 0x24
function createzombieeyes(localclientnum) {
    self thread createzombieeyesinternal(localclientnum);
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x43f32292, Offset: 0x2000
// Size: 0x64
function deletezombieeyes(localclientnum) {
    if (isdefined(self._eyearray)) {
        if (isdefined(self._eyearray[localclientnum])) {
            deletefx(localclientnum, self._eyearray[localclientnum], 1);
            self._eyearray[localclientnum] = undefined;
        }
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xbcfdc2c, Offset: 0x2070
// Size: 0xdc
function zombie_zombie_keyline_render_clientfield_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(newval)) {
        return;
    }
    if (isdefined(level.debug_keyline_zombies) && level.debug_keyline_zombies) {
        if (newval) {
            self duplicate_render::set_dr_flag("keyline_active", 1);
            self duplicate_render::update_dr_filters(localclientnum);
            return;
        }
        self duplicate_render::set_dr_flag("keyline_active", 0);
        self duplicate_render::update_dr_filters(localclientnum);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x529344cc, Offset: 0x2158
// Size: 0x24
function get_eyeball_on_luminance() {
    if (isdefined(level.eyeball_on_luminance_override)) {
        return level.eyeball_on_luminance_override;
    }
    return 1;
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x800cee61, Offset: 0x2188
// Size: 0x22
function get_eyeball_off_luminance() {
    if (isdefined(level.eyeball_off_luminance_override)) {
        return level.eyeball_off_luminance_override;
    }
    return 0;
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x8b9865e6, Offset: 0x21b8
// Size: 0x4a
function get_eyeball_color() {
    val = 0;
    if (isdefined(level.zombie_eyeball_color_override)) {
        val = level.zombie_eyeball_color_override;
    }
    if (isdefined(self.zombie_eyeball_color_override)) {
        val = self.zombie_eyeball_color_override;
    }
    return val;
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x5c7a7dc2, Offset: 0x2210
// Size: 0x5c
function zombie_ragdoll_explode_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self zombie_wait_explode(localclientnum);
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x868ce780, Offset: 0x2278
// Size: 0xc4
function zombie_gut_explosion_cb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(level._effect[#"zombie_guts_explosion"])) {
            org = self gettagorigin("J_SpineLower");
            if (isdefined(org)) {
                playfx(localclientnum, level._effect[#"zombie_guts_explosion"], org);
            }
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x42974e41, Offset: 0x2348
// Size: 0x32
function init_zombie_explode_fx() {
    level._effect[#"zombie_guts_explosion"] = #"zombie/fx_blood_torso_explo_lg_zmb";
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x691200a3, Offset: 0x2388
// Size: 0x114
function zombie_wait_explode(localclientnum) {
    where = self gettagorigin("J_SpineLower");
    if (!isdefined(where)) {
        where = self.origin;
    }
    start = gettime();
    while (gettime() - start < 2000) {
        if (isdefined(self)) {
            where = self gettagorigin("J_SpineLower");
            if (!isdefined(where)) {
                where = self.origin;
            }
        }
        waitframe(1);
    }
    if (isdefined(level._effect[#"zombie_guts_explosion"]) && util::is_mature()) {
        playfx(localclientnum, level._effect[#"zombie_guts_explosion"], where);
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x96ca04c8, Offset: 0x24a8
// Size: 0x3e
function mark_piece_gibbed(piece_index) {
    if (!isdefined(self.gibbed_pieces)) {
        self.gibbed_pieces = [];
    }
    self.gibbed_pieces[self.gibbed_pieces.size] = piece_index;
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xdd04714b, Offset: 0x24f0
// Size: 0x64
function has_gibbed_piece(piece_index) {
    if (!isdefined(self.gibbed_pieces)) {
        return false;
    }
    for (i = 0; i < self.gibbed_pieces.size; i++) {
        if (self.gibbed_pieces[i] == piece_index) {
            return true;
        }
    }
    return false;
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x28098ab7, Offset: 0x2560
// Size: 0x1de
function do_headshot_gib_fx() {
    fxtag = "j_neck";
    fxorigin = self gettagorigin(fxtag);
    upvec = anglestoup(self gettagangles(fxtag));
    forwardvec = anglestoforward(self gettagangles(fxtag));
    players = level.localplayers;
    for (i = 0; i < players.size; i++) {
        playfx(i, level._effect[#"headshot"], fxorigin, forwardvec, upvec);
        playfx(i, level._effect[#"headshot_nochunks"], fxorigin, forwardvec, upvec);
    }
    playsound(0, #"zmb_zombie_head_gib", fxorigin);
    wait 0.3;
    if (isdefined(self)) {
        players = level.localplayers;
        for (i = 0; i < players.size; i++) {
            util::playfxontag(i, level._effect[#"bloodspurt"], self, fxtag);
        }
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xe68ac062, Offset: 0x2748
// Size: 0xb4
function do_gib_fx(tag) {
    players = level.localplayers;
    for (i = 0; i < players.size; i++) {
        util::playfxontag(i, level._effect[#"animscript_gib_fx"], self, tag);
    }
    playsound(0, #"zmb_death_gibs", self gettagorigin(tag));
}

// Namespace zm/zm
// Params 2, eflags: 0x1 linked
// Checksum 0xd6342f77, Offset: 0x2808
// Size: 0x214
function do_gib(model, tag) {
    start_pos = self gettagorigin(tag);
    start_angles = self gettagangles(tag);
    wait 0.016;
    end_pos = undefined;
    angles = undefined;
    if (!isdefined(self)) {
        end_pos = start_pos + anglestoforward(start_angles) * 10;
        angles = start_angles;
    } else {
        end_pos = self gettagorigin(tag);
        angles = self gettagangles(tag);
    }
    if (isdefined(self._gib_vel)) {
        forward = self._gib_vel;
        self._gib_vel = undefined;
    } else {
        forward = vectornormalize(end_pos - start_pos);
        forward *= randomfloatrange(0.6, 1);
        forward += (0, 0, randomfloatrange(0.4, 0.7));
    }
    createdynentandlaunch(0, model, end_pos, angles, start_pos, forward, level._effect[#"animscript_gibtrail_fx"], 1);
    if (isdefined(self)) {
        self do_gib_fx(tag);
        return;
    }
    playsound(0, #"zmb_death_gibs", end_pos);
}

// Namespace zm/zm
// Params 2, eflags: 0x1 linked
// Checksum 0x4d54fd4e, Offset: 0x2a28
// Size: 0xbc
function do_hat_gib(model, tag) {
    start_pos = self gettagorigin(tag);
    start_angles = self gettagangles(tag);
    up_angles = (0, 0, 1);
    force = (0, 0, randomfloatrange(1.4, 1.7));
    createdynentandlaunch(0, model, start_pos, up_angles, start_pos, force);
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0xbe39a68a, Offset: 0x2af0
// Size: 0x24
function check_should_gib() {
    if (level.gibcount <= level.gibmaxcount) {
        return true;
    }
    return false;
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x89a018ec, Offset: 0x2b20
// Size: 0x4a
function resetgibcounter() {
    self endon(#"disconnect");
    while (true) {
        wait level.gibresettime;
        level.gibtimer = 0;
        level.gibcount = 0;
    }
}

// Namespace zm/zm
// Params 3, eflags: 0x1 linked
// Checksum 0xff8252c2, Offset: 0x2b78
// Size: 0x74a
function on_gib_event(localclientnum, type, locations) {
    if (localclientnum != 0) {
        return;
    }
    if (!util::is_mature()) {
        return;
    }
    if (!isdefined(self._gib_def)) {
        return;
    }
    if (isdefined(level._gib_overload_func)) {
        if (self [[ level._gib_overload_func ]](type, locations)) {
            return;
        }
    }
    if (!check_should_gib()) {
        return;
    }
    level.gibcount++;
    for (i = 0; i < locations.size; i++) {
        if (isdefined(self.gibbed) && level._zombie_gib_piece_index_head != locations[i]) {
            continue;
        }
        switch (locations[i]) {
        case 0:
            if (isdefined(self._gib_def.gibspawn1) && isdefined(self._gib_def.gibspawntag1)) {
                self thread do_gib(self._gib_def.gibspawn1, self._gib_def.gibspawntag1);
            }
            if (isdefined(self._gib_def.gibspawn2) && isdefined(self._gib_def.gibspawntag2)) {
                self thread do_gib(self._gib_def.gibspawn2, self._gib_def.gibspawntag2);
            }
            if (isdefined(self._gib_def.gibspawn3) && isdefined(self._gib_def.gibspawntag3)) {
                self thread do_gib(self._gib_def.gibspawn3, self._gib_def.gibspawntag3);
            }
            if (isdefined(self._gib_def.gibspawn4) && isdefined(self._gib_def.gibspawntag4)) {
                self thread do_gib(self._gib_def.gibspawn4, self._gib_def.gibspawntag4);
            }
            if (isdefined(self._gib_def.gibspawn5) && isdefined(self._gib_def.gibspawntag5)) {
                self thread do_hat_gib(self._gib_def.gibspawn5, self._gib_def.gibspawntag5);
            }
            self thread do_headshot_gib_fx();
            self thread do_gib_fx("J_SpineLower");
            mark_piece_gibbed(level._zombie_gib_piece_index_right_arm);
            mark_piece_gibbed(level._zombie_gib_piece_index_left_arm);
            mark_piece_gibbed(level._zombie_gib_piece_index_right_leg);
            mark_piece_gibbed(level._zombie_gib_piece_index_left_leg);
            mark_piece_gibbed(level._zombie_gib_piece_index_head);
            mark_piece_gibbed(level._zombie_gib_piece_index_hat);
            break;
        case 1:
            if (isdefined(self._gib_def.gibspawn1) && isdefined(self._gib_def.gibspawntag1)) {
                self thread do_gib(self._gib_def.gibspawn1, self._gib_def.gibspawntag1);
            } else {
                if (isdefined(self._gib_def.gibspawn1)) {
                }
                if (isdefined(self._gib_def.gibspawntag1)) {
                }
            }
            mark_piece_gibbed(level._zombie_gib_piece_index_right_arm);
            break;
        case 2:
            if (isdefined(self._gib_def.gibspawn2) && isdefined(self._gib_def.gibspawntag2)) {
                self thread do_gib(self._gib_def.gibspawn2, self._gib_def.gibspawntag2);
            } else {
                if (isdefined(self._gib_def.gibspawn2)) {
                }
                if (isdefined(self._gib_def.gibspawntag2)) {
                }
            }
            mark_piece_gibbed(level._zombie_gib_piece_index_left_arm);
            break;
        case 3:
            if (isdefined(self._gib_def.gibspawn3) && isdefined(self._gib_def.gibspawntag3)) {
                self thread do_gib(self._gib_def.gibspawn3, self._gib_def.gibspawntag3);
            }
            mark_piece_gibbed(level._zombie_gib_piece_index_right_leg);
            break;
        case 4:
            if (isdefined(self._gib_def.gibspawn4) && isdefined(self._gib_def.gibspawntag4)) {
                self thread do_gib(self._gib_def.gibspawn4, self._gib_def.gibspawntag4);
            }
            mark_piece_gibbed(level._zombie_gib_piece_index_left_leg);
            break;
        case 5:
            self thread do_headshot_gib_fx();
            mark_piece_gibbed(level._zombie_gib_piece_index_head);
            break;
        case 6:
            self thread do_gib_fx("J_SpineLower");
            break;
        case 7:
            if (isdefined(self._gib_def.gibspawn5) && isdefined(self._gib_def.gibspawntag5)) {
                self thread do_hat_gib(self._gib_def.gibspawn5, self._gib_def.gibspawntag5);
            }
            mark_piece_gibbed(level._zombie_gib_piece_index_hat);
            break;
        }
    }
    self.gibbed = 1;
}

// Namespace zm/zm
// Params 4, eflags: 0x0
// Checksum 0xbd28e227, Offset: 0x32d0
// Size: 0x254
function zombie_vision_set_apply(str_visionset, int_priority, flt_transition_time, int_clientnum) {
    self endon(#"death");
    self endon(#"disconnect");
    if (!isdefined(self._zombie_visionset_list)) {
        self._zombie_visionset_list = [];
    }
    if (!isdefined(str_visionset) || !isdefined(int_priority)) {
        return;
    }
    if (!isdefined(flt_transition_time)) {
        flt_transition_time = 1;
    }
    if (!isdefined(int_clientnum)) {
        if (self function_21c0fa55()) {
            int_clientnum = self getlocalclientnumber();
        }
        if (!isdefined(int_clientnum)) {
            return;
        }
    }
    already_in_array = 0;
    if (self._zombie_visionset_list.size != 0) {
        for (i = 0; i < self._zombie_visionset_list.size; i++) {
            if (isdefined(self._zombie_visionset_list[i].vision_set) && self._zombie_visionset_list[i].vision_set == str_visionset) {
                already_in_array = 1;
                if (self._zombie_visionset_list[i].priority != int_priority) {
                    self._zombie_visionset_list[i].priority = int_priority;
                }
                break;
            }
        }
    }
    if (!already_in_array) {
        temp_struct = spawnstruct();
        temp_struct.vision_set = str_visionset;
        temp_struct.priority = int_priority;
        array::add(self._zombie_visionset_list, temp_struct, 0);
    }
    vision_to_set = self zombie_highest_vision_set_apply();
    if (isdefined(vision_to_set)) {
        visionsetnaked(int_clientnum, vision_to_set, flt_transition_time);
        return;
    }
    visionsetnaked(int_clientnum, "undefined", flt_transition_time);
}

// Namespace zm/zm
// Params 3, eflags: 0x0
// Checksum 0xba1fcd5, Offset: 0x3530
// Size: 0x1bc
function zombie_vision_set_remove(str_visionset, flt_transition_time, int_clientnum) {
    self endon(#"death");
    self endon(#"disconnect");
    if (!isdefined(str_visionset)) {
        return;
    }
    if (!isdefined(flt_transition_time)) {
        flt_transition_time = 1;
    }
    if (!isdefined(self._zombie_visionset_list)) {
        self._zombie_visionset_list = [];
    }
    if (!isdefined(int_clientnum)) {
        if (self function_21c0fa55()) {
            int_clientnum = self getlocalclientnumber();
        }
        if (!isdefined(int_clientnum)) {
            return;
        }
    }
    temp_struct = undefined;
    for (i = 0; i < self._zombie_visionset_list.size; i++) {
        if (isdefined(self._zombie_visionset_list[i].vision_set) && self._zombie_visionset_list[i].vision_set == str_visionset) {
            temp_struct = self._zombie_visionset_list[i];
        }
    }
    if (isdefined(temp_struct)) {
        arrayremovevalue(self._zombie_visionset_list, temp_struct);
    }
    vision_to_set = self zombie_highest_vision_set_apply();
    if (isdefined(vision_to_set)) {
        visionsetnaked(int_clientnum, vision_to_set, flt_transition_time);
        return;
    }
    visionsetnaked(int_clientnum, "default", flt_transition_time);
}

// Namespace zm/zm
// Params 0, eflags: 0x1 linked
// Checksum 0x32bbf37c, Offset: 0x36f8
// Size: 0xc0
function zombie_highest_vision_set_apply() {
    if (!isdefined(self._zombie_visionset_list)) {
        return;
    }
    highest_score = 0;
    highest_score_vision = undefined;
    for (i = 0; i < self._zombie_visionset_list.size; i++) {
        if (isdefined(self._zombie_visionset_list[i].priority) && self._zombie_visionset_list[i].priority > highest_score) {
            highest_score = self._zombie_visionset_list[i].priority;
            highest_score_vision = self._zombie_visionset_list[i].vision_set;
        }
    }
    return highest_score_vision;
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x371551f, Offset: 0x37c0
// Size: 0x15e
function handle_zombie_risers_foliage(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"demo_jump");
    self endon(#"death");
    if (!oldval && newval) {
        localplayers = level.localplayers;
        playsound(0, #"zmb_zombie_spawn", self.origin);
        burst_fx = level._effect[#"rise_burst_foliage"];
        billow_fx = level._effect[#"rise_billow_foliage"];
        type = "foliage";
        for (i = 0; i < localplayers.size; i++) {
            self thread rise_dust_fx(i, type, billow_fx, burst_fx);
        }
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x587a4299, Offset: 0x3928
// Size: 0x15e
function handle_zombie_risers_water(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"demo_jump");
    self endon(#"death");
    if (!oldval && newval) {
        localplayers = level.localplayers;
        playsound(0, #"zmb_zombie_spawn_water", self.origin);
        burst_fx = level._effect[#"rise_burst_water"];
        billow_fx = level._effect[#"rise_billow_water"];
        type = "water";
        for (i = 0; i < localplayers.size; i++) {
            self thread rise_dust_fx(i, type, billow_fx, burst_fx);
        }
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x6ec5255b, Offset: 0x3a90
// Size: 0x1d6
function handle_zombie_risers(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"demo_jump");
    self endon(#"death");
    if (!oldval && newval) {
        localplayers = level.localplayers;
        sound = "zmb_zombie_spawn";
        burst_fx = level._effect[#"rise_burst"];
        billow_fx = level._effect[#"rise_billow"];
        type = "dirt";
        if (isdefined(level.riser_type) && level.riser_type == "snow") {
            sound = "zmb_zombie_spawn_snow";
            burst_fx = level._effect[#"rise_burst_snow"];
            billow_fx = level._effect[#"rise_billow_snow"];
            type = "snow";
        }
        playsound(0, sound, self.origin);
        for (i = 0; i < localplayers.size; i++) {
            self thread rise_dust_fx(i, type, billow_fx, burst_fx);
        }
    }
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xc96e3be4, Offset: 0x3c70
// Size: 0x1d6
function handle_zombie_risers_lowg(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level endon(#"demo_jump");
    self endon(#"death");
    if (!oldval && newval) {
        localplayers = level.localplayers;
        sound = "zmb_zombie_spawn";
        burst_fx = level._effect[#"rise_burst_lg"];
        billow_fx = level._effect[#"rise_billow_lg"];
        type = "dirt";
        if (isdefined(level.riser_type) && level.riser_type == "snow") {
            sound = "zmb_zombie_spawn_snow";
            burst_fx = level._effect[#"rise_burst_snow"];
            billow_fx = level._effect[#"rise_billow_snow"];
            type = "snow";
        }
        playsound(0, sound, self.origin);
        for (i = 0; i < localplayers.size; i++) {
            self thread rise_dust_fx(i, type, billow_fx, burst_fx);
        }
    }
}

// Namespace zm/zm
// Params 4, eflags: 0x1 linked
// Checksum 0xf3bd13ef, Offset: 0x3e50
// Size: 0x324
function rise_dust_fx(clientnum, type, billow_fx, burst_fx) {
    dust_tag = "J_SpineUpper";
    self endon(#"death");
    level endon(#"demo_jump");
    if (isdefined(level.zombie_custom_riser_fx_handler)) {
        s_info = self [[ level.zombie_custom_riser_fx_handler ]]();
        if (isdefined(s_info)) {
            if (isdefined(s_info.burst_fx)) {
                burst_fx = s_info.burst_fx;
            }
            if (isdefined(s_info.billow_fx)) {
                billow_fx = s_info.billow_fx;
            }
            if (isdefined(s_info.type)) {
                type = s_info.type;
            }
        }
    }
    if (isdefined(burst_fx)) {
        playfx(clientnum, burst_fx, self.origin + (0, 0, randomintrange(5, 10)));
    }
    wait 0.25;
    if (isdefined(billow_fx)) {
        playfx(clientnum, billow_fx, self.origin + (randomintrange(-10, 10), randomintrange(-10, 10), randomintrange(5, 10)));
    }
    wait 2;
    dust_time = 5.5;
    dust_interval = 0.3;
    player = level.localplayers[clientnum];
    effect = level._effect[#"rise_dust"];
    if (type == "water") {
        effect = level._effect[#"rise_dust_water"];
    } else if (type == "snow") {
        effect = level._effect[#"rise_dust_snow"];
    } else if (type == "foliage") {
        effect = level._effect[#"rise_dust_foliage"];
    } else if (type == "none") {
        return;
    }
    for (t = 0; t < dust_time; t += dust_interval) {
        if (!isdefined(self)) {
            return;
        }
        util::playfxontag(clientnum, effect, self, dust_tag);
        wait dust_interval;
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0x97d00243, Offset: 0x4180
// Size: 0x34
function on_player_laststand(localclientnum) {
    println("<dev string:xba>" + localclientnum);
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xbf701062, Offset: 0x41c0
// Size: 0x8c
function end_last_stand(clientnum) {
    self waittill(#"laststandend");
    println("<dev string:xe1>" + clientnum);
    wait 0.7;
    println("<dev string:x101>");
    playsound(clientnum, #"revive_gasp");
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xf3e6ccd, Offset: 0x4258
// Size: 0x16e
function last_stand_thread(clientnum) {
    self thread end_last_stand(clientnum);
    self endon(#"laststandend");
    println("<dev string:x109>" + clientnum);
    pause = 0.5;
    for (vol = 0.5; true; vol = 1) {
        id = playsound(clientnum, #"chr_heart_beat");
        setsoundvolume(id, vol);
        wait pause;
        if (pause < 2) {
            pause *= 1.05;
            if (pause > 2) {
                pause = 2;
            }
        }
        if (vol < 1) {
            vol *= 1.05;
            if (vol > 1) {
            }
        }
    }
}

// Namespace zm/zm
// Params 3, eflags: 0x0
// Checksum 0x70d7debd, Offset: 0x43d0
// Size: 0x1c6
function last_stand_monitor(clientnum, state, oldstate) {
    player = level.localplayers[clientnum];
    players = level.localplayers;
    if (!isdefined(player)) {
        return;
    }
    if (state == "1") {
        if (!level._laststand[clientnum]) {
            if (!isdefined(level.lslooper)) {
                level.lslooper = spawn(0, player.origin, "script.origin");
            }
            player thread last_stand_thread(clientnum);
            if (players.size <= 1) {
                level.lslooper playloopsound(#"evt_laststand_loop", 0.3);
            }
            level._laststand[clientnum] = 1;
        }
        return;
    }
    if (level._laststand[clientnum]) {
        if (isdefined(level.lslooper)) {
            level.lslooper stopallloopsounds(0.7);
            playsound(0, #"evt_laststand_in", (0, 0, 0));
        }
        player notify(#"laststandend");
        level._laststand[clientnum] = 0;
    }
}

// Namespace zm/zm
// Params 2, eflags: 0x1 linked
// Checksum 0x1a364de0, Offset: 0x45a0
// Size: 0x2c
function function_bbea98ae(localclientnum, b_igc_active) {
    self function_92f0c63(localclientnum);
}

// Namespace zm/zm
// Params 1, eflags: 0x1 linked
// Checksum 0xd3e73e32, Offset: 0x45d8
// Size: 0x7c
function function_92f0c63(localclientnum) {
    self renderoverridebundle::function_c8d97b8e(localclientnum, #"zm_friendly", #"hash_60913f86a5a5a3f1");
    self renderoverridebundle::function_c8d97b8e(localclientnum, #"zm_friendly_ls", #"hash_60913f86a5a5a3f1");
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0xdd28ea7d, Offset: 0x4660
// Size: 0x17c
function laststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_92f0c63(localclientnum);
    if (isplayer(self) && self function_21c0fa55() && !isdemoplaying()) {
        if (localclientnum === self getlocalclientnumber()) {
            self zm_audio::sndzmblaststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
        }
    }
    if (isplayer(self) && self function_21c0fa55()) {
        controller_model = getuimodelforcontroller(localclientnum);
        laststand_model = createuimodel(controller_model, "ZMHud.lastStand");
        setuimodelvalue(laststand_model, newval);
    }
}

// Namespace zm/zm
// Params 2, eflags: 0x5 linked
// Checksum 0x4ddd11f1, Offset: 0x47e8
// Size: 0xac
function private function_b9c917cc(var_6142f944, str_bundle) {
    if (self function_21c0fa55()) {
        return false;
    }
    if (!self function_ca024039()) {
        return false;
    }
    if (isdefined(level.var_dc60105c) && level.var_dc60105c) {
        return false;
    }
    if (isigcactive(var_6142f944)) {
        return false;
    }
    if (isdefined(self.var_74b9b03b) && self.var_74b9b03b) {
        return false;
    }
    return true;
}

// Namespace zm/zm
// Params 2, eflags: 0x5 linked
// Checksum 0xcc571b0c, Offset: 0x48a0
// Size: 0xbe
function private function_a1ab192(var_6142f944, str_bundle) {
    if (!self function_b9c917cc(var_6142f944, str_bundle)) {
        return false;
    }
    if (isplayer(self) || self function_21c0fa55() || isdemoplaying()) {
        return false;
    }
    if (isdefined(level.var_dc60105c) && level.var_dc60105c) {
        return false;
    }
    if (isigcactive(var_6142f944)) {
        return false;
    }
    return true;
}

// Namespace zm/zm
// Params 7, eflags: 0x1 linked
// Checksum 0x5eda8195, Offset: 0x4968
// Size: 0x13c
function update_aat_hud(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    str_localized = aat::get_string(newval);
    icon = aat::get_icon(newval);
    if (str_localized == "none") {
        str_localized = #"";
    }
    controllermodel = getuimodelforcontroller(localclientnum);
    aatmodel = createuimodel(controllermodel, "zmhud.aat");
    setuimodelvalue(aatmodel, str_localized);
    aaticonmodel = createuimodel(controllermodel, "zmhud.aatIcon");
    setuimodelvalue(aaticonmodel, icon);
}

