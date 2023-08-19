// Atian COD Tools GSC decompiler test
#include scripts/core_common/fx_shared.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/audio_shared.csc;
#include scripts/core_common/struct.csc;

#namespace tacticalinsertion;

// Namespace tacticalinsertion/tacticalinsertion
// Params 0, eflags: 0x0
// Checksum 0xf74a2a62, Offset: 0xe8
// Size: 0x214
function init_shared() {
    level._effect[#"tacticalinsertionfriendly"] = #"_t6/misc/fx_equip_tac_insert_light_grn";
    level._effect[#"tacticalinsertionenemy"] = #"_t6/misc/fx_equip_tac_insert_light_red";
    clientfield::register("scriptmover", "tacticalinsertion", 1, 1, "int", &spawned, 0, 0);
    latlongstruct = struct::get("lat_long", "targetname");
    if (isdefined(latlongstruct)) {
        mapx = latlongstruct.origin[0];
        mapy = latlongstruct.origin[1];
        lat = latlongstruct.script_vector[0];
        long = latlongstruct.script_vector[1];
    } else {
        if (isdefined(level.worldmapx) && isdefined(level.worldmapy)) {
            mapx = level.worldmapx;
            mapy = level.worldmapy;
        } else {
            mapx = 0;
            mapy = 0;
        }
        if (isdefined(level.worldlat) && isdefined(level.worldlong)) {
            lat = level.worldlat;
            long = level.worldlong;
        } else {
            lat = 34.0216;
            long = -118.449;
        }
    }
    setmaplatlong(mapx, mapy, long, lat);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 7, eflags: 0x0
// Checksum 0xb92932e0, Offset: 0x308
// Size: 0x74
function spawned(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!newval) {
        return;
    }
    self thread playflarefx(localclientnum);
    self thread checkforplayerswitch(localclientnum);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x0
// Checksum 0xce05de76, Offset: 0x388
// Size: 0xf4
function playflarefx(localclientnum) {
    self endon(#"death");
    level endon(#"player_switch");
    self.tacticalinsertionfx = self fx::function_3539a829(localclientnum, level._effect[#"tacticalinsertionfriendly"], level._effect[#"tacticalinsertionenemy"], "tag_flash");
    self thread watchtacinsertshutdown(localclientnum, self.tacticalinsertionfx);
    looporigin = self.origin;
    audio::playloopat("fly_tinsert_beep", looporigin);
    self thread stopflareloopwatcher(looporigin);
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 2, eflags: 0x0
// Checksum 0x9c320f6f, Offset: 0x488
// Size: 0x4c
function watchtacinsertshutdown(localclientnum, fxhandle) {
    self waittill(#"death");
    if (isdefined(fxhandle)) {
        stopfx(localclientnum, fxhandle);
    }
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x0
// Checksum 0xdf34d534, Offset: 0x4e0
// Size: 0x5c
function stopflareloopwatcher(looporigin) {
    while (1) {
        if (!isdefined(self) || !isdefined(self.tacticalinsertionfx)) {
            audio::stoploopat("fly_tinsert_beep", looporigin);
            break;
        }
        wait(0.5);
    }
}

// Namespace tacticalinsertion/tacticalinsertion
// Params 1, eflags: 0x0
// Checksum 0x44f54af9, Offset: 0x548
// Size: 0x88
function checkforplayerswitch(localclientnum) {
    self endon(#"death");
    while (1) {
        level waittill(#"player_switch");
        if (isdefined(self.tacticalinsertionfx)) {
            stopfx(localclientnum, self.tacticalinsertionfx);
            self.tacticalinsertionfx = undefined;
        }
        waittillframeend();
        self thread playflarefx(localclientnum);
    }
}

