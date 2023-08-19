// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace perks;

// Namespace perks/perks
// Params 0, eflags: 0x2
// Checksum 0xc4ead3fe, Offset: 0xf0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"perks", &__init__, undefined, undefined);
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0xd3be6a05, Offset: 0x138
// Size: 0x54
function __init__() {
    clientfield::register("allplayers", "flying", 1, 1, "int");
    callback::on_spawned(&on_player_spawned);
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x60bc9705, Offset: 0x198
// Size: 0x54
function on_player_spawned(local_client_num) {
    self thread monitorgpsjammer();
    self thread function_98db97f4();
    self thread function_29038181();
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0xd9980413, Offset: 0x1f8
// Size: 0xb4
function function_29038181() {
    self endon(#"death", #"disconnect");
    self.flying = 0;
    while (isdefined(self)) {
        flying = !self isonground() || self isplayerswimming();
        if (self.flying != flying) {
            self clientfield::set("flying", flying);
            self.flying = flying;
        }
        waitframe(1);
    }
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0x2b5149c8, Offset: 0x2b8
// Size: 0x5e8
function monitorgpsjammer() {
    self notify("3670b910d841657e");
    self endon("3670b910d841657e");
    self endon(#"death", #"disconnect");
    var_95b95a60 = 1;
    /#
        var_95b95a60 = 0;
    #/
    if (var_95b95a60 && self hasperk(#"specialty_gpsjammer") == 0) {
        return;
    }
    self clientfield::set("gps_jammer_active", self hasperk(#"specialty_gpsjammer") ? 1 : 0);
    var_c339df5a = self function_ee4a9054(#"hash_37972a2f1d9bd52");
    minspeed = self function_ee4a9054(#"min_speed");
    mindistance = self function_ee4a9054(#"min_distance");
    var_2ba91f2c = self function_ee4a9054("time_period");
    var_24c690f = float(var_2ba91f2c) / 1000;
    minspeedsq = minspeed * minspeed;
    var_e07d168b = mindistance * mindistance;
    if (minspeedsq == 0) {
        return;
    }
    /#
        assert(var_24c690f >= 0.05);
    #/
    if (var_24c690f < 0.05) {
        return;
    }
    hasperk = 1;
    statechange = 0;
    var_8c91a76d = 0;
    var_3a9f9a5a = 0;
    timepassed = 0;
    var_b6d88d40 = 0;
    previousorigin = self.origin;
    var_81d875b2 = 0;
    while (1) {
        /#
            var_c339df5a = self function_ee4a9054(#"hash_37972a2f1d9bd52");
            minspeed = self function_ee4a9054(#"min_speed");
            mindistance = self function_ee4a9054(#"min_distance");
            var_2ba91f2c = self function_ee4a9054("<unknown string>");
            var_24c690f = float(var_2ba91f2c) / 1000;
            minspeedsq = minspeed * minspeed;
            var_e07d168b = mindistance * mindistance;
        #/
        var_81d875b2 = 0;
        if (util::isusingremote() || isdefined(self.isplanting) && self.isplanting || isdefined(self.isdefusing) && self.isdefusing) {
            var_81d875b2 = 1;
        } else {
            if (var_b6d88d40 > 1) {
                var_b6d88d40 = 0;
                if (distancesquared(previousorigin, self.origin) < var_e07d168b) {
                    var_8c91a76d = 1;
                } else {
                    var_8c91a76d = 0;
                }
                previousorigin = self.origin;
            }
            velocity = self getvelocity();
            speedsq = lengthsquared(velocity);
            if (speedsq > minspeedsq && var_8c91a76d == 0) {
                var_81d875b2 = 1;
            }
        }
        if (var_81d875b2 == 1 && self hasperk(#"specialty_gpsjammer")) {
            /#
                if (getdvarint(#"hash_5023eb5ab0505693", 0) != 0) {
                    sphere(self.origin + vectorscale((0, 0, 1), 70), 12, (0, 0, 1), 1, 1, 16, 3);
                }
            #/
            var_3a9f9a5a = 0;
            if (hasperk == 0) {
                statechange = 0;
                hasperk = 1;
                self clientfield::set("gps_jammer_active", 1);
            }
        } else {
            var_3a9f9a5a++;
            if (hasperk == 1 && var_3a9f9a5a >= var_c339df5a) {
                statechange = 1;
                hasperk = 0;
                self clientfield::set("gps_jammer_active", 0);
            }
        }
        if (statechange == 1) {
            level notify(#"hash_6c22e60d5acfa1af");
        }
        var_b6d88d40 = var_b6d88d40 + var_24c690f;
        wait(var_24c690f);
    }
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0x7b49e0e1, Offset: 0x8a8
// Size: 0x608
function function_98db97f4() {
    self endon(#"death", #"disconnect");
    var_95b95a60 = 1;
    /#
        var_95b95a60 = 0;
    #/
    if (var_95b95a60 && self hasperk(#"specialty_sengrenjammer") == 0) {
        return;
    }
    self clientfield::set("sg_jammer_active", self hasperk(#"specialty_sengrenjammer") ? 1 : 0);
    var_c339df5a = getdvarint(#"perk_sgjammer_graceperiods", 4);
    minspeed = getdvarint(#"perk_sgjammer_min_speed", 100);
    mindistance = getdvarint(#"perk_sgjammer_min_distance", 10);
    var_2ba91f2c = getdvarint(#"perk_sgjammer_time_period", 200);
    var_24c690f = float(var_2ba91f2c) / 1000;
    minspeedsq = minspeed * minspeed;
    var_e07d168b = mindistance * mindistance;
    if (minspeedsq == 0) {
        return;
    }
    /#
        assert(var_24c690f >= 0.05);
    #/
    if (var_24c690f < 0.05) {
        return;
    }
    hasperk = 1;
    statechange = 0;
    var_8c91a76d = 0;
    var_3a9f9a5a = 0;
    timepassed = 0;
    var_b6d88d40 = 0;
    previousorigin = self.origin;
    var_8cddfe25 = 0;
    while (1) {
        /#
            var_c339df5a = getdvarint(#"perk_sgjammer_graceperiods", var_c339df5a);
            minspeed = getdvarint(#"perk_sgjammer_min_speed", minspeed);
            mindistance = getdvarint(#"perk_sgjammer_min_distance", mindistance);
            var_2ba91f2c = getdvarint(#"perk_sgjammer_time_period", var_2ba91f2c);
            var_24c690f = float(var_2ba91f2c) / 1000;
            minspeedsq = minspeed * minspeed;
            var_e07d168b = mindistance * mindistance;
        #/
        var_8cddfe25 = 0;
        if (util::isusingremote() || isdefined(self.isplanting) && self.isplanting || isdefined(self.isdefusing) && self.isdefusing) {
            var_8cddfe25 = 1;
        } else {
            if (var_b6d88d40 > 1) {
                var_b6d88d40 = 0;
                if (distancesquared(previousorigin, self.origin) < var_e07d168b) {
                    var_8c91a76d = 1;
                } else {
                    var_8c91a76d = 0;
                }
                previousorigin = self.origin;
            }
            velocity = self getvelocity();
            speedsq = lengthsquared(velocity);
            if (speedsq > minspeedsq && var_8c91a76d == 0) {
                var_8cddfe25 = 1;
            }
        }
        if (var_8cddfe25 == 1 && self hasperk(#"specialty_sengrenjammer")) {
            /#
                if (getdvarint(#"hash_4a23fbdfa2631a83", 0) != 0) {
                    sphere(self.origin + vectorscale((0, 0, 1), 65), 12, (0, 1, 0), 1, 1, 16, 3);
                }
            #/
            var_3a9f9a5a = 0;
            if (hasperk == 0) {
                statechange = 0;
                hasperk = 1;
                self clientfield::set("sg_jammer_active", 1);
            }
        } else {
            var_3a9f9a5a++;
            if (hasperk == 1 && var_3a9f9a5a >= var_c339df5a) {
                statechange = 1;
                hasperk = 0;
                self clientfield::set("sg_jammer_active", 0);
            }
        }
        if (statechange == 1) {
            level notify(#"hash_6c22e60d5acfa1af");
        }
        var_b6d88d40 = var_b6d88d40 + var_24c690f;
        wait(var_24c690f);
    }
}

