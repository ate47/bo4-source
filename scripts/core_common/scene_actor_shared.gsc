// Atian COD Tools GSC decompiler test
#using scripts\core_common\scene_actor_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_objects_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace scene;

// Namespace scene
// Method(s) 11 Total 108
class csceneactor : csceneobject {

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x57d8be3a, Offset: 0x198
    // Size: 0x22
    __constructor() {
        csceneobject::__constructor();
        self._b_set_goal = 1;
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x8b428900, Offset: 0x9f0
    // Size: 0x14
    __destructor() {
        csceneobject::__destructor();
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x43cda14e, Offset: 0x910
    // Size: 0xd4
    function do_death_anims() {
        ent = self._e;
        if (isdefined(self.var_55b4f21e.deathanim) && !(isdefined(ent.var_67d418) && ent.var_67d418)) {
            ent.skipdeath = 1;
            ent animation::play(self.var_55b4f21e.deathanim, ent, undefined, 1, 0.2, 0);
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
        if (!(isdefined(self._s.takedamage) && self._s.takedamage)) {
            csceneobject::set_ent_val("takedamage", 0, ent);
        }
        csceneobject::set_ent_val("ignoreme", !(isdefined(self._s.attackme) && self._s.attackme), ent);
        csceneobject::set_ent_val("allowdeath", isdefined(self._s.allowdeath) && self._s.allowdeath, ent);
        csceneobject::set_ent_val("take_weapons", isdefined(self._s.removeweapon) && self._s.removeweapon, ent);
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x60f82ac0, Offset: 0x688
    // Size: 0x14c
    function function_d09b043() {
        self notify(#"hash_74f6d3a1ddcff42");
        self endon(#"hash_74f6d3a1ddcff42");
        self._o_scene endon(#"scene_done", #"scene_stop", #"scene_skip_completed", #"hash_3168dab591a18b9b");
        s_waitresult = undefined;
        s_waitresult = self._e waittill(#"death");
        self.var_1f97724a = 1;
        self._e notify(#"hash_6e7fd8207fd988c6", {#str_scene:self._o_scene._str_name});
        if (isdefined(self._e) && !(isdefined(self._e.skipscenedeath) && self._e.skipscenedeath)) {
            self thread do_death_anims();
        } else {
            csceneobject::function_1e19d813();
        }
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb5b55206, Offset: 0x570
    // Size: 0x10c
    function set_goal() {
        if (!(self._e.scene_spawned === self._o_scene._s.name && isdefined(self._e.target))) {
            if (!isdefined(self._e.script_forcecolor)) {
                if (!self._e flagsys::get(#"anim_reach")) {
                    if (isdefined(self._e.scenegoal)) {
                        self._e setgoal(self._e.scenegoal);
                        self._e.scenegoal = undefined;
                    } else if (self._b_set_goal) {
                        self._e setgoal(self._e.origin);
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
        self endon(self._str_shot + "active");
        self._e endon(#"death");
        self._e waittill(#"goal_changed");
        self._b_set_goal = 0;
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbf179c3c, Offset: 0x3d8
    // Size: 0x124
    function _cleanup() {
        if (isactor(self._e) && isalive(self._e)) {
            if (isdefined(self._s.delaymovementatend) && self._s.delaymovementatend) {
                self._e pathmode("move delayed", 1, randomfloatrange(2, 3));
            } else {
                self._e pathmode("move allowed");
            }
            if (isdefined(self._s.lookatplayer) && self._s.lookatplayer) {
                self._e lookatentity();
            }
            self._e.var_67d418 = undefined;
            set_goal();
        }
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x60a8f21e, Offset: 0x2e0
    // Size: 0xec
    function _prepare() {
        if (isactor(self._e)) {
            thread track_goal();
            if (isdefined(self._s.lookatplayer) && self._s.lookatplayer) {
                self._e lookatentity(level.activeplayers[0]);
            }
            if (isdefined(self._s.skipdeathanim) && self._s.skipdeathanim) {
                self._e.var_67d418 = 1;
            }
            self._str_team = self._e getteam();
        }
        csceneobject::_prepare();
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x16b276b6, Offset: 0x238
    // Size: 0x9c
    function function_bc340efa(str_model) {
        self._e = spawnactor(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), undefined, 1);
        if (!isdefined(self._e)) {
            return;
        }
        self._str_team = self._e getteam();
        self._e setteam(self._str_team);
    }

    // Namespace csceneactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x61ec3a4, Offset: 0x1c8
    // Size: 0x64
    function _spawn_ent() {
        if (isdefined(self._s.model)) {
            if (isassetloaded("aitype", self._s.model)) {
                function_bc340efa(self._s.model);
            }
        }
    }

}

// Namespace scene
// Method(s) 3 Total 108
class cscenefakeactor : csceneobject, csceneactor {

    // Namespace cscenefakeactor/scene_actor_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0xb9729667, Offset: 0x2270
    // Size: 0x14
    __constructor() {
        csceneactor::__constructor();
    }

    // Namespace cscenefakeactor/scene_actor_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x4eae6ccf, Offset: 0x2290
    // Size: 0x14
    __destructor() {
        csceneactor::__destructor();
    }

    // Namespace cscenefakeactor/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x97a6be8, Offset: 0x1fd0
    // Size: 0x294
    function _spawn_ent() {
        if (isspawner(self._e)) {
            csceneactor::function_bc340efa(self._e.aitype);
            if (isdefined(self._e) && !isspawner(self._e)) {
                str_model = self._e.aitype;
                self._str_team = self._e getteam();
                weapon = self._e.weapon;
                self._e delete();
            }
        } else if (isdefined(self._s.model)) {
            if (isassetloaded("aitype", self._s.model)) {
                csceneactor::function_bc340efa(self._s.model);
                if (isdefined(self._e)) {
                    str_model = self._e.aitype;
                    self._str_team = self._e getteam();
                    weapon = self._e.weapon;
                    self._e delete();
                }
            } else {
                str_model = self._s.model;
            }
        }
        if (isdefined(str_model)) {
            self._e = util::spawn_anim_model(str_model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53());
            self._e makefakeai();
            if (!(isdefined(self._s.removeweapon) && self._s.removeweapon)) {
                if (isdefined(weapon)) {
                    self._e animation::attach_weapon(weapon);
                } else {
                    self._e animation::attach_weapon(getweapon(#"ar_accurate_t8"));
                }
            }
        }
    }

}

// Namespace scene
// Method(s) 7 Total 108
class cscenecompanion : csceneobject, csceneactor {

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0x5ae86d33, Offset: 0x3df8
    // Size: 0x14
    __constructor() {
        csceneactor::__constructor();
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x55d9ac4f, Offset: 0x3e18
    // Size: 0x14
    __destructor() {
        csceneactor::__destructor();
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x39b7aacb, Offset: 0x3cf0
    // Size: 0x100
    function animation_lookup(animation, ent = self._e, b_camera = 0) {
        if (isdefined(self._s.var_2df1a365)) {
            n_shot = csceneobject::get_shot(self._str_shot);
            var_d57bf586 = ent.animname;
            if (isdefined(n_shot) && isdefined(self._s.var_2df1a365[n_shot]) && isdefined(self._s.var_2df1a365[n_shot][var_d57bf586])) {
                return self._s.var_2df1a365[n_shot][var_d57bf586].var_554345e4;
            }
        }
        return animation;
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbb3f2b17, Offset: 0x3c48
    // Size: 0x9c
    function _stop(b_dont_clear_anim) {
        if (isalive(self._e)) {
            self._e notify(#"scene_stop");
            if (!b_dont_clear_anim) {
                self._e animation::stop(0.2);
            }
            self._e thread scene::function_37592f67(self._o_scene._e_root, self._o_scene._s);
        }
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x74ec898e, Offset: 0x3bc0
    // Size: 0x7c
    function _cleanup() {
        if (![[ self._o_scene ]]->has_next_shot(self._str_shot) || self._o_scene._str_mode === "single") {
            self._e thread scene::function_37592f67(self._o_scene._e_root, self._o_scene._s);
        }
    }

    // Namespace cscenecompanion/scene_actor_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7d46233c, Offset: 0x39c8
    // Size: 0x1ec
    function _spawn_ent() {
        if (isspawner(self._e)) {
            if (!csceneobject::error(self._e.count < 1, "Trying to spawn AI for scene with spawner count < 1")) {
                self._e = self._e spawner::spawn(1);
            }
        } else if (isassetloaded("aitype", self._s.model)) {
            self._e = spawnactor(self._s.model, csceneobject::function_d2039b28(), csceneobject::function_f9936b53(), self._s.name, 1);
        }
        if (!isdefined(self._e)) {
            return;
        }
        self._str_team = self._e getteam();
        if (!isdefined(level.heroes)) {
            level.heroes = [];
        }
        level.heroes[self._s.name] = self._e;
        self._s.(self._s.name) = self._e;
        self._e.animname = self._s.name;
        self._e.is_hero = 1;
        self._e.enableterrainik = 1;
        self._e util::magic_bullet_shield();
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
                self._e = ent;
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
    // Params 0, eflags: 0x89 linked class_linked
    // Checksum 0x51f1d872, Offset: 0x56b8
    // Size: 0x14
    __constructor() {
        cscenecompanion::__constructor();
    }

    // Namespace cscenesharedcompanion/scene_actor_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x184c3499, Offset: 0x56d8
    // Size: 0x14
    __destructor() {
        cscenecompanion::__destructor();
    }

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

