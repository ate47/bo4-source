// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\draft.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace mp_cosmodrome_scripted;

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x2
// Checksum 0xee8aceb7, Offset: 0x4d0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"mp_cosmodrome_scripted", &__init__, &__main__, undefined);
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x3903aea, Offset: 0x520
// Size: 0x24
function __init__() {
    callback::on_game_playing(&on_game_playing);
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x92a8155b, Offset: 0x550
// Size: 0x12c
function __main__() {
    level.var_f3e25805 = &function_c3c859e1;
    level.var_40263d6 = [];
    level.var_40263d6[0] = (592, -2387, 289);
    level.var_40263d6[1] = (-131, -1575, 287);
    level.var_40263d6[2] = (-1493, -88, 347);
    level.var_40263d6[3] = (-1346, 838, 364);
    level.var_40263d6[4] = (-1305, 1576, 384);
    level.var_40263d6[5] = (-963, 2273, 440);
    level.var_40263d6[6] = (575, 2905, 292);
    function_34fc666e();
    function_f2d8c425();
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xaf35c966, Offset: 0x688
// Size: 0x6c
function function_c3c859e1() {
    if (getgametypesetting(#"allowmapscripting")) {
        level thread scene::play(#"hash_5c22828d306d4fcc");
        level thread scene::play(#"hash_2fb18b19a7ad26ef", "Shot 1");
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x660185c7, Offset: 0x700
// Size: 0x18c
function on_game_playing() {
    level endon(#"game_ended");
    /#
        level thread function_56b1158f(level.var_40263d6);
    #/
    level util::delay(#"hash_35c1b03137d3be89", "game_ended", &exploder::stop_exploder, "exp_lgt_spawn_flavor");
    level util::delay(#"hash_35c1b03137d3be89", "game_ended", &function_aa8af5cd, level.var_40263d6, "evt_base_alarm");
    if (getgametypesetting(#"allowmapscripting")) {
        if (1) {
            level thread function_3a7aa317();
        }
    }
    level flag::wait_till("first_player_spawned");
    if (!draft::is_draft_this_round()) {
        level notify(#"hash_35c1b03137d3be89");
    }
    if (util::isfirstround()) {
        exploder::exploder("fxexp_fuel_tank_exp");
        exploder::stop_exploder("exp_lgt_spawn_fire");
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x92bdf6c7, Offset: 0x898
// Size: 0x104
function function_3a7aa317() {
    level endon(#"game_ended");
    level scene::add_scene_func(#"hash_8274f4ac02ad69", &function_269c793, "Shot 2");
    function_de03ab6f();
    function_6c6d4350();
    level thread scene::play(#"hash_2ef9f7002f028e43");
    level scene::play(#"hash_8274f4ac02ad69", "Shot 1");
    function_f7dd380e();
    function_b121d5f5();
    level thread scene::play(#"hash_8274f4ac02ad69", "Shot 2");
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x21249458, Offset: 0x9a8
// Size: 0x7c
function function_de03ab6f() {
    level endon(#"game_ended");
    if (!getdvarint(#"hash_1ee64aff68c3f875", 1)) {
        return;
    }
    time = level.timelimit * 60 / 4;
    if (time < 60) {
        time = 3;
    }
    wait(time);
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xfbe9359b, Offset: 0xa30
// Size: 0x136
function function_f7dd380e() {
    level endon(#"game_ended");
    if (!getdvarint(#"hash_1ee64aff68c3f875", 1)) {
        return;
    }
    remaining = float(globallogic_utils::gettimeremaining()) / 1000;
    timeout = remaining - 60;
    if (timeout < 3) {
        timeout = 3;
    }
    if (isdefined(timeout)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s util::delay_notify(timeout, "timeout");
    }
    do {
        waitframe(5);
        reached_score = function_efa3251f();
    } while(!reached_score);
    wait(3);
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xbbe71865, Offset: 0xb70
// Size: 0x1d0
function function_b121d5f5() {
    level endon(#"game_ended");
    var_1795a3b9 = [];
    var_1795a3b9[0] = "vox_rupa_pa_rocket_sequence_9";
    var_1795a3b9[1] = "vox_rupa_pa_rocket_sequence_10";
    var_1795a3b9[2] = "vox_rupa_pa_rocket_sequence_11";
    var_1795a3b9[3] = "vox_rupa_pa_rocket_sequence_12";
    var_1795a3b9[4] = "vox_rupa_pa_rocket_sequence_13";
    var_1795a3b9[5] = "vox_rupa_pa_rocket_sequence_14";
    var_1795a3b9[6] = "vox_rupa_pa_rocket_sequence_15";
    var_1795a3b9[7] = "vox_rupa_pa_rocket_sequence_16";
    var_1795a3b9[8] = "vox_rupa_pa_rocket_sequence_17";
    var_1795a3b9[9] = "vox_rupa_pa_rocket_sequence_18";
    foreach (i, var_1cf4799b in var_1795a3b9) {
        if (getdvarint(#"hash_8ddd1821fceebe9", 0)) {
            /#
                iprintlnbold(i);
            #/
        }
        function_aa8af5cd(level.var_40263d6, var_1cf4799b);
        if (i == 9) {
            exploder::exploder("fxexp_rocket_ignition");
        }
        wait(1.2);
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x9f24c4c6, Offset: 0xd48
// Size: 0xe4
function function_efa3251f() {
    round_score_limit = util::get_current_round_score_limit();
    if (round_score_limit < level.scorelimit) {
        round_score_limit = level.scorelimit;
    }
    foreach (team, _ in level.teams) {
        if (game.stat[#"teamscores"][team] >= int(round_score_limit / 2)) {
            return 1;
        }
    }
    return 0;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x80fd35e8, Offset: 0xe38
// Size: 0xb4
function function_f2d8c425() {
    level scene::add_scene_func(#"hash_8274f4ac02ad69", &function_e3ec98e4, "Shot 1");
    level scene::add_scene_func(#"hash_2ef9f7002f028e43", &function_84d0eb82, "init");
    level scene::init(#"hash_8274f4ac02ad69");
    level scene::init(#"hash_2ef9f7002f028e43");
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x3baa1ba0, Offset: 0xef8
// Size: 0x11c
function function_84d0eb82(a_ents) {
    var_c09154b7 = a_ents[#"prop 2"];
    waitframe(2);
    if (isdefined(var_c09154b7)) {
        var_b2503142 = getent("rocket_cradle_clip", "targetname");
        link = util::spawn_model(#"tag_origin", var_c09154b7 gettagorigin("tag_link_all"), var_c09154b7 gettagangles("tag_link_all"));
        var_b2503142 setmovingplatformenabled(1, 0);
        link linkto(var_c09154b7, "tag_link_all");
        var_b2503142 linkto(link);
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x749cc933, Offset: 0x1020
// Size: 0x314
function function_e3ec98e4(a_ents) {
    level.var_578a0ca4 = spawnstruct();
    level.var_578a0ca4.scene_ents = self.scene_ents;
    self.var_a9572efa = getent("rocket_kill_trig", "targetname");
    var_93b0191c = struct::get_array("rocket_gantry_rumble");
    rumbles = [];
    foreach (pos in var_93b0191c) {
        if (!isdefined(rumbles)) {
            rumbles = [];
        } else if (!isarray(rumbles)) {
            rumbles = array(rumbles);
        }
        rumbles[rumbles.size] = util::spawn_model(#"tag_origin", pos.origin, pos.angles);
    }
    if (isdefined(self.var_a9572efa)) {
        self.var_a9572efa triggerenable(0);
    }
    array::run_all(rumbles, &playrumblelooponentity, "mp_cosdmodrome_gantry_prep_rumble");
    function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_3");
    a_ents[#"prop 2"] waittill(#"stop_rumble", #"death");
    array::run_all(rumbles, &stoprumble, "mp_cosdmodrome_rocket_ready_rumble");
    if (isdefined(a_ents[#"prop 2"])) {
        a_ents[#"prop 2"] playrumbleonentity("mp_cosdmodrome_rocket_ready_rumble");
    }
    array::run_all(rumbles, &playrumblelooponentity, "mp_cosdmodrome_rocket_ready_gantry_rumble");
    array::delete_all(rumbles);
    a_ents[#"prop 2"] waittill(#"hash_7120d141e05e334d");
    function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_7");
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x5ced71c1, Offset: 0x1340
// Size: 0x2ec
function function_269c793(a_ents) {
    function_aa8af5cd(level.var_40263d6, "evt_rocket_alarm");
    if (isdefined(self.var_a9572efa)) {
        level endon(#"game_ended");
        a_ents[#"prop 3"] endon(#"death");
        var_f81682b6 = util::spawn_model(#"tag_origin", self.var_a9572efa.origin);
        var_f81682b6 linkto(a_ents[#"prop 3"]);
        a_ents[#"prop 3"] waittill(#"start_damage");
        a_ents[#"prop 3"] util::delay("line_23", undefined, &function_aa8af5cd, level.var_40263d6, "vox_rupa_pa_rocket_sequence_23");
        level.var_578a0ca4 thread function_7be405f8();
        self.var_a9572efa triggerenable(1);
        self.var_a9572efa callback::on_trigger(&function_971b8aa2);
        self thread function_6edeb4c2(a_ents[#"prop 3"]);
        var_f81682b6 playrumblelooponentity("mp_cosdmodrome_rocket_rumble");
        a_ents[#"prop 3"] waittill(#"stop_damage");
        level thread function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_19");
        if (isdefined(self) && isdefined(self.var_a9572efa)) {
            self.var_a9572efa triggerenable(0);
        }
        a_ents[#"prop 3"] thread util::delete_on_death(var_f81682b6);
        a_ents[#"prop 3"] waittill(#"cleared_tower");
        level thread function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_20");
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x86f8eb51, Offset: 0x1638
// Size: 0x9c
function function_971b8aa2(var_ae2faaca) {
    player = var_ae2faaca.activator;
    if (isalive(player)) {
        mod = "MOD_BURNED";
        if (isvehicle(player)) {
            mod = "MOD_EXPLOSIVE";
        }
        player dodamage(player.health, player.origin, undefined, undefined, undefined, mod);
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x5467c412, Offset: 0x16e0
// Size: 0x76
function function_6edeb4c2(rocket) {
    level endon(#"game_ended");
    rocket endon(#"stop_damage", #"death");
    while (1) {
        self kill_equipment(self.var_a9572efa);
        waitframe(5);
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0xd97096d, Offset: 0x1760
// Size: 0x114
function function_34fc666e() {
    level endon(#"game_ended");
    if (getgametypesetting(#"allowmapscripting") && draft::is_draft_this_round()) {
        if (util::isfirstround()) {
            level scene::init(#"hash_5c22828d306d4fcc");
        }
    }
    level flag::wait_till("all_players_connected");
    waitframe(1);
    exploder::exploder("exp_lgt_spawn_flavor");
    if (util::isfirstround()) {
        exploder::exploder("exp_lgt_spawn_fire");
    } else {
        exploder::exploder("fxexp_fuel_tank_exp_aftermath");
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x466c5ec4, Offset: 0x1880
// Size: 0x76
function function_7be405f8() {
    level endon(#"game_ended");
    while (1) {
        self.scene_ents = array::remove_undefined(self.scene_ents);
        if (self.scene_ents.size <= 5) {
            return;
        }
        self function_e940bcf9();
        waitframe(5);
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x9fb3f8c, Offset: 0x1900
// Size: 0x124
function function_e940bcf9() {
    foreach (var_66bc2a51 in self.scene_ents) {
        if (!isdefined(var_66bc2a51) || !isdefined(var_66bc2a51.var_7c9174d1)) {
            continue;
        }
        foreach (var_ef7ce878 in var_66bc2a51.var_7c9174d1) {
            if (isdefined(var_ef7ce878)) {
                var_ef7ce878 dodamage(500, var_ef7ce878.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
            }
        }
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 2, eflags: 0x1 linked
// Checksum 0x8ca8653b, Offset: 0x1a30
// Size: 0xa8
function function_aa8af5cd(locs, line) {
    foreach (loc in locs) {
        playsoundatposition(line, loc);
        /#
            level thread function_cd7664d5(loc, line);
        #/
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x397293b, Offset: 0x1ae0
// Size: 0x140
function function_6c6d4350() {
    locs = [];
    locs[0] = (-1493, -88, 347);
    locs[1] = (-1346, 838, 364);
    locs[2] = (714, 955, 272);
    locs[3] = (720, -125, 200);
    /#
        level thread function_56b1158f(locs, (1, 1, 0));
    #/
    foreach (loc in locs) {
        playsoundatposition("evt_gantry_alarm", loc);
        /#
            level thread function_cd7664d5(loc, "<unknown string>", (1, 1, 0));
        #/
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x84c9e871, Offset: 0x1c28
// Size: 0x13a
function is_equipment(entity) {
    if (isdefined(entity.weapon)) {
        weapon = entity.weapon;
        if (weapon.name === #"ability_smart_cover" || weapon.name === #"eq_tripwire" || weapon.name === #"trophy_system" || weapon.name === #"eq_concertina_wire" || weapon.name === #"eq_sensor" || weapon.name === #"cymbal_monkey" || weapon.name === #"gadget_supplypod" || weapon.name === #"homunculus") {
            return 1;
        }
    }
    return 0;
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 1, eflags: 0x1 linked
// Checksum 0x1fe95c7d, Offset: 0x1d70
// Size: 0x26e
function kill_equipment(var_a9572efa) {
    self endon(#"death");
    level endon(#"start_warzone");
    if (!isdefined(var_a9572efa)) {
        return;
    }
    equipment = getentitiesinradius(self.origin, 10000);
    foreach (device in equipment) {
        if (isdefined(device) && is_equipment(device) && device istouching(var_a9572efa)) {
            switch (device.weapon.name) {
            case #"eq_tripwire":
                device [[ level.var_2e06b76a ]]();
                break;
            case #"trophy_system":
                device [[ level.var_4f3822f4 ]]();
                break;
            case #"cymbal_monkey":
                device [[ level.var_7c5c96dc ]]();
                break;
            case #"homunculus":
                device [[ level.var_cc310d06 ]]();
                break;
            case #"eq_sensor":
                device [[ level.var_9911d36f ]]();
                break;
            case #"eq_concertina_wire":
                device [[ level.var_94029383 ]]();
                break;
            case #"gadget_supplypod":
                device notify(#"death");
                break;
            default:
                device dodamage(10000, device.origin);
                break;
            }
        }
    }
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 2, eflags: 0x0
// Checksum 0xc05583cf, Offset: 0x1fe8
// Size: 0x122
function function_56b1158f(locs, color) {
    /#
        if (!isdefined(color)) {
            color = (0, 1, 0);
        }
        while (getdvarint(#"hash_2115192db52b1b16", 0)) {
            foreach (loc in locs) {
                print3d(loc + vectorscale((0, 0, 1), 8), loc, color, 1, 1.2, 30);
                sphere(loc, 8, color, 1, 0, 4, 30);
            }
            waitframe(30);
        }
    #/
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 3, eflags: 0x0
// Checksum 0xfb090efe, Offset: 0x2118
// Size: 0x94
function function_cd7664d5(loc, alias, color) {
    /#
        if (!isdefined(color)) {
            color = (0, 1, 0);
        }
        if (getdvarint(#"hash_2115192db52b1b16", 0)) {
            /#
                print3d(loc + vectorscale((0, 0, 1), 32), alias, color, 1, 1.2, 120);
            #/
        }
    #/
}

// Namespace mp_cosmodrome_scripted/mp_cosmodrome_scripted
// Params 0, eflags: 0x0
// Checksum 0xf1786b2, Offset: 0x21b8
// Size: 0xc0
function function_c42e2ec1() {
    while (1) {
        wait(3);
        function_aa8af5cd(level.var_40263d6, "evt_base_alarm");
        wait(3);
        function_b121d5f5();
        function_aa8af5cd(level.var_40263d6, "evt_rocket_alarm");
        wait(5);
        function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_3");
        wait(3);
        function_aa8af5cd(level.var_40263d6, "vox_rupa_pa_rocket_sequence_7");
    }
}

