import connector;
import drawOptions;
import obj;
import capacitor;

size(4cm);

Capacitor c = Capacitor((0,0), "$C_x$");
c.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));