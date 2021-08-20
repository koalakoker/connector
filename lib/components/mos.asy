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

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    obj.draw(drawOpt);
    drawMOS(this.obj.pos);
    label(this.obj.name, this.obj.pos + (0.2,0.3));
    
  }
}

Obj operator cast(Mos mos) {return mos.obj;}