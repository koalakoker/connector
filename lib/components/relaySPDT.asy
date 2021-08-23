import obj;
import drawOptions;

void drawRelaySPDT(pair origin, real orient = 0, pen p = currentpen) {
  real r = 0.1;
  path a1 = arc((r + .1, 0), r, 180, 0 );
  path a2 = arc((r + .3, 0), r, 180, 0 );
  path a3 = arc((r + .5, 0), r, 180, 0 );
  path a4 = arc((r + .7, 0), r, 180, 0 );
  path l1 = ((0, 0) -- (.1, 0));
  path l2 = ((.9,0) -- ( 1, 0));
  draw(shift(origin) * rotate(orient) * (l1 ^^ a1 ^^ a2 ^^ a3 ^^ a4 ^^ l2), p = p);
  path p1 = (0  ,.4) -- (.35, .4);
  path p4 = (0  ,.6) -- (.35, .6);
  path p2 = (.65,.5) -- (1,   .5);
  path p3 = (.35, .4) -- (.65,.5);
  draw(shift(origin) * rotate(orient) * (p1 ^^ p2 ^^ p3 ^^ p4), p = p);
  dot (shift(origin) * rotate(orient) * ((.35, .4) ^^ (.65,.5) ^^ (.35, .6)), p = p);
  path centerBox = box((.1,.19) , (.9,.21));
  fill(shift(origin) * rotate(orient) * centerBox, p = p);
  
  // Track rect
  draw(shift(origin) * rotate(orient) * box((-.1,-.1),(1.1,.7)), p = Dotted(p));

}

struct RelaySPDT {
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
    a = Anchor(rotate(orient) * (0,0),  rotateDir(DW, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (1,0),  rotateDir(DE, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (0,.4), rotateDir(DW, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (1,.5), rotateDir(DE, orient));
    aL.push(a);
    a = Anchor(rotate(orient) * (0,.6), rotateDir(DW, orient));
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    drawRelaySPDT(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.7,0.8));

    obj.draw(drawOpt);
  }

  void setPos(pair pos) = obj.setPos;
  void setLabel(string name, pair namePos = (0,0)) = obj.setLabel;
}

Obj operator cast(RelaySPDT relay) {return relay.obj;}