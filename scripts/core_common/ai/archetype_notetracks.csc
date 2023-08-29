// Atian COD Tools GSC decompiler test
#include scripts/core_common/ai_shared.csc;

#namespace notetracks;

// Namespace notetracks/archetype_notetracks
// Params 0, eflags: 0x2
// Checksum 0x2fd4d341, Offset: 0xe8
// Size: 0x6c
function autoexec main() {
    if (sessionmodeiszombiesgame() && getdvarint(#"splitscreen_playercount", 0) > 2) {
        return;
    }
    ai::add_ai_spawn_function(&initializenotetrackhandlers);
}

// Namespace notetracks/archetype_notetracks
// Params 1, eflags: 0x5 linked
// Checksum 0x7ccb7da7, Offset: 0x160
// Size: 0x84
function private initializenotetrackhandlers(localclientnum) {
    addsurfacenotetrackfxhandler(localclientnum, "jumping", "surfacefxtable_jumping");
    addsurfacenotetrackfxhandler(localclientnum, "landing", "surfacefxtable_landing");
    addsurfacenotetrackfxhandler(localclientnum, "vtol_landing", "surfacefxtable_vtollanding");
}

// Namespace notetracks/archetype_notetracks
// Params 3, eflags: 0x5 linked
// Checksum 0x3493d56e, Offset: 0x1f0
// Size: 0x4c
function private addsurfacenotetrackfxhandler(localclientnum, notetrack, surfacetable) {
    entity = self;
    entity thread handlesurfacenotetrackfx(localclientnum, notetrack, surfacetable);
}

// Namespace notetracks/archetype_notetracks
// Params 3, eflags: 0x5 linked
// Checksum 0xddb39af1, Offset: 0x248
// Size: 0xb0
function private handlesurfacenotetrackfx(localclientnum, notetrack, surfacetable) {
    entity = self;
    entity endon(#"death");
    while (1) {
        entity waittill(notetrack);
        fxname = entity getaifxname(localclientnum, surfacetable);
        if (isdefined(fxname)) {
            playfx(localclientnum, fxname, entity.origin);
        }
    }
}

