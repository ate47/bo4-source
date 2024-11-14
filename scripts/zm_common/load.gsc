#using scripts\zm_common\zm_aoe;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_traps;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_clone;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_behavior;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\bots\zm_bot;
#using scripts\zm_common\art;
#using scripts\weapons\zm\weaponobjects;
#using scripts\zm_common\gametypes\spectating;
#using scripts\zm_common\gametypes\shellshock;
#using scripts\zm_common\gametypes\serversettings;
#using scripts\zm_common\gametypes\clientids;
#using scripts\zm_common\util;
#using scripts\zm_common\gametypes\spawnlogic;
#using scripts\zm_common\zm;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\turret_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\load_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\dialog_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\audio_shared;
#using scripts\core_common\struct;

#namespace load;

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0x9e36e891, Offset: 0x300
// Size: 0x114
function main() {
    assert(isdefined(level.first_frame), "<dev string:x38>");
    zm::init();
    level._loadstarted = 1;
    register_clientfields();
    level.aitriggerspawnflags = getaitriggerflags() | 8192;
    level.vehicletriggerspawnflags = getvehicletriggerflags();
    level thread start_intro_screen_zm();
    footsteps();
    system::wait_till("all");
    level thread art_review();
    level flagsys::set(#"load_main_complete");
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0xd098ee3b, Offset: 0x420
// Size: 0x244
function footsteps() {
    if (isdefined(level.fx_exclude_footsteps) && level.fx_exclude_footsteps) {
        return;
    }
    zombie_utility::setfootstepeffect("asphalt", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("brick", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("carpet", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("cloth", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("concrete", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("dirt", "_t6/bio/player/fx_footstep_sand");
    zombie_utility::setfootstepeffect("foliage", "_t6/bio/player/fx_footstep_sand");
    zombie_utility::setfootstepeffect("gravel", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("grass", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("metal", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("mud", "_t6/bio/player/fx_footstep_mud");
    zombie_utility::setfootstepeffect("paper", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("plaster", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("rock", "_t6/bio/player/fx_footstep_dust");
    zombie_utility::setfootstepeffect("sand", "_t6/bio/player/fx_footstep_sand");
    zombie_utility::setfootstepeffect("water", "_t6/bio/player/fx_footstep_water");
    zombie_utility::setfootstepeffect("wood", "_t6/bio/player/fx_footstep_dust");
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0x703c1b88, Offset: 0x670
// Size: 0x9c
function start_intro_screen_zm() {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] lui::screen_fade_out(0, undefined);
        players[i] val::set(#"start_intro_screen_zm", "freezecontrols");
    }
    wait 1;
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0x3a5cdf33, Offset: 0x718
// Size: 0x34
function register_clientfields() {
    clientfield::register("allplayers", "zmbLastStand", 1, 1, "int");
}

