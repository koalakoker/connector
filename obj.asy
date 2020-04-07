import anchor;

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

  void draw() {
    real halfLen = this.len / 2;
    draw(box(this.pos - (halfLen, halfLen), this.pos + (halfLen, halfLen)));
    label(this.name, this.pos);
    for (int i = 0; i < this.a.length; i += 1 ) {
      dot(getAnchorPos(i));
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