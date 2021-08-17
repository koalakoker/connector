settings.outformat="pdf";
settings.render = 16;
settings.prc = false; 
size(4cm);

import obj;
import connector;
import drawOptions;
import capacitor;

Capacitor c = Capacitor((0,0), "$C_x$");
c.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));