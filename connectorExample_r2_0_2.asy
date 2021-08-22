settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(4cm);

import obj;
import drawOptions;
import anchor;
import connector;

Obj obj1 = Obj((0,0), 1, "$o_1$");
Anchor a1 = Anchor((0.0,0.5), DN);
obj1.a.push(a1);
obj1.draw(DrawOption(showBounds = true));

Obj obj2 = Obj((-3,-2), 1, "$o_2$");
Anchor a2 = Anchor((0.0,-0.5), DS);
obj2.a.push(a2);
obj2.draw(DrawOption(showBounds = true));

drawAnchorConnector(obj1, 0, obj2, 0, r2 = 0.2, r3 = 1);
