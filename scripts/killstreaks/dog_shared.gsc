#using scripts\abilities\ability_player;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\killstreaks\ai\dog;
#using scripts\killstreaks\ai\escort;
#using scripts\killstreaks\ai\leave;
#using scripts\killstreaks\ai\patrol;
#using scripts\killstreaks\ai\state;
#using scripts\killstreaks\ai\tracking;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\killstreakrules_shared;
#using scripts\killstreaks\killstreaks_shared;

#namespace dog;

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0x45464bba, Offset: 0x1f0
// Size: 0xd4
function init_shared() {
    if (!isdefined(level.dog_shared)) {
        level.dog_shared = {};
        archetypempdog::init();
        clientfield::register("clientuimodel", "hudItems.dogState", 1, 2, "int");
        clientfield::register("actor", "dogState", 1, 1, "int");
        ability_player::function_92292af6(34, undefined, &deployed_off);
        level thread function_8d543b98();
    }
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0xb9af454, Offset: 0x2d0
// Size: 0xe0
function function_8d543b98() {
    level waittill(#"game_ended");
    corpses = getcorpsearray();
    foreach (corpse in corpses) {
        if (isactorcorpse(corpse) && corpse.archetype === #"mp_dog") {
            corpse delete();
        }
    }
}

// Namespace dog/dog_shared
// Params 2, eflags: 0x0
// Checksum 0xb51419fc, Offset: 0x3b8
// Size: 0xc0
function deployed_off(slot, weapon) {
    self gadgetpowerset(slot, 0);
    if (isdefined(self.pers[#"held_gadgets_power"]) && isdefined(self._gadgets_player[slot]) && isdefined(self.pers[#"held_gadgets_power"][self._gadgets_player[slot]])) {
        self.pers[#"held_gadgets_power"][self._gadgets_player[slot]] = 0;
    }
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0x1623f6c9, Offset: 0x480
// Size: 0x268
function spawned(type) {
    assert(isplayer(self));
    playsoundatposition(#"hash_7245f25f5953631c", self.origin);
    player = self;
    bundle = level.killstreaks[type].script_bundle;
    if (player isplayerswimming()) {
        if (isdefined(bundle) && isdefined(level.var_228e8cd6)) {
            player [[ level.var_228e8cd6 ]](bundle.ksweapon);
        }
        if (isdefined(bundle.var_502a0e23)) {
            player iprintlnbold(bundle.var_502a0e23);
        }
        return false;
    }
    if (!player killstreakrules::iskillstreakallowed(type, player.team)) {
        if (isdefined(bundle) && isdefined(level.var_228e8cd6)) {
            player [[ level.var_228e8cd6 ]](bundle.ksweapon);
        }
        return false;
    }
    player tracking::track(2);
    dog = spawn_dog(bundle, player);
    if (!isdefined(dog)) {
        if (isdefined(bundle) && isdefined(level.var_228e8cd6)) {
            player [[ level.var_228e8cd6 ]](bundle.ksweapon);
        }
        return false;
    }
    dog killstreak_bundles::spawned(bundle);
    dog influencers::create_entity_enemy_influencer("dog", player.team);
    ability_player::function_c22f319e(bundle.ksweapon);
    dog clientfield::set("enemyvehicle", 1);
    return true;
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0x94320739, Offset: 0x6f0
// Size: 0xbe
function function_a38d2d73(tacpoint) {
    players = getplayers();
    foreach (player in players) {
        if (distancesquared(tacpoint.origin, player.origin) <= 150 * 150) {
            return true;
        }
    }
    return false;
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0xd8360308, Offset: 0x7b8
// Size: 0xaa
function function_4670789f(tacpoint) {
    players = getplayers();
    foreach (player in players) {
        if (function_96c81b85(tacpoint, player.origin)) {
            return true;
        }
    }
    return false;
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x4
// Checksum 0xebe54478, Offset: 0x870
// Size: 0x10a
function private function_9cb166cd(tacpoints) {
    assert(isdefined(tacpoints) && tacpoints.size);
    filteredpoints = [];
    foreach (tacpoint in tacpoints) {
        if (!function_4670789f(tacpoint) && !function_a38d2d73(tacpoint) && ai_escort::function_d15dd929(tacpoint.origin)) {
            filteredpoints[filteredpoints.size] = tacpoint;
        }
    }
    return filteredpoints;
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x4
// Checksum 0x81b61e6b, Offset: 0x988
// Size: 0x368
function private function_fb11cc0f(owner) {
    cylinder = ai::t_cylinder(owner.origin, 800, 150);
    angles = owner getplayerangles();
    forwarddir = anglestoforward(angles);
    var_84e7232 = owner.origin + vectorscale(forwarddir, 100);
    var_441c6196 = ai::t_cylinder(owner.origin, 100, 150);
    tacpoints = tacticalquery("mp_dog_spawn", owner.origin, owner, cylinder, var_441c6196, var_84e7232);
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:owner.angles};
        }
    }
    tacpoints = tacticalquery("mp_dog_spawn_fallback", owner.origin, owner, cylinder, var_441c6196, var_84e7232);
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:owner.angles};
        }
    }
    tacpoints = tacticalquery("mp_dog_spawn_fallback_2", owner.origin, owner, cylinder, var_441c6196);
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:owner.angles};
        }
    }
    closest = getclosestpointonnavmesh(owner.origin, 1200, 1);
    if (isdefined(closest)) {
        return {#origin:closest, #angles:owner.angles};
    }
    return undefined;
}

// Namespace dog/dog_shared
// Params 2, eflags: 0x0
// Checksum 0xd00d597b, Offset: 0xcf8
// Size: 0x476
function spawn_dog(bundle, owner) {
    if (isdefined(level.var_560ecf29)) {
        spawn = [[ level.var_560ecf29 ]](owner);
    }
    if (!isdefined(spawn)) {
        spawn = function_fb11cc0f(owner);
    }
    if (!isdefined(spawn)) {
        return undefined;
    }
    angles = spawn.angles;
    origin = spawn.origin;
    dog = spawnactor(bundle.var_32f64ba3, origin, angles, "", 1);
    dog ai_patrol::function_d091ff45(bundle);
    dog ai_escort::function_60415868(bundle);
    dog ai_leave::init_leave(bundle.var_cadb59a0);
    dog callback::function_d8abfc3d(#"hash_c3f225c9fa3cb25", &function_3fb68a86);
    dog.goalradius = bundle.var_a562774d;
    dog setentityowner(owner);
    dog setteam(owner.team);
    dog callback::function_d8abfc3d(#"on_ai_killed", &function_d86da2e8);
    dog callback::function_d8abfc3d(#"on_killed_player", &function_64247932);
    dog.ai.var_b1248bd1 = 1;
    dog set_state(1, 1);
    owner thread function_458bc8de(dog);
    owner thread function_2f6f43cf(dog, bundle.ksweapon);
    dog thread killstreaks::function_fff56140(owner, &abort_dog);
    dog callback::function_d8abfc3d(#"on_end_game", &function_a1b9ccf1);
    if (isdefined(bundle.ksduration)) {
        dog thread killstreaks::waitfortimeout(bundle.kstype, bundle.ksduration, &timeout, "death");
    }
    if (!ai_escort::function_d15dd929(dog.origin)) {
        cylinder = ai::t_cylinder(origin, 1500, 250);
        var_441c6196 = ai::t_cylinder(origin, 100, 250);
        tacpoints = tacticalquery("mp_dog_spawn_fallback", origin, self, cylinder, var_441c6196, self.origin);
        if (isdefined(tacpoints) && tacpoints.size) {
            tacpoints = function_9cb166cd(tacpoints);
            if (tacpoints.size) {
                tacpoint = array::random(tacpoints);
                dog forceteleport(tacpoint.origin, dog.angles);
            }
        }
    }
    if (isdefined(level.var_8d02c681)) {
        dog [[ level.var_8d02c681 ]]();
    }
    /#
        owner.killstreak_dog = dog;
    #/
    return dog;
}

// Namespace dog/dog_shared
// Params 2, eflags: 0x0
// Checksum 0x55342d74, Offset: 0x1178
// Size: 0x114
function set_state(state, var_deeb4ee7) {
    self.favoriteenemy = undefined;
    self.ai.hasseenfavoriteenemy = 0;
    function_3fda709e(self.script_owner, state + 1);
    if (isdefined(level.var_c08cd9fa) && isdefined(var_deeb4ee7) && !var_deeb4ee7) {
        self [[ level.var_c08cd9fa ]](state, self);
    }
    if (state == 2) {
        self clientfield::set("dogState", 1);
        if (isdefined(self.script_owner)) {
            self.script_owner globallogic_score::function_d3ca3608(#"hash_28a8b95557ddc249");
        }
        wait 0.5;
    }
    self ai_state::set_state(state);
}

// Namespace dog/dog_shared
// Params 2, eflags: 0x0
// Checksum 0x136c97dd, Offset: 0x1298
// Size: 0x3c
function function_3fda709e(owner, value) {
    if (isdefined(owner)) {
        owner clientfield::set_player_uimodel("hudItems.dogState", value);
    }
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0x7001503c, Offset: 0x12e0
// Size: 0xac
function function_8296c0eb(owner) {
    if (!isdefined(owner)) {
        return false;
    }
    if (!isalive(owner)) {
        return false;
    }
    if (!isplayer(owner)) {
        return false;
    }
    if (owner.sessionstate == "spectator") {
        return false;
    }
    if (owner.sessionstate == "intermission") {
        return false;
    }
    if (isdefined(level.intermission) && level.intermission) {
        return false;
    }
    return true;
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0x351a00a7, Offset: 0x1398
// Size: 0xb4
function toggle_state(owner) {
    if (function_8296c0eb(owner)) {
        owner gestures::function_56e00fbf(#"gestable_dog_calling", undefined, 0);
    }
    if (self ai_state::is_state(1)) {
        self set_state(0, 0);
        return;
    }
    if (self ai_state::is_state(0)) {
        self set_state(1, 0);
    }
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0xc316ce50, Offset: 0x1458
// Size: 0x2c
function function_2d96af8d() {
    self ai_patrol::function_325c6829(self.script_owner.origin);
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x0
// Checksum 0x6726b425, Offset: 0x1490
// Size: 0x106
function function_458bc8de(dog) {
    self endon(#"disconnect");
    dog endon(#"death");
    dog notify(#"hash_27a4203e237c5098");
    dog endon(#"hash_27a4203e237c5098");
    wait 0.5;
    while (true) {
        if (!(isdefined(level.var_347a87db) && level.var_347a87db) && self offhandspecialbuttonpressed() && !self function_104d7b4d() && !self isusingoffhand()) {
            dog toggle_state(self);
            wait 0.5;
        }
        waitframe(1);
    }
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0x40a5984f, Offset: 0x15a0
// Size: 0x2c
function function_a1b9ccf1() {
    self.ignoreall = 1;
    self set_state(0, 0);
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0xcd28ac3c, Offset: 0x15d8
// Size: 0x44
function abort_dog() {
    self.ignoreall = 1;
    self set_state(2, 0);
    self delete();
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0x8c06509f, Offset: 0x1628
// Size: 0x2c
function function_441cdbb6() {
    self.ignoreall = 1;
    self set_state(2, 0);
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x4
// Checksum 0xbbcd39f5, Offset: 0x1660
// Size: 0x3ac
function private function_e74b21de(owner) {
    if (isdefined(owner) && distancesquared(owner.origin, self.origin) < 256 * 256) {
        origin = owner.origin;
        angles = owner getplayerangles();
        forwarddir = anglestoforward(angles);
        var_84e7232 = owner.origin + vectorscale(forwarddir, 100);
    } else {
        origin = self.origin;
        angles = self.angles;
        var_84e7232 = origin;
    }
    cylinder = ai::t_cylinder(origin, 1500, 250);
    var_441c6196 = ai::t_cylinder(origin, 100, 250);
    if (isdefined(owner)) {
        tacpoints = tacticalquery("mp_dog_spawn", origin, owner, cylinder, var_441c6196, var_84e7232);
    } else {
        tacpoints = tacticalquery("mp_dog_spawn", origin, self, cylinder, var_441c6196, var_84e7232);
    }
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:angles};
        }
    }
    if (isdefined(owner)) {
        tacpoints = tacticalquery("mp_dog_spawn_fallback", origin, owner, cylinder, var_441c6196, var_84e7232);
    } else {
        tacpoints = tacticalquery("mp_dog_spawn_fallback", origin, self, cylinder, var_441c6196, var_84e7232);
    }
    if (isdefined(tacpoints) && tacpoints.size) {
        tacpoints = function_9cb166cd(tacpoints);
        if (tacpoints.size) {
            tacpoint = array::random(tacpoints);
            return {#origin:tacpoint.origin, #angles:angles};
        }
    }
    var_ead7a19 = function_b777d194(self.origin);
    if (isdefined(var_ead7a19) && var_ead7a19.size) {
        leavepoint = array::random(var_ead7a19);
        return {#origin:leavepoint, #angles:self.angles};
    }
    return {#origin:self.origin, #angles:self.angles};
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0x382d119d, Offset: 0x1a18
// Size: 0x3c
function function_3fb68a86() {
    self.exit_spawn = function_e74b21de(self.script_owner);
    function_3fda709e(self.script_owner, 0);
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0xb142fe5f, Offset: 0x1a60
// Size: 0x84
function timeout() {
    self endon(#"death");
    if (isdefined(level.var_12347bf6) && level.var_12347bf6) {
        return;
    }
    if (isdefined(self.script_owner)) {
        self.script_owner killstreaks::play_taacom_dialog("dogWeaponTimeout");
    }
    self function_441cdbb6();
}

// Namespace dog/dog_shared
// Params 2, eflags: 0x0
// Checksum 0x74b623bb, Offset: 0x1af0
// Size: 0x54
function function_2f6f43cf(dog, weapon) {
    self endon(#"disconnect");
    dog waittill(#"death");
    self ability_player::function_f2250880(weapon, 0);
}

// Namespace dog/dog_shared
// Params 1, eflags: 0x4
// Checksum 0xcb0873b3, Offset: 0x1b50
// Size: 0x2b4
function private function_d86da2e8(params) {
    if (!isdefined(self) || !isdefined(params)) {
        return;
    }
    function_3fda709e(self.script_owner, 0);
    if (isdefined(params.eattacker) && isplayer(params.eattacker)) {
        bundle = self killstreak_bundles::function_48e9536e();
        if (isdefined(params.weapon) && params.weapon != getweapon(#"dog_ai_defaultmelee") && isplayer(params.eattacker)) {
            if (isdefined(self.script_owner)) {
                self.script_owner globallogic_score::function_5829abe3(params.eattacker, params.weapon, getweapon("dog_ai_defaultmelee"));
            }
        }
        if (isdefined(bundle.var_74711af9)) {
            if (isdefined(self.attackers)) {
                foreach (attacker in self.attackers) {
                    if (attacker != params.eattacker && isdefined(self.script_owner)) {
                        scoreevents::processscoreevent(#"killed_dog_assist", attacker, self.script_owner, undefined);
                    }
                }
            }
        }
        if (isdefined(level.var_d2600afc)) {
            self [[ level.var_d2600afc ]](params.eattacker, self.script_owner, self.meleeweapon, params.weapon);
        }
        if (isdefined(self.script_owner)) {
            self.script_owner killstreaks::play_taacom_dialog("dogWeaponDestroyed");
        }
    }
    if (isdefined(self.script_owner)) {
        self.script_owner globallogic_score::function_d3ca3608(#"hash_28a8b95557ddc249");
    }
}

// Namespace dog/dog_shared
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x1e10
// Size: 0x4
function function_64247932() {
    
}

