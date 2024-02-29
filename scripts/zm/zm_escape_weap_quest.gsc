// Atian COD Tools GSC decompiler test
#using scripts\zm\weapons\zm_weap_tomahawk.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_escape_weap_quest;

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x2
// Checksum 0xe03033b5, Offset: 0x388
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_escape_weap_quest", &__init__, &__main__, undefined);
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xfec6f75d, Offset: 0x3d8
// Size: 0x244
function __init__() {
    n_bits = getminbitcountfornum(4);
    clientfield::register("scriptmover", "" + #"hash_5ecbfb9042fc7f38", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_588871862d19b97d", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_2be4ce9b84bd3b58", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_338ecd1287d0623b", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"tomahawk_pickup_fx", 1, n_bits, "int");
    clientfield::register("scriptmover", "" + #"hash_51657261e835ac7c", 1, n_bits, "int");
    clientfield::register("toplayer", "" + #"tomahawk_pickup_fx", 13000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_51657261e835ac7c", 13000, 1, "int");
    callback::on_start_gametype(&function_bad944b5);
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xbd848ed2, Offset: 0x628
// Size: 0x374
function function_bad944b5() {
    if (!zm_custom::function_901b751c(#"zmequipmentisenabled") || zm_utility::is_standard()) {
        return;
    }
    level flag::init(#"soul_catchers_charged");
    level flag::init(#"tomahawk_pickup_complete");
    level.var_4952e1 = [];
    level.var_b5ca4338 = [];
    level.var_6aa46602 = [];
    level.n_soul_catchers_charged = 0;
    level.var_22f00ccf = array("idle", "scan", "shake", "yawn");
    level.no_gib_in_wolf_area = &check_for_zombie_in_wolf_area;
    level.var_49662f50 = struct::get_array("wolf_position");
    for (i = 0; i < level.var_49662f50.size; i++) {
        level.var_4952e1[i] = level.var_49662f50[i];
        level.var_b5ca4338[i] = getent(level.var_49662f50[i].target, "targetname");
        level.var_6aa46602[i] = struct::get(level.var_49662f50[i].var_799fb8e9);
    }
    for (i = 0; i < level.var_4952e1.size; i++) {
        level.var_4952e1[i].var_43bd3b5 = 0;
        level.var_4952e1[i].var_aa1a7f2e = 0;
        level.var_4952e1[i].s_scene = level.var_6aa46602[i];
        level.var_4952e1[i] thread soul_catcher_check();
        level.var_4952e1[i] thread soul_catcher_state_manager();
        level.var_4952e1[i] thread wolf_head_removal("tomahawk_door_sign_" + i + 1);
        level.var_b5ca4338[i] = getent(level.var_4952e1[i].target, "targetname");
    }
    level thread soul_catchers_charged();
    zm::register_zombie_damage_override_callback(&function_d2093ddd);
    callback::on_connect(&on_player_connect);
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe98f933a, Offset: 0x9a8
// Size: 0x5c
function __main__() {
    if (zm_custom::function_901b751c(#"zmequipmentisenabled") && !zm_utility::is_standard()) {
        level thread tomahawk_pickup();
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x924d9e91, Offset: 0xa10
// Size: 0x172
function on_player_connect() {
    self endon(#"disconnect");
    while (1) {
        var_29b8f3d0 = undefined;
        var_29b8f3d0 = self waittill("new_" + "lethal_grenade");
        w_newweapon = var_29b8f3d0.weapon;
        var_22e180dd = self zm_loadout::get_player_lethal_grenade();
        w_tomahawk = getweapon(#"tomahawk_t8");
        if (w_newweapon == w_tomahawk || var_22e180dd === w_tomahawk) {
            if (self flag::exists(#"hash_46915cd7994e2d33")) {
                self flag::set(#"hash_46915cd7994e2d33");
                if (level flag::exists(#"soul_catchers_charged") && !level flag::get(#"soul_catchers_charged")) {
                    level flag::set(#"soul_catchers_charged");
                }
                return;
            }
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe19921ff, Offset: 0xb90
// Size: 0xb8
function check_for_zombie_in_wolf_area() {
    if (!isdefined(self)) {
        return 0;
    }
    if (self.archetype != "zombie") {
        return 0;
    }
    for (i = 0; i < level.var_4952e1.size; i++) {
        if (self istouching(level.var_b5ca4338[i])) {
            if (!level.var_4952e1[i].is_charged && !level.var_4952e1[i].var_aa1a7f2e) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 13, eflags: 0x1 linked
// Checksum 0xd5836b0a, Offset: 0xc50
// Size: 0x336
function function_d2093ddd(willbekilled, inflictor, attacker, damage, flags, mod, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (self.archetype != "zombie") {
        return;
    }
    if (isdefined(self.var_bfffc79e) && self.var_bfffc79e || isdefined(self.var_fc11268c) && self.var_fc11268c) {
        return;
    }
    if (isplayer(attacker) && (isdefined(willbekilled) && willbekilled || damage >= self.health)) {
        for (i = 0; i < level.var_4952e1.size; i++) {
            if (self istouching(level.var_b5ca4338[i])) {
                if (!level.var_4952e1[i].is_charged && !(isdefined(level.var_4952e1[i].var_aa1a7f2e) && level.var_4952e1[i].var_aa1a7f2e) && level.var_4952e1[i].var_43bd3b5 < 6) {
                    self.ignoreall = 1;
                    self.allowdeath = 0;
                    self.no_gib = 1;
                    self.var_1d02a216 = 1;
                    self.b_ignore_cleanup = 1;
                    self.health = 1;
                    self.animname = "zombie_eaten";
                    self notsolid();
                    self setteam(util::get_enemy_team(self.team));
                    attacker notify(#"hash_2706d6137c04adf4");
                    self.var_cfd3756 = level.var_4952e1[i];
                    self.var_cfd3756.var_aa1a7f2e = 1;
                    if (self.var_cfd3756.var_43bd3b5 == 0) {
                        self.var_cfd3756 notify(#"first_zombie_killed_in_zone");
                        if (!(isdefined(level.wolf_encounter_vo_played) && level.wolf_encounter_vo_played)) {
                            self.var_cfd3756 thread first_wolf_encounter_vo(attacker);
                        }
                    }
                    n_eating_anim = self which_eating_anim();
                    self.var_cfd3756 thread function_e40e9d94(n_eating_anim, self, attacker);
                }
            }
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 3, eflags: 0x1 linked
// Checksum 0x539fb0c4, Offset: 0xf90
// Size: 0x62c
function function_e40e9d94(n_eating_anim, ai_zombie, e_activator) {
    if (!isdefined(ai_zombie)) {
        return;
    }
    ai_zombie thread function_37937b33();
    var_678e573f = util::spawn_model(#"tag_origin", ai_zombie.origin, ai_zombie.angles);
    ai_zombie linkto(var_678e573f);
    if (n_eating_anim == 3) {
        var_f2c6c759 = "Look Front";
        var_3e4fd9fd = "Eat Front";
        var_5dedf8ea = vectorscale((0, 1, 0), 85);
    } else if (n_eating_anim == 4) {
        var_f2c6c759 = "Look Right";
        var_3e4fd9fd = "Eat Right";
        var_5dedf8ea = vectorscale((0, 1, 0), 85);
    } else {
        var_f2c6c759 = "Look Left";
        var_3e4fd9fd = "Eat Left";
        var_5dedf8ea = vectorscale((0, 1, 0), 85);
    }
    var_678e573f scene::play(#"hash_7ab2e0d1b8b97d93", "impact", ai_zombie);
    var_678e573f thread scene::play(#"hash_7ab2e0d1b8b97d93", "rise", ai_zombie);
    var_66a8d5fc = scene::function_8582657c(#"hash_7ab2e0d1b8b97d93", "rise");
    if (isdefined(ai_zombie)) {
        ai_zombie clientfield::set("" + #"hash_588871862d19b97d", 1);
    }
    vec_dir = self.s_scene.origin - var_678e573f.origin;
    var_17deee3d = vectorscale(vec_dir, 0.2);
    v_angles_forward = vectortoangles(vec_dir);
    var_678e573f moveto(var_678e573f.origin + var_17deee3d, var_66a8d5fc, var_66a8d5fc);
    if (self.var_43bd3b5 == 0) {
        self flag::wait_till(#"wolf_intro_anim_complete");
    } else {
        wait(var_66a8d5fc);
    }
    self notify(#"wolf_eating");
    if (self.var_43bd3b5 < 5) {
        self thread function_e07f0c65(e_activator);
    }
    self.s_scene thread scene::play(var_f2c6c759);
    a_scene_ents = self.s_scene.scene_ents;
    foreach (ent in a_scene_ents) {
        if (ent.model === #"c_t8_zmb_mob_wolf_head") {
            var_3e1900e4 = ent;
            break;
        }
    }
    if (!isdefined(ai_zombie)) {
        self notify(#"finished_eating");
        self.var_aa1a7f2e = 0;
        if (isdefined(var_678e573f)) {
            var_678e573f delete();
        }
        return;
    }
    var_678e573f thread scene::play(#"hash_7ab2e0d1b8b97d93", "shrink", ai_zombie);
    var_391fd0d5 = scene::function_8582657c(#"hash_7ab2e0d1b8b97d93", "shrink");
    var_391fd0d5 = var_391fd0d5 / 2;
    v_pos = var_3e1900e4 gettagorigin("tag_mouth_fx");
    if (!isdefined(v_pos)) {
        v_pos = self.s_scene.origin;
    }
    var_678e573f moveto(v_pos, var_391fd0d5, var_391fd0d5);
    var_678e573f rotateto(v_angles_forward + var_5dedf8ea, var_66a8d5fc);
    wait(var_391fd0d5);
    if (isdefined(ai_zombie)) {
        ai_zombie unlink();
        ai_zombie clientfield::set("" + #"hash_588871862d19b97d", 0);
        self.s_scene scene::play(var_3e4fd9fd, ai_zombie);
    } else {
        self.s_scene scene::play(var_3e4fd9fd);
    }
    var_3e1900e4 clientfield::increment("" + #"hash_2be4ce9b84bd3b58");
    self.var_43bd3b5++;
    self notify(#"finished_eating");
    self.var_aa1a7f2e = 0;
    if (isdefined(ai_zombie)) {
        ai_zombie delete();
    }
    var_678e573f delete();
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7f5e317e, Offset: 0x15c8
// Size: 0x6c
function function_37937b33() {
    self endon(#"death");
    self waittill(#"zombie_eaten_hide");
    self clientfield::increment("" + #"hash_338ecd1287d0623b");
    self ghost();
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa061f913, Offset: 0x1640
// Size: 0xf8
function which_eating_anim() {
    soul_catcher = self.var_cfd3756;
    forward_dot = vectordot(anglestoforward(soul_catcher.angles), vectornormalize(self.origin - soul_catcher.origin));
    if (forward_dot > 0.85) {
        return 3;
    } else {
        right_dot = vectordot(anglestoright(soul_catcher.angles), self.origin - soul_catcher.origin);
        if (right_dot > 0) {
            return 4;
        } else {
            return 5;
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1270c8bf, Offset: 0x1740
// Size: 0x2a4
function soul_catcher_state_manager() {
    self endon(#"hash_13c5316203561c4f");
    wait(1);
    self flag::init(#"wolf_intro_anim_complete");
    if (self.script_noteworthy == "rune_3") {
        self.var_740e1e0e = getent("rune_3", "targetname");
    } else if (self.script_noteworthy == "rune_2") {
        self.var_740e1e0e = getent("rune_2", "targetname");
    } else if (self.script_noteworthy == "rune_1") {
        self.var_740e1e0e = getent("rune_1", "targetname");
    }
    self waittill(#"first_zombie_killed_in_zone");
    if (isdefined(self.t_hurt)) {
        self.t_hurt show();
    }
    self.var_740e1e0e clientfield::set("" + #"hash_5ecbfb9042fc7f38", 1);
    self.s_scene scene::play("Start");
    self flag::set(#"wolf_intro_anim_complete");
    self waittill(#"finished_eating");
    while (!self.is_charged) {
        self thread function_ee929ece();
        self waittill(#"fully_charged", #"finished_eating");
    }
    self notify(#"hash_1c2dd0a16f7ac134");
    self.var_740e1e0e clientfield::set("" + #"hash_5ecbfb9042fc7f38", 0);
    self.var_740e1e0e setmodel("p8_zm_esc_dream_catcher");
    self.s_scene scene::play("Depart");
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4c8cc6d4, Offset: 0x19f0
// Size: 0xe2
function function_ee929ece() {
    self notify(#"wolf_idling");
    self endon(#"wolf_eating", #"hash_1c2dd0a16f7ac134", #"wolf_idling");
    while (1) {
        var_ba0da6c = array::random(level.var_22f00ccf);
        self.s_scene thread scene::play(var_ba0da6c);
        var_c74251a4 = scene::function_8582657c(self.s_scene.scriptbundlename, var_ba0da6c);
        wait(var_c74251a4 + randomintrange(4, 10));
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x108a27e9, Offset: 0x1ae0
// Size: 0x8c
function wolf_head_removal(wolf_head_model_string) {
    wolf_head_model = getent(wolf_head_model_string, "targetname");
    wolf_head_model setmodel(#"p8_zm_esc_dream_catcher_off");
    self waittill(#"fully_charged");
    wolf_head_model setmodel(#"p8_zm_esc_dream_catcher");
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2850b6ad, Offset: 0x1b78
// Size: 0x68
function soul_catchers_charged() {
    while (1) {
        if (level.n_soul_catchers_charged >= level.var_4952e1.size) {
            level flag::set(#"soul_catchers_charged");
            level notify(#"soul_catchers_charged");
            break;
        }
        wait(1);
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe2b87585, Offset: 0x1be8
// Size: 0xd4
function soul_catcher_check() {
    self endon(#"hash_13c5316203561c4f");
    self.is_charged = 0;
    while (1) {
        if (self.var_43bd3b5 >= 6) {
            level.n_soul_catchers_charged++;
            self.is_charged = 1;
            self notify(#"fully_charged");
            level thread function_5fd2c72e();
            break;
        }
        waitframe(1);
    }
    self thread function_41b1af8c();
    if (level.n_soul_catchers_charged >= level.var_4952e1.size) {
        level flag::set(#"soul_catchers_charged");
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xce94ae87, Offset: 0x1cc8
// Size: 0xd2
function function_e07f0c65(e_activator) {
    if (!zm_utility::is_classic()) {
        return;
    }
    a_closest = function_74c96a90(e_activator);
    for (i = 0; i < a_closest.size; i++) {
        if (!(isdefined(a_closest[i].dontspeak) && a_closest[i].dontspeak)) {
            a_closest[i] thread zm_audio::create_and_play_dialog(#"wolf_head", #"feed");
            break;
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc9e5b6cd, Offset: 0x1da8
// Size: 0x102
function function_41b1af8c() {
    if (!zm_utility::is_classic()) {
        return;
    }
    wait(3.5);
    a_players = getplayers();
    a_closest = util::get_array_of_closest(self.origin, a_players);
    for (i = 0; i < a_closest.size; i++) {
        if (!(isdefined(a_closest[i].dontspeak) && a_closest[i].dontspeak)) {
            a_closest[i] thread zm_audio::create_and_play_dialog(#"wolf_head", #"comp", level.n_soul_catchers_charged - 1);
            break;
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xabd509f, Offset: 0x1eb8
// Size: 0xd8
function first_wolf_encounter_vo(e_activator) {
    wait(2);
    a_closest = function_74c96a90(e_activator);
    for (i = 0; i < a_closest.size; i++) {
        if (!(isdefined(a_closest[i].dontspeak) && a_closest[i].dontspeak)) {
            a_closest[i] thread zm_audio::create_and_play_dialog(#"wolf_head", #"feed_first", undefined, 1);
            level.wolf_encounter_vo_played = 1;
            break;
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 1, eflags: 0x5 linked
// Checksum 0x211a4fc9, Offset: 0x1f98
// Size: 0x162
function private function_74c96a90(e_activator) {
    var_8114dab6 = 0;
    switch (self.script_noteworthy) {
    case #"rune_1":
        var_e251bafa = "zone_broadway_floor_2";
        break;
    case #"rune_2":
        var_e251bafa = "zone_warden_house_exterior";
        break;
    case #"rune_3":
        var_e251bafa = "zone_new_industries";
        break;
    default:
        var_e251bafa = "";
        break;
    }
    if (isalive(e_activator)) {
        str_player_zone = e_activator zm_zonemgr::get_player_zone();
        if (isdefined(str_player_zone) && str_player_zone == var_e251bafa) {
            var_8114dab6 = 1;
        }
    }
    if (var_8114dab6) {
        a_closest = array(e_activator);
    } else {
        a_closest = arraysortclosest(level.players, self.origin);
    }
    return a_closest;
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb2cc5d8c, Offset: 0x2108
// Size: 0x294
function tomahawk_pickup() {
    level flag::wait_till(#"soul_catchers_charged");
    var_fd22f9df = struct::get("tom_pil");
    mdl_tomahawk = var_fd22f9df.scene_ents[#"prop 2"];
    mdl_tomahawk waittill(#"hash_72879554ff8d0b60");
    wait(0.5);
    mdl_tomahawk playloopsound(#"amb_tomahawk_swirl");
    s_pos_trigger = struct::get("t_tom_pos", "targetname");
    if (isdefined(s_pos_trigger)) {
        trigger = spawn("trigger_radius_use", s_pos_trigger.origin, 0, 275, 100);
        trigger.script_noteworthy = "rt_pickup_trigger";
        trigger triggerignoreteam();
        if (function_8b1a219a()) {
            trigger sethintstring(#"hash_456f80deeaa8ebee");
        } else {
            trigger sethintstring(#"hash_1cf1c33d78cb53aa");
        }
        trigger setcursorhint("HINT_NOICON");
    }
    if (isdefined(trigger)) {
        trigger thread tomahawk_pickup_trigger();
        foreach (e_player in getplayers()) {
            e_player thread function_6300f001();
        }
        callback::on_connect(&function_6300f001);
    }
    level flag::set(#"tomahawk_pickup_complete");
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xee038907, Offset: 0x23a8
// Size: 0x64
function function_5fd2c72e() {
    var_f14a8b00 = struct::get("tom_pil");
    str_shot_name = "Shot " + level.n_soul_catchers_charged + 1;
    var_f14a8b00 thread scene::play(str_shot_name);
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5db2867f, Offset: 0x2418
// Size: 0xde
function tomahawk_pickup_trigger() {
    while (1) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        e_player = s_result.activator;
        if (!e_player hasweapon(getweapon(#"tomahawk_t8")) && !e_player hasweapon(getweapon(#"tomahawk_t8_upgraded"))) {
            self thread function_f0ef3897(e_player);
            waitframe(1);
        }
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x94fe4cf9, Offset: 0x2500
// Size: 0x434
function function_f0ef3897(e_player) {
    e_player notify(#"obtained_tomahawk");
    e_player endon(#"obtained_tomahawk", #"disconnect");
    var_fd22f9df = struct::get("tom_pil");
    mdl_tomahawk = var_fd22f9df.scene_ents[#"prop 2"];
    mdl_tomahawk setinvisibletoplayer(e_player);
    self setinvisibletoplayer(e_player);
    e_player zm_utility::disable_player_move_states(1);
    e_player.var_67e1d531 = e_player._gadgets_player[1];
    e_player zm_weapons::weapon_take(e_player._gadgets_player[1]);
    if (e_player flag::exists(#"hash_11ab20934759ebc3") && e_player flag::get(#"hash_11ab20934759ebc3")) {
        e_player zm_weapons::weapon_give(getweapon(#"tomahawk_t8_upgraded"));
        str_tutorial = #"hash_77bbe7cec9945ff5";
        if (!(isdefined(e_player.var_e9c9a450) && e_player.var_e9c9a450)) {
            e_player thread zm_audio::create_and_play_dialog(#"ax_upgrade", #"pickup", undefined, 1);
            e_player.var_e9c9a450 = 1;
        }
    } else {
        e_player zm_weapons::weapon_give(getweapon(#"tomahawk_t8"));
        str_tutorial = #"hash_a89ec051050c008";
        if (!(isdefined(e_player.var_d2351fa5) && e_player.var_d2351fa5)) {
            e_player thread zm_audio::create_and_play_dialog(#"ax", #"pickup", undefined, 1);
            e_player.var_d2351fa5 = 1;
        }
    }
    e_player thread function_b5b00d86();
    if (isdefined(e_player.var_16735873) && e_player.var_16735873) {
        e_player waittill(#"fasttravel_over");
    }
    e_player thread zm_equipment::show_hint_text(str_tutorial);
    if (self.script_noteworthy == "rt_pickup_trigger") {
        e_player.retriever_trigger = self;
    }
    e_player clientfield::set_to_player("tomahawk_in_use", 1);
    e_player notify(#"player_obtained_tomahawk");
    level notify(#"tomahawk_aquired");
    e_player zm_stats::increment_client_stat("prison_tomahawk_acquired", 0);
    if (e_player flag::exists(#"hash_11ab20934759ebc3") && e_player flag::get(#"hash_11ab20934759ebc3")) {
        e_player clientfield::set_to_player("" + #"upgraded_tomahawk_in_use", 1);
    }
    e_player zm_utility::enable_player_move_states();
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x37ba4feb, Offset: 0x2940
// Size: 0xd4
function function_b5b00d86() {
    self endon(#"disconnect");
    self enableweapons();
    self enableoffhandweapons();
    self freezecontrols(1);
    wait(0.1);
    self gestures::function_56e00fbf("gestable_zombie_tomahawk_flourish", undefined, 0);
    wait(1.5);
    if (isdefined(self.var_16735873) && self.var_16735873) {
        self disableweapons();
        self freezecontrols(0);
    }
}

// Namespace zm_escape_weap_quest/zm_escape_weap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xadb339ac, Offset: 0x2a20
// Size: 0x3ec
function function_6300f001() {
    if (isbot(self)) {
        return;
    }
    self endon(#"disconnect");
    var_6668e57a = getent("rt_pickup_trigger", "script_noteworthy");
    var_fd22f9df = struct::get("tom_pil");
    mdl_tomahawk = var_fd22f9df.scene_ents[#"prop 2"];
    while (isplayer(self)) {
        if (isdefined(var_6668e57a)) {
            if (level flag::get(#"soul_catchers_charged") && !self hasweapon(getweapon(#"tomahawk_t8")) && !self hasweapon(getweapon(#"tomahawk_t8_upgraded"))) {
                if (!self flag::exists(#"hash_120fbb364796cd32") && !self flag::exists(#"hash_11ab20934759ebc3") || !self flag::get(#"hash_120fbb364796cd32") || self flag::get(#"hash_11ab20934759ebc3")) {
                    var_6668e57a setvisibletoplayer(self);
                    mdl_tomahawk setvisibletoplayer(self);
                    if (self flag::exists(#"hash_11ab20934759ebc3") && self flag::get(#"hash_11ab20934759ebc3")) {
                        self clientfield::set_to_player("" + #"hash_51657261e835ac7c", 1);
                    } else {
                        self clientfield::set_to_player("" + #"tomahawk_pickup_fx", 1);
                    }
                } else {
                    var_6668e57a setinvisibletoplayer(self);
                    mdl_tomahawk setinvisibletoplayer(self);
                    self clientfield::set_to_player("" + #"tomahawk_pickup_fx", 0);
                    self clientfield::set_to_player("" + #"hash_51657261e835ac7c", 0);
                    waitframe(1);
                }
            } else {
                var_6668e57a setinvisibletoplayer(self);
                mdl_tomahawk setinvisibletoplayer(self);
                self clientfield::set_to_player("" + #"tomahawk_pickup_fx", 0);
                self clientfield::set_to_player("" + #"hash_51657261e835ac7c", 0);
                waitframe(1);
            }
        }
        wait(1);
    }
}

