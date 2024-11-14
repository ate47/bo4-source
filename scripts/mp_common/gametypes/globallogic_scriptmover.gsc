#using scripts\core_common\weapons_shared;
#using scripts\core_common\globallogic\globallogic_player;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\damage;

#namespace globallogic_scriptmover;

// Namespace globallogic_scriptmover/globallogic_scriptmover
// Params 16, eflags: 0x0
// Checksum 0x6a1a1149, Offset: 0x88
// Size: 0x3a4
function function_8c7ec52f(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, iboneindex, imodelindex, spartname, isurfacetype, vsurfacenormal) {
    if (!isdefined(self.attackerdata)) {
        self.attackerdata = [];
    }
    if (!isdefined(self.attackers)) {
        self.attackers = [];
    }
    if (isdefined(self.owner) && !damage::friendlyfirecheck(self.owner, eattacker)) {
        return;
    }
    idamage = weapons::function_74bbb3fa(idamage, weapon, self.weapon);
    idamage = int(idamage);
    if (isdefined(self.var_86a21346)) {
        idamage = self [[ self.var_86a21346 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex);
    } else if (isdefined(level.var_86a21346)) {
        idamage = self [[ level.var_86a21346 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex);
    }
    var_5370b15e = idamage < self.health ? idamage : self.health;
    self globallogic_player::giveattackerandinflictorownerassist(eattacker, einflictor, var_5370b15e, smeansofdeath, weapon);
    params = spawnstruct();
    params.einflictor = einflictor;
    params.eattacker = eattacker;
    params.idamage = idamage;
    params.idflags = idflags;
    params.smeansofdeath = smeansofdeath;
    params.weapon = weapon;
    params.vpoint = vpoint;
    params.vdir = vdir;
    params.shitloc = shitloc;
    params.vdamageorigin = vdamageorigin;
    params.psoffsettime = psoffsettime;
    params.iboneindex = iboneindex;
    params.imodelindex = imodelindex;
    params.spartname = spartname;
    params.isurfacetype = isurfacetype;
    params.vsurfacenormal = vsurfacenormal;
    self callback::callback(#"hash_2e68909d4e4ed889", params);
    self function_f7f9c3eb(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, iboneindex, imodelindex, spartname, isurfacetype, vsurfacenormal);
}

