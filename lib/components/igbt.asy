import obj;
import drawOptions;

void drawIGBT (pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * ((0,0)--(0.25,0)), p = p);
  draw(shift(origin) * ((0.25,-0.1)--(0.25,0.1)), p = p);
  draw(shift(origin) * ((0.3,-0.2)--(0.3,0.2)), p = p);
  draw(shift(origin) * ((0.3,0.1 )--(0.5, 0.3)--(0.5,0.5)), p = p);
  draw(shift(origin) * ((0.3,-0.1)--(0.5,-0.3)--(0.5,-0.5)), arrow = Arrow(position = MidPoint) , p = p);
}

struct Igbt {
  Obj obj;
  bool showAnchor = false;
  int orient;

  void setOrient(int orient) {
    if (orient != 0) {
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
    a = Anchor((0, 0), DW);
    aL.push(a);
    a = Anchor((.5, .5),  DN);
    aL.push(a);
    a = Anchor((.5, -.5),  DS);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(DrawOption drawOpt = null) {
    drawIGBT(this.obj.pos);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.2,0.3));
    } else {
      label(this.obj.name, this.obj.pos + (0.8,0.5));
    }

    obj.draw(drawOpt);

  }

  void setPos(pair pos) = obj.setPos;
  void setLabel(string name, pair namePos = (0,0)) = obj.setLabel;
}

Obj operator cast(Igbt igbt) {return igbt.obj;}