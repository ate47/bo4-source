// Atian COD Tools GSC decompiler test
#using script_1d29de500c266470;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace player_free_fall;

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x2
// Checksum 0x2f5540df, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"player_free_fall", &__init__, undefined, undefined);
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x0
// Checksum 0x57b1fbca, Offset: 0x120
// Size: 0xdc
function __init__() {
    callback::add_callback(#"freefall", &function_c9a18304);
    callback::add_callback(#"parachute", &function_26d46af3);
    callback::add_callback(#"debug_movement", &function_a7e644f6);
    level.parachute_weapon = getweapon(#"parachute");
    /#
        level thread function_1fc427dc();
    #/
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x0
// Checksum 0x77085261, Offset: 0x208
// Size: 0x56
function function_d2a1520c() {
    wingsuit = self namespace_eb06e24d::get_wingsuit();
    if (self util::is_female()) {
        return wingsuit.var_5677bd3d;
    }
    return wingsuit.var_94166112;
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x4
// Checksum 0xaac5184e, Offset: 0x268
// Size: 0x204
function private function_c9a18304(eventstruct) {
    model = function_d2a1520c();
    if (eventstruct.freefall) {
        if (!self isattached(model)) {
            self attach(model);
        }
        if (!isdefined(eventstruct.var_695a7111) || eventstruct.var_695a7111) {
            parachute = self namespace_eb06e24d::get_parachute();
            parachute_weapon = parachute.("parachute");
            if (isdefined(parachute_weapon)) {
                if (!self hasweapon(parachute_weapon)) {
                    self giveweapon(parachute_weapon);
                }
                self switchtoweaponimmediate(parachute_weapon);
                self thread function_b6e83203(0.5);
            }
        }
        return;
    }
    if (self isattached(model)) {
        self detach(model);
    }
    if (!self function_9a0edd92()) {
        parachute = self namespace_eb06e24d::get_parachute();
        parachute_weapon = parachute.("parachute");
        if (isdefined(parachute_weapon)) {
            if (self hasweapon(parachute_weapon)) {
                self takeweapon(parachute_weapon);
            }
        }
    }
    self setclientuivisibilityflag("weapon_hud_visible", 1);
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x4
// Checksum 0x293771bd, Offset: 0x478
// Size: 0x3a
function private function_6aac1790(var_dbb94a) {
    if (isdefined(var_dbb94a) && !self isattached(var_dbb94a, "tag_weapon_right")) {
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x4
// Checksum 0xd8867fcf, Offset: 0x4c0
// Size: 0x8c
function private function_b6e83203(delay) {
    if (isdefined(delay)) {
        self endon(#"death", #"disconnect");
        wait(delay);
    }
    parachute = self namespace_eb06e24d::get_parachute();
    var_dbb94a = parachute.("parachuteLit");
    function_6aac1790(var_dbb94a);
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x4
// Checksum 0x1e40b82e, Offset: 0x558
// Size: 0xac
function private function_26d46af3(eventstruct) {
    if (eventstruct.parachute) {
        self function_b6e83203();
        return;
    }
    parachute = self namespace_eb06e24d::get_parachute();
    parachute_weapon = parachute.("parachute");
    var_dbb94a = parachute.("parachuteLit");
    if (isdefined(parachute_weapon)) {
        self takeweapon(parachute_weapon);
    }
    if (isdefined(var_dbb94a)) {
    }
}

// Namespace player_free_fall/player_free_fall
// Params 1, eflags: 0x4
// Checksum 0xa076007c, Offset: 0x610
// Size: 0xd4
function private function_a7e644f6(eventstruct) {
    if (!eventstruct.debug_movement) {
        if (getdvarint(#"hash_bfa71d08f383550", 0)) {
            speed = 8800;
            velocity = anglestoforward(self getplayerangles()) * speed;
            self function_2ffa8aaf(1, velocity, getdvarint(#"hash_bfa71d08f383550", 0) == 1);
        }
    }
}

// Namespace player_free_fall/player_free_fall
// Params 0, eflags: 0x4
// Checksum 0x9c550484, Offset: 0x6f0
// Size: 0x124
function private function_1fc427dc() {
    /#
        mapname = util::get_map_name();
        waitframe(1);
        waitframe(1);
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        waitframe(1);
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
    #/
}

