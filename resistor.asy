import obj;

struct Resistor {
  Obj obj;
  path p;

  void operator init(pair pos, string name) {
    obj.operator init(pos, 0, name);
    
    pair p1 = (0,.5);
    pair p2 = (.15,.5);
    pair p3 = (.2,.6);
    pair p4 = (.3,.4);
    pair p5 = (.4,.6);
    pair p6 = (.5,.4);
    pair p7 = (.6,.6);
    pair p8 = (.7,.4);
    pair p9 = (.8,.6);
    pair p10 = (.85,.5);
    pair p11 = (1,.5);

    this.p = p1 -- p2 -- p3 -- p4 -- p5 -- p6 -- p7 -- p8 -- p9 -- p10 -- p11;

    Anchor[] aL;
    Anchor a;
    a = Anchor((0,0.5), DW);
    aL.push(a);
    a = Anchor((1,0.5),  DE);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw() {
    draw (shift(this.obj.pos) * this.p);
    label(this.obj.name, this.obj.pos);
    for (int i = 0; i < this.obj.a.length; i += 1 ) {
      dot(obj.getAnchorPos(i));
    }
  }
}

Obj operator cast(Resistor resistor) {return resistor.obj;}