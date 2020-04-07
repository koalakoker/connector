import obj;

struct Node {
  Obj obj;
  
  void operator init(pair pos, string name = "", align align = NoAlign) {
    
    obj.operator init(pos, 0, name, align);
    
    Anchor[] aL;
    Anchor a;
    a = Anchor((0, 0), DN);
    aL.push(a);
    a = Anchor((0, 0), DS);
    aL.push(a);
    a = Anchor((0, 0), DE);
    aL.push(a);
    a = Anchor((0, 0), DW);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen) {
    if (this.obj.name != "") {
      label(this.obj.name, this.obj.pos, align = this.obj.align);
    }
    dot(obj.pos, p);
  }
}

Obj operator cast(Node node) {return node.obj;}

struct Resistor {
  Obj obj;
  path p;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    pair[] p = {(0,0), (.15,0), (.2,.1), (.3,-.1), (.4,.1), (.5,-.1), (.6,.1), (.7,-.1), (.8,.1), (.85,0), (1,0)};
    this.p = p[0] -- p[1] -- p[2] -- p[3] -- p[4] -- p[5] -- p[6] -- p[7] -- p[8] -- p[9] -- p[10];

    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0), DW);
      aL.push(a);
      a = Anchor((1,0),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0,0), DS);
      aL.push(a);
      a = Anchor((0,1), DN);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0,0), DN);
      aL.push(a);
      a = Anchor((0,-1), DS);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    draw (shift(this.obj.pos) * rotate(this.orient, (0,0)) * this.p, p = p);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2, 0.5));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2, -0.5));
    }
    
    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Resistor resistor) {return resistor.obj;}

struct Capacitor {
  Obj obj;
  path[] p;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    pair[] p = {(0,0), (.45,0), (.45,-.2), (.45,.2), (.55,-.2), (.55,.2), (.55,0), (1,0)};
    this.p = p[0] -- p[1] ^^ p[2] -- p[3] ^^ p[4] -- p[5] ^^ p[6] -- p[7];

    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0), DW);
      aL.push(a);
      a = Anchor((1,0),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0,0), DS);
      aL.push(a);
      a = Anchor((0,1), DN);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0,0), DN);
      aL.push(a);
      a = Anchor((0,-1), DS);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    draw (shift(this.obj.pos) * rotate(this.orient, (0,0)) * this.p, p = p);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.35,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2,0.35));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2,-0.35));
    }
    
    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Capacitor capacitor) {return capacitor.obj;}

void drawCoil(pair origin, real orient = 0, pen p = currentpen) {
  guide Pcoil;
  path bounding_box = (0,1.2)--(0,-1.2)--(9,-1.2)--(9,1.2)--cycle;
  path l1 = ((0,0) -- (-3,0));
  path l2 = ((9,0) -- (12,0));
  for (int t = 0;t < 15; ++t) {
    Pcoil = Pcoil .. (t / 2 + 1 - cos(3.1415926 * t / 2), 1.2 * sin(3.1415926 * t / 2));
  }
  draw(shift(origin) * scale(1/15) * rotate(orient) * shift(3) * (l1 ^^ l2 ^^ Pcoil), p = p);
}

struct Inductor {
  Obj obj;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0), DW);
      aL.push(a);
      a = Anchor((1,0),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0,0), DS);
      aL.push(a);
      a = Anchor((0,1), DN);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0,0), DN);
      aL.push(a);
      a = Anchor((0,-1), DS);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawCoil(this.obj.pos, this.orient, p = currentpen);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2,0.5));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2,-0.5));
    }

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Inductor inductor) {return inductor.obj;}

void drawFuse(pair origin, real orient = 0, pen p = currentpen) {
  real r = 0.1;
  path a1 = arc((r+.3,0), r, 180, 360 );
  path a2 = arc((r+.5,0), r, 180, 0   );
  path l1 = ((0 ,0) -- (.3,0));
  path l2 = ((.7,0) -- (1 ,0));
  draw(shift(origin) * rotate(orient) * (l1 ^^ a1 ^^ a2 ^^ l2), p = p);
}

