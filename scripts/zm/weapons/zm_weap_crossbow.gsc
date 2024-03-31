// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_powerups.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_weap_crossbow;

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x2
// Checksum 0x338cec80, Offset: 0x2d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_crossbow", &__init__, undefined, undefined);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0x17149f33, Offset: 0x318
// Size: 0x54c
function __init__() {
    level.w_crossbow = getweapon(#"ww_crossbow_t8");
    level.w_crossbow_upgraded = getweapon(#"ww_crossbow_t8_upgraded");
    level.w_crossbow_charged = getweapon(#"ww_crossbow_charged_t8");
    level.w_crossbow_charged_upgraded = getweapon(#"ww_crossbow_charged_t8_upgraded");
    level.var_7cfd8159 = [];
    clientfield::register("missile", "" + #"hash_6308b5ed3cbd99e3", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_37c2ef99d645cf87", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_37c2ef99d645cf87", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_690509b9a2ec2ef3", 1, 2, "int");
    clientfield::register("allplayers", "" + #"hash_290836b72f987780", 1, 1, "int");
    clientfield::register("allplayers", "" + #"hash_faa2f4808c12f8d", 1, 1, "int");
    clientfield::register("allplayers", "" + #"hash_6c3560ab45e186ec", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_b38c687db71dae", 1, 1, "int");
    callback::on_ai_damage(&function_615d8c38);
    callback::on_connect(&function_39ffd9fc);
    callback::on_connect(&function_89ec3604);
    callback::on_weapon_change(&crossbow_weapon_change);
    callback::add_weapon_fired(level.w_crossbow, &function_62d37304);
    callback::add_weapon_fired(level.w_crossbow_upgraded, &function_62d37304);
    callback::add_weapon_fired(level.w_crossbow_charged, &function_62d37304);
    callback::add_weapon_fired(level.w_crossbow_charged_upgraded, &function_62d37304);
    namespace_9ff9f642::register_slowdown(#"hash_664a130410d3fd9a", 0.75, 5);
    namespace_9ff9f642::register_slowdown(#"hash_2607a6ffde83b4a7", 0.5, 5);
    namespace_9ff9f642::register_slowdown(#"hash_3a067a5eb7a19857", 0.75, 5);
    namespace_9ff9f642::register_slowdown(#"hash_280fa271c70412cd", 0.75, 5);
    zm_score::register_score_event("crossbow_capture_hold", &function_9eed975c);
    zm_score::register_score_event("crossbow_crawler", &function_9d9c8bc2);
    zm::register_actor_damage_callback(&function_51f76fdb);
    if (!isdefined(level.var_2e1c9680)) {
        level.var_2e1c9680 = new throttle();
        [[ level.var_2e1c9680 ]]->initialize(6, 0.1);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x5 linked
// Checksum 0x4a923440, Offset: 0x870
// Size: 0x280
function private function_89ec3604() {
    self endon(#"disconnect");
    self.var_bcc8f4f0 = 0;
    while (true) {
        w_current = self getcurrentweapon();
        if (is_crossbow(w_current) && self function_8426ad52(w_current) && self attackbuttonpressed() && !self ismeleeing()) {
            if (self.var_bcc8f4f0) {
                self.var_bcc8f4f0 = 0;
            }
            self clientfield::set("" + #"hash_290836b72f987780", 1);
            b_charged = 0;
            while (self attackbuttonpressed() && is_crossbow(w_current) && !self meleebuttonpressed() && !self laststand::player_is_in_laststand()) {
                if (!b_charged && is_crossbow_charged(w_current, self)) {
                    self clientfield::set("" + #"hash_290836b72f987780", 0);
                    b_charged = 1;
                }
                w_current = self getcurrentweapon();
                waitframe(1);
            }
            self clientfield::set("" + #"hash_290836b72f987780", 0);
        } else if (is_crossbow(w_current) && !self isreloading() && !self function_8426ad52(w_current) && !self.var_bcc8f4f0) {
            self.var_bcc8f4f0 = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 12, eflags: 0x1 linked
// Checksum 0x76e26674, Offset: 0xaf8
// Size: 0x1fe
function function_51f76fdb(inflictor, attacker, damage, flags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker) && is_crossbow(weapon) && is_crossbow_charged(weapon, attacker) && attacker zm_powerups::is_insta_kill_active()) {
        if (!isactor(self) || !isdefined(inflictor) || smeansofdeath !== "MOD_PROJECTILE") {
            return -1;
        }
        if (isdefined(inflictor.var_99100b64) && inflictor.var_99100b64 || isdefined(self.var_1df64653) && self.var_1df64653 || isdefined(self.var_427e5396) && self.var_427e5396) {
            return -1;
        }
        if (isdefined(self.var_2c2980d3) && self.var_2c2980d3 || self.archetype == #"elephant_rider" || self.archetype == #"dust_ball") {
            return -1;
        }
        self.instakill_func = &function_b0477b86;
    } else if (self.instakill_func === &function_b0477b86) {
        self.instakill_func = undefined;
    }
    return -1;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x598b49f2, Offset: 0xd00
// Size: 0xba
function function_8426ad52(weapon) {
    if (!is_crossbow(weapon)) {
        return false;
    }
    w_crossbow_base = get_base_crossbow(weapon);
    n_ammo_stock = self getweaponammostock(w_crossbow_base);
    n_ammo_clip = self getweaponammoclip(w_crossbow_base);
    if (n_ammo_stock >= 4 && n_ammo_clip > 0 || n_ammo_clip > 5) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xa148b0bc, Offset: 0xdc8
// Size: 0xa6
function crossbow_weapon_change(params) {
    if (is_crossbow(params.weapon) && !is_crossbow_charged(params.weapon)) {
        self clientfield::set("" + #"hash_b38c687db71dae", 1);
        self thread function_7157628d();
        return;
    }
    self notify(#"hash_72be12bd6b55fdab");
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0x7a4ed718, Offset: 0xe78
// Size: 0x2e8
function function_7157628d() {
    self notify("6e0a9e3b0455824");
    self endon("6e0a9e3b0455824");
    self endoncallback(&function_a4d47b95, #"death", #"disconnect", #"hash_72be12bd6b55fdab");
    self.b_crossbow_charged = 0;
    while (true) {
        w_current = self getcurrentweapon();
        if (is_crossbow(w_current) && self ismeleeing()) {
            self clientfield::set("" + #"hash_b38c687db71dae", 0);
            while (self ismeleeing()) {
                waitframe(1);
            }
            w_current = self getcurrentweapon();
            if (is_crossbow(w_current)) {
                self clientfield::set("" + #"hash_b38c687db71dae", 1);
            }
        } else if (is_crossbow(w_current) && function_8426ad52(w_current) && self.chargeshotlevel > 1 && !self.b_crossbow_charged && self attackbuttonpressed()) {
            self clientfield::set("" + #"hash_faa2f4808c12f8d", 1);
            self clientfield::set("" + #"hash_b38c687db71dae", 0);
            self.b_crossbow_charged = 1;
        } else if (self.b_crossbow_charged && (self.chargeshotlevel <= 1 || !self attackbuttonpressed())) {
            self clientfield::set("" + #"hash_faa2f4808c12f8d", 0);
            self clientfield::set("" + #"hash_b38c687db71dae", 1);
            self.b_crossbow_charged = 0;
        }
        waitframe(1);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x10d48245, Offset: 0x1168
// Size: 0x34
function function_a4d47b95(str_notify) {
    self clientfield::set("" + #"hash_b38c687db71dae", 0);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x5 linked
// Checksum 0xe55371f4, Offset: 0x11a8
// Size: 0x92
function private function_39ffd9fc() {
    self endon(#"disconnect");
    while (true) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"weapon_change");
        w_current = s_waitresult.weapon;
        if (is_crossbow(w_current)) {
            self thread zm_equipment::show_hint_text(#"hash_781f9cab14f565c8");
            return;
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0x3dbb6abb, Offset: 0x1248
// Size: 0x2c
function function_74106de1() {
    self endon(#"death");
    self delete();
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x5815240c, Offset: 0x1280
// Size: 0x3aa
function function_615d8c38(params) {
    if (!is_crossbow(params.weapon)) {
        return;
    }
    if (isdefined(self.var_a05119b7) && self.var_a05119b7) {
        return;
    }
    if (!isplayer(params.eattacker)) {
        return;
    }
    self notify(#"hash_2fb2eddfa6a0ef3f");
    var_59d5af75 = self gettagorigin("j_knee_le");
    if (isdefined(params.einflictor) && params.shitloc === "none" && isdefined(var_59d5af75)) {
        var_47208148 = params.einflictor.origin[2] - var_59d5af75[2];
        if (params.einflictor.origin[2] < var_59d5af75[2] || abs(var_47208148) <= 16) {
            params.shitloc = "left_foot";
        }
    }
    switch (params.shitloc) {
    case #"right_leg_upper":
    case #"left_leg_lower":
    case #"right_leg_lower":
    case #"left_foot":
    case #"right_foot":
    case #"left_leg_upper":
        if (isalive(self)) {
            if (self.archetype == #"zombie") {
                if (is_crossbow_charged(params.weapon) || self.missinglegs && !(isdefined(self.var_410503e) && self.var_410503e)) {
                    self thread function_c805f2f9(params);
                } else {
                    params.eattacker zm_score::player_add_points("crossbow_crawler", 20);
                    self zombie_utility::makezombiecrawler(1);
                    level notify(#"crawler_created", {#zombie:self, #player:params.eattacker, #weapon:params.weapon});
                    self thread function_6119da66();
                }
            } else {
                self thread function_c805f2f9(params);
            }
        }
        break;
    default:
        if (isalive(self) && !(isdefined(self.var_410503e) && self.var_410503e)) {
            self thread function_c805f2f9(params);
        }
        break;
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0xc4eedc1f, Offset: 0x1638
// Size: 0x36
function function_6119da66() {
    self endon(#"death");
    self.var_410503e = 1;
    wait(1);
    self.var_410503e = undefined;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 3, eflags: 0x1 linked
// Checksum 0xdd45f972, Offset: 0x1678
// Size: 0x1dc
function function_6d8527c2(var_37fa9b04, str_scene, str_shot) {
    self endon(#"death");
    params = {#eattacker:var_37fa9b04.attacker, #einflictor:var_37fa9b04.inflictor, #weapon:var_37fa9b04.weapon, #smeansofdeath:var_37fa9b04.mod, #shitloc:"none"};
    self.var_2c2980d3 = 1;
    self clientfield::set("" + #"hash_37c2ef99d645cf87", 1);
    if (isdefined(str_scene)) {
        if (isdefined(str_shot)) {
            self thread scene::play(str_scene, str_shot, self);
        } else {
            self thread scene::play(str_scene, self);
        }
    } else {
        self thread function_8194ec6(is_crossbow_upgraded(params.weapon));
    }
    self function_e1c4ab06(params);
    self clientfield::set("" + #"hash_37c2ef99d645cf87", 0);
    self.var_2c2980d3 = undefined;
    if (isdefined(str_scene)) {
        self thread scene::stop(str_scene);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x5 linked
// Checksum 0xeffac9b1, Offset: 0x1860
// Size: 0xbe
function private function_8194ec6(var_5824ff75 = 0) {
    self endon(#"death");
    if (var_5824ff75) {
        var_a0edda8b = 3;
    } else {
        var_a0edda8b = 1.5;
    }
    while (isdefined(self.var_2c2980d3) && self.var_2c2980d3) {
        self rotateyaw(var_a0edda8b, float(function_60d95f53()) / 1000);
        waitframe(1);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xb38952a, Offset: 0x1928
// Size: 0x9ae
function function_c805f2f9(params) {
    self endon(#"death");
    player = params.eattacker;
    w_crossbow = params.weapon;
    var_5ff12d5f = params.einflictor;
    if (!isactor(self) || !isplayer(player) || !isdefined(var_5ff12d5f)) {
        return;
    }
    if (!isdefined(player.var_7cfd8159)) {
        player.var_7cfd8159 = [];
    }
    player.var_7cfd8159 = array::remove_dead(player.var_7cfd8159);
    if (isdefined(var_5ff12d5f.var_99100b64) && var_5ff12d5f.var_99100b64 || !is_crossbow_charged(w_crossbow) || isdefined(self.var_1df64653) && self.var_1df64653 || isdefined(self.var_427e5396) && self.var_427e5396 || isdefined(self.var_2c2980d3) && self.var_2c2980d3 || params.smeansofdeath === "MOD_MELEE" || self.archetype == #"elephant_rider" || self.archetype == #"dust_ball") {
        if (isdefined(self.var_427e5396) && self.var_427e5396 || isdefined(self.var_2c2980d3) && self.var_2c2980d3) {
            return;
        }
        self.var_a05119b7 = 1;
        n_damage = self function_b3ac0cab(params);
        self function_b261e2a0(n_damage, player, self.origin, params);
        if (isdefined(params.vdir) && self.health <= 0) {
            if (params.shitloc === "head" || params.shitloc === "helmet") {
                gibserverutils::gibhead(self);
            } else if (self.archetype === #"zombie") {
                self zombie_utility::derive_damage_refs(params.vpoint);
            }
            var_eb0d0f20 = 75 * vectornormalize(params.vdir);
            var_eb0d0f20 = (var_eb0d0f20[0], var_eb0d0f20[1], 20);
            self startragdoll();
            self launchragdoll(var_eb0d0f20);
        }
        self.var_a05119b7 = undefined;
        return;
    }
    if (player.var_7cfd8159.size >= 2) {
        var_f0aeb173 = player.var_7cfd8159.size - 2 + 1;
        for (i = 0; i < var_f0aeb173; i++) {
            ai_zombie = player.var_7cfd8159[i];
            if (isalive(ai_zombie)) {
                player.var_7cfd8159[i].var_2c2980d3 = undefined;
            }
        }
    }
    var_5ff12d5f.var_99100b64 = 1;
    self.var_2c2980d3 = 1;
    self.instakill_func = &function_b0477b86;
    level.var_7cfd8159 = array::remove_dead(level.var_7cfd8159);
    if (!isdefined(level.var_7cfd8159)) {
        level.var_7cfd8159 = [];
    } else if (!isarray(level.var_7cfd8159)) {
        level.var_7cfd8159 = array(level.var_7cfd8159);
    }
    level.var_7cfd8159[level.var_7cfd8159.size] = self;
    if (!isdefined(player.var_7cfd8159)) {
        player.var_7cfd8159 = [];
    } else if (!isarray(player.var_7cfd8159)) {
        player.var_7cfd8159 = array(player.var_7cfd8159);
    }
    player.var_7cfd8159[player.var_7cfd8159.size] = self;
    self clientfield::set("" + #"hash_37c2ef99d645cf87", 1);
    str_scene = self function_e43d1b24();
    if (isdefined(str_scene) && isalive(self)) {
        self thread scene::play(str_scene, self);
    } else if (is_crossbow_upgraded(w_crossbow)) {
        self function_9fa5e527(10);
    } else {
        self function_9fa5e527(5);
    }
    self function_e1c4ab06(params);
    if (isdefined(player)) {
        player zm_score::player_add_points("crossbow_capture_hold", 50);
    }
    if (isalive(self)) {
        if (isdefined(str_scene)) {
            if (scene::function_9730988a(str_scene, "outro")) {
                self thread scene::play(str_scene, "outro", self);
            } else {
                self scene::stop(str_scene);
            }
        } else {
            self function_43f61cad();
        }
        self.dont_die_on_me = undefined;
        arrayremovevalue(level.var_7cfd8159, self);
        if (isdefined(player)) {
            arrayremovevalue(player.var_7cfd8159, self);
        }
        n_damage = self function_b3ac0cab(params);
        self function_b261e2a0(n_damage, player, self.origin, params);
        self.var_2c2980d3 = undefined;
        self.var_427e5396 = undefined;
        self.instakill_func = undefined;
        self clientfield::set("" + #"hash_37c2ef99d645cf87", 0);
        if (self.health <= 0 && self.archetype !== #"elephant") {
            self playsound("wpn_scorpion_zombie_explode");
            gibserverutils::annihilate(self);
            v_origin = self.origin;
            a_zombies = array::exclude(getaiteamarray(level.zombie_team), self);
            foreach (ai in a_zombies) {
                if (isalive(ai) && ai function_8a514a61(v_origin, w_crossbow)) {
                    n_damage = ai function_b3ac0cab(params);
                    ai thread function_b261e2a0(n_damage, player, v_origin, params);
                    waitframe(1);
                }
            }
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 2, eflags: 0x1 linked
// Checksum 0xba82a2c3, Offset: 0x22e0
// Size: 0x8c
function function_8a514a61(v_origin, weapon) {
    if (is_crossbow_upgraded(weapon)) {
        if (distancesquared(self.origin, v_origin) <= 44100) {
            return true;
        }
    } else if (distancesquared(self.origin, v_origin) <= 25600) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 4, eflags: 0x1 linked
// Checksum 0x56200f65, Offset: 0x2378
// Size: 0xc4
function function_b261e2a0(n_amount, player, v_origin, params) {
    self endon(#"death");
    [[ level.var_2e1c9680 ]]->waitinqueue(self);
    if (isdefined(player)) {
        self dodamage(n_amount, v_origin, player, params.einflictor, params.shitloc, params.smeansofdeath, 0, params.weapon);
        return;
    }
    self dodamage(n_amount, v_origin);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x892c17c4, Offset: 0x2448
// Size: 0x40
function get_base_crossbow(weapon) {
    if (is_crossbow_upgraded(weapon)) {
        return level.w_crossbow_upgraded;
    }
    return level.w_crossbow;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xefdc7681, Offset: 0x2490
// Size: 0x66
function is_crossbow(weapon) {
    if (weapon === level.w_crossbow || weapon === level.w_crossbow_upgraded || weapon === level.w_crossbow_charged || weapon === level.w_crossbow_charged_upgraded) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 2, eflags: 0x1 linked
// Checksum 0xa21abf36, Offset: 0x2500
// Size: 0x132
function is_crossbow_charged(weapon, player) {
    if (isdefined(player)) {
        w_crossbow_base = get_base_crossbow(weapon);
        n_ammo_stock = player getweaponammostock(w_crossbow_base);
        n_ammo_clip = player getweaponammoclip(w_crossbow_base);
        if ((n_ammo_clip >= 5 || n_ammo_stock >= 4) && (weapon === level.w_crossbow_charged || weapon === level.w_crossbow_charged_upgraded)) {
            return true;
        }
        if (isdefined(player.chargeshotlevel) && player.chargeshotlevel > 1) {
            return true;
        }
    } else if (weapon === level.w_crossbow_charged || weapon === level.w_crossbow_charged_upgraded) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x1a03ec7c, Offset: 0x2640
// Size: 0x3e
function is_crossbow_upgraded(weapon) {
    if (weapon === level.w_crossbow_upgraded || weapon === level.w_crossbow_charged_upgraded) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x602c34f, Offset: 0x2688
// Size: 0x748
function function_e1c4ab06(params) {
    v_origin = self.origin;
    player = params.eattacker;
    e_inflictor = params.einflictor;
    w_crossbow = params.weapon;
    params.smeansofdeath = "MOD_ELECTROCUTED";
    if (is_crossbow_upgraded(w_crossbow)) {
        var_832a6071 = 1;
        n_time = 10;
    } else {
        var_832a6071 = 0;
        n_time = 5;
    }
    wait(0.5);
    while (n_time > 0 && isalive(self) && isdefined(self.var_2c2980d3) && self.var_2c2980d3) {
        level.var_7cfd8159 = array::remove_dead(level.var_7cfd8159);
        a_zombies = array::exclude(getaiteamarray(level.zombie_team), level.var_7cfd8159);
        if (self.archetype === #"elephant" && isdefined(self.ai) && isdefined(self.ai.riders)) {
            a_zombies = array::exclude(a_zombies, self.ai.riders);
        }
        foreach (ai in a_zombies) {
            if (isalive(ai) && ai function_8a514a61(v_origin, w_crossbow) && ai.archetype !== #"dust_ball") {
                if (!(isdefined(ai.var_427e5396) && ai.var_427e5396)) {
                    if (isdefined(player)) {
                        if (!isdefined(player.var_d382ba7a)) {
                            player.var_d382ba7a = [];
                        } else if (!isarray(player.var_d382ba7a)) {
                            player.var_d382ba7a = array(player.var_d382ba7a);
                        }
                        player.var_d382ba7a[player.var_d382ba7a.size] = ai;
                        player.var_d382ba7a = array::remove_dead(player.var_d382ba7a);
                    }
                    ai.var_427e5396 = 1;
                    if (is_crossbow_upgraded(w_crossbow)) {
                        ai clientfield::set("" + #"hash_690509b9a2ec2ef3", 2);
                        ai function_9fa5e527(10);
                    } else {
                        ai clientfield::set("" + #"hash_690509b9a2ec2ef3", 1);
                        ai function_9fa5e527(5);
                    }
                    wait(0.05);
                }
                /#
                    if (isalive(ai) && !isdefined(ai.maxhealth) && isdefined(ai.archetype)) {
                        iprintlnbold("<unknown string>" + function_9e72a96(ai.archetype) + "<unknown string>");
                    }
                #/
                if (isalive(ai) && isdefined(ai.maxhealth)) {
                    if (var_832a6071) {
                        ai function_b261e2a0(int(ai.maxhealth * 0.2), player, v_origin, params);
                    } else {
                        ai function_b261e2a0(int(ai.maxhealth * 0.1), player, v_origin, params);
                    }
                    waitframe(1);
                    continue;
                }
            }
        }
        if (!isalive(self) || !(isdefined(self.var_2c2980d3) && self.var_2c2980d3)) {
            break;
        }
        wait(1);
        n_time = n_time - 1;
    }
    a_zombies = array::exclude(getaiteamarray(level.zombie_team), level.var_7cfd8159);
    foreach (ai in a_zombies) {
        if (isalive(ai) && isdefined(ai.var_427e5396) && ai.var_427e5396) {
            if (isdefined(player) && isarray(player.var_d382ba7a)) {
                arrayremovevalue(player.var_d382ba7a, ai);
            }
            ai.var_427e5396 = undefined;
            ai clientfield::set("" + #"hash_690509b9a2ec2ef3", 0);
            ai function_43f61cad();
            util::wait_network_frame();
        }
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xbbab2685, Offset: 0x2dd8
// Size: 0xba
function function_144a052b(archetype) {
    switch (archetype) {
    case #"catalyst":
    case #"zombie":
        return #"hash_664a130410d3fd9a";
    case #"tiger":
        return #"hash_2607a6ffde83b4a7";
    case #"stoker":
    case #"gladiator":
        return #"hash_3a067a5eb7a19857";
    case #"blight_father":
        return #"hash_280fa271c70412cd";
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xb476ec16, Offset: 0x2ea0
// Size: 0xd4
function function_9fa5e527(var_ad86fdba = 5) {
    var_bef9c0f = function_144a052b(self.archetype);
    switch (self.archetype) {
    case #"catalyst":
    case #"zombie":
        self zombie_utility::set_zombie_run_cycle_override_value("walk");
        break;
    }
    if (isdefined(var_bef9c0f)) {
        self thread namespace_9ff9f642::slowdown(var_bef9c0f);
    }
    self ai::stun(var_ad86fdba);
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0xce738de6, Offset: 0x2f80
// Size: 0xfc
function function_43f61cad() {
    switch (self.archetype) {
    case #"zombie":
        self zombie_utility::set_zombie_run_cycle_restore_from_override();
        break;
    case #"catalyst":
    case #"tiger":
        self zombie_utility::set_zombie_run_cycle_restore_from_override();
        break;
    case #"gladiator":
    case #"blight_father":
    case #"elephant":
        break;
    }
    var_45ba344f = function_144a052b(self.archetype);
    self namespace_9ff9f642::function_520f4da5(var_45ba344f);
    self ai::clear_stun();
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 0, eflags: 0x1 linked
// Checksum 0x67cb818f, Offset: 0x3088
// Size: 0x11e
function function_e43d1b24() {
    switch (self.archetype) {
    case #"zombie":
        str_scene = "aib_t8_zm_zombie_base_dth_ww_xbow";
        break;
    case #"tiger":
        str_scene = "aib_t8_zm_tiger_dth_ww_xbow";
        break;
    case #"catalyst":
        str_scene = "aib_t8_zm_zombie_base_dth_ww_xbow";
        break;
    case #"stoker":
        str_scene = "aib_t8_zm_stoker_dth_ww_xbow";
        break;
    case #"gladiator":
        str_scene = "aib_t8_zm_gladiator_dth_ww_xbow";
        break;
    case #"blight_father":
        str_scene = "aib_t8_zm_blightfather_dth_ww_xbow";
        break;
    case #"elephant":
        str_scene = undefined;
        break;
    default:
        str_scene = "aib_t8_zm_zombie_base_dth_ww_xbow";
        break;
    }
    return str_scene;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0x9f57ccda, Offset: 0x31b0
// Size: 0x3d2
function function_b3ac0cab(params) {
    if (!is_crossbow_upgraded(params.weapon)) {
        switch (self.archetype) {
        case #"zombie":
            var_a3abe438 = 1;
            var_a7727af5 = 2;
            break;
        case #"tiger":
            var_a3abe438 = 1;
            var_a7727af5 = 2;
            break;
        case #"catalyst":
            var_a3abe438 = 0.5;
            var_a7727af5 = 1;
            break;
        case #"stoker":
        case #"gladiator":
            var_a3abe438 = 0.25;
            var_a7727af5 = 1;
            break;
        case #"blight_father":
            var_a3abe438 = 0.2;
            var_a7727af5 = 1;
            break;
        case #"elephant":
            var_a3abe438 = 0.1;
            var_a7727af5 = 1;
            break;
        default:
            var_a3abe438 = 1;
            var_a7727af5 = 1;
            break;
        }
    } else {
        switch (self.archetype) {
        case #"zombie":
            var_a3abe438 = 1;
            var_a7727af5 = 2;
            break;
        case #"tiger":
            var_a3abe438 = 1;
            var_a7727af5 = 2;
            break;
        case #"catalyst":
            var_a3abe438 = 1;
            var_a7727af5 = 2;
            break;
        case #"stoker":
        case #"gladiator":
            var_a3abe438 = 0.25;
            var_a7727af5 = 1;
            break;
        case #"blight_father":
            var_a3abe438 = 0.25;
            var_a7727af5 = 1;
            break;
        case #"elephant":
            var_a3abe438 = 0.2;
            var_a7727af5 = 1;
            break;
        default:
            var_a3abe438 = 1;
            var_a7727af5 = 1;
            break;
        }
    }
    /#
        if (!isdefined(self.maxhealth) && isdefined(self.archetype)) {
            iprintlnbold("<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>");
        }
    #/
    n_damage = 0;
    if (level.round_number <= 23 && isdefined(self.maxhealth)) {
        n_damage = int(self.maxhealth * var_a3abe438);
    } else if (isdefined(self.maxhealth)) {
        var_56334cba = var_a3abe438 - (level.round_number - 23) * var_a7727af5 / 100;
        var_56334cba = math::clamp(var_56334cba, 0.01, 1);
        n_damage = int(self.maxhealth * var_56334cba);
    }
    return n_damage;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 1, eflags: 0x1 linked
// Checksum 0xc760d5a4, Offset: 0x3590
// Size: 0x2f4
function function_62d37304(weapon) {
    self notify("49b4d856fccf9e75");
    self endon("49b4d856fccf9e75");
    self endon(#"disconnect");
    if (is_crossbow_charged(weapon, self)) {
        self clientfield::increment("" + #"hash_6c3560ab45e186ec");
    }
    if (level flagsys::get(#"hash_cad6742c753621")) {
        v_start = self getweaponmuzzlepoint();
        v_end = v_start + self getweaponforwarddir() * 1000;
        s_trace = bullettrace(v_start, v_end, 0, self);
        level notify(#"xbow_hit", {#player:self, #position:s_trace[#"position"]});
    }
    if (isarray(self.weaponobjectwatcherarray)) {
        foreach (s_weapon_object in self.weaponobjectwatcherarray) {
            if (!is_crossbow(s_weapon_object.weapon)) {
                continue;
            }
            if (s_weapon_object.onfizzleout === &function_74106de1) {
                continue;
            }
            s_weapon_object.onfizzleout = &function_74106de1;
        }
    }
    if (is_crossbow_charged(weapon, self)) {
        w_crossbow_base = get_base_crossbow(weapon);
        n_ammo_stock = self getweaponammostock(w_crossbow_base) - 4;
        n_ammo_stock = math::clamp(n_ammo_stock, 0, w_crossbow_base.maxammo);
        n_ammo_clip = self getweaponammoclip(w_crossbow_base);
        self setweaponammostock(w_crossbow_base, n_ammo_stock);
    }
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 3, eflags: 0x1 linked
// Checksum 0x47be5566, Offset: 0x3890
// Size: 0x5e
function function_b0477b86(player, mod, shitloc) {
    w_player = player getcurrentweapon();
    if (is_crossbow(w_player)) {
        return true;
    }
    return false;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 5, eflags: 0x1 linked
// Checksum 0xe10ef1e3, Offset: 0x38f8
// Size: 0x30
function function_9eed975c(event, mod, hit_location, zombie_team, damage_weapon) {
    return 50;
}

// Namespace zm_weap_crossbow/zm_weap_crossbow
// Params 5, eflags: 0x1 linked
// Checksum 0xaa86fc84, Offset: 0x3930
// Size: 0x30
function function_9d9c8bc2(event, mod, hit_location, zombie_team, damage_weapon) {
    return 20;
}

