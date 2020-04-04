settings.outformat="pdf";
settings.prc = false; 
size(6cm);

import obj;
import resistor;
import connector;

Resistor r1 = Resistor((0,0), "$R_1$");
r1.draw();
Resistor r2 = Resistor((1.5,0), "$R_2$");
r2.draw();
Resistor r3 = Resistor((3,0), "$R_3$");
r3.draw();

drawAncorConnector(r1, 1, r2, 0, arrow = None);
drawAncorConnector(r2, 1, r3, 0, arrow = None);
drawAncorConnector(r3, 1, r1, 0, .1, .1, arrow = None);
