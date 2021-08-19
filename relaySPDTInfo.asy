import connector;
import drawOptions;
import obj;
import relaySPDT;

include 'common.asy';

RelaySPDT r = RelaySPDT((0,0), "$R_x$");
r.draw(DrawOption(
  showAnchor      = true,
  showAnchorLabel = true,
  showOrigin      = true));