settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(4cm);

import connector;
import drawOptions;
import obj;
import resistor;

Resistor r = Resistor((0,0), "$R_x$");
r.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));