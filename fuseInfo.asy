import connector;
import drawOptions;
import obj;
import fuse;

size(4cm);

Fuse f = Fuse((0,0), "$F_x$");
f.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));