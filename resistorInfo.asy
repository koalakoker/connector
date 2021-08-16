settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(4cm);

import obj;
import connector;
import drawOptions;
include "./components/resistor.asy";

Resistor r = Resistor((0,0), "$R_x$");
r.draw(DrawOption(showAnchor = true, showOrigin = true));