// Atian COD Tools GSC decompiler test
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace voice;

// Namespace voice/voice
// Params 0, eflags: 0x2
// Checksum 0xac688999, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"voice", &__init__, undefined, undefined);
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0xaf50b7e8, Offset: 0x130
// Size: 0x8c
function __init__() {
    callback::on_connect(&on_player_connect);
    level.var_3e8bd5c = [];
    if (!isdefined(level.scr_sound)) {
        level.scr_sound = [];
    }
    /#
        if (!isprofilebuild()) {
            setdvar(#"hash_5a4f3b089c68658f", 1);
        }
    #/
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x72cac1bb, Offset: 0x1c8
// Size: 0x48
function on_player_connect() {
    self init_character(undefined, "J_Head");
    if (isdefined(level.var_151fd2ac)) {
        self thread [[ level.var_151fd2ac ]]();
    }
}

// Namespace voice/voice
// Params 1, eflags: 0x0
// Checksum 0x754ecbe6, Offset: 0x218
// Size: 0xc
function function_4c866f3d(table) {
    
}

// Namespace voice/voice
// Params 3, eflags: 0x0
// Checksum 0xfcea91a9, Offset: 0x230
// Size: 0x1c
function add(chrname, scriptkey, alias) {
    
}

// Namespace voice/voice
// Params 2, eflags: 0x0
// Checksum 0xaad548b9, Offset: 0x258
// Size: 0x14
function add_igc(scriptid, alias) {
    
}

// Namespace voice/voice
// Params 3, eflags: 0x1 linked
// Checksum 0x4a79cfe0, Offset: 0x278
// Size: 0xda
function init_character(chrname, var_bd68a08e, var_f4aa7514 = 0) {
    /#
        assert(isentity(self), "<unknown string>");
    #/
    /#
        assert(isplayer(self) || isdefined(chrname), "<unknown string>");
    #/
    if (isdefined(self)) {
        self.var_3975c22 = chrname;
        self.var_bd68a08e = var_bd68a08e;
        self.var_556f910a = [];
        self.var_78566c82 = 0;
        self.var_46b25f4f = var_f4aa7514;
    }
}

// Namespace voice/voice
// Params 1, eflags: 0x0
// Checksum 0x60d4debd, Offset: 0x360
// Size: 0x1a
function set_portrait(portraitid) {
    self.var_54d07407 = portraitid;
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x26d2d9a6, Offset: 0x388
// Size: 0x1c
function playing() {
    if (!isdefined(self.var_556f910a)) {
        return false;
    }
    return isdefined(self.var_47282775);
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x1ee43cd2, Offset: 0x3b0
// Size: 0x20
function pending() {
    if (!isdefined(self.var_556f910a)) {
        return false;
    }
    return self.var_556f910a.size > 0;
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x515c9a57, Offset: 0x3d8
// Size: 0x2e
function stop() {
    if (self playing()) {
        self notify(#"voice_stop");
    }
}

// Namespace voice/voice
// Params 1, eflags: 0x0
// Checksum 0x76cd5c54, Offset: 0x410
// Size: 0x138
function stop_all(team) {
    stop = [];
    foreach (speaker in level.var_3e8bd5c) {
        if (isdefined(team) && team != #"any" && team != speaker.team) {
            continue;
        }
        stop[stop.size] = speaker;
    }
    foreach (speaker in stop) {
        speaker stop();
    }
}

// Namespace voice/voice
// Params 3, eflags: 0x0
// Checksum 0xc6eb6c86, Offset: 0x550
// Size: 0x308
function play(scriptkey, var_17ee4803 = undefined, var_7f436309 = 0) {
    if (!isdefined(self) || issentient(self) && !isalive(self)) {
        return false;
    }
    /#
        assert(isdefined(self.var_556f910a), "<unknown string>");
    #/
    if (isstring(scriptkey)) {
        scriptkey = tolower(scriptkey);
    }
    alias = undefined;
    if (var_7f436309) {
        /#
            assert(isdefined(self.var_46b25f4f) && self.var_46b25f4f, "<unknown string>");
        #/
        a_aliases = self function_5f8e1b94(scriptkey);
        if (isdefined(self.var_6946d662)) {
            var_ae215d05 = a_aliases.size == 1 && a_aliases[0] == self.var_6946d662;
            if (var_ae215d05) {
                alias = self.var_6946d662;
            } else {
                a_aliases = array::exclude(a_aliases, self.var_6946d662);
                alias = array::random(a_aliases);
            }
        } else {
            alias = array::random(a_aliases);
        }
    } else {
        alias = self get_chr_alias(scriptkey);
    }
    voice = spawnstruct();
    voice.scriptkey = scriptkey;
    voice.params = function_73613736(scriptkey);
    voice.alias = alias;
    voice.var_17ee4803 = var_17ee4803;
    if (isdefined(self.var_46b25f4f) && self.var_46b25f4f && isdefined(alias)) {
        self.var_6946d662 = alias;
    }
    if (!playing() && !pending()) {
        self thread start_pending();
    }
    function_93932552(voice);
    return isdefined(alias);
}

// Namespace voice/voice
// Params 0, eflags: 0x5 linked
// Checksum 0x3196f2f4, Offset: 0x860
// Size: 0xcc
function private start_pending() {
    self endoncallback(&function_9db28e7, #"death", #"entering_last_stand", #"disconnect", #"voice_stop");
    level endon(#"game_ended");
    level.var_3e8bd5c[level.var_3e8bd5c.size] = self;
    while (isdefined(self.var_78566c82) && self.var_78566c82) {
        waitframe(1);
    }
    waittillframeend();
    if (isdefined(self)) {
        self thread play_next();
    }
}

// Namespace voice/voice
// Params 0, eflags: 0x5 linked
// Checksum 0x40526a4f, Offset: 0x938
// Size: 0x51c
function private play_next() {
    self endoncallback(&end_play_next, #"death", #"entering_last_stand", #"disconnect", #"voice_stop");
    level endon(#"game_ended");
    voice = function_777704ce();
    if (!isdefined(voice)) {
        self end_play_next();
        return;
    }
    self function_7924f3ca();
    self.var_47282775 = voice;
    if (isdefined(self.archetype) && (self.archetype == #"human" || self.archetype == #"human_riotshield" || self.archetype == #"human_rpg" || self.archetype == #"civilian")) {
        self clientfield::set("facial_dial", 1);
    }
    if (isdefined(voice.alias) && getdvarint(#"hash_49f50ad33517adfd", 1) == 1) {
        soundent = self playsoundwithnotify(voice.alias, "voice_done", self.var_bd68a08e);
        self mask_sound(soundent, voice.params, voice.var_17ee4803);
        self waittill(#"voice_done");
        self notify(voice.scriptkey);
    } else if (isdefined(voice.alias)) {
        self notify(#"voice_done");
        self notify(voice.scriptkey);
    }
    if (!isdefined(voice.alias) && getdvarint(#"hash_5a4f3b089c68658f", 0) == 1 || getdvarint(#"hash_71fefd466102ebff", 0) == 1) {
        tempname = self.var_3975c22;
        if (!isdefined(tempname) && isplayer(self)) {
            tempname = self getchrname();
        }
        if (!isdefined(tempname)) {
            tempname = "Unknown";
        }
        str_line = tempname + ": " + voice.scriptkey;
        n_wait_time = (strtok(voice.scriptkey, " ").size - 1) / 2;
        n_wait_time = math::clamp(n_wait_time, 2, 5);
        if (isdefined(voice.var_17ee4803) && isentity(voice.var_17ee4803)) {
            voice.var_17ee4803 thread function_9b502d8d(str_line, n_wait_time);
        } else {
            a_e_teammates = getplayers(self.team);
            foreach (e_player in a_e_teammates) {
                if (isbot(e_player)) {
                    continue;
                }
                e_player thread function_9b502d8d(str_line, n_wait_time);
            }
        }
        self notify(#"voice_done");
        self notify(voice.scriptkey);
    }
    self end_play_next();
}

// Namespace voice/voice
// Params 2, eflags: 0x5 linked
// Checksum 0xd9439f03, Offset: 0xe60
// Size: 0xf4
function private function_9b502d8d(str_line, n_wait_time) {
    self endon(#"disconnect");
    self notify(#"hash_3a2cea55af16657f");
    self endon(#"hash_3a2cea55af16657f");
    if (!isdefined(self getluimenu("TempDialog"))) {
        self openluimenu("TempDialog");
    }
    self waittilltimeout(n_wait_time, #"death");
    if (isdefined(self getluimenu("TempDialog"))) {
        self closeluimenu(self getluimenu("TempDialog"));
    }
}

// Namespace voice/voice
// Params 1, eflags: 0x5 linked
// Checksum 0x69ba2172, Offset: 0xf60
// Size: 0x5c
function private function_9db28e7(notifyhash) {
    if (isdefined(notifyhash)) {
        self function_7924f3ca();
        self notify(#"voice_done");
    }
    arrayremovevalue(level.var_3e8bd5c, self);
}

// Namespace voice/voice
// Params 1, eflags: 0x5 linked
// Checksum 0xe0bc2e99, Offset: 0xfc8
// Size: 0x1ae
function private end_play_next(notifyhash) {
    self function_9db28e7();
    if (isdefined(notifyhash)) {
        self thread stop_playing();
        self notify(#"voice_done");
        if (isdefined(self.var_47282775) && isstring(self.var_47282775.scriptkey)) {
            self notify(self.var_47282775.scriptkey);
        }
    }
    self.var_47282775 = undefined;
    if (isactor(self) && isdefined(self.archetype) && (self.archetype == #"human" || self.archetype == #"human_riotshield" || self.archetype == #"human_rpg" || self.archetype == #"civilian")) {
        self clientfield::set("facial_dial", 0);
    }
    if (isdefined(self.var_556f910a) && self.var_556f910a.size > 0) {
        play_next();
        return;
    }
    self notify(#"hash_296a16c4cf068a53");
}

// Namespace voice/voice
// Params 0, eflags: 0x5 linked
// Checksum 0x4584d1a6, Offset: 0x1180
// Size: 0x66
function private stop_playing() {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self.var_78566c82 = 1;
    self stopsounds();
    waitframe(1);
    if (isdefined(self)) {
        self.var_78566c82 = 0;
    }
}

// Namespace voice/voice
// Params 0, eflags: 0x4
// Checksum 0x337850e2, Offset: 0x11f0
// Size: 0x26
function private clear_queue() {
    array::delete_all(self.var_556f910a);
    self.var_556f910a = [];
}

// Namespace voice/voice
// Params 0, eflags: 0x5 linked
// Checksum 0x84240f84, Offset: 0x1220
// Size: 0xfa
function private function_7924f3ca() {
    self endon(#"death", #"disconnect");
    if (isdefined(self.var_556f910a)) {
        for (i = 0; i < self.var_556f910a.size; i++) {
            if (isdefined(self.var_556f910a[i]) && isdefined(self.var_556f910a[i].scriptkey)) {
                b_queue = isdefined(self.var_556f910a[i].params) ? self.var_556f910a[i].params.queue : 0;
                if (!b_queue) {
                    arrayremoveindex(self.var_556f910a, i);
                    continue;
                }
            }
        }
    }
}

// Namespace voice/voice
// Params 3, eflags: 0x5 linked
// Checksum 0xf48ab7c0, Offset: 0x1328
// Size: 0x2ec
function private mask_sound(soundent, params, var_17ee4803) {
    mask = isdefined(params) ? params.mask : #"all";
    if (mask == #"all") {
        if (isdefined(self.var_54d07407)) {
            foreach (player in getplayers()) {
                self show_portrait_to(player);
            }
        }
        return;
    }
    soundent hide();
    if (mask == #"friendly") {
        foreach (player in getplayers()) {
            if (player.team == self.team) {
                self play_to(soundent, player);
            }
        }
    } else if (mask == #"enemy") {
        foreach (player in getplayers()) {
            if (player.team != self.team) {
                self play_to(soundent, player);
            }
        }
    } else if (mask == #"self") {
        if (isplayer(self)) {
            self play_to(soundent, player);
        }
    }
    if (isdefined(var_17ee4803) && isplayer(var_17ee4803)) {
        self play_to(soundent, var_17ee4803);
    }
}

// Namespace voice/voice
// Params 2, eflags: 0x5 linked
// Checksum 0x55b48499, Offset: 0x1620
// Size: 0x54
function private play_to(soundent, player) {
    if (isdefined(soundent)) {
        soundent showtoplayer(player);
    }
    if (isdefined(self.var_54d07407)) {
        self show_portrait_to(player);
    }
}

// Namespace voice/voice
// Params 1, eflags: 0x5 linked
// Checksum 0xf93f724f, Offset: 0x1680
// Size: 0x54
function private show_portrait_to(player) {
    player luinotifyevent(#"offsite_comms_message", 1, self.var_54d07407);
    player thread close_portrait(self);
}

// Namespace voice/voice
// Params 1, eflags: 0x5 linked
// Checksum 0xaf459e7f, Offset: 0x16e0
// Size: 0xac
function private close_portrait(speaker) {
    self endon(#"disconnect");
    level endon(#"game_ended");
    speaker waittill(#"death", #"entering_last_stand", #"disconnect", #"voice_stop", #"voice_done");
    self luinotifyevent(#"offsite_comms_complete");
}

// Namespace voice/voice
// Params 1, eflags: 0x0
// Checksum 0x730d258c, Offset: 0x1798
// Size: 0x3b8
function play_notetrack(scriptid) {
    alias = function_7897846a(scriptid);
    if (!isdefined(alias)) {
        return;
    }
    if (isdefined(self gettagorigin("J_Head"))) {
        soundent = self playsoundwithnotify(alias, "voice_done", "J_Head");
    } else {
        soundent = self playsoundwithnotify(alias, "voice_done");
    }
    if (!self flagsys::get(#"scene")) {
        return;
    }
    if (isdefined(self._scene_object) && isdefined(self._scene_object._o_scene) && isdefined(self._scene_object._o_scene._str_team)) {
        str_team = self._scene_object._o_scene._str_team;
    } else {
        str_team = self._scene_object._str_team;
    }
    if (isdefined(str_team) && str_team != #"any") {
        soundent hide();
        foreach (player in getplayers()) {
            if (isdefined(player._scene_object) && isdefined(player._scene_object._o_scene) && isdefined(self._scene_object._o_scene) && player._scene_object._o_scene == self._scene_object._o_scene) {
                self play_to(soundent, player);
                continue;
            }
            if (!isdefined(player._scene_object) && isdefined(player.var_e3d6d713) && isdefined(self._scene_object._o_scene) && player.var_e3d6d713 == self._scene_object._o_scene._str_name) {
                self play_to(soundent, player);
                continue;
            }
            if (self flagsys::get(#"hash_e2ce599b208682a") && self util::is_on_side(player.team) || self flagsys::get(#"hash_f21f320f68c0457") && !self util::is_on_side(player.team)) {
                self play_to(soundent, player);
            }
        }
    }
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x50505a7a, Offset: 0x1b58
// Size: 0x52
function function_29b858dc() {
    chrname = self.var_3975c22;
    if (!isdefined(chrname) && isplayer(self)) {
        chrname = self getchrname();
    }
    return chrname;
}

// Namespace voice/voice
// Params 1, eflags: 0x1 linked
// Checksum 0x7baa5213, Offset: 0x1bb8
// Size: 0x82
function get_chr_alias(scriptkey) {
    chrname = self function_29b858dc();
    if (!isdefined(chrname)) {
        return undefined;
    }
    aliases = function_b7854c63(chrname, scriptkey);
    if (aliases.size == 0) {
        return undefined;
    }
    return array::random(aliases);
}

// Namespace voice/voice
// Params 1, eflags: 0x1 linked
// Checksum 0x560d350b, Offset: 0x1c48
// Size: 0x52
function function_5f8e1b94(scriptkey) {
    chrname = self function_29b858dc();
    if (!isdefined(chrname)) {
        return undefined;
    }
    return function_b7854c63(chrname, scriptkey);
}

// Namespace voice/voice
// Params 0, eflags: 0x0
// Checksum 0xd4991f8f, Offset: 0x1ca8
// Size: 0x50
function function_e2a07e55() {
    return isdefined(level.handlers) && isdefined(level.handlers[#"allies"]) && isdefined(level.handlers[#"axis"]);
}

// Namespace voice/voice
// Params 0, eflags: 0x0
// Checksum 0x3a6fb080, Offset: 0x1d00
// Size: 0x50
function function_42a109b9() {
    return isdefined(level.commanders) && isdefined(level.commanders[#"allies"]) && isdefined(level.commanders[#"axis"]);
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0xfac5d9af, Offset: 0x1d58
// Size: 0x30
function function_a36ee9b7() {
    if (isdefined(self.var_556f910a) && self.var_556f910a.size > 0) {
        return self.var_556f910a[0];
    }
    return undefined;
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0xa6f3c50b, Offset: 0x1d90
// Size: 0x40
function function_17945809() {
    if (isdefined(self.var_556f910a) && self.var_556f910a.size > 0) {
        return self.var_556f910a[self.var_556f910a.size - 1];
    }
    return undefined;
}

// Namespace voice/voice
// Params 1, eflags: 0x1 linked
// Checksum 0x2f33068d, Offset: 0x1dd8
// Size: 0x252
function function_93932552(s_voice) {
    if (isdefined(self.var_556f910a)) {
        interrupt = isdefined(s_voice.params) ? s_voice.params.interrupt : 0;
        priority = function_8e0c80fb(s_voice);
        if (isdefined(interrupt) && interrupt && isdefined(self.var_47282775)) {
            if (priority > function_8e0c80fb(self.var_47282775)) {
                self stop();
                arrayinsert(self.var_556f910a, s_voice, 0);
                return;
            }
        }
        if (self.var_556f910a.size == 0) {
            arrayinsert(self.var_556f910a, s_voice, 0);
            return;
        }
        if (priority > function_8e0c80fb(function_a36ee9b7())) {
            arrayinsert(self.var_556f910a, s_voice, 0);
            return;
        }
        if (priority <= function_8e0c80fb(function_17945809())) {
            arrayinsert(self.var_556f910a, s_voice, self.var_556f910a.size);
            return;
        }
        for (i = 0; i < self.var_556f910a.size; i++) {
            if (priority <= function_8e0c80fb(self.var_556f910a[i]) && priority > function_8e0c80fb(self.var_556f910a[i + 1])) {
                arrayinsert(self.var_556f910a, s_voice, i + 1);
                break;
            }
        }
    }
}

// Namespace voice/voice
// Params 0, eflags: 0x1 linked
// Checksum 0x1af46c1a, Offset: 0x2038
// Size: 0x68
function function_777704ce() {
    voice = undefined;
    if (isdefined(self.var_556f910a) && self.var_556f910a.size > 0) {
        voice = function_a36ee9b7();
        arrayremoveindex(self.var_556f910a, 0);
    }
    return voice;
}

// Namespace voice/voice
// Params 1, eflags: 0x1 linked
// Checksum 0x30c67c61, Offset: 0x20a8
// Size: 0x52
function function_8e0c80fb(s_voice) {
    if (!isdefined(s_voice.params) || !isdefined(s_voice.params.priority)) {
        return 0;
    }
    return s_voice.params.priority;
}

