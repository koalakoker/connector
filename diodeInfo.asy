import connector;
import drawOptions;
import obj;
import diode;

include 'common.asy';

Diode d = Diode((0,0), "$D_x$");
d.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));