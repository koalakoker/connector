import obj;

struct Resistor {
  Obj obj;
  path p;
  bool showAnchor = false;
  int orient;

  void operator init(pair pos, int orient = 0, string name) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in R:" + name + ". Forced to 0");
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