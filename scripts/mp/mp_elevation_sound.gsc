#namespace mp_elevation_sound;

// Namespace mp_elevation_sound/mp_elevation_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xd792eade, Offset: 0x90
// Size: 0x1c
function main() {
    level thread function_14f3a3c2();
}

// Namespace mp_elevation_sound/mp_elevation_sound
// Params 0, eflags: 0x1 linked
// Checksum 0xe930556a, Offset: 0xb8
// Size: 0xa8
function function_14f3a3c2() {
    trigger = getent("snd_bell", "targetname");
    if (!isdefined(trigger)) {
        return;
    }
    while (true) {
        waitresult = trigger waittill(#"trigger");
        if (isplayer(waitresult.activator)) {
            trigger playsound("amb_dmg_bell");
        }
    }
}

