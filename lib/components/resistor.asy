import obj;
import drawOptions;

struct Resistor {
  Obj obj;
  path p;
  int orient;

  void setOrient(int orient) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + this.obj.name + ". Forced to 0");
    } else {
      this.orient = orient;
    }
  }

  void operator init(pair pos = (0,0), string name = "", int orient = 0) {

    obj.operator init(pos, 0, name);
    setOrient(orient);
    
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
      label(this.obj.name, this.obj.pos + (0.5,0.2) + this.obj.namePos);
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2, 0.5) + this.obj.namePos);
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2, -0.5) + this.obj.namePos);
    }
  }

  void setPos(pair pos) = obj.setPos;
  void setLabel(string name, pair namePos = (0,0)) = obj.setLabel;
}

Obj operator cast(Resistor resistor) {return resistor.obj;}