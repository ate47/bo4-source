// Atian COD Tools GSC decompiler test
#namespace delete;

// Namespace delete/delete
// Params 1, eflags: 0x40
// Checksum 0xf2a653ac, Offset: 0x68
// Size: 0x10c
function event_handler[delete] main(eventstruct) {
    assert(isdefined(self));
    waitframe(1);
    if (isdefined(self)) {
        /#
            if (isdefined(self.classname)) {
                if (self.classname == "<unknown string>" || self.classname == "<unknown string>" || self.classname == "<unknown string>") {
                    println("<unknown string>");
                    println("<unknown string>" + self getentitynumber() + "<unknown string>" + self.origin);
                    println("<unknown string>");
                }
            }
        #/
        self delete();
    }
}

