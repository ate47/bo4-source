// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace damagefeedback;

// Namespace damagefeedback/damagefeedback_shared
// Params 0, eflags: 0x2
// Checksum 0xfa37ef50, Offset: 0x188
// Size: 0x3c
function autoexec __init__system__() {
    /#
        system::register(#"damagefeedback", &__init__, undefined, undefined);
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 0, eflags: 0x0
// Checksum 0xca8c7376, Offset: 0x1d0
// Size: 0x2c
function __init__() {
    /#
        callback::on_connect(&on_player_connect);
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 0, eflags: 0x0
// Checksum 0x6056184b, Offset: 0x208
// Size: 0x8
function on_player_connect() {
    /#
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe388753a, Offset: 0x218
// Size: 0x96
function should_play_sound(mod) {
    if (!isdefined(mod)) {
        return 0;
    }
    switch (mod) {
    case #"mod_melee_weapon_butt":
    case #"mod_crush":
    case #"mod_hit_by_object":
    case #"mod_grenade_splash":
    case #"mod_melee_assassinate":
    case #"mod_melee":
        return 0;
        break;
    }
    return 1;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 9, eflags: 0x1 linked
// Checksum 0x3e6d3f2a, Offset: 0x2b8
// Size: 0x14a
function play_hit_alert_sfx(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags) {
    if (sessionmodeiscampaigngame()) {
        hitalias = hit_alert_sfx_cp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc);
    }
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        hitalias = hit_alert_sfx_mp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags);
    }
    if (sessionmodeiszombiesgame()) {
        hitalias = hit_alert_sfx_zm(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc);
    }
    return hitalias;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x2eb5a846, Offset: 0x410
// Size: 0x230
function hit_alert_sfx_cp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc) {
    hitalias = undefined;
    suffix = "";
    if (should_play_sound(mod)) {
        if (isdefined(level.growing_hitmarker) && isdefined(victim)) {
            damagestage = damage_feedback_get_stage(victim);
        }
        if (damage_feedback_get_dead(victim, mod, weapon, damagestage)) {
            suffix = "_kill";
        }
        if (isdefined(victim.archetype) && victim.archetype == #"robot") {
            hitalias = #"chr_hitmarker_robot";
        } else if (isdefined(victim.archetype) && (victim.archetype == #"human" || victim.archetype == #"human_riotshield" || victim.archetype == #"human_rpg" || victim.archetype == #"civilian")) {
            hitalias = #"chr_hitmarker_human";
        } else if (isbot(victim)) {
            hitalias = #"chr_hitmarker_human";
        } else if (isplayer(victim)) {
            hitalias = #"chr_hitmarker_human";
        }
        if (isdefined(hitalias)) {
            hitalias = hitalias + suffix;
        }
    }
    return hitalias;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 9, eflags: 0x1 linked
// Checksum 0x92ba6e41, Offset: 0x648
// Size: 0x84e
function hit_alert_sfx_mp(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags) {
    hitalias = undefined;
    if (!isdefined(weapon)) {
        return;
    }
    if (should_play_sound(mod)) {
        if (isdefined(weapon.hitsound) && weapon.hitsound != "") {
            hitalias = weapon.hitsound;
        } else if (weapon.grappleweapon) {
            hitalias = #"hash_671bc9a2de453f2e";
        } else if (weapon.name == #"snowball") {
            hitalias = #"hash_65089a4793316b63";
        } else if (weapon.name == #"waterballoon") {
            hitalias = #"hash_1fd605562fb1fd3a";
        } else if (isvehicle(victim)) {
            hitalias = #"hash_2ce81d103e923201";
        } else if (isdefined(victim) && isdefined(victim.victimsoundmod)) {
            switch (victim.victimsoundmod) {
            case #"safeguard_robot":
                hitalias = #"mpl_hit_alert_escort";
                break;
            case #"vehicle":
                hitalias = #"hash_2ce81d103e923201";
                break;
            default:
                hitalias = #"mpl_hit_alert";
                break;
            }
        } else if (isdefined(inflictor) && isdefined(inflictor.soundmod)) {
            switch (inflictor.soundmod) {
            case #"player":
                if (isdefined(idflags) && idflags & 2048 && isdefined(victim)) {
                    if (isdefined(victim.var_426947c4)) {
                        hitalias = #"hash_74a7b6ba3604ede9";
                    } else if (sessionmodeiswarzonegame()) {
                        hitalias = #"hash_2248618b48085ce5";
                    } else {
                        hitalias = #"mpl_hit_alert";
                    }
                } else if (isdefined(victim) && isdefined(victim.isaiclone) && victim.isaiclone) {
                    hitalias = #"mpl_hit_alert_clone";
                } else if (isdefined(victim) && isdefined(victim.isaiclone) && victim.isaiclone) {
                    hitalias = #"mpl_hit_alert_clone";
                } else if (isdefined(victim) && isdefined(victim.var_342564dd) && victim.var_342564dd) {
                    hitalias = #"hash_3e284f9a53e3010b";
                } else if (isdefined(victim) && isplayer(victim) && isdefined(victim.carryobject) && isdefined(victim.carryobject.hitsound) && isdefined(perkfeedback) && perkfeedback == "armor") {
                    hitalias = victim.carryobject.hitsound;
                } else if (mod == "MOD_BURNED") {
                    hitalias = #"mpl_hit_alert_burn";
                } else if (isdefined(fatal) && fatal) {
                    if (weapons::isheadshot(shitloc, mod)) {
                        hitalias = #"hash_616dd8ea01d089ac";
                    } else {
                        hitalias = #"hash_31e38d8520839566";
                    }
                } else if (weapons::isheadshot(shitloc, mod)) {
                    hitalias = #"hash_29ca1afa9209bfc6";
                } else {
                    if (mod == "MOD_MELEE_WEAPON_BUTT") {
                        goto LOC_0000050c;
                    }
                    if (shitloc === "riotshield") {
                        hitalias = #"prj_bullet_impact_shield";
                    } else {
                        hitalias = #"hash_205c83ac75849f80";
                    LOC_0000050c:
                    }
                LOC_0000050c:
                }
            LOC_0000050c:
                break;
            case #"heatwave":
                hitalias = #"mpl_hit_alert_heatwave";
                break;
            case #"heli":
                hitalias = #"mpl_hit_alert_air";
                break;
            case #"hpm":
                hitalias = #"mpl_hit_alert_hpm";
                break;
            case #"taser_spike":
                hitalias = #"mpl_hit_alert_taser_spike";
                break;
            case #"straferun":
            case #"dog":
                break;
            case #"firefly":
                hitalias = #"mpl_hit_alert_firefly";
                break;
            case #"drone_land":
                hitalias = #"mpl_hit_alert_air";
                break;
            case #"mini_turret":
                hitalias = #"mpl_hit_alert_quiet";
                break;
            case #"raps":
                hitalias = #"mpl_hit_alert_air";
                break;
            case #"default_loud":
                hitalias = #"mpl_hit_heli_gunner";
                break;
            default:
                hitalias = #"mpl_hit_alert";
                break;
            }
        } else if (mod == "MOD_BURNED" || mod == "MOD_DOT") {
            hitalias = #"mpl_hit_alert_burn";
        } else {
            hitalias = #"mpl_hit_alert";
        }
    } else if (mod === "MOD_MELEE_WEAPON_BUTT") {
        if (fatal === 1) {
            hitalias = #"hash_27781beb722b7488";
        }
    } else if (isdefined(inflictor) && isdefined(inflictor.owner) && isdefined(inflictor.owner.soundmod)) {
        if (inflictor.owner.soundmod == #"player" && isdefined(idflags) && idflags & 2048 && isdefined(victim)) {
            if (isdefined(victim.var_426947c4)) {
                hitalias = #"hash_74a7b6ba3604ede9";
            }
        }
    }
    if (isdefined(weapon.hitsound) && weapon.hitsound != "") {
        hitalias = weapon.hitsound;
    }
    return hitalias;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xbd50e562, Offset: 0xea0
// Size: 0x4e
function hit_alert_sfx_zm(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc) {
    hitalias = undefined;
    return hitalias;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc7d98caa, Offset: 0xef8
// Size: 0x7e
function function_34fbafdc(weapon, mod) {
    if (isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3) {
        return 1;
    }
    if (isdefined(weapon) && weapon === level.shockrifleweapon && mod === "MOD_DOT") {
        return 1;
    }
    return 0;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 10, eflags: 0x1 linked
// Checksum 0x92412e6e, Offset: 0xf80
// Size: 0x85e
function update(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags, var_594a2d34) {
    if (!isplayer(self)) {
        return;
    }
    if (isdefined(self.nohitmarkers) && self.nohitmarkers) {
        return 0;
    }
    if (isdefined(weapon) && weapon.statname == #"recon_car" && isdefined(victim) && isdefined(victim.owner) && inflictor === victim.owner) {
        return;
    }
    if (isdefined(weapon) && isdefined(weapon.nohitmarker) && weapon.nohitmarker) {
        return;
    }
    if (!isdefined(self.lasthitmarkertime)) {
        self.lasthitmarkertimes = [];
        self.lasthitmarkertime = 0;
        self.lasthitmarkeroffsettime = 0;
    }
    if (isdefined(psoffsettime) && isdefined(victim)) {
        victim_id = victim getentitynumber();
        if (!isdefined(self.lasthitmarkertimes[victim_id])) {
            self.lasthitmarkertimes[victim_id] = 0;
        }
        if (self.lasthitmarkertime == gettime()) {
            if (self.lasthitmarkertimes[victim_id] === psoffsettime && fatal !== 1) {
                return;
            }
        }
        self.lasthitmarkeroffsettime = psoffsettime;
        self.lasthitmarkertimes[victim_id] = psoffsettime;
    } else if (self.lasthitmarkertime == gettime()) {
        return;
    }
    self.lasthitmarkertime = gettime();
    hitalias = play_hit_alert_sfx(mod, inflictor, perkfeedback, weapon, victim, psoffsettime, shitloc, fatal, idflags);
    if (isdefined(victim) && isdefined(victim.isaiclone) && victim.isaiclone || shitloc === "riotshield") {
        self playhitmarker(hitalias);
        return;
    }
    damagestage = 1;
    if (isdefined(level.growing_hitmarker) && isdefined(victim) && (sessionmodeiscampaigngame() || isplayer(victim))) {
        damagestage = damage_feedback_get_stage(victim, fatal);
    }
    if ((mod === "MOD_DOT" || mod === "MOD_DOT_SELF") && !isdefined(self.var_dbffaa32) && damagestage != 5) {
        return;
    }
    if (!isdefined(var_594a2d34)) {
        var_594a2d34 = function_34fbafdc(weapon, mod);
        if (isdefined(self.viewlockedentity) && isvehicle(self.viewlockedentity) && self.usingvehicle) {
            var_594a2d34 = 0;
        }
    }
    if (isdefined(victim) && isdefined(victim.var_8ac0d510) && victim.var_8ac0d510 && var_594a2d34) {
        return;
    }
    var_32f65675 = 0;
    if (isdefined(victim) && damagestage == 5 && isdefined(level.var_b1ad0b64) && !(isdefined(level.skiplaststand) && level.skiplaststand) && !(isdefined(victim.laststand) && victim.laststand) && isplayer(victim)) {
        var_32f65675 = 1;
    }
    if (isvehicle(victim) && !(isdefined(victim.var_22b9bee1) && victim.var_22b9bee1)) {
        is_vehicle = 1;
    }
    is_dead = damagestage == 5;
    if (isdefined(victim) && victim.archetype === #"robot") {
        is_vehicle = 1;
    }
    if (isdefined(inflictor) && isdefined(victim)) {
        is_friendly = !victim util::isenemyteam(inflictor.team);
    }
    self playhitmarker(hitalias, damagestage, perkfeedback, is_dead, var_594a2d34, is_vehicle, var_32f65675, is_friendly);
    if (isdefined(inflictor) && isplayer(inflictor)) {
        inflictor playrumbleonentity("hitmarker_rumble");
    }
    /#
        if (isdefined(perkfeedback)) {
            if (isdefined(self.hud_damagefeedback_additional)) {
                switch (perkfeedback) {
                case #"flakjacket":
                    self.hud_damagefeedback_additional setshader(#"damage_feedback_flak", 24, 48);
                    break;
                case #"tacticalmask":
                    self.hud_damagefeedback_additional setshader(#"damage_feedback_tac", 24, 48);
                    break;
                case #"armor":
                    self.hud_damagefeedback_additional setshader(#"damage_feedback_armor", 24, 48);
                    break;
                }
                self.hud_damagefeedback_additional.alpha = 1;
                self.hud_damagefeedback_additional fadeovertime(1);
                self.hud_damagefeedback_additional.alpha = 0;
            }
        } else if (isdefined(self.hud_damagefeedback)) {
            self.hud_damagefeedback setshader(#"damage_feedback", 24, 48);
        }
        if (isdefined(self.hud_damagefeedback) && isdefined(level.growing_hitmarker) && isdefined(victim) && (sessionmodeiscampaigngame() || isplayer(victim))) {
            self thread damage_feedback_growth(victim, mod, weapon);
        } else if (isdefined(self.hud_damagefeedback)) {
            self.hud_damagefeedback.x = -12;
            self.hud_damagefeedback.y = -12;
            self.hud_damagefeedback.alpha = 1;
            self.hud_damagefeedback fadeovertime(1);
            self.hud_damagefeedback.alpha = 0;
        }
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe4985e7c, Offset: 0x17e8
// Size: 0x11c
function damage_feedback_get_stage(victim, fatal) {
    if (!isdefined(victim) || !isdefined(victim.maxhealth) || victim.maxhealth <= 0) {
        return 1;
    }
    var_7d71342b = victim.health / victim.maxhealth;
    if (isdefined(victim.laststand) && victim.laststand) {
        if (fatal === 1) {
            return 5;
        }
        return 1;
    } else if (var_7d71342b > 0.74) {
        return 1;
    } else if (var_7d71342b > 0.49) {
        return 2;
    } else if (var_7d71342b > 0.24) {
        return 3;
    } else if (victim.health > 0) {
        return 4;
    } else {
        return 5;
    }
}

// Namespace damagefeedback/damagefeedback_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x5b3a7e8c, Offset: 0x1910
// Size: 0xe6
function damage_feedback_get_dead(victim, mod, weapon, stage) {
    return stage == 5 && (mod == "MOD_BULLET" || mod == "MOD_RIFLE_BULLET" || mod == "MOD_PISTOL_BULLET" || mod == "MOD_HEAD_SHOT" || mod == "MOD_BURNED" || mod == "MOD_DOT" || mod == "MOD_MELEE_WEAPON_BUTT") && !weapon.isheavyweapon && !killstreaks::is_killstreak_weapon(weapon);
}

// Namespace damagefeedback/damagefeedback_shared
// Params 3, eflags: 0x0
// Checksum 0xeedf0ae8, Offset: 0x1a00
// Size: 0x1c6
function damage_feedback_growth(victim, mod, weapon) {
    /#
        if (isdefined(self.hud_damagefeedback)) {
            stage = damage_feedback_get_stage(victim);
            self.hud_damagefeedback.x = -11 + -1 * stage;
            self.hud_damagefeedback.y = -11 + -1 * stage;
            size_x = 22 + 2 * stage;
            size_y = size_x * 2;
            self.hud_damagefeedback setshader(#"damage_feedback", size_x, size_y);
            if (damage_feedback_get_dead(victim, mod, weapon, stage)) {
                self.hud_damagefeedback setshader(#"damage_feedback_glow_orange", size_x, size_y);
                self thread kill_hitmarker_fade();
            } else {
                self.hud_damagefeedback setshader(#"damage_feedback", size_x, size_y);
                self.hud_damagefeedback.alpha = 1;
                self.hud_damagefeedback fadeovertime(1);
                self.hud_damagefeedback.alpha = 0;
            }
        }
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 0, eflags: 0x0
// Checksum 0xa322e795, Offset: 0x1bd0
// Size: 0x96
function kill_hitmarker_fade() {
    /#
        if (!isdefined(self.hud_damagefeedback)) {
            return;
        }
        self notify(#"kill_hitmarker_fade");
        self endon(#"kill_hitmarker_fade", #"disconnect");
        self.hud_damagefeedback.alpha = 1;
        wait(0.25);
        self.hud_damagefeedback fadeovertime(0.3);
        self.hud_damagefeedback.alpha = 0;
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 3, eflags: 0x0
// Checksum 0xe06f007b, Offset: 0x1c70
// Size: 0x156
function update_override(icon, sound, additional_icon) {
    if (!isplayer(self)) {
        return;
    }
    self playlocalsound(sound);
    /#
        if (isdefined(self.hud_damagefeedback)) {
            self.hud_damagefeedback setshader(icon, 24, 48);
            self.hud_damagefeedback.alpha = 1;
            self.hud_damagefeedback fadeovertime(1);
            self.hud_damagefeedback.alpha = 0;
        }
        if (isdefined(self.hud_damagefeedback_additional)) {
            if (!isdefined(additional_icon)) {
                self.hud_damagefeedback_additional.alpha = 0;
            } else {
                self.hud_damagefeedback_additional setshader(additional_icon, 24, 48);
                self.hud_damagefeedback_additional.alpha = 1;
                self.hud_damagefeedback_additional fadeovertime(1);
                self.hud_damagefeedback_additional.alpha = 0;
            }
        }
    #/
}

// Namespace damagefeedback/damagefeedback_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x9b965997, Offset: 0x1dd0
// Size: 0xd6
function dodamagefeedback(weapon, einflictor, idamage, smeansofdeath) {
    if (!isdefined(weapon)) {
        return 0;
    }
    if (isdefined(weapon.nohitmarker) && weapon.nohitmarker) {
        return 0;
    }
    if (level.allowhitmarkers == 0) {
        return 0;
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_MELEE_ASSASSINATE") {
        return 0;
    }
    if (level.allowhitmarkers == 1) {
        if (isdefined(smeansofdeath) && isdefined(idamage)) {
            if (istacticalhitmarker(weapon, smeansofdeath, idamage)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace damagefeedback/damagefeedback_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xfb2560c9, Offset: 0x1eb0
// Size: 0x80
function istacticalhitmarker(weapon, smeansofdeath, idamage) {
    if (weapons::is_grenade(weapon)) {
        if ("Smoke Grenade" == weapon.offhandclass) {
            if (smeansofdeath == "MOD_GRENADE_SPLASH") {
                return 1;
            }
        } else if (idamage == 1) {
            return 1;
        }
    }
    return 0;
}

