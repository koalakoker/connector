import connector;
import drawOptions;
import obj;
import resistor;

include 'common.asy';

Resistor r = Resistor((0,0), "$R_x$");
r.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));