import connector;
import drawOptions;
import obj;
import relay;

include 'common.asy';

Relay r = Relay((0,0), "$R_x$");
r.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));