import obj;
import drawOptions;

void drawCoil (pair origin, real orient = 0, pen p = currentpen) {
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

  void setOrient(int orient) {
    if ((orient != 0) && (orient != 90) && (orient != -90)) {
      this.orient = 0;
      write ("Wrong orient in " + this.obj.name + ". Forced to 0");
    } else {
      this.orient = orient;
    }
  }

  void operator init(pair pos = (0,0), int orient = 0, string name = "") {
    
    obj.operator init(pos, 0, name);
    setOrient(orient);
    
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
    drawCoil(this.obj.pos, this.orient, p = currentpen);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.3,0.5));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.3,-0.5));
    }
  }

  void setPos(pair pos) = obj.setPos;
  void setLabel(string name, pair namePos = (0,0)) = obj.setLabel;
}

Obj operator cast(Inductor inductor) {return inductor.obj;}