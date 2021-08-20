import connector;
import drawOptions;
import obj;
import igbt;

include 'common.asy';

Igbt q = Igbt((0,0), "$Q_x$");
q.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));