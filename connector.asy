import obj;

// Opposite direction Ex. Dir1 E - Dir2 W
path drawHAncorConnectorOppositeDir(Obj o1, int i1, Obj o2, int i2, real rh1 = 0.5, real rh2 = 0.5, real rv = 0.5) {
  path p;
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);

  pair e,w;
  real d1, d2;
  if (o1.a[i1].dir == DE) {
    e = p1;
    w = p2;
    d1 = rh1;
    d2 = -rh2;
  } else {
    e = p2;
    w = p1;
    d1 = -rh1;
    d2 = rh2;
  }

  if (e.x < w.x) {
    // 3 Linees <- To be fixed with abs
    real h = d1 + p1.x;
    pair p3 = (h, p1.y);
    pair p4 = (h, p2.y);
    p = (p1 -- p3 -- p4 -- p2);
  } else {
    // 5 Linees <- To be fixed with abs
    real h1 = d1 + p1.x;
    real h2 = d2 + p2.x;
    real v  = rv + p1.y;
    pair p3 = (h1, p1.y);
    pair p4 = (h1, v);
    pair p5 = (h2, v);
    pair p6 = (h2, p2.y);
    p = (p1 -- p3 -- p4 -- p5 -- p6 -- p2);
  }
  return p;
}

// Opposite direction Ex. Dir1 N - Dir2 S
path drawVAncorConnectorOppositeDir(Obj o1, int i1, Obj o2, int i2, real rv1 = 0.5, real rv2 = 0.5, real rh = 0.5) {
  path p;
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  
  pair s, n;
  real d1, d2;
  if (o1.a[i1].dir == DN) {
    n = p1;
    s = p2;
    d1 = rv1;
    d2 = -rv2;
  } else {
    n = p2;
    s = p1;
    d1 = -rv1;
    d2 = rv2;
  }
  
  if (n.y < s.y) {
    // 3 Linees <- To be fixed with abs
    real v = d1 + p1.y;
    pair p3 = (p1.x, v);
    pair p4 = (p2.x, v);
    p = (p1 -- p3 -- p4 -- p2);
  } else {
    // 5 Linees <- To be fixed with abs
    real v1 = d1 + p1.y;
    real v2 = d2 + p2.y;
    real h  = rh + p1.x;
    pair p3 = (p1.x, v1);
    pair p4 = (h, v1);
    pair p5 = (h, v2);
    pair p6 = (p2.x, v2);
    p = (p1 -- p3 -- p4 -- p5 -- p6 -- p2);
  }
  return p;
}

// Opposite orient Ex. Dir1 E - Dir2 N 
path drawAnchorConnectorH(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  real v;
  if (o1.a[i1].dir == DE) {
    v = p1.x + r1;
  } else {
    v = p1.x - r1;
  }
  real h;
  if (o2.a[i2].dir == DN) {
    h = p2.y + r2;
  } else {
    h = p2.y - r2;
  }
  pair p3 = (v, p1.y);
  pair p4 = (v, h);
  pair p5 = (p2.x, h);
  return (p1 -- p3 -- p4 -- p5 -- p2);
}

// Opposite orient Ex. Dir1 N - Dir2 E 
path drawAnchorConnectorV(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  real v;
  if (o2.a[i2].dir == DE) {
    v = p2.x + r1;
  } else {
    v = p2.x - r1;
  }
  
  real h;
  if (o1.a[i1].dir == DN) {
    h = p1.y + r1;
  } else {
    h = p1.y - r1;
  }

  pair p3 = (p1.x, h);
  pair p4 = (v, h);
  pair p5 = (v, p2.y);
  return (p1 -- p3 -- p4 -- p5 -- p2);
}

path drawAnchorConnector2L(Obj o1, int i1, Obj o2, int i2) {
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  pair z;
  
  if (getOrientation(o1.a[i1].dir) == DH) {
    z = (p2.x , p1.y);
  } else {
    z = (p1.x , p2.y);
  }
  
  return (p1 -- z -- p2);
}

path drawAnchorConnectorSameDir(Obj o1, int i1, Obj o2, int i2, real r1 = 0.5, real r2 = 0.5, real r3 = 0.5) {
  //////////////////////////
  //    Same direction    //
  //////////////////////////
  path p;
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);
  int orientation = getOrientation(o1.a[i1].dir);
  real d = r1;
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
    p = (p1--p3--p4--p2);
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
    p = (p1--p3--p4--p2);
  }
  return p;
}

void drawAnchorConnector(Obj o1, int i1, Obj o2, int i2, 
                         real r1 = 0.5, real r2 = 0.5, real r3 = 0.5,
                         arrowbar arrow = None, pen pen = currentpen,
                         bool drawNode1 = false, bool drawNode2 = false
                         ) {
  path p;
  pair p1 = o1.getAnchorPos(i1);
  pair p2 = o2.getAnchorPos(i2);

  if (drawNode1) {
    dot(p1, p = pen + 5.0);
  }
  if (drawNode2) {
    dot(p2, p = pen + 5.0);
  }

  if (sameOrientation(o1.a[i1].dir, o2.a[i2].dir)) {
    int orientation = getOrientation(o1.a[i1].dir);
    if (sameDirection(o1.a[i1].dir, o2.a[i2].dir)) {
      //////////////////////////
      //    Same direction    //
      //////////////////////////
      p = drawAnchorConnectorSameDir(o1, i1, o2, i2, r1, r2, r3);      
    } else {
      //////////////////////////
      //  Opposite direction  //
      //////////////////////////
      if (orientation == DH) {
        p = drawHAncorConnectorOppositeDir(o1, i1, o2, i2, r1, r2, r3);
      } else {
        p = drawVAncorConnectorOppositeDir(o1, i1, o2, i2, r1, r2, r3);
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
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          p = drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DS) {
        if ((p2.x > p1.x) && (p2.y > p1.y)) {
          // 2Lines
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          p = drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
    }

    if (o1.a[i1].dir == DW) {
      if (o2.a[i2].dir == DN) {
        if ((p2.x < p1.x) && (p2.y < p1.y)) {
          // 2Lines
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          p = drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DS) {
        if ((p2.x < p1.x) && (p2.y > p1.y)) {
          // 2Lines
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          p = drawAnchorConnectorH(o1,i1,o2,i2);
        }
      }
    }
    
    if (o1.a[i1].dir == DN) {
      if (o2.a[i2].dir == DE) {
        if ((p2.x < p1.x) && (p2.y > p1.y )) {
          // 2Linees
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          p = drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DW) {
        if ((p2.x > p1.x) && (p2.y > p1.y)) {
          // 2Linees
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          p = drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
    }

    if (o1.a[i1].dir == DS) {
      if (o2.a[i2].dir == DE) {
        if ((p2.x < p1.x) && (p2.y < p1.y )) {
          // 2Linees
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          p = drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
      if (o2.a[i2].dir == DW) {
        if ((p2.x > p1.x) && (p2.y < p1.y)) {
          // 2Linees
          p = drawAnchorConnector2L(o1,i1,o2,i2);
        } else {
          // 4Linees
          p = drawAnchorConnectorV(o1,i1,o2,i2);
        }
      }
    }
  }
  draw(p, arrow = arrow, p = pen);
}