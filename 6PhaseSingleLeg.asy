settings.outformat="pdf";
//settings.outformat="png";
settings.render = 16;
settings.prc = false; 
size(10cm);

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

Relay R1 = Relay(GetAnchorPos(out,1) + (1,-.4), 0, "$R_1$");
R1.draw();
drawAnchorConnector(out,DE-1,R1,2);

Inductor L1 = Inductor(GetAnchorPos(R1,3) + (.3,0), 0,"$Motor_{ph}$");
L1.draw();
drawAnchorConnector(R1, 3, L1, 0);

Node Vr = Node(GetAnchorPos(R1, 0) - (.3, 0),"$V_R$", align = W);
Vr.draw();

Mos Q3 = Mos(GetAnchorPos(R1, 1) + (-.2,-1),"$Q_3$");
Q3.draw();

Node g3 = Node(GetAnchorPos(Q3,0), "$g_{Q3}$", align = W);
g3.draw(smallDot);

GndSignal gndS = GndSignal(GetAnchorPos(Q3, 2) - (0,.3), 0, "");
gndS.draw();
drawAnchorConnector(Q3,2,gndS,0);

drawAnchorConnector(R1, 1, Q3, 1);

Diode D3 = Diode(GetAnchorPos(R1, 1) - (0,.3), 180,"$D_3$");
D3.draw();

drawAnchorConnector(Vr,DE-1,R1,0,0.05);

ConnectParallel(R1, 0, 1, D3, 1, 0, DS);