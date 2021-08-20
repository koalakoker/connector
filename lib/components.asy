import obj;
import drawOptions;

import node;
import fuse;
import inductor;
import capacitor;
import relay;
import relaySPDT;
import igbt;
import mos;
import diode;

pen smallDot = currentpen + 5;

// Draw
void drawGndP(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0,0) -- (0,-.2) ^^ (-.2, -.2) -- (.2, -.2) ^^ (-.13, -.27) -- (.13, -.27) ^^ (-.06,-.34) -- (.06,-.34)), p = p);}

void drawGndS(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0,0) -- (0,-.2) ^^ (-.2, -.2) -- (.2, -.2) -- (0, -.41) -- (-.2,-.2)), p = p);}

// Struct
struct GndPower {
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
    a = Anchor(rotate(orient) * (0,0),  rotateDir(DN, orient));
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawGndP(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.2,0));

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }}

struct GndSignal {
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
    a = Anchor(rotate(orient) * (0,0),  rotateDir(DN, orient));
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawGndS(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.2,0));

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }}
// Cast
Obj operator cast(GndPower gndPower) {return gndPower.obj;}
Obj operator cast(GndSignal gndSignal) {return gndSignal.obj;}