import obj;

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