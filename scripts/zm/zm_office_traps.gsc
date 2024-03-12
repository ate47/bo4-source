// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_office_traps;

// Namespace zm_office_traps/zm_office_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xf484c70, Offset: 0x140
// Size: 0xc4
function init() {
    level init_flags();
    level.var_e2103f01 = 0;
    zm_items::function_4d230236(getweapon(#"hash_31fb0b01bd55c7bf"), &function_a28f0b21);
    zm_items::function_4d230236(getweapon(#"hash_31fb0c01bd55c972"), &function_af5c24bb);
    level function_e021562c();
}

// Namespace zm_office_traps/zm_office_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x8d84e15c, Offset: 0x210
// Size: 0x64
function init_flags() {
    level flag::init("trap_elevator");
    level flag::init("trap_quickrevive");
    level flag::init(#"hash_7b57f5f8bfe10b93");
}

// Namespace zm_office_traps/zm_office_traps
// Params 2, eflags: 0x1 linked
// Checksum 0xcbdce62c, Offset: 0x280
// Size: 0x14c
function function_a28f0b21(e_holder, w_item) {
    self playsound(#"hash_230737b2535a3374");
    level.var_e2103f01 = level.var_e2103f01 + 1;
    if (function_8b1a219a()) {
        level.var_51823720[0] sethintstring(#"hash_323a35945e51c09a");
        level.var_51823720[1] sethintstring(#"hash_323a35945e51c09a");
    } else {
        level.var_51823720[0] sethintstring(#"hash_595a7e6ce85abd6e");
        level.var_51823720[1] sethintstring(#"hash_595a7e6ce85abd6e");
    }
    level flag::set(#"hash_7b57f5f8bfe10b93");
}

// Namespace zm_office_traps/zm_office_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x690ca250, Offset: 0x3d8
// Size: 0x12c
function function_af5c24bb(e_holder, w_item) {
    self playsound(#"hash_230737b2535a3374");
    level.var_e2103f01 = level.var_e2103f01 + 1;
    if (function_8b1a219a()) {
        level.var_51823720[0] sethintstring(#"hash_323a35945e51c09a");
        level.var_51823720[1] sethintstring(#"hash_323a35945e51c09a");
        return;
    }
    level.var_51823720[0] sethintstring(#"hash_595a7e6ce85abd6e");
    level.var_51823720[1] sethintstring(#"hash_595a7e6ce85abd6e");
}

// Namespace zm_office_traps/zm_office_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa80946b8, Offset: 0x510
// Size: 0x64
function function_e021562c() {
    level.var_51823720 = getentarray("trigger_battery_trap_fix", "targetname");
    if (isdefined(level.var_51823720)) {
        array::thread_all(level.var_51823720, &function_cebfdd08);
    }
}

// Namespace zm_office_traps/zm_office_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x1a988da1, Offset: 0x580
// Size: 0x404
function function_cebfdd08() {
    if (!isdefined(self.script_flag_wait)) {
        return;
    }
    if (!isdefined(self.script_string)) {
        return;
    }
    self sethintstring(#"hash_100d349fbdcacb2b");
    self setcursorhint("HINT_NOICON");
    self usetriggerrequirelookat();
    var_64479507 = getentarray(self.script_flag_wait, "targetname");
    array::thread_all(var_64479507, &function_a72b7c27, self.script_flag_wait);
    var_81f22deb = getent(self.script_string, "targetname");
    level thread function_5bd53e9b(var_81f22deb, self.script_flag_wait);
    if (zm_utility::is_standard()) {
        level flag::set(self.script_flag_wait);
    } else {
        while (!level flag::get(self.script_flag_wait)) {
            waitresult = undefined;
            waitresult = self waittill(#"trigger");
            who = waitresult.activator;
            if (zm_utility::is_player_valid(who)) {
                if (!isdefined(level.var_e2103f01) || level.var_e2103f01 == 0) {
                    zm_utility::play_sound_at_pos("no_purchase", self.origin);
                    continue;
                }
                if (isdefined(level.var_e2103f01) && level.var_e2103f01 > 0) {
                    self playsound("zmb_battery_insert");
                    level flag::set(self.script_flag_wait);
                    level.var_e2103f01 = level.var_e2103f01 - 1;
                    if (level.var_e2103f01 == 0) {
                        level.var_51823720[0] sethintstring(#"hash_100d349fbdcacb2b");
                        level.var_51823720[1] sethintstring(#"hash_100d349fbdcacb2b");
                    }
                    if (level flag::get(#"hash_7b57f5f8bfe10b93")) {
                        level zm_ui_inventory::function_7df6bb60(#"hash_48c5bcc6c9fab9d6", 1);
                        level zm_ui_inventory::function_7df6bb60(#"hash_2695edd24ddf6e7b", 1);
                        level flag::clear(#"hash_7b57f5f8bfe10b93");
                        continue;
                    }
                    level zm_ui_inventory::function_7df6bb60(#"hash_7d940511ce9f0341", 1);
                    level zm_ui_inventory::function_7df6bb60(#"hash_4a5aa2652a3ee760", 1);
                }
            }
        }
    }
    self sethintstring("");
    self triggerenable(0);
}

// Namespace zm_office_traps/zm_office_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x53973f90, Offset: 0x990
// Size: 0x7c
function function_a72b7c27(str_flag) {
    if (!isdefined(str_flag)) {
        return;
    }
    if (self.classname == "trigger_use_new") {
        self sethintstring(#"zombie/need_power");
        self thread function_91882233(str_flag);
        self triggerenable(0);
    }
}

// Namespace zm_office_traps/zm_office_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x74fe2677, Offset: 0xa18
// Size: 0x5c
function function_91882233(str_flag) {
    if (!isdefined(str_flag)) {
        return;
    }
    if (self.classname == "trigger_use_new") {
        level flag::wait_till(str_flag);
        self triggerenable(1);
    }
}

// Namespace zm_office_traps/zm_office_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x304bc79c, Offset: 0xa80
// Size: 0x1d4
function function_5bd53e9b(var_a703e7de, str_flag) {
    level flag::wait_till(str_flag);
    var_a703e7de notsolid();
    var_a703e7de.fx = spawn("script_model", var_a703e7de.origin);
    var_a703e7de.fx setmodel("tag_origin");
    var_a703e7de movez(48, 1, 0.4, 0);
    var_a703e7de waittill(#"movedone");
    var_a703e7de rotateroll(360 * randomintrange(4, 10), 1.2, 0.6, 0);
    playfxontag(level._effect[#"poltergeist"], var_a703e7de.fx, "tag_origin");
    var_a703e7de waittill(#"rotatedone");
    var_a703e7de hide();
    var_a703e7de.fx hide();
    var_a703e7de.fx delete();
    var_a703e7de delete();
}

