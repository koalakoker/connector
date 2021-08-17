import connector;
import drawOptions;
import obj;
import resistor;

size(4cm);

Resistor r = Resistor((0,0), "$R_x$");
r.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));