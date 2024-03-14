// Atian COD Tools GSC decompiler test
#namespace perks;

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x8219a3d3, Offset: 0x68
// Size: 0xd4
function perk_setperk(str_perk) {
    if (!isdefined(self.var_fb3c9d6a)) {
        self.var_fb3c9d6a = [];
    }
    if (!isdefined(self.var_fb3c9d6a[str_perk])) {
        self.var_fb3c9d6a[str_perk] = 0;
    }
    /#
        assert(self.var_fb3c9d6a[str_perk] >= 0, "<unknown string>");
    #/
    /#
        assert(self.var_fb3c9d6a[str_perk] < 23, "<unknown string>");
    #/
    self.var_fb3c9d6a[str_perk]++;
    self setperk(str_perk);
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x789e35b0, Offset: 0x148
// Size: 0xb4
function perk_unsetperk(str_perk) {
    if (!isdefined(self.var_fb3c9d6a)) {
        self.var_fb3c9d6a = [];
    }
    if (!isdefined(self.var_fb3c9d6a[str_perk])) {
        self.var_fb3c9d6a[str_perk] = 0;
    }
    self.var_fb3c9d6a[str_perk]--;
    /#
        assert(self.var_fb3c9d6a[str_perk] >= 0, "<unknown string>");
    #/
    if (self.var_fb3c9d6a[str_perk] <= 0) {
        self unsetperk(str_perk);
    }
}

// Namespace perks/perks
// Params 1, eflags: 0x1 linked
// Checksum 0x2c0fb884, Offset: 0x208
// Size: 0x4a
function perk_hasperk(str_perk) {
    if (isdefined(self.var_fb3c9d6a) && isdefined(self.var_fb3c9d6a[str_perk]) && self.var_fb3c9d6a[str_perk] > 0) {
        return true;
    }
    return false;
}

// Namespace perks/perks
// Params 0, eflags: 0x1 linked
// Checksum 0x69dd788, Offset: 0x260
// Size: 0x26
function perk_reset_all() {
    self clearperks();
    self.var_fb3c9d6a = [];
}

