// Atian COD Tools GSC decompiler test
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\archetype_skeleton.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_ai_skeleton;

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x2
// Checksum 0xeac6f745, Offset: 0x1f0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_ai_skeleton", &__init__, undefined, undefined);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0x4200e7ab, Offset: 0x238
// Size: 0x48c
function private __init__() {
    /#
        zm_devgui::add_custom_devgui_callback(&function_6ae10cf1);
        level function_6d3ecc88();
    #/
    clientfield::register("scriptmover", "" + #"spartoi_reassemble_clientfield", 16000, 1, "int");
    clientfield::register("actor", "" + #"hash_3a6a3e4ef0a1a999", 16000, 1, "counter");
    spawner::add_archetype_spawn_function(#"skeleton", &function_902ba58c);
    spawner::function_89a2cd87(#"skeleton", &function_e75e796);
    level.var_dd9ff360 = &function_af85a094;
    level.var_3291f056 = new throttle();
    [[ level.var_3291f056 ]]->initialize();
    level.var_64800a5a = &function_be0c9c8b;
    level.var_a5007a40 = &function_137603f;
    level.var_51e07970 = &function_e4ead132;
    level.var_33daab96 = 0;
    level.var_8eaf991c = [];
    if (!isdefined(level.var_8eaf991c)) {
        level.var_8eaf991c = [];
    } else if (!isarray(level.var_8eaf991c)) {
        level.var_8eaf991c = array(level.var_8eaf991c);
    }
    level.var_8eaf991c[level.var_8eaf991c.size] = {#limit:2, #round:1};
    if (!isdefined(level.var_8eaf991c)) {
        level.var_8eaf991c = [];
    } else if (!isarray(level.var_8eaf991c)) {
        level.var_8eaf991c = array(level.var_8eaf991c);
    }
    level.var_8eaf991c[level.var_8eaf991c.size] = {#limit:4, #round:10};
    level.var_53c1f615 = [];
    for (index = 0; index < 2; index++) {
        var_fab8d6ce = util::spawn_model("tag_origin");
        if (!isdefined(level.var_53c1f615)) {
            level.var_53c1f615 = [];
        } else if (!isarray(level.var_53c1f615)) {
            level.var_53c1f615 = array(level.var_53c1f615);
        }
        level.var_53c1f615[level.var_53c1f615.size] = var_fab8d6ce;
        /#
            var_fab8d6ce callback::function_d8abfc3d(#"on_entity_deleted", &function_64ab9843);
        #/
    }
    /#
        assert(isscriptfunctionptr(&function_6318bedf));
    #/
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_706fe37c04dae8e1", &function_6318bedf);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x0
// Checksum 0xefadb906, Offset: 0x6d0
// Size: 0x34
function function_64ab9843(params) {
    /#
        /#
            assert(0, "<unknown string>");
        #/
    #/
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xd7775c8a, Offset: 0x710
// Size: 0x124
function private function_902ba58c() {
    self.var_418bd7f0 = 0;
    self.should_zigzag = 0;
    self setavoidancemask("avoid ai");
    self.closest_player_override = &zm_utility::function_c52e1749;
    self.var_63d2fce2 = &function_979c19d0;
    self.var_ba1bd9b2 = 1;
    self.is_zombie = 1;
    level thread zm_spawner::zombie_death_event(self);
    self.var_e0c4c154 = 1;
    self thread zm_audio::play_ambient_zombie_vocals();
    self thread zm_audio::zmbaivox_notifyconvert();
    self.var_b467f3a1 = &function_946c1972;
    self.var_7cc959b1 = 1;
    self.deathfunction = &zm_spawner::zombie_death_animscript;
    self callback::on_ai_killed(&function_4ac532fd);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xd4d34f14, Offset: 0x840
// Size: 0x124
function private function_e75e796() {
    var_cbba4cd0 = zm_ai_utility::function_8d44707e(0, self.var_5da51be0);
    var_cbba4cd0 = var_cbba4cd0 * (isdefined(level.var_1eb98fb1) ? level.var_1eb98fb1 : 1);
    self.maxhealth = int(var_cbba4cd0);
    self.health = self.maxhealth;
    self.var_490042cd = gettime();
    if (self.var_9fde8624 === #"hash_fd7b9665529dd42" || self.var_9fde8624 === #"hash_1520c8987a671df0") {
        namespace_81245006::initweakpoints(self, #"hash_38f10b2ce9cabebe");
    } else {
        namespace_81245006::initweakpoints(self, #"hash_7bb6fcaf9b4c55cc");
    }
    self zm_score::function_82732ced();
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x3e7e2358, Offset: 0x970
// Size: 0x30
function private function_4ac532fd(s_params) {
    if (isdefined(self.is_charging) && self.is_charging) {
        level.var_33daab96--;
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0x465baccf, Offset: 0x9a8
// Size: 0x24
function private function_979c19d0() {
    self setavoidancemask("avoid ai");
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 12, eflags: 0x5 linked
// Checksum 0x3346d8e8, Offset: 0x9d8
// Size: 0x4b0
function private function_af85a094(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(boneindex)) {
        bonename = getpartname(self, boneindex);
        if (bonename === "j_skeleton_shield" || bonename === "tag_weapon_left") {
            if (self.var_490042cd <= gettime()) {
                self.var_490042cd = gettime() + 300;
                self clientfield::increment("" + #"hash_3a6a3e4ef0a1a999", 1);
            }
            return 0;
        }
    }
    var_a0e07aaa = isdefined(weapon) && zm_loadout::is_hero_weapon(weapon);
    var_786d7e06 = zm_ai_utility::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
    if (var_786d7e06.registerzombie_bgb_used_reinforce && var_786d7e06.var_84ed9a13.type === #"armor") {
        namespace_81245006::function_ef87b7e8(var_786d7e06.var_84ed9a13, damage);
        if (namespace_81245006::function_f29756fe(var_786d7e06.var_84ed9a13) === 3) {
            if (isdefined(var_786d7e06.var_84ed9a13.var_641ce20e) && var_786d7e06.var_84ed9a13.var_641ce20e) {
                namespace_81245006::function_6742b846(self, var_786d7e06.var_84ed9a13);
                self.var_992c3917 = 1;
                self playsoundontag(#"hash_7241c61ae34b51a1", "j_head");
            }
            if (boneindex == 0 && isdefined(var_786d7e06.var_84ed9a13.hittags) && var_786d7e06.var_84ed9a13.hittags.size > 0) {
                boneindex = var_786d7e06.var_84ed9a13.hittags[0];
            }
            var_dc905145 = namespace_81245006::function_37e3f011(self, boneindex, 2);
            if (isdefined(var_dc905145)) {
                namespace_81245006::function_6c64ebd3(var_dc905145, 1);
            }
            destructserverutils::handledamage(inflictor, attacker, damage, idflags, meansofdeath, weapon, point, dir, hitloc, offsettime, boneindex, modelindex);
        }
        if (!var_786d7e06.var_201ce857) {
            damage = 0;
            attacker util::show_hit_marker(!isalive(self));
        }
    }
    if (!(isdefined(self.marked_for_death) && self.marked_for_death) && !var_786d7e06.var_201ce857 && !(isdefined(self.aat_turned) && self.aat_turned) && !var_a0e07aaa && self.var_418bd7f0 < 2 && self.health <= damage && !var_786d7e06.registerzombie_bgb_used_reinforce && hitloc !== "head" && hitloc !== "helmet" && isdefined(meansofdeath) && meansofdeath != "MOD_UNKNOWN") {
        self thread function_c9f197d2();
        damage = 0;
        attacker util::show_hit_marker(!isalive(self));
    }
    return damage;
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0xe82e6e74, Offset: 0xe90
// Size: 0x34
function private function_6318bedf(entity) {
    entity.knockdown = 0;
    self thread function_c9f197d2(0);
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0xe614141c, Offset: 0xed0
// Size: 0x47a
function private function_c9f197d2(var_4c3c217a = 1) {
    self endon(#"death");
    /#
        if (isdefined(self.isdying) && self.isdying) {
            iprintlnbold("<unknown string>" + self getentitynumber() + "<unknown string>" + function_9e72a96(isdefined(self.var_a6ddd958) ? self.var_a6ddd958 : "<unknown string>"));
        }
    #/
    if (var_4c3c217a) {
        self.var_418bd7f0++;
    }
    self.fake_death = 1;
    self.var_7b0667d9 = 1;
    self.var_b4bc9e1f = 1;
    self val::set(#"hash_65edbe063d05f17b", "takedamage", 0);
    self val::set(#"hash_65edbe063d05f17b", "ignoreall", 1);
    self.canbetargetedbyturnedzombies = 0;
    self.b_ignore_cleanup = 1;
    self.ignore_nuke = 1;
    self.var_2f68be48 = undefined;
    self.var_28aab32a = undefined;
    if (hasasm(self)) {
        self asmsetanimationrate(1);
    }
    if (!(isdefined(self.isdying) && self.isdying)) {
        self thread function_42a1dabd();
        waitresult = undefined;
        waitresult = self waittilltimeout(60, #"hash_782dbc5eec90f62f");
        if (waitresult._notify == #"timeout") {
            self val::reset(#"hash_65edbe063d05f17b", "takedamage");
            self kill();
        }
        self solid();
        self show();
    }
    if (isdefined(self)) {
        self.health = int(self.maxhealth);
        weakpoints = namespace_81245006::function_fab3ee3e(self);
        if (isdefined(weakpoints)) {
            foreach (weakpoint in weakpoints) {
                if (weakpoint.type === #"weakpoint") {
                    var_a875aa2b = namespace_81245006::function_f29756fe(weakpoint);
                    namespace_81245006::function_26901d33(weakpoint);
                    namespace_81245006::function_6c64ebd3(weakpoint, var_a875aa2b);
                }
            }
        }
        self.fake_death = 0;
        self.var_7b0667d9 = undefined;
        self.var_b4bc9e1f = undefined;
        self val::reset(#"hash_65edbe063d05f17b", "takedamage");
        self val::reset(#"hash_65edbe063d05f17b", "ignoreall");
        self.canbetargetedbyturnedzombies = 1;
        self.var_6d23c054 = 1;
        self.b_ignore_cleanup = undefined;
        self.ignore_nuke = undefined;
        self.var_2f68be48 = 1;
        self.var_28aab32a = self ai::function_9139c839().var_10460f1e;
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0x95cd1177, Offset: 0x1358
// Size: 0x596
function private function_42a1dabd() {
    if (!isalive(self)) {
        return;
    }
    self endon(#"death");
    var_67f0b3a6 = #"hash_2a19e7c134fac0c9";
    wait_time = self ai::function_9139c839().var_fc268a04;
    self ghost();
    self notsolid();
    var_ee3cfcfe = {#angles:self.angles, #origin:self.origin};
    var_ee3cfcfe thread scene::play(var_67f0b3a6, array(self));
    self.var_e0c4c154 = 0;
    wait(wait_time + randomfloatrange(0.1, 1));
    [[ level.var_3291f056 ]]->waitinqueue(self);
    var_708e5e40 = undefined;
    players = getentitiesinradius(self.origin, 120, 1);
    foreach (player in players) {
        if (abs(player.origin[2] - self.origin[2]) < 50) {
            var_708e5e40 = self function_f78e62a8();
            break;
        }
    }
    if (!isdefined(var_708e5e40)) {
        var_708e5e40 = var_ee3cfcfe;
    }
    self solid();
    if (isdefined(self)) {
        var_ee3cfcfe scene::stop(var_67f0b3a6);
        var_cee6fc30 = #"hash_1b005efa66b0793c";
        if (self.var_9fde8624 == #"skeleton_spear" || self.var_9fde8624 == #"hash_1520c8987a671df0") {
            var_cee6fc30 = #"hash_39b0f562c80e3bb7";
        }
        var_93a62fe = zm_utility::get_closest_valid_player(self.origin, self.ignore_player);
        if (isdefined(var_93a62fe)) {
            angles = vectortoangles(vectornormalize(var_93a62fe.origin - self.origin));
            self forceteleport(self.origin, angles);
            var_ee3cfcfe.angles = angles;
        }
        self thread animation::play(var_cee6fc30, undefined, undefined, 1, 0, 0);
        var_708e5e40.angles = (var_ee3cfcfe.angles[0], var_ee3cfcfe.angles[1] + 90, var_ee3cfcfe.angles[2]);
        var_704f0f40 = #"hash_76de0304e060bae4";
        if (self.var_9fde8624 == #"hash_fd7b9665529dd42" && !(isdefined(self.var_992c3917) && self.var_992c3917)) {
            var_704f0f40 = #"hash_21cc4ecb5263f2fd";
        } else if (self.var_9fde8624 == #"hash_1520c8987a671df0" && !(isdefined(self.var_992c3917) && self.var_992c3917)) {
            var_704f0f40 = #"hash_4b06db801e96b3db";
        } else if (self.var_9fde8624 == #"hash_1520c8987a671df0" || self.var_9fde8624 == #"skeleton_spear") {
            var_704f0f40 = #"hash_3991ae9fa82906a2";
        }
        var_708e5e40 scene::play(var_704f0f40);
        self show();
        self.var_534a42ac = undefined;
        self.var_45bfef99 = undefined;
        archetype_skeleton::function_9f7eb359(self);
        self.var_e0c4c154 = 1;
        self.marked_for_death = undefined;
        if (isdefined(var_708e5e40) && isdefined(var_708e5e40.tacpoint)) {
            var_708e5e40.tacpoint.var_94bf7609 = undefined;
        }
    }
    if (isdefined(self)) {
        self notify(#"hash_782dbc5eec90f62f");
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x3d759a9f, Offset: 0x18f8
// Size: 0x34
function private function_1f4626ba(notifyhash) {
    if (isdefined(self.var_fab8d6ce)) {
        function_a334d2be(self.var_fab8d6ce);
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xfde59579, Offset: 0x1938
// Size: 0x4b6
function private function_f78e62a8() {
    self endoncallback(&function_1f4626ba, #"death");
    level endon(#"end_game");
    var_fab8d6ce = function_3400b39f();
    if (!isdefined(self) || !isdefined(var_fab8d6ce)) {
        return;
    }
    var_fab8d6ce endon(#"death");
    self.var_fab8d6ce = var_fab8d6ce;
    self.var_fab8d6ce.origin = self.origin;
    node = function_52c1730(self.origin, level.zone_nodes, 50);
    if (!isdefined(node)) {
        function_a334d2be(self.var_fab8d6ce);
        return undefined;
    }
    waitframe(1);
    if (!isdefined(self.var_b570cd0e)) {
        tacpoints = tacticalquery(#"hash_293b0897da0d2da2", self, node);
    } else {
        tacpoints = tacticalquery(#"hash_18a2df086e6d53b1", self, self.var_b570cd0e.origin, self.var_b570cd0e);
    }
    if (!isdefined(tacpoints) || tacpoints.size == 0) {
        function_a334d2be(self.var_fab8d6ce);
        return undefined;
    }
    tacpoints = array::randomize(tacpoints);
    var_51601537 = undefined;
    foreach (tacpoint in tacpoints) {
        waitframe(1);
        if (isdefined(tacpoint.node)) {
            continue;
        }
        if (isdefined(tacpoint.var_94bf7609)) {
            continue;
        }
        players = getplayers();
        close_player = arraygetclosest(tacpoint.origin, players, 120);
        if (isdefined(close_player)) {
            continue;
        }
        if (!ispointonnavmesh(tacpoint.origin, self)) {
            continue;
        }
        tacpoint.var_94bf7609 = self;
        var_51601537 = tacpoint;
        break;
    }
    if (isdefined(var_51601537) && isdefined(self.var_fab8d6ce)) {
        var_b042e906 = var_51601537.origin - self.var_fab8d6ce.origin;
        self.var_fab8d6ce clientfield::set("" + #"spartoi_reassemble_clientfield", 1);
        self.var_fab8d6ce moveto(self.var_fab8d6ce.origin + var_b042e906 / 2 + vectorscale((0, 0, 1), 20), 1.6, 0.5);
        wait(1.6);
        if (isdefined(self.var_fab8d6ce)) {
            self.var_fab8d6ce moveto(var_51601537.origin, 1.6, 0, 0.5);
            wait(1.6);
        }
    }
    if (isdefined(self.var_fab8d6ce)) {
        function_a334d2be(self.var_fab8d6ce);
    }
    if (isdefined(var_51601537)) {
        self forceteleport(var_51601537.origin);
        return {#tacpoint:var_51601537, #angles:self.angles, #origin:var_51601537.origin};
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0x8822e2cc, Offset: 0x1df8
// Size: 0x110
function private function_3400b39f() {
    self endon(#"death");
    level endon(#"end_game");
    if (level.var_53c1f615.size <= 0) {
        return undefined;
    }
    while (1) {
        foreach (var_fab8d6ce in level.var_53c1f615) {
            if (!isalive(var_fab8d6ce.owner)) {
                var_fab8d6ce.owner = self;
                return var_fab8d6ce;
            }
        }
        level waittill(#"hash_4c9efef8fa65691d");
        if (level.var_53c1f615.size <= 0) {
            return undefined;
        }
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x425a37ab, Offset: 0x1f10
// Size: 0x60
function private function_a334d2be(var_fab8d6ce) {
    if (isdefined(var_fab8d6ce)) {
        var_fab8d6ce clientfield::set("" + #"spartoi_reassemble_clientfield", 0);
        var_fab8d6ce.owner = undefined;
    }
    level notify(#"hash_4c9efef8fa65691d");
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x5 linked
// Checksum 0x40cf5a80, Offset: 0x1f78
// Size: 0xc4
function private function_be0c9c8b(entity) {
    var_1423159a = 0;
    foreach (var_d2287bdc in level.var_8eaf991c) {
        if (level.round_number < var_d2287bdc.round) {
            break;
        }
        var_1423159a = var_d2287bdc.limit;
    }
    if (level.var_33daab96 >= var_1423159a) {
        return 0;
    }
    return 1;
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xbfac21ed, Offset: 0x2048
// Size: 0x10
function private function_137603f() {
    level.var_33daab96++;
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x5 linked
// Checksum 0xe6e42342, Offset: 0x2060
// Size: 0x10
function private function_e4ead132() {
    level.var_33daab96--;
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x1 linked
// Checksum 0xf08d35f7, Offset: 0x2078
// Size: 0x242
function function_946c1972(eventstruct) {
    notify_string = eventstruct.action;
    if (notify_string === "fakedeath") {
        level thread zm_audio::zmbaivox_playvox(self, "pain", 1, 3);
    }
    if (!(isdefined(self.var_e0c4c154) && self.var_e0c4c154)) {
        return;
    }
    switch (notify_string) {
    case #"death":
        if (isdefined(self.bgb_tone_death) && self.bgb_tone_death) {
            level thread zm_audio::zmbaivox_playvox(self, "death_whimsy", 1, 4);
        } else {
            level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 4);
        }
        break;
    case #"fakedeath":
        level thread zm_audio::zmbaivox_playvox(self, "pain", 1, 3);
        break;
    case #"pain":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 3);
        break;
    case #"melee_vox":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 1, 2, 1);
        break;
    case #"sprint":
    case #"ambient":
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 1);
        break;
    default:
        level thread zm_audio::zmbaivox_playvox(self, notify_string, 0, 2);
        break;
    }
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 0, eflags: 0x4
// Checksum 0x57e95e01, Offset: 0x22c8
// Size: 0xb4
function private function_6d3ecc88() {
    /#
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    #/
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x4
// Checksum 0x7c3b401, Offset: 0x2388
// Size: 0x18a
function private function_6ae10cf1(cmd) {
    /#
        switch (cmd) {
        case #"skeleton_spawn":
            zm_devgui::spawn_archetype("<unknown string>");
            break;
        case #"hash_12e2063dc669bbe0":
            zm_devgui::spawn_archetype("<unknown string>");
            break;
        case #"hash_65bce5ef69a7ff3e":
            zm_devgui::spawn_archetype("<unknown string>");
            break;
        case #"hash_57892c7b7a106128":
            zm_devgui::spawn_archetype("<unknown string>");
            break;
        case #"hash_3889ece40febdc1e":
            function_2d69eef6("<unknown string>");
            break;
        case #"hash_1d61c627e61ca434":
            function_2d69eef6("<unknown string>");
            break;
        case #"hash_2a2ceb9249805ca7":
            function_2d69eef6("<unknown string>");
            break;
        default:
            return 0;
            break;
        }
    #/
}

// Namespace zm_ai_skeleton/zm_ai_skeleton
// Params 1, eflags: 0x4
// Checksum 0x3068cf65, Offset: 0x2520
// Size: 0xb8
function private function_2d69eef6(speed) {
    /#
        skeletons = getaiarchetypearray(#"skeleton");
        foreach (skeleton in skeletons) {
            skeleton zombie_utility::set_zombie_run_cycle(speed);
        }
    #/
}

