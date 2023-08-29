// Atian COD Tools GSC decompiler test
#namespace scripted;

// Namespace scripted/scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x5b15146, Offset: 0x80
// Size: 0x9a
function main() {
    self endon(#"death");
    self notify(#"killanimscript");
    self notify(#"clearsuppressionattack");
    self.codescripted[#"root"] = "body";
    self endon(#"end_sequence");
    self.a.script = "scripted";
    self waittill(#"killanimscript");
}

// Namespace scripted/scripted
// Params 9, eflags: 0x0
// Checksum 0x80072302, Offset: 0x128
// Size: 0x4c
function init(notifyname, origin, angles, theanim, animmode, root, rate, goaltime, lerptime) {
    
}

// Namespace scripted/scripted
// Params 0, eflags: 0x1 linked
// Checksum 0x1cc19653, Offset: 0x180
// Size: 0x20
function end_script() {
    if (isdefined(self.___archetypeonbehavecallback)) {
        [[ self.___archetypeonbehavecallback ]](self);
    }
}

