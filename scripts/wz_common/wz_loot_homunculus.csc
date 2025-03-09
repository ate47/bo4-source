#namespace wz_loot_homunculus;

// Namespace wz_loot_homunculus/event_9673dc9a
// Params 1, eflags: 0x40
// Checksum 0x26def0fa, Offset: 0x100
// Size: 0x1d4
function event_handler[event_9673dc9a] function_3981d015(eventstruct) {
    dynent = eventstruct.ent;
    if (isdefined(dynent)) {
        if (dynent.targetname === "spring_event_homunculus" || dynent.targetname === "zombie_apoc_homunculus") {
            localclientnum = eventstruct.localclientnum;
            if (isdefined(localclientnum)) {
                if (eventstruct.state === 1) {
                    level thread function_5aaf5515(localclientnum, dynent);
                    return;
                }
                if (eventstruct.state === 3) {
                    if (dynent.targetname == "spring_event_homunculus") {
                        playfx(localclientnum, "player/fx8_plyr_emote_homunc_green_end", dynent.origin + (0, 0, 40), anglestoforward(dynent.angles));
                    } else if (dynent.targetname == "zombie_apoc_homunculus") {
                        playfx(localclientnum, "player/fx8_plyr_emote_homunc_end", dynent.origin + (0, 0, 40), anglestoforward(dynent.angles));
                    }
                    if (isdefined(dynent.var_46e47933)) {
                        stopsound(dynent.var_46e47933);
                    }
                }
            }
        }
    }
}

// Namespace wz_loot_homunculus/wz_loot_homunculus
// Params 2, eflags: 0x0
// Checksum 0x431cc328, Offset: 0x2e0
// Size: 0xb4
function function_5aaf5515(localclientnum, dynent) {
    dynent notify(#"hash_178cf342d49af85f");
    dynent endon(#"hash_178cf342d49af85f");
    while (isdefined(dynent) & function_8a8a409b(dynent) && function_ffdbe8c2(dynent) !== 2) {
        dynent.var_46e47933 = playsound(localclientnum, "mus_homunculus_dance", dynent.origin);
        wait 7.5;
    }
}

