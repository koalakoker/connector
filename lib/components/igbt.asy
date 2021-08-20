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

  void draw(DrawOption drawOpt = null) {
    drawIGBT(this.obj.pos);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.2,0.3));
    } else {
      label(this.obj.name, this.obj.pos + (0.8,0.5));
    }

    obj.draw(drawOpt);

  }
}

Obj operator cast(Igbt igbt) {return igbt.obj;}