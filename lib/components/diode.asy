import obj;
import drawOptions;

void drawDiode(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0, 0)--(1, 0)));
  fill(shift(origin) * rotate(orient) * ((.4, -.1)--(.4, .1)--(.6, 0)--cycle));
  draw(shift(origin) * rotate(orient) * ((.6, -.1)--(.6, .1)));
}

struct Diode {
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
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    drawDiode(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.5,0.2));

    obj.draw(drawOpt);
  }
}

Obj operator cast(Diode diode) {return diode.obj;}