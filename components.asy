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

  void draw() {
    if (this.obj.name != "") {
      label(this.obj.name, this.obj.pos, align = this.obj.align);
    }
    dot(obj.pos);
  }
}

Obj operator cast(Node node) {return node.obj;}

struct Resistor {
  Obj obj;
  path p;
  bool showAnchor = false;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    pair[] p = {(0,.5), (.15,.5), (.2,.6), (.3,.4), (.4,.6), (.5,.4), (.6,.6), (.7,.4), (.8,.6), (.85,.5), (1,.5)};
    this.p = p[0] -- p[1] -- p[2] -- p[3] -- p[4] -- p[5] -- p[6] -- p[7] -- p[8] -- p[9] -- p[10];

    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0.5), DW);
      aL.push(a);
      a = Anchor((1,0.5),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0.5,1), DN);
      aL.push(a);
      a = Anchor((0.5,0), DS);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0.5,0), DS);
      aL.push(a);
      a = Anchor((0.5,1), DN);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw() {
    draw (shift(this.obj.pos) * rotate(this.orient, (0.5,0.5)) * this.p);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
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

Obj operator cast(Resistor resistor) {return resistor.obj;}

struct Capacitor {
  Obj obj;
  path[] p;
  bool showAnchor = false;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + name + ". Forced to 0");
    } else {
      this.orient = orient;
    }

    obj.operator init(pos, 0, name);
    
    pair[] p = {(0,.5), (.4,.5), (.4,.3), (.4,.7), (.5,.3), (.5,.7), (.5,.5), (.9,.5)};
    this.p = p[0] -- p[1] ^^ p[2] -- p[3] ^^ p[4] -- p[5] ^^ p[6] -- p[7];

    Anchor[] aL;
    Anchor a;
    if (this.orient == 0) {
      a = Anchor((0,0.5), DW);
      aL.push(a);
      a = Anchor((.9,0.5),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0.5,.9), DN);
      aL.push(a);
      a = Anchor((0.5,0), DS);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0.5,0), DS);
      aL.push(a);
      a = Anchor((0.5,.9), DN);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw() {
    draw (shift(this.obj.pos) * rotate(this.orient, (0.45,0.5)) * this.p);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.45,0.1));
    } else {
      label(this.obj.name, this.obj.pos + (0.9,0.45));
    }
    
    if (this.showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Capacitor capacitor) {return capacitor.obj;}

void drawCoil(pair origin) {
  guide Pcoil;
  path bounding_box = (0,1.2)--(0,-1.2)--(9,-1.2)--(9,1.2)--cycle;
  path l1 = ((0,0) -- (-3,0));
  path l2 = ((9,0) -- (12,0));
  for (int t = 0;t < 15; ++t) {
    Pcoil = Pcoil .. (t / 2 + 1 - cos(3.1415926 * t / 2), 1.2 * sin(3.1415926 * t / 2));
  }
  draw(shift(origin) * scale(1/15) * shift(-4.5) * (l1 ^^ l2 ^^ Pcoil));
}

struct Inductor {
  Obj obj;
  bool showAnchor = true;
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
      a = Anchor((-.5,0), DW);
      aL.push(a);
      a = Anchor((0.5,0),  DE);
      aL.push(a);
    }
    if (this.orient == 90) {
      a = Anchor((0.5,1), DN);
      aL.push(a);
      a = Anchor((0.5,0), DS);
      aL.push(a);
    }
    if (this.orient == -90) {
      a = Anchor((0.5,0), DS);
      aL.push(a);
      a = Anchor((0.5,1), DN);
      aL.push(a);
    }
    this.obj.a = aL;
  }

  void draw() {
    drawCoil(this.obj.pos);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.0,0.3));
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

Obj operator cast(Inductor inductor) {return inductor.obj;}

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