import obj;
import drawOptions;

struct Resistor {
  Obj obj;
  path p;
  int orient;

  void operator init(pair pos, string name, int orient = 0) {
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

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    obj.draw(drawOpt);
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
  }
}

Obj operator cast(Resistor resistor) {return resistor.obj;}