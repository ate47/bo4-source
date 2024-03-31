// Atian COD Tools GSC decompiler test
#using scripts\core_common\teams.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\platoons.gsc;

#namespace infection;

// Namespace infection/infection
// Params 0, eflags: 0x2
// Checksum 0x446501ee, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"infection", &__init__, undefined, undefined);
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x809766af, Offset: 0x148
// Size: 0x4c
function __init__() {
    if (!isdefined(level.infection) && getgametypesetting("infectionMode", 0)) {
        initialize();
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x5ad13e0c, Offset: 0x1a0
// Size: 0xae
function initialize() {
    level.infection = {#perks:[], #bodies:[], #primary_weapon:undefined, #offhand_weapon:undefined, #team:#"none", #platoon:#"invalid", #var_c4b373ef:[], #platoon_team:[]};
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0xf672cee3, Offset: 0x258
// Size: 0x1c
function function_74650d7() {
    if (isdefined(level.infection)) {
        return true;
    }
    return false;
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x8fdc9f0c, Offset: 0x280
// Size: 0x18
function is_infected() {
    return isdefined(self.infected) && self.infected;
}

// Namespace infection/infection
// Params 1, eflags: 0x0
// Checksum 0x5dab7685, Offset: 0x2a0
// Size: 0x36
function function_a2d73bc3(team) {
    if (!function_74650d7()) {
        return;
    }
    level.infection.team = team;
}

// Namespace infection/infection
// Params 1, eflags: 0x0
// Checksum 0xe7d449, Offset: 0x2e0
// Size: 0x36
function function_fb163563(platoon) {
    if (!function_74650d7()) {
        return;
    }
    level.infection.platoon = platoon;
}

// Namespace infection/infection
// Params 2, eflags: 0x0
// Checksum 0x422fe25f, Offset: 0x320
// Size: 0x9c
function function_153000d0(male, female) {
    /#
        assert(isdefined(male));
    #/
    /#
        assert(isdefined(female));
    #/
    male_index = player_role::function_97d19493(male);
    female_index = player_role::function_97d19493(female);
    function_e8cc8373(male_index, female_index);
}

// Namespace infection/infection
// Params 2, eflags: 0x4
// Checksum 0x32963b7d, Offset: 0x3c8
// Size: 0x8e
function private function_e8cc8373(male, female) {
    /#
        assert(isdefined(male));
    #/
    /#
        assert(isdefined(female));
    #/
    if (!function_74650d7()) {
        return;
    }
    level.infection.bodies[0] = male;
    level.infection.bodies[1] = female;
}

// Namespace infection/infection
// Params 1, eflags: 0x0
// Checksum 0x321a84ea, Offset: 0x460
// Size: 0xee
function function_db5ddd5f(perk) {
    /#
        assert(isdefined(perk));
    #/
    if (!function_74650d7()) {
        return;
    }
    if (!isdefined(level.infection.perks)) {
        level.infection.perks = [];
    } else if (!isarray(level.infection.perks)) {
        level.infection.perks = array(level.infection.perks);
    }
    level.infection.perks[level.infection.perks.size] = perk;
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x42ac14c5, Offset: 0x558
// Size: 0xb0
function function_ff357d24() {
    if (!function_74650d7()) {
        return;
    }
    foreach (perk in level.infection.perks) {
        if (!self hasperk(perk)) {
            self setperk(perk);
        }
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0xc7055468, Offset: 0x610
// Size: 0x4c
function give_loadout() {
    self function_e6f9e3cd();
    self clearperks();
    self function_ff357d24();
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x2f4c06d2, Offset: 0x668
// Size: 0x164
function reset_character() {
    if (!isplayer(self)) {
        /#
            assert(0);
        #/
        return;
    }
    self setcharacteroutfit(0);
    self setcharacterwarpaintoutfit(0);
    self function_ab96a9b5("head", 0);
    self function_ab96a9b5("headgear", 0);
    self function_ab96a9b5("arms", 0);
    self function_ab96a9b5("torso", 0);
    self function_ab96a9b5("legs", 0);
    self function_ab96a9b5("palette", 0);
    self function_ab96a9b5("warpaint", 0);
    self function_ab96a9b5("decal", 0);
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0xe3d6cf41, Offset: 0x7d8
// Size: 0x1ac
function give_body() {
    if (self hasdobj() && self haspart("j_spine4")) {
        self playsoundontag(#"hash_3407b7c42e8075c9", "j_spine4");
    }
    self thread function_da08f4d0();
    current_role = self player_role::get();
    foreach (body in level.infection.bodies) {
        if (current_role == body) {
            self reset_character();
            return;
        }
    }
    body_index = self getplayergendertype() == "male" ? 0 : 1;
    self player_role::set(level.infection.bodies[body_index], 1);
    self reset_character();
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x79ae827c, Offset: 0x990
// Size: 0x128
function function_da08f4d0() {
    self endon(#"death");
    wait(randomintrange(2, 4));
    while (true) {
        str_alias = #"hash_61fc4fa3eeafcf07";
        n_wait_min = 2;
        n_wait_max = 5;
        if (self issprinting()) {
            str_alias = #"hash_64441bbb83e130e9";
            n_wait_min = 4;
            n_wait_max = 7;
        }
        if (self hasdobj() && self haspart("j_spine4")) {
            self playsoundontag(str_alias, "j_spine4");
        }
        wait(randomintrange(n_wait_min, n_wait_max));
    }
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x4a0389fe, Offset: 0xac0
// Size: 0x42
function function_882350c() {
    xuid = self getxuid();
    level.infection.var_c4b373ef[xuid] = 1;
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x2359a3bc, Offset: 0xb10
// Size: 0x66
function function_687661ea() {
    xuid = self getxuid();
    if (isdefined(level.infection.var_c4b373ef[xuid]) && level.infection.var_c4b373ef[xuid]) {
        return true;
    }
    return false;
}

// Namespace infection/infection
// Params 0, eflags: 0x4
// Checksum 0xcfe42570, Offset: 0xb80
// Size: 0x10e
function private get_infected_team() {
    if (level.infection.platoon != #"invalid") {
        if (self is_infected()) {
            return self.team;
        }
        if (isdefined(level.infection.platoon_team[self.team])) {
            return level.infection.platoon_team[self.team];
        }
        team = self.team;
        if (team != #"spectator") {
            players_on_team = getplayers(team);
            if (players_on_team.size <= 1) {
                return team;
            }
        }
        team = teams::function_959bac94();
        return team;
    }
    return level.infection.team;
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0xf8c42096, Offset: 0xc98
// Size: 0x16
function function_76601b7d() {
    return level.infection.platoon;
}

// Namespace infection/infection
// Params 0, eflags: 0x0
// Checksum 0x7d287455, Offset: 0xcb8
// Size: 0x1b4
function function_d3da95cf() {
    team = self get_infected_team();
    platoon = function_76601b7d();
    if (platoon != #"invalid") {
        level.infection.platoon_team[self.team] = team;
        platoons::function_334c4bec(team, platoon);
    }
    if (!isdefined(level.everexisted[team])) {
        level.everexisted[team] = gettime();
    }
    if (self.sessionstate != "dead") {
        self.switching_teams = 1;
        self.switchedteamsresetgadgets = 1;
        self.joining_team = team;
        self.leaving_team = self.pers[#"team"];
    }
    self teams::function_dc7eaabd(team);
    self.pers[#"weapon"] = undefined;
    self.pers[#"spawnweapon"] = undefined;
    self.pers[#"savedmodel"] = undefined;
    self.pers[#"teamtime"] = undefined;
    self.infected = 1;
    self spectating::set_permissions();
}

