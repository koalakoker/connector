import connector;
import drawOptions;
import obj;
import inductor;

include 'common.asy';

Inductor l = Inductor((0,0), "$L_x$");
l.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));