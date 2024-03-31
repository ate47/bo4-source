// Atian COD Tools GSC decompiler test
#using scripts\core_common\scene_shared.gsc;

#namespace timecard_control;

// Namespace timecard_control/namespace_1bcdb6b6
// Params 2, eflags: 0x1 linked
// Checksum 0x4d7fb0b0, Offset: 0x90
// Size: 0x23a
function function_9b62d333(n_hour, n_minute) {
    var_f6197f53 = 0;
    switch (n_minute) {
    case 15:
        var_f6197f53 = 1;
        break;
    case 30:
        var_f6197f53 = 2;
        break;
    case 45:
        var_f6197f53 = 3;
        break;
    }
    if (!isdefined(self.n_hour)) {
        self.n_hour = 0;
    }
    if (!isdefined(self.var_f6197f53)) {
        self.var_f6197f53 = 0;
    }
    if (self.n_hour == n_hour && self.var_f6197f53 == var_f6197f53) {
        return;
    }
    if (self.n_hour == n_hour && self.var_f6197f53 <= var_f6197f53) {
        while (self.var_f6197f53 != var_f6197f53) {
            function_783891ed();
        }
        return;
    }
    if (self.var_f6197f53 <= var_f6197f53) {
        while (self.n_hour != n_hour) {
            function_64c53556();
        }
        while (self.var_f6197f53 != var_f6197f53) {
            function_783891ed();
        }
        return;
    }
    var_c6781a1b = self.n_hour + 1;
    if (var_c6781a1b == 12) {
    }
    for (var_c6781a1b = 0; var_c6781a1b != n_hour; var_c6781a1b = 0) {
        function_64c53556();
        var_c6781a1b = self.n_hour + 1;
        if (var_c6781a1b == 12) {
        }
    }
    while (self.var_f6197f53 != var_f6197f53) {
        function_783891ed();
    }
    return;
}

// Namespace timecard_control/namespace_1bcdb6b6
// Params 0, eflags: 0x1 linked
// Checksum 0x68e2ee62, Offset: 0x2d8
// Size: 0x3e
function function_64c53556() {
    for (i = 0; i < 4; i++) {
        function_783891ed();
    }
}

// Namespace timecard_control/namespace_1bcdb6b6
// Params 0, eflags: 0x1 linked
// Checksum 0x3fc02614, Offset: 0x320
// Size: 0x1c
function function_fba6efd4() {
    function_9e6251db("slow");
}

// Namespace timecard_control/namespace_1bcdb6b6
// Params 0, eflags: 0x1 linked
// Checksum 0x809a18cb, Offset: 0x348
// Size: 0x1c
function function_783891ed() {
    function_9e6251db("fast");
}

// Namespace timecard_control/namespace_1bcdb6b6
// Params 1, eflags: 0x5 linked
// Checksum 0xe90ef784, Offset: 0x370
// Size: 0x1e6
function private function_9e6251db(str_speed) {
    if (!isdefined(self.n_hour)) {
        self.n_hour = 0;
    }
    if (!isdefined(self.var_f6197f53)) {
        self.var_f6197f53 = 0;
    }
    var_cb3d2b85 = self.hour_hand.angles;
    var_86c6b8df = var_cb3d2b85[0] - 7.5;
    var_f6197f53 = self.var_f6197f53;
    var_e51ab168 = var_f6197f53 + 1;
    self.var_f6197f53++;
    var_64807aea = "pos_" + var_f6197f53 + "_to_" + var_e51ab168 + "_" + str_speed;
    var_c74251a4 = scene::function_8582657c(self.scriptbundlename, var_64807aea);
    if (var_c74251a4 <= 0) {
        if (str_speed == "fast") {
            var_c74251a4 = 0.166;
        } else {
            var_c74251a4 = 0.333;
        }
    }
    self.hour_hand rotatepitch(-7.5, var_c74251a4);
    self scene::play(var_64807aea);
    self.hour_hand.angles = (var_86c6b8df, var_cb3d2b85[1], var_cb3d2b85[2]);
    if (self.var_f6197f53 == 4) {
        self.var_f6197f53 = 0;
        self.n_hour++;
        if (self.n_hour == 12) {
            self.n_hour = 0;
        }
    }
}

