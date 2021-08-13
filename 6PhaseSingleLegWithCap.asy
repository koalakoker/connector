settings.outformat="pdf";
//settings.outformat="png";
settings.render = 16;
settings.prc = false; 
size(9cm);

import obj;
import components;
import connector;

Igbt Q1 = Igbt((0,0), "$Q_1$");
Q1.draw();
Igbt Q2 = Igbt((0,-1.4), "$Q_2$");
Q2.draw();

Node g1 = Node(GetAnchorPos(Q1,0), "$g_{Q1}$", align = W);
g1.draw(smallDot);
Node g2 = Node(GetAnchorPos(Q2,0), "$g_{Q2}$", align = W);
g2.draw(smallDot);

Diode D1 = Diode(GetAnchorPos(Q1,2) + (0.3,0), 90, "$D_1$");
D1.draw();
Diode D2 = Diode(GetAnchorPos(Q2,2) + (0.3,0), 90, "$D_2$");
D2.draw();

ConnectParallel(Q1,2,1,D1,0,1,DE);
ConnectParallel(Q2,2,1,D2,0,1,DE);

Fuse F1 = Fuse(GetAnchorPos(Q1, 1), 90, "$F_1$");
F1.draw();

Node vbus = Node(GetAnchorPos(F1, 1),"$V_{bus}$", align = NE);
vbus.draw();

GndPower gndP = GndPower(GetAnchorPos(Q2, 2) - (0,.5), 0, "");
gndP.draw();
drawAnchorConnector(Q2,2,gndP,0);

Node out = Node(GetAnchorPos(Q1,2) - (0,.2));
out.draw();

drawAnchorConnector(Q1, 2, out, DN-1);
drawAnchorConnector(Q2, 1, out, DS-1);


Inductor L1 = Inductor(GetAnchorPos(out,0) + (.3,0), 0,"$Motor_{ph}$");
L1.draw();


drawAnchorConnector(out, DE-1, L1, 0);

Capacitor cap = Capacitor(GetAnchorPos(out,0) + (2.0,0.5), -90, "$C_{BUS}$" );
cap.draw();

Node capNode1 = Node(GetAnchorPos(vbus, 0) + (0,-0.2));
capNode1.draw();
Node capNode2 = Node(GetAnchorPos(gndP, 0) + (0,0.2));
capNode2.draw();

drawAnchorConnector(capNode1, DE-1, cap, 0);
drawAnchorConnector(capNode2, DE-1, cap, 1);