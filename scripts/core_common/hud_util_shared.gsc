// Atian COD Tools GSC decompiler test
#namespace hud;

// Namespace hud/hud_util_shared
// Params 1, eflags: 0x0
// Checksum 0xe295d952, Offset: 0x68
// Size: 0xdc
function setparent(element) {
    /#
        if (isdefined(self.parent) && self.parent == element) {
            return;
        }
        if (isdefined(self.parent)) {
            self.parent removechild(self);
        }
        self.parent = element;
        self.parent addchild(self);
        if (isdefined(self.point)) {
            self setpoint(self.point, self.relativepoint, self.xoffset, self.yoffset);
            return;
        }
        self setpoint("<unknown string>");
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0x7296c7f2, Offset: 0x150
// Size: 0x10
function getparent() {
    /#
        return self.parent;
    #/
}

// Namespace hud/hud_util_shared
// Params 1, eflags: 0x0
// Checksum 0x63b30dbe, Offset: 0x168
// Size: 0x3e
function addchild(element) {
    /#
        element.index = self.children.size;
        self.children[self.children.size] = element;
    #/
}

// Namespace hud/hud_util_shared
// Params 1, eflags: 0x0
// Checksum 0x8a7c038c, Offset: 0x1b0
// Size: 0xbe
function removechild(element) {
    /#
        element.parent = undefined;
        if (self.children[self.children.size - 1] != element) {
            self.children[element.index] = self.children[self.children.size - 1];
            self.children[element.index].index = element.index;
        }
        self.children[self.children.size - 1] = undefined;
        element.index = undefined;
    #/
}

// Namespace hud/hud_util_shared
// Params 5, eflags: 0x0
// Checksum 0x5715faba, Offset: 0x278
// Size: 0x8d4
function setpoint(point, relativepoint, xoffset, yoffset, movetime) {
    /#
        if (!isdefined(movetime)) {
            movetime = 0;
        }
        element = self getparent();
        if (movetime) {
            self moveovertime(movetime);
        }
        if (!isdefined(xoffset)) {
            xoffset = 0;
        }
        self.xoffset = xoffset;
        if (!isdefined(yoffset)) {
            yoffset = 0;
        }
        self.yoffset = yoffset;
        self.point = point;
        self.alignx = "<unknown string>";
        self.aligny = "<unknown string>";
        switch (point) {
        case #"center":
            break;
        case #"top":
            self.aligny = "<unknown string>";
            break;
        case #"bottom":
            self.aligny = "<unknown string>";
            break;
        case #"left":
            self.alignx = "<unknown string>";
            break;
        case #"right":
            self.alignx = "<unknown string>";
            break;
        case #"topright":
        case #"top_right":
            self.aligny = "<unknown string>";
            self.alignx = "<unknown string>";
            break;
        case #"topleft":
        case #"top_left":
            self.aligny = "<unknown string>";
            self.alignx = "<unknown string>";
            break;
        case #"topcenter":
            self.aligny = "<unknown string>";
            self.alignx = "<unknown string>";
            break;
        case #"bottom_right":
        case #"bottom right":
            self.aligny = "<unknown string>";
            self.alignx = "<unknown string>";
            break;
        case #"bottom left":
        case #"bottom_left":
            self.aligny = "<unknown string>";
            self.alignx = "<unknown string>";
            break;
        default:
            println("<unknown string>" + point);
            break;
        }
        if (!isdefined(relativepoint)) {
            relativepoint = point;
        }
        self.relativepoint = relativepoint;
        relativex = "<unknown string>";
        relativey = "<unknown string>";
        switch (relativepoint) {
        case #"center":
            break;
        case #"top":
            relativey = "<unknown string>";
            break;
        case #"bottom":
            relativey = "<unknown string>";
            break;
        case #"left":
            relativex = "<unknown string>";
            break;
        case #"right":
            relativex = "<unknown string>";
            break;
        case #"topright":
        case #"top_right":
            relativey = "<unknown string>";
            relativex = "<unknown string>";
            break;
        case #"topleft":
        case #"top_left":
            relativey = "<unknown string>";
            relativex = "<unknown string>";
            break;
        case #"topcenter":
            relativey = "<unknown string>";
            relativex = "<unknown string>";
            break;
        case #"bottom_right":
        case #"bottom right":
            relativey = "<unknown string>";
            relativex = "<unknown string>";
            break;
        case #"bottom left":
        case #"bottom_left":
            relativey = "<unknown string>";
            relativex = "<unknown string>";
            break;
        default:
            println("<unknown string>" + relativepoint);
            break;
        }
        if (element == level.uiparent) {
            self.horzalign = relativex;
            self.vertalign = relativey;
        } else {
            self.horzalign = element.horzalign;
            self.vertalign = element.vertalign;
        }
        if (relativex == element.alignx) {
            offsetx = 0;
            xfactor = 0;
        } else if (relativex == "<unknown string>" || element.alignx == "<unknown string>") {
            offsetx = int(element.width / 2);
            if (relativex == "<unknown string>" || element.alignx == "<unknown string>") {
                xfactor = -1;
            } else {
                xfactor = 1;
            }
        } else {
            offsetx = element.width;
            if (relativex == "<unknown string>") {
                xfactor = -1;
            } else {
                xfactor = 1;
            }
        }
        self.x = element.x + offsetx * xfactor;
        if (relativey == element.aligny) {
            offsety = 0;
            yfactor = 0;
        } else if (relativey == "<unknown string>" || element.aligny == "<unknown string>") {
            offsety = int(element.height / 2);
            if (relativey == "<unknown string>" || element.aligny == "<unknown string>") {
                yfactor = -1;
            } else {
                yfactor = 1;
            }
        } else {
            offsety = element.height;
            if (relativey == "<unknown string>") {
                yfactor = -1;
            } else {
                yfactor = 1;
            }
        }
        self.y = element.y + offsety * yfactor;
        self.x = self.x + self.xoffset;
        self.y = self.y + self.yoffset;
        switch (self.elemtype) {
        case #"bar":
            setpointbar(point, relativepoint, xoffset, yoffset);
            self.barframe setparent(self getparent());
            self.barframe setpoint(point, relativepoint, xoffset, yoffset);
            break;
        }
        self updatechildren();
    #/
}

// Namespace hud/hud_util_shared
// Params 4, eflags: 0x0
// Checksum 0x20f814c, Offset: 0xb58
// Size: 0x1bc
function setpointbar(point, relativepoint, xoffset, yoffset) {
    /#
        self.bar.horzalign = self.horzalign;
        self.bar.vertalign = self.vertalign;
        self.bar.alignx = "<unknown string>";
        self.bar.aligny = self.aligny;
        self.bar.y = self.y;
        if (self.alignx == "<unknown string>") {
            self.bar.x = self.x;
        } else if (self.alignx == "<unknown string>") {
            self.bar.x = self.x - self.width;
        } else {
            self.bar.x = self.x - int(self.width / 2);
        }
        if (self.aligny == "<unknown string>") {
            self.bar.y = self.y;
        } else if (self.aligny == "<unknown string>") {
            self.bar.y = self.y;
        }
        self updatebar(self.bar.frac);
    #/
}

// Namespace hud/hud_util_shared
// Params 2, eflags: 0x0
// Checksum 0x60f7409d, Offset: 0xd20
// Size: 0x44
function updatebar(barfrac, rateofchange) {
    /#
        if (self.elemtype == "<unknown string>") {
            updatebarscale(barfrac, rateofchange);
        }
    #/
}

// Namespace hud/hud_util_shared
// Params 2, eflags: 0x0
// Checksum 0x6dc31d3, Offset: 0xd70
// Size: 0x23e
function updatebarscale(barfrac, rateofchange) {
    /#
        barwidth = int(self.width * barfrac + 0.5);
        if (!barwidth) {
            barwidth = 1;
        }
        self.bar.frac = barfrac;
        self.bar setshader(self.bar.shader, barwidth, self.height);
        assert(barwidth <= self.width, "<unknown string>" + barwidth + "<unknown string>" + self.width + "<unknown string>" + barfrac);
        if (isdefined(rateofchange) && barwidth < self.width) {
            if (rateofchange > 0) {
                assert((1 - barfrac) / rateofchange > 0, "<unknown string>" + barfrac + "<unknown string>" + rateofchange);
                self.bar scaleovertime((1 - barfrac) / rateofchange, self.width, self.height);
            } else if (rateofchange < 0) {
                assert(barfrac / -1 * rateofchange > 0, "<unknown string>" + barfrac + "<unknown string>" + rateofchange);
                self.bar scaleovertime(barfrac / -1 * rateofchange, 1, self.height);
            }
        }
        self.bar.rateofchange = rateofchange;
        self.bar.lastupdatetime = gettime();
    #/
}

// Namespace hud/hud_util_shared
// Params 2, eflags: 0x0
// Checksum 0xe8d571ee, Offset: 0xfb8
// Size: 0x118
function function_665f547d(font, fontscale) {
    /#
        fontelem = newdebughudelem(self);
        fontelem.elemtype = "<unknown string>";
        fontelem.font = font;
        fontelem.fontscale = fontscale;
        fontelem.x = 0;
        fontelem.y = 0;
        fontelem.width = 0;
        fontelem.height = int(level.fontheight * fontscale);
        fontelem.xoffset = 0;
        fontelem.yoffset = 0;
        fontelem.children = [];
        fontelem setparent(level.uiparent);
        fontelem.hidden = 0;
        return fontelem;
    #/
}

// Namespace hud/hud_util_shared
// Params 2, eflags: 0x0
// Checksum 0x6840ad1, Offset: 0x10d8
// Size: 0x118
function function_f5a689d(font, fontscale) {
    /#
        fontelem = newdebughudelem();
        fontelem.elemtype = "<unknown string>";
        fontelem.font = font;
        fontelem.fontscale = fontscale;
        fontelem.x = 0;
        fontelem.y = 0;
        fontelem.width = 0;
        fontelem.height = int(level.fontheight * fontscale);
        fontelem.xoffset = 0;
        fontelem.yoffset = 0;
        fontelem.children = [];
        fontelem setparent(level.uiparent);
        fontelem.hidden = 0;
        return fontelem;
    #/
}

// Namespace hud/hud_util_shared
// Params 3, eflags: 0x0
// Checksum 0x8487fe16, Offset: 0x11f8
// Size: 0x358
function function_7a0dd8a9(color, width, height) {
    /#
        barelem = newdebughudelem(self);
        barelem.x = 0;
        barelem.y = 0;
        barelem.frac = 0;
        barelem.color = color;
        barelem.sort = -2;
        barelem.shader = "<unknown string>";
        barelem setshader(#"progress_bar_fill", width, height);
        barelem.hidden = 0;
        barelemframe = newdebughudelem(self);
        barelemframe.elemtype = "<unknown string>";
        barelemframe.x = 0;
        barelemframe.y = 0;
        barelemframe.width = width;
        barelemframe.height = height;
        barelemframe.xoffset = 0;
        barelemframe.yoffset = 0;
        barelemframe.bar = barelem;
        barelemframe.barframe = barelemframe;
        barelemframe.children = [];
        barelemframe.sort = -1;
        barelemframe.color = (1, 1, 1);
        barelemframe setparent(level.uiparent);
        barelemframe.hidden = 0;
        barelembg = newdebughudelem(self);
        barelembg.elemtype = "<unknown string>";
        if (!level.splitscreen) {
            barelembg.x = -2;
            barelembg.y = -2;
        }
        barelembg.width = width;
        barelembg.height = height;
        barelembg.xoffset = 0;
        barelembg.yoffset = 0;
        barelembg.bar = barelem;
        barelembg.barframe = barelemframe;
        barelembg.children = [];
        barelembg.sort = -3;
        barelembg.color = (0, 0, 0);
        barelembg.alpha = 0.5;
        barelembg setparent(level.uiparent);
        if (!level.splitscreen) {
            barelembg setshader(#"progress_bar_bg", width + 4, height + 4);
        } else {
            barelembg setshader(#"progress_bar_bg", width + 0, height + 0);
        }
        barelembg.hidden = 0;
        return barelembg;
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0x88e9ddbc, Offset: 0x1558
// Size: 0xaa
function function_5037fb7f() {
    /#
        bar = function_7a0dd8a9((1, 1, 1), level.primaryprogressbarwidth, level.primaryprogressbarheight);
        if (level.splitscreen) {
            bar setpoint("<unknown string>", undefined, level.primaryprogressbarx, level.primaryprogressbary);
        } else {
            bar setpoint("<unknown string>", undefined, level.primaryprogressbarx, level.primaryprogressbary);
        }
        return bar;
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0x5cf4caeb, Offset: 0x1610
// Size: 0xb8
function function_48badcf4() {
    /#
        text = function_665f547d("<unknown string>", level.primaryprogressbarfontsize);
        if (level.splitscreen) {
            text setpoint("<unknown string>", undefined, level.primaryprogressbartextx, level.primaryprogressbartexty);
        } else {
            text setpoint("<unknown string>", undefined, level.primaryprogressbartextx, level.primaryprogressbartexty);
        }
        text.sort = -1;
        return text;
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0x1fa4024a, Offset: 0x16d0
// Size: 0xe2
function hideelem() {
    /#
        if (self.hidden) {
            return;
        }
        self.hidden = 1;
        if (self.alpha != 0) {
            self.alpha = 0;
        }
        if (self.elemtype == "<unknown string>" || self.elemtype == "<unknown string>") {
            self.bar.hidden = 1;
            if (self.bar.alpha != 0) {
                self.bar.alpha = 0;
            }
            self.barframe.hidden = 1;
            if (self.barframe.alpha != 0) {
                self.barframe.alpha = 0;
            }
        }
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0x335b64, Offset: 0x17c0
// Size: 0x10a
function showelem() {
    /#
        if (!self.hidden) {
            return;
        }
        self.hidden = 0;
        if (self.elemtype == "<unknown string>" || self.elemtype == "<unknown string>") {
            if (self.alpha != 0.5) {
                self.alpha = 0.5;
            }
            self.bar.hidden = 0;
            if (self.bar.alpha != 1) {
                self.bar.alpha = 1;
            }
            self.barframe.hidden = 0;
            if (self.barframe.alpha != 1) {
                self.barframe.alpha = 1;
            }
            return;
        }
        if (self.alpha != 1) {
            self.alpha = 1;
        }
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0xc4aebba2, Offset: 0x18d8
// Size: 0x12c
function destroyelem() {
    /#
        tempchildren = [];
        for (index = 0; index < self.children.size; index++) {
            if (isdefined(self.children[index])) {
                tempchildren[tempchildren.size] = self.children[index];
            }
        }
        for (index = 0; index < tempchildren.size; index++) {
            tempchildren[index] setparent(self getparent());
        }
        if (self.elemtype == "<unknown string>" || self.elemtype == "<unknown string>") {
            self.bar destroy();
            self.barframe destroy();
        }
        self destroy();
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0xd5ea92e5, Offset: 0x1a10
// Size: 0x8e
function updatechildren() {
    /#
        for (index = 0; index < self.children.size; index++) {
            child = self.children[index];
            child setpoint(child.point, child.relativepoint, child.xoffset, child.yoffset);
        }
    #/
}

// Namespace hud/hud_util_shared
// Params 0, eflags: 0x0
// Checksum 0xcd6364aa, Offset: 0x1aa8
// Size: 0x2c
function showperks() {
    /#
        self luinotifyevent(#"show_perk_notification", 0);
    #/
}

