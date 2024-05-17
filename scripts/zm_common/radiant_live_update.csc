// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace radiant_live_udpate;

/#

    // Namespace radiant_live_udpate/radiant_live_update
    // Params 0, eflags: 0x2
    // Checksum 0x2a01d53b, Offset: 0x78
    // Size: 0x3c
    function autoexec __init__system__() {
        system::register(#"radiant_live_udpate", &__init__, undefined, undefined);
    }

    // Namespace radiant_live_udpate/radiant_live_update
    // Params 0, eflags: 0x0
    // Checksum 0xe4f88d1, Offset: 0xc0
    // Size: 0x1c
    function __init__() {
        thread scriptstruct_debug_render();
    }

    // Namespace radiant_live_udpate/radiant_live_update
    // Params 0, eflags: 0x0
    // Checksum 0x2cf1ca0e, Offset: 0xe8
    // Size: 0x84
    function scriptstruct_debug_render() {
        while (true) {
            waitresult = level waittill(#"liveupdate");
            if (isdefined(waitresult.selected_struct)) {
                level thread render_struct(waitresult.selected_struct);
                continue;
            }
            level notify(#"stop_struct_render");
        }
    }

    // Namespace radiant_live_udpate/radiant_live_update
    // Params 1, eflags: 0x0
    // Checksum 0x30960d02, Offset: 0x178
    // Size: 0x90
    function render_struct(selected_struct) {
        self endon(#"stop_struct_render");
        while (isdefined(selected_struct) && isdefined(selected_struct.origin)) {
            box(selected_struct.origin, (-16, -16, -16), (16, 16, 16), 0, (1, 0.4, 0.4));
            wait(0.01);
        }
    }

#/
