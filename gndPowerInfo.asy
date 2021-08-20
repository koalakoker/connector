import connector;
import drawOptions;
import obj;
import gndPower;

include 'common.asy';

GndPower p = GndPower((0,0), "$Gnd$");
p.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));