#using scripts\core_common\animation_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\scene_actor_shared;
#using scripts\core_common\scene_objects_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\util_shared;

#namespace scene;

// Namespace scene
// Method(s) 11 Total 108
class csceneactor : csceneobject {

    var _b_set_goal;
    var _e;
    var _o_scene;
    var _s;
    var _str_shot;
    var _str_team;
    var var_1f97724a;
    var var_55b4f21e;

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x57d8be3a, Offset: 0x198
    // Size: 0x22
    constructor() {
        _b_set_goal = 1;
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x43cda14e, Offset: 0x910
    // Size: 0xd4
    function do_death_anims() {
        ent = _e;
        if (isdefined(var_55b4f21e.deathanim) && !(isdefined(ent.var_67d418) && ent.var_67d418)) {
            ent.skipdeath = 1;
            ent animation::play(var_55b4f21e.deathanim, ent, undefined, 1, 0.2, 0);
        } else {
            ent animation::stop();
            ent startragdoll();
        }
        csceneobject::function_1e19d813();
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x6375b46, Offset: 0x7e0
    // Size: 0x124
    function _set_values(ent = self._e) {
        if (!(isdefined(_s.takedamage) && _s.takedamage)) {
            csceneobject::set_ent_val("takedamage", 0, ent);
        }
        csceneobject::set_ent_val("ignoreme", !(isdefined(_s.attackme) && _s.attackme), ent);
        csceneobject::set_ent_val("allowdeath", isdefined(_s.allowdeath) && _s.allowdeath, ent);
        csceneobject::set_ent_val("take_weapons", isdefined(_s.removeweapon) && _s.removeweapon, ent);
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x60f82ac0, Offset: 0x688
    // Size: 0x14c
    function function_d09b043() {
        self notify(#"hash_74f6d3a1ddcff42");
        self endon(#"hash_74f6d3a1ddcff42");
        _o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
        s_waitresult = _e waittill(#"death");
        var_1f97724a = 1;
        _e notify(#"hash_6e7fd8207fd988c6", {#str_scene:_o_scene._str_name});
        if (isdefined(_e) && !(isdefined(_e.skipscenedeath) && _e.skipscenedeath)) {
            self thread do_death_anims();
            return;
        }
        csceneobject::function_1e19d813();
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb5b55206, Offset: 0x570
    // Size: 0x10c
    function set_goal() {
        if (!(_e.scene_spawned === _o_scene._s.name && isdefined(_e.target))) {
            if (!isdefined(_e.script_forcecolor)) {
                if (!_e flagsys::get(#"anim_reach")) {
                    if (isdefined(_e.scenegoal)) {
                        _e setgoal(_e.scenegoal);
                        _e.scenegoal = undefined;
                        return;
                    }
                    if (_b_set_goal) {
                        _e setgoal(_e.origin);
                    }
                }
            }
        }
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8da457f8, Offset: 0x508
    // Size: 0x5a
    function track_goal() {
        self endon(_str_shot + "active");
        _e endon(#"death");
        _e waittill(#"goal_changed");
        _b_set_goal = 0;
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbf179c3c, Offset: 0x3d8
    // Size: 0x124
    function _cleanup() {
        if (isactor(_e) && isalive(_e)) {
            if (isdefined(_s.delaymovementatend) && _s.delaymovementatend) {
                _e pathmode("move delayed", 1, randomfloatrange(2, 3));
            } else {
                _e pathmode("move allowed");
            }
            if (isdefined(_s.lookatplayer) && _s.lookatplayer) {
                _e lookatentity();
            }
            _e.var_67d418 = undefined;
            set_goal();
        }
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x60a8f21e, Offset: 0x2e0
    // Size: 0xec
    function _prepare() {
        if (isactor(_e)) {
            thread track_goal();
            if (isdefined(_s.lookatplayer) && _s.lookatplayer) {
                _e lookatentity(level.activeplayers[0]);
            }
            if (isdefined(_s.skipdeathanim) && _s.skipdeathanim) {
                _e.var_67d418 = 1;
            }
            _str_team = _e getteam();
        }
        csceneobject::_prepare();
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x16b276b6, Offset: 0x238
    // Size: 0x9c
    function function_bc340efa(str_model) {
        _e = spawnactor(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), undefined, 1);
        if (!isdefined(_e)) {
            return;
        }
        _str_team = _e getteam();
        _e setteam(_str_team);
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x61ec3a4, Offset: 0x1c8
    // Size: 0x64
    function _spawn_ent() {
        if (isdefined(_s.model)) {
            if (isassetloaded("aitype", _s.model)) {
                function_bc340efa(_s.model);
            }
        }
    }

}

// Namespace scene
// Method(s) 3 Total 108
class cscenefakeactor : csceneobject, csceneactor {

    var _e;
    var _s;
    var _str_team;

    // Namespace cscenefakeactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x97a6be8, Offset: 0x1fd0
    // Size: 0x294
    function _spawn_ent() {
        if (isspawner(_e)) {
            csceneactor::function_bc340efa(_e.aitype);
            if (isdefined(_e) && !isspawner(_e)) {
                str_model = _e.aitype;
                _str_team = _e getteam();
                weapon = _e.weapon;
                _e delete();
            }
        } else if (isdefined(_s.model)) {
            if (isassetloaded("aitype", _s.model)) {
                csceneactor::function_bc340efa(_s.model);
                if (isdefined(_e)) {
                    str_model = _e.aitype;
                    _str_team = _e getteam();
                    weapon = _e.weapon;
                    _e delete();
                }
            } else {
                str_model = _s.model;
            }
        }
        if (isdefined(str_model)) {
            _e = util::spawn_anim_model(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53());
            _e makefakeai();
            if (!(isdefined(_s.removeweapon) && _s.removeweapon)) {
                if (isdefined(weapon)) {
                    _e animation::attach_weapon(weapon);
                    return;
                }
                _e animation::attach_weapon(getweapon(#"ar_accurate_t8"));
            }
        }
    }

}

// Namespace scene
// Method(s) 7 Total 108
class cscenecompanion : csceneobject, csceneactor {

    var _e;
    var _o_scene;
    var _s;
    var _str_shot;
    var _str_team;

    // Namespace cscenecompanion/scene_actor_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x39b7aacb, Offset: 0x3cf0
    // Size: 0x100
    function animation_lookup(animation, ent = self._e, b_camera = 0) {
        if (isdefined(_s.var_2df1a365)) {
            n_shot = csceneobject::get_shot(_str_shot);
            var_d57bf586 = ent.animname;
            if (isdefined(n_shot) && isdefined(_s.var_2df1a365[n_shot]) && isdefined(_s.var_2df1a365[n_shot][var_d57bf586])) {
                return _s.var_2df1a365[n_shot][var_d57bf586].var_554345e4;
            }
        }
        return animation;
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbb3f2b17, Offset: 0x3c48
    // Size: 0x9c
    function _stop(b_dont_clear_anim) {
        if (isalive(_e)) {
            _e notify(#"scene_stop");
            if (!b_dont_clear_anim) {
                _e animation::stop(0.2);
            }
            _e thread scene::function_37592f67(_o_scene._e_root, _o_scene._s);
        }
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x74ec898e, Offset: 0x3bc0
    // Size: 0x7c
    function _cleanup() {
        if (![[ _o_scene ]]->has_next_shot(_str_shot) || _o_scene._str_mode === "single") {
            _e thread scene::function_37592f67(_o_scene._e_root, _o_scene._s);
        }
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7d46233c, Offset: 0x39c8
    // Size: 0x1ec
    function _spawn_ent() {
        if (isspawner(_e)) {
            if (!csceneobject::error(_e.count < 1, "Trying to spawn AI for scene with spawner count < 1")) {
                _e = _e spawner::spawn(1);
            }
        } else if (isassetloaded("aitype", _s.model)) {
            _e = spawnactor(_s.model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), _s.name, 1);
        }
        if (!isdefined(_e)) {
            return;
        }
        _str_team = _e getteam();
        if (!isdefined(level.heroes)) {
            level.heroes = [];
        }
        level.heroes[_s.name] = _e;
        _s.(_s.name) = _e;
        _e.animname = _s.name;
        _e.is_hero = 1;
        _e.enableterrainik = 1;
        _e util::magic_bullet_shield();
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7ac42c63, Offset: 0x3900
    // Size: 0xbc
    function _spawn() {
        if (!isdefined(level.heroes)) {
            level.heroes = [];
        }
        foreach (ent in level.heroes) {
            if (!csceneobject::in_this_scene(ent)) {
                _e = ent;
                return;
            }
        }
        csceneobject::_spawn();
    }

}

// Namespace scene
// Method(s) 4 Total 108
class cscenesharedcompanion : cscenecompanion, csceneobject, csceneactor {

    // Namespace cscenesharedcompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x2fc37166, Offset: 0x5600
    // Size: 0xac
    function _cleanup() {
        if (!isdefined(level.heroes)) {
            level.heroes = [];
        }
        foreach (ent in level.heroes) {
            ent setvisibletoall();
        }
        cscenecompanion::_cleanup();
    }

    // Namespace cscenesharedcompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x26bae570, Offset: 0x5548
    // Size: 0xb0
    function _prepare() {
        if (!isdefined(level.heroes)) {
            level.heroes = [];
        }
        foreach (ent in level.heroes) {
            ent setinvisibletoall();
            ent setvisibletoall();
        }
    }

}

