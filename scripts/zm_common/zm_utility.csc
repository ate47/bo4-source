#using scripts\core_common\activecamo_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_maptable;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_weapons;

#namespace zm_utility;

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x2
// Checksum 0x7d99f724, Offset: 0x1d8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_utility", &__init__, &__main__, undefined);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xdfc7ccb0, Offset: 0x228
// Size: 0x16c
function __init__() {
    level._effect[#"zm_zone_edge_marker"] = #"hash_3002526b7ff53cbf";
    clientfield::register("scriptmover", "zm_zone_edge_marker_count", 1, getminbitcountfornum(15), "int", &zm_zone_edge_marker_count, 0, 0);
    clientfield::register("toplayer", "zm_zone_out_of_bounds", 1, 1, "int", &zm_zone_out_of_bounds, 0, 0);
    clientfield::register("actor", "flame_corpse_fx", 1, 1, "int", &flame_corpse_fx, 0, 0);
    clientfield::register("actor", "zombie_eye_glow", 1, 1, "int", &zombie_eye_glow, 0, 0);
    function_c599ed65();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x3a0
// Size: 0x4
function __main__() {
    
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x7799cbec, Offset: 0x3b0
// Size: 0x5a
function ignore_triggers(timer) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self.ignoretriggers = 1;
    if (isdefined(timer)) {
        wait timer;
    } else {
        wait 0.5;
    }
    self.ignoretriggers = 0;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x68c16ba, Offset: 0x418
// Size: 0x6
function is_encounter() {
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xebd8bdcf, Offset: 0x428
// Size: 0x46
function round_up_to_ten(score) {
    new_score = score - score % 10;
    if (new_score < score) {
        new_score += 10;
    }
    return new_score;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x74d840ab, Offset: 0x478
// Size: 0x68
function round_up_score(score, value) {
    score = int(score);
    new_score = score - score % value;
    if (new_score < score) {
        new_score += value;
    }
    return new_score;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x6868c432, Offset: 0x4e8
// Size: 0x3a
function halve_score(n_score) {
    n_score /= 2;
    n_score = round_up_score(n_score, 10);
    return n_score;
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x0
// Checksum 0x5cc564dd, Offset: 0x530
// Size: 0xd8
function spawn_weapon_model(localclientnum, weapon, model = weapon.worldmodel, origin, angles, options) {
    weapon_model = spawn(localclientnum, origin, "script_model");
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    if (isdefined(options)) {
        weapon_model useweaponmodel(weapon, model, options);
    } else {
        weapon_model useweaponmodel(weapon, model);
    }
    return weapon_model;
}

// Namespace zm_utility/zm_utility
// Params 5, eflags: 0x1 linked
// Checksum 0x73339125, Offset: 0x610
// Size: 0xa8
function spawn_buildkit_weapon_model(localclientnum, weapon, camo, origin, angles) {
    weapon_model = spawn(localclientnum, origin, "script_model");
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    weapon_model usebuildkitweaponmodel(localclientnum, weapon, camo);
    weapon_model activecamo::function_e40c785a(localclientnum);
    return weapon_model;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xb0acdb63, Offset: 0x6c0
// Size: 0x40
function is_classic() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zclassic") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x89142e3b, Offset: 0x708
// Size: 0x40
function is_standard() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zstandard") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xac020891, Offset: 0x750
// Size: 0x68
function is_trials() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"ztrials" || level flag::exists(#"ztrial")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xef4d0e7b, Offset: 0x7c0
// Size: 0x40
function is_tutorial() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"ztutorial") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x51dcee30, Offset: 0x808
// Size: 0x40
function is_grief() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zgrief") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x6e713f2, Offset: 0x850
// Size: 0x98
function is_gametype_active(a_gametypes) {
    b_is_gametype_active = 0;
    if (!isarray(a_gametypes)) {
        a_gametypes = array(a_gametypes);
    }
    for (i = 0; i < a_gametypes.size; i++) {
        if (util::get_game_type() == a_gametypes[i]) {
            b_is_gametype_active = 1;
        }
    }
    return b_is_gametype_active;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x14757bc2, Offset: 0x8f0
// Size: 0x42
function is_ee_enabled() {
    if (!getdvarint(#"zm_ee_enabled", 0)) {
        return false;
    }
    if (level.gamedifficulty == 0) {
        return false;
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x0
// Checksum 0xbbbee910, Offset: 0x940
// Size: 0xa4
function setinventoryuimodels(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "zmInventory." + fieldname), newval);
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x0
// Checksum 0xc284562b, Offset: 0x9f0
// Size: 0x84
function setsharedinventoryuimodels(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "zmInventory." + fieldname), newval);
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x0
// Checksum 0x45509752, Offset: 0xa80
// Size: 0xcc
function zm_ui_infotext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "zmInventory.infoText"), fieldname);
        return;
    }
    setuimodelvalue(createuimodel(getuimodelforcontroller(localclientnum), "zmInventory.infoText"), "");
}

/#

    // Namespace zm_utility/zm_utility
    // Params 4, eflags: 0x0
    // Checksum 0xcc815170, Offset: 0xb58
    // Size: 0x296
    function drawcylinder(pos, rad, height, color) {
        currad = rad;
        curheight = height;
        debugstar(pos, 1, color);
        for (r = 0; r < 20; r++) {
            theta = r / 20 * 360;
            theta2 = (r + 1) / 20 * 360;
            line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color, 1, 1, 100);
            line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color, 1, 1, 100);
            line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color, 1, 1, 100);
        }
    }

#/

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x26f9d6f1, Offset: 0xdf8
// Size: 0xb6
function umbra_fix_logic(localclientnum) {
    self endon(#"disconnect");
    self endon(#"death");
    umbra_settometrigger(localclientnum, "");
    while (true) {
        in_fix_area = 0;
        if (isdefined(level.custom_umbra_hotfix)) {
            in_fix_area = self thread [[ level.custom_umbra_hotfix ]](localclientnum);
        }
        if (in_fix_area == 0) {
            umbra_settometrigger(localclientnum, "");
        }
        waitframe(1);
    }
}

// Namespace zm_utility/zm_utility
// Params 5, eflags: 0x0
// Checksum 0xf75624c3, Offset: 0xeb8
// Size: 0x12e
function umbra_fix_trigger(localclientnum, pos, height, radius, umbra_name) {
    bottomy = pos[2];
    topy = pos[2] + height;
    if (self.origin[2] > bottomy && self.origin[2] < topy) {
        if (distance2dsquared(self.origin, pos) < radius * radius) {
            umbra_settometrigger(localclientnum, umbra_name);
            /#
                drawcylinder(pos, radius, height, (0, 1, 0));
            #/
            return true;
        }
    }
    /#
        drawcylinder(pos, radius, height, (1, 0, 0));
    #/
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x468f7ad2, Offset: 0xff0
// Size: 0xa6
function function_f8796df3(localclientnum) {
    b_first = 0;
    if (isplayer(self) && self function_21c0fa55() && !isdemoplaying()) {
        if (!isdefined(self getlocalclientnumber()) || localclientnum == self getlocalclientnumber()) {
            b_first = 1;
        }
    }
    return b_first;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x59dbacf1, Offset: 0x10a0
// Size: 0xba
function function_5d8fd5f3(localclientnum) {
    b_first = 0;
    if (isplayer(self) && self function_21c0fa55() && !isdemoplaying()) {
        if (!isdefined(self getlocalclientnumber()) || localclientnum == self getlocalclientnumber()) {
            if (!isthirdperson(localclientnum)) {
                b_first = 1;
            }
        }
    }
    return b_first;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xf2caf4a9, Offset: 0x1168
// Size: 0x14e
function function_467efa7b(var_9f3fb329 = 0) {
    if (!isdefined(self.archetype)) {
        return "tag_origin";
    }
    switch (self.archetype) {
    case #"stoker":
    case #"catalyst":
    case #"gladiator":
    case #"nova_crawler":
    case #"zombie":
    case #"ghost":
    case #"brutus":
        if (var_9f3fb329) {
            str_tag = "j_spine4";
        } else {
            str_tag = "j_spineupper";
        }
        break;
    case #"blight_father":
    case #"tiger":
    case #"elephant":
        str_tag = "j_head";
        break;
    default:
        str_tag = "tag_origin";
        break;
    }
    return str_tag;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0xe03acfd7, Offset: 0x12c0
// Size: 0x100
function function_bb54a31f(localclientnum, var_20804e3b, var_3ab46b9) {
    self endon(var_3ab46b9);
    s_result = level waittill(#"respawn");
    a_e_players = getlocalplayers();
    foreach (e_player in a_e_players) {
        if (e_player postfx::function_556665f2(var_20804e3b)) {
            e_player postfx::exitpostfxbundle(var_20804e3b);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0xad7199ef, Offset: 0x13c8
// Size: 0xf6
function function_ae3780f1(localclientnum, n_fx_id, var_3ab46b9) {
    self endon(var_3ab46b9);
    s_result = level waittill(#"respawn");
    a_e_players = getlocalplayers();
    foreach (e_player in a_e_players) {
        if (isdefined(n_fx_id)) {
            deletefx(localclientnum, n_fx_id);
            n_fx_id = undefined;
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xdd376061, Offset: 0x14c8
// Size: 0x12
function get_cast() {
    return zm_maptable::get_cast();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x442e838a, Offset: 0x14e8
// Size: 0x12
function get_story() {
    return zm_maptable::get_story();
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0x163c018f, Offset: 0x1508
// Size: 0x248
function zm_zone_edge_marker_count(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval > 0) {
        v_forward = anglestoforward(self.angles);
        v_right = anglestoright(self.angles);
        v_spacing = (0, 0, 0);
        self.origin += v_right * 6;
        for (i = 1; i <= newval; i++) {
            var_a05a609b = playfx(localclientnum, level._effect[#"zm_zone_edge_marker"], self.origin + v_spacing, v_forward);
            if (!isdefined(self.var_dd1709dd)) {
                self.var_dd1709dd = [];
            } else if (!isarray(self.var_dd1709dd)) {
                self.var_dd1709dd = array(self.var_dd1709dd);
            }
            self.var_dd1709dd[self.var_dd1709dd.size] = var_a05a609b;
            v_spacing = v_right * 32 * i;
        }
        return;
    }
    if (isarray(self.var_dd1709dd)) {
        foreach (var_a05a609b in self.var_dd1709dd) {
            stopfx(localclientnum, var_a05a609b);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0x6dfe9b18, Offset: 0x1758
// Size: 0x14c
function zm_zone_out_of_bounds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.var_20861007)) {
        level.var_20861007 = [];
    }
    if (!isdefined(level.var_20861007[localclientnum])) {
        level.var_20861007[localclientnum] = util::spawn_model(localclientnum, "tag_origin");
    }
    if (newval) {
        level.var_20861007[localclientnum] playloopsound(#"hash_6da7ae12f538ef5e", 0.5);
        self postfx::playpostfxbundle(#"hash_798237aa1bad3d7d");
        return;
    }
    level.var_20861007[localclientnum] stopallloopsounds(0.5);
    self postfx::exitpostfxbundle(#"hash_798237aa1bad3d7d");
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0x22c6f8e3, Offset: 0x18b0
// Size: 0x14e
function flame_corpse_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    if (newval == 1) {
        if (isdefined(self.var_71a7fc1c)) {
            stopfx(localclientnum, self.var_71a7fc1c);
        }
        str_tag = "j_spineupper";
        if (!isdefined(self gettagorigin(str_tag))) {
            str_tag = "tag_origin";
        }
        if (isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_torso"])) {
            self.var_71a7fc1c = util::playfxontag(localclientnum, level._effect[#"character_fire_death_torso"], self, str_tag);
        }
        return;
    }
    if (isdefined(self.var_71a7fc1c)) {
        stopfx(localclientnum, self.var_71a7fc1c);
        self.var_71a7fc1c = undefined;
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd9fadefc, Offset: 0x1a08
// Size: 0xa2
function function_c599ed65() {
    if (get_story() == 1) {
        level.var_12b59dee = "rob_zm_eyes_yellow";
        level._effect[#"eye_glow"] = #"hash_760112479afe6e2";
        return;
    }
    level.var_12b59dee = "rob_zm_eyes_orange";
    level._effect[#"eye_glow"] = #"zm_ai/fx8_zombie_eye_glow_orange";
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xe8a1999c, Offset: 0x1ab8
// Size: 0x52
function function_beed5764(var_ee6bcd51, str_fx) {
    if (isdefined(var_ee6bcd51)) {
        level.var_12b59dee = var_ee6bcd51;
    }
    if (isdefined(str_fx)) {
        level._effect[#"eye_glow"] = str_fx;
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x16dabbef, Offset: 0x1b18
// Size: 0xac
function function_704f7c0e(localclientnum) {
    self good_barricade_damaged(localclientnum);
    if (isdefined(self.var_3234aaa4)) {
        var_ee6bcd51 = self.var_3234aaa4;
    } else {
        var_ee6bcd51 = level.var_12b59dee;
    }
    if (isdefined(self.var_3ec34470)) {
        str_fx = self.var_3ec34470;
    } else {
        str_fx = level._effect[#"eye_glow"];
    }
    self function_fe127aaf(localclientnum, var_ee6bcd51, str_fx);
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x435e07e1, Offset: 0x1bd0
// Size: 0x54
function function_3a020b0f(localclientnum, var_ee6bcd51, str_fx) {
    self good_barricade_damaged(localclientnum);
    self function_fe127aaf(localclientnum, var_ee6bcd51, str_fx);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xfed7536d, Offset: 0x1c30
// Size: 0x7e
function good_barricade_damaged(localclientnum) {
    if (isdefined(self.var_12b59dee)) {
        self stoprenderoverridebundle(self.var_12b59dee, "j_head");
        self.var_12b59dee = undefined;
    }
    if (isdefined(self.var_3231a850)) {
        stopfx(localclientnum, self.var_3231a850);
        self.var_3231a850 = undefined;
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x5 linked
// Checksum 0xc347abf8, Offset: 0x1cb8
// Size: 0xc2
function private function_fe127aaf(localclientnum, var_ee6bcd51, str_fx) {
    if (isdefined(var_ee6bcd51)) {
        self playrenderoverridebundle(var_ee6bcd51, "j_head");
        self.var_12b59dee = var_ee6bcd51;
    }
    if (isdefined(str_fx)) {
        if (isdefined(self.var_f87f8fa0)) {
            self.var_3231a850 = util::playfxontag(localclientnum, str_fx, self, self.var_f87f8fa0);
            return;
        }
        self.var_3231a850 = util::playfxontag(localclientnum, str_fx, self, "j_eyeball_le");
    }
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0xd60594de, Offset: 0x1d88
// Size: 0x74
function zombie_eye_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        self function_704f7c0e(localclientnum);
        return;
    }
    self good_barricade_damaged(localclientnum);
}

