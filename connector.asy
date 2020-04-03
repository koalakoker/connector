settings.outformat="pdf";
settings.prc = false; 
size(6cm);

int DN = 1;
int DS = 2;
int DE = 3;
int DW = 4;
int DH = 10;
int DV = 11;

int getOrientation(int dir) {
  int retVal = 0;
  if ((dir == DN) || (dir == DS)) {
    retVal = DV;
  }
  if ((dir == DE) || (dir == DW)) {
    retVal = DH;
  }
  return retVal;
}

bool sameOrientation(int dir1, int dir2) {
  bool retVal = false;
  if (getOrientation(dir1) == getOrientation(dir2)) {
    retVal = true;
  }
  return retVal;
}

bool sameDirection(int dir1, int dir2) {
  bool retVal = false;
  if (dir1 == dir2) {
    retVal = true;
  }
  return retVal;
}

struct Anchor {
  pair pos;
  int dir;

  static Anchor Anchor(pair pos, int dir) {
    Anchor a = new Anchor;
    a.pos = pos;
    a.dir = dir;
    return a;
  }
}

from Anchor unravel Anchor;

struct Obj {
  pair pos;
  real len;
  Anchor[] a;
  string name;

  static Obj Obj(pair pos, real len, string name) {
    Obj o = new Obj;
    o.pos = pos;
    o.len = len;
    o.name = name;
    return o;
  }

  pair getAnchorPos(int i) {
    return this.pos + this.a[i].pos;
  }

  void draw() {
    real halfLen = this.len / 2;
    draw(box(this.pos - (halfLen, halfLen), this.pos + (halfLen, halfLen)));
    label(this.name, this.pos);
    for (int i = 0; i < this.a.length; i += 1 ) {
      dot(getAnchorPos(i));
    }
  }
}

from Obj unravel Obj;

// Opposite direction Ex. Dir1 E - Dir2 W
void drawHAncorConnectorOppositeDir(Obj o1, int i1, Obj o2, int i2, real rh1 = 0.5, real rh2 = 0.5, real rv = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);

  pair e,w;
  if (o1.a[i1].dir == DE) {
    e = p1;
    w = p2;
  } else {
    e = p2;
    w = p1;
  }

  if (e.x < w.x) {
    // 3 Linees
    real h = ((p2.x - p1.x) * rh1) + p1.x;
    pair p3 = (h, p1.y);
    pair p4 = (h, p2.y);
    draw(p1 -- p3 -- p4 -- p2, arrow = ArcArrow());
  } else {
    // 5 Linees
    real h1 = ((p1.x - p2.x) * rh1 ) + p1.x;
    real h2 = p2.x - ((p1.x - p2.x) * rh2 );
    real v  = ((p2.y - p1.y) * rv) + p1.y;
    pair p3 = (h1, p1.y);
    pair p4 = (h1, v);
    pair p5 = (h2, v);
    pair p6 = (h2, p2.y);
    draw(p1 -- p3 -- p4 -- p5 -- p6 -- p2, arrow = ArcArrow());
  }
}

// Opposite direction Ex. Dir1 N - Dir2 S
void drawVAncorConnectorOppositeDir(Obj o1, int i1, Obj o2, int i2, real rv1 = 0.5, real rv2 = 0.5, real rh = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  
  pair s,n;
  if (o1.a[i1].dir == DN) {
    n = p1;
    s = p2;
  } else {
    n = p2;
    s = p1;
  }
  
  if (n.y < s.y) {
    // 3 Linees
    real v = ((p2.y - p1.y) * rv1) + p1.y;
    pair p3 = (p1.x, v);
    pair p4 = (p2.x, v);
    draw(p1 -- p3 -- p4 -- p2, arrow = ArcArrow());
  } else {
    // 5 Linees
    real v1 = ((p1.y - p2.y) * rv1 ) + p1.y;
    real v2 = p2.y - ((p1.y - p2.y) * rv2 );
    real h  = ((p2.x - p1.x) * rh) + p1.x;
    pair p3 = (p1.x, v1);
    pair p4 = (h, v1);
    pair p5 = (h, v2);
    pair p6 = (p2.x, v2);
    draw(p1 -- p3 -- p4 -- p5 -- p6 -- p2, arrow = ArcArrow());
  }
}

