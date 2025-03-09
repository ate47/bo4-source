#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\dialog_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;

#namespace audio;

// Namespace audio/audio_shared
// Params 0, eflags: 0x2
// Checksum 0x1e5e14f4, Offset: 0x540
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"audio", &__init__, undefined, undefined);
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x6734ec47, Offset: 0x588
// Size: 0xe4
function __init__() {
    snd_snapshot_init();
    callback::on_localclient_connect(&player_init);
    callback::on_localplayer_spawned(&local_player_spawn);
    callback::on_localplayer_spawned(&sndsprintbreath);
    level thread register_clientfields();
    level thread sndkillcam();
    setsoundcontext("foley", "normal");
    setsoundcontext("plr_impact", "");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xf665be11, Offset: 0x678
// Size: 0x43c
function register_clientfields() {
    clientfield::register("world", "sndMatchSnapshot", 1, 2, "int", &sndmatchsnapshot, 1, 0);
    clientfield::register("world", "sndFoleyContext", 1, 1, "int", &sndfoleycontext, 0, 0);
    clientfield::register("scriptmover", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
    clientfield::register("allplayers", "sndRattle", 1, 1, "counter", &sndrattle_server, 1, 0);
    clientfield::register("toplayer", "sndMelee", 1, 1, "int", &weapon_butt_sounds, 1, 1);
    clientfield::register("vehicle", "sndSwitchVehicleContext", 1, 3, "int", &sndswitchvehiclecontext, 0, 0);
    clientfield::register("toplayer", "sndCCHacking", 1, 2, "int", &sndcchacking, 1, 1);
    clientfield::register("toplayer", "sndTacRig", 1, 1, "int", &sndtacrig, 0, 1);
    clientfield::register("toplayer", "sndLevelStartSnapOff", 1, 1, "int", &sndlevelstartsnapoff, 0, 1);
    clientfield::register("world", "sndIGCsnapshot", 1, 4, "int", &sndigcsnapshot, 1, 0);
    clientfield::register("world", "sndChyronLoop", 1, 1, "int", &sndchyronloop, 0, 0);
    clientfield::register("world", "sndZMBFadeIn", 1, 1, "int", &sndzmbfadein, 1, 0);
    clientfield::register("toplayer", "sndVehicleDamageAlarm", 1, 1, "counter", &sndvehicledamagealarm, 0, 0);
    clientfield::register("toplayer", "sndCriticalHealth", 1, 1, "int", &sndcriticalhealth, 0, 1);
    clientfield::register("toplayer", "sndLastStand", 1, 1, "int", &sndlaststand, 0, 0);
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xb7a80bdb, Offset: 0xac0
// Size: 0xd4
function local_player_spawn(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    setsoundcontext("foley", "normal");
    if (!sessionmodeismultiplayergame() && !sessionmodeiswarzonegame()) {
        self thread sndmusicdeathwatcher();
    }
    self thread isplayerinfected();
    self thread snd_underwater(localclientnum);
    self thread clientvoicesetup(localclientnum);
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x225e1ff1, Offset: 0xba0
// Size: 0xb4
function player_init(localclientnum) {
    if (issplitscreenhost(localclientnum)) {
        level thread bump_trigger_start(localclientnum);
        level thread init_audio_triggers(localclientnum);
        level thread sndrattle_grenade_client();
        startsoundrandoms(localclientnum);
        startsoundloops();
        startlineemitters();
        startrattles();
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xec43cc1a, Offset: 0xc60
// Size: 0x108
function snddoublejump_watcher() {
    self endon(#"death");
    while (true) {
        self waittill(#"doublejump_start");
        trace = tracepoint(self.origin, self.origin - (0, 0, 100000));
        trace_surface_type = trace[#"surfacetype"];
        trace_origin = trace[#"position"];
        if (!isdefined(trace) || !isdefined(trace_origin)) {
            continue;
        }
        if (!isdefined(trace_surface_type)) {
            trace_surface_type = "default";
        }
        playsound(0, #"veh_jetpack_surface_" + trace_surface_type, trace_origin);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xbc668590, Offset: 0xd70
// Size: 0xcc
function clientvoicesetup(localclientnum) {
    self endon(#"death");
    if (isdefined(level.clientvoicesetup)) {
        [[ level.clientvoicesetup ]](localclientnum);
        return;
    }
    self.teamclientprefix = "vox_gen";
    self thread sndvonotify("playerbreathinsound", "sniper_hold");
    self thread sndvonotify("playerbreathoutsound", "sniper_exhale");
    self thread sndvonotify("playerbreathgaspsound", "sniper_gasp");
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0x2e5b44bc, Offset: 0xe48
// Size: 0x70
function sndvonotify(notifystring, dialog) {
    self endon(#"death");
    for (;;) {
        self waittill(notifystring);
        soundalias = self.teamclientprefix + "_" + dialog;
        self playsound(0, soundalias);
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x818b8fc1, Offset: 0xec0
// Size: 0x134
function snd_snapshot_init() {
    level._sndactivesnapshot = "default";
    level._sndnextsnapshot = "default";
    if (!util::is_frontend_map()) {
        if (sessionmodeiscampaigngame() && !function_22a92b8b() && !function_c9705ad4()) {
            level._sndactivesnapshot = "cmn_level_start";
            level._sndnextsnapshot = "cmn_level_start";
            level thread sndlevelstartduck_shutoff();
        }
        if (sessionmodeiszombiesgame()) {
            level._sndactivesnapshot = "zmb_game_start_nofade";
            level._sndnextsnapshot = "zmb_game_start_nofade";
        }
    }
    setgroupsnapshot(level._sndactivesnapshot);
    thread snd_snapshot_think();
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xaddeeef0, Offset: 0x1000
// Size: 0x34
function sndlevelstartduck_shutoff() {
    level waittill(#"sndlevelstartduck_shutoff");
    snd_set_snapshot("default");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xbb66a005, Offset: 0x1040
// Size: 0xfe
function function_22a92b8b() {
    ignore = 1;
    mapname = util::get_map_name();
    switch (mapname) {
    case #"hash_15642edd0e4376f1":
    case #"hash_5562580f1b903614":
    case #"hash_65a6e39408662d48":
    case #"hash_68bac554964f4148":
    case #"hash_7bdf016123a0147b":
        ignore = 0;
        break;
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"download":
        ignore = 1;
        break;
    }
    return ignore;
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xb7e6f84e, Offset: 0x1148
// Size: 0x86
function function_c9705ad4() {
    ignore = 1;
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"coop":
    case #"pvp":
        ignore = 0;
        break;
    }
    return ignore;
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x94a6263a, Offset: 0x11d8
// Size: 0x58
function snd_set_snapshot(state) {
    level._sndnextsnapshot = state;
    println("<dev string:x38>" + state + "<dev string:x56>");
    level notify(#"new_bus");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x9c584213, Offset: 0x1238
// Size: 0xc6
function snd_snapshot_think() {
    for (;;) {
        if (level._sndactivesnapshot == level._sndnextsnapshot) {
            level waittill(#"new_bus");
        }
        if (level._sndactivesnapshot == level._sndnextsnapshot) {
            continue;
        }
        assert(isdefined(level._sndnextsnapshot));
        assert(isdefined(level._sndactivesnapshot));
        setgroupsnapshot(level._sndnextsnapshot);
        level._sndactivesnapshot = level._sndnextsnapshot;
    }
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0xffbe8518, Offset: 0x1308
// Size: 0x210
function soundrandom_thread(localclientnum, randsound) {
    if (!isdefined(randsound.script_wait_min)) {
        randsound.script_wait_min = 1;
    }
    if (!isdefined(randsound.script_wait_max)) {
        randsound.script_wait_max = 3;
    }
    notify_name = undefined;
    if (isdefined(randsound.script_string)) {
        notify_name = randsound.script_string;
    }
    if (!isdefined(notify_name) && isdefined(randsound.script_sound)) {
        createsoundrandom(randsound.origin, randsound.script_sound, randsound.script_wait_min, randsound.script_wait_max);
        return;
    }
    randsound.playing = 1;
    level thread soundrandom_notifywait(notify_name, randsound);
    while (true) {
        wait randomfloatrange(randsound.script_wait_min, randsound.script_wait_max);
        if (isdefined(randsound.script_sound) && isdefined(randsound.playing) && randsound.playing) {
            playsound(localclientnum, randsound.script_sound, randsound.origin);
        }
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                print3d(randsound.origin, randsound.script_sound, (0, 0.8, 0), 1, 3, 45);
            }
        #/
    }
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0x9c6fc328, Offset: 0x1520
// Size: 0x72
function soundrandom_notifywait(notify_name, randsound) {
    while (true) {
        level waittill(notify_name);
        if (isdefined(randsound.playing) && randsound.playing) {
            randsound.playing = 0;
            continue;
        }
        randsound.playing = 1;
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x88603052, Offset: 0x15a0
// Size: 0x10e
function startsoundrandoms(localclientnum) {
    randoms = struct::get_array("random", "script_label");
    if (isdefined(randoms) && randoms.size > 0) {
        nscriptthreadedrandoms = 0;
        for (i = 0; i < randoms.size; i++) {
            if (isdefined(randoms[i].script_scripted)) {
                nscriptthreadedrandoms++;
            }
        }
        allocatesoundrandoms(randoms.size - nscriptthreadedrandoms);
        for (i = 0; i < randoms.size; i++) {
            randoms[i].angles = undefined;
            thread soundrandom_thread(localclientnum, randoms[i]);
        }
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xd2e51c0a, Offset: 0x16b8
// Size: 0x16a
function soundloopthink() {
    if (!isdefined(self.script_sound)) {
        return;
    }
    if (!isdefined(self.origin)) {
        return;
    }
    notifyname = "";
    assert(isdefined(notifyname));
    if (isdefined(self.script_string)) {
        notifyname = self.script_string;
    }
    assert(isdefined(notifyname));
    started = 1;
    if (isdefined(self.script_int)) {
        started = self.script_int != 0;
    }
    if (started) {
        soundloopemitter(self.script_sound, self.origin);
    }
    if (notifyname != "") {
        for (;;) {
            level waittill(notifyname);
            if (started) {
                soundstoploopemitter(self.script_sound, self.origin);
                self thread soundloopcheckpointrestore();
            } else {
                soundloopemitter(self.script_sound, self.origin);
            }
            started = !started;
        }
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xf4543ef6, Offset: 0x1830
// Size: 0x3c
function soundloopcheckpointrestore() {
    level waittill(#"save_restore");
    soundloopemitter(self.script_sound, self.origin);
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x39a89963, Offset: 0x1878
// Size: 0x17a
function soundlinethink() {
    if (!isdefined(self.target)) {
        return;
    }
    target = struct::get(self.target, "targetname");
    if (!isdefined(target)) {
        return;
    }
    notifyname = "";
    if (isdefined(self.script_string)) {
        notifyname = self.script_string;
    }
    started = 1;
    if (isdefined(self.script_int)) {
        started = self.script_int != 0;
    }
    if (started) {
        soundlineemitter(self.script_sound, self.origin, target.origin);
    }
    if (notifyname != "") {
        for (;;) {
            level waittill(notifyname);
            if (started) {
                soundstoplineemitter(self.script_sound, self.origin, target.origin);
                self thread soundlinecheckpointrestore(target);
            } else {
                soundlineemitter(self.script_sound, self.origin, target.origin);
            }
            started = !started;
        }
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x3e24e2ae, Offset: 0x1a00
// Size: 0x4c
function soundlinecheckpointrestore(target) {
    level waittill(#"save_restore");
    soundlineemitter(self.script_sound, self.origin, target.origin);
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xa1d84fb8, Offset: 0x1a58
// Size: 0x184
function startsoundloops() {
    loopers = struct::get_array("looper", "script_label");
    if (isdefined(loopers) && loopers.size > 0) {
        delay = 0;
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<dev string:x5a>" + loopers.size + "<dev string:x87>");
            }
        #/
        for (i = 0; i < loopers.size; i++) {
            loopers[i].angles = undefined;
            loopers[i].script_label = undefined;
            loopers[i] thread soundloopthink();
            delay += 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
        return;
    }
    /#
        if (getdvarint(#"debug_audio", 0) > 0) {
            println("<dev string:x94>");
        }
    #/
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x1276776f, Offset: 0x1be8
// Size: 0x184
function startlineemitters() {
    lineemitters = struct::get_array("line_emitter", "script_label");
    if (isdefined(lineemitters) && lineemitters.size > 0) {
        delay = 0;
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                println("<dev string:xb5>" + lineemitters.size + "<dev string:x87>");
            }
        #/
        for (i = 0; i < lineemitters.size; i++) {
            lineemitters[i].angles = undefined;
            lineemitters[i].script_label = undefined;
            lineemitters[i] thread soundlinethink();
            delay += 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
        return;
    }
    /#
        if (getdvarint(#"debug_audio", 0) > 0) {
            println("<dev string:xe8>");
        }
    #/
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x28bd4a14, Offset: 0x1d78
// Size: 0x18c
function startrattles() {
    rattles = struct::get_array("sound_rattle", "script_label");
    if (isdefined(rattles)) {
        println("<dev string:x10f>" + rattles.size + "<dev string:x118>");
        delay = 0;
        for (i = 0; i < rattles.size; i++) {
            soundrattlesetup(rattles[i].script_sound, rattles[i].origin);
            delay += 1;
            if (delay % 20 == 0) {
                waitframe(1);
            }
        }
    }
    foreach (rattle in rattles) {
        arrayremovevalue(level.struct, rattle, 1);
    }
    arrayremovevalue(level.struct, undefined, 0);
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x626a4860, Offset: 0x1f10
// Size: 0x14c
function init_audio_triggers(localclientnum) {
    util::waitforclient(localclientnum);
    steptrigs = getentarray(localclientnum, "audio_step_trigger", "targetname");
    materialtrigs = getentarray(localclientnum, "audio_material_trigger", "targetname");
    /#
        if (getdvarint(#"debug_audio", 0) > 0) {
            println("<dev string:x123>" + steptrigs.size + "<dev string:x12f>");
            println("<dev string:x123>" + materialtrigs.size + "<dev string:x147>");
        }
    #/
    array::thread_all(steptrigs, &audio_step_trigger, localclientnum);
    array::thread_all(materialtrigs, &audio_material_trigger, localclientnum);
}

// Namespace audio/audio_shared
// Params 3, eflags: 0x0
// Checksum 0xf083f145, Offset: 0x2068
// Size: 0x14c
function function_a3010aae(ent, on_enter_payload, on_exit_payload) {
    ent endon(#"death");
    if (!isdefined(self)) {
        return;
    }
    myentnum = self getentitynumber();
    wait_time = getdvarfloat(#"hash_497642044cfae073", 1);
    if (ent trigger::ent_already_in(myentnum)) {
        return;
    }
    trigger::add_to_ent(ent, myentnum);
    if (isdefined(on_enter_payload)) {
        [[ on_enter_payload ]](ent);
    }
    while (isdefined(ent) && isdefined(self) && ent istouching(self)) {
        wait wait_time;
    }
    if (isdefined(ent)) {
        if (isdefined(on_exit_payload)) {
            [[ on_exit_payload ]](ent);
        }
        trigger::remove_from_ent(ent, myentnum);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x8342884f, Offset: 0x21c0
// Size: 0xc6
function audio_step_trigger(localclientnum) {
    var_887fc615 = self getentitynumber();
    while (true) {
        waitresult = self waittill(#"trigger");
        if (!waitresult.activator trigger::ent_already_in(var_887fc615)) {
            self thread function_a3010aae(waitresult.activator, &trig_enter_audio_step_trigger, &trig_leave_audio_step_trigger);
        }
        waitframe(1);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xda52eade, Offset: 0x2290
// Size: 0x78
function audio_material_trigger(trig) {
    for (;;) {
        waitresult = self waittill(#"trigger");
        self thread function_a3010aae(waitresult.activator, &trig_enter_audio_material_trigger, &trig_leave_audio_material_trigger);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x12944e49, Offset: 0x2310
// Size: 0x74
function trig_enter_audio_material_trigger(player) {
    if (!isdefined(player.inmaterialoverridetrigger)) {
        player.inmaterialoverridetrigger = 0;
    }
    if (isdefined(self.script_label)) {
        player.inmaterialoverridetrigger++;
        player.audiomaterialoverride = self.script_label;
        player setmaterialoverride(self.script_label);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x41a7e50, Offset: 0x2390
// Size: 0x8c
function trig_leave_audio_material_trigger(player) {
    if (isdefined(self.script_label)) {
        player.inmaterialoverridetrigger--;
        assert(player.inmaterialoverridetrigger >= 0);
        if (player.inmaterialoverridetrigger <= 0) {
            player.audiomaterialoverride = undefined;
            player.inmaterialoverridetrigger = 0;
            player clearmaterialoverride();
        }
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x41b88527, Offset: 0x2428
// Size: 0x154
function trig_enter_audio_step_trigger(trigplayer) {
    localclientnum = self._localclientnum;
    if (!isdefined(trigplayer.insteptrigger)) {
        trigplayer.insteptrigger = 0;
    }
    suffix = "_npc";
    if (trigplayer function_21c0fa55()) {
        suffix = "_plr";
    }
    if (isdefined(self.script_step_alias)) {
        trigplayer.step_sound = self.script_step_alias;
        trigplayer.insteptrigger += 1;
        trigplayer setsteptriggersound(self.script_step_alias + suffix);
    }
    if (isdefined(self.script_step_alias_enter) && trigplayer getmovementtype() == "sprint") {
        volume = get_vol_from_speed(trigplayer);
        trigplayer playsound(localclientnum, self.script_step_alias_enter + suffix, self.origin, volume);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x178e957f, Offset: 0x2588
// Size: 0x174
function trig_leave_audio_step_trigger(trigplayer) {
    localclientnum = self._localclientnum;
    suffix = "_npc";
    if (trigplayer function_21c0fa55()) {
        suffix = "_plr";
    }
    if (isdefined(self.script_step_alias_exit) && trigplayer getmovementtype() == "sprint") {
        volume = get_vol_from_speed(trigplayer);
        trigplayer playsound(localclientnum, self.script_step_alias_exit + suffix, self.origin, volume);
    }
    if (isdefined(self.script_step_alias)) {
        trigplayer.insteptrigger -= 1;
    }
    if (trigplayer.insteptrigger < 0) {
        println("<dev string:x163>");
        trigplayer.insteptrigger = 0;
    }
    if (trigplayer.insteptrigger == 0) {
        trigplayer.step_sound = "none";
        trigplayer clearsteptriggersound();
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x6b837264, Offset: 0x2708
// Size: 0x86
function bump_trigger_start(localclientnum) {
    bump_trigs = getentarray(localclientnum, "audio_bump_trigger", "targetname");
    for (i = 0; i < bump_trigs.size; i++) {
        bump_trigs[i] thread thread_bump_trigger(localclientnum);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x671d0a72, Offset: 0x2798
// Size: 0xb0
function thread_bump_trigger(localclientnum) {
    self thread bump_trigger_listener();
    if (!isdefined(self.script_activated)) {
        self.script_activated = 1;
    }
    self._localclientnum = localclientnum;
    for (;;) {
        waitresult = self waittill(#"trigger");
        self thread trigger::function_thread(waitresult.activator, &trig_enter_bump, &trig_leave_bump);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xe6fc63a6, Offset: 0x2850
// Size: 0x1f4
function trig_enter_bump(ent) {
    if (!isdefined(ent)) {
        return;
    }
    if (!isdefined(self.script_bump_volume_threshold)) {
        self.script_bump_volume_threshold = 0.75;
    }
    localclientnum = self._localclientnum;
    volume = get_vol_from_speed(ent);
    if (!sessionmodeiszombiesgame()) {
        if (isplayer(ent) && ent hasperk(localclientnum, "specialty_quieter")) {
            volume /= 2;
        }
    }
    if (isdefined(self.script_bump_alias) && self.script_activated) {
        self playsound(localclientnum, self.script_bump_alias, self.origin, volume);
    }
    if (isdefined(self.script_bump_alias_soft) && self.script_bump_volume_threshold > volume && self.script_activated) {
        self playsound(localclientnum, self.script_bump_alias_soft, self.origin, volume);
    }
    if (isdefined(self.script_bump_alias_hard) && self.script_bump_volume_threshold <= volume && self.script_activated) {
        self playsound(localclientnum, self.script_bump_alias_hard, self.origin, volume);
    }
    if (isdefined(self.script_mantle_alias) && self.script_activated) {
        ent thread mantle_wait(self.script_mantle_alias, localclientnum);
    }
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0xf1f37169, Offset: 0x2a50
// Size: 0x74
function mantle_wait(alias, localclientnum) {
    self endon(#"death");
    self endon(#"left_mantle");
    self waittill(#"traversesound");
    self playsound(localclientnum, alias, self.origin, 1);
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x2f435f25, Offset: 0x2ad0
// Size: 0x28
function trig_leave_bump(ent) {
    wait 1;
    ent notify(#"left_mantle");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x63ad388, Offset: 0x2b00
// Size: 0x2a
function bump_trigger_listener() {
    if (isdefined(self.script_label)) {
        level waittill(self.script_label);
        self.script_activated = 0;
    }
}

// Namespace audio/audio_shared
// Params 5, eflags: 0x0
// Checksum 0xfdcab30d, Offset: 0x2b38
// Size: 0xbc
function scale_speed(x1, x2, y1, y2, z) {
    if (z < x1) {
        z = x1;
    }
    if (z > x2) {
        z = x2;
    }
    dx = x2 - x1;
    n = (z - x1) / dx;
    dy = y2 - y1;
    w = n * dy + y1;
    return w;
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x5c70d2e6, Offset: 0x2c00
// Size: 0xd2
function get_vol_from_speed(player) {
    min_speed = 20;
    max_speed = 200;
    max_vol = 1;
    min_vol = 0.1;
    speed = player getspeed();
    abs_speed = absolute_value(int(speed));
    volume = scale_speed(min_speed, max_speed, min_vol, max_vol, abs_speed);
    return volume;
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xa8b2735f, Offset: 0x2ce0
// Size: 0x2c
function absolute_value(fowd) {
    if (fowd < 0) {
        return (fowd * -1);
    }
    return fowd;
}

// Namespace audio/audio_shared
// Params 3, eflags: 0x0
// Checksum 0x2ea87427, Offset: 0x2d18
// Size: 0x1da
function closest_point_on_line_to_point(point, linestart, lineend) {
    self endon(#"end line sound");
    linemagsqrd = lengthsquared(lineend - linestart);
    t = ((point[0] - linestart[0]) * (lineend[0] - linestart[0]) + (point[1] - linestart[1]) * (lineend[1] - linestart[1]) + (point[2] - linestart[2]) * (lineend[2] - linestart[2])) / linemagsqrd;
    if (t < 0) {
        self.origin = linestart;
        return;
    }
    if (t > 1) {
        self.origin = lineend;
        return;
    }
    start_x = linestart[0] + t * (lineend[0] - linestart[0]);
    start_y = linestart[1] + t * (lineend[1] - linestart[1]);
    start_z = linestart[2] + t * (lineend[2] - linestart[2]);
    self.origin = (start_x, start_y, start_z);
}

// Namespace audio/audio_shared
// Params 9, eflags: 0x0
// Checksum 0x1a246713, Offset: 0x2f00
// Size: 0x84
function snd_play_auto_fx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override) {
    soundplayautofx(fxid, alias, offsetx, offsety, offsetz, onground, area, threshold, alias_override);
}

/#

    // Namespace audio/audio_shared
    // Params 3, eflags: 0x0
    // Checksum 0xce3ad03c, Offset: 0x2f90
    // Size: 0x74
    function snd_print_fx_id(fxid, type, ent) {
        if (getdvarint(#"debug_audio", 0) > 0) {
            println("<dev string:x1ac>" + fxid + "<dev string:x1c0>" + type);
        }
    }

#/

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x4cb73f09, Offset: 0x3010
// Size: 0x10e
function debug_line_emitter() {
    while (true) {
        /#
            if (getdvarint(#"debug_audio", 0) > 0) {
                line(self.start, self.end, (0, 1, 0));
                print3d(self.start, "<dev string:x1cc>", (0, 0.8, 0), 1, 3, 1);
                print3d(self.end, "<dev string:x1d4>", (0, 0.8, 0), 1, 3, 1);
                print3d(self.origin, self.script_sound, (0, 0.8, 0), 1, 3, 1);
            }
            waitframe(1);
        #/
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x54ce4f92, Offset: 0x3128
// Size: 0x100
function move_sound_along_line() {
    closest_dist = undefined;
    /#
        self thread debug_line_emitter();
    #/
    while (true) {
        self closest_point_on_line_to_point(getlocalclientpos(0), self.start, self.end);
        if (isdefined(self.fake_ent)) {
            self.fake_ent.origin = self.origin;
        }
        closest_dist = distancesquared(getlocalclientpos(0), self.origin);
        if (closest_dist > 1048576) {
            wait 2;
            continue;
        }
        if (closest_dist > 262144) {
            wait 0.2;
            continue;
        }
        wait 0.05;
    }
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0xa94d44e4, Offset: 0x3230
// Size: 0x2c
function playloopat(aliasname, origin) {
    soundloopemitter(aliasname, origin);
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0xd901650e, Offset: 0x3268
// Size: 0x2c
function stoploopat(aliasname, origin) {
    soundstoploopemitter(aliasname, origin);
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x72f5f7aa, Offset: 0x32a0
// Size: 0x34
function soundwait(id) {
    while (soundplaying(id)) {
        wait 0.1;
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x7cadab7, Offset: 0x32e0
// Size: 0x378
function snd_underwater(localclientnum) {
    level endon(#"demo_jump");
    self endon(#"death");
    level endon("killcam_begin" + localclientnum);
    level endon("killcam_end" + localclientnum);
    self endon(#"sndenduwwatcher");
    if (!isdefined(level.audiosharedswimming)) {
        level.audiosharedswimming = 0;
    }
    if (!isdefined(level.audiosharedunderwater)) {
        level.audiosharedunderwater = 0;
    }
    setsoundcontext("water_global", "over");
    if (level.audiosharedswimming != isswimming(localclientnum)) {
        level.audiosharedswimming = isswimming(localclientnum);
        if (level.audiosharedswimming) {
            swimbegin();
        } else {
            swimcancel(localclientnum);
        }
    }
    if (level.audiosharedunderwater != isunderwater(localclientnum)) {
        level.audiosharedunderwater = isunderwater(localclientnum);
        if (level.audiosharedunderwater) {
            self underwaterbegin();
        } else {
            self underwaterend();
        }
    }
    while (true) {
        underwaternotify = self waittill(#"underwater_begin", #"underwater_end", #"swimming_begin", #"swimming_end", #"death", #"sndenduwwatcher");
        if (underwaternotify._notify == "death") {
            self underwaterend();
            self swimend(localclientnum);
        }
        if (underwaternotify._notify == "underwater_begin") {
            self underwaterbegin();
            continue;
        }
        if (underwaternotify._notify == "underwater_end") {
            self underwaterend();
            continue;
        }
        if (underwaternotify._notify == "swimming_begin") {
            self swimbegin();
            continue;
        }
        if (underwaternotify._notify == "swimming_end" && isplayer(self) && isalive(self)) {
            self swimend(localclientnum);
        }
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xb701483e, Offset: 0x3660
// Size: 0x34
function underwaterbegin() {
    level.audiosharedunderwater = 1;
    setsoundcontext("water_global", "under");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xc7cc574e, Offset: 0x36a0
// Size: 0x34
function underwaterend() {
    level.audiosharedunderwater = 0;
    setsoundcontext("water_global", "over");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xb1b19535, Offset: 0x36e0
// Size: 0x12
function swimbegin() {
    self.audiosharedswimming = 1;
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x979b77ff, Offset: 0x3700
// Size: 0x16
function swimend(localclientnum) {
    self.audiosharedswimming = 0;
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0xdaf71915, Offset: 0x3720
// Size: 0x16
function swimcancel(localclientnum) {
    self.audiosharedswimming = 0;
}

// Namespace audio/audio_shared
// Params 2, eflags: 0x0
// Checksum 0x5c46f64b, Offset: 0x3740
// Size: 0xd6
function soundplayuidecodeloop(decodestring, playtimems) {
    if (!isdefined(level.playinguidecodeloop) || !level.playinguidecodeloop) {
        level.playinguidecodeloop = 1;
        fake_ent = spawn(0, (0, 0, 0), "script_origin");
        if (isdefined(fake_ent)) {
            fake_ent playloopsound(#"uin_notify_data_loop");
            wait float(playtimems) / 1000;
            fake_ent stopallloopsounds(0);
        }
        level.playinguidecodeloop = undefined;
    }
}

// Namespace audio/audio_shared
// Params 5, eflags: 0x0
// Checksum 0x4d346761, Offset: 0x3820
// Size: 0x2c
function setcurrentambientstate(ambientroom, ambientpackage, roomcollidercent, packagecollidercent, defaultroom) {
    
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x9e4d87e0, Offset: 0x3858
// Size: 0x44
function isplayerinfected() {
    self endon(#"death");
    self.isinfected = 0;
    setsoundcontext("healthstate", "human");
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0xa9177623, Offset: 0x38a8
// Size: 0x11e
function sndcriticalhealth(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::function_89a98f85();
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    if (!self function_21c0fa55()) {
        return;
    }
    if (!isdefined(self.var_2f6077ac)) {
        self.var_2f6077ac = self.origin;
    }
    if (newval) {
        playsound(localclientnum, #"chr_health_lowhealth_enter", (0, 0, 0));
        playloopat("chr_health_lowhealth_loop", self.var_2f6077ac);
        return;
    }
    stoploopat("chr_health_lowhealth_loop", self.var_2f6077ac);
    self.var_2f6077ac = undefined;
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x77f675bc, Offset: 0x39d0
// Size: 0x11e
function sndlaststand(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    util::function_89a98f85();
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    if (!self function_21c0fa55()) {
        return;
    }
    if (!isdefined(self.sndlaststand)) {
        self.sndlaststand = self.origin;
    }
    if (newval) {
        playsound(localclientnum, #"chr_health_laststand_enter", (0, 0, 0));
        playloopat("chr_health_laststand_loop", self.sndlaststand);
        return;
    }
    stoploopat("chr_health_laststand_loop", self.sndlaststand);
    self.sndlaststand = undefined;
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x3b65bf99, Offset: 0x3af8
// Size: 0x62
function sndtacrig(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.sndtacrigemergencyreserve = 1;
        return;
    }
    self.sndtacrigemergencyreserve = 0;
}

// Namespace audio/audio_shared
// Params 3, eflags: 0x0
// Checksum 0x3c5513f2, Offset: 0x3b68
// Size: 0x6c
function dorattle(origin, min, max) {
    if (isdefined(min) && min > 0) {
        if (isdefined(max) && max <= 0) {
            max = undefined;
        }
        soundrattle(origin, min, max);
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x413ba638, Offset: 0x3be0
// Size: 0xf4
function sndrattle_server(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(self.model) && self.model == #"wpn_t7_bouncing_betty_world") {
            betty = getweapon(#"bouncingbetty");
            level thread dorattle(self.origin, betty.soundrattlerangemin, betty.soundrattlerangemax);
            return;
        }
        level thread dorattle(self.origin, 25, 600);
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x28f24a1, Offset: 0x3ce0
// Size: 0x80
function sndrattle_grenade_client() {
    while (true) {
        waitresult = level waittill(#"explode");
        level thread dorattle(waitresult.position, waitresult.weapon.soundrattlerangemin, waitresult.weapon.soundrattlerangemax);
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x9da52e27, Offset: 0x3d68
// Size: 0xb4
function weapon_butt_sounds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self.meleed = 1;
        level.mysnd = playsound(localclientnum, #"chr_melee_tinitus", (0, 0, 0));
        return;
    }
    self.meleed = 0;
    if (isdefined(level.mysnd)) {
        stopsound(level.mysnd);
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x557243ba, Offset: 0x3e28
// Size: 0x2c
function set_sound_context_defaults() {
    wait 2;
    setsoundcontext("foley", "normal");
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x2b7fb746, Offset: 0x3e60
// Size: 0x114
function sndmatchsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (sessionmodeiswarzonegame()) {
        return;
    }
    if (newval) {
        switch (newval) {
        case 1:
            snd_set_snapshot("mpl_prematch");
            break;
        case 2:
            snd_set_snapshot("mpl_postmatch");
            break;
        case 3:
            snd_set_snapshot("mpl_endmatch");
            break;
        }
        return;
    }
    snd_set_snapshot("default");
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x7d56fdd1, Offset: 0x3f80
// Size: 0x5c
function sndfoleycontext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    setsoundcontext("foley", "normal");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xea308a90, Offset: 0x3fe8
// Size: 0x34
function sndkillcam() {
    level thread sndfinalkillcam_slowdown();
    level thread sndfinalkillcam_deactivate();
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xc4cf332d, Offset: 0x4028
// Size: 0x40
function snddeath_activate() {
    while (true) {
        level waittill(#"sndded");
        snd_set_snapshot("mpl_death");
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x17298893, Offset: 0x4070
// Size: 0x40
function snddeath_deactivate() {
    while (true) {
        level waittill(#"snddede");
        snd_set_snapshot("default");
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xf095c01f, Offset: 0x40b8
// Size: 0x28
function sndfinalkillcam_activate() {
    while (true) {
        level waittill(#"sndfks");
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x2b630ad4, Offset: 0x40e8
// Size: 0x28
function sndfinalkillcam_slowdown() {
    while (true) {
        level waittill(#"sndfksl");
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x5bd3f2b3, Offset: 0x4118
// Size: 0x40
function sndfinalkillcam_deactivate() {
    while (true) {
        level waittill(#"sndfke");
        snd_set_snapshot("default");
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x14a73e2b, Offset: 0x4160
// Size: 0xc4
function sndswitchvehiclecontext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(self)) {
        return;
    }
    if (self isvehicle() && self function_4add50a7()) {
        setsoundcontext("plr_impact", "veh");
        return;
    }
    setsoundcontext("plr_impact", "");
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x2be6cf85, Offset: 0x4230
// Size: 0x1a
function sndmusicdeathwatcher() {
    self waittill(#"death");
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0xf9d54e17, Offset: 0x4258
// Size: 0x1cc
function sndcchacking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        switch (newval) {
        case 1:
            playsound(0, #"gdt_cybercore_hack_start_plr", (0, 0, 0));
            self.hsnd = self playloopsound(#"gdt_cybercore_hack_lp_plr", 0.5);
            break;
        case 2:
            playsound(0, #"gdt_cybercore_prime_upg_plr", (0, 0, 0));
            self.hsnd = self playloopsound(#"gdt_cybercore_prime_loop_plr", 0.5);
            break;
        }
        return;
    }
    if (isdefined(self.hsnd)) {
        self stoploopsound(self.hsnd, 0.5);
    }
    if (oldval == 1) {
        playsound(0, #"gdt_cybercore_hack_success_plr", (0, 0, 0));
        return;
    }
    if (oldval == 2) {
        playsound(0, #"gdt_cybercore_activate_fail_plr", (0, 0, 0));
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0xfaf63152, Offset: 0x4430
// Size: 0x182
function sndigcsnapshot(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        switch (newval) {
        case 1:
            snd_set_snapshot("cmn_igc_bg_lower");
            level.sndigcsnapshotoverride = 0;
            break;
        case 2:
            snd_set_snapshot("cmn_igc_amb_silent");
            level.sndigcsnapshotoverride = 1;
            break;
        case 3:
            snd_set_snapshot("cmn_igc_foley_lower");
            level.sndigcsnapshotoverride = 0;
            break;
        case 4:
            snd_set_snapshot("cmn_level_fadeout");
            level.sndigcsnapshotoverride = 0;
            break;
        case 5:
            snd_set_snapshot("cmn_level_fade_immediate");
            level.sndigcsnapshotoverride = 0;
            break;
        }
        return;
    }
    level.sndigcsnapshotoverride = 0;
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0xa34155bc, Offset: 0x45c0
// Size: 0x64
function sndlevelstartsnapoff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (isdefined(level.sndigcsnapshotoverride) && level.sndigcsnapshotoverride) {
        }
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0xeaa640a, Offset: 0x4630
// Size: 0x5c
function sndzmbfadein(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        snd_set_snapshot("default");
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x459f8366, Offset: 0x4698
// Size: 0xd4
function sndchyronloop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        if (!isdefined(level.chyronloop)) {
            level.chyronloop = spawn(0, (0, 0, 0), "script_origin");
            level.chyronloop playloopsound(#"uin_chyron_loop");
        }
        return;
    }
    if (isdefined(level.chyronloop)) {
        level.chyronloop delete();
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x9e3326a2, Offset: 0x4778
// Size: 0x174
function sndsprintbreath(localclientnum) {
    self endon(#"death");
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        self.var_29054134 = 0;
        var_63112f76 = self dialog_shared::get_player_dialog_alias("exertBreatheSprinting");
        var_dfb6f570 = self dialog_shared::get_player_dialog_alias("exertBreatheSprintingEnd");
        if (!isdefined(var_63112f76) || !isdefined(var_dfb6f570)) {
            return;
        }
        while (true) {
            if (isdefined(self)) {
                if (self isplayersprinting()) {
                    self thread sndbreathstart(var_63112f76);
                    self thread function_ee6d1a7f(var_dfb6f570);
                    waitresult = self waittill(#"hash_4e899fa9b2775b4d", #"death");
                    if (waitresult._notify == "death") {
                        return;
                    }
                }
            }
            wait 0.1;
        }
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x622c2c94, Offset: 0x48f8
// Size: 0x64
function sndbreathstart(sound) {
    self endon(#"hash_4e899fa9b2775b4d");
    self endon(#"death");
    self waittill(#"hash_1d827c5a5cd4a607");
    if (isdefined(self)) {
        self thread function_d6bc7279(sound);
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x68863ea6, Offset: 0x4968
// Size: 0x68
function function_d6bc7279(sound) {
    self endon(#"death");
    self endon(#"hash_4e899fa9b2775b4d");
    self.var_29054134 = 1;
    while (true) {
        self playsound(0, sound);
        wait 2.5;
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x61352ad2, Offset: 0x49d8
// Size: 0x5e
function function_ee6d1a7f(sound) {
    self endon(#"death");
    self waittill(#"hash_4e899fa9b2775b4d");
    if (self.var_29054134) {
        self playsound(0, sound);
        self.var_29054134 = 0;
    }
}

// Namespace audio/audio_shared
// Params 1, eflags: 0x0
// Checksum 0x190f473f, Offset: 0x4a40
// Size: 0x3c
function function_5da61577(localclientnum) {
    self endon(#"death");
    if (isdefined(self)) {
        self thread function_bd07593a();
    }
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0x1477de41, Offset: 0x4a88
// Size: 0xb8
function function_bd07593a() {
    self endon(#"death");
    while (true) {
        if (self util::is_on_side(#"allies")) {
            if (self isplayersprinting()) {
                self playsound(0, #"hash_2dc9c76844261d06");
                wait 1;
            } else {
                self playsound(0, #"hash_70b507d0e243536d");
                wait 2.5;
            }
        }
        wait 0.1;
    }
}

// Namespace audio/audio_shared
// Params 7, eflags: 0x0
// Checksum 0x253bf248, Offset: 0x4b48
// Size: 0x64
function sndvehicledamagealarm(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self notify(#"sndvehicledamagealarm");
    self thread function_350920b9();
}

// Namespace audio/audio_shared
// Params 0, eflags: 0x0
// Checksum 0xc39d473c, Offset: 0x4bb8
// Size: 0xc4
function function_350920b9() {
    self endon(#"death");
    self endon(#"disconnect");
    self endon(#"sndvehicledamagealarm");
    if (!isdefined(self.var_5730fa36)) {
        self.var_5730fa36 = self playloopsound(#"hash_7a6b427867364957");
    }
    wait 2;
    if (isdefined(self.var_5730fa36)) {
        self stoploopsound(self.var_5730fa36);
        self.var_5730fa36 = undefined;
    }
    self playsound(0, #"hash_26a4334032c725cb");
}

