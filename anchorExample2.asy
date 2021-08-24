size(3cm);
defaultpen(fontsize(8pt));
import components;
import drawOptions;
Diode d = Diode(orient = 90);
setAnchorDirection(d, 0, DW);
setAnchorDirection(d, 1, DW);
d.draw(DrawOption(showAnchor = true, showAnchorLabel = true));