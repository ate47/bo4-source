#namespace throttle;

// Namespace throttle
// Method(s) 8 Total 8
class throttle {

    var processed_;
    var processlimit_;
    var queue_;
    var updaterate_;
    var var_3cd6b18f;

    // Namespace throttle/throttle_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0xcf965234, Offset: 0xa8
    // Size: 0x66
    constructor() {
        queue_ = [];
        processed_ = 0;
        processlimit_ = 1;
        var_3cd6b18f = [];
        updaterate_ = float(function_60d95f53()) / 1000;
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x269f96d9, Offset: 0x498
    // Size: 0x24
    function leavequeue(entity) {
        arrayremovevalue(queue_, entity);
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xba410401, Offset: 0x468
    // Size: 0x22
    function wm_ht_posidlestart(entity) {
        return isinarray(queue_, entity);
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2d25ee26, Offset: 0x308
    // Size: 0x154
    function waitinqueue(entity = randomint(2147483647)) {
        if (processed_ >= processlimit_) {
            nextqueueindex = queue_.size < 0 ? 0 : getlastarraykey(queue_) + 1;
            queue_[nextqueueindex] = entity;
            firstinqueue = 0;
            while (!firstinqueue) {
                if (!isdefined(entity)) {
                    return;
                }
                firstqueueindex = getfirstarraykey(queue_);
                if (processed_ < processlimit_ && queue_[firstqueueindex] === entity) {
                    firstinqueue = 1;
                    queue_[firstqueueindex] = undefined;
                    continue;
                }
                var_3cd6b18f[var_3cd6b18f.size] = entity;
                wait updaterate_;
            }
        }
        processed_++;
    }

    // Namespace throttle/throttle_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xadac57ee, Offset: 0x268
    // Size: 0x94
    function initialize(processlimit = 1, updaterate = float(function_60d95f53()) / 1000) {
        processlimit_ = processlimit;
        updaterate_ = updaterate;
        self thread _updatethrottlethread(self);
    }

    // Namespace throttle/throttle_shared
    // Params 0, eflags: 0x5 linked
    // Checksum 0x6910f927, Offset: 0x128
    // Size: 0x132
    function private _updatethrottle() {
        processed_ = 0;
        currentqueue = queue_;
        queue_ = [];
        foreach (item in currentqueue) {
            if (!isdefined(item)) {
                continue;
            }
            foreach (var_fe3b6341 in var_3cd6b18f) {
                if (item === var_fe3b6341) {
                    queue_[queue_.size] = item;
                    break;
                }
            }
        }
        var_3cd6b18f = [];
    }

    // Namespace throttle/throttle_shared
    // Params 1, eflags: 0x5 linked
    // Checksum 0x2c744361, Offset: 0x68
    // Size: 0x34
    function private _updatethrottlethread(throttle) {
        while (isdefined(throttle)) {
            [[ throttle ]]->_updatethrottle();
            wait throttle.updaterate_;
        }
    }

}

