settings.outformat="pdf";
settings.prc = false; 
size(6cm);

import obj;
import resistor;
import connector;

/* Obj o = Obj((0,0), 1, "1");
Anchor a = Anchor((0,.5), DN);
o.addAnchorPoint(a);
Anchor b = Anchor((.5,0), DE);
o.addAnchorPoint(b);

o.draw(); */

Resistor r = Resistor((0,0), "R1");
r.draw();
Resistor r2 = Resistor((1.5,0), "R2");
r2.draw();
Resistor r3 = Resistor((3,0), "R3");
r3.draw();

drawAncorConnector(r, 1, r2, 0);
drawAncorConnector(r2, 1, r3, 0);
drawAncorConnector(r3, 1, r, 0);
