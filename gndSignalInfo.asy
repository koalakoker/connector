import connector;
import drawOptions;
import obj;
import gndSignal;

include 'common.asy';
size(2cm);

GndSignal p = GndSignal((0,0), "$Gnd$");
p.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true,
  originAlign     = W));