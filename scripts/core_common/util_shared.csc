// Atian COD Tools GSC decompiler test
#using script_72d4466ce2e2cc7b;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace util;

// Namespace util/util_shared
// Params 0, eflags: 0x2
// Checksum 0x8883e8a7, Offset: 0x180
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"util_shared", &__init__, undefined, undefined);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7a494189, Offset: 0x1c8
// Size: 0x34
function __init__() {
    function_73fab74d();
    register_clientfields();
    namespace_1e38a8f6::init();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc307ae88, Offset: 0x208
// Size: 0x124
function register_clientfields() {
    clientfield::register("world", "cf_team_mapping", 1, 1, "int", &cf_team_mapping, 0, 0);
    clientfield::register("world", "preload_frontend", 1, 1, "int", &preload_frontend, 0, 0);
    clientfield::register("allplayers", "ClearStreamerLoadingHints", 1, 1, "int", &function_7d955209, 0, 0);
    clientfield::register("allplayers", "StreamerSetSpawnHintIndex", 1, 4, "int", &function_4fdf4063, 1, 0);
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x24cafc00, Offset: 0x338
// Size: 0x74
function function_7d955209(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!self function_21c0fa55()) {
        return;
    }
    if (newval) {
        clearstreamerloadinghints();
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x9a333604, Offset: 0x3b8
// Size: 0x6c
function function_4fdf4063(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!self function_21c0fa55()) {
        return;
    }
    streamersetspawnhintindex(newval);
}

// Namespace util/util_shared
// Params 5, eflags: 0x0
// Checksum 0x8bee5f57, Offset: 0x430
// Size: 0x2c
function empty(a, b, c, d, e) {
    
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x88e46073, Offset: 0x468
// Size: 0x86
function waitforallclients() {
    localclient = 0;
    if (!isdefined(level.localplayers)) {
        while (!isdefined(level.localplayers)) {
            waitframe(1);
        }
    }
    while (level.localplayers.size <= 0) {
        waitframe(1);
    }
    while (localclient < level.localplayers.size) {
        waitforclient(localclient);
        localclient++;
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x19b7cb13, Offset: 0x4f8
// Size: 0x86
function function_89a98f85() {
    num = getdvarint(#"splitscreen_playercount", 0);
    if (num < 1) {
        num = 1;
    }
    num = 1;
    for (localclient = 0; localclient < num; localclient++) {
        waitforclient(localclient);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x24d7d44d, Offset: 0x588
// Size: 0x30
function waitforclient(client) {
    while (!clienthassnapshot(client)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0xd182709f, Offset: 0x5c0
// Size: 0x62
function get_dvar_float_default(str_dvar, default_val) {
    value = getdvarstring(str_dvar);
    return value != "" ? float(value) : default_val;
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x7a2333b8, Offset: 0x630
// Size: 0x62
function get_dvar_int_default(str_dvar, default_val) {
    value = getdvarstring(str_dvar);
    return value != "" ? int(value) : default_val;
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x5358dce2, Offset: 0x6a0
// Size: 0x9e
function spawn_model(n_client, str_model, origin = (0, 0, 0), angles = (0, 0, 0)) {
    model = spawn(n_client, origin, "script_model");
    if (isdefined(model)) {
        model setmodel(str_model);
        model.angles = angles;
    }
    return model;
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xd45c1ad4, Offset: 0x748
// Size: 0x8a
function spawn_anim_model(n_client, model_name, origin, angles) {
    model = spawn_model(n_client, model_name, origin, angles);
    if (isdefined(model)) {
        model useanimtree("generic");
        model.animtree = "generic";
    }
    return model;
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0xc4821c09, Offset: 0x7e0
// Size: 0x80
function waittill_string(msg, ent) {
    if (msg != "death") {
        self endon(#"death");
    }
    ent endon(#"die");
    self waittill(msg);
    ent notify(#"returned", {#msg:msg});
}

// Namespace util/util_shared
// Params 1, eflags: 0x20
// Checksum 0xdced80e1, Offset: 0x868
// Size: 0x9c
function waittill_multiple(...) {
    s_tracker = spawnstruct();
    s_tracker._wait_count = 0;
    for (i = 0; i < vararg.size; i++) {
        self thread _waitlogic(s_tracker, vararg[i]);
    }
    if (s_tracker._wait_count > 0) {
        s_tracker waittill(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6e59a47b, Offset: 0x910
// Size: 0x2a
function waittill_either(msg1, msg2) {
    self endon(msg1);
    self waittill(msg2);
}

// Namespace util/util_shared
// Params 1, eflags: 0x20
// Checksum 0xcc5573d9, Offset: 0x948
// Size: 0x1c4
function waittill_multiple_ents(...) {
    a_ents = [];
    a_notifies = [];
    for (i = 0; i < vararg.size; i++) {
        if (i % 2) {
            if (!isdefined(a_notifies)) {
                a_notifies = [];
            } else if (!isarray(a_notifies)) {
                a_notifies = array(a_notifies);
            }
            a_notifies[a_notifies.size] = vararg[i];
            continue;
        }
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        a_ents[a_ents.size] = vararg[i];
    }
    s_tracker = spawnstruct();
    s_tracker._wait_count = 0;
    for (i = 0; i < a_ents.size; i++) {
        ent = a_ents[i];
        if (isdefined(ent)) {
            ent thread _waitlogic(s_tracker, a_notifies[i]);
        }
    }
    if (s_tracker._wait_count > 0) {
        s_tracker waittill(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa1f3caca, Offset: 0xb18
// Size: 0xb0
function _waitlogic(s_tracker, notifies) {
    s_tracker._wait_count++;
    if (!isdefined(notifies)) {
        notifies = [];
    } else if (!isarray(notifies)) {
        notifies = array(notifies);
    }
    notifies[notifies.size] = "death";
    self waittill(notifies);
    s_tracker._wait_count--;
    if (s_tracker._wait_count == 0) {
        s_tracker notify(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 14, eflags: 0x1 linked
// Checksum 0xb6392dff, Offset: 0xbd0
// Size: 0x166
function waittill_any_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    assert(isdefined(ent1));
    assert(isdefined(string1));
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 endon(string3);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 endon(string4);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 endon(string5);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 endon(string6);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 endon(string7);
    }
    ent1 waittill(string1);
}

// Namespace util/util_shared
// Params b, eflags: 0x0
// Checksum 0xd0f2b581, Offset: 0xd40
// Size: 0x12e
function function_e532f5da(n_timeout, ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5) {
    assert(isdefined(n_timeout));
    assert(isdefined(ent1));
    assert(isdefined(string1));
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 endon(string3);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 endon(string4);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 endon(string5);
    }
    ent1 waittilltimeout(n_timeout, string1);
}

// Namespace util/util_shared
// Params 4, eflags: 0x0
// Checksum 0xb6c232bf, Offset: 0xe78
// Size: 0x80
function waittill_any_ents_two(ent1, string1, ent2, string2) {
    assert(isdefined(ent1));
    assert(isdefined(string1));
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    ent1 waittill(string1);
}

// Namespace util/util_shared
// Params 3, eflags: 0x21 linked
// Checksum 0x844e9b0f, Offset: 0xf00
// Size: 0x3a
function single_func(entity, func, ...) {
    return _single_func(entity, func, vararg);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x59303815, Offset: 0xf48
// Size: 0x3a
function single_func_argarray(entity, func, a_vars) {
    return _single_func(entity, func, a_vars);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4f21f77f, Offset: 0xf90
// Size: 0x53a
function _single_func(entity, func, a_vars) {
    _clean_up_arg_array(a_vars);
    switch (a_vars.size) {
    case 8:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        }
        break;
    case 7:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        }
        break;
    case 6:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        }
        break;
    case 5:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        }
        break;
    case 4:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        }
        break;
    case 3:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        }
        break;
    case 2:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1]);
        }
        break;
    case 1:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0]);
        } else {
            return [[ func ]](a_vars[0]);
        }
        break;
    case 0:
        if (isdefined(entity)) {
            return entity [[ func ]]();
        } else {
            return [[ func ]]();
        }
        break;
    default:
        assertmsg("<unknown string>");
        break;
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb3246877, Offset: 0x14d8
// Size: 0x6e
function _clean_up_arg_array(&a_vars) {
    for (i = a_vars.size - 1; i >= 0; i--) {
        if (a_vars[i] === undefined) {
            arrayremoveindex(a_vars, i, 0);
            continue;
        }
        break;
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x0
// Checksum 0x28bb6d69, Offset: 0x1550
// Size: 0xca
function new_func(func, arg1, arg2, arg3, arg4, arg5, arg6) {
    s_func = spawnstruct();
    s_func.func = func;
    s_func.arg1 = arg1;
    s_func.arg2 = arg2;
    s_func.arg3 = arg3;
    s_func.arg4 = arg4;
    s_func.arg5 = arg5;
    s_func.arg6 = arg6;
    return s_func;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x9d339d9, Offset: 0x1628
// Size: 0x72
function call_func(s_func) {
    return single_func(self, s_func.func, s_func.arg1, s_func.arg2, s_func.arg3, s_func.arg4, s_func.arg5, s_func.arg6);
}

// Namespace util/util_shared
// Params 7, eflags: 0x0
// Checksum 0xd95e78b9, Offset: 0x16a8
// Size: 0x164
function array_ent_thread(entities, func, arg1, arg2, arg3, arg4, arg5) {
    assert(isdefined(entities), "<unknown string>");
    assert(isdefined(func), "<unknown string>");
    if (isarray(entities)) {
        if (entities.size) {
            foreach (entity in entities) {
                single_thread(self, func, entity, arg1, arg2, arg3, arg4, arg5);
            }
        }
        return;
    }
    single_thread(self, func, entities, arg1, arg2, arg3, arg4, arg5);
}

// Namespace util/util_shared
// Params 8, eflags: 0x1 linked
// Checksum 0x616b1008, Offset: 0x1818
// Size: 0x162
function single_thread(entity, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    assert(isdefined(entity), "<unknown string>");
    if (isdefined(arg6)) {
        entity thread [[ func ]](arg1, arg2, arg3, arg4, arg5, arg6);
        return;
    }
    if (isdefined(arg5)) {
        entity thread [[ func ]](arg1, arg2, arg3, arg4, arg5);
        return;
    }
    if (isdefined(arg4)) {
        entity thread [[ func ]](arg1, arg2, arg3, arg4);
        return;
    }
    if (isdefined(arg3)) {
        entity thread [[ func ]](arg1, arg2, arg3);
        return;
    }
    if (isdefined(arg2)) {
        entity thread [[ func ]](arg1, arg2);
        return;
    }
    if (isdefined(arg1)) {
        entity thread [[ func ]](arg1);
        return;
    }
    entity thread [[ func ]]();
}

// Namespace util/util_shared
// Params 7, eflags: 0x0
// Checksum 0xa48fbdd, Offset: 0x1988
// Size: 0x6c
function add_listen_thread(wait_till, func, param1, param2, param3, param4, param5) {
    level thread add_listen_thread_internal(wait_till, func, param1, param2, param3, param4, param5);
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x997c351, Offset: 0x1a00
// Size: 0x78
function add_listen_thread_internal(wait_till, func, param1, param2, param3, param4, param5) {
    for (;;) {
        level waittill(wait_till);
        single_thread(level, func, param1, param2, param3, param4, param5);
    }
}

// Namespace util/util_shared
// Params 8, eflags: 0x1 linked
// Checksum 0x1ca0d811, Offset: 0x1a80
// Size: 0xe4
function timeout(n_time, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self endon(#"death");
    if (isdefined(n_time)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s delay_notify(n_time, "timeout");
    }
    single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0xe96d36a5, Offset: 0x1b70
// Size: 0x84
function delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self thread _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0x8e7c531e, Offset: 0x1c00
// Size: 0xe4
function _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self endon(#"death");
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    if (ishash(time_or_notify) || isstring(time_or_notify)) {
        self waittill(time_or_notify);
    } else {
        wait(time_or_notify);
    }
    single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x3594fe03, Offset: 0x1cf0
// Size: 0x3c
function delay_notify(time_or_notify, str_notify, str_endon) {
    self thread _delay_notify(time_or_notify, str_notify, str_endon);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xae147cab, Offset: 0x1d38
// Size: 0x8e
function _delay_notify(time_or_notify, str_notify, str_endon) {
    self endon(#"death");
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    if (ishash(time_or_notify) || isstring(time_or_notify)) {
        self waittill(time_or_notify);
    } else {
        wait(time_or_notify);
    }
    self notify(str_notify);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd78e84be, Offset: 0x1dd0
// Size: 0x46
function new_timer(n_timer_length) {
    s_timer = spawnstruct();
    s_timer.n_time_created = gettime();
    s_timer.n_length = n_timer_length;
    return s_timer;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe77c5b, Offset: 0x1e20
// Size: 0x20
function get_time() {
    t_now = gettime();
    return t_now - self.n_time_created;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x73df9c7d, Offset: 0x1e48
// Size: 0x34
function get_time_in_seconds() {
    return float(get_time()) / 1000;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x6a9ec4f6, Offset: 0x1e88
// Size: 0x4a
function get_time_frac(n_end_time = self.n_length) {
    return lerpfloat(0, 1, get_time_in_seconds() / n_end_time);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc0a6215e, Offset: 0x1ee0
// Size: 0x58
function get_time_left() {
    if (isdefined(self.n_length)) {
        n_current_time = get_time_in_seconds();
        return max(self.n_length - n_current_time, 0);
    }
    return -1;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xe77b5cb0, Offset: 0x1f40
// Size: 0x16
function is_time_left() {
    return get_time_left() != 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbad04a46, Offset: 0x1f60
// Size: 0x62
function timer_wait(n_wait) {
    if (isdefined(self.n_length)) {
        n_wait = min(n_wait, get_time_left());
    }
    wait(n_wait);
    n_current_time = get_time_in_seconds();
    return n_current_time;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x9e21daf0, Offset: 0x1fd0
// Size: 0x84
function add_remove_list(&a = [], on_off) {
    if (on_off) {
        if (!isinarray(a, self)) {
            arrayinsert(a, self, a.size);
        }
        return;
    }
    arrayremovevalue(a, self, 0);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaf63c87e, Offset: 0x2060
// Size: 0x24
function clean_deleted(&array) {
    arrayremovevalue(array, undefined);
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x91b771ce, Offset: 0x2090
// Size: 0xe2
function get_eye() {
    if (sessionmodeiscampaigngame()) {
        if (isplayer(self)) {
            linked_ent = self getlinkedent();
            if (isdefined(linked_ent) && getdvarint(#"cg_camerausetagcamera", 0) > 0) {
                camera = linked_ent gettagorigin("tag_camera");
                if (isdefined(camera)) {
                    return camera;
                }
            }
        }
    }
    pos = self geteye();
    return pos;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x1515ccc2, Offset: 0x2180
// Size: 0xb0
function spawn_player_arms() {
    arms = spawn(self getlocalclientnumber(), self.origin + (0, 0, -1000), "script_model");
    if (isdefined(level.player_viewmodel)) {
        arms setmodel(level.player_viewmodel);
    } else {
        arms setmodel(#"c_usa_cia_masonjr_viewhands");
    }
    return arms;
}

// Namespace util/util_shared
// Params 7, eflags: 0x0
// Checksum 0x6559679a, Offset: 0x2238
// Size: 0x142
function lerp_dvar(str_dvar, n_start_val = getdvarfloat(str_dvar, 0), n_end_val, n_lerp_time, b_saved_dvar, b_client_dvar, n_client = 0) {
    s_timer = new_timer();
    do {
        n_time_delta = s_timer timer_wait(0.01666);
        n_curr_val = lerpfloat(n_start_val, n_end_val, n_time_delta / n_lerp_time);
        if (isdefined(b_saved_dvar) && b_saved_dvar) {
            setsaveddvar(str_dvar, n_curr_val);
            continue;
        }
        setdvar(str_dvar, n_curr_val);
    } while (n_time_delta < n_lerp_time);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xfeef3ffd, Offset: 0x2388
// Size: 0x1e
function is_valid_type_for_callback(type) {
    switch (type) {
    case #"scriptmover":
    case #"na":
    case #"missile":
    case #"general":
    case #"player":
    case #"turret":
    case #"actor":
    case #"helicopter":
    case #"trigger":
    case #"vehicle":
    case #"plane":
        return true;
    default:
        return false;
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x26fd6eb2, Offset: 0x2480
// Size: 0xa8
function wait_till_not_touching(e_to_check, e_to_touch) {
    assert(isdefined(e_to_check), "<unknown string>");
    assert(isdefined(e_to_touch), "<unknown string>");
    e_to_check endon(#"death");
    e_to_touch endon(#"death");
    while (e_to_check istouching(e_to_touch)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xa6e4ec1d, Offset: 0x2530
// Size: 0x32
function error(message) {
    /#
        println("<unknown string>", message);
        waitframe(1);
    #/
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x7380bcd4, Offset: 0x2570
// Size: 0xe2
function register_system(ssysname, cbfunc) {
    if (!isdefined(level._systemstates)) {
        level._systemstates = [];
    }
    if (level._systemstates.size >= 32) {
        /#
            error("<unknown string>");
        #/
        return;
    }
    if (isdefined(level._systemstates[ssysname])) {
        /#
            error("<unknown string>" + ssysname);
        #/
        return;
    }
    level._systemstates[ssysname] = spawnstruct();
    level._systemstates[ssysname].callback = cbfunc;
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x9c2ed3a9, Offset: 0x2660
// Size: 0x4a
function field_set_lighting_ent(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    level.light_entity = self;
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x52f9a85b, Offset: 0x26b8
// Size: 0x3c
function field_use_lighting_ent(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd54ddf1f, Offset: 0x2700
// Size: 0x3c
function waittill_dobj(localclientnum) {
    while (isdefined(self) && !self hasdobj(localclientnum)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xbd7bb5c3, Offset: 0x2748
// Size: 0x6e
function playfxontag(localclientnum, effect, entity, tagname) {
    if (isdefined(entity) && entity hasdobj(localclientnum)) {
        return function_239993de(localclientnum, effect, entity, tagname);
    }
    return undefined;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x42e9e73e, Offset: 0x27c0
// Size: 0x34
function function_6d0694af() {
    while (isdefined(self) && !self function_700ca4f5()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xe9a1765e, Offset: 0x2800
// Size: 0x174
function server_wait(localclientnum, seconds, waitbetweenchecks, level_endon) {
    if (isdefined(level_endon)) {
        level endon(level_endon);
    }
    if (seconds != 0 && isdemoplaying()) {
        if (!isdefined(waitbetweenchecks)) {
            waitbetweenchecks = 0.2;
        }
        waitcompletedsuccessfully = 0;
        starttime = getservertime(0);
        lasttime = starttime;
        endtime = starttime + int(seconds * 1000);
        while (getservertime(0) < endtime && getservertime(0) >= lasttime) {
            lasttime = getservertime(0);
            wait(waitbetweenchecks);
        }
        if (lasttime < getservertime(0)) {
            waitcompletedsuccessfully = 1;
        }
    } else {
        wait(seconds);
        waitcompletedsuccessfully = 1;
    }
    return waitcompletedsuccessfully;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xafd07e2d, Offset: 0x2980
// Size: 0x8c
function get_other_team(str_team) {
    if (str_team == #"allies") {
        return #"axis";
    } else if (str_team == #"axis") {
        return #"allies";
    } else {
        return #"allies";
    }
    assertmsg("<unknown string>" + str_team);
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc244d7e3, Offset: 0x2a18
// Size: 0x66
function function_fbce7263(team_a, team_b) {
    if (team_a === team_b) {
        return false;
    }
    if (!isdefined(team_a) || !isdefined(team_b)) {
        return true;
    }
    if (function_b37afded(team_a, team_b)) {
        return false;
    }
    return true;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe790f3d, Offset: 0x2a88
// Size: 0x2a
function isenemyteam(team) {
    return function_fbce7263(team, self.team);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x341a2899, Offset: 0x2ac0
// Size: 0xba
function isenemyplayer(player) {
    assert(isdefined(player));
    if (!isplayer(player)) {
        return false;
    }
    if (player.team != "free") {
        if (player.team === self.team) {
            return false;
        }
        if (function_b37afded(player.team, self.team)) {
            return false;
        }
    } else if (player == self) {
        return false;
    }
    return true;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x37a30443, Offset: 0x2b88
// Size: 0xd2
function function_50ed1561(localclientnum) {
    function_89a98f85();
    if (!isdefined(self)) {
        return false;
    }
    if (!self function_21c0fa55()) {
        return false;
    }
    if (function_65b9eb0f(localclientnum)) {
        return false;
    }
    if (localclientnum !== self getlocalclientnumber()) {
        return false;
    }
    if (isdefined(level.localplayers[localclientnum]) && self getentitynumber() != level.localplayers[localclientnum] getentitynumber()) {
        return false;
    }
    return true;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x74435ee6, Offset: 0x2c68
// Size: 0x4e
function is_player_view_linked_to_entity(localclientnum) {
    if (function_fd3d58c7(localclientnum)) {
        return true;
    }
    if (function_e75c64a4(localclientnum)) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x93096822, Offset: 0x2cc0
// Size: 0x12
function get_start_time() {
    return getmicrosecondsraw();
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x2eaab399, Offset: 0x2ce0
// Size: 0x12c
function note_elapsed_time(start_time, label = "unspecified") {
    /#
        elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
        if (!isdefined(start_time)) {
            return;
        }
        elapsed_time = elapsed_time * 0.001;
        if (!isdefined(level.orbis)) {
            level.orbis = getdvarstring(#"orbisgame") == "<unknown string>";
        }
        if (!level.orbis) {
            elapsed_time = int(elapsed_time);
        }
        msg = label + "<unknown string>" + elapsed_time + "<unknown string>";
        profileprintln(msg);
        iprintlnbold(msg);
    #/
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xec9c5d7c, Offset: 0x2e18
// Size: 0x98
function record_elapsed_time(start_time, &elapsed_time_array) {
    elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
    if (!isdefined(elapsed_time_array)) {
        elapsed_time_array = [];
    } else if (!isarray(elapsed_time_array)) {
        elapsed_time_array = array(elapsed_time_array);
    }
    elapsed_time_array[elapsed_time_array.size] = elapsed_time;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa5f501ee, Offset: 0x2eb8
// Size: 0x2c4
function note_elapsed_times(&elapsed_time_array, label = "unspecified") {
    /#
        if (!isarray(elapsed_time_array)) {
            return;
        }
        msg = label + "<unknown string>" + elapsed_time_array.size;
        profileprintln(msg);
        if (elapsed_time_array.size == 0) {
            return;
        }
        if (!isdefined(level.orbis)) {
            level.orbis = getdvarstring(#"orbisgame") == "<unknown string>";
        }
        total_elapsed_time = 0;
        smallest_elapsed_time = 2147483647;
        largest_elapsed_time = 0;
        foreach (elapsed_time in elapsed_time_array) {
            elapsed_time = elapsed_time * 0.001;
            total_elapsed_time = total_elapsed_time + elapsed_time;
            if (elapsed_time < smallest_elapsed_time) {
                smallest_elapsed_time = elapsed_time;
            }
            if (elapsed_time > largest_elapsed_time) {
                largest_elapsed_time = elapsed_time;
            }
            if (!level.orbis) {
                elapsed_time = int(elapsed_time);
            }
            msg = label + "<unknown string>" + elapsed_time + "<unknown string>";
            profileprintln(msg);
        }
        average_elapsed_time = total_elapsed_time / elapsed_time_array.size;
        msg = label + "<unknown string>" + average_elapsed_time + "<unknown string>";
        profileprintln(msg);
        iprintlnbold(msg);
        msg = label + "<unknown string>" + largest_elapsed_time + "<unknown string>";
        profileprintln(msg);
        msg = label + "<unknown string>" + smallest_elapsed_time + "<unknown string>";
        profileprintln(msg);
    #/
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3cca13c1, Offset: 0x3188
// Size: 0x70
function get_elapsed_time(start_time, end_time = getmicrosecondsraw()) {
    if (!isdefined(start_time)) {
        return undefined;
    }
    elapsed_time = end_time - start_time;
    if (elapsed_time < 0) {
        elapsed_time = elapsed_time + -2147483648;
    }
    return elapsed_time;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x97581336, Offset: 0x3200
// Size: 0xde
function init_utility() {
    level.isdemoplaying = isdemoplaying();
    level.localplayers = [];
    level.numgametypereservedobjectives = [];
    level.releasedobjectives = [];
    maxlocalclients = getmaxlocalclients();
    for (localclientnum = 0; localclientnum < maxlocalclients; localclientnum++) {
        level.releasedobjectives[localclientnum] = [];
        level.numgametypereservedobjectives[localclientnum] = 0;
    }
    waitforclient(0);
    level.localplayers = getlocalplayers();
}

// Namespace util/util_shared
// Params 4, eflags: 0x0
// Checksum 0x9f2ad62, Offset: 0x32e8
// Size: 0x90
function within_fov(start_origin, start_angles, end_origin, fov) {
    normal = vectornormalize(end_origin - start_origin);
    forward = anglestoforward(start_angles);
    dot = vectordot(forward, normal);
    return dot >= fov;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfadc46af, Offset: 0x3380
// Size: 0x12
function is_mature() {
    return ismaturecontentenabled();
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xd84e1550, Offset: 0x33a0
// Size: 0x12
function function_fa1da5cb() {
    return isshowbloodenabled();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb13a98ee, Offset: 0x33c0
// Size: 0x12
function function_2c435484() {
    return function_4e803413();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe00b12fb, Offset: 0x33e0
// Size: 0x38
function is_gib_restricted_build() {
    if (!(ismaturecontentenabled() && isshowgibsenabled())) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x5a5c94f7, Offset: 0x3420
// Size: 0x22
function function_cd6c95db(localclientnum) {
    return function_d6e37bb1(localclientnum);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x685b82c8, Offset: 0x3450
// Size: 0x22
function function_a0819fe3(localclientnum) {
    return colorblindmode(localclientnum);
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xcb47e023, Offset: 0x3480
// Size: 0xe2
function registersystem(ssysname, cbfunc) {
    if (!isdefined(level._systemstates)) {
        level._systemstates = [];
    }
    if (level._systemstates.size >= 32) {
        /#
            error("<unknown string>");
        #/
        return;
    }
    if (isdefined(level._systemstates[ssysname])) {
        /#
            error("<unknown string>" + ssysname);
        #/
        return;
    }
    level._systemstates[ssysname] = spawnstruct();
    level._systemstates[ssysname].callback = cbfunc;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x53a0f42e, Offset: 0x3570
// Size: 0x5a
function add_trigger_to_ent(ent, trig) {
    if (!isdefined(ent._triggers)) {
        ent._triggers = [];
    }
    ent._triggers[trig getentitynumber()] = 1;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf7bb8947, Offset: 0x35d8
// Size: 0x72
function remove_trigger_from_ent(ent, trig) {
    if (!isdefined(ent._triggers)) {
        return;
    }
    if (!isdefined(ent._triggers[trig getentitynumber()])) {
        return;
    }
    ent._triggers[trig getentitynumber()] = 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x76f3fb4b, Offset: 0x3658
// Size: 0x70
function ent_already_in_trigger(trig) {
    if (!isdefined(self._triggers)) {
        return false;
    }
    if (!isdefined(self._triggers[trig getentitynumber()])) {
        return false;
    }
    if (!self._triggers[trig getentitynumber()]) {
        return false;
    }
    return true;
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0x96182bcf, Offset: 0x36d0
// Size: 0xf4
function trigger_thread(ent, on_enter_payload, on_exit_payload) {
    ent endon(#"death");
    if (ent ent_already_in_trigger(self)) {
        return;
    }
    add_trigger_to_ent(ent, self);
    if (isdefined(on_enter_payload)) {
        [[ on_enter_payload ]](ent);
    }
    while (isdefined(ent) && ent istouching(self)) {
        waitframe(1);
    }
    if (isdefined(ent) && isdefined(on_exit_payload)) {
        [[ on_exit_payload ]](ent);
    }
    if (isdefined(ent)) {
        remove_trigger_from_ent(ent, self);
    }
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0x3b2f9249, Offset: 0x37d0
// Size: 0xec
function local_player_trigger_thread_always_exit(ent, on_enter_payload, on_exit_payload) {
    if (ent ent_already_in_trigger(self)) {
        return;
    }
    add_trigger_to_ent(ent, self);
    if (isdefined(on_enter_payload)) {
        [[ on_enter_payload ]](ent);
    }
    while (isdefined(ent) && ent istouching(self) && ent issplitscreenhost()) {
        waitframe(1);
    }
    if (isdefined(on_exit_payload)) {
        [[ on_exit_payload ]](ent);
    }
    if (isdefined(ent)) {
        remove_trigger_from_ent(ent, self);
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xab8218f, Offset: 0x38c8
// Size: 0x9c
function local_player_entity_thread(localclientnum, entity, func, arg1, arg2, arg3, arg4) {
    entity endon(#"death");
    entity waittill_dobj(localclientnum);
    single_thread(entity, func, localclientnum, arg1, arg2, arg3, arg4);
}

// Namespace util/util_shared
// Params 6, eflags: 0x0
// Checksum 0xa1ec6c6d, Offset: 0x3970
// Size: 0xa6
function local_players_entity_thread(entity, func, arg1, arg2, arg3, arg4) {
    players = level.localplayers;
    for (i = 0; i < players.size; i++) {
        players[i] thread local_player_entity_thread(i, entity, func, arg1, arg2, arg3, arg4);
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x0
// Checksum 0x3a2d0d2, Offset: 0x3a20
// Size: 0xb4
function debug_line(from, to, color, time) {
    /#
        level.debug_line = getdvarint(#"scr_debug_line", 0);
        if (isdefined(level.debug_line) && level.debug_line == 1) {
            if (!isdefined(time)) {
                time = 1000;
            }
            line(from, to, color, 1, 1, time);
        }
    #/
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0xa778da05, Offset: 0x3ae0
// Size: 0xb4
function debug_star(origin, color, time) {
    /#
        level.debug_star = getdvarint(#"scr_debug_star", 0);
        if (isdefined(level.debug_star) && level.debug_star == 1) {
            if (!isdefined(time)) {
                time = 1000;
            }
            if (!isdefined(color)) {
                color = (1, 1, 1);
            }
            debugstar(origin, time, color);
        }
    #/
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x33fdda38, Offset: 0x3ba0
// Size: 0x10c
function getnextobjid(localclientnum) {
    nextid = 0;
    if (level.releasedobjectives[localclientnum].size > 0) {
        nextid = level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size - 1];
        level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size - 1] = undefined;
    } else {
        nextid = level.numgametypereservedobjectives[localclientnum];
        level.numgametypereservedobjectives[localclientnum]++;
    }
    /#
        if (nextid > 31) {
            println("<unknown string>");
        }
        assert(nextid < 32);
    #/
    if (nextid > 31) {
        nextid = 31;
    }
    return nextid;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5e918b78, Offset: 0x3cb8
// Size: 0xb8
function releaseobjid(localclientnum, objid) {
    assert(objid < level.numgametypereservedobjectives[localclientnum]);
    for (i = 0; i < level.releasedobjectives[localclientnum].size; i++) {
        if (objid == level.releasedobjectives[localclientnum][i]) {
            return;
        }
    }
    level.releasedobjectives[localclientnum][level.releasedobjectives[localclientnum].size] = objid;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x1ac01af1, Offset: 0x3d78
// Size: 0x28
function is_safehouse(str_next_map = get_map_name()) {
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xfef668f7, Offset: 0x3da8
// Size: 0x11a
function button_held_think(which_button) {
    /#
        self endon(#"disconnect");
        if (!isdefined(self._holding_button)) {
            self._holding_button = [];
        }
        self._holding_button[which_button] = 0;
        time_started = 0;
        while (true) {
            if (self._holding_button[which_button]) {
                if (!self [[ level._button_funcs[which_button] ]]()) {
                    self._holding_button[which_button] = 0;
                }
            } else if (self [[ level._button_funcs[which_button] ]]()) {
                if (time_started == 0) {
                    time_started = gettime();
                }
                if (gettime() - time_started > 250) {
                    self._holding_button[which_button] = 1;
                }
            } else if (time_started != 0) {
                time_started = 0;
            }
            waitframe(1);
        }
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xc81906ad, Offset: 0x3ed0
// Size: 0x56
function init_button_wrappers() {
    /#
        if (!isdefined(level._button_funcs)) {
            level._button_funcs[4] = &up_button_pressed;
            level._button_funcs[5] = &down_button_pressed;
        }
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x7840351e, Offset: 0x3f30
// Size: 0x62
function up_button_held() {
    /#
        init_button_wrappers();
        if (!isdefined(self._up_button_think_threaded)) {
            self thread button_held_think(4);
            self._up_button_think_threaded = 1;
        }
        return self._holding_button[4];
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x3885b8aa, Offset: 0x3fa0
// Size: 0x62
function down_button_held() {
    /#
        init_button_wrappers();
        if (!isdefined(self._down_button_think_threaded)) {
            self thread button_held_think(5);
            self._down_button_think_threaded = 1;
        }
        return self._holding_button[5];
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x5c8e3b58, Offset: 0x4010
// Size: 0x46
function up_button_pressed() {
    /#
        return self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>");
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xd5e23911, Offset: 0x4060
// Size: 0x28
function waittill_up_button_pressed() {
    /#
        while (!self up_button_pressed()) {
            waitframe(1);
        }
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xe7fc8d90, Offset: 0x4090
// Size: 0x46
function down_button_pressed() {
    /#
        return self buttonpressed("<unknown string>") || self buttonpressed("<unknown string>");
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x8b7950dc, Offset: 0x40e0
// Size: 0x28
function waittill_down_button_pressed() {
    /#
        while (!self down_button_pressed()) {
            waitframe(1);
        }
    #/
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xacae7c1b, Offset: 0x4110
// Size: 0x6c
function function_4c1656d5() {
    if (sessionmodeiswarzonegame()) {
        return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
    }
    return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x1229f819, Offset: 0x4188
// Size: 0x124
function function_16fb0a3b() {
    if (sessionmodeiswarzonegame()) {
        if (getdvarint(#"hash_23a1d3a9139af42b", 0) > 0) {
            return getdvarfloat(#"hash_608e7bb0e9517884", 250);
        } else {
            return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
        }
        return;
    }
    if (getdvarint(#"hash_23fac9a913e70c03", 0) > 0) {
        return getdvarfloat(#"hash_606c79b0e9348eb8", 250);
    }
    return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

// Namespace util/util_shared
// Params 4, eflags: 0x21 linked
// Checksum 0x3d618388, Offset: 0x42b8
// Size: 0x17c
function lerp_generic(localclientnum, duration, callback, ...) {
    starttime = getservertime(localclientnum);
    currenttime = starttime;
    elapsedtime = 0;
    defaultargs = array(currenttime, elapsedtime, localclientnum, duration);
    args = arraycombine(defaultargs, vararg, 1, 0);
    while (elapsedtime < duration) {
        if (isdefined(callback)) {
            args[0] = currenttime;
            args[1] = elapsedtime;
            _single_func(undefined, callback, args);
        }
        waitframe(1);
        currenttime = getservertime(localclientnum);
        if (currenttime < starttime) {
            return;
        }
        elapsedtime = currenttime - starttime;
    }
    if (isdefined(callback)) {
        args[0] = currenttime;
        args[1] = duration;
        _single_func(undefined, callback, args);
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6d6e50b6, Offset: 0x4440
// Size: 0x6a
function function_c16f65a3(enemy_a, enemy_b) {
    assert(enemy_a != enemy_b, "<unknown string>");
    level.team_enemy_mapping[enemy_a] = enemy_b;
    level.team_enemy_mapping[enemy_b] = enemy_a;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbc753075, Offset: 0x44b8
// Size: 0xb4
function function_73fab74d() {
    if (isdefined(level.var_1bbf77be)) {
        return;
    }
    level.var_1bbf77be = 1;
    function_c16f65a3(#"allies", #"axis");
    function_c16f65a3(#"team3", #"any");
    set_team_mapping(#"allies", #"axis");
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x4e1b25b3, Offset: 0x4578
// Size: 0x122
function cf_team_mapping(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 0:
        set_team_mapping(#"axis", #"allies");
        break;
    case 1:
        set_team_mapping(#"allies", #"axis");
        break;
    default:
        set_team_mapping(#"allies", #"axis");
        break;
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x4af7d58b, Offset: 0x46a8
// Size: 0x5c
function preload_frontend(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 1) {
        preloadfrontend();
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3f804329, Offset: 0x4710
// Size: 0x292
function set_team_mapping(str_team_for_sidea, str_team_for_sideb) {
    if (str_team_for_sidea == #"allies") {
        str_team_for_sidea = #"allies";
    } else if (str_team_for_sidea == #"axis") {
        str_team_for_sidea = #"axis";
    }
    if (str_team_for_sideb == #"axis") {
        str_team_for_sideb = #"axis";
    } else if (str_team_for_sideb == #"allies") {
        str_team_for_sideb = #"allies";
    }
    assert(str_team_for_sidea != str_team_for_sideb, "<unknown string>");
    level.team_mapping[#"sidea"] = str_team_for_sidea;
    level.team_mapping[#"sideb"] = str_team_for_sideb;
    level.team_mapping[#"attacker"] = str_team_for_sidea;
    level.team_mapping[#"defender"] = str_team_for_sideb;
    level.team_mapping[#"attackers"] = str_team_for_sidea;
    level.team_mapping[#"defenders"] = str_team_for_sideb;
    level.team_mapping[#"wun"] = #"allies";
    level.team_mapping[#"fpa"] = #"axis";
    level.team_mapping[#"teama"] = level.team_mapping[#"sidea"];
    level.team_mapping[#"teamb"] = level.team_mapping[#"sideb"];
    level.team_mapping[#"side3"] = #"team3";
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x36d0b874, Offset: 0x49b0
// Size: 0x62
function get_team_mapping(str_team) {
    assert(isdefined(str_team));
    if (isdefined(level.team_mapping)) {
        result = level.team_mapping[str_team];
        if (isdefined(result)) {
            return result;
        }
    }
    return str_team;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x72d1bdb6, Offset: 0x4a20
// Size: 0x7a
function get_enemy_team(team) {
    team = get_team_mapping(team);
    if (!isdefined(team)) {
        return undefined;
    }
    if (isdefined(level.team_enemy_mapping) && isdefined(level.team_enemy_mapping[team])) {
        return level.team_enemy_mapping[team];
    }
    return #"none";
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x2cdb38fd, Offset: 0x4aa8
// Size: 0x13e
function function_35aed314(teama, teamb) {
    teama = get_team_mapping(teama);
    teamb = get_team_mapping(teamb);
    if (!isdefined(teama) || !isdefined(teamb)) {
        return false;
    }
    if (teama == teamb) {
        return false;
    }
    if (isdefined(level.team_enemy_mapping)) {
        if (isdefined(level.team_enemy_mapping[teama])) {
            if (#"any" == level.team_enemy_mapping[teama]) {
                return true;
            }
            if (teamb == level.team_enemy_mapping[teama]) {
                return true;
            }
        }
        if (isdefined(level.team_enemy_mapping[teamb])) {
            if (#"any" == level.team_enemy_mapping[teamb]) {
                return true;
            }
            if (teama == level.team_enemy_mapping[teamb]) {
                return true;
            }
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xba87db86, Offset: 0x4bf0
// Size: 0x24
function is_on_side(str_team) {
    return self.team === get_team_mapping(str_team);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x48c206bc, Offset: 0x4c20
// Size: 0x32
function get_game_type() {
    return tolower(getdvarstring(#"g_gametype"));
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1a5ef152, Offset: 0x4c60
// Size: 0x32
function get_map_name() {
    return tolower(getdvarstring(#"sv_mapname"));
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x637a394c, Offset: 0x4ca0
// Size: 0x1c
function is_frontend_map() {
    return get_map_name() === "core_frontend";
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbbeef6a2, Offset: 0x4cc8
// Size: 0x96
function function_26489405() {
    isnightmap = 0;
    mapname = get_map_name();
    switch (mapname) {
    case #"mp_casino":
        isnightmap = 1;
        break;
    case #"mp_austria":
        isnightmap = 1;
        break;
    default:
        break;
    }
    return isnightmap;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xca020cc2, Offset: 0x4d68
// Size: 0x7c
function function_8570168d() {
    /#
        if (getdvar(#"hash_49e94b7aefac4f49", 0)) {
            return true;
        }
    #/
    if (sessionmodeismultiplayergame()) {
        mode = function_bea73b01();
        if (mode == 4) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x230d820c, Offset: 0x4df0
// Size: 0x34
function is_arena_lobby() {
    mode = function_bea73b01();
    if (mode == 3) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x91e05915, Offset: 0x4e30
// Size: 0x15a
function script_wait() {
    n_time = gettime();
    if (isdefined(self.script_wait)) {
        wait(self.script_wait);
        if (isdefined(self.script_wait_add)) {
            self.script_wait = self.script_wait + self.script_wait_add;
        }
    }
    n_min = isdefined(self.script_wait_min) ? self.script_wait_min : 0;
    n_max = isdefined(self.script_wait_max) ? self.script_wait_max : 0;
    if (n_max > n_min) {
        wait(randomfloatrange(n_min, n_max));
        self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
        self.script_wait_max = self.script_wait_max + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
    } else if (n_min > 0) {
        wait(n_min);
        self.script_wait_min = self.script_wait_min + (isdefined(self.script_wait_add) ? self.script_wait_add : 0);
    }
    return gettime() - n_time;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x9cf5eadf, Offset: 0x4f98
// Size: 0x96
function lock_model(model) {
    if (isdefined(model)) {
        if (!isdefined(level.model_locks)) {
            level.model_locks = [];
        }
        if (!isdefined(level.model_locks[model])) {
            level.model_locks[model] = 0;
        }
        if (level.model_locks[model] < 1) {
            forcestreamxmodel(model);
        }
        level.model_locks[model]++;
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x2a8ef3ce, Offset: 0x5038
// Size: 0x9c
function unlock_model(model) {
    if (!isdefined(level.model_locks)) {
        level.model_locks = [];
    }
    if (isdefined(model) && isdefined(level.model_locks[model])) {
        if (level.model_locks[model] > 0) {
            level.model_locks[model]--;
            if (level.model_locks[model] < 1) {
                stopforcestreamingxmodel(model);
            }
        }
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd7ad60c5, Offset: 0x50e0
// Size: 0x1f4
function function_48e57e36(var_1f1d12d8) {
    base = 1;
    decimal = 0;
    for (i = var_1f1d12d8.size - 1; i >= 0; i--) {
        if (var_1f1d12d8[i] >= "0" && var_1f1d12d8[i] <= "9") {
            decimal = decimal + int(var_1f1d12d8[i]) * base;
            base = base * 16;
            continue;
        }
        if (var_1f1d12d8[i] >= "a" && var_1f1d12d8[i] <= "f") {
            if (var_1f1d12d8[i] == "a") {
                number = 10;
            } else if (var_1f1d12d8[i] == "b") {
                number = 11;
            } else if (var_1f1d12d8[i] == "c") {
                number = 12;
            } else if (var_1f1d12d8[i] == "d") {
                number = 13;
            } else if (var_1f1d12d8[i] == "e") {
                number = 14;
            } else if (var_1f1d12d8[i] == "f") {
                number = 15;
            }
            decimal = decimal + number * base;
            base = base * 16;
        }
    }
    return decimal;
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0xf9d0bd1c, Offset: 0x52e0
// Size: 0x5c
function add_devgui(localclientnum, menu_path, commands) {
    /#
        adddebugcommand(localclientnum, "<unknown string>" + menu_path + "<unknown string>" + commands + "<unknown string>");
    #/
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0xa50d1339, Offset: 0x5348
// Size: 0x44
function remove_devgui(localclientnum, menu_path) {
    /#
        adddebugcommand(localclientnum, "<unknown string>" + menu_path + "<unknown string>");
    #/
}

