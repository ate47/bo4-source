#namespace delete;

// Namespace delete/delete
// Params 1, eflags: 0x40
// Checksum 0x899ec20e, Offset: 0x68
// Size: 0x10c
function event_handler[delete] main(eventstruct) {
    assert(isdefined(self));
    waitframe(1);
    if (isdefined(self)) {
        /#
            if (isdefined(self.classname)) {
                if (self.classname == "<dev string:x38>" || self.classname == "<dev string:x47>" || self.classname == "<dev string:x58>") {
                    println("<dev string:x6b>");
                    println("<dev string:x6e>" + self getentitynumber() + "<dev string:xae>" + self.origin);
                    println("<dev string:x6b>");
                }
            }
        #/
        self delete();
    }
}

