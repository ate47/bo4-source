// Atian COD Tools GSC decompiler test
#using scripts\core_common\array_shared.gsc;

#namespace character;

// Namespace character/character
// Params 1, eflags: 0x0
// Checksum 0xe0970276, Offset: 0x98
// Size: 0x3c
function setmodelfromarray(a) {
    self setmodel(a[randomint(a.size)]);
}

// Namespace character/character
// Params 1, eflags: 0x0
// Checksum 0x98c07c42, Offset: 0xe0
// Size: 0x28
function randomelement(a) {
    return a[randomint(a.size)];
}

// Namespace character/character
// Params 1, eflags: 0x0
// Checksum 0x18cf8cc7, Offset: 0x110
// Size: 0x3c
function attachfromarray(a) {
    self attach(randomelement(a), "", 1);
}

// Namespace character/character
// Params 0, eflags: 0x0
// Checksum 0xee3990bf, Offset: 0x158
// Size: 0x5c
function newcharacter() {
    self detachall();
    oldgunhand = self.anim_gunhand;
    if (!isdefined(oldgunhand)) {
        return;
    }
    self.anim_gunhand = "none";
    self [[ anim.putguninhand ]](oldgunhand);
}

// Namespace character/character
// Params 0, eflags: 0x0
// Checksum 0x7da24643, Offset: 0x1c0
// Size: 0x1dc
function save() {
    info[#"gunhand"] = self.anim_gunhand;
    info[#"guninhand"] = self.anim_guninhand;
    info[#"model"] = self.model;
    info[#"hatmodel"] = self.hatmodel;
    info[#"gearmodel"] = self.gearmodel;
    if (isdefined(self.name)) {
        info[#"name"] = self.name;
        /#
            println("<unknown string>", self.name);
        #/
    } else {
        /#
            println("<unknown string>");
        #/
    }
    attachsize = self getattachsize();
    for (i = 0; i < attachsize; i++) {
        info[#"attach"][i][#"model"] = self getattachmodelname(i);
        info[#"attach"][i][#"tag"] = self getattachtagname(i);
    }
    return info;
}

// Namespace character/character
// Params 1, eflags: 0x0
// Checksum 0x96765d83, Offset: 0x3a8
// Size: 0x1e6
function load(info) {
    self detachall();
    self.anim_gunhand = info[#"gunhand"];
    self.anim_guninhand = info[#"guninhand"];
    self setmodel(info[#"model"]);
    self.hatmodel = info[#"hatmodel"];
    self.gearmodel = info[#"gearmodel"];
    if (isdefined(info[#"name"])) {
        self.name = info[#"name"];
        /#
            println("<unknown string>", self.name);
        #/
    } else {
        /#
            println("<unknown string>");
        #/
    }
    attachinfo = info[#"attach"];
    attachsize = attachinfo.size;
    for (i = 0; i < attachsize; i++) {
        self attach(attachinfo[i][#"model"], attachinfo[i][#"tag"]);
    }
}

// Namespace character/character
// Params 1, eflags: 0x0
// Checksum 0xea2658c4, Offset: 0x598
// Size: 0x1e2
function get_random_character(amount) {
    self_info = strtok(self.classname, "_");
    if (self_info.size <= 2) {
        return randomint(amount);
    }
    group = "auto";
    index = undefined;
    prefix = self_info[2];
    if (isdefined(self.script_char_index)) {
        index = self.script_char_index;
    }
    if (isdefined(self.script_char_group)) {
        type = "grouped";
        group = "group_" + self.script_char_group;
    }
    if (!isdefined(level.character_index_cache)) {
        level.character_index_cache = [];
    }
    if (!isdefined(level.character_index_cache[prefix])) {
        level.character_index_cache[prefix] = [];
    }
    if (!isdefined(level.character_index_cache[prefix][group])) {
        initialize_character_group(prefix, group, amount);
    }
    if (!isdefined(index)) {
        index = get_least_used_index(prefix, group);
        if (!isdefined(index)) {
            index = randomint(5000);
        }
    }
    while (index >= amount) {
        index = index - amount;
    }
    level.character_index_cache[prefix][group][index]++;
    return index;
}

// Namespace character/character
// Params 2, eflags: 0x0
// Checksum 0x32b6e5f0, Offset: 0x788
// Size: 0x14a
function get_least_used_index(prefix, group) {
    lowest_indices = [];
    lowest_use = level.character_index_cache[prefix][group][0];
    lowest_indices[0] = 0;
    for (i = 1; i < level.character_index_cache[prefix][group].size; i++) {
        if (level.character_index_cache[prefix][group][i] > lowest_use) {
            continue;
        }
        if (level.character_index_cache[prefix][group][i] < lowest_use) {
            lowest_indices = [];
            lowest_use = level.character_index_cache[prefix][group][i];
        }
        lowest_indices[lowest_indices.size] = i;
    }
    /#
        assert(lowest_indices.size, "<unknown string>");
    #/
    return array::random(lowest_indices);
}

// Namespace character/character
// Params 3, eflags: 0x0
// Checksum 0x5f14c833, Offset: 0x8e0
// Size: 0x60
function initialize_character_group(prefix, group, amount) {
    for (i = 0; i < amount; i++) {
        level.character_index_cache[prefix][group][i] = 0;
    }
}