struct Fuse {
  Obj obj;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0), DW);
      aL.push(a);
      a = Anchor((1,0),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0,0), DS);
      aL.push(a);
      a = Anchor((0,1), DN);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0,0), DN);
      aL.push(a);
      a = Anchor((0,-1), DS);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawFuse(this.obj.pos, this.orient, p = currentpen);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2,0.5));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2,-0.5));
    }

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Fuse fuse) {return fuse.obj;}

void drawRelay(pair origin, real orient = 0, pen p = currentpen) {
  real r = 0.1;
  path a1 = arc((r + .1, 0), r, 180, 0 );
  path a2 = arc((r + .3, 0), r, 180, 0 );
  path a3 = arc((r + .5, 0), r, 180, 0 );
  path a4 = arc((r + .7, 0), r, 180, 0 );
  path l1 = ((0, 0) -- (.1, 0));
  path l2 = ((.9,0) -- ( 1, 0));
  draw(shift(origin) * rotate(orient) * (l1 ^^ a1 ^^ a2 ^^ a3 ^^ a4 ^^ l2), p = p);
  path p1 = (0  ,.4) -- (.35, .4);
  path p2 = (.65,.4) -- (1,   .4);
  path p3 = rotate(-30, (.65,.4)) * ((.35, .4) -- (.65,.4));
  draw(shift(origin) * rotate(orient) * (p1 ^^ p2 ^^ p3), p = p);
  dot (shift(origin) * rotate(orient) * ((.35, .4) ^^ (.65,.4)), p = p);
  path centerBox = box((.1,.19) , (.9,.21));
  fill(shift(origin) * rotate(orient) * centerBox, p = p);
}

struct Relay {
  Obj obj;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90) && (orient != -180) && (orient != 180)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    Anchor[] aL;
    Anchor a;
    a = Anchor(rotate(orient) * (0,0),  rotateDir(DW, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (1,0),  rotateDir(DE, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (0,.4), rotateDir(DW, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (1,.4), rotateDir(DE, orient));
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawRelay(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.7,0.6));

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Relay relay) {return relay.obj;}

void drawIGBT(pair origin, bool drawAncorPoints = false) {

    defaultpen(2);

    draw(shift(origin) * ((0,0)--(0.25,0)));
    draw(shift(origin) * ((0.25,-0.1)--(0.25,0.1)));
    draw(shift(origin) * ((0.3,-0.2)--(0.3,0.2)));
    draw(shift(origin) * ((0.3,0.1 )--(0.5, 0.3)--(0.5,0.5)));
    draw(shift(origin) * ((0.3,-0.1)--(0.5,-0.3)--(0.5,-0.5)), arrow = Arrow(position = MidPoint) );
    draw(shift(origin) * ((0.5,-0.4)--(0.7,-0.4)--(0.7,0.4)--(0.5,0.4)));

    fill(shift(origin) * ((.6,-.1)--(.8,-.1)--(0.7,0.1)--cycle));
    draw(shift(origin) * ((.6,.1)--(.8,.1)));

    dot(shift(origin) * ((.5,.4) ^^ (.5,-.4)), p = black + 5.0);

    if (drawAncorPoints) {
        dot(shift(origin) * (0,0), p = black + 5.0);
        dot(shift(origin) * (.5,.5), p = black + 5.0);
        dot(shift(origin) * (.5,-.5), p = black + 5.0);
    }

    defaultpen(1);
}

struct Igbt {
  Obj obj;
  bool showAnchor = false;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    
    this.orient = 0;

    obj.operator init(pos, 0, name);
    
    Anchor[] aL;
    Anchor a;
    a = Anchor((0, 0), DW);
    aL.push(a);
    a = Anchor((.5, .5),  DN);
    aL.push(a);
    a = Anchor((.5, -.5),  DS);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw() {
    drawIGBT(this.obj.pos);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.2,0.3));
    } else {
      label(this.obj.name, this.obj.pos + (0.8,0.5));
    }
    
    if (this.showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Igbt igbt) {return igbt.obj;}