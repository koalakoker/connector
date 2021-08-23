import obj;
import drawOptions;

void drawMOS(pair origin) {

  //defaultpen(2);

  draw(shift(origin) * ((0,0)--(0.25,0)));
  draw(shift(origin) * ((0.25,-0.1)--(0.25,0.1)));
  draw(shift(origin) * ((0.3,-0.2)--(0.3,0.2)));
  
  //defaultpen(1);
  
  draw(shift(origin) * ((0.3,0.1 )--(0.5, 0.1)--(0.5,0.5)));
  draw(shift(origin) * ((0.3,-0.1)--(0.5,-0.1)), arrow = Arrow(position = EndPoint) );
  draw(shift(origin) * ((0.5,-0.1)--(0.5,-0.5)));
  
}

struct Mos {
  Obj obj;
  int orient;

  void setOrient(int orient) {
    if (orient != 0) {
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
    a = Anchor((0, 0), DW);
    aL.push(a);
    a = Anchor((.5, .5),  DN);
    aL.push(a);
    a = Anchor((.5, -.5),  DS);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    obj.draw(drawOpt);
    drawMOS(this.obj.pos);
    label(this.obj.name, this.obj.pos + (0.2,0.3));
    
  }

  void setPos(pair pos) = obj.setPos;
  void setLabel(string name, pair namePos = (0,0)) = obj.setLabel;
}

Obj operator cast(Mos mos) {return mos.obj;}