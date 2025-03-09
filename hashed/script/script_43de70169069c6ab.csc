#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace namespace_9d58c1cd;

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x230
// Size: 0x4
function init() {
    
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x0
// Checksum 0xb53ed20d, Offset: 0x240
// Size: 0x19c
function init_clientfields() {
    clientfield::register("toplayer", "sp_ar_pi", 1, 1, "int", &function_69a31ba8, 0, 0);
    clientfield::register("scriptmover", "elevator_rumble", 1, 1, "counter", &play_elevator_rumble, 0, 0);
    clientfield::register("world", "p_w_o_num_01", 1, getminbitcountfornum(10), "int", &function_d38f33fb, 0, 0);
    clientfield::register("world", "p_w_o_num_02", 1, getminbitcountfornum(10), "int", &function_c5199710, 0, 0);
    clientfield::register("world", "p_w_o_num_03", 1, getminbitcountfornum(10), "int", &function_68a0de20, 0, 0);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x3e8
// Size: 0x4
function main() {
    
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0x6887082, Offset: 0x3f8
// Size: 0x8c
function function_d38f33fb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_number = struct::get("n_c_w_p_01");
    s_number function_ba8cd0cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0xc4149931, Offset: 0x490
// Size: 0x8c
function function_c5199710(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_number = struct::get("n_c_w_p_02");
    s_number function_ba8cd0cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0xd5d89043, Offset: 0x528
// Size: 0x8c
function function_68a0de20(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump) {
    s_number = struct::get("n_c_w_p_03");
    s_number function_ba8cd0cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0x9de7415d, Offset: 0x5c0
// Size: 0x35e
function function_ba8cd0cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == 0) {
        if (isdefined(self.mdl_paper)) {
            self.mdl_paper.script_int = newval;
            self.mdl_paper.b_hidden = 1;
            self.mdl_paper function_386b1e70(localclientnum);
        } else {
            self.mdl_paper = util::spawn_model(localclientnum, self.model, self.origin, self.angles);
            self.mdl_paper.script_int = newval;
            self.mdl_paper.b_hidden = 1;
            self.mdl_paper.show_function = &function_43c140b4;
            self.mdl_paper.hide_function = &function_386b1e70;
            self.mdl_paper function_386b1e70(localclientnum);
            if (!isdefined(level.var_22a393d4)) {
                level.var_22a393d4 = [];
            } else if (!isarray(level.var_22a393d4)) {
                level.var_22a393d4 = array(level.var_22a393d4);
            }
            level.var_22a393d4[level.var_22a393d4.size] = self.mdl_paper;
        }
        return;
    }
    if (isdefined(self.mdl_paper)) {
        if (isdefined(self.mdl_paper.b_hidden) && self.mdl_paper.b_hidden) {
            self.mdl_paper.b_hidden = undefined;
        }
        self.mdl_paper.script_int = newval;
        return;
    }
    self.mdl_paper = util::spawn_model(localclientnum, self.model, self.origin, self.angles);
    self.mdl_paper.script_int = newval;
    self.mdl_paper.show_function = &function_43c140b4;
    self.mdl_paper.hide_function = &function_386b1e70;
    self.mdl_paper function_386b1e70(localclientnum);
    if (!isdefined(level.var_22a393d4)) {
        level.var_22a393d4 = [];
    } else if (!isarray(level.var_22a393d4)) {
        level.var_22a393d4 = array(level.var_22a393d4);
    }
    level.var_22a393d4[level.var_22a393d4.size] = self.mdl_paper;
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x0
// Checksum 0xbe9d5075, Offset: 0x928
// Size: 0x2f4
function function_386b1e70(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (self haspart(localclientnum, "tag_paper_on_1")) {
        self hidepart(localclientnum, "tag_paper_on_1");
    }
    if (self haspart(localclientnum, "tag_paper_on_2")) {
        self hidepart(localclientnum, "tag_paper_on_2");
    }
    if (self haspart(localclientnum, "tag_paper_on_3")) {
        self hidepart(localclientnum, "tag_paper_on_3");
    }
    if (self haspart(localclientnum, "tag_paper_on_4")) {
        self hidepart(localclientnum, "tag_paper_on_4");
    }
    if (self haspart(localclientnum, "tag_paper_on_5")) {
        self hidepart(localclientnum, "tag_paper_on_5");
    }
    if (self haspart(localclientnum, "tag_paper_on_6")) {
        self hidepart(localclientnum, "tag_paper_on_6");
    }
    if (self haspart(localclientnum, "tag_paper_on_7")) {
        self hidepart(localclientnum, "tag_paper_on_7");
    }
    if (self haspart(localclientnum, "tag_paper_on_8")) {
        self hidepart(localclientnum, "tag_paper_on_8");
    }
    if (self haspart(localclientnum, "tag_paper_on_9")) {
        self hidepart(localclientnum, "tag_paper_on_9");
    }
    if (self haspart(localclientnum, "tag_paper_on_0")) {
        self hidepart(localclientnum, "tag_paper_on_0");
    }
    if (self haspart(localclientnum, "tag_paper_off")) {
        self showpart(localclientnum, "tag_paper_off");
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 1, eflags: 0x0
// Checksum 0x77328f3a, Offset: 0xc28
// Size: 0x3c4
function function_43c140b4(localclientnum) {
    self endon(#"death");
    self util::waittill_dobj(localclientnum);
    if (self haspart(localclientnum, "tag_paper_on_1")) {
        self hidepart(localclientnum, "tag_paper_on_1");
    }
    if (self haspart(localclientnum, "tag_paper_on_2")) {
        self hidepart(localclientnum, "tag_paper_on_2");
    }
    if (self haspart(localclientnum, "tag_paper_on_3")) {
        self hidepart(localclientnum, "tag_paper_on_3");
    }
    if (self haspart(localclientnum, "tag_paper_on_4")) {
        self hidepart(localclientnum, "tag_paper_on_4");
    }
    if (self haspart(localclientnum, "tag_paper_on_5")) {
        self hidepart(localclientnum, "tag_paper_on_5");
    }
    if (self haspart(localclientnum, "tag_paper_on_6")) {
        self hidepart(localclientnum, "tag_paper_on_6");
    }
    if (self haspart(localclientnum, "tag_paper_on_7")) {
        self hidepart(localclientnum, "tag_paper_on_7");
    }
    if (self haspart(localclientnum, "tag_paper_on_8")) {
        self hidepart(localclientnum, "tag_paper_on_8");
    }
    if (self haspart(localclientnum, "tag_paper_on_9")) {
        self hidepart(localclientnum, "tag_paper_on_9");
    }
    if (self haspart(localclientnum, "tag_paper_on_0")) {
        self hidepart(localclientnum, "tag_paper_on_0");
    }
    if (self haspart(localclientnum, "tag_paper_off")) {
        self hidepart(localclientnum, "tag_paper_off");
    }
    if (isdefined(self.b_hidden) && self.b_hidden) {
        return;
    }
    if (isdefined(self.script_int)) {
        if (self.script_int == 10) {
            if (self haspart(localclientnum, "tag_paper_on_0")) {
                self showpart(localclientnum, "tag_paper_on_0");
            }
            return;
        }
        if (self haspart(localclientnum, "tag_paper_on_" + self.script_int)) {
            self showpart(localclientnum, "tag_paper_on_" + self.script_int);
        }
    }
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0x912bf96a, Offset: 0xff8
// Size: 0x64
function play_elevator_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self playrumbleonentity(localclientnum, #"hash_64b33287bc9d79f5");
}

// Namespace namespace_9d58c1cd/namespace_9d58c1cd
// Params 7, eflags: 0x0
// Checksum 0xcb12775d, Offset: 0x1068
// Size: 0x364
function function_69a31ba8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (!isdefined(level.var_7d33d419)) {
        level.var_7d33d419 = [];
    }
    if (!isdefined(level.var_7d33d419[localclientnum])) {
        var_5980d6d5 = struct::get("s_cr_sp_pi");
        level.var_7d33d419[localclientnum] = util::spawn_model(localclientnum, #"hash_66161656c8ef4b2d", var_5980d6d5.origin, var_5980d6d5.angles);
    }
    level.var_7d33d419[localclientnum] endon(#"death");
    level.var_7d33d419[localclientnum] util::waittill_dobj(localclientnum);
    if (newval) {
        if (level.var_7d33d419[localclientnum] haspart(localclientnum, "tag_elbow_r")) {
            level.var_7d33d419[localclientnum] showpart(localclientnum, "tag_elbow_r");
        }
        if (level.var_7d33d419[localclientnum] haspart(localclientnum, "tag_wrist_r")) {
            level.var_7d33d419[localclientnum] showpart(localclientnum, "tag_wrist_r");
        }
        if (level.var_7d33d419[localclientnum] haspart(localclientnum, "TAG_SPOON")) {
            level.var_7d33d419[localclientnum] showpart(localclientnum, "TAG_SPOON");
        }
        return;
    }
    if (level.var_7d33d419[localclientnum] haspart(localclientnum, "tag_elbow_r")) {
        level.var_7d33d419[localclientnum] hidepart(localclientnum, "tag_elbow_r");
    }
    if (level.var_7d33d419[localclientnum] haspart(localclientnum, "tag_wrist_r")) {
        level.var_7d33d419[localclientnum] hidepart(localclientnum, "tag_wrist_r");
    }
    if (level.var_7d33d419[localclientnum] haspart(localclientnum, "TAG_SPOON")) {
        level.var_7d33d419[localclientnum] hidepart(localclientnum, "TAG_SPOON");
    }
}

