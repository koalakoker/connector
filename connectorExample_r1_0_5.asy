settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(4cm);

import obj;
import drawOptions;
import anchor;
import connector;

Obj obj1 = Obj((0,0), 1, "$obj_1$");
Anchor a1 = Anchor((0.5,0), DE);
obj1.a.push(a1);
obj1.draw(DrawOption(showBounds = true));

Obj obj2 = Obj((2,-1), 1, "$obj_2$");
Anchor a2 = Anchor((-0.5,0), DW);
obj2.a.push(a2);
obj2.draw(DrawOption(showBounds = true));

drawAnchorConnector(obj1, 0, obj2, 0, r1 = 0.5);
