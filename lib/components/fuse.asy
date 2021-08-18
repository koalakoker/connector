import obj;
import drawOptions;

void drawFuse (pair origin, real orient = 0, pen p = currentpen) {
  real r = 0.1;
  path a1 = arc((r+.3,0), r, 180, 360 );
  path a2 = arc((r+.5,0), r, 180, 0   );
  path l1 = ((0 ,0) -- (.3,0));
  path l2 = ((.7,0) -- (1 ,0));
  draw(shift(origin) * rotate(orient) * (l1 ^^ a1 ^^ a2 ^^ l2), p = p);
}

struct Fuse {
  Obj obj;
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
    drawFuse(this.obj.pos, this.orient, p = currentpen);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.5,0.2));
    }
    if (this.orient == 90) {
      label(this.obj.name, this.obj.pos + (0.2,0.5));
    }
    if (this.orient == -90) {
      label(this.obj.name, this.obj.pos + (0.2,-0.5));
    }
  }
}

Obj operator cast(Fuse fuse) {return fuse.obj;}