// Atian COD Tools GSC decompiler test
#using scripts\mp_common\armor.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_ai_zombie;

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x2
// Checksum 0x89addfcb, Offset: 0x468
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_ai_zombie", &__init__, undefined, undefined);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0xa732faa1, Offset: 0x4b0
// Size: 0x35e
function private __init__() {
    clientfield::register("actor", "zombie_riser_fx", 1, 1, "int");
    clientfield::register("actor", "zombie_has_eyes", 1, 1, "int");
    level.var_9ee73630 = [];
    level.var_9ee73630[#"walk"] = [];
    level.var_9ee73630[#"run"] = [];
    level.var_9ee73630[#"sprint"] = [];
    level.var_9ee73630[#"super_sprint"] = [];
    level.var_9ee73630[#"walk"][#"down"] = 14;
    level.var_9ee73630[#"walk"][#"up"] = 16;
    level.var_9ee73630[#"run"][#"down"] = 13;
    level.var_9ee73630[#"run"][#"up"] = 12;
    level.var_9ee73630[#"sprint"][#"down"] = 9;
    level.var_9ee73630[#"sprint"][#"up"] = 8;
    level.var_9ee73630[#"super_sprint"][#"down"] = 1;
    level.var_9ee73630[#"super_sprint"][#"up"] = 1;
    spawner::add_archetype_spawn_function(#"zombie", &function_cf051788);
    initzombiebehaviors();
    val::register("allowoffnavmesh", 1);
    val::default_value("allowoffnavmesh", 0);
    level.attackablecallback = &attackable_callback;
    level.var_cdc822b = &function_cdc822b;
    level.var_a6a84389 = &function_a6a84389;
    level.custom_melee_fire = &custom_melee_fire;
    level.startinghealth = 100;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xdd38f8ad, Offset: 0x818
// Size: 0x6c
function custom_melee_fire() {
    idflags = 0;
    if (isdefined(self.enemy) && isdefined(self.enemy.armor) && self.enemy.armor) {
        idflags = idflags | 2048;
    }
    self function_f3813b8a(idflags);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x96e91c3e, Offset: 0x890
// Size: 0x42
function function_cdc822b() {
    if (isdefined(self.ai_zone) && isdefined(self.ai_zone.is_active) && self.ai_zone.is_active) {
        return 1;
    }
    return 0;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0xd1872299, Offset: 0x8e0
// Size: 0x62
function function_a6a84389(playerradius) {
    position = getclosestpointonnavmesh(self.origin - vectorscale((0, 0, 1), 60), 200, playerradius);
    if (isdefined(position)) {
        self.last_valid_position = position;
    }
    return self.last_valid_position;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0x3215af27, Offset: 0x950
// Size: 0x9c
function function_2713ff17(vehicle) {
    if (isdefined(vehicle)) {
        vehicle dodamage(50, vehicle.origin);
        org = vehicle.origin;
        earthquake(0.3, 1, org, 2000);
        playrumbleonposition("grenade_rumble", org);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0xb0a1d65e, Offset: 0x9f8
// Size: 0x24
function attackable_callback(entity) {
    function_2713ff17(self);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xe4664dca, Offset: 0xa28
// Size: 0x814
function initzombiebehaviors() {
    /#
        assert(isscriptfunctionptr(&function_e91d8371));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieupdatethrottle", &function_e91d8371, 1);
    /#
        assert(isscriptfunctionptr(&zombieshouldmelee));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"wzzombieshouldmelee", &zombieshouldmelee);
    /#
        assert(isscriptfunctionptr(&function_e8f3596d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_350ddff40ea2207b", &function_e8f3596d);
    /#
        assert(isscriptfunctionptr(&function_cc184b8b));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77070e8fef81d6da", &function_cc184b8b);
    /#
        assert(isscriptfunctionptr(&function_562c0e1d));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23448cac3a176df3", &function_562c0e1d);
    /#
        assert(isscriptfunctionptr(&function_e8f3596d));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_350ddff40ea2207b", &function_e8f3596d);
    /#
        assert(isscriptfunctionptr(&function_a58eaeea));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieshouldreact", &function_a58eaeea);
    /#
        assert(isscriptfunctionptr(&zombieshouldmove));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieshouldmove", &zombieshouldmove);
    /#
        assert(isscriptfunctionptr(&function_37abea6f));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_2b17bbf6d0ceff72", &function_37abea6f);
    /#
        assert(isscriptfunctionptr(&function_55b7ea22));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_336e28ae1ed4640b", &function_55b7ea22);
    /#
        assert(isscriptfunctionptr(&function_98b102d8));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_53e4632b82a3a930", &function_98b102d8);
    /#
        assert(isscriptfunctionptr(&function_6ec0bcc1));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_791763042d13fef1", &function_6ec0bcc1);
    /#
        assert(isscriptfunctionptr(&function_4402c40a));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_24de191ac3416c18", &function_4402c40a);
    /#
        assert(isscriptfunctionptr(&function_6a3bcddc));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_33c14e313f684eab", &function_6a3bcddc);
    /#
        assert(isscriptfunctionptr(&zombiemoveactionstart));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombiemoveactionstart", &zombiemoveactionstart);
    /#
        assert(isscriptfunctionptr(&zombiemoveactionupdate));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombiemoveactionupdate", &zombiemoveactionupdate);
    /#
        assert(isscriptfunctionptr(&function_a0acf641));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_796d69f77ff45304", &function_a0acf641);
    /#
        assert(isscriptfunctionptr(&function_f8250d5e));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieidleactionstart", &function_f8250d5e);
    /#
        assert(isscriptfunctionptr(&function_860d5d8));
    #/
    behaviorstatemachine::registerbsmscriptapiinternal(#"wzzombieidleactionupdate", &function_860d5d8);
    animationstatenetwork::registernotetrackhandlerfunction("zombieRiserFx", &function_79c3a487);
    animationstatenetwork::registernotetrackhandlerfunction("showZombie", &showzombie);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0xfe9bb89c, Offset: 0x1248
// Size: 0xb2
function function_9758722(speed) {
    if (self.zombie_move_speed === speed) {
        return;
    }
    self.zombie_move_speed = speed;
    if (!isdefined(self.zombie_arms_position)) {
        self.zombie_arms_position = math::cointoss() == 1 ? "up" : "down";
    }
    if (isdefined(level.var_9ee73630)) {
        self.variant_type = randomint(level.var_9ee73630[self.zombie_move_speed][self.zombie_arms_position]);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x27455e81, Offset: 0x1308
// Size: 0x17e
function private function_cf051788() {
    self callback::function_d8abfc3d(#"on_ai_damage", &function_3d9b8ab3);
    self callback::function_d8abfc3d(#"on_ai_killed", &zombie_death_event);
    aiutility::addaioverridedamagecallback(self, &function_c75fae30);
    self.clamptonavmesh = 1;
    self.ignorepathenemyfightdist = 1;
    self.var_bb185cc5 = 0;
    self.var_1c0eb62a = 180;
    self.var_737e8510 = 128;
    self function_9758722("walk");
    self.spawn_anim = "ai_zombie_base_traverse_ground_climbout_fast";
    self thread function_6c308e81();
    self thread zombie_gib_on_damage();
    self thread function_e261b81d();
    self.maxhealth = level.startinghealth;
    self.health = self.maxhealth;
    self.var_31a789c0 = 0;
    self.var_15fe3985 = 0;
    self.var_2c628c0f = 1;
    self.var_20e07206 = 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0x59f4e366, Offset: 0x1490
// Size: 0x40
function isheadshot(shitloc) {
    if (isdefined(shitloc) && (shitloc == "head" || shitloc == "helmet")) {
        return 1;
    }
    return 0;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 13, eflags: 0x4
// Checksum 0x7ebee836, Offset: 0x14d8
// Size: 0x9c
function private function_c75fae30(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname) {
    if (isheadshot(shitloc)) {
        idamage = idamage * 2;
    }
    return idamage;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xeeee9c0f, Offset: 0x1580
// Size: 0x72
function private function_3d9b8ab3(params) {
    if (!isdefined(self.enemy_override) && isdefined(self.favoriteenemy) && isdefined(params.eattacker) && isplayer(params.eattacker)) {
        self.favoriteenemy = params.eattacker;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x1387e95f, Offset: 0x1600
// Size: 0xac
function private function_9c573bc6() {
    self notify("403817714a013a66");
    self endon("6c94e145f7d12787", #"death");
    if (isdefined(self.allowoffnavmesh) && self.allowoffnavmesh && isdefined(level.var_5e8121a) && level.var_5e8121a) {
        self.var_ef59b90 = 5;
        return;
    }
    self collidewithactors(0);
    wait(2);
    self collidewithactors(1);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xf5b08e9e, Offset: 0x16b8
// Size: 0x2e
function private function_e91d8371(entity) {
    level.var_8de0b84e = entity getentitynumber();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x83067cfa, Offset: 0x16f0
// Size: 0x392
function private zombieshouldmelee(entity) {
    if (isdefined(entity.enemy_override)) {
        return 0;
    }
    if (!isdefined(entity.enemy)) {
        return 0;
    }
    if (isdefined(entity.ignoremelee) && entity.ignoremelee) {
        return 0;
    }
    if (isdefined(entity.var_8a96267d) && entity.var_8a96267d || isdefined(entity.var_8ba6ede3) && entity.var_8ba6ede3) {
        return 0;
    }
    if (abs(entity.origin[2] - entity.enemy.origin[2]) > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64)) {
        return 0;
    }
    meleedistsq = zombiebehavior::function_997f1224(entity);
    if (distancesquared(entity.origin, entity.enemy.origin) > meleedistsq) {
        return 0;
    }
    yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(entity.enemy.origin - entity.origin)[1]);
    if (abs(yawtoenemy) > (isdefined(entity.var_1c0eb62a) ? entity.var_1c0eb62a : 60)) {
        return 0;
    }
    if (!entity cansee(entity.enemy)) {
        return 0;
    }
    if (distancesquared(entity.origin, entity.enemy.origin) < 40 * 40) {
        return 1;
    }
    if (isdefined(entity.enemy.usingvehicle) && entity.enemy.usingvehicle) {
        entity.attackable = entity.enemy getvehicleoccupied();
        entity.attackable.is_active = 1;
        entity.is_at_attackable = 1;
        return 1;
    }
    if (isdefined(self.isonnavmesh) && self.isonnavmesh && !tracepassedonnavmesh(entity.origin, isdefined(entity.enemy.last_valid_position) ? entity.enemy.last_valid_position : entity.enemy.origin, entity.enemy getpathfindingradius())) {
        return 0;
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xd044e6e0, Offset: 0x1a90
// Size: 0x28
function private function_e8f3596d(entity) {
    return isdefined(entity.var_8a96267d) && entity.var_8a96267d;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x1b21f65, Offset: 0x1ac0
// Size: 0x28
function private function_cc184b8b(entity) {
    return isdefined(entity.var_8ba6ede3) && entity.var_8ba6ede3;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x7957f438, Offset: 0x1af0
// Size: 0x46
function private function_562c0e1d(entity) {
    return entity haspath() || isdefined(entity.is_digging) && entity.is_digging;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x2bdaa6e5, Offset: 0x1b40
// Size: 0x4e
function private function_a58eaeea(entity) {
    return !(isdefined(entity.missinglegs) && entity.missinglegs) && isdefined(entity.shouldreact) && entity.shouldreact;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x31ee7ded, Offset: 0x1b98
// Size: 0x2c
function private zombieshouldmove(entity) {
    return entity.allowoffnavmesh || entity haspath();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x3b4d71d8, Offset: 0x1bd0
// Size: 0x28
function private function_37abea6f(entity) {
    return isdefined(entity.var_4c4ad20a) && entity.var_4c4ad20a;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x8e8cb2be, Offset: 0x1c00
// Size: 0x1dc
function private function_c9153928(entity) {
    origin = undefined;
    if (isdefined(self.enemy_override)) {
        origin = self.enemy_override.origin;
    } else if (isdefined(self.favoriteenemy)) {
        origin = self.favoriteenemy.origin;
    }
    if (!isdefined(origin)) {
        return;
    }
    to_origin = origin - entity.origin;
    yaw = vectortoangles(to_origin)[1] - entity.angles[1];
    yaw = absangleclamp360(yaw);
    entity.shouldreact = 1;
    if (yaw <= 45 || yaw > 315) {
        entity setblackboardattribute("_zombie_react_direction", "front");
    } else if (yaw > 45 && yaw <= 135) {
        entity setblackboardattribute("_zombie_react_direction", "left");
    } else if (yaw > 135 && yaw <= 225) {
        entity setblackboardattribute("_zombie_react_direction", "back");
    } else {
        entity setblackboardattribute("_zombie_react_direction", "right");
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xa188a1ee, Offset: 0x1de8
// Size: 0x48
function private function_4402c40a(entity) {
    entity.var_8a96267d = undefined;
    entity.is_digging = 1;
    entity pathmode("dont move", 1);
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xf61b4c03, Offset: 0x1e38
// Size: 0x74
function private function_6a3bcddc(entity) {
    entity ghost();
    entity notsolid();
    entity clientfield::set("zombie_riser_fx", 0);
    entity notify(#"is_underground");
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x14801815, Offset: 0x1eb8
// Size: 0x4e
function private function_55b7ea22(entity) {
    entity solid();
    entity clientfield::set("zombie_riser_fx", 1);
    entity.var_8ba6ede3 = undefined;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x261b891e, Offset: 0x1f10
// Size: 0x68
function private function_98b102d8(entity) {
    entity clientfield::set("zombie_riser_fx", 0);
    entity.is_digging = 0;
    entity pathmode("move allowed");
    entity notify(#"not_underground");
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x1ba1dd6b, Offset: 0x1f80
// Size: 0x1a
function private function_6ec0bcc1(entity) {
    entity.shouldreact = undefined;
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xe36cd2c8, Offset: 0x1fa8
// Size: 0x36
function private zombiemoveactionstart(entity) {
    entity.movetime = gettime();
    entity.moveorigin = entity.origin;
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xdfecc8fb, Offset: 0x1fe8
// Size: 0xd2
function private zombiemoveactionupdate(entity) {
    if (!(isdefined(entity.missinglegs) && entity.missinglegs) && gettime() - entity.movetime > 1000) {
        distsq = distance2dsquared(entity.origin, entity.moveorigin);
        if (distsq < 144) {
            if (isdefined(entity.cant_move_cb)) {
                entity thread [[ entity.cant_move_cb ]]();
            }
        }
        entity.movetime = gettime();
        entity.moveorigin = entity.origin;
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x888ebc94, Offset: 0x20c8
// Size: 0x36
function private function_f8250d5e(entity) {
    entity.idletime = gettime();
    entity.moveorigin = entity.origin;
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x3a383827, Offset: 0x2108
// Size: 0xd2
function private function_860d5d8(entity) {
    if (!(isdefined(entity.missinglegs) && entity.missinglegs) && gettime() - entity.idletime > 1000) {
        distsq = distance2dsquared(entity.origin, entity.moveorigin);
        if (distsq < 144) {
            if (isdefined(entity.cant_move_cb)) {
                entity thread [[ entity.cant_move_cb ]]();
            }
        }
        entity.idletime = gettime();
        entity.moveorigin = entity.origin;
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x99839743, Offset: 0x21e8
// Size: 0x1a
function private function_a0acf641(entity) {
    entity.var_4c4ad20a = undefined;
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0x8db469d3, Offset: 0x2210
// Size: 0x2c
function private function_79c3a487(entity) {
    entity clientfield::set("zombie_riser_fx", 1);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xa5c0f690, Offset: 0x2248
// Size: 0x24
function private showzombie(entity) {
    entity show();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x296274eb, Offset: 0x2278
// Size: 0x5a
function private function_7c7e7339() {
    switch (self.aistate) {
    case 3:
        self.goalradius = 64;
        break;
    default:
        self.goalradius = 32;
        break;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 2, eflags: 0x4
// Checksum 0x1792da7b, Offset: 0x22e0
// Size: 0x74
function private function_d1e55248(id, value) {
    if (isdefined(value) && value) {
        self val::set(id, "allowoffnavmesh", 1);
    } else {
        self val::reset(id, "allowoffnavmesh");
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x6ec81a46, Offset: 0x2360
// Size: 0x306
function function_e261b81d() {
    level endon(#"game_ended");
    self endon(#"death");
    waitframe(1);
    self.aistate = 1;
    self setgoal(self.origin);
    while (1) {
        self.isonnavmesh = ispointonnavmesh(self.origin, self);
        self function_bf21ead1();
        if (!self.isonnavmesh && self.allowoffnavmesh) {
            if (!isdefined(self.var_6bcb6977)) {
                self.var_6bcb6977 = gettime();
                if (isdefined(self.ai_zone.var_2209cb79)) {
                    self.var_f9d7afa3 = self.ai_zone.var_2209cb79;
                } else {
                    self.var_f9d7afa3 = randomintrange(6000, 10000);
                }
            }
        } else {
            self.var_6bcb6977 = undefined;
            self function_7c7e7339();
        }
        if (isdefined(level.var_3140c814) && level.var_3140c814) {
            if (self.aistate !== 5 && self isonground() && isdefined(self.var_6bcb6977) && gettime() - self.var_6bcb6977 > self.var_f9d7afa3) {
                self.var_ef59b90 = 5;
            }
        }
        if (isdefined(self.var_ef59b90) && self.aistate != self.var_ef59b90) {
            self function_cc9c6a13(self.aistate);
            self.aistate = self.var_ef59b90;
            self function_b8eff92a(self.aistate);
            self notify(#"state_changed");
            self.var_ef59b90 = undefined;
        }
        switch (self.aistate) {
        case 1:
            self function_34eacecd();
            break;
        case 3:
            self function_36151fe3();
            break;
        case 5:
            self function_101763c9();
            break;
        case 0:
        default:
            break;
        }
        update_goal();
        waitframe(1);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x12e3ed97, Offset: 0x2670
// Size: 0x116
function private update_goal() {
    if (isdefined(self.var_80780af2) && (level.var_8de0b84e === self getentitynumber() || self.archetype == #"blight_father")) {
        if (!self.allowoffnavmesh && self.isonnavmesh) {
            adjustedgoal = getclosestpointonnavmesh(self.var_80780af2, 100, self getpathfindingradius());
            if (isdefined(adjustedgoal)) {
                pathdata = generatenavmeshpath(self.origin, adjustedgoal, self);
                if (isdefined(pathdata) && pathdata.status === "succeeded") {
                    self setgoal(adjustedgoal);
                }
            }
        }
        self.var_80780af2 = undefined;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0xdea30cbb, Offset: 0x2790
// Size: 0xd8
function is_player_valid(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (!isplayer(player)) {
        return 0;
    }
    if (player.sessionstate == "spectator") {
        return 0;
    }
    if (player.sessionstate == "intermission") {
        return 0;
    }
    if (isdefined(player.intermission) && player.intermission) {
        return 0;
    }
    if (player.ignoreme || player isnotarget()) {
        return 0;
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0x34cdd364, Offset: 0x2870
// Size: 0x11a
function function_f10600c(enemy) {
    if (!is_player_valid(enemy)) {
        return 0;
    }
    if (isdefined(self.var_5a8f690) && gettime() < self.var_ea34ab74) {
        return self.var_5a8f690;
    }
    targetpoint = isdefined(enemy.var_88f8feeb) ? enemy.var_88f8feeb : enemy getcentroid();
    if (bullettracepassed(self geteye(), targetpoint, 0, enemy)) {
        self clearentitytarget();
        self.var_5a8f690 = 1;
        self.var_ea34ab74 = gettime() + 2000;
    } else {
        self.var_5a8f690 = 0;
        self.var_ea34ab74 = gettime() + 500;
    }
    return self.var_5a8f690;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x280811fd, Offset: 0x2998
// Size: 0x96
function ai_can_see() {
    players_in_zone = getplayers();
    var_13324143 = arraysortclosest(players_in_zone, self.origin, 4);
    for (i = 0; i < var_13324143.size; i++) {
        if (self function_f10600c(var_13324143[i])) {
            return var_13324143[i];
        }
    }
    return undefined;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x38b149f6, Offset: 0x2a38
// Size: 0x134
function private function_bf21ead1() {
    var_f5acb8b9 = self.favoriteenemy;
    self.enemy_override = function_b67c088d();
    if (isdefined(self.enemy_override)) {
        self.favoriteenemy = undefined;
    } else {
        var_293b2af1 = ai_can_see();
        if (isdefined(var_293b2af1)) {
            self.favoriteenemy = var_293b2af1;
            self.var_bb185cc5 = gettime();
        } else if (isdefined(self.favoriteenemy)) {
            if (self function_f10600c(self.favoriteenemy)) {
                self.var_bb185cc5 = gettime();
            }
            if (gettime() - self.var_bb185cc5 > 8000 || !is_player_valid(self.favoriteenemy)) {
                self.favoriteenemy = undefined;
            }
        }
    }
    if (var_f5acb8b9 !== self.favoriteenemy) {
        self callback::callback(#"hash_45b50cc48ee7f9d8");
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x424a3bcd, Offset: 0x2b78
// Size: 0x12c
function private function_827edb6() {
    var_f5acb8b9 = self.favoriteenemy;
    self.enemy_override = function_b67c088d();
    if (isdefined(self.enemy_override)) {
        self.favoriteenemy = undefined;
    } else if (isdefined(self.favoriteenemy)) {
        if (self function_f10600c(self.favoriteenemy)) {
            self.var_bb185cc5 = gettime();
        }
        if (gettime() - self.var_bb185cc5 > 8000 || !is_player_valid(self.favoriteenemy)) {
            self.favoriteenemy = undefined;
        }
    }
    if (!isdefined(self.enemy_override) && !isdefined(self.favoriteenemy)) {
        self.favoriteenemy = ai_can_see();
    }
    if (var_f5acb8b9 !== self.favoriteenemy) {
        self callback::callback(#"hash_45b50cc48ee7f9d8");
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x44e6b324, Offset: 0x2cb0
// Size: 0x6
function private function_b67c088d() {
    return undefined;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xa48edeee, Offset: 0x2cc0
// Size: 0x162
function private function_cc9c6a13(state) {
    switch (state) {
    case 1:
        self.var_9a79d89d = undefined;
        self clearpath();
        if (self.var_ef59b90 === 3) {
            function_c9153928(self);
        }
        break;
    case 3:
        self function_d1e55248(#"hash_6e6d6ff06622efa4", 0);
        self pathmode("move allowed");
        break;
    case 5:
        self function_d1e55248(#"hash_5780e28b762b831a", 0);
        val::reset(#"hash_5780e28b762b831a", "ignoreall");
        self pathmode("move allowed");
        break;
    default:
        break;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x4
// Checksum 0xfb6f570e, Offset: 0x2e30
// Size: 0x144
function private function_b8eff92a(state) {
    switch (state) {
    case 1:
        self function_9758722("walk");
        self.favoriteenemy = undefined;
        break;
    case 3:
        self function_9758722("sprint");
        break;
    case 5:
        self function_d1e55248(#"hash_5780e28b762b831a", !self.isonnavmesh);
        val::set(#"hash_5780e28b762b831a", "ignoreall", 1);
        if (!self.isonnavmesh) {
            self pathmode("dont move", 1);
        }
        break;
    default:
        break;
    }
    self function_7c7e7339();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x77911a68, Offset: 0x2f80
// Size: 0x32e
function private function_36151fe3() {
    self pathmode("move allowed");
    self function_d4c687c9();
    if (isdefined(self.enemy_override)) {
        var_31e67a12 = ispointonnavmesh(self.enemy_override.origin, self);
        if (var_31e67a12 && self.isonnavmesh) {
            self function_d1e55248(#"hash_6e6d6ff06622efa4", 0);
            self.var_80780af2 = self.enemy_override.origin;
        } else if (self.isonnavmesh && isdefined(self.enemy_override.var_acdc8d71) && !self isingoal(self.enemy_override.var_acdc8d71)) {
            self.var_80780af2 = self.enemy_override.var_acdc8d71;
        } else if (!self.isonnavmesh || self isatgoal()) {
            self function_d1e55248(#"hash_6e6d6ff06622efa4", 1);
            self pathmode("dont move", 1);
            self function_a57c34b7(self.enemy_override.origin);
        }
        return;
    }
    if (isdefined(self.favoriteenemy)) {
        if (isdefined(self.favoriteenemy.last_valid_position) && self.favoriteenemy.ai_zone === self.ai_zone) {
            self.var_80780af2 = self.favoriteenemy.last_valid_position;
            if (self.isonnavmesh) {
                self function_d1e55248(#"hash_6e6d6ff06622efa4", 0);
            }
            return;
        } else if (isdefined(self.favoriteenemy.last_valid_position) && !ispointonnavmesh(self.favoriteenemy.origin, self)) {
            if (!self.isonnavmesh && !self function_dd070839() || self isatgoal()) {
                self pathmode("dont move", 1);
                self function_d1e55248(#"hash_6e6d6ff06622efa4", 1);
            }
        }
    } else {
        self.var_ef59b90 = 1;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0xd3b47f72, Offset: 0x32b8
// Size: 0x2a
function private function_34eacecd() {
    if (isdefined(self.enemy_override) || isdefined(self.favoriteenemy)) {
        self.var_ef59b90 = 3;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0xdac72476, Offset: 0x32f0
// Size: 0x12
function private function_b793bca2() {
    self.var_ef59b90 = 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x4
// Checksum 0x2282ad73, Offset: 0x3310
// Size: 0x19e
function private function_101763c9() {
    self endon(#"death");
    spawn_point = self.ai_zone.spawn_points[randomint(self.ai_zone.spawn_points.size)];
    if (isdefined(self.var_31a789c0) && self.var_31a789c0) {
        self.var_8a96267d = 1;
        self waittill(#"is_underground");
        if (!isdefined(spawn_point)) {
            self kill();
        }
        wait(2);
        self forceteleport(spawn_point.origin, spawn_point.angles);
        wait(2);
        self.var_8ba6ede3 = 1;
        self waittill(#"not_underground");
    } else {
        self.var_8a96267d = 1;
        self waittill(#"is_screamed");
        if (!isdefined(spawn_point)) {
            self kill();
        }
        self forceteleport(spawn_point.origin, spawn_point.angles);
        wait(2);
        self.var_8ba6ede3 = 1;
        self waittill(#"not_underground");
    }
    self.var_ef59b90 = 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xd75950f5, Offset: 0x34b8
// Size: 0x84
function delayed_zombie_eye_glow() {
    self endon(#"death");
    if (isdefined(self.in_the_ground) && self.in_the_ground || isdefined(self.in_the_ceiling) && self.in_the_ceiling) {
        while (!isdefined(self.create_eyes)) {
            wait(0.1);
        }
    } else {
        wait(0.5);
    }
    self zombie_eye_glow();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xf59ba8ab, Offset: 0x3548
// Size: 0x64
function zombie_eye_glow() {
    if (!isdefined(self) || !isactor(self)) {
        return;
    }
    if (!(isdefined(self.no_eye_glow) && self.no_eye_glow)) {
        self clientfield::set("zombie_has_eyes", 1);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x6ede670a, Offset: 0x35b8
// Size: 0x64
function zombie_eye_glow_stop() {
    if (!isdefined(self) || !isactor(self)) {
        return;
    }
    if (!(isdefined(self.no_eye_glow) && self.no_eye_glow)) {
        self clientfield::set("zombie_has_eyes", 0);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x2204fa6e, Offset: 0x3628
// Size: 0x24
function zombie_gut_explosion() {
    self.guts_explosion = 1;
    gibserverutils::annihilate(self);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0xfcef8b1, Offset: 0x3658
// Size: 0x17c
function zombie_death_event(params) {
    self thread zombie_eye_glow_stop();
    if (isdefined(params.weapon.doannihilate) && params.weapon.doannihilate || params.smeansofdeath === "MOD_GRENADE" || params.smeansofdeath === "MOD_GRENADE_SPLASH" || params.smeansofdeath === "MOD_EXPLOSIVE") {
        if (isdefined(params.weapon.doannihilate) && params.weapon.doannihilate) {
            tag = "J_SpineLower";
            if (isdefined(self.isdog) && self.isdog) {
                tag = "tag_origin";
            }
            if (isdefined(self.var_b69c12bc) && self.var_b69c12bc && !(isdefined(self.is_on_fire) && self.is_on_fire) && !(isdefined(self.guts_explosion) && self.guts_explosion)) {
                self thread zombie_gut_explosion();
            }
        }
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xb5465561, Offset: 0x37e0
// Size: 0xc8
function zombie_gib_on_damage() {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        self thread zombie_gib(waitresult.amount, waitresult.attacker, waitresult.direction, waitresult.position, waitresult.mod, waitresult.tag_name, waitresult.model_name, waitresult.part_name, waitresult.weapon);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 9, eflags: 0x0
// Checksum 0xcb16fc19, Offset: 0x38b0
// Size: 0x468
function zombie_gib(amount, attacker, direction_vec, point, type, tagname, modelname, partname, weapon) {
    if (!isdefined(self)) {
        return;
    }
    if (!self zombie_should_gib(amount, attacker, type)) {
        return;
    }
    if (self head_should_gib(attacker, type, point) && type != "MOD_BURNED") {
        self zombie_head_gib(attacker, type);
        return;
    }
    if (!(isdefined(self.gibbed) && self.gibbed) && isdefined(self.damagelocation)) {
        if (self.damagelocation == "head" || self.damagelocation == "helmet" || self.damagelocation == "neck") {
            return;
        }
        switch (self.damagelocation) {
        case #"torso_upper":
        case #"torso_lower":
            if (!gibserverutils::isgibbed(self, 32)) {
                gibserverutils::gibrightarm(self);
            }
            break;
        case #"right_arm_lower":
        case #"right_arm_upper":
        case #"right_hand":
            if (!gibserverutils::isgibbed(self, 32)) {
                gibserverutils::gibrightarm(self);
            }
            break;
        case #"left_arm_lower":
        case #"left_arm_upper":
        case #"left_hand":
            if (!gibserverutils::isgibbed(self, 16)) {
                gibserverutils::gibleftarm(self);
            }
            break;
        case #"right_leg_upper":
        case #"left_leg_lower":
        case #"right_leg_lower":
        case #"left_foot":
        case #"right_foot":
        case #"left_leg_upper":
            break;
        default:
            if (self.damagelocation == "none") {
                if (type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH") {
                    self derive_damage_refs(point);
                    break;
                }
            }
            break;
        }
        if (isdefined(self.missinglegs) && self.missinglegs && self.health > 0) {
            level notify(#"crawler_created", {#weapon:weapon, #player:attacker, #zombie:self});
            self allowedstances("crouch");
            self setphysparams(15, 0, 24);
            self allowpitchangle(1);
            self setpitchorient();
            health = self.health;
            health = health * 0.1;
        }
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0x136e5a33, Offset: 0x3d20
// Size: 0x33c
function derive_damage_refs(point) {
    if (!isdefined(level.gib_tags)) {
        init_gib_tags();
    }
    closesttag = undefined;
    for (i = 0; i < level.gib_tags.size; i++) {
        if (!isdefined(closesttag)) {
            closesttag = level.gib_tags[i];
        } else if (distancesquared(point, self gettagorigin(level.gib_tags[i])) < distancesquared(point, self gettagorigin(closesttag))) {
            closesttag = level.gib_tags[i];
        }
    }
    if (closesttag == "J_SpineLower" || closesttag == "J_SpineUpper" || closesttag == "J_Spine4") {
        gibserverutils::gibrightarm(self);
    } else if (closesttag == "J_Shoulder_LE" || closesttag == "J_Elbow_LE" || closesttag == "J_Wrist_LE") {
        if (!gibserverutils::isgibbed(self, 16)) {
            gibserverutils::gibleftarm(self);
        }
    } else if (closesttag == "J_Shoulder_RI" || closesttag == "J_Elbow_RI" || closesttag == "J_Wrist_RI") {
        if (!gibserverutils::isgibbed(self, 32)) {
            gibserverutils::gibrightarm(self);
        }
    } else if (closesttag == "J_Hip_LE" || closesttag == "J_Knee_LE" || closesttag == "J_Ankle_LE") {
        gibserverutils::gibleftleg(self);
        if (randomint(100) > 75) {
            gibserverutils::gibrightleg(self);
        }
        self function_df5afb5e(1);
    } else if (closesttag == "J_Hip_RI" || closesttag == "J_Knee_RI" || closesttag == "J_Ankle_RI") {
        gibserverutils::gibrightleg(self);
        if (randomint(100) > 75) {
            gibserverutils::gibleftleg(self);
        }
        self function_df5afb5e(1);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x18b5cba5, Offset: 0x4068
// Size: 0x14e
function init_gib_tags() {
    tags = [];
    tags[tags.size] = "J_SpineLower";
    tags[tags.size] = "J_SpineUpper";
    tags[tags.size] = "J_Spine4";
    tags[tags.size] = "J_Shoulder_LE";
    tags[tags.size] = "J_Elbow_LE";
    tags[tags.size] = "J_Wrist_LE";
    tags[tags.size] = "J_Shoulder_RI";
    tags[tags.size] = "J_Elbow_RI";
    tags[tags.size] = "J_Wrist_RI";
    tags[tags.size] = "J_Hip_LE";
    tags[tags.size] = "J_Knee_LE";
    tags[tags.size] = "J_Ankle_LE";
    tags[tags.size] = "J_Hip_RI";
    tags[tags.size] = "J_Knee_RI";
    tags[tags.size] = "J_Ankle_RI";
    level.gib_tags = tags;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 1, eflags: 0x0
// Checksum 0x773614ad, Offset: 0x41c0
// Size: 0x3a
function function_df5afb5e(missinglegs = 0) {
    if (missinglegs) {
        self.knockdown = 0;
    }
    self.missinglegs = missinglegs;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 3, eflags: 0x0
// Checksum 0xb30e5462, Offset: 0x4208
// Size: 0x270
function zombie_should_gib(amount, attacker, type) {
    if (!isdefined(type)) {
        return 0;
    }
    if (isdefined(self.is_on_fire) && self.is_on_fire) {
        return 0;
    }
    if (isdefined(self.no_gib) && self.no_gib == 1) {
        return 0;
    }
    prev_health = amount + self.health;
    if (prev_health <= 0) {
        prev_health = 1;
    }
    damage_percent = amount / prev_health * 100;
    weapon = undefined;
    if (isdefined(attacker)) {
        if (isplayer(attacker) || isdefined(attacker.can_gib_zombies) && attacker.can_gib_zombies) {
            if (isplayer(attacker)) {
                weapon = attacker getcurrentweapon();
            } else {
                weapon = attacker.weapon;
            }
        }
    }
    switch (type) {
    case #"mod_telefrag":
    case #"mod_unknown":
    case #"mod_burned":
    case #"mod_trigger_hurt":
    case #"mod_suicide":
    case #"mod_falling":
        return 0;
    case #"mod_melee":
        return 0;
        break;
    }
    if (type == "MOD_PISTOL_BULLET" || type == "MOD_RIFLE_BULLET") {
        if (!isdefined(attacker) || !isplayer(attacker)) {
            return 0;
        }
        if (weapon == level.weaponnone || isdefined(level.start_weapon) && weapon == level.start_weapon || weapon.isgasweapon) {
            return 0;
        }
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 3, eflags: 0x0
// Checksum 0xf15ff238, Offset: 0x4480
// Size: 0x30e
function head_should_gib(attacker, type, point) {
    if (isdefined(self.head_gibbed) && self.head_gibbed) {
        return 0;
    }
    if (!isdefined(attacker) || !isplayer(attacker)) {
        if (!(isdefined(attacker.can_gib_zombies) && attacker.can_gib_zombies)) {
            return 0;
        }
    }
    if (isplayer(attacker)) {
        weapon = attacker getcurrentweapon();
    } else {
        weapon = attacker.weapon;
    }
    if (type != "MOD_RIFLE_BULLET" && type != "MOD_PISTOL_BULLET") {
        if (type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH") {
            if (distance(point, self gettagorigin("j_head")) > 55) {
                return 0;
            } else {
                return 1;
            }
        } else if (type == "MOD_PROJECTILE") {
            if (distance(point, self gettagorigin("j_head")) > 10) {
                return 0;
            } else {
                return 1;
            }
        } else if (weapon.weapclass != "spread") {
            return 0;
        }
    }
    if (!(self.damagelocation == "head" || self.damagelocation == "helmet" || self.damagelocation == "neck")) {
        return 0;
    }
    if (type == "MOD_PISTOL_BULLET" && weapon.weapclass != "smg" || weapon == level.weaponnone || isdefined(level.start_weapon) && weapon == level.start_weapon || weapon.isgasweapon) {
        return 0;
    }
    if (sessionmodeiscampaigngame() && type == "MOD_PISTOL_BULLET" && weapon.weapclass != "smg") {
        return 0;
    }
    low_health_percent = self.health / self.maxhealth * 100;
    if (low_health_percent > 10) {
        return 0;
    }
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 2, eflags: 0x0
// Checksum 0x12bf6a71, Offset: 0x4798
// Size: 0xd4
function zombie_head_gib(attacker, means_of_death) {
    self endon(#"death");
    if (isdefined(self.head_gibbed) && self.head_gibbed) {
        return;
    }
    self.head_gibbed = 1;
    self zombie_eye_glow_stop();
    if (!(isdefined(self.disable_head_gib) && self.disable_head_gib)) {
        gibserverutils::gibhead(self);
    }
    self thread damage_over_time(ceil(self.health * 0.2), 1, attacker, means_of_death);
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 4, eflags: 0x0
// Checksum 0x7b0ab2d1, Offset: 0x4878
// Size: 0x148
function damage_over_time(dmg, delay, attacker, means_of_death) {
    self endon(#"death", #"exploding");
    if (!isalive(self)) {
        return;
    }
    if (!isplayer(attacker)) {
        attacker = self;
    }
    if (!isdefined(means_of_death)) {
        means_of_death = "MOD_UNKNOWN";
    }
    while (1) {
        if (isdefined(delay)) {
            wait(delay);
        }
        if (isdefined(self)) {
            if (isdefined(attacker)) {
                self dodamage(dmg, self gettagorigin("j_neck"), attacker, self, self.damagelocation, means_of_death, 4096, self.damageweapon);
            } else {
                self dodamage(dmg, self gettagorigin("j_neck"));
            }
        }
    }
}

// Namespace mp_ai_zombie/bhtn_action_start
// Params 1, eflags: 0x40
// Checksum 0x1ebf372a, Offset: 0x49c8
// Size: 0x222
function event_handler[bhtn_action_start] function_320145f7(eventstruct) {
    notify_string = eventstruct.action;
    switch (notify_string) {
    case #"death":
        level thread zmbaivox_playvox(self, notify_string, 1, 4);
        break;
    case #"pain":
        level thread zmbaivox_playvox(self, notify_string, 1, 3);
        break;
    case #"behind":
        level thread zmbaivox_playvox(self, notify_string, 1, 3);
        break;
    case #"attack_melee_notetrack":
        level thread zmbaivox_playvox(self, "attack_melee", 1, 2, 1);
        break;
    case #"chase_state_start":
        level thread zmbaivox_playvox(self, "sprint", 1, 2);
        break;
    case #"sprint":
    case #"ambient":
    case #"crawler":
    case #"teardown":
    case #"taunt":
        level thread zmbaivox_playvox(self, notify_string, 0, 1);
        break;
    case #"attack_melee":
        break;
    default:
        level thread zmbaivox_playvox(self, notify_string, 0, 2);
        break;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 5, eflags: 0x0
// Checksum 0x59e21787, Offset: 0x4bf8
// Size: 0x356
function zmbaivox_playvox(zombie, type, override, priority, delayambientvox = 0) {
    zombie endon(#"death");
    if (!isdefined(zombie)) {
        return;
    }
    if (!isdefined(zombie.voiceprefix)) {
        return;
    }
    if (!isdefined(priority)) {
        priority = 1;
    }
    if (!isdefined(zombie.talking)) {
        zombie.talking = 0;
    }
    if (!isdefined(zombie.currentvoxpriority)) {
        zombie.currentvoxpriority = 1;
    }
    if (!isdefined(self.delayambientvox)) {
        self.delayambientvox = 0;
    }
    if ((type == "ambient" || type == "sprint" || type == "crawler") && isdefined(self.delayambientvox) && self.delayambientvox) {
        return;
    }
    if (delayambientvox) {
        self.delayambientvox = 1;
        self thread zmbaivox_ambientdelay();
    }
    alias = "zmb_vocals_" + zombie.voiceprefix + "_" + type;
    if (sndisnetworksafe()) {
        if (isdefined(override) && override) {
            if (isdefined(zombie.currentvox) && priority >= zombie.currentvoxpriority) {
                zombie stopsound(zombie.currentvox);
            }
            if (type == "death" || type == "death_whimsy" || type == "death_nohead") {
                zombie playsound(alias);
                return;
            }
        }
        if (zombie.talking === 1 && (priority < zombie.currentvoxpriority || priority === 1)) {
            return;
        }
        zombie.talking = 1;
        zombie.currentvox = alias;
        zombie.currentvoxpriority = priority;
        zombie playsoundontag(alias, "j_head");
        playbacktime = soundgetplaybacktime(alias);
        if (!isdefined(playbacktime)) {
            playbacktime = 1;
        }
        if (playbacktime >= 0) {
            playbacktime = playbacktime * 0.001;
        } else {
            playbacktime = 1;
        }
        wait(playbacktime);
        zombie.talking = 0;
        zombie.currentvox = undefined;
        zombie.currentvoxpriority = 1;
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x3e2202a5, Offset: 0x4f58
// Size: 0x5a
function zmbaivox_ambientdelay() {
    self notify(#"sndambientdelay");
    self endon(#"sndambientdelay", #"death", #"disconnect");
    wait(2);
    self.delayambientvox = 0;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x28778800, Offset: 0x4fc0
// Size: 0x24
function networksafereset() {
    while (1) {
        level._numzmbaivox = 0;
        waitframe(1);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xbf1aed62, Offset: 0x4ff0
// Size: 0x54
function sndisnetworksafe() {
    if (!isdefined(level._numzmbaivox)) {
        level thread networksafereset();
    }
    if (level._numzmbaivox >= 2) {
        return 0;
    }
    level._numzmbaivox++;
    return 1;
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x93f85134, Offset: 0x5050
// Size: 0x34
function function_6c308e81() {
    self thread play_ambient_zombie_vocals();
    self thread zmbaivox_playdeath();
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x148268ba, Offset: 0x5090
// Size: 0x180
function play_ambient_zombie_vocals() {
    self endon(#"death");
    self thread function_b8c2c5cc();
    while (1) {
        type = "ambient";
        float = 3;
        if (isdefined(self.aistate)) {
            switch (self.aistate) {
            case 0:
            case 1:
            case 2:
            case 4:
                type = "ambient";
                float = 3;
                break;
            case 3:
                type = "sprint";
                float = 3;
                break;
            }
        }
        if (isdefined(self.missinglegs) && self.missinglegs) {
            float = 2;
            type = "crawler";
        }
        function_6eac4ca1(self, type);
        self notify(#"bhtn_action_notify", {#action:type});
        wait(randomfloatrange(1, float));
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0xb9700dfc, Offset: 0x5218
// Size: 0x54
function zmbaivox_playdeath() {
    self endon(#"disconnect");
    self waittill(#"death");
    if (isdefined(self)) {
        level thread zmbaivox_playvox(self, "death", 1);
    }
}

// Namespace mp_ai_zombie/ct_ai_zombie
// Params 0, eflags: 0x0
// Checksum 0x67058727, Offset: 0x5278
// Size: 0x78
function function_b8c2c5cc() {
    self endon(#"death", #"disconnect");
    while (1) {
        self waittill(#"reset_pathing");
        if (self.aistate == 3) {
            function_6eac4ca1(self, "chase_state_start");
        }
    }
}

