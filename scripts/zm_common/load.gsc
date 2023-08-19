// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_aoe.gsc;
#include scripts/zm_common/zm_zonemgr.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_traps.gsc;
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_score.gsc;
#include scripts/zm_common/zm_power.gsc;
#include scripts/zm_common/zm_magicbox.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm_clone.gsc;
#include scripts/zm_common/zm_blockers.gsc;
#include scripts/zm_common/zm_behavior.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/callbacks.gsc;
#include scripts/zm_common/bots/zm_bot.gsc;
#include scripts/zm_common/art.gsc;
#include scripts/weapons/zm/weaponobjects.gsc;
#include scripts/zm_common/gametypes/spectating.gsc;
#include scripts/zm_common/gametypes/shellshock.gsc;
#include scripts/zm_common/gametypes/serversettings.gsc;
#include scripts/zm_common/gametypes/clientids.gsc;
#include scripts/zm_common/util.gsc;
#include scripts/zm_common/gametypes/spawnlogic.gsc;
#include scripts/zm_common/zm.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/turret_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/load_shared.gsc;
#include scripts/core_common/hud_message_shared.gsc;
#include scripts/core_common/fx_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/dialog_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/audio_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace load;

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0x9e36e891, Offset: 0x300
// Size: 0x114
function main() {
    /#
        /#
            assert(isdefined(level.first_frame), "<unknown string>");
        #/
    #/
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
    wait(1);
}

// Namespace load/load
// Params 0, eflags: 0x1 linked
// Checksum 0x3a5cdf33, Offset: 0x718
// Size: 0x34
function register_clientfields() {
    clientfield::register("allplayers", "zmbLastStand", 1, 1, "int");
}

