// Atian COD Tools GSC decompiler test
#namespace throttle;

// Namespace throttle
// Method(s) 8 Total 8
class throttle {

    // Namespace throttle/throttle_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0xcf965234, Offset: 0xa8
    // Size: 0x66
    __constructor() {
        self.queue_ = [];
        self.processed_ = 0;
        self.processlimit_ = 1;
        self.var_3cd6b18f = [];
        self.updaterate_ = float(function_60d95f53()) / 1000;
    }

    // Namespace throttle/throttle_shared
    // Params 0, eflags: 0x11 linked
    // Checksum 0x80f724d1, Offset: 0x118
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x269f96d9, Offset: 0x498
    // Size: 0x24
    function leavequeue(entity) {
        arrayremovevalue(self.queue_, entity);
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xba410401, Offset: 0x468
    // Size: 0x22
    function wm_ht_posidlestart(entity) {
        return isinarray(self.queue_, entity);
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2d25ee26, Offset: 0x308
    // Size: 0x154
    function waitinqueue(entity = randomint(2147483647)) {
        if (self.processed_ >= self.processlimit_) {
            nextqueueindex = self.queue_.size < 0 ? getlastarraykey(self.queue_) + 1 : 0;
            self.queue_[nextqueueindex] = entity;
            firstinqueue = 0;
            while (!firstinqueue) {
                if (!isdefined(entity)) {
                    return;
                }
                firstqueueindex = getfirstarraykey(self.queue_);
                if (self.processed_ < self.processlimit_ && self.queue_[firstqueueindex] === entity) {
                    firstinqueue = 1;
                    firstqueueindex = [];
                } else {
                    self.var_3cd6b18f[self.var_3cd6b18f.size] = entity;
                    wait(self.updaterate_);
                }
            }
        }
        self.processed_++;
    }

    // Namespace throttle/throttle_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xadac57ee, Offset: 0x268
    // Size: 0x94
    function initialize(processlimit = 1, updaterate = float(function_60d95f53()) / 1000) {
        self.processlimit_ = processlimit;
        self.updaterate_ = updaterate;
        self thread _updatethrottlethread(self);
    }

    // Namespace throttle/throttle_shared
    // Params 0, eflags: 0x5 linked
    // Checksum 0x6910f927, Offset: 0x128
    // Size: 0x132
    function private _updatethrottle() {
        self.processed_ = 0;
        currentqueue = self.queue_;
        self.queue_ = [];
        foreach (item in currentqueue) {
            if (!isdefined(item)) {
                continue;
            }
            foreach (var_fe3b6341 in self.var_3cd6b18f) {
                if (item === var_fe3b6341) {
                    self.queue_[self.queue_.size] = item;
                    break;
                }
            }
        }
        self.var_3cd6b18f = [];
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x5 linked
    // Checksum 0x2c744361, Offset: 0x68
    // Size: 0x34
    function private _updatethrottlethread(throttle) {
        while (isdefined(throttle)) {
            [[ throttle ]]->_updatethrottle();
            wait(throttle.updaterate_);
        }
    }

}

