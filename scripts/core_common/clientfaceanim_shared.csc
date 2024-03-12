// Atian COD Tools GSC decompiler test
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace clientfaceanim;

// Namespace clientfaceanim/clientfaceanim_shared
// Params 0, eflags: 0x2
// Checksum 0x1bd8c200, Offset: 0xa0
// Size: 0x34
function autoexec __init__system__() {
    system::register(#"clientfaceanim_shared", undefined, &main, undefined);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd10d252, Offset: 0xe0
// Size: 0x8c
function main() {
    callback::on_spawned(&on_player_spawned);
    callback::on_localclient_connect(&on_localclient_connect);
    buildandvalidatefacialanimationlist(0);
    animation::add_notetrack_func(#"clientfaceanim::deathanimshutdown", &deathanimshutdown);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xc6dc9d58, Offset: 0x178
// Size: 0x24
function private on_localclient_connect(localclientnum) {
    thread update_players(localclientnum);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x4370c0fc, Offset: 0x1a8
// Size: 0x2c
function private on_player_spawned(localclientnum) {
    self callback::on_shutdown(&on_player_shutdown);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x4b857e9a, Offset: 0x1e0
// Size: 0xca
function private on_player_shutdown(localclientnum) {
    if (isplayer(self)) {
        self notify(#"stopfacialthread");
        corpse = self getplayercorpse();
        if (!isdefined(corpse)) {
            return;
        }
        if (isdefined(corpse.facialdeathanimstarted) && corpse.facialdeathanimstarted) {
            return;
        }
        corpse util::waittill_dobj(localclientnum);
        if (isdefined(corpse)) {
            corpse applydeathanim(localclientnum);
            corpse.facialdeathanimstarted = 1;
        }
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x45939e61, Offset: 0x2b8
// Size: 0x3c0
function buildandvalidatefacialanimationlist(localclientnum) {
    if (!isdefined(level.__clientfacialanimationslist)) {
        level.__clientfacialanimationslist = [];
        level.__clientfacialanimationslist[#"combat"] = array(#"ai_t8_face_hero_generic_idle_1", #"ai_t8_face_hero_generic_idle_2", #"ai_t8_face_hero_generic_idle_3");
        level.__clientfacialanimationslist[#"combat_shoot"] = array(#"ai_t8_face_hero_aim_fire_1", #"ai_t8_face_hero_aim_fire_2");
        level.__clientfacialanimationslist[#"death"] = array(#"ai_t8_face_hero_dth_1", #"ai_t8_face_hero_dth_2", #"ai_t8_face_hero_dth_3");
        level.__clientfacialanimationslist[#"melee"] = array(#"ai_t8_face_hero_melee_1");
        level.__clientfacialanimationslist[#"pain"] = array(#"ai_t8_face_hero_pain_1");
        level.__clientfacialanimationslist[#"swimming"] = array(#"mp_t8_face_hero_swim_idle_1");
        level.__clientfacialanimationslist[#"jumping"] = array(#"mp_t8_face_hero_jump_idle_1");
        level.__clientfacialanimationslist[#"sliding"] = array(#"mp_t8_face_hero_slides_1");
        level.__clientfacialanimationslist[#"sprinting"] = array(#"mp_t8_face_hero_sprint_1");
        level.__clientfacialanimationslist[#"wallrunning"] = array(#"mp_t8_face_hero_wall_run_1");
        deathanims = level.__clientfacialanimationslist[#"death"];
        foreach (deathanim in deathanims) {
            /#
                assert(!isanimlooping(localclientnum, deathanim), "<unknown string>" + deathanim + "<unknown string>");
            #/
        }
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xadb30eae, Offset: 0x680
// Size: 0x154
function private facialanimationthink_getwaittime(localclientnum) {
    min_wait = 0.1;
    max_wait = 1;
    min_wait_distance_sq = 2500;
    max_wait_distance_sq = 640000;
    if (self function_21c0fa55() && !isthirdperson(localclientnum)) {
        return max_wait;
    }
    local_player = function_5c10bd79(localclientnum);
    if (!isdefined(local_player)) {
        return max_wait;
    }
    distancesq = distancesquared(local_player.origin, self.origin);
    if (distancesq > max_wait_distance_sq) {
        distance_factor = 1;
    } else if (distancesq < min_wait_distance_sq) {
        distance_factor = 0;
    } else {
        distance_factor = (distancesq - min_wait_distance_sq) / (max_wait_distance_sq - min_wait_distance_sq);
    }
    return (max_wait - min_wait) * distance_factor + min_wait;
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x32fbbe91, Offset: 0x7e0
// Size: 0x216
function private function_26ff990a(local_client_num) {
    max_players = 10;
    max_distance = 2000;
    var_62cc2a1a = max_distance * max_distance;
    camera_origin = getcamposbylocalclientnum(local_client_num);
    players = getplayers(local_client_num);
    players = arraysort(players, camera_origin);
    first_person = function_d17ae3cc(local_client_num);
    time = gettime();
    count = 0;
    foreach (player in players) {
        waitframe(1);
        if (!isdefined(player)) {
            return;
        }
        if (first_person && player function_21c0fa55()) {
            continue;
        }
        if (player.team == #"spectator") {
            continue;
        }
        distance_sq = distancesquared(camera_origin, player.origin);
        if (distance_sq > var_62cc2a1a) {
            return;
        }
        if ((isdefined(player.var_a0161fed) ? player.var_a0161fed : 0) < time) {
            updatefacialanimforplayer(local_client_num, player);
        }
        count++;
        if (count == max_players) {
            return;
        }
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xe9680cf7, Offset: 0xa00
// Size: 0x62
function private update_players(local_client_num) {
    var_40425722 = 1;
    while (1) {
        function_26ff990a(local_client_num);
        if (isdemoplaying()) {
            waitframe(1);
            continue;
        }
        wait(var_40425722);
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x9796691c, Offset: 0xa70
// Size: 0x316
function private updatefacialanimforplayer(localclientnum, player) {
    if (!isdefined(player._currentfacestate)) {
        player._currentfacestate = "inactive";
    }
    if (!player hasdobj(localclientnum)) {
        return;
    }
    if (!isplayer(player)) {
        return;
    }
    if (isdefined(player function_bee2bbc7()) && player function_bee2bbc7()) {
        return;
    }
    currfacestate = player._currentfacestate;
    nextfacestate = player._currentfacestate;
    currenttime = gettime();
    if (player isinscritpedanim()) {
        clearallfacialanims(localclientnum);
        player._currentfacestate = "inactive";
        return;
    }
    if (player isplayerdead()) {
        nextfacestate = #"death";
    } else if (player isplayerfiring()) {
        nextfacestate = #"combat_shoot";
    } else if (player isplayersliding()) {
        nextfacestate = #"sliding";
    } else if (player isplayerwallrunning()) {
        nextfacestate = #"wallrunning";
    } else if (player isplayersprinting()) {
        nextfacestate = #"sprinting";
    } else if (player isplayerjumping() || player isplayerdoublejumping()) {
        nextfacestate = #"jumping";
    } else if (player isplayerswimming()) {
        nextfacestate = #"swimming";
    } else {
        nextfacestate = #"combat";
    }
    if (player._currentfacestate == "inactive" || currfacestate != nextfacestate) {
        /#
            assert(isdefined(level.__clientfacialanimationslist[nextfacestate]));
        #/
        player applynewfaceanim(localclientnum, array::random(level.__clientfacialanimationslist[nextfacestate]));
        player._currentfacestate = nextfacestate;
    }
    player.var_a0161fed = gettime() + player facialanimationthink_getwaittime(localclientnum);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x717534, Offset: 0xd90
// Size: 0x7c
function private applynewfaceanim(localclientnum, animation) {
    clearallfacialanims(localclientnum);
    if (isdefined(animation)) {
        self._currentfaceanim = animation;
        self setflaggedanimknob(#"ai_secondary_facial_anim", animation, 0.9, 0.1, 1);
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xba69bd84, Offset: 0xe18
// Size: 0xbc
function private applydeathanim(localclientnum) {
    if (isdefined(self._currentfacestate) && self._currentfacestate == #"death") {
        return;
    }
    if (isdefined(self) && isdefined(level.__clientfacialanimationslist) && isdefined(level.__clientfacialanimationslist[#"death"])) {
        self._currentfacestate = #"death";
        applynewfaceanim(localclientnum, array::random(level.__clientfacialanimationslist[#"death"]));
    }
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x58e4a504, Offset: 0xee0
// Size: 0x34
function private deathanimshutdown(notifystring, param3) {
    self clearallfacialanims(self.localclientnum);
}

// Namespace clientfaceanim/clientfaceanim_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x85f74583, Offset: 0xf20
// Size: 0x5e
function private clearallfacialanims(localclientnum) {
    if (isdefined(self._currentfaceanim) && self hasdobj(localclientnum)) {
        self clearanim(self._currentfaceanim, 0.2);
    }
    self._currentfaceanim = undefined;
}

