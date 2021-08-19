import drawOptions;
import obj;

struct Node {
  Obj obj;
  
  void operator init(pair pos, string name = "", align align = NoAlign) {
    
    obj.operator init(pos, 0, name, align);
    
    Anchor[] aL;
    Anchor a;
    a = Anchor((0, 0), DN);
    aL.push(a);
    a = Anchor((0, 0), DS);
    aL.push(a);
    a = Anchor((0, 0), DE);
    aL.push(a);
    a = Anchor((0, 0), DW);
    aL.push(a);
    this.obj.a = aL;
  }

  void draw(pen p = currentpen, DrawOption drawOpt = null) {
    if (this.obj.name != "") {
      label(this.obj.name, this.obj.pos, align = this.obj.align);
    }
    dot(obj.pos, p);
    obj.draw(drawOpt);
  }
}

Obj operator cast(Node node) {return node.obj;}