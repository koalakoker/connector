size(4cm);
defaultpen(fontsize(8pt));
import components;
import drawOptions;
import connector;
Resistor r = Resistor("$R_1$");
Capacitor c = Capacitor((1,0), -90,"$C_1$");
Node n = Node((0,-1.1));
n.draw();
r.draw(DrawOption(showOrigin = true));
drawAnchorConnector(n, 2, c, 1);
c.draw();
r.setPos((1,0));
r.setLabel("$R_2$");
r.draw();
c.setPos((2,0));
c.setLabel("$C_2$");
c.draw();
drawAnchorConnector(n, 2, c, 1);