// Opposite orient Ex. Dir1 E - Dir2 N 
void drawAnchorConnectorH(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  real v;
  if (o1.a[i1].dir == DE) {
    v = p1.x + r1 * abs(p2.x - p1.x);
  } else {
    v = p1.x - r1 * abs(p2.x - p1.x);
  }
  real h;
  if (o2.a[i2].dir == DN) {
    h = p2.y + r2 * abs(p2.y - p1.y);
  } else {
    h = p2.y - r2 * abs(p2.y - p1.y);
  }
  pair p3 = (v, p1.y);
  pair p4 = (v, h);
  pair p5 = (p2.x, h);
  draw(p1 -- p3 -- p4 -- p5 -- p2, arrow = ArcArrow());
}

// Opposite orient Ex. Dir1 N - Dir2 E 
void drawAnchorConnectorV(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  real v;
  if (o2.a[i2].dir == DE) {
    v = p2.x + r1 * abs(p2.x - p1.x);
  } else {
    v = p2.x - r1 * abs(p2.x - p1.x);
  }
  
  real h;
  if (o1.a[i1].dir == DN) {
    h = p1.y + r1 * abs(p2.y - p1.y);
  } else {
    h = p1.y - r1 * abs(p2.y - p1.y);
  }

  pair p3 = (p1.x, h);
  pair p4 = (v, h);
  pair p5 = (v, p2.y);
  draw(p1 -- p3 -- p4 -- p5 -- p2, arrow = ArcArrow());
}

void drawAnchorConnector2L(Obj o1, int i1, Obj o2, int i2) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  pair z;
  
  if (getOrientation(o1.a[i1].dir) == DH) {
    z = (p2.x , p1.y);
  } else {
    z = (p1.x , p2.y);
  }
  
  draw(p1 -- z -- p2, arrow = ArcArrow());
}

