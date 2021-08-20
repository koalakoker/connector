import obj;
import drawOptions;

import node;
import fuse;
import inductor;
import capacitor;
import relay;
import relaySPDT;
import igbt;

pen smallDot = currentpen + 5;

// Draw
void drawMOS(pair origin, bool drawAncorPoints = false) {

    defaultpen(2);

    draw(shift(origin) * ((0,0)--(0.25,0)));
    draw(shift(origin) * ((0.25,-0.1)--(0.25,0.1)));
    draw(shift(origin) * ((0.3,-0.2)--(0.3,0.2)));
    
    draw(shift(origin) * ((0.3,0.1 )--(0.5, 0.1)--(0.5,0.5)));
    draw(shift(origin) * ((0.3,-0.1)--(0.5,-0.1)), arrow = Arrow(position = EndPoint) );
    draw(shift(origin) * ((0.5,-0.1)--(0.5,-0.5)));
    
    if (drawAncorPoints) {
        dot(shift(origin) * (0,0), p = black + 5.0);
        dot(shift(origin) * (.5,.5), p = black + 5.0);
        dot(shift(origin) * (.5,-.5), p = black + 5.0);
    }

    defaultpen(1);}

void drawDiode(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0, 0)--(1, 0)));
  fill(shift(origin) * rotate(orient) * ((.4, -.1)--(.4, .1)--(.6, 0)--cycle));
  draw(shift(origin) * rotate(orient) * ((.6, -.1)--(.6, .1)));}

void drawGndP(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0,0) -- (0,-.2) ^^ (-.2, -.2) -- (.2, -.2) ^^ (-.13, -.27) -- (.13, -.27) ^^ (-.06,-.34) -- (.06,-.34)), p = p);}

void drawGndS(pair origin, real orient = 0, pen p = currentpen) {
  draw(shift(origin) * rotate(orient) * ((0,0) -- (0,-.2) ^^ (-.2, -.2) -- (.2, -.2) -- (0, -.41) -- (-.2,-.2)), p = p);}

// Struct
struct Mos {
  Obj obj;
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

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawMOS(this.obj.pos);
    label(this.obj.name, this.obj.pos + (0.2,0.3));
    
    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }}

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

  void draw(pen p = currentpen, bool showAnchor = false) {
    drawDiode(this.obj.pos, this.orient, p = currentpen);
    
    label(this.obj.name, this.obj.pos + rotate(this.orient) * (0.5,0.2));

    if (showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }}

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
Obj operator cast(Diode diode) {return diode.obj;}
Obj operator cast(Mos mos) {return mos.obj;}
Obj operator cast(GndPower gndPower) {return gndPower.obj;}
Obj operator cast(GndSignal gndSignal) {return gndSignal.obj;}