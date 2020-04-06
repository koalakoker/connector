import obj;

void drawIGBT(pair origin, bool drawAncorPoints = false) {

    defaultpen(2);

    draw(shift(origin) * ((0,0)--(0.25,0)));
    draw(shift(origin) * ((0.25,-0.1)--(0.25,0.1)));
    draw(shift(origin) * ((0.3,-0.2)--(0.3,0.2)));
    draw(shift(origin) * ((0.3,0.1 )--(0.5, 0.3)--(0.5,0.5)));
    draw(shift(origin) * ((0.3,-0.1)--(0.5,-0.3)--(0.5,-0.5)), arrow = Arrow(position = MidPoint) );
    draw(shift(origin) * ((0.5,-0.4)--(0.7,-0.4)--(0.7,0.4)--(0.5,0.4)));

    fill(shift(origin) * ((.6,-.1)--(.8,-.1)--(0.7,0.1)--cycle));
    draw(shift(origin) * ((.6,.1)--(.8,.1)));

    dot(shift(origin) * ((.5,.4) ^^ (.5,-.4)), p = black + 5.0);

    if (drawAncorPoints) {
        dot(shift(origin) * (0,0), p = black + 5.0);
        dot(shift(origin) * (.5,.5), p = black + 5.0);
        dot(shift(origin) * (.5,-.5), p = black + 5.0);
    }

    defaultpen(1);
}

struct Igbt {
  Obj obj;
  bool showAnchor = false;
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

  void draw() {
    drawIGBT(this.obj.pos);
    
    if (this.orient == 0) {
      label(this.obj.name, this.obj.pos + (0.2,0.3));
    } else {
      label(this.obj.name, this.obj.pos + (0.8,0.5));
    }
    
    if (this.showAnchor) {
      for (int i = 0; i < this.obj.a.length; i += 1 ) {
        dot(obj.getAnchorPos(i));
      }
    }
  }
}

Obj operator cast(Igbt igbt) {return igbt.obj;}