import connector;
import drawOptions;
import obj;
import mos;

include 'common.asy';

Mos q = Mos((0,0), "$Q_x$");
q.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));