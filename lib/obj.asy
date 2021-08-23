import anchor;
import drawOptions;

struct Obj {
  pair pos;
  real len;
  Anchor[] a;
  string name;
  align align;

  void operator init(pair pos, real len, string name, align align = NoAlign) {
    this.pos = pos;
    this.len = len;
    this.name = name;
    this.align = align;
  }

  int addAnchorPoint(Anchor a) {
    this.a.push(a);
    return this.a.length - 1;
  }

  pair getAnchorPos(int i) {
    return this.pos + this.a[i].pos;
  }

  void drawAnchorPos(int i, DrawOption drawOpt) {
    int dir = this.a[i].dir;
    pair anchorPosBegin = getAnchorPos(i);
    pair anchorPosEnd   = anchorPosBegin + EndPointDelta[dir];
    draw(anchorPosBegin--anchorPosEnd, p = green);
    dot(anchorPosBegin);
    if (drawOpt.showAnchorLabel) {
      label((string)i, anchorPosEnd, LabelAlign[dir]);
    }
  }

  void drawPointAndLabel(pair pos, string label, align align) {
    label(pos, label, align = align );
    real crossLenght = 0.04;
    draw((pos + (crossLenght, crossLenght))--(pos + (-crossLenght,-crossLenght)), p = red);
    draw((pos + (crossLenght,-crossLenght))--(pos + (-crossLenght, crossLenght)), p = red);
  }

  void draw(DrawOption drawOpt = null) {
    if (drawOpt != null) {

      if (drawOpt.showBounds) {
        real halfLen = this.len / 2;
        draw(box(this.pos - (halfLen, halfLen), this.pos + (halfLen, halfLen)));
        label(this.name, this.pos);
      }

      if (drawOpt.showAnchor) {
        for (int i = 0; i < a.length; i += 1 ) {
          drawAnchorPos(i, drawOpt);
        }
      }

      if (drawOpt.showOrigin) {
        drawPointAndLabel((0,0), "$(0,0)$", align = drawOpt.originAlign);
        drawPointAndLabel((1,0), "$(1,0)$", align = drawOpt.originAlign);
      }
    }
  }
}

pair GetAnchorPos(Obj o, int i) {
  return o.getAnchorPos(i);
}

int AddAnchorPoint(Obj o, pair pos, int dir) {
  Anchor a = Anchor(pos - o.pos, dir);
  return o.addAnchorPoint(a);
}