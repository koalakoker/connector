settings.outformat="pdf";
//settings.outformat="png";
settings.render = 16;
settings.prc = false; 
size(5cm);

import obj;
import components;
import connector;

Resistor r1 = Resistor((0,0), "$R_1$");
r1.draw(showAnchor = true);