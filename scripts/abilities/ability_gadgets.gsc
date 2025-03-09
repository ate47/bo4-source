#using scripts\abilities\ability_player;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;

#namespace ability_gadgets;

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x2
// Checksum 0xb535c90c, Offset: 0x160
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ability_gadgets", &__init__, undefined, undefined);
}

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x0
// Checksum 0x321175b6, Offset: 0x1a8
// Size: 0xd4
function __init__() {
    callback::on_connect(&on_player_connect);
    callback::on_spawned(&on_player_spawned);
    clientfield::register("clientuimodel", "huditems.abilityHoldToActivate", 1, 2, "int");
    clientfield::register("clientuimodel", "huditems.abilityDelayProgress", 1, 5, "float");
    clientfield::register("clientuimodel", "hudItems.abilityHintIndex", 1, 3, "int");
}

/#

    // Namespace ability_gadgets/ability_gadgets
    // Params 1, eflags: 0x0
    // Checksum 0x3c97de0, Offset: 0x288
    // Size: 0x74
    function gadgets_print(str) {
        if (getdvarint(#"scr_debug_gadgets", 0)) {
            toprint = str;
            println(self.playername + "<dev string:x38>" + "<dev string:x3d>" + toprint);
        }
    }

#/

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x308
// Size: 0x4
function on_player_connect() {
    
}

// Namespace ability_gadgets/ability_gadgets
// Params 2, eflags: 0x0
// Checksum 0x3b9b083b, Offset: 0x318
// Size: 0x44
function setflickering(slot, length = 0) {
    self gadgetflickering(slot, 1, length);
}

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x368
// Size: 0x4
function on_player_spawned() {
    
}

// Namespace ability_gadgets/gadget_give
// Params 1, eflags: 0x40
// Checksum 0xde1b292c, Offset: 0x378
// Size: 0x7c
function event_handler[gadget_give] gadget_give_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x4b>");
    #/
    eventstruct.entity ability_player::give_gadget(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_take
// Params 1, eflags: 0x40
// Checksum 0x24e85d8e, Offset: 0x400
// Size: 0x7c
function event_handler[gadget_take] gadget_take_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x57>");
    #/
    eventstruct.entity ability_player::take_gadget(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_primed
// Params 1, eflags: 0x40
// Checksum 0x9074f374, Offset: 0x488
// Size: 0x7c
function event_handler[gadget_primed] gadget_primed_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x63>");
    #/
    eventstruct.entity ability_player::gadget_primed(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_ready
// Params 1, eflags: 0x40
// Checksum 0x5fdd03a7, Offset: 0x510
// Size: 0xec
function event_handler[gadget_ready] gadget_ready_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x71>");
    #/
    if (level flag::get("all_players_spawned")) {
        params = {#slot:eventstruct.slot};
        voiceevent("specialist_equipment_ready", eventstruct.entity, params);
    }
    eventstruct.entity ability_player::gadget_ready(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_on
// Params 1, eflags: 0x40
// Checksum 0x55782023, Offset: 0x608
// Size: 0xec
function event_handler[gadget_on] gadget_on_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x7e>");
    #/
    if (level flag::get("all_players_spawned")) {
        params = {#slot:eventstruct.slot};
        voiceevent("specialist_equipment_using", eventstruct.entity, params);
    }
    eventstruct.entity ability_player::turn_gadget_on(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_off
// Params 1, eflags: 0x40
// Checksum 0xb45b88ee, Offset: 0x700
// Size: 0x7c
function event_handler[gadget_off] gadget_off_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x88>");
    #/
    eventstruct.entity ability_player::turn_gadget_off(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/event_dfabd488
// Params 1, eflags: 0x40
// Checksum 0x3f5df80b, Offset: 0x788
// Size: 0x7c
function event_handler[event_dfabd488] function_40d8d1ec(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:x93>");
    #/
    eventstruct.entity ability_player::function_50557027(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/event_e46d75fa
// Params 1, eflags: 0x40
// Checksum 0x723a280e, Offset: 0x810
// Size: 0x7c
function event_handler[event_e46d75fa] function_15061ae6(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:xa6>");
    #/
    eventstruct.entity ability_player::function_d5260ebe(eventstruct.slot, eventstruct.weapon);
}

// Namespace ability_gadgets/gadget_flicker
// Params 1, eflags: 0x40
// Checksum 0x645b3fe5, Offset: 0x898
// Size: 0x7c
function event_handler[gadget_flicker] gadget_flicker_callback(eventstruct) {
    /#
        eventstruct.entity gadgets_print("<dev string:x48>" + eventstruct.slot + "<dev string:xba>");
    #/
    eventstruct.entity ability_player::gadget_flicker(eventstruct.slot, eventstruct.weapon);
}