void drawAncorConnector(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5, real r3 = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  if (sameOrientation(o1.a[i1].dir, o2.a[i2].dir)) {
    int orientation = getOrientation(o1.a[i1].dir);
    if (sameDirection(o1.a[i1].dir, o2.a[i2].dir)) {
      //////////////////////////
      //    Same direction    //
      //////////////////////////
      real d = r1 * abs(p1.x - p2.x);
      if (orientation == DH) {
        real v;
        if (o1.a[i1].dir == DW) {
          if (p1.x < p2.x) {
            v = p1.x - d;
          } else {
            v = p2.x - d;
          }
        }
        if (o1.a[i1].dir == DE) {
          if (p1.x > p2.x) {
            v = p1.x + d;
          } else {
            v = p2.x + d;
          }
        }
        pair p3 = (v, p1.y);
        pair p4 = (v, p2.y);
        draw(p1--p3--p4--p2, arrow = ArcArrow());
      }
      else {
        real h;
        if (o1.a[i1].dir == DN) {
          if (p1.y > p2.y) {
            h = p1.y + d;
          } else {
            h = p2.y + d;
          }
        }
        if (o1.a[i1].dir == DS) {
          if (p1.y < p2.y) {
            h = p1.y - d;
          } else {
            h = p2.y - d;
          }
        }
        pair p3 = (p1.x, h);
        pair p4 = (p2.x, h);
        draw(p1--p3--p4--p2, arrow = ArcArrow());
      }
      
    } else {
      //////////////////////////
      //  Opposite direction  //
      //////////////////////////
      if (orientation == DH) {
        drawHAncorConnectorOppositeDir(o1, i1, o2, i2, r1, r2, r3);
      } else {
        drawVAncorConnectorOppositeDir(o1, i1, o2, i2, r1, r2, r3);
      }
    }
  } else {
    
    ///////////////////////////
    // Different orientation //
    ///////////////////////////

    if (o1.a[i1].dir == DE) {
      if (o2.a[i2].dir == DN) {
        if ((p2.x > p1.x) && (p2.y < p1.y)) {
          // 2Lines
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DS) {
        if ((p2.x > p1.x) && (p2.y > p1.y)) {
          // 2Lines
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
    }

    if (o1.a[i1].dir == DW) {
      if (o2.a[i2].dir == DN) {
        if ((p2.x < p1.x) && (p2.y < p1.y)) {
          // 2Lines
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DS) {
        if ((p2.x < p1.x) && (p2.y > p1.y)) {
          // 2Lines
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
    }
    
    if (o1.a[i1].dir == DN) {
      if (o2.a[i2].dir == DE) {
        if ((p2.x < p1.x) && (p2.y > p1.y )) {
          // 2Linees
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DW) {
        if ((p2.x > p1.x) && (p2.y > p1.y)) {
          // 2Linees
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
    }

    if (o1.a[i1].dir == DS) {
      if (o2.a[i2].dir == DE) {
        if ((p2.x < p1.x) && (p2.y < p1.y )) {
          // 2Linees
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DW) {
        if ((p2.x > p1.x) && (p2.y < p1.y)) {
          // 2Linees
          drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
    }
    
  } 
}

Anchor[] alist;
Obj[] oList;
// Init
{
  Anchor a;

  pair[] aPos = {(0,.5), (0,-.5), (.5,0), (-.5,0)};
  int[]  aDir = {DN,     DS,      DE,     DW};

  for (int i = 0; i < aDir.length; i += 1) {
    a = Anchor(aPos[i], aDir[i]);
    alist.push(a);
  }

  Obj o;

  pair[]   oPos  = {(0,0), (2,2), (2,-2), (-2,-2), (-2,2)};
  string[] oName = {"o0" , "o1",  "o2",   "o3",    "o4"};

  for (int i = 0; i < oName.length; i += 1) {
    o = Obj(oPos[i], 1, oName[i]);
    o.a = alist;
    oList.push(o);
  }
}

// Test with different orientation
void testW_NS() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DS-1);
  shipout("0W-1S");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DN-1);
  shipout("0W-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DS-1);
  shipout("0W-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DN-1);
  shipout("0W-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DS-1);
  shipout("0W-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DN-1);
  shipout("0W-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DS-1);
  shipout("0W-4S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DN-1);
  shipout("0W-4N");
  erase();}

void testE_NS() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DS-1);
  shipout("0E-1S");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DN-1);
  shipout("0E-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DS-1);
  shipout("0E-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DN-1);
  shipout("0E-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DS-1);
  shipout("0E-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DN-1);
  shipout("0E-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DS-1);
  shipout("0E-4S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DN-1);
  shipout("0E-4N");
  erase();}

void testN_EW() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DE-1);
  shipout("0N-1E");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DW-1);
  shipout("0N-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DE-1);
  shipout("0N-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DW-1);
  shipout("0N-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DE-1);
  shipout("0N-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DW-1);
  shipout("0N-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DE-1);
  shipout("0N-4E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DW-1);
  shipout("0N-4W");
  erase();}

void testS_EW() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DE-1);
  shipout("0S-1E");
  erase();
    
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DW-1);
  shipout("0S-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DE-1);
  shipout("0S-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DW-1);
  shipout("0S-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DE-1);
  shipout("0S-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DW-1);
  shipout("0S-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DE-1);
  shipout("0S-4E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DW-1);
  shipout("0S-4W");
  erase();}

// Test with same direction
void testW_W() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DW-1);
  shipout("0W-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DW-1);
  shipout("0W-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DW-1);
  shipout("0W-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DW-1);
  shipout("0W-4W");
  erase();}
void testE_E() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DE-1);
  shipout("0E-1E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DE-1);
  shipout("0E-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DE-1);
  shipout("0E-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DE-1);
  shipout("0E-4E");
  erase();}
void testN_N() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DN-1);
  shipout("0N-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DN-1);
  shipout("0N-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DN-1);
  shipout("0N-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DN-1);
  shipout("0N-4N");
  erase();}
void testS_S() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DS-1);
  shipout("0S-1S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DS-1);
  shipout("0S-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DS-1);
  shipout("0S-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DS-1);
  shipout("0S-4S");
  erase();}

// Test with oposite direction
void testW_E() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[1], DE-1);
  shipout("0W-1E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[2], DE-1);
  shipout("0W-2E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[3], DE-1);
  shipout("0W-3E");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DW-1, oList[4], DE-1);
  shipout("0W-4E");
  erase();}

void testE_W() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[1], DW-1);
  shipout("0E-1W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[2], DW-1);
  shipout("0E-2W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[3], DW-1);
  shipout("0E-3W");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DE-1, oList[4], DW-1);
  shipout("0E-4W");
  erase();}

void testN_S() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[1], DS-1);
  shipout("0N-1S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[2], DS-1);
  shipout("0N-2S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[3], DS-1);
  shipout("0N-3S");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DN-1, oList[4], DS-1);
  shipout("0N-4S");
  erase();}

void testS_N() {
  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[1], DN-1);
  shipout("0S-1N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[2], DN-1);
  shipout("0S-2N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[3], DN-1);
  shipout("0S-3N");
  erase();

  for (Obj o: oList) {o.draw();}
  drawAncorConnector(oList[0], DS-1, oList[4], DN-1);
  shipout("0S-4N");
  erase();}

testN_N();
testS_S();
testE_E();
testW_W();
testW_E();
testE_W();
testN_S();
testS_N();
testW_NS();
testE_NS();
testN_EW();
testS_EW();