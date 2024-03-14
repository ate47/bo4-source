// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_escape_pebble.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_escape_magicbox;

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x2
// Checksum 0x5a1035a8, Offset: 0x108
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_escape_magicbox", &__init__, &__main__, undefined);
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x48bd41f9, Offset: 0x158
// Size: 0x6e
function __init__() {
    level.locked_magic_box_cost = 2000;
    level.custom_magicbox_state_handler = &set_locked_magicbox_state;
    level.var_f39bb42a = &watch_for_lock;
    level.var_555605da = &clean_up_locked_box;
    level.custom_firesale_box_leave = 1;
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x2b48dc2, Offset: 0x1d0
// Size: 0x36
function __main__() {
    level.chest_joker_model = #"hash_4b77dcb67eb0dc91";
    level.chest_joker_custom_movement = &custom_joker_movement;
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x48fc408b, Offset: 0x210
// Size: 0x258
function custom_joker_movement() {
    v_origin = self.weapon_model.origin - vectorscale((0, 0, 1), 5);
    if (isdefined(self.weapon_model)) {
        self.weapon_model delete();
        self.weapon_model = undefined;
    }
    mdl_lock = util::spawn_model(level.chest_joker_model, v_origin, self.angles + vectorscale((0, 1, 0), 180));
    mdl_lock.targetname = "box_lock";
    mdl_lock setcandamage(1);
    level.var_c7626f2a[#"box_lock"] = &pebble::function_bdd1bac8;
    level notify(#"hash_219aba01ff2d6de4");
    playsoundatposition(#"hash_7c7d8771a48e8871", mdl_lock.origin);
    wait(0.5);
    level notify(#"weapon_fly_away_start");
    wait(1);
    mdl_lock rotateyaw(3000, 4, 4);
    wait(3);
    mdl_lock movez(20, 0.5, 0.5);
    mdl_lock waittill(#"movedone");
    mdl_lock movez(-100, 0.5, 0.5);
    mdl_lock waittill(#"movedone");
    level notify(#"hash_3698278a3a5d8beb");
    mdl_lock delete();
    self notify(#"box_moving");
    level notify(#"weapon_fly_away_end");
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x70ad379c, Offset: 0x470
// Size: 0xac
function watch_for_lock() {
    self endon(#"user_grabbed_weapon", #"chest_accessed");
    self waittill(#"box_locked");
    self notify(#"kill_chest_think");
    self.grab_weapon_hint = 0;
    self.chest_user = undefined;
    wait(0.1);
    self thread zm_unitrigger::register_static_unitrigger(self.unitrigger_stub, &zm_magicbox::magicbox_unitrigger_think);
    self thread zm_magicbox::treasure_chest_think();
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0xe545cc27, Offset: 0x528
// Size: 0xfc
function clean_up_locked_box() {
    self endon(#"box_spin_done");
    self.owner waittill(#"box_locked");
    if (isdefined(self.weapon_model)) {
        self.weapon_model delete();
        self.weapon_model = undefined;
    }
    if (isdefined(self.weapon_model_dw)) {
        self.weapon_model_dw delete();
        self.weapon_model_dw = undefined;
    }
    self hidezbarrierpiece(3);
    self hidezbarrierpiece(4);
    self setzbarrierpiecestate(3, "closed");
    self setzbarrierpiecestate(4, "closed");
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x53210b8, Offset: 0x630
// Size: 0xce
function magic_box_locks() {
    self.owner.is_locked = 1;
    self.owner notify(#"box_locked");
    self playsound(#"zmb_hellbox_lock");
    self clientfield::set("magicbox_open_fx", 0);
    self setzbarrierpiecestate(5, "closing");
    while (self getzbarrierpiecestate(5) == "closing") {
        wait(0.5);
    }
    self notify(#"locked");
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x1 linked
// Checksum 0x9e084125, Offset: 0x708
// Size: 0xe6
function magic_box_unlocks() {
    self playsound(#"zmb_hellbox_unlock");
    self setzbarrierpiecestate(5, "opening");
    while (self getzbarrierpiecestate(5) == "opening") {
        wait(0.5);
    }
    self setzbarrierpiecestate(2, "closed");
    self showzbarrierpiece(2);
    self hidezbarrierpiece(5);
    self notify(#"unlocked");
    self.owner.is_locked = undefined;
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 1, eflags: 0x1 linked
// Checksum 0x8e520bb8, Offset: 0x7f8
// Size: 0xc2
function set_locked_magicbox_state(state) {
    switch (state) {
    case #"locking":
        self showzbarrierpiece(5);
        self thread magic_box_locks();
        self.state = "locking";
        break;
    case #"unlocking":
        self showzbarrierpiece(5);
        self thread magic_box_unlocks();
        self.state = "close";
        break;
    }
}

// Namespace zm_escape_magicbox/zm_escape_magicbox
// Params 0, eflags: 0x0
// Checksum 0xe30474b4, Offset: 0x8c8
// Size: 0x13c
function function_be66db38() {
    /#
        level flagsys::wait_till("<unknown string>");
        e_box = undefined;
        for (i = 0; i < level.chests.size; i++) {
            if (isdefined(level.chests[i].zbarrier.state === "<unknown string>") && level.chests[i].zbarrier.state === "<unknown string>") {
                e_box = level.chests[i];
                break;
            }
        }
        if (isdefined(e_box)) {
            while (distance(level.players[0].origin, e_box.origin) > 128) {
                wait(1);
            }
            e_box.zbarrier zm_magicbox::set_magic_box_zbarrier_state("<unknown string>");
        }
    #/
}

