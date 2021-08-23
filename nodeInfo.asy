import connector;
import drawOptions;
import obj;
import node;

include 'common.asy';

Node n = Node((0,0), "$V_x$", align = NE);
n.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));