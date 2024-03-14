// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace zm_puppet;

// Namespace zm_puppet/zm_puppet
// Params 0, eflags: 0x0
// Checksum 0x3b054693, Offset: 0x78
// Size: 0x210
function wait_for_puppet_pickup() {
    /#
        self endon(#"death");
        self.iscurrentlypuppet = 0;
        while (true) {
            if (isdefined(self.ispuppet) && self.ispuppet && !self.iscurrentlypuppet) {
                self notify(#"stop_zombie_goto_entrance");
                self.iscurrentlypuppet = 1;
            }
            if (!(isdefined(self.ispuppet) && self.ispuppet) && self.iscurrentlypuppet) {
                self.iscurrentlypuppet = 0;
            }
            if (isdefined(self.ispuppet) && self.ispuppet && zm_utility::check_point_in_playable_area(self.origin) && !isdefined(self.completed_emerging_into_playable_area)) {
                self zm_spawner::zombie_complete_emerging_into_playable_area();
                self.barricade_enter = 0;
            }
            player = getplayers()[0];
            if (isdefined(player) && player buttonpressed("<unknown string>")) {
                if (self.iscurrentlypuppet) {
                    if (zm_utility::check_point_in_playable_area(self.goalpos) && !zm_utility::check_point_in_playable_area(self.origin)) {
                        self.backedupgoal = self.goalpos;
                    }
                    if (!zm_utility::check_point_in_playable_area(self.goalpos) && isdefined(self.backupnode) && self.goalpos != self.backupnode.origin) {
                        self notify(#"stop_zombie_goto_entrance");
                    }
                }
            }
            waitframe(1);
        }
    #/
}

