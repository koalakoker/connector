import anchor;

struct Obj {
  pair pos;
  real len;
  Anchor[] a;
  string name;

  void operator init(pair pos, real len, string name) {
    this.pos = pos;
    this.len = len;
    this.name = name;
  }

  void addAnchorPoint(Anchor a) {
    this.a.push(a);
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