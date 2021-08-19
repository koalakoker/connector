import obj;
import drawOptions;

void drawRelay(pair origin, real orient = 0, pen p = currentpen, real status = 0) {
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
  
  path p3;
  if (status == 0) {
    p3 = rotate(-30, (.65,.4)) * ((.35, .4) -- (.65,.4));
  } else {
    p3 = shift((0,0.1)) * ((.35, .4) -- (.65,.4));
  }
  
  draw(shift(origin) * rotate(orient) * (p1 ^^ p2 ^^ p3), p = p);
  dot (shift(origin) * rotate(orient) * ((.35, .4) ^^ (.65,.4)), p = p);
  path centerBox = box((.1,.19) , (.9,.21));
  fill(shift(origin) * rotate(orient) * centerBox, p = p);
  
  // Track rect
  draw(shift(origin) * rotate(orient) * box((-.1,-.1),(1.1,.6)), p = Dotted(p));
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

  void draw(pen p = currentpen, real status = 0, DrawOption drawOpt = null) {
    obj.draw(drawOpt);

    // Status 0 = Open, 1 = Closed
    drawRelay(this.obj.pos, this.orient, p = currentpen, status);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.7,0.8));
  }
}

Obj operator cast(Relay relay) {return relay.obj;}