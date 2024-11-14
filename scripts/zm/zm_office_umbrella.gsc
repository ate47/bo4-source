#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_sq;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;

#namespace zm_office_umbrella;

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x2
// Checksum 0x7ae1492f, Offset: 0x140
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_office_umbrella", &__init__, &__main__, undefined);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x35df94e6, Offset: 0x190
// Size: 0x34
function __init__() {
    init_clientfield();
    init_quests();
    init_objects();
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x7151d335, Offset: 0x1d0
// Size: 0x64
function __main__() {
    level flag::wait_till(#"all_players_spawned");
    zm_sq::start(#"jump_scare");
    zm_sq::start(#"narrative_room");
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x60fe506d, Offset: 0x240
// Size: 0x84
function init_clientfield() {
    clientfield::register("toplayer", "" + #"hash_f2d0b920043dbbd", 1, 1, "counter");
    clientfield::register("world", "" + #"narrative_room", 1, 1, "int");
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x943a7c35, Offset: 0x2d0
// Size: 0x124
function init_quests() {
    zm_sq::register(#"jump_scare", #"step_1", #"hash_3203b932029a4e0b", &jump_scare, &jump_scare_cleanup);
    zm_sq::register(#"narrative_room", #"step_1", #"hash_64d6af5ddc324d26", &function_6f55d670, &function_13c87ace);
    zm_sq::register(#"narrative_room", #"step_2", #"hash_3f567f217222e5b2", &narrative_room, &narrative_room_cleanup);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x80c802b5, Offset: 0x400
// Size: 0x9c
function init_objects() {
    level.ls_door = getent("ls_door", "targetname");
    level.ls_door disconnectpaths();
    level.var_ff3d8977 = getent(level.ls_door.target, "targetname");
    level.var_ff3d8977 disconnectpaths();
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x18c4094, Offset: 0x4a8
// Size: 0x1c
function on_player_connect() {
    self thread track_player_eyes();
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 1, eflags: 0x1 linked
// Checksum 0x6ebb116d, Offset: 0x4d0
// Size: 0xac
function jump_scare(var_a276c861) {
    foreach (player in level.players) {
        player thread track_player_eyes();
    }
    callback::on_connect(&on_player_connect);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 0, eflags: 0x1 linked
// Checksum 0x95f84a00, Offset: 0x588
// Size: 0x210
function track_player_eyes() {
    self notify(#"track_player_eyes");
    self endon(#"disconnect", #"track_player_eyes");
    b_saw_the_wth = 0;
    var_616e76c5 = struct::get("sq_gl_scare", "targetname");
    while (!b_saw_the_wth) {
        n_time = 0;
        while (self adsbuttonpressed() && n_time < 25) {
            n_time++;
            waitframe(1);
        }
        if (n_time >= 25 && self adsbuttonpressed() && self zm_zonemgr::entity_in_zone("cage") && is_weapon_sniper(self getcurrentweapon()) && self zm_utility::is_player_looking_at(var_616e76c5.origin, 0.9975, 0, self)) {
            self zm_utility::do_player_general_vox("general", "scare_react", undefined, 100);
            self clientfield::increment_to_player("" + #"hash_f2d0b920043dbbd", 1);
            j_time = 0;
            while (self adsbuttonpressed() && j_time < 5) {
                j_time++;
                waitframe(1);
            }
            b_saw_the_wth = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 1, eflags: 0x5 linked
// Checksum 0x20509e51, Offset: 0x7a0
// Size: 0xc0
function private is_weapon_sniper(w_weapon) {
    if (isdefined(w_weapon.issniperweapon) && w_weapon.issniperweapon) {
        if (weaponhasattachment(w_weapon, "elo") || weaponhasattachment(w_weapon, "reflex") || weaponhasattachment(w_weapon, "holo") || weaponhasattachment(w_weapon, "is")) {
            return false;
        } else {
            return true;
        }
    }
    return false;
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 2, eflags: 0x1 linked
// Checksum 0x7c45a83e, Offset: 0x868
// Size: 0x14
function jump_scare_cleanup(var_a276c861, var_19e802fa) {
    
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 1, eflags: 0x1 linked
// Checksum 0x1d95d8ba, Offset: 0x888
// Size: 0x24
function function_6f55d670(var_a276c861) {
    level waittill(#"fake_waittill");
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 2, eflags: 0x1 linked
// Checksum 0x5052a95e, Offset: 0x8b8
// Size: 0x14
function function_13c87ace(var_a276c861, var_19e802fa) {
    
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 1, eflags: 0x1 linked
// Checksum 0x1ace13e5, Offset: 0x8d8
// Size: 0xf4
function narrative_room(var_a276c861) {
    spawn_instant_revive = getent("ls_blocker", "targetname");
    spawn_instant_revive delete();
    level.var_ff3d8977 connectpaths();
    level.var_ff3d8977 delete();
    level.ls_door rotateyaw(90, 1.6);
    level.ls_door connectpaths();
    level clientfield::set("" + #"narrative_room", 1);
}

// Namespace zm_office_umbrella/zm_office_umbrella
// Params 2, eflags: 0x1 linked
// Checksum 0xe5ddd699, Offset: 0x9d8
// Size: 0x14
function narrative_room_cleanup(var_a276c861, var_19e802fa) {
    
}

