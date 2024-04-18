// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace globallogic_player;

// Namespace globallogic_player/globallogic_player
// Params 5, eflags: 0x1 linked
// Checksum 0xf6c49e91, Offset: 0x98
// Size: 0x832
function function_c5343206(eattacker, einflictor, idamage, smeansofdeath, weapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    if (!isplayer(eattacker)) {
        return;
    }
    if (!isdefined(self.attackerdamage)) {
        return;
    }
    assert(isarray(self.attackerdata));
    if (self.attackerdata.size == 0) {
        self.firsttimedamaged = gettime();
    }
    attackerclientid = eattacker.clientid;
    if (!isdefined(attackerclientid)) {
        return;
    }
    var_ca60c93e = self.attackerdamage[attackerclientid];
    time = gettime();
    if (self.attackerdata.size == 0 || !isdefined(var_ca60c93e)) {
        self.attackerdamage[attackerclientid] = spawnstruct();
        var_ca60c93e = self.attackerdamage[attackerclientid];
        var_ca60c93e.damage = idamage;
        var_ca60c93e.time = time;
        self.attackers[self.attackers.size] = eattacker;
        self.attackerdata[attackerclientid] = 0;
    } else {
        var_ca60c93e.damage += idamage;
        if (!isdefined(var_ca60c93e.time)) {
            var_ca60c93e.time = time;
        }
    }
    if (isdefined(self.var_ea1458aa)) {
        if (!isdefined(self.var_ea1458aa.attackerdamage)) {
            self.var_ea1458aa.attackerdamage = [];
        }
        if (!isdefined(self.var_ea1458aa.attackerdamage[attackerclientid])) {
            self.var_ea1458aa.attackerdamage[attackerclientid] = spawnstruct();
        }
        var_d72bd991 = self.var_ea1458aa.attackerdamage[attackerclientid];
        var_d72bd991.meansofdeath = smeansofdeath;
        var_d72bd991.idflags = self.idflags;
        var_d72bd991.isads = eattacker playerads();
        var_d72bd991.class_num = eattacker.class_num;
        var_d72bd991.var_121392a1 = isdefined(eattacker.var_121392a1) ? arraycopy(eattacker.var_121392a1) : undefined;
        var_d72bd991.ismantling = eattacker ismantling();
        var_d72bd991.isjumping = !eattacker isonground() && !eattacker isonladder() && !eattacker isplayerswimming();
        var_d72bd991.var_bd77a1eb = (isdefined(eattacker.var_6f3f5189) ? eattacker.var_6f3f5189 : 0) + 2500 >= time;
        var_d72bd991.var_e8072c8d = eattacker issprinting() || (isdefined(eattacker.challenge_sprint_end) ? eattacker.challenge_sprint_end : 0) + 2000 > time;
        var_d72bd991.var_14f058c7 = isdefined(eattacker.lastreloadtime) && eattacker.lastreloadtime + 5000 >= time;
        var_d72bd991.var_8e35fb71 = function_ce33e204(eattacker);
        var_d72bd991.var_5745c480 = function_5af0c53c(eattacker);
        var_d72bd991.var_54433d4b = eattacker.scavenged === 1;
        var_d72bd991.sensordarts = isdefined(eattacker.sensor_darts) ? arraycopy(eattacker.sensor_darts) : undefined;
        var_d72bd991.var_85997af0 = distance2dsquared(self.origin, eattacker.origin);
        var_d72bd991.var_53611a9c = eattacker function_d210981e(self.origin);
        var_d72bd991.var_9a5c07a = self.ispulsed === 1;
        var_d72bd991.var_79eb9a59 = self.var_5379bee8;
        var_d72bd991.var_2acdce3e = isdefined(self.var_121392a1) ? arraycopy(self.var_121392a1) : undefined;
        var_d72bd991.var_b535f1ea = self.lastconcussedby;
        var_d72bd991.var_f91a4dd6 = self.recentkillcountsameweapon;
        if (eattacker function_6c32d092(#"talent_teamlink") && !(var_d72bd991.var_53611a9c === 1) && level.teambased) {
            var_d72bd991.var_ec93e5f2 = function_43084f6c(self);
        }
        if (eattacker function_6c32d092(#"talent_ghost") && !(var_d72bd991.var_8e35fb71 === 1)) {
            var_d72bd991.var_efc9cf4d = function_eddea888(eattacker);
        }
        var_98a6bdf5 = eattacker.var_ea1458aa;
        if (isdefined(var_98a6bdf5)) {
            var_46a82df0 = isdefined(var_98a6bdf5.var_a440c10) && var_98a6bdf5.var_a440c10 + 3000 > time;
            var_d72bd991.var_46a82df0 = var_46a82df0;
            var_d72bd991.var_69b66e8e = var_46a82df0 && var_98a6bdf5.var_55a37dc7 === 1 && (isdefined(var_ca60c93e.lastdamagetime) ? var_ca60c93e.lastdamagetime : 0) + 10000 > var_98a6bdf5.var_a440c10;
            if (isdefined(var_98a6bdf5.attackerdamage)) {
                var_8bc6e971 = var_98a6bdf5.attackerdamage[self.clientid];
                if (isdefined(var_8bc6e971)) {
                    if (isdefined(var_8bc6e971.var_a74d2db8) && var_8bc6e971.var_a74d2db8 + 2500 > time) {
                        var_d72bd991.var_d7bd6f9b = 1;
                    }
                }
            }
        }
    }
    var_ca60c93e.einflictor = einflictor;
    var_ca60c93e.weapon = weapon;
    var_ca60c93e.lastdamagetime = time;
    if (isarray(self.attackersthisspawn)) {
        self.attackersthisspawn[attackerclientid] = eattacker;
    }
    var_ca60c93e.lasttimedamaged = time;
    if (weapons::is_primary_weapon(weapon)) {
        self.attackerdata[attackerclientid] = 1;
    }
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0x631b32b8, Offset: 0x8d8
// Size: 0x374
function function_43084f6c(player) {
    if (level.teambased) {
        otherteam = util::getotherteam(player.team);
        foreach (var_f53fe24c in getplayers(otherteam)) {
            if (var_f53fe24c function_d210981e(player.origin)) {
                return true;
            }
        }
    } else {
        enemies = getplayers();
        playereye = player geteyeapprox();
        foreach (enemy in enemies) {
            if (enemy == player) {
                continue;
            }
            if (enemy function_d210981e(player.origin)) {
                if (!isdefined(player.var_c676db5f)) {
                    player.var_c676db5f = [];
                }
                if (!isdefined(player.var_c676db5f[player getentitynumber()])) {
                    player.var_c676db5f[player getentitynumber()] = spawnstruct();
                }
                if ((isdefined(player.var_c676db5f[player getentitynumber()].var_c719b74c) ? player.var_c676db5f[player getentitynumber()].var_c719b74c : 0) < gettime()) {
                    player.var_c676db5f[player getentitynumber()].var_c719b74c = gettime() + 750;
                    enemyeye = enemy geteyeapprox();
                    player.var_c676db5f[player getentitynumber()].cansee = sighttracepassed(playereye, enemyeye, 0, player);
                }
                if (isdefined(player.var_c676db5f[player getentitynumber()].cansee) ? player.var_c676db5f[player getentitynumber()].cansee : 0) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 2, eflags: 0x1 linked
// Checksum 0x8f724414, Offset: 0xc58
// Size: 0x13a
function function_9f942458(var_6ba44c6, var_fbbdf63c) {
    if (!isplayer(var_fbbdf63c)) {
        return false;
    }
    if (!isdefined(var_fbbdf63c.sensor_darts)) {
        return false;
    }
    foreach (sensor in var_fbbdf63c.sensor_darts) {
        if (!isdefined(sensor)) {
            continue;
        }
        if (distancesquared(var_6ba44c6.origin, sensor.origin) < ((sessionmodeiswarzonegame() ? 2400 : 800) + 50) * ((sessionmodeiswarzonegame() ? 2400 : 800) + 50)) {
            return true;
        }
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0x1ac9c44d, Offset: 0xda0
// Size: 0x19a
function function_eddea888(player) {
    if (!isdefined(player.team)) {
        return false;
    }
    if (level.teambased) {
        otherteam = util::getotherteam(player.team);
        foreach (attacking_player in getplayers(otherteam)) {
            if (function_9f942458(player, attacking_player)) {
                return true;
            }
        }
    } else {
        enemies = getplayers();
        foreach (enemy in enemies) {
            if (enemy == player) {
                continue;
            }
            if (function_9f942458(player, enemy)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0xf7c6b76a, Offset: 0xf48
// Size: 0x1c6
function function_ce33e204(player) {
    if (!isdefined(level.activeuavs) || level.activeuavs.size == 0 || isdefined(level.forceradar) && level.forceradar == 1) {
        return false;
    }
    if (level.teambased) {
        otherteam = util::getotherteam(player.team);
        if (isdefined(level.activeuavs[otherteam]) && level.activeuavs[otherteam] > 0) {
            return true;
        }
    } else {
        enemies = getplayers();
        foreach (enemy in enemies) {
            if (enemy == player) {
                continue;
            }
            if (!isdefined(enemy.entnum)) {
                enemy.entnum = enemy getentitynumber();
            }
            if (isdefined(level.activeuavs[enemy.entnum]) && level.activeuavs[enemy.entnum] > 0) {
                return true;
            }
        }
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x5 linked
// Checksum 0xca449268, Offset: 0x1118
// Size: 0x19e
function private function_5af0c53c(player) {
    if (!isdefined(level.activecounteruavs) || level.activecounteruavs.size == 0) {
        return false;
    }
    if (level.teambased) {
        otherteam = util::getotherteam(player.team);
        if (isdefined(level.activecounteruavs[otherteam]) && level.activecounteruavs[otherteam] > 0) {
            return true;
        }
    } else {
        enemies = getplayers();
        foreach (enemy in enemies) {
            if (enemy == player) {
                continue;
            }
            if (!isdefined(enemy.entnum)) {
                enemy.entnum = enemy getentitynumber();
            }
            if (isdefined(level.activecounteruavs[enemy.entnum]) && level.activecounteruavs[enemy.entnum] > 0) {
                return true;
            }
        }
    }
    return false;
}

// Namespace globallogic_player/globallogic_player
// Params 5, eflags: 0x1 linked
// Checksum 0xf00617e7, Offset: 0x12c0
// Size: 0xc4
function function_9843a46c(eattacker, einflictor, idamage, smeansofdeath, weapon) {
    self function_c5343206(eattacker, einflictor, idamage, smeansofdeath, weapon);
    if (!isdefined(einflictor)) {
        return;
    }
    if (!isdefined(einflictor.owner)) {
        return;
    }
    if (isdefined(eattacker) && eattacker == einflictor.owner) {
        return;
    }
    self function_c5343206(einflictor.owner, einflictor, idamage, smeansofdeath, weapon);
}

// Namespace globallogic_player/globallogic_player
// Params 4, eflags: 0x1 linked
// Checksum 0x678e44cf, Offset: 0x1390
// Size: 0x24a
function trackattackerdamage(eattacker, idamage, smeansofdeath, weapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    if (!isplayer(eattacker)) {
        return;
    }
    if (!isdefined(self.attackerdamage)) {
        return;
    }
    assert(isarray(self.attackerdata));
    if (self.attackerdata.size == 0) {
        self.firsttimedamaged = gettime();
    }
    attackerclientid = eattacker.clientid;
    var_ca60c93e = self.attackerdamage[attackerclientid];
    if (self.attackerdata.size == 0 || !isdefined(var_ca60c93e)) {
        self.attackerdamage[attackerclientid] = spawnstruct();
        var_ca60c93e = self.attackerdamage[attackerclientid];
        var_ca60c93e.damage = idamage;
        var_ca60c93e.meansofdeath = smeansofdeath;
        var_ca60c93e.weapon = weapon;
        var_ca60c93e.time = gettime();
        self.attackers[self.attackers.size] = eattacker;
        self.attackerdata[attackerclientid] = 0;
    } else {
        var_ca60c93e.damage += idamage;
        var_ca60c93e.meansofdeath = smeansofdeath;
        var_ca60c93e.weapon = weapon;
        if (!isdefined(var_ca60c93e.time)) {
            var_ca60c93e.time = gettime();
        }
    }
    if (isarray(self.attackersthisspawn)) {
        self.attackersthisspawn[attackerclientid] = eattacker;
    }
    var_ca60c93e.lasttimedamaged = gettime();
    if (weapons::is_primary_weapon(weapon)) {
        self.attackerdata[attackerclientid] = 1;
    }
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0xca523910, Offset: 0x15e8
// Size: 0x32
function allowedassistweapon(weapon) {
    if (isdefined(level.var_aadc08f8)) {
        return [[ level.var_aadc08f8 ]](weapon);
    }
    return 0;
}

// Namespace globallogic_player/globallogic_player
// Params 5, eflags: 0x1 linked
// Checksum 0x71efa2fd, Offset: 0x1628
// Size: 0x144
function giveattackerandinflictorownerassist(eattacker, einflictor, idamage, smeansofdeath, weapon) {
    if (isdefined(level.var_724cf71) && level.var_724cf71) {
        function_9843a46c(eattacker, einflictor, idamage, smeansofdeath, weapon);
        return;
    }
    if (!allowedassistweapon(weapon)) {
        return;
    }
    self trackattackerdamage(eattacker, idamage, smeansofdeath, weapon);
    if (!isdefined(einflictor)) {
        return;
    }
    if (!isdefined(einflictor.owner)) {
        return;
    }
    if (!isdefined(einflictor.ownergetsassist)) {
        return;
    }
    if (!einflictor.ownergetsassist) {
        return;
    }
    if (isdefined(eattacker) && eattacker == einflictor.owner) {
        return;
    }
    self trackattackerdamage(einflictor.owner, idamage, smeansofdeath, weapon);
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0xe73a8ed4, Offset: 0x1778
// Size: 0xf2
function function_efd02c1d(einflictor) {
    if (!isdefined(self.var_6ef09a14)) {
        return;
    }
    if (isplayer(einflictor)) {
        return;
    }
    if (!isdefined(einflictor)) {
        return;
    }
    if (!isplayer(einflictor.owner)) {
        return;
    }
    entnum = einflictor getentitynumber();
    if (!isdefined(self.var_6ef09a14[entnum])) {
        self.var_6ef09a14[entnum] = spawnstruct();
        self.var_6ef09a14[entnum].owner = einflictor.owner;
        self.var_6ef09a14[entnum].vehicletype = einflictor.vehicletype;
    }
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0xcff82a35, Offset: 0x1878
// Size: 0x17e
function figureoutattacker(eattacker) {
    if (isdefined(eattacker)) {
        if (isai(eattacker) && isdefined(eattacker.script_owner)) {
            team = self.team;
            if (isai(self) && isdefined(self.team)) {
                team = self.team;
            }
            if (util::function_fbce7263(eattacker.script_owner.team, team)) {
                eattacker = eattacker.script_owner;
            }
        }
        if (eattacker.classname === "script_vehicle" && isdefined(eattacker.owner) && !issentient(eattacker)) {
            eattacker = eattacker.owner;
        } else if (eattacker.classname === "auto_turret" && isdefined(eattacker.owner)) {
            eattacker = eattacker.owner;
        }
        if (isdefined(eattacker.remote_owner)) {
            eattacker = eattacker.remote_owner;
        }
    }
    return eattacker;
}

