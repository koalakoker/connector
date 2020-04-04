struct parent {
  real x;
  void operator init(int x) {this.x=x;}
  void virtual(int) {write(0);}
  void f() {virtual(1);}
}

void write(parent p) {write(p.x);}
  
struct child {
  parent parent;
  real y=3;
  void operator init(int x) {parent.operator init(x);}
  void virtual(int x) {write(x);}
  parent.virtual=virtual;
  void f()=parent.f;
}

parent operator cast(child child) {return child.parent;}
  
parent p=parent(1);
child c=child(2);

write(c);                       // Outputs 2;

p.f();                          // Outputs 0;
c.f();                          // Outputs 1;

write(c.parent.x);              // Outputs 2;
write(c.y);                     // Outputs 3